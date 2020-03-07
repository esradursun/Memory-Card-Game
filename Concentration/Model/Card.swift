//
//  Card.swift
//  Concentration
//
//  Created by ESRA CELIK on 13.07.2019.
//  Copyright © 2019 ESRA CELIK. All rights reserved.
//

import Foundation

struct Card: Hashable{
    
    var hashValue: Int {return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()

    }

}
