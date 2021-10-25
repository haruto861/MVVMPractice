//
//  RxSwiftViewController.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/25.
//

import Foundation
import RxSwift
import RxCocoa

final class RxSwiftViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet private weak var passowrdTextField: UITextField!
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var validationLabel: UILabel!
    private let disposeBag = DisposeBag()

    private lazy var viewModel = RxSwifViewModel(idTextObservable: idTextField.rx.text.asObservable(), passwordTextObservable: passowrdTextField.rx.text.asObservable(), model: RxSwiftModel())

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.validationText.bind(to: validationLabel.rx.text).disposed(by: disposeBag)
        viewModel.loadLabelColor.bind(to: loadLabelColor).disposed(by: disposeBag)
    }

    private var loadLabelColor: Binder<UIColor> {
        return Binder(self) {
            me, color in
            me.validationLabel.textColor = color
        }
    }
}
