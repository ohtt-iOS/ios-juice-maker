//
//  FruitStoreTests.swift
//  JuiceMakerTests
//
//  Created by soyounglee on 2022/02/19.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {
  var fruitStore: FruitStore!
  
  override func setUp() {
    super.setUp()
    
    fruitStore = FruitStore(quantity: 100)
  }
  
  func test_init_quanitity가_0보다_작을_때_재고_0으로_초기화() {
    //given
    let quantity: Int = -3
    
    //when
    fruitStore = FruitStore(quantity: quantity)
    
    //then
    Fruit.allCases.forEach { fruit in
      XCTAssertEqual(0, fruitStore.stock(of: fruit))
    }
  }
  
  func test_init_quanitity가_0일때_재고_0으로_초기화() {
    //given
    let quantity: Int = 0
    
    //when
    fruitStore = FruitStore(quantity: quantity)
    
    //then
    Fruit.allCases.forEach { fruit in
      XCTAssertEqual(0, fruitStore.stock(of: fruit))
    }
  }
  
  func test_init_quanitity가_300일때_재고_300으로_초기화() {
    //given
    let quantity: Int = 300
    
    //when
    fruitStore = FruitStore(quantity: quantity)
    
    //then
    Fruit.allCases.forEach { fruit in
      XCTAssertEqual(300, fruitStore.stock(of: fruit))
    }
  }
  
  func test_updateStock_딸기_재고를_0보다_작게_했을_때_업데이트가_안되야함() {
    //given
    let strawberryQuantity: Int = -200
    
    //when
    let beforeValue = fruitStore.stock(of: .strawberry)
    fruitStore.updateStock(of: .strawberry, quantity: strawberryQuantity)
    
    //then
    XCTAssertEqual(beforeValue, fruitStore.stock(of: .strawberry))
    XCTAssertNotEqual(strawberryQuantity, fruitStore.stock(of: .strawberry))
  }
  
  func test_updateStock_딸기_재고를_0일_때_0으로_업데이트() {
    //given
    let strawberryQuantity: Int = 0
    
    //when
    let beforeValue = fruitStore.stock(of: .strawberry)
    fruitStore.updateStock(of: .strawberry, quantity: strawberryQuantity)
    
    //then
    XCTAssertNotEqual(beforeValue, fruitStore.stock(of: .strawberry))
    XCTAssertEqual(strawberryQuantity, fruitStore.stock(of: .strawberry))
  }
  
  func test_updateStock_딸기_재고를_0보다_클_때_업데이트_성공() {
    //given
    let strawberryQuantity: Int = 1000
    
    //when
    let beforeValue = fruitStore.stock(of: .strawberry)
    fruitStore.updateStock(of: .strawberry, quantity: strawberryQuantity)
    
    //then
    XCTAssertNotEqual(beforeValue, fruitStore.stock(of: .strawberry))
    XCTAssertEqual(strawberryQuantity, fruitStore.stock(of: .strawberry))
  }
}
