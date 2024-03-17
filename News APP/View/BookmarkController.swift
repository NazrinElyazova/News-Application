//
//  BookmarkController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class BookmarkController: UIViewController {
    
    let manager = SaveFileManager()
    var info = [News]()
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if info.isEmpty {
            let controller = storyboard?.instantiateViewController(withIdentifier: "EmptyBookmarkController") as! EmptyBookmarkController
            navigationController?.show(controller, sender: nil)
        }
        
        callback()
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.register(UINib(nibName: "BookmarkCell", bundle: nil), forCellWithReuseIdentifier: "BookmarkCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension BookmarkController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(info.count)
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookmarkCell", for: indexPath) as! BookmarkCell
        cell.bookmarkLabel.text = "\(info[indexPath.item].title ?? "")"
        cell.bookmarkImage.image = UIImage(named: info[indexPath.item].image ?? "")
        return cell
    }
    
    func callback() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        controller.onUpdate = { item in
            self.info = item
            self.collection.reloadData()
        }
    }
}
