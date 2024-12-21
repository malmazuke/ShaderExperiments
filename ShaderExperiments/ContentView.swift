import SwiftUI

enum ShaderMenuItem: Identifiable, CaseIterable {

    case passthrough
    case recolour
    case invertAlpha
    case gradient
    case rainbow

    var id: String { title }

    var title: String {
        switch self {
        case .passthrough: return "Passthrough"
        case .recolour: return "Recolour"
        case .invertAlpha: return "Invert Alpha"
        case .gradient: return "Gradient"
        case .rainbow: return "Rainbow"
        }
    }

    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .passthrough: PassthroughView()
        case .recolour: RecolourView()
        case .invertAlpha: InvertAlphaView()
        case .gradient: GradientView()
        case .rainbow: RainbowView()
        }
    }

}

struct ContentView: View {

    var shaderItems = ShaderMenuItem.allCases

    var body: some View {
        NavigationView {
            List {
                ForEach(shaderItems) { item in
                    NavigationLink(destination: item.destinationView) { Text(item.title) }
                }
            }
            .navigationTitle("Shader Experiments")
        }
    }

}

#Preview {
    ContentView()
}
