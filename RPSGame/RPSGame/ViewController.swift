//
//  ViewController.swift
//  RPSGame
//
//  Created by 황지우 on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수 / 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comimageView: UIImageView!
    @IBOutlet weak var myimageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 데이터 저장 위한 변수 (컴퓨터의 선택 / 나의 선택)
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    
    // 함수 / 메서드
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째/두번째 이미지뷰에 준비(목)이미지를 띄워야 함
        comimageView.image = #imageLiteral(resourceName: "ready")
        myimageView.image = UIImage(named: "ready.png")
        
        
        // 2) 첫번째/두번째 레이블에 "준비"라는 문자열을 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 유저가 가위/바위/보(enum)를 선택함과 동시에 정보를 저장해야함
        
        //        guard let title = sender.currentTitle else {
        //            return
        //        }// 가드 렛 타이틀은 센더의 현재 타이틀이 있다면 그것을 사용하겠다는 뜻.
        
        // 지금은 세 버튼이 다 타이틀이 있다는게 명확하므로 밑 방법.
        
        // 버튼의 문자를 가져옴
        let title = sender.currentTitle!
        print(title)
        
        switch title {
        case "가위":
            // 가위 열거형을 만들어서 저장
            myChoice = Rps.scissors
        case "바위":
            // 바위 열거형을 만들어서 저장
            myChoice = Rps.rock
        case "보":
            // 보 열거형을 만들어서 저장
            myChoice = Rps.paper
        default :
            break
        }
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comimageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comimageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comimageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 3) 내가 선택한 것을 이미지뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myimageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myimageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myimageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
            
        }
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단/표시
        
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper{
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비를 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비를 레이블에 표시
        comimageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"

        // 3) 내 선택 이미지뷰에 준비 이미지를 표시
        // 4) 내 선택 레이블에 준비 문자열 표시
        myimageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"

        // 5) 메인 레이블에 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
        
    
}
