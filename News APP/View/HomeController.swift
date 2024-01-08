//
//  HomeController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class HomeController: UIViewController {
    
    let parser = Parser()
    let manager = SaveFileManager()
    
    var bookmark = [News]()
    var save = [News]()
    var star = [News]()
    
    var about = [About]()
    var onUpdate: (([News]) -> Void)?
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
        parser.getJsonFile { items in
            self.save = items
            self.collection.reloadData()
            
        }
        
        manager.readJsonFile { bookmarkItems in
            self.star = bookmarkItems
            collection.reloadData()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        save.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let part = save[indexPath.item]
        cell.homeImage.image = UIImage(named: part.image ?? "")
        cell.homeLabel.text = part.title ?? ""
        cell.delegate = self
        cell.tag = indexPath.item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 300, height: 250 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "InfoController") as! InfoController
        
        controller.item = save[indexPath.item]
        
        controller.onUpdate = { updatedBookmark in
            self.bookmark = updatedBookmark
            self.onUpdate?(self.bookmark)
            
        }
        navigationController?.show(controller, sender: nil)
    }
}
extension HomeController: BookmarkDelegate {
    func addButtonAction(index: Int) {
        showAlert()
        self.bookmark.append(save[index])
        star.append(contentsOf: self.bookmark)
        manager.writeJsonData(items: star)
        onUpdate?(star)
    }
}
extension HomeController {
    func showAlert() {
        let alertController = UIAlertController(title: "Topic added to your bookmarks", message: "", preferredStyle: .alert)
        let returnButton = UIAlertAction(title: "Look at bookmark", style: .default) { _ in
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "BookmarkController") as! BookmarkController
            controller.info = self.star
            self.navigationController?.show(controller, sender: nil)
        }
        let okayButton = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(returnButton)
        alertController.addAction(okayButton)
        self.present(alertController, animated: true)
    }
}
extension HomeController {
    func bookmarkPage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "BookmarkController") as! BookmarkController
        navigationController?.show(controller, sender: nil)
        controller.info = bookmark
    }
}
