import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .foregroundStyle(.tint)
                .colorEffect(
                    ShaderLibrary.gradient()
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
