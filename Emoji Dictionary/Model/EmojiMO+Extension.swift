//
//  EmojiMO+Extension.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 22/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import CoreData

extension EmojiMO {
    
    convenience init(_ emoji: Emoji) {
        
        self.init(context: AppDelegate.delegate!.context)
        
        name = emoji.name
        symbol = emoji.symbol
        summary = emoji.description
        usage = emoji.usage
    }
    
    static func fetch() -> [EmojiMO]? {
        guard let delegate = AppDelegate.delegate else { return nil }
        
        let request: NSFetchRequest<EmojiMO> = EmojiMO.fetchRequest()
        
        let context = delegate.context
        
        let emojis: [EmojiMO]?
        
        do {
            emojis = try context?.fetch(request)
        } catch {
            print(#function, error.localizedDescription)
            emojis = nil
        }
        
        return emojis
    }
    
    func removeFromCoreDataAndSaveContext() {
        guard let delegate = AppDelegate.delegate else { return }
        
        let context = delegate.context
        
        context?.delete(self)
        delegate.saveContext()
    }
}
