//
//  Person.swift
//  SixWeekChallenge
//
//  Created by Adam Aldous on 3/11/16.
//  Copyright © 2016 Adam Aldous. All rights reserved.
//

import Foundation

class Person: Equatable {
    
    private let kName = "name"
    
    var name: String
    
    init(name: String) {
        
        self.name = name
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let name = dictionary[kName] as? String else {
                
                // sets values for stored properties due to requirement as of Swift 2.0
                self.name = ""
                return nil
        }
        
        self.name = name
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [kName : self.name]
        
        return dictionary
    }
    
}

func == (lhs: Person, rhs: Person) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}