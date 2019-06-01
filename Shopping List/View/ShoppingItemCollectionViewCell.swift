//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    
    
    
    func updateViews() {
        
    }
    
    
}
