//
//  NotificationCenterViewModel.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/18.
//

import Foundation
import UIKit
// viewに表示するためのデータを保持する
// viewからイベントを受け取り,Modelの処理を呼び出す
// viewからイベントを受け取り、加工して値を更新する
final class NotificationCenterViewModel {
    private let notificationCenter : NotificationCenter
    private let model : NotificationCenterModelProtocol

    init(notificationCenter: NotificationCenter, model: NotificationCenterModelProtocol = NotificationCenterModel()) {
        self.notificationCenter = notificationCenter
        self.model = model
    }
    // modelProtocolのoutput
    func idPasswordChanged(id: String?, password: String?) {
        // modelにロジック判定を委ねる
        let result = model.validate(idText: id, password: password)
        switch result {
        case .success:
            // viewが更新される
            notificationCenter.post(name: Notification.Name.changeText, object: "OK!!")
            notificationCenter.post(name: Notification.Name.changeTextColor, object: UIColor.green)
        case .failure(let error):

            // viewが更新される
            notificationCenter.post(name: Notification.Name.changeText, object: error.errorType)
            notificationCenter.post(name: Notification.Name.changeTextColor, object: UIColor.red)
        case _:
            print("Unexpected pattern")
        }
    }
}
