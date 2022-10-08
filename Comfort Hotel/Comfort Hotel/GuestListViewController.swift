//
//  GuestListViewController.swift
//  Comfort Hotel
//
//  Created by Muharrem Köroğlu on 4.10.2022.
//

import UIKit
import CoreData

class GuestListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String] ()
    var roomArray = [Int] ()
    var guestId  = [UUID] ()
    
    var selectedGuestName = ""
    var selectedGuestRoom : Int?
    var selectedGuestId : UUID?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchData()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guestId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = nameArray[indexPath.row]
        content.secondaryText = "Room: \(roomArray[indexPath.row])"
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGuestName = nameArray[indexPath.row]
        selectedGuestRoom = roomArray[indexPath.row]
        selectedGuestId = guestId[indexPath.row]
        performSegue(withIdentifier: "toAddFromGuestVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddFromGuestVC" {
            let destination = segue.destination as! AddGuestsViewController
            destination.selectedGuestName = selectedGuestName
            destination.selectedGuestRoom = selectedGuestRoom
            destination.selectedGuestId = selectedGuestId
            
        }
    }
    
    @objc func fetchData () {
        nameArray.removeAll()
        roomArray.removeAll()
        guestId.removeAll()
        
        //Start fetch information from CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Guests")
        fetchRequest.returnsObjectsAsFaults = false
        //
        
        //Fetch daata
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "name") as? String {
                    self.nameArray.append(name)
                }
                if let room = result.value(forKey: "room") as? Int {
                    self.roomArray.append(room)
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.guestId.append(id)
                }
                
                self.tableView.reloadData()
            }
        }catch{
            print("Error!")
        }
        //
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Guests")
        fetchRequest.returnsObjectsAsFaults = false
        let idString = guestId[indexPath.row].uuidString
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? UUID {
                        if id == guestId[indexPath.row] {
                            context.delete(result)
                            nameArray.remove(at: indexPath.row)
                            roomArray.remove(at: indexPath.row)
                            guestId.remove(at: indexPath.row)
                            self.tableView.reloadData()
                            do{
                                try context.save()
                            }catch {
                                print("Error")
                            }
                        }
                    }
                    break
                }
            }
        }catch{
            print("Error")
        }
        
    }

}
