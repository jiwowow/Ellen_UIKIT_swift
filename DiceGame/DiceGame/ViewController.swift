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
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1") , #imageLiteral(resourceName: "black2") , #imageLiteral(resourceName: "black3") , #imageLiteral(resourceName: "black4") , #imageLiteral(resourceName: "black5") , #imageLiteral(resourceName: "black6")]
                                        
    // 앱이 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //시작하는 주사위 숫자를 2 2로 변경
//        firstImageView.image = diceArray[1]
//        secondImageView.image = diceArray[1]

    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
        
       // firstImageView.image = //랜덤 이미지
        firstImageView.image = diceArray.randomElement()
        
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
        
        
    }
    
    
    
    
    
}

