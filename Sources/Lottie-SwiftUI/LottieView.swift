import SwiftUI
import Lottie

/// SwiftUI wrapper around `Lottie.AnimationView`
public struct LottieView: UIViewRepresentable {
    
    /// Name of the animation
    public let name: String
    
    /// Flag if the animation should be played
    @Binding public var play: Bool
    
    /// Loop mode of the animation provided by the `@Environment`
    ///
    /// You can set this property using `lottieLoopMode` method on `View`
    @Environment(\.lottieLoopMode) private var loopMode: LottieLoopMode

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
