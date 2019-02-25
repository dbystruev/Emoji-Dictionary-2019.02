//
//  EmojiTableViewController+UITableViewDelegate.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 15/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

extension EmojiTableViewController/*: UITableViewDelegate*/ {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return insertMode ? .insert : .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .insert:
//            let emoji = emojis[indexPath.row]
//            emojis.insert(emoji, at: indexPath.row)
            let emojiMO = emojisMO[indexPath.row]
            
            let newEmoji = Emoji(emojiMO)!
            let newEmojiMO = EmojiMO(newEmoji)
            
            emojisMO.insert(newEmojiMO, at: indexPath.row)
            
            tableView.insertRows(at: [indexPath], with: .top)
        case .delete:
//            emojis.remove(at: indexPath.row)
            
            let emojiMO = emojisMO.remove(at: indexPath.row)
            emojiMO.removeFromCoreDataAndSaveContext()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .none:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
//        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        
        let movedEmojiMO = emojisMO.remove(at: sourceIndexPath.row)
        let emoji = Emoji(movedEmojiMO)!
        
        movedEmojiMO.removeFromCoreDataAndSaveContext()
        let emojiMO = EmojiMO(emoji)
        
        emojisMO.insert(emojiMO, at: destinationIndexPath.row)
        
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if !editing {
            insertMode.toggle()
        }
    }
}
