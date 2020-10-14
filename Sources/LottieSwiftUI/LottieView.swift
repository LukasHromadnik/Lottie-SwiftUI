import SwiftUI
import Lottie

/// SwiftUI wrapper around `Lottie.AnimationView`
public struct LottieView: UIViewRepresentable {
    
    /// Name of the animation
    let name: String
    
    /// Flag if the animation should be played
    @Binding var play: Bool
    
    /// Loop mode of the animation provided by the `@Environment`
    ///
    /// You can set this property using `lottieLoopMode` method on `View`
    @Environment(\.lottieLoopMode) var loopMode: LottieLoopMode

    public init(name: String, play: Binding<Bool>) {
        self.name = name
        self._play = play
    }

    // MARK: - UIViewRepresentable

    public func makeUIView(context: Context) -> AnimationView {
        AnimationView(animation: .named(name))
    }

    public func updateUIView(_ uiView: AnimationView, context: Context) {
        uiView.loopMode = loopMode
        if play {
            uiView.play { completed in
                self.play = !completed
            }
        } else {
            uiView.stop()
            play = false
        }
    }
}

extension LottieView {
    /// Convenient initializer which sets `play` to `.constant(true)`.
    public init(name: String) {
        self.init(name: name, play: .constant(true))
    }
}
