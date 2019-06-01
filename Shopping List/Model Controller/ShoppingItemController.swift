//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
    
    init() {
        loadFromPersistenceStore()
        doubleCheck()
        
    }
    
    
    
    private(set) var shoppingItem: [ShoppingItem] = []
    
    
    func createShoppingItem() {
        
        // copy, pasted list of items from challenge
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for item in itemNames{ // use names in the array
            let item = ShoppingItem(name: item)
            shoppingItem.append(item)
        }
    }
    
    // update item
    func updateItemList(items: ShoppingItem) {
        
        // guard let index = shoppingItem.index(of: shoppingItem) else {return}
        
        guard let index = shoppingItem.index(of: items) else { return }
            shoppingItem[index].hasBeenAdded = !shoppingItem[index].hasBeenAdded
        saveToPersistenceStore()
      
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
    
    // save data plist file
    func saveToPersistenceStore() {
        
        guard let url = self.persistentFileURL else {return}
        
        do{
            
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItem)
            try data.write(to: url)
            
        }catch {
            NSLog("Error saving your iteams \(error)")
        }

    }
    
    
    // load data from plist
    func loadFromPersistenceStore() {
        let fileManager = FileManager.default
        
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.shoppingItem = try decoder.decode([ShoppingItem].self, from: data)
            
        }catch {
            NSLog("Error loading your iteams \(error)")
        }
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
