//
//  JuiceMakerTests.swift
//  JuiceMakerTests
//
//  Created by soyounglee on 2022/02/19.
//

import XCTest
@testable import JuiceMaker

class JuiceMakerTests: XCTestCase {
  var juiceMaker: JuiceMaker!
  var fruitStoreMock: FruitStoreMock!
  
  override func setUp() {
    super.setUp()
    
    fruitStoreMock = FruitStoreMock()
    juiceMaker = JuiceMaker(fruitStore: fruitStoreMock)
  }
  
  func test_make_재고_부족시_에러_던짐() {
    // given
    fruitStoreMock.stockShouldReturn = 0 // 재고 없는 상황
    
    // when
    
    
    // then
    XCTAssertThrowsError(try juiceMaker.make(juice: .strawberry))
  }
  
  func test_make_재고_있을시_재고업데이트() {
    // given
    let currentStock = 99999
    fruitStoreMock.stockShouldReturn = currentStock // 재고 있는 상황
    
    // when
    try? juiceMaker.make(juice: .strawberry)
    
    // then
    let ingredients = Juice.strawberry.ingredients
    
    XCTAssertEqual(fruitStoreMock.updateStockCallCount, ingredients.count)
    
    XCTAssertEqual(ingredients.map { $0.0 }, fruitStoreMock.updateStockFruits)
    XCTAssertEqual(ingredients.map { currentStock - $0.1 }, fruitStoreMock.updateStockQuantities)
  }
}
