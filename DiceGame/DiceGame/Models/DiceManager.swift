//
//  DiceManager.swift
//  DiceGame
//
//  Created by 황지우 on 2023/04/02.
//

import UIKit


struct DiceManager {
    private var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1") , #imageLiteral(resourceName: "black2") , #imageLiteral(resourceName: "black3") , #imageLiteral(resourceName: "black4") , #imageLiteral(resourceName: "black5") , #imageLiteral(resourceName: "black6")]
    
    func getRandomDice() -> UIImage {
        return diceArray.randomElement()!
    }
    
    func getFirstDice() -> UIImage {
        return diceArray[0]
    }
}
