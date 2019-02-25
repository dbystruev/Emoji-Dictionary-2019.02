//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 15/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

//    var emojis = [Emoji]() {
//        didSet {
//            EmojiStorage.shared.save(emojis: emojis)
//        }
//    }
    
    var emojisMO = [EmojiMO]() {
        didSet {
            AppDelegate.delegate!.saveContext()
        }
    }
    
    var insertMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let emojis = EmojiStorage.shared.load() {
//            self.emojis = emojis
//        } else {
//            emojis = Emoji.loadDefaultValues()
//        }
        
        AppDelegate.delegate!.saveContext()
        
        if let emojisMO = EmojiMO.fetch() {
            self.emojisMO = emojisMO
        }
        
        startUI()
    }
    
    func startUI() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EmojiEditSegue" else { return }
        guard let controller = segue.destination as? EmojiDetailTableViewController else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        
//        let emoji = emojis[selectedPath.row]
        let emojiMO = emojisMO[selectedPath.row]
        
        controller.emoji = Emoji(emojiMO)
        controller.navigationItem.title = "Edit"
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "EmojiSaveSegue" else { return }
        guard let controller = segue.source as? EmojiDetailTableViewController else { return }
        guard let emoji = controller.emoji else { return }
        
        let emojiMO = EmojiMO(emoji)
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            // Edited row
            
//            emojis[selectedPath.row] = emoji
            let delegate = AppDelegate.delegate!
            let context = delegate.context
            
            let emojiToDelete = emojisMO[selectedPath.row]
            context?.delete(emojiToDelete)
            
            emojisMO[selectedPath.row] = emojiMO
            
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            // Added row
//            let indexPath = IndexPath(row: emojis.count, section: 0)
            let indexPath = IndexPath(row: emojisMO.count, section: 0)
            
//            emojis.append(emoji)
            emojisMO.append(emojiMO)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
