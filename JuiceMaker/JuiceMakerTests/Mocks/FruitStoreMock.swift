//
//  FruitStoreMock.swift
//  JuiceMakerTests
//
//  Created by jaeyoung Yun on 2022/02/19.
//

import Foundation
@testable import JuiceMaker

class FruitStoreMock: FruitStorable {
  var updateStockCallCount = 0
  var updateStockFruits: [Fruit]? = []
  var updateStockQuantities: [Int]? = []
  func updateStock(of fruit: Fruit, quantity: Int) {
    updateStockCallCount += 1
    updateStockFruits?.append(fruit)
    updateStockQuantities?.append(quantity)
  }
  
  var stockCallCount = 0
  var stockFruit: Fruit?
  var stockShouldReturn: Int?
  func stock(of fruit: Fruit) -> Int? {
    stockCallCount += 1
    stockFruit = fruit
    
    return stockShouldReturn
  }
}
