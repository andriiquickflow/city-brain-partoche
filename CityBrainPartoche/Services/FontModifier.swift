import SwiftUI
import UIKit

struct FontModifier: ViewModifier {
    
    let fontModel: FontModel

    func body(content: Content) -> some View {
        content
            .font(SwiftUI.Font(fontModel.font))
            .lineSpacing(3)
    }
}

extension View {
    
    func fontSystem(_ fontModel: FontModel) -> some View {
        modifier(FontModifier(fontModel: fontModel))
    }
}

struct FontModel {
    
    let font: UIFont
    
    fileprivate init(font: UIFont) {
        self.font = font
    }
}

extension FontModel {

    static let title: FontModel = .init(font: UIFont(name: "Lato-Bold", size: 16)!)
    static let accent: FontModel = .init(font: UIFont(name: "Lato-Bold", size: 15)!)
    static let text: FontModel = .init(font: UIFont(name: "Lato-Regular", size: 15)!)
    static let subtext: FontModel = .init(font: UIFont(name: "Lato-Regular", size: 13)!)
}
