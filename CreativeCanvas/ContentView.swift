//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @State private var activeSheet: ActiveSheet?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ProjectRowView(
                        icon: "🌈",
                        title: "Beachball Loading",
                        subtitle: "Apple's notorious beach ball loading animation."
                    )
                    .onTapGesture {
                        activeSheet = .rainbowLoading
                    }

                    ProjectRowView(
                        icon: "🤸‍♀️",
                        title: "Retro Flip Stepper",
                        subtitle: "Aesthetic retro style flip stepper!"
                    )
                    .onTapGesture {
                        activeSheet = .retroFlipStepper
                    }

                    ProjectRowView(
                        icon: "🦇",
                        title: "Batman",
                        subtitle: "Lightbar, batman logo and blend animation"
                    )
                    .onTapGesture {
                        activeSheet = .batman
                    }

                    ProjectRowView(
                        icon: "🔘",
                        title: "Twist Text Toggle",
                        subtitle: "Toggle button with twist text animation."
                    )
                    .onTapGesture {
                        activeSheet = .onOffToggle
                    }

                    ProjectRowView(
                        icon: "💻",
                        title: "Progess Step",
                        subtitle: "3 Step progress indicator."
                    )
                    .onTapGesture {
                        activeSheet = .progressStep
                    }

                    ProjectRowView(
                        icon: "🎙️",
                        title: "Podcast",
                        subtitle: "Podcast details view with time animation."
                    )
                    .onTapGesture {
                        activeSheet = .podcast
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
                    FlipStepperView()
                        .preferredColorScheme(.dark)
                case .batman:
                    BatmanView()
                case .retroFlipStepper:
                    FlipStepperView()
                        .preferredColorScheme(.dark)
                case .onOffToggle:
                    Text("Work in progress")
//                    OnOffToggleView()
//                        .preferredColorScheme(.dark)
                case .progressStep:
                    Text("Work in progress")
//                    ProgressStepView()
//                        .preferredColorScheme(.dark)
                case .podcast:
                    Text("Work in progress")
//                    PodcastView()
//                        .preferredColorScheme(.dark)
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
