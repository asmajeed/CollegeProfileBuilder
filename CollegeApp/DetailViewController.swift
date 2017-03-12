//
//  DetailViewController.swift
//  CollegeApp
//
//  Created by Amer M on 2/23/17.
//  Copyright © 2017 Amer M. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    
{

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    
    
     var collegeDetail: CollegeClass!
    
    let imagePicker = UIImagePickerController()
    
    var urlString = URL(string: "http://www.uic.edu/")!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        myImageView.image = collegeDetail.image
        nameTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        enrollmentTextField.text = collegeDetail.enrollment
        
        imagePicker.delegate = self
        
    }

  
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.name = nameTextField.text!
        
        collegeDetail.location = locationTextField.text!
        
        collegeDetail.enrollment = enrollmentTextField.text!
        
    }
    
    
    @IBAction func libraryButtonTapped(_ sender: Any)
    {
        getPhotoLibrary()
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }
    
    @IBAction func openInSafariWithBackButton(_ sender: Any)
    {
        UIApplication.shared.openURL(urlString)
    }
    

  

}
