//
//  EmojiDetailTableViewController.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 19/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiDetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    var emoji: Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateButtonVisibility() {
        saveButton.isEnabled = !symbolTextField.textValue.isEmpty
            && !nameTextField.textValue.isEmpty
            && !descriptionTextField.textValue.isEmpty
            && !usageTextField.textValue.isEmpty
    }
    
    func updateUI() {
        updateButtonVisibility()
        
        guard let emoji = emoji else { return }
        
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        
        updateButtonVisibility()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        emoji = Emoji(
            symbol: symbolTextField.textValue,
            name: nameTextField.textValue,
            description: descriptionTextField.textValue,
            usage: usageTextField.textValue
        )
    }
    
    @IBAction func textFieldChanged() {
        updateButtonVisibility()
    }
    
    
}
