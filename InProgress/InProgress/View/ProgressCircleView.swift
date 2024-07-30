//
//  ProgressCircleView.swift
//  InProgress
//
//  Created by Joshua Madrigal on 7/30/24.
//

import SwiftUI

struct ProgressCircleView: View {
    
    @Binding var progress: Int
    
    var goal: Int
    var color: Color
    private let width: CGFloat = 20
    
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)
            Circle()
                .trim(from: 0, to: progressByGoal(progressIn: progress, goalIn: goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
    
    func progressByGoal(progressIn: Int, goalIn: Int) -> CGFloat {
        return CGFloat(progressIn) / CGFloat(goalIn)
    }
}

#Preview {
    ProgressCircleView(progress: .constant(100), goal: 200, color: .red)
}
