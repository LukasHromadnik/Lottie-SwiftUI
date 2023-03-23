import SwiftUI
import Lottie

/// SwiftUI wrapper around `Lottie.AnimationView`
public struct LottieView: UIViewRepresentable {
    
    /// The animation
    let animation: LottieAnimation?
    
    /// Flag if the animation should be played
    @Binding var play: Bool
    
    /// Loop mode of the animation provided by the `@Environment`
    ///
    /// You can set this property using `lottieLoopMode` method on `View`
    @Environment(\.lottieLoopMode) var loopMode: LottieLoopMode
    
    public init(animation: LottieAnimation, play: Binding<Bool>) {
        self.animation = animation
        self._play = play
    }
    
    public init(name: String, play: Binding<Bool>) {
        animation = .named(name)
        self._play = play
    }

    public init(filepath: String, play: Binding<Bool>) {
        animation = .filepath(filepath)
        _play = play
    }
    
    // MARK: - UIViewRepresentable

    public func makeUIView(context: Context) -> WrapperAnimationView {
        WrapperAnimationView(animation: animation)
    }

    public func updateUIView(_ uiView: WrapperAnimationView, context: Context) {
        uiView.loopMode = loopMode
        if play {
            uiView.play { completed in
                if play {
                    self.play = !completed
                } else {
                    uiView.stop()
                }
            }
        }
    }
}

extension LottieView {
    /// Convenient initializer which sets `play` to `.constant(true)`.
    public init(name: String) {
        self.init(name: name, play: .constant(true))
    }
}
