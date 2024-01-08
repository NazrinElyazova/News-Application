//
//  OnboardingController.swift
//  News APP
//
//  Created by Nazrin on 03.11.23.
//

import UIKit
import RealmSwift


class OnboardRealm: Object {
    @Persisted var image: String = ""
}

class OnboardingController: UIViewController {
    
    let realm = try! Realm()
    var items = [OnboardRealm]()
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstToKnow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        nextButton.layer.cornerRadius = 30
        fetchItems()
        
        if let url = realm.configuration.fileURL {
            print(url)
        }
        collection.register(UINib(nibName: "OnboardCell", bundle: nil), forCellWithReuseIdentifier: "OnboardCell")
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "WelcomeScreenController") as! WelcomeScreenController
        navigationController?.show(controller, sender: nil)
    }
    func fetchItems() {
        let data = realm.objects(OnboardRealm.self)
        items.append(contentsOf: data)
        print(items)
        collection.reloadData()
    }
}

extension OnboardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardCell", for: indexPath) as! OnboardCell
        let part = items[indexPath.row]
        cell.onboardImage.image = UIImage(named: part.image)
        return cell
    }
}
