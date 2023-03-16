//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 황지우 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
      
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainLabel.backgroundColor = UIColor.cyan
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        
//        myButton.backgroundColor = UIColor.green
//
//        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
//
//        mainLabel.backgroundColor = UIColor.yellow
//        mainLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//
//        mainLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//
//        mainLabel.textAlignment = NSTextAlignment.right
//
        
        
    }
    
    
    
    
}

