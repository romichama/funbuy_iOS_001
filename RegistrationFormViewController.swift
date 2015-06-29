//
//  RegistrationFormViewController.swift
//  funbuy
//
//  Created by romichama on 5/27/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit
import CoreData


class RegistrationFormViewController: FXFormViewController {
    
    var currentItem: NSManagedObject!
    
    
    override func awakeFromNib() {
        
        formController.form = RegistrationForm()
    }
    
    func submitRegistrationForm(cell: FXFormFieldCellProtocol) {
        
        //we can lookup the form from the cell if we want, like this:
        let form = cell.field.form as RegistrationForm
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Producto", inManagedObjectContext: contxt)
       
        
        //we can then perform validation, etc
        if form.agreedToTerms {
            println(form.nproduct)
            println(form.cproduct)
            println(form.caproduct)
            println(form.calproduct)
            println(form.hproduct)
            println(form.pproduct)

    /*
            var newItem = Producto(entity:en!, insertIntoManagedObjectContext:contxt)
           newItem.nombreListaProducto = form.nproduct
            newItem.caracteristicasListaProducto = form.cproduct
            newItem.categoriaListaProducto = form.caproduct
            newItem.calidadListaProducto = form.calproduct
            newItem.habitoListaProducto = form.hproduct
            newItem.precioListaProducto = form.pproduct
      */

            currentItem.setValue(form.nproduct, forKey: "nombreListaProducto");
            currentItem.setValue(form.cproduct, forKey: "caracteristicasListaProducto");
            currentItem.setValue(form.caproduct, forKey: "categoriaListaProducto");
           currentItem.setValue(form.calproduct, forKey: "calidadListaProducto");
            currentItem.setValue(form.hproduct, forKey: "habitoListaProducto");
            currentItem.setValue(form.pproduct, forKey: "precioListaProducto");

            println("Saveeeeeeeeeeeeeeeeeeeee   New Formulario")
            
            
            UIAlertView(title: "Registration Form Submitted", message: "", delegate: nil, cancelButtonTitle: "OK").show()
            
        } else {
            
            UIAlertView(title: "User Error", message: "Please agree to the terms and conditions before proceeding", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "Yes Sir!").show()
        }
        
        contxt.save(nil)
        // self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
