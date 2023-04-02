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
    
    // 가위바위보 게임(비즈니스 로직) 관리 위한 인스턴스
    var rpsManager = RPSManager()
    
    
    
    // 함수 / 메서드
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    func configureUI() {
        // 1) 첫번째/두번째 이미지뷰에 준비(목)이미지를 띄워야 함
        comimageView.image = rpsManager.getReady().rpsInfo.image
        myimageView.image = rpsManager.getReady().rpsInfo.image
        
        
        // 2) 첫번째/두번째 레이블에 "준비"라는 문자열을 띄워야 함
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
    }
    
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 유저가 가위/바위/보(enum)를 선택함과 동시에 정보를 저장해야함
        
        //        guard let title = sender.currentTitle else {
        //            return
        //        }// 가드 렛 타이틀은 센더의 현재 타이틀이 있다면 그것을 사용하겠다는 뜻.
        
        // 지금은 세 버튼이 다 타이틀이 있다는게 명확하므로 밑 방법.
        
        // 버튼의 문자를 가져옴
        guard let title = sender.currentTitle else { return }
        
        // 가져온 문자를 분기처리해서 myChoice변수에 열거형 형태로 저장
        rpsManager.userGetSelected(name: title)
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        comimageView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name
        
        // 3) 내가 선택한 것을 이미지뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        myimageView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.name
        
        
        // 5 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단/표시
        mainLabel.text = rpsManager.getRPSResult()
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비를 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비를 레이블에 표시
        comimageView.image = rpsManager.getReady().rpsInfo.image
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name

        // 3) 내 선택 이미지뷰에 준비 이미지를 표시
        // 4) 내 선택 레이블에 준비 문자열 표시
        myimageView.image = rpsManager.getReady().rpsInfo.image
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name

        // 5) 메인 레이블에 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        rpsManager.allReset()
    }
        
    
}
