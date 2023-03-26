//: [Previous](@previous)
//: ## 1.1. Generic Functions
/*:
다음과 같이 상당히 인위적인 두 함수 선언을 고려해보십시오:
```swift
 func identity(_ x: Int) -> Int { return x }
 func identity(_ x: String) -> String { return x }
```
매개변수와 반환 유형을 제외하고, 두 함수 모두 정확히 동일한 정의를 갖고 있으며, 실제로 어떤 구체적인 유형에 대해서도 같은 함수를 작성할 수 있습니다. 여러분의 미적 감각은 두 함수를 모두 단일 일반화된 함수로 대체하도록 이끌 수 있습니다
```swift
 func identity<T>(_ x: T) -> T { return x }
```
이 함수 선언은 사소하지만, 중요한 개념을 설명하고 용어를 소개할 수 있게 해줍니다. 다음 장에서는 컴파일 파이프라인의 전체 설명을 볼 수 있지만, 지금은 구문 분석에서 시작하여 유형 검사를 거쳐 코드 생성으로 이어지는 단순화된 관점을 고려해 보겠습니다.
 */
/*:
 파싱 피규어 1.1은 타입 체크 이전 파서에 의해 생성된 추상 구문 트리를 보여줍니다. 주요 요소는 다음과 같습니다:

 일반화된 매개변수 목록 <T>는 T라는 이름의 단일 일반화된 매개변수 선언을 소개합니다. 이름에서 알 수 있듯이, 이것은 이 함수의 전체 소스 범위에 스코프된 일반화된 매개변수 유형 T를 선언합니다.
 유형 표현 T은 매개변수 선언 _ x: T의 첫 번째로, 그리고 identity(_:).의 반환 유형으로 두 번 나타납니다. 유형 표현은 유형의 순수 구문 형식입니다. 파서는 이름 조회를 수행하지 않으므로, 유형 표현은 식별자 T를 저장하고 T의 일반화된 매개변수 선언과 어떤 관련도 없이 참조하지 않습니다.
 함수 본문에는 x를 참조하는 식이 포함되어 있습니다. 다시 말하지만, 파서는 이름 조회를 수행하지 않으므로, 이것은 단순히 식별자 x이며, 매개변수 선언 _ x: T와 관련이 없습니다.
 */
//: ![Figure 1.1.: The abstract syntax tree for identity(_:)](https://i.esdrop.com/d/f/8P6IIlb52h/zYe0b39SoJ.png)
/*:
타입 체킹(Type Checking) 과정에서 추가적인 구조가 형성됩니다:

1.제네릭 파라미터 선언 T는 제네릭 파라미터 타입 T를 선언합니다. Swift에서 타입은 타입 선언과 구분되며, 일부 타입은 타입 선언을 참조하는 타입이고, 일부는 구조적인 것입니다(예: 함수 타입 또는 튜플 타입).
 
2.타입 체커는 함수 선언을 위한 제네릭 시그니처를 구성합니다. 제네릭 시그니처는 <T>와 같은 문자열 표현을 가지며, 하나의 제네릭 파라미터 타입 T를 포함합니다. 이것은 비제네릭 선언의 빈 제네릭 시그니처를 제외하면 가장 간단한 제네릭 시그니처입니다.
 
3.타입 체커는 매개변수 선언과 반환 타입에 나타나는 T 타입 표현을 의미적인 타입으로 변환하기 위해 타입 해결(Type Resolution)을 수행합니다. 타입 해결은 각 타입 표현의 소스 위치에서 식별자 T에 대해 이름 조회를 수행합니다. 이 조회는 양쪽 모두에서 제네릭 파라미터 선언 T를 찾게 되고, 이 선언은 제네릭 파라미터 타입 T를 선언합니다. 이 선언된 제네릭 파라미터 타입 T가 해결된 타입이 됩니다.
 
4.이제 함수의 인터페이스 타입을 형성할 충분한 정보가 있습니다. 인터페이스 타입은 표현식 컨텍스트에서 이 함수에 대한 참조의 타입입니다. 제네릭 함수 선언의 인터페이스 타입은 함수의 제네릭 시그니처, 매개변수 타입 및 반환 타입으로 구성된 제네릭 함수 타입입니다.
```swift
 <T>(T) -> T
```
 마지막 단계는 함수 본문의 타입 체크입니다. 표현식 타입 체커는 매개변수 선언인 _ x: T에서 식별자 x에 대해 이름 조회를 수행하며, 제네릭 파라미터 T의 선언을 찾습니다.
 */
//: [Next](@next)
