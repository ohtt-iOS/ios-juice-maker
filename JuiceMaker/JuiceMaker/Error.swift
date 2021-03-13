//
//  Error'.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/11.
//

import Foundation

enum FruitError: Error, CustomStringConvertible {
  case invalidFruit
  
  var description: String {
    switch self {
    case .invalidFruit:
      return "🔥 과일 입력이 잘못되었습니다."
    }
  }
}

enum JuiceError: Error, CustomStringConvertible {
  case invalidJuice
  
  var description: String {
    switch self {
    case .invalidJuice:
      return "🔥 쥬스 입력이 잘못되었습니다."
    }
  }
}

enum RecipeError: Error, CustomStringConvertible {
  case invalidRecipe
  
  var description: String {
    switch self {
    case .invalidRecipe:
      return "🔥 레시피 입력이 잘못되었습니다."
    }
  }
}
