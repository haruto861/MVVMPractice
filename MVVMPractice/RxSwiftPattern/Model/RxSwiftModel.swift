//
//  RxSwiftModel.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/22.
//

import Foundation
import RxSwift
import RxCocoa

enum ModelError: Error {
    case invalid
    case invalidPassword
    case invalidIdandPassword

    var errorText: String {
        switch self {
        case .invalidIdandPassword:
            return "IDとPasswordが未入力です"
        case .invalid:
            return "IDが未入力です"
        case .invalidPassword:
            return "パスワードが未入力です"
        }
    }
}

protocol RxSwiftModelProtocol {
    func validate(idText: String?, passwordText: String?) -> Observable<Void>
}

final class RxSwiftModel: RxSwiftModelProtocol {
    func validate(idText: String?, passwordText: String?) -> Observable<Void> {
        switch (idText, passwordText) {
        case (.none, .none):
            return Observable.error(ModelError.invalidIdandPassword)
        case (.none, .some):
            return Observable.error(ModelError.invalid)
        case (.some, .none):
            return Observable.error(ModelError.invalidPassword)
        case (let idText?, let passwordText?):
            switch (idText.isEmpty, passwordText.isEmpty) {
            case (true, true):
                return Observable.error(ModelError.invalidIdandPassword)
            case (false, false):
                return Observable.just(())
            case (true, false):
                return Observable.error(ModelError.invalid)
            case (false, true):
                return Observable.error(ModelError.invalidPassword)
            }
        }
    }

}
