//
//  NotificationCenterModel.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/18.
//

import Foundation

enum Result<type, NotificationCenterModelError> {
    case success(type)
    case failure(NotificationCenterModelError)
}

enum NotificationCenterModelError {
    case invalidIdAndPassword
    case invalidId
    case invalidPassworrd
    var errorType: String {
        switch self {
        case .invalidIdAndPassword:
            return "IDとPasswordが未入力です"
        case .invalidId:
            return "IDが未入力です"
        case .invalidPassworrd:
            return "パスワードが未入力です"
        }
    }
}


protocol NotificationCenterModelProtocol {
    func validate(idText: String?, password: String?) -> Result<Void, NotificationCenterModelError>
}

// input
final class NotificationCenterModel : NotificationCenterModelProtocol {
    func validate(idText: String?, password: String?) -> Result<Void, NotificationCenterModelError> {
        if let idText = idText, !idText.isEmpty, let password = password, password.isEmpty {
            return .failure(.invalidPassworrd)
        } else if let idText = idText, idText.isEmpty, let password = password, !password.isEmpty {
            return .failure(.invalidId)
        } else if let idText = idText, idText.isEmpty, let password = password, password.isEmpty {
            return .failure(.invalidIdAndPassword)
        } else {
            return .success(())
        }
    }
}
