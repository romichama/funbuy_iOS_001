//
//  addProduct.swift
//  funbuy
//
//  Created by romichama on 5/25/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation


class addProduct: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var nListaProducto: UITextField!
    @IBOutlet weak var cListaProducto: UITextField!
    @IBOutlet weak var caListaProducto: UITextField!
    @IBOutlet weak var calListaProducto: UITextField!
    @IBOutlet weak var hListaProducto: UITextField!
    @IBOutlet weak var pListaProducto: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    var currentItem: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        println(currentItem)
        if(currentItem != nil){
       
            println("helllloooooooooooooooooooooo")
            
            calListaProducto.text = currentItem.valueForKey("calidadListaProducto") as String
            cListaProducto.text = currentItem.valueForKey("caracteristicasListaProducto") as String
            caListaProducto.text = currentItem.valueForKey("categoriaListaProducto") as String
            hListaProducto.text = currentItem.valueForKey("habitoListaProducto") as String
            
            
            println("configurando algo")
            
            var centre = mapView.centerCoordinate as CLLocationCoordinate2D
            
            var getLat: CLLocationDegrees = centre.latitude
            var getLon: CLLocationDegrees = centre.longitude
            
            println(getLat)
            println(centre.latitude)
            
            var getMovedMapCenter: CLLocation =  CLLocation(latitude: getLat, longitude: getLon)
            
            
            println(getMovedMapCenter)
            println("locacion actual")
            
            
            
            let location = CLLocationCoordinate2D(
                latitude: 21.283921,
                longitude: -157.831661
            )
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            
            
           mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.setCoordinate(location)
            annotation.title = "Big Ben"
            annotation.subtitle = "London"
            
            mapView.addAnnotation(annotation)

            println("hellllooooooo3333333333333")
            
            nListaProducto.text = currentItem.valueForKey("nombreListaProducto") as String
            pListaProducto.text = currentItem.valueForKey("precioListaProducto") as String
           
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func buttonSave(sender: AnyObject){
        // Reference to our app delegate
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt:NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Producto", inManagedObjectContext: contxt)
        if (currentItem != nil){
            currentItem.setValue(nListaProducto.text, forKey: "nombreListaProducto");
            currentItem.setValue(cListaProducto.text, forKey: "caracteristicasListaProducto");
            currentItem.setValue(caListaProducto.text, forKey: "categoriaListaProducto");
            currentItem.setValue(calListaProducto.text, forKey: "calidadListaProducto");
            currentItem.setValue(hListaProducto.text, forKey: "habitoListaProducto");
            currentItem.setValue(pListaProducto.text, forKey: "precioListaProducto");
           
            println("Saveeeeeeeeeeeeeeeeeeeee   00000000")
            
            
            
        } else {
            
            
            var newItem = Producto(entity:en!, insertIntoManagedObjectContext:contxt)
            newItem.nombreListaProducto = nListaProducto.text
            newItem.caracteristicasListaProducto = cListaProducto.text
            newItem.categoriaListaProducto = caListaProducto.text
            newItem.calidadListaProducto = calListaProducto.text
            newItem.habitoListaProducto = hListaProducto.text
            newItem.precioListaProducto = pListaProducto.text
            
            println(newItem)
            println("Saveeeeeeeeeeeeeeeeeeeee   1111111")
           
            
        }
        
        contxt.save(nil)
       // self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationController?.popViewControllerAnimated(true)
        
        
        
        
    }
    
}
