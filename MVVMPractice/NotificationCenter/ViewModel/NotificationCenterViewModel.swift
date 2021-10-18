//
//  NotificationCenterViewModel.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/18.
//

import Foundation
// viewに表示するためのデータを保持する
// viewからイベントを受け取り,Modelの処理を呼び出す
// viewからイベントを受け取り、加工して値を更新する

final class NotificationCenterViewModel {
    let changeText = Notification.Name.changeText
    let changeTextColor = Notification.Name.changeTextColor

    private let notificationCenter: NotificationCenter

    init(notificationCenter: NotificationCenter) {
        self.notificationCenter = notificationCenter
    }

    func idPasswordChanged(id: String?, password: String?) {

    }

}
