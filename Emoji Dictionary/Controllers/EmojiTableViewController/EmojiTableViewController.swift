//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 15/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis = [Emoji]()
    
    var insertMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = Emoji.load()
        startUI()
    }
    
    func startUI() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
}
