//
//  ISO3166CountryValueTransformer.swift
//  funbuy
//
//  Created by romichama on 5/26/15.
//  Copyright (c) 2015 romichama. All rights reserved.
//

import UIKit

class ISO3166CountryValueTransformer: NSValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        
        return false
    }
    
    override func transformedValue(value: AnyObject?) -> AnyObject? {
        
        if value != nil {
            return NSLocale(localeIdentifier: "en_US").displayNameForKey(NSLocaleCountryCode, value:value!) ?? value
        }
        return nil
    }
}
