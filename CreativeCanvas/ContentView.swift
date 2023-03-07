//
//  ContentView.swift
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case rainbowLoading, batman
    var id: ActiveSheet { self }
}


struct ContentView: View {
    @State private var activeSheet: ActiveSheet?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ProjectRowView(
                        icon: "🌈",
                        title: "Loading...",
                        subtitle: "Apple's notorious beach ball loading animation."
                    )
                    .onTapGesture {
                        activeSheet = .rainbowLoading
                    }

                }
                .padding(20)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
            .navigationTitle("CreativeCanvas")
            .sheet(item: $activeSheet) { sheet in
                switch sheet {
                case .rainbowLoading:
                    RainbowLoadingView()
                        .preferredColorScheme(.dark)
                case .batman:
                    Text("Work in progress")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
