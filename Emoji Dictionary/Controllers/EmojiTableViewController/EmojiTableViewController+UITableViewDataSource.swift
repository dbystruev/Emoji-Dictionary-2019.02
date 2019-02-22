//
//  EmojiTableViewController+UITableViewDataSource.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 15/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

extension EmojiTableViewController/*: UITableViewDataSource*/ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return emojis.count
        return emojisMO.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell") as! EmojiTableViewCell
        
//        let emoji = emojis[indexPath.row]
//        configure(cell: cell, emoji: emoji)
        
        let emojiMO = emojisMO[indexPath.row]
        configure(cell: cell, emojiMO: emojiMO)
        
        return cell
    }
    
    func configure(cell: EmojiTableViewCell, emoji: Emoji) {
        cell.symbolLabel.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
    
    func configure(cell: EmojiTableViewCell, emojiMO: EmojiMO) {
        cell.symbolLabel.text = emojiMO.symbol
        cell.nameLabel.text = emojiMO.name
        cell.descriptionLabel.text = emojiMO.summary
    }
}
