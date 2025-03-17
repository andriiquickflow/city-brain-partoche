import SwiftUI

extension View {
    
    var mainBackground: some View {
//        self.background(Color.background.ignoresSafeArea())
        self.background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
//        ZStack {
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
////                .edgesIgnoringSafeArea(.all)
//            
//            self // The actual view content
//        }
    }
    
    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
