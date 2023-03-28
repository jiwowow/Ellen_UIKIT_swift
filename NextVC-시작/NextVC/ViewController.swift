//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {
    
    // var storyboard: UIStoryBoard? - uiviewcont에 이미 존재하는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController() // 인스턴스만 만듦.이동은 아직
        firstVC.someString = "아기상어"
        
        // "아기상어" 대신 RPS.가위 등 클래스나 구조체로 전달하는 경우 더 많음
        // firstVC.mainLabel.text = "아기상어"
        // 위처럼 해도 똑같은 결과지만, 데이터 다음화면으로 전달할 때 직접적으로 접근해서 전달하는건 하지 않음. 변수를 거쳐서 전달하도록!
        // 스토리보드로 만들면 아예 직접 전달이 안되기도 함
        
        firstVC.modalPresentationStyle = .fullScreen // 전체화면으로 만들기
        present(firstVC, animated: true , completion: nil) // 컴플리션은 화면이 넘어가고나서 뭐하는지. 지금은 암거도안함

    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {

        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {
            return
        }
        
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.someString = "아빠상어"
       // secondVC.mainLabel.text = "아빠상어" --> 에러
        
        
        present(secondVC, animated: true, completion: nil)
        // 타입캐스팅: 애플이 미리 만든건 UIViewCont 타입인데 실제로 만들어져야할것은 더 구체적인 SecondViewController. 그래서 타입캐스팅이 필요하다
        

        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    // 실제로 앱 만들때 코드로 많이 화면이동함. 세그웨이는 잘 안씀
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        // 퍼폼세그웨이는 스토리보드에서 그려준 세그웨이를 활성화만 해준 것
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 간접 세그웨이 방식에서 데이터 전달 하려면 프리페어 메소드가 꼭 필요 - 퍼폼세그웨이 하면 프리페어가 자동 실행
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue == 전달된 파라미터 이름
        if segue.identifier == "toThirdVC" {
            // 먼저 아이덴티파이어를 확인. 같다면 세그.데스티네이션에 접근해서 타입캐스팅한 구체적인 타입을 서드브이씨에 넣음
            // 이제 써드브이씨에 데이터 전달 가능
            
            // 세그웨이.데스티네이션은 세그웨이의 종착지. 이 세.종을 서드브이씨에 담음
            // 근데 세그.데스티네이션은 유아이뷰컨 타입. 그러므로 세번째뷰컨으로 타입캐스팅
            let thirdVC = segue.destination as! ThirdViewController
            
            // 데이터 전달
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toFourthVC" {

            let fourthVC = segue.destination as! FourthViewController
            
            fourthVC.someString = "엄마상어"
        }
        
    }
    

    
}

