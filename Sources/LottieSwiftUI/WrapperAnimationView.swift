//
//  File.swift
//  
//
//  Created by Lukáš Hromadník on 24.01.2022.
//

import UIKit
import Lottie

// Needed to have proper size with `frame` modifier
public final class WrapperAnimationView: UIView {
    let animationView: LottieAnimationView!

    init(animation: LottieAnimation?) {
        let animationView = LottieAnimationView(animation: animation)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.animationView = animationView

        super.init(frame: .zero)

        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
            animationView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            animationView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            animationView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WrapperAnimationView {
    var loopMode: LottieLoopMode {
        get { animationView.loopMode }
        set { animationView.loopMode = newValue }
    }

    func play(completion: LottieCompletionBlock?) {
        animationView.play(completion: completion)
    }

    func stop() {
        animationView.stop()
    }
}
