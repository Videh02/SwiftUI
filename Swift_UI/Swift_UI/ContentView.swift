//
//  ContentView.swift
//  SWIFT_UI
//
//
//

import SwiftUI

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("I am Batman")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ContentView: View {
    let gradient = Gradient(colors: [.red, .accentColor, .blue])
    var body: some View {
        VStack {
            Image("batman")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
                .border(LinearGradient(gradient: gradient,
                                       startPoint: .zero,
                                       endPoint: .bottomTrailing), width: 3)
                .cornerRadius(16.0)
                .clipped()
                .overlay(ImageOverlay(), alignment: .bottom)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
