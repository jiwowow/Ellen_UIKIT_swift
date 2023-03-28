//
//  FirstViewController.swift
//  NextVC
//
//  Created by 황지우 on 2023/03/26.
//

import UIKit

class FirstViewController: UIViewController {

    
    let mainLabel = UILabel() // 이렇게 해도 되고 클로저의 실행문으로 해도 됨(백버튼으로 예시)
    // 클로저의 실행문으로 하면 선언과 동시에 커스텀할 수 있음
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue // UIColor.blue와 .blue는 같음
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    
        return button
    }()
    
    
    
    // 전 화면으로부터 문자열을 전달받기 위한 변수
    var someString: String? // 일반적으로 데이터 전달받을 때 옵셔널스트링으로 선언 많이함.- 초기값이 nil로 세팅. 옵셔널로 안하면 생성자를 새로 만들어야함.
    // 유아이레이블이나 버튼은 기본값(생성자?)이 있는데 스트링은 없음. 따라서 초기값 설정 안해줄거라면 스트링을 위한 생성자를 만들어야 하는데 이게 어렵
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
        
    }
    

    func setup() {
        mainLabel.text = someString // 옵셔널바인딩 안해도됨. 레이블텍스트 자체가 옵셔널임
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        view.backgroundColor = UIColor.gray

    }
    
    

    func makeAutoLayout() {
       
  
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    
    @objc func backButtonTapped() {
        //print("뒤로가기 눌렸음")
        //전화면으로 돌아가기, 프레젠트의 반대
        dismiss(animated: true, completion: nil)
    }
    
    
    
    

}
