//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 황지우 on 2023/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0 // 초가 줆에 따라 변수에 저장
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 밑에 func로 새함수 만들고 호출이 더 실무적
        configureUI()
    }
 
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        
        // 슬라이더를 가운데 설정
        //slider.setValue(0.5, animated: true)
        slider.value = 0.5
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을 가지고 메인 레이블에 텍스트를 세팅
        number = Int(sender.value * 60) // 센더 대신 슬라이더로도 접근 가능
        mainLabel.text = "\(number) 초"
    }
    

    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//            // 반복을 하고 싶은 코드
//
//            if number > 0 {
//                number -= 1
//                // 슬라이더도 줄여야 함 - 슬라이더.밸류 안에는 0.0부터 1.0의 값이 들어가야함
//                slider.value = Float(number) / Float(60)
//                // 레이블 표시도 다시 해야함
//                mainLabel.text = "\(number)초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                // 1초마다 실행되는 타이머이므로 계속 실행되지않으려면 인벨리데이트 해야
//                timer?.invalidate()
//
//                // 소리를 나게 해야함
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//            }
//        }
    }
    
    
    @objc func doSomethingAfter1Second(){
        if number > 0 {
            number -= 1
            // 슬라이더도 줄여야 함 - 슬라이더.밸류 안에는 0.0부터 1.0의 값이 들어가야함
            slider.value = Float(number) / Float(60)
            // 레이블 표시도 다시 해야함
            mainLabel.text = "\(number)초"

        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"

            // 1초마다 실행되는 타이머이므로 계속 실행되지않으려면 인벨리데이트 해야
            timer?.invalidate()

            // 소리를 나게 해야함
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }

    }

    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        
        // 슬라이더를 가운데 설정
        // slider.setValue(0.5, animated: false)
    }

    
    
}

