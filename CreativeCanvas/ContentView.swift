//
//  ContentView.swift
//  CreativeCanvas
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    RainbowLoadingView()
                } label: {
                    Text("🌈 Loading...")
                }

            }
            .navigationTitle("CreativeCanvas")
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
