import UIKit

var greeting = "Hello, playground"

@propertyWrapper
struct UserDefault<Value> {
    let key: String //사용자 정의 프로퍼티. 이 경우엔 UserDefault의 키
    
    //프로퍼티래퍼 필수 구현 프로퍼티
    //@UserDefault 속성이 선언된 프로퍼티를 사용할때 내부에서 실제로 연산에 활용되는 프로퍼티
    //연산, 저장 프로퍼티 둘 다 가능
    //옵셔널, 비옵셔널 둘 다 가능
    //래퍼의 주요 기능으로서, 래퍼는 결국 wrappedValue 프로퍼티가 필요로 하는 값들을 관리, 저장하기 위한 역할임
    var wrappedValue: Value? {
        get { UserDefaults.standard.object(forKey:key) as? Value }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
    
    init(wrappedValue: Value, _ key: String) {
        self.key = key
        self.wrappedValue = wrappedValue
    }
    
    var projectedValue: Self { //projectedValue 추가
        get { self } //원하는 getter 설정
        set { self = newValue } //원하는 setter 설정
    }
}

struct WrappedUser {
    @UserDefault(wrappedValue: false, "isLoggedIn") var isLoggedIn: Bool?
    @UserDefault(wrappedValue: true, "isFirstLogin") var isFirstLogin: Bool?
}

var user = WrappedUser()

print(user.isLoggedIn!) //false
print(user.isFirstLogin!) //true

user.isLoggedIn = true //미리 지정된 키로 true 저장
user.isFirstLogin = false

print(user.isLoggedIn!) //true
print(user.isFirstLogin!) //false
