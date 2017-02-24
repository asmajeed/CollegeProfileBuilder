//
//  ViewController.swift
//  CollegeApp
//
//  Created by Amer M on 2/8/17.
//  Copyright © 2017 Amer M. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "University of Illinois at Chicago", Location: "Chicago", Enrollment: "29,048", Image: UIImage(named: "UIC")!))
        myCollegeObject.append(CollegeClass(Name: "DePaul University", Location: "Chicago", Enrollment: "23,539", Image: UIImage(named: "DePaul")!))
        myCollegeObject.append(CollegeClass(Name: "University of California San Diego", Location: "California", Enrollment: "35,821", Image: UIImage(named: "UCSD")!))
    }

    
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "Add College Here"
            
            alert.addTextField { (locationTextField) in
                locationTextField.placeholder = "Add Location Here"
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { (action) in
            let collegeTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            
            self.myCollegeObject.append(CollegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!))
            self.myTableView.reloadData()
        })
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell" , for: indexPath)
        cell.textLabel?.text = myCollegeObject [indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject [indexPath.row].location
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    

    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
    
    
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.collegeDetail = myCollegeObject[selectedRow!]
        
    }
    
}



