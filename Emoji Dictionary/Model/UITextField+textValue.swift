//
//  UITextField+textValue.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 19/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

extension UITextField {
    var textValue: String {
        return self.text ?? ""
    }
}
