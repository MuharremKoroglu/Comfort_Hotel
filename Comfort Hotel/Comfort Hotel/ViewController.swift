//
//  ViewController.swift
//  Comfort Hotel
//
//  Created by Muharrem Köroğlu on 4.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func guestListButton(_ sender: Any) {
        performSegue(withIdentifier: "toGuestListVC", sender: nil)
        
    }

    @IBAction func addNewGuestButton(_ sender: Any) {
        performSegue(withIdentifier: "toAddGuestListVC", sender: nil)
        
    }
    
}

