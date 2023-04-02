//
//  SecondViewController.swift
//  BMI
//
//  Created by 황지우 on 2023/03/30.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
//    var bmiNumber: Double? // 옵셔널 더블로 선언된 이 변수를 스트링으로 형변환해서 사용
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()

    }
    
    func makeUI() {
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.backgroundColor = .gray
        
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = "\(bmi.value)" //가드렛없이 "\(bmi?.value)" 하니까 Optional(숫자)로 표시됨
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor

    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) // self.는 생략 가능
    }
    
    

}
