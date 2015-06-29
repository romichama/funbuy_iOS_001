//
//  Producto.swift
//  funbuy
//
//  Created by romichama on 5/25/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit
import CoreData
@objc (Model)

class Producto: NSManagedObject {
   
    @NSManaged var nombreListaProducto: String
    @NSManaged var caracteristicasListaProducto: String
    @NSManaged var categoriaListaProducto: String
    @NSManaged var calidadListaProducto: String
    @NSManaged var habitoListaProducto: String
    @NSManaged var precioListaProducto: String
    @NSManaged var longitud: Int64
    @NSManaged var latidud: Int64
    
    
    
}
