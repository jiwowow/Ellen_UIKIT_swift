//
//  UpDownManager.swift
//  UpDownGame
//
//  Created by 황지우 on 2023/04/02.
//

import Foundation

struct UpDownManager {
    // 컴퓨터가 1~10 중 랜덤으로 숫자 선택
    private var comNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자 저장할 변수(에러 방지 위해 1)
    private var myNumber: Int = 1
    
    mutating func resetNum() {
        comNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    mutating func setUsersNum(num: Int) {
        myNumber = num
    }
    
    
    func getUpDownResult() -> String{
        if comNumber > myNumber {
            return "Up"
        } else if comNumber < myNumber {
            return "Down"
        } else {
            return "Bingo🤩"
        }
    }

}
