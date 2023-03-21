//
//  ViewController.swift
//  UpDownGame
//
//  Created by 황지우 on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    // 컴퓨터가 1~10 중 랜덤으로 숫자 선택
    var comNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자 저장할 변수(에러 방지 위해 1)
//    var myNumber: Int = 1
    
    // 앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 메인레이블에 "선택하세요"를 표시
        mainLabel.text = "선택하세요"
        
        // 2) 숫자레이블은 "" 표시
        numberLabel.text = ""
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야 함 - 옵셔널인 센더.커런트~ 를 아직 스트링인 넘스트링에 언랩해서 넣음(가드렛 바인딩 사용)
        guard let numString = sender.currentTitle else { return }
        // 또는 let num = sender.currentTitle!
        
        // 2) 숫자 레이블이 숫자에 따라 변하도록 함
        numberLabel.text = numString
        
        
        // 3) 선택한 숫자를 변수에다가 저장 (선택). (문자열을 숫자로 변환 후 저장)
//        guard let num = Int(numString) else { return }
//        myNumber = num
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 또다른 방법 제시
        // 숫자레이블에 있는 문자열 가져오기(옵셔널 벗기기)
        guard let myNumString = numberLabel.text else { return }
        // 타입 변환 (문자열 --> 정수)
        guard let myNumber = Int(myNumString) else { return }
        
        
        
        // 1) 컴퓨터의 숫자와 내가 선택한 숫자를 비교해서 업/다운/빙고 메인레이블에 표시
        if comNumber > myNumber {
            mainLabel.text = "Up"
        } else if comNumber < myNumber {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Bingo🤩"
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 메인레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 2) 숫자레이블을 ""로 세팅
        numberLabel.text = ""
        
        // 3) 컴퓨터의 랜덤숫자를 다시 선택하게
        comNumber = Int.random(in: 1...10)
        
    }


}

