//
//  ViewController.swift
//  BMI
//
//  Created by 황지우 on 2023/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        makeUI()
    }
    
    
    func makeUI() {
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        weightTextField.returnKeyType = .done
    }
    
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) { // BMI 결과값을 뽑아내야함
//  처음에는 이 함수에서 bmi계산, 두번째에는 bmiManager에게 계산해달라고 함, 세번째에는 버튼 눌리며 세그웨이가 자동실행되며 should, prepare함수가 실행될 때 프리페어 함수에서 bmiManager로부터 bmi 구조체 값 모두 받아온 뒤 secondVC.bmi에게 전달
        
        
//        bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!) [2]
   
       // bmi = calculateBMI(height: height, weight: weight) [1]
        
        
//        calculateBMI(height: heightTextField.text!, weight: weightTextField.text!) -> 가드렛 없이 하는 방법
    }
    
    
    
    // 직접 세그웨이에서 버튼 눌렀을 때 넘어가는걸 허락할지말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 두 텍필에 숫자가 제대로 입력 안됐다면 넘어가기 불허
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!"
            mainLabel.textColor = UIColor.red
            return false
        }
        // 제대로 입력됐다면 원래대로 돌려놓기인듯
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    
    
    
    // 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음화면으로 전달
            // 나의속성에있는 bmi --MVC--> bmimanager의 함수 불러서 사용
//            secondVC.bmiNumber = bmiManager.getBMIResult()
//            secondVC.adviceString = bmiManager.getBMIAdviceStrng()
//            secondVC.bmiColor = bmiManager.getBackgroundColor()
            
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
            
            
        }
        // 다음화면으로 가기 전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    
    
   


}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 텍필 두개 다 델리게이트로 연결해놨기 때문에 두개중 어떤거에 입력하든 불림. 만약 한개만 하고싶으면 if textField == heightTextField {}로 감싸면 됨
        
        if Int(string) != nil || string == "" {
            return true
        }// 글자 입력을 허용
        return false // 글자 입력을 허용하지 않음
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        
        if heightTextField.text != "", weightTextField.text != "" {
            print(#function)
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
        
    }
    
    // touches Began 메서드는 위에 하기도 하고 여기에 하기도 함
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
