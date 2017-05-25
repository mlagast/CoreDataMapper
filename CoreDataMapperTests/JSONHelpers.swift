//
//  JSONHelpers.swift
//  CoreDataMapper
//
//  Created by  Matthieu Lagast on 25/05/2017.
//  Copyright © 2017 mlagast. All rights reserved.
//

import Foundation

func loadJSON(fromFile filename:String, fileExtension:String, bundle:Bundle) -> Any? {
    if let resourceURL = bundle.url(forResource: filename, withExtension: fileExtension) {
        do {
            let data = try Data(contentsOf: resourceURL)
            let jsonObject:Any! = try JSONSerialization.jsonObject(with: data, options:.allowFragments)
            
            return jsonObject
        } catch {
            return nil
        }
    }
    
    return nil
}
