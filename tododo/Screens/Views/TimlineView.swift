//
//  TimlineView.swift
//  tododo
//
//  Created by Sandesh Naik on 24/05/26.
//

import SwiftUI

struct TimlineView: View {
    private let steps = ["Plan", "Focus", "Test", "Done"]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, title in
                HStack(alignment: .top, spacing: 12) {
                    VStack(spacing: 0) {
                        Image(systemName: index == steps.count - 1 ? "checkmark.circle.fill" : "circle.fill")
                            .foregroundStyle(index == steps.count - 1 ? .green : .secondary)

                        if index < steps.count - 1 {
                            Rectangle()
                                .fill(.secondary.opacity(0.3))
                                .frame(width: 2)
                        }
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("9:00 AM")
                            .font(.custom("Geist", size: 14, relativeTo: .body))
                            .foregroundStyle(.secondary)
                        
                        Text("Design Review")
                            .font(.custom("Bricolage Grotesque", size: 22, relativeTo: .headline))
                            .foregroundStyle(.primary)
                        
                        Text("Project: Indie App")
                            .font(.custom("Geist", size: 16, relativeTo: .body))
                            .foregroundStyle(.secondary)
                        
                    }
                    .padding(.bottom, 44)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ScrollView {
        TimlineView()
    }
    //.frame(height: 400)
}
