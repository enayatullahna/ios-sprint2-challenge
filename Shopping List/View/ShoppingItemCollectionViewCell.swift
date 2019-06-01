//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemViewCellDelegate: AnyObject {
    func addWasTapped(on cell: UICollectionViewCell) // protocol when add to cart was tapped
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShoppingItemViewCellDelegate?
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    
    

    func updateViews() {
        
        guard let item = shoppingItem else { return }
        
        
        imageView.image = UIImage(named: item.name)
        
        let text = item.hasBeenAdded ? "Added" : "Not Added"
        addedLabel.text = text
    }
    
    
    //NEED ACTION BUTTON to Switch between two label text, added button temp
    @IBAction func addButtonTapped(_ sender: Any) {
        
        delegate?.addWasTapped(on: self)
        
    }
    
}
