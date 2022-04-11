import UIKit

var greeting = "Hello, playground"

protocol VCProtocol: AnyObject {
    associatedtype actionType
    
    func onSuccess(data: Any?, action: actionType)
}

class LoginVC: VCProtocol {

    typealias actionType = LoginAction
    
    var loginVM = LoginVM<LoginVC>()
    
    init() {
        loginVM.delegate = self
    }
    
    func onSuccess(data: Any?, action: LoginAction) {
        switch action {
        case .login: print("login")
        case .forgotPassword: print("forget password")
        }
    }
    
    func didLogin() {
        loginVM.login()
    }
}

enum LoginAction {
    case login
    case forgotPassword
}

class LoginVM<Delegate: VCProtocol> where Delegate.actionType == LoginAction {
    weak var delegate: Delegate?
    
    func login() {
        delegate?.onSuccess(data: nil, action: .login)
    }
}

/****************************************************************************************************/


protocol Container {
    associatedtype itemType
    
    var count: Int { get }
    
    mutating func append(_ item: itemType)
    
    subscript(i: Int) -> itemType { get }
}

class MyContainer: Container {
    
    var items: [Int] = []
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element>: Container {

    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    var count: Int { return items.count }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    subscript(i: Int) -> Element { return items[i] }
}
