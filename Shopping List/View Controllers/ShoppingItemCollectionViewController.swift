//
//  ShoppingItemCollectionViewController.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingItemCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    

 

    // MARK: UICollectionViewDataSource

    // Count cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItem.count // count cell per item in shopping item
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let item = self.shoppingItemController.shoppingItem[indexPath.row]
        cell.shoppingItem = item
        cell.delegate = self
    
        return cell
    }

    
    
    
    
    // MARK: - Navigation
    
    // Prepare for segue.
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toAddressVC" {
            guard let destinationVC = segue.destination as? OrderViewController else { return }
            
            destinationVC.shoppingItemController = shoppingItemController
        }
        
        
    }

    

}


//extension ShoppingItemCollectionViewController: ShoppingItemViewCellDelegate {
//    func addWasTapped(on cell: UICollectionViewCell) {
//        guard let index = collectionView.indexPath(for: cell) else { return }
//        let item = shoppingItemController.shoppingItem[index.item]
//        shoppingItemController.updateItemList(item: item)
//
//        collectionView?.reloadItems(at: [index])
//
//    }
//
//
//
//}


extension ShoppingItemCollectionViewController: ShoppingItemViewCellDelegate {
    func addWasTapped(on cell: UICollectionViewCell) {
        
        guard let index = collectionView?.indexPath(for: cell) else { return }
        
        let item = shoppingItemController.shoppingItem[index.item]
        
        shoppingItemController.updateItemList(items: item)
        
        collectionView?.reloadItems(at: [index])
    }
}
