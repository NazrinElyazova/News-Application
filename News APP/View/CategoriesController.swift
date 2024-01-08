//
//  CategoriesController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class CategoriesController: UIViewController {
    
    var topic = [TopicModel]()
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJsonFile()
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.register(UINib(nibName: "TopicCell", bundle: nil), forCellWithReuseIdentifier: "TopicCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func parseJsonFile() {
        if let file = Bundle.main.url(forResource: "Topic", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let result = try JSONDecoder().decode([TopicModel].self, from: data)
                self.topic = result
                collection.reloadData()
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
extension CategoriesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCell", for: indexPath) as! TopicCell
        let items = topic[indexPath.item]
        cell.topicLabel.text = items.topic ?? ""
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 160, height: 72)
    }
    
    
}
