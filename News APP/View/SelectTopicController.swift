//
//  SelectTopicController.swift
//  News APP
//
//  Created by Nazrin on 04.11.23.
//

import UIKit

class SelectTopicController: UIViewController {
    
    var topic = [TopicModel]()
    var mode: Mode = .view {
        didSet {
            switch mode {
            case .view:
                selectBarButton.title = "Select"
                navigationItem.rightBarButtonItem = nil
                collection.allowsMultipleSelection = true
            }
        }
    }
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBarButtonItems()
        
        nextButton.layer.cornerRadius = 30
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UINib(nibName: "TopicCell", bundle: nil), forCellWithReuseIdentifier: "TopicCell")
        
        parseJsonFile()
    }
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(didSelectItemClick(_:)))
        return  barButtonItem
    }()
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        navigationController?.show(controller, sender: nil)
    }
    
    private func setupBarButtonItems() {
        navigationItem.rightBarButtonItem = selectBarButton
    }
    
    @objc func didSelectItemClick(_ sender: UIBarButtonItem) {
        mode = .view
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
extension SelectTopicController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topic.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCell", for: indexPath) as! TopicCell
        let part = topic[indexPath.item]
        cell.topicLabel.text = part.topic ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 72)
    }
}
