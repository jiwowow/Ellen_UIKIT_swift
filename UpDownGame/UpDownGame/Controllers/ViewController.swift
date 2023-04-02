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
    
    var updownManager = UpDownManager()
    
    
    // 앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }
    
    func reset() {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        updownManager.resetNum()
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야 함 - 옵셔널인 센더.커런트~ 를 아직 스트링인 넘스트링에 언랩해서 넣음(가드렛 바인딩 사용) 
        guard let numString = sender.currentTitle else { return }
        // 또는 let num = sender.currentTitle!
        
        // 2) 숫자 레이블이 숫자에 따라 변하도록 함
        numberLabel.text = numString
        
        // 3) 선택한 숫자를 변수에다가 저장 (선택). (문자열을 숫자로 변환 후 저장)
        guard let num = Int(numString) else { return }
        updownManager.setUsersNum(num: num)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let myNumString = numberLabel.text,
              let myNumber = Int(myNumString) else {
            return
        }

        updownManager.setUsersNum(num: myNumber)
        mainLabel.text = updownManager.getUpDownResult()
    }
        
        
        // mainLabel.text = updownManager.getUpDownResult()
        // 이 줄만 쓴다면, 숫자 선택 안했어도 셀렉트 누르면 리셋된 유저값과 컴값이 비교됨.
        // 유저값은 1로 리셋되고. 컴값은 1에서 10 사이 랜덤이므로 거의항상 UP이 뜨는것
        

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }

}

