//
//  AddGuestsViewController.swift
//  Comfort Hotel
//
//  Created by Muharrem Köroğlu on 4.10.2022.
//

import UIKit
import CoreData

class AddGuestsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var guestNameTextField: UITextField!
    @IBOutlet weak var guestIdentityTextField: UITextField!
    @IBOutlet weak var guestRoomTextField: UITextField!
    @IBOutlet weak var guestEntryDateTextField: UITextField!
    @IBOutlet weak var guestExitDateTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedGuestName = ""
    var selectedGuestRoom : Int?
    var selectedGuestId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedGuestName != "" {
            
            saveButton.isHidden = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Guests")
            fetchRequest.returnsObjectsAsFaults = false
            
            //Data Filtering
            let idString = selectedGuestId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            //
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String{
                            guestNameTextField.text = name
                        }
                        if let room = result.value(forKey: "room") as? Int{
                            guestRoomTextField.text = String(room)
                        }
                        if let entryDate = result.value(forKey: "entryDate") as? String {
                            guestEntryDateTextField.text = entryDate
                        }
                        if let exitDate = result.value(forKey: "exitDate") as? String {
                            guestExitDateTextField.text = exitDate
                        }
                        if let image = result.value(forKey: "image") as? Data {
                            imageView.image = UIImage(data: image)
                        }
                        if let identity = result.value(forKey: "identity") as? Int {
                            guestIdentityTextField.text = String(identity)
                        }
                    }
                }
            }catch{
                print("Error")
            }
            
        }else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagePicker))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    //Image Picking Process
    @objc func imagePicker () {
        let pickedImage = UIImagePickerController()
        pickedImage.delegate = self
        pickedImage.sourceType = .photoLibrary
        pickedImage.allowsEditing = true
        present(pickedImage, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true)
    }
    //

    
    
    @IBAction func saveButton(_ sender: Any) {
        
        //Start Core Date Save Process
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newGuest = NSEntityDescription.insertNewObject(forEntityName: "Guests", into: context)
        //
        
        //Save user information to entity attributes
        newGuest.setValue(guestNameTextField.text!, forKey: "name")
        newGuest.setValue(guestEntryDateTextField.text!, forKey: "entryDate")
        newGuest.setValue(guestExitDateTextField.text!, forKey: "exitDate")
        newGuest.setValue(UUID(), forKey: "id")
        if let identity = Int(guestIdentityTextField.text!) {
            newGuest.setValue(identity, forKey: "identity")
        }
        if let room = Int(guestRoomTextField.text!) {
            newGuest.setValue(room, forKey: "room")
        }
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newGuest.setValue(data, forKey: "image")
        //
        
        //Save Process
        do{
            try context.save()
            let alert = UIAlertController(title: "Successful", message: "Guest successfully saved. Now you can check our guest list.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default) { UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okButton)
            present(alert, animated: true)
        }catch{
            print("Error!")
        }
        //
        //Broadcast Notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        
    }

}
