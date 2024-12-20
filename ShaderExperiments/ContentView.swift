//
//  ContentView.swift
//  ShaderExperiments
//
//  Created by Mark Feaver on 21/12/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var start = Date.now

    var body: some View {
        TimelineView(.animation) { context in

            let time = start.distance(to: context.date)

            Image(systemName: "heart.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .foregroundStyle(.tint)
                .colorEffect(
                    ShaderLibrary.rainbow(
                        .float(time)
                    )
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
