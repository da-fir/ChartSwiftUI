//
//  ChartView.swift
//  SpeakBuddy
//
//  Created by Darul Firmansyah on 27/12/24.
//

import SwiftUI

struct ChartView: View {
    @State var value: Double = 0
    let isBigScreenDevice = UIDevice.current.userInterfaceIdiom == .pad // determine device type
    let chartData: ChartData
    
    var body: some View {
        VStack {
            Color.clear
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background {
                    GeometryReader { proxy in // the objectice is to get available space for chart
                        Color.white.opacity(0.01)
                        LinearGradient(gradient: Gradient(colors: [
                            Color(hex: "#1F8FFF"),
                            Color(hex: "#58C0FF")
                        ]), startPoint: .bottom, endPoint: .top)
                        .offset(x: .zero, y: proxy.size.height * (1 - value)) // calculate based on available space
                    }
                    
                }
                .animation(Animation.interactiveSpring(duration: 0.65), value: value)
                .clipped()
                .onAppear {
                    value = chartData.value // only set value on appear to show animation upon present
                }
            
            Text(chartData.label)
                .font(.system(size: isBigScreenDevice ? 18 : 12, weight: .medium))
        }
    }
}
