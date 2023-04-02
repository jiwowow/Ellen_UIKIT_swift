//
//  ViewController.swift
//  LoginProject
//
//  Created by 황지우 on 2023/03/25.
//

import UIKit

final class ViewController: UIViewController {

    
    // 프라이빗 : 접근 제어. 외부에선 안되고 내부에서만 변수에 접근 가능하도록
    // 레이지바를 써야 애드서브뷰가 가능.
    // 그냥 렛으로 하면 메모리에 동시에 올라가기때문에 안됨. 텍필드와 레이블이 먼저 메모리에 올라가고
    // 그다음 텍필뷰가 올라가야되므로 - 레이지바 사용
    // MARK: - 이메일 입력하는 텍스트뷰
    private lazy var emailTextFieldView: UIView = {
        
        // 클로저는 어차피 리턴하므로, 클로저 내에서는 이메일텍스트필드뷰같은 긴 이름 쓰지 않고 그냥 뷰로 퉁침
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        // 텍스트필드뷰 위에다가 올리는 것들 두개(이메일텍필, 이메일레이블)
        // 이메일텍스트필드뷰도 위에다 올려야 -> makeUI() 안에
        // 순서가 중요
        
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()

    
    // "이메일 또는 전화번호" 안내문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    // 로그인 - 이메일 입력 필드
    private let emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged) // editing changed = 값이 변할때마다 호출
        return tf
    }()
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    
    
    // 패스워드텍스트필드의 안내문구
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    
    // 로그인 - 비밀번호 입력 필드
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        //tf.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true // 비밀번호 가리는 설정
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    
    // 패스워드에 "표시" 버튼 비밀번호 가리기 기능
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(UIColor(named: "white"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - 로그인버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false // 첨엔 활성화안하고 둘다 입력됐을때 활
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView,passwordTextFieldView,loginButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    
    // 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)

        return button
    }()
    
    
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    
    
    // 오토레이아웃 향후 변경을 위한 변수 ( 애니메이션 )
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        makeUI()
    }

    
    func makeUI(){
        
        view.backgroundColor = UIColor.black
        
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        // 이메일인포레이블의 오토레이아웃 - 텍필뷰 기준
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        // 이메일텍필의 오토레이아웃 - 텍필뷰 기준
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        // 패스워드인포레이블의 오토레이아웃 - 텍필뷰 기준
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        // 페스워드텍필의 오토레이아웃 - 텍필뷰 기준
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        // 패스워드시큐어버튼의 오토레이아웃 - 텍필뷰 기준
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        // 스택뷰의 오토레이아웃 - 뷰 기준
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // 비밀번호 재설정 버튼의 오토레이아웃 - 뷰. 스택뷰 기준
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor), -> 고정으로 놔두면 안됨
            emailInfoLabelCenterYConstraint,
            //--------------
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            //---------------
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            //passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            //---------------
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3  + 36),
            //----------------
            passwordResetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
            
        ])
        
    
        
        
        
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2).isActive = true
        
        
        
        passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15).isActive = true
        passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15).isActive = true // 이거 두개는
        passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8).isActive = true // 왜 마이너스..
    }
    
    
    @objc func loginButtonTapped() {
        print("다음 화면으로 넘어가기")

    }
    
 
    
    @objc func resetButtonTapped() {
        // print("리셋버튼이 눌렸습니다.")
        
        // 애플이 미리 만들어놓은 얼럿컨트롤러를 사용, 스타일 두가지
        let alertCont = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        // 액션 두가지를 만듦
        let success = UIAlertAction(title: "확인", style: .default) {
            action in print("확인 버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel){
            cancel in print("취소 버튼이 눌렸습니다.")
        }
        
        // 액션을 얼럿컨트롤러에 올려줌 - 그래야 버튼이 생김
        alertCont.addAction(success)
        alertCont.addAction(cancel)
        
        
        // 얼럿컨트롤러를 띄워줌
        present(alertCont, animated: true, completion: nil)

    }
    
    
    // MARK: - 비밀번호 가리기 모드 켜고 끄기
    @ objc func passwordSecureModeSetting() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}



// 확장해서 델리게이트 채택하는 이유 : 코드 정리가 더 깔끔함
extension ViewController: UITextFieldDelegate {
    // MARK: - 텍스트필드 편집 시작할때의 설정 - 문구가 위로올라가면서 크기 작아지고, 오토레이아웃 업데이트
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded() // 스택뷰 내부에 있는 모든 것들을 동적으로 변하게끔, 애니메이션이 띄엄띄엄이 아니라 자연스럽게 그림그리는 코드.. 만약 self.emailTextFieldView.layoufIfNeeded() 쓰면 패스워드것까지 두 줄 써야하므로 귀찮
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            // 만약 빈칸이면 원래대로 되돌림(레이블, 레이아웃)
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토레이아웃 업데이트(다시 내려오게)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토레이아웃 업데이트(다시 내려오게)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
            
        }
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded() // 애니메이션이 띄엄띄엄이 아니라 자연스럽게 그림그리는 코드
        }
    }
    
    // MARK: - 이메일텍스트필드, 비밀번호 텍스트필드 두가지 다 채워져 있을때, 로그인 버튼 빨간색으로 변경
    @objc func textFieldEditingChanged(_ textField: UITextField){
        if textField.text?.count == 1{
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        

        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
            else {
                loginButton.backgroundColor = .clear
                loginButton.isEnabled = false
                return
            }
            loginButton.backgroundColor = .red
            loginButton.isEnabled = true
    }

    
    
}
