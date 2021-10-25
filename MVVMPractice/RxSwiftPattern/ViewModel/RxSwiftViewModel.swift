//
//  RxSwiftViewModel.swift
//  MVVMPractice
//
//  Created by 松島悠人 on 2021/10/22.
//

import Foundation
import RxSwift

final class RxSwifViewModel {
    let validationText: Observable<String>
    let loadLabelColor: Observable<UIColor>

    init(idTextObservable: Observable<String?>, passwordTextObservable: Observable<String?>, model: RxSwiftModelProtocol) {
        let event = Observable.combineLatest(idTextObservable, passwordTextObservable).skip(1).flatMap { idText, passwordText -> Observable<Event<Void>> in
            return model.validate(idText: idText, passwordText: passwordText).materialize()
        }.share()

        // 
        self.validationText = event.flatMap({ event -> Observable<String> in
            switch event {
            case .next : return .just("OK!!!")
            case let .error(error as ModelError):
                return .just(error.errorText)
            case .error, .completed: return .empty()
            }
        })

        self.loadLabelColor = event.flatMap({ event -> Observable<UIColor> in
            switch event {
            case .next: return .just(.green)
            case .error: return .just(.red)
            case .completed: return .empty()
            }
        })
    }


}
