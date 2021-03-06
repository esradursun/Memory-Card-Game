//
//  ViewController.swift
//  Concentration
//
//  Created by ESRA CELIK on 11.07.2019.
//  Copyright © 2019 ESRA CELIK. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
     var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }

    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.choseCard(at: cardNumber)
            updateViewFromModel()
          //  flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }

//    var theme: String? {
//        didSet {
//            esra = theme ?? ""
//            emoji = [:]
//            //updateViewFromModel()
//        }
//    }
    
    var esra = ""
    private var emoji = [Card:String]()
    private var emojiChoices = ["🍑","🐹","🐸","🐶","🐤","🐝","🐳","🍟","🍔","🍭","🥜","🧁"]
    
    private func emoji(for card : Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            _ = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
             return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
             return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
       
    }
}
