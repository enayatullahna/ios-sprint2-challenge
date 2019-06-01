//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Enayatullah Naseri on 5/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        guard let countItems = shoppingItemController?.countItemsAdded() else { return }

        var text = ""
        switch countItems {
        case 0:
            text = "You currently have \(countItems) items in your shopping list"
        case 1:
            text = "You currently have \(countItems) item in your shopping list"
        case 2...10:
            text = "You currently have \(countItems) items in your shopping list"
        default:
            text = "Please Doubel check your shopping cart, something is missing"
        }
        titleLabel.text = text
    }
    

    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text else {return}
        
        alert(user: name, userAdress: address)
        
    }
    
    
    func alert(user: String, userAdress: String){
        let alert = UIAlertController(title: "Hey Your!", message: "\(user) your order will be delivered in 15min to \(userAdress) address", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: { (_)
            in
            self.navigationController?.popToRootViewController(animated: true)}))
        
        present(alert, animated: true, completion: nil)
    }
    
}
