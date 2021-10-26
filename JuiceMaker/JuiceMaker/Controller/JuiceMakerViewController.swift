//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    var juiceMaker = JuiceMaker(fruitStorage: FruitStore.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitCount()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        guard let juiceID = sender.restorationIdentifier else {
            return
        }
        
        guard let juiceCase = JuiceMaker.Juice.allCases.filter({ $0 == juiceID }).first else {
            return
        }
        
        guard let _ = juiceMaker.order(juice: juiceCase) else {
            
            AlertMessage(title: "주스 제조 실패", message: "재료가 모자라요. 재고를 수정할까요?")
            return
        }
        print(FruitStore.shared.inventoryStatus)
        
        AlertMessage(title: "주스 제조 완료", message: "\(juiceID) 제조가 완료되었습니다.")
    }
    
    func AlertMessage(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "확인", style: .default, handler: nil)
        let alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateFruitCount() {
        let fruitCountList: [FruitStore.Fruits: Int] = FruitStore.shared.inventoryStatus
        
        for fruitCountLabel in fruitCountLabels {
            
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            
            guard let kindOfFruit = FruitStore.Fruits(rawValue: fruitID) else {
                return
            }
            
            guard let fruitCount = fruitCountList[kindOfFruit] else {
                return
            }
            
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    
}

