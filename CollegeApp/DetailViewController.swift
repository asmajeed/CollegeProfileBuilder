//
//  DetailViewController.swift
//  CollegeApp
//
//  Created by Amer M on 2/23/17.
//  Copyright © 2017 Amer M. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var enrollmentTextField: UITextField!
    
     var collegeDetail: CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        myImageView.image = collegeDetail.image
        nameTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        enrollmentTextField.text = collegeDetail.enrollment
        
    }

  
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.name = nameTextField.text!
        
        collegeDetail.location = locationTextField.text!
        
        collegeDetail.enrollment = enrollmentTextField.text!
        
    }
    

  

}
