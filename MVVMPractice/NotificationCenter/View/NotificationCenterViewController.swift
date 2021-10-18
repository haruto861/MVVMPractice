//
//  NotificationCenterViewController.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/18.
//

import UIKit
// View
// 自身の状態とViewModelとデータバインディングする
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

    private let changeText = Notification.Name.changeText
    private let changeTextColor = Notification.Name.changeTextColor

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NotificationCenterViewController {
    @objc func textFieldEditingChanged(sender: UITextField) {

    }

    @objc func updateValidationText(notification: Notification) {

    }

    @objc func updateValidationColor(notification: Notification) {

    }
}
