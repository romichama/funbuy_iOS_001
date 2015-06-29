//
//  RegistrationForm.swift
//  funbuy
//
//  Created by romichama on 5/26/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit

class RegistrationForm: NSObject, FXForm {
    
    var email: String?
    var password: String?
    var repeatPassword: String?
    
    var name: String?
    var gender = 0
    var age: UInt = 0
    var dateOfBirth: NSDate?
    var profilePhoto: UIImage?
    var phone: String?
    var country: String?
    var language: String?
    var interests: NSArray? //NOTE: [String] or [AnyObject] won't work
    var otherInterests = 0
    var about: String?
    
    var plan: Int = 0
    
    var notifications: String?
    
    var agreedToTerms = false
    
    var nproduct: String?
    var cproduct: String?
    var caproduct: String?
    var calproduct: String?
    var hproduct: String?
    var pproduct: String?
    
    //because we want to rearrange how this form
    //is displayed, we've implemented the fields array
    //which lets us dictate exactly which fields appear
    //and in what order they appear
    
    func fields() -> NSArray {
        
        return [
            
            
            [FXFormFieldKey: "name", FXFormFieldHeader: "Details",
                "textField.autocapitalizationType": UITextAutocapitalizationType.Words.rawValue],
          
            "nproduct",
            "cproduct",
            
            
            //we want to use a stepper control for this value, so let's specify that
            
            
            //the country value in our form is a locale code, which isn't human readable
            //so we've used the FXFormFieldValueTransformer option to supply a value transformer
            [FXFormFieldKey: "caproduct",
                FXFormFieldOptions: ["Ropa", "Electrodomestico", "Medicina", "Gadget"],
                FXFormFieldPlaceholder: "None",
                FXFormFieldCell: FXFormOptionPickerCell.self],
            
              
            [FXFormFieldKey: "calproduct",
                FXFormFieldOptions: ["Buena", "Barata", "Medio Uso", "Refaccionada"],
                FXFormFieldPlaceholder: "None",
                FXFormFieldCell: FXFormOptionPickerCell.self],
            
            
            [FXFormFieldKey: "hproduct",
                FXFormFieldOptions: ["todos los dias", "fin de semana", "dias de feria", "cada 15 mes"],
                FXFormFieldPlaceholder: "None",
                FXFormFieldCell: FXFormOptionPickerCell.self],
            
            
            
            //this is a multi-select options field - FXForms knows this because the
            //class of the field property is a collection (in this case, NSArray)
            
             
            
            [FXFormFieldKey: "pproduct", FXFormFieldType: FXFormFieldTypeLongText],
            
            [FXFormFieldKey: "agreedToTerms", FXFormFieldTitle: "I Agree To These Terms", FXFormFieldType: FXFormFieldTypeOption],
            
           
            
            [FXFormFieldTitle: "Submit", FXFormFieldHeader: "", FXFormFieldAction: "submitRegistrationForm:"],
        ]
    }
}
