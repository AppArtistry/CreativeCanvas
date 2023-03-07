//
//  ProjectRowView.swift
//

import SwiftUI

struct ProjectRowView: View {
    var icon: String
    var title: String
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(icon)
                    .font(.system(size: 40))
                Text(title)
                    .font(.title)
                Spacer()
                Image(systemName: "capslock")
            }

            Text(subtitle)
                .font(.caption)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

struct ProjectRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRowView(icon: "x", title: "x", subtitle: "x")
    }
}
