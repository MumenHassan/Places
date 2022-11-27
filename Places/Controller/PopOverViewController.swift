//
//  PopOverViewController.swift
//  Places
//
//  Created by MacBook on 4/4/22.
//

import UIKit
import RealmSwift
class PopOverViewController: UIViewController {
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var locationName: UITextField!
    
    @IBOutlet weak var detailsView: UITextView!
    @IBAction func savePressesd(_ sender: UIButton) {
        let landMark = LandMark()
    
        landMark.name = locationName.text!
        landMark.details = detailsView.text!
        landMark.lat = Locations.shared.userLat
        landMark.lon = Locations.shared.userLon
        
        try! realm.write {
            realm.add(landMark)
        }
        //Locations.shared.LandMarks.append(landMark)
        dismiss(animated: true, completion: nil)
    }
}
