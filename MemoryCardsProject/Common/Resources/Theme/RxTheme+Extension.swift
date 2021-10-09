//
//  RxTheme+Extension.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 9.10.2021.
//

import RxCocoa
import RxSwift
import RxTheme

extension Reactive where Base: UINavigationBar {
    var barStyle: Binder<UIBarStyle?> {
        return Binder(self.base) { navBar, barStyle in
            navBar.barStyle = barStyle ?? .default
        }
    }
}

extension ThemeProxy where Base: UINavigationBar {
    var barStyle: Observable<UIBarStyle?> {
        get { return .empty() }
        set {
            let disposable = newValue
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.barStyle)
            hold(disposable, for: "barStyle")
        }
    }
}

