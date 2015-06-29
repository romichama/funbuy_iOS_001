//
//  DetalleProducto.swift
//  funbuy
//
//  Created by romichama on 5/25/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetalleProducto: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var currentObject : PFObject?
    
    
    @IBOutlet weak var nListaCompra: UITextField!
    @IBOutlet weak var dListaCompra: UITextField!
    @IBOutlet weak var hListaCompra: UITextField!
    @IBOutlet weak var ingListaCompra: PFImageView!
    
    @IBOutlet weak var uploadPreviewImage: UIImageView!
    @IBOutlet weak var uploadImagenText: UIButton!
    
    
    // list the product
    
    
    // The save button
    @IBAction func saveButton(sender: AnyObject) {
        
        if let updateObject = currentObject as PFObject? {
            
            // Update the existing parse object
            updateObject["nombreListaCompra"] = nListaCompra.text
            updateObject["descripcionListaCompra"] = dListaCompra.text
            
            updateObject["habitoListaCompra"] = hListaCompra.text
            updateObject["habilita"] = true
            
            // Save the data back to the server in a background task
            
            if uploadPreviewImage.image == nil {
                //image is not included alert user
                println("RE Image not uploaded")
            }else{
                
                var imageData = UIImagePNGRepresentation(self.uploadPreviewImage.image)
                var parseImageFile = PFFile(name: nListaCompra.text, data: imageData)
                updateObject["imgListaCompra"] = parseImageFile
                updateObject.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        //take user home
                        println("data uploaded")
                        self.performSegueWithIdentifier("goHomeFromUpload", sender: self)
                        
                    }else {
                        
                        println(error)
                    }
                    
                    
                })
                
                println("Re imagen upload")
            }
            
            updateObject.saveEventually()
        } else {
            
            // Create a new parse object
            var updateObject = PFObject(className:"ListaCompra")
            
            updateObject["nombreListaCompra"] = nListaCompra.text
            updateObject["descripcionListaCompra"] = dListaCompra.text
            updateObject["habitoListaCompra"] = hListaCompra.text
            updateObject["habilita"] = true
            
            
            
            if uploadPreviewImage.image == nil {
                //image is not included alert user
                println("Image not uploaded")
            }else{
                var imageData = UIImagePNGRepresentation(self.uploadPreviewImage.image)
                var parseImageFile = PFFile(name: nListaCompra.text, data: imageData)
                updateObject["imgListaCompra"] = parseImageFile
                updateObject.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        //take user home
                        println("data uploaded")
                        self.performSegueWithIdentifier("goHomeFromUpload", sender: self)
                        
                    }else {
                        
                        println(error)
                    }
                    
                    
                })
                
                
            }
            
            
            //  updateObject.ACL = PFACL(user: PFUser.currentUser()!)
            
            // Save the data back to the server in a background task
            updateObject.saveEventually()
        }
        
        // Return to table view
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func uploadIMageFromSource(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        uploadPreviewImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
        uploadImagenText.titleLabel?.text = "Change"
    }
    
    
    
    @IBAction func eliminarLista(sender: AnyObject) {
        
        
        
        if let updateObject = currentObject as PFObject? {
            println("elimina 01")
            updateObject["habilita"] = false
            updateObject.saveEventually()
            
        }
        else{
            println("elimina 02")
            var updateObject = PFObject(className:"ListaCompra")
            
            updateObject["habilita"] = false
            updateObject.saveEventually()
        }
        
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func vLista(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            
            
            //        var dListaCompra = hello
            //       self.performSegueWithIdentifier("verListaDetalle", sender: self)
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Unwrap the current object object
        if let object = currentObject {
            nListaCompra.text = object["nombreListaCompra"] as String
            dListaCompra.text = object["descripcionListaCompra"] as String
            hListaCompra.text = object["habitoListaCompra"] as String
            
            var initialThumbnail = UIImage(named: "question")
            ingListaCompra.image = initialThumbnail
            if let thumbnail = object["imgListaCompra"] as? PFFile {
                ingListaCompra.file = thumbnail
                ingListaCompra.loadInBackground()
            }
        }
    }
    
    

}
