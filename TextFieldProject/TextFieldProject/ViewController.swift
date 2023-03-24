//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 황지우 on 2023/03/24.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }

    

    func setup() {
        view.backgroundColor = UIColor.gray
        // 노션에 정리
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
    }
    
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // 같은 의미 - textField.resignFirstResponder()
    }
    
    
    
    // 텍스트필드의 입력을 시작할때 호출 (시작할지 말지 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드에 입력을 시작했다.")
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    
    // 텍스트필드의 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 (허락)
    // 문자열이 입력이 되지 않게 할 때 등 - 리턴 폴스
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
//        print(string)
        
        let maxLength = 10
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

            return newString.length <= maxLength
    }
    
    
    // 텍스트필드에 엔터키가 눌렸을때 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    
    
    // 텍스트필드에 입력이 끝날때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    
    // 텍스트필드에 입력이 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드에 입력을 끝냈다.")
        textField.text = ""
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        
    }
    
    
    
    

}

