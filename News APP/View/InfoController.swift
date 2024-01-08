//
//  InfoController.swift
//  News APP
//
//  Created by Nazrin on 17.11.23.
//

import UIKit

class InfoController: UIViewController {
  
    var item: News?
    var new = [News]()
    var onUpdate: (([News]) -> Void)?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var infoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       textView.text = item?.about.newsLabel ?? ""
        infoImage.image = UIImage(named: item?.about.newsImage ?? "")
        
        parseJsonFile()
    }
    
    func parseJsonFile() {
        if let file = Bundle.main.url(forResource: "Article", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let result = try JSONDecoder().decode([News].self, from: data)
                self.new = result
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
