//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemViewCellDelegate: AnyObject {
    func addWasTapped(on Cell: UICollectionViewCell) // protocol when add to cart was tapped
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    //NEED ACTION BUTTON to Switch between two label text
    
    
    
    func updateViews() {
        
    }
    
    
}
