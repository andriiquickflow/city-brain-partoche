import SwiftUI
import Combine

struct FullScreenAutoLoaderModifier: ViewModifier {
    
    private enum Step {
        
        case none
        case loading1
        case loading2
    }
    
    @State private var isLoading: Bool = true
    @State private var step: Step = .none
    
    var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isLoading {
                switch step {
                case .none:
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        Text(appName)
                            .fontSystem(.title)
                            .foregroundColor(.accent)
                            .padding(.horizontal, 20)
                        
                        LoadingThreeBallsTriangle(color: .accent)
                    }
                case .loading1:
                    Image("loader1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                case .loading2:
                    Image("loader2")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    LoadingThreeBallsTriangle(color: .accent)
                }
            }
        }
        .onAppear {
            if step == .none {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isLoading = false
                    }
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    step = .loading2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
            }
        }
    }
}

struct LoadingThreeBallsTriangle: View {
    
    @State var isAnimating: Bool = false
    let timing: Double
    
    let maxCounter = 3
    
    let frame: CGSize = .init(width: 70, height: 70)
    let primaryColor: Color
    
    init(color: Color) {
        timing = 1
        primaryColor = color
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: 0,
                    y: isAnimating ? -frame.height / 3 : 0)

            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? -frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)

            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)
        }
        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: false))
        .onAppear {
            isAnimating = true
        }
    }
}

fileprivate struct LoadingFiveLinesPulse: View {
    
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double
    
    let maxCounter: Int = 5
    @State var counter = 0
    
    let frame: CGSize = .init(width: 70, height: 70)
    let primaryColor: Color
    
    init(color: Color) {
        timing = 0.25
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        primaryColor = color
    }
    
    var body: some View {
        HStack(spacing: frame.width / 10) {
            ForEach(0..<maxCounter) { index in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(primaryColor)
                    .frame(maxHeight:
                            (index == 2) && (counter == 0) ? .infinity :
                            (index == 1 || index == 3) && (counter == 1) ? .infinity :
                            (index == 0 || index == 4) && (counter == 2) ? .infinity :
                            frame.height / 2
                    )
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onReceive(timer, perform: { _ in
            withAnimation(Animation.easeOut(duration: timing)) {
                counter = counter == 3 ? 0 : counter + 1
            }
        })
    }
}

extension View {
    
    func fullScreenAutoLoader() -> some View {
        self.modifier(FullScreenAutoLoaderModifier())
    }
}
