//
//  NotificationCenterViewController.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/18.
//

import UIKit
// ユーザー入力をviewModelに伝搬する
// 自身の状態とvieModelの状態をデータバインディングする
// viewModelから返されるイベントを元に描画処理を実行する
final class NotificationCenterViewController: UIViewController {

    @IBOutlet private weak var idTextField: UITextField! {
        didSet {
            idTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        }
    }

    @IBOutlet private weak var validationLabel: UILabel!
    private let notificationCenter = NotificationCenter()
    private lazy var viewModel = NotificationCenterViewModel(notificationCenter: notificationCenter)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModelでpostを検知して更新hkb
        notificationCenter.addObserver(
            self,
            selector: #selector(updateValidationText(notification:)),
            name: Notification.Name.changeText,
            object: nil)
        // viewModelでpostを検して更新
        notificationCenter.addObserver(
            self,
            selector: #selector(updateValidationColor(notification:)),
            name: Notification.Name.changeTextColor,
            object: nil)
    }
}

extension NotificationCenterViewController {
    // テキストが入力されたらviewmodelにテキストを渡す
    @objc func textFieldEditingChanged(sender: UITextField) {
        viewModel.idPasswordChanged(id: idTextField.text, password: passwordTextField.text)
    }

    @objc func updateValidationText(notification: Notification) {
        guard let text = notification.object as? String else { return }
        validationLabel.text = text
    }

    @objc func updateValidationColor(notification: Notification) {
        guard let color  = notification.object as? UIColor else { return }
        validationLabel.textColor = color
    }
}
