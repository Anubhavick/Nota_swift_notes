//
//  Item.swift
//  sign-up-page
//
//  Created by Anubhav Mishra on 04/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
