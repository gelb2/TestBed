//
//  FunctionBuilderTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import Foundation

@resultBuilder
struct EvenNumbers { //@ViewBuilder처럼 실제 사용될 이름. @EvenNumbers라고 쓰면 된다.
    
    //호출되는 코드 A
    static func buildBlock(_ numbers: Int...) -> [Int] {
        numbers.filter { $0.isMultiple(of: 2) }
    }
    
    //호출되는 코드 B
    static func buildBlock(_ numbers: [Int]) -> [Int] {
        numbers.filter { $0.isMultiple(of: 2) }
    }
    
}

//연산 프로퍼티 //호출되는 코드 A가 호출된다
@EvenNumbers var computedProperty: [Int] {
    1
    2
}

//연산 프로퍼티 ////호출되는 코드 B가 호출된다
@EvenNumbers var anotherComputedProperty: [Int] {
    [1,2,3,4]
}

@EvenNumbers
func annotatedFunction(_ numbers: [Int]) -> [Int] {
    numbers.filter { $0 > 2 } //입력값을 전처리한 후 buildBlock으로 전달한다
}
//annotatedFunction([1,2,3,4]) //함수 호출 시 입력하는 인수가 기본 입력값

func anotherAnnotatedFunction(@EvenNumbers _ content: () -> [Int]) -> [Int]{
    content() //함수를 실행했을 때 buildBlock 함수 호추
}
//anotherAnnotatedFunction { 1; 2; 3; 4; } //한 줄에 여러 값 입력 시 세미콜론 사용

struct MyNumbers<T> {
    let numbers: T
    @inlinable init(@EvenNumbers content: () -> T) {
        self.numbers = content()
    }
}

let example = MyNumbers {
    1
    2
}

//example.numbers // [2]
