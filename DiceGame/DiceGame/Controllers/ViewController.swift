//
//  ViewController.swift
//  DiceGame
//
//  Created by 황지우 on 2023/03/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    var diceManager = DiceManager()
                                        
    // 앱이 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()

        firstImageView.image = diceManager.getFirstDice()
        secondImageView.image = diceManager.getFirstDice()
        //시작하는 주사위 숫자를 2 2로 변경
//        firstImageView.image = diceArray[1]
//        secondImageView.image = diceArray[1]

    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
    
        firstImageView.image = diceManager.getRandomDice()
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceManager.getRandomDice()
    }

}

