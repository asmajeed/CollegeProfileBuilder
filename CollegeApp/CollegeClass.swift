//
//  CollegeClass.swift
//  CollegeApp
//
//  Created by Amer M on 2/23/17.
//  Copyright © 2017 Amer M. All rights reserved.
//

import UIKit

class CollegeClass: NSObject

{
    
    var name = " "
    var location = " "
    var enrollment = " "
    var image = UIImage(named: "default")
    
    init(Name:String, Location: String, Enrollment: String, Image: UIImage)
    {
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
    }
    
    init(Name: String, Location:String)
    {
        name = Name
        location = Location
    }
 
    
}

