//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    
    private(set) var shoppingItem: [ShoppingItem] = []
    
    
    func createShoppingItem() {
        
        // copy, pasted list of items from challenge
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemNames{ // use names in the array
            let item = ShoppingItem(name: item)
            shoppingItem.append(item)
        }
    }
    
    // persistentFileURL - create plist file
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirect = fileManager.urls(for: .documentDirectory, in: .userDomainMask) .first else {return nil}
        
        return documentsDirect.appendingPathComponent("ShoppingItem.plist")
    }
    
    // Count items added to the shopping cart, which is an int
    func countItemsAdded() -> Int {
        var totalAdded = 0
        for items in shoppingItem {
            if items.hasBeenAdded {
                totalAdded += 1 // add 1 to the count
            }
        }
        return totalAdded
    }
    
    // save data
    func saveToPersistenceStore() {

    }
    
    
    // load data
    func loadFromPersistenceStore() {
        
    }
    
    
    // Check if an item was already called.
    func doubleCheck() {
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: .wasCalledAlready) == false {
            createShoppingItem()
        }else {
            loadFromPersistenceStore()
        }
    }
    
}
