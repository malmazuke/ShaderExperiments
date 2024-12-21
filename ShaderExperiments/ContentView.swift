import SwiftUI

enum ShaderMenuItem: Identifiable, CaseIterable {

    enum ShaderEffectType: String, Identifiable, CaseIterable {
        case colour = "Colour"
        case distortion = "Distortion"

        var id: String { rawValue }
    }

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

    var shaderEffectType: ShaderEffectType {
        switch self {
        case .passthrough: return .colour
        case .recolour: return .colour
        case .invertAlpha: return .colour
        case .gradient: return .colour
        case .rainbow: return .colour
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
                ForEach(ShaderMenuItem.ShaderEffectType.allCases) { type in
                    Section(header: Text(type.rawValue)) {
                        ForEach(shaderItems.filter { $0.shaderEffectType == type }) { item in
                            NavigationLink(destination: item.destinationView) { Text(item.title) }
                        }
                    }
                }
            }
            .navigationTitle("Shader Experiments")
        }
    }

}

#Preview {
    ContentView()
}
