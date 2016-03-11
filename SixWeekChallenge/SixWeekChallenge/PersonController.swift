//
//  PersonController.swift
//  SixWeekChallenge
//
//  Created by Adam Aldous on 3/11/16.
//  Copyright © 2016 Adam Aldous. All rights reserved.
//

import Foundation

class PersonController {
    
    private let kPeople = "people"
    
    static let sharedController = PersonController()
    
    var people: [Person]
    
    init() {
        
        self.people = []
        
        self.loadFromPersistentStorage()
    }
    
    func addPerson(person: Person) {
        
        people.append(person)
        
        self.saveToPersistentStorage()
    }
    
    func removePerson(person: Person) {
        
        if let personIndex = people.indexOf(person) {
            people.removeAtIndex(personIndex)
            self.saveToPersistentStorage()
        }
    }
    
    func loadFromPersistentStorage() {
        
        let personDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPeople) as? [Dictionary<String, AnyObject>]
        
        if let personDictionaries = personDictionariesFromDefaults {
            
            self.people = personDictionaries.map({Person(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        
        let personDictionaries = self.people.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(personDictionaries, forKey: kPeople)
    }
    
}


extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}




