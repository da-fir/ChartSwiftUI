//
//  ChartGroupView.swift
//  SpeakBuddy
//
//  Created by Darul Firmansyah on 27/12/24.
//
import SwiftUI

struct ChartGroupView: View {
    @State var geo: GeometryProxy
    var chartData: [ChartData]

    var body: some View {
        HStack(spacing: geo.size.width * 0.06) {
            ForEach(chartData, id: \.label) { data in // loop data and render ChartView
                ChartView(chartData: data)
            }
        }
        .clipShape(
            .rect()
        )
        .overlay(alignment: .topLeading) {
            Image(uiImage: UIImage(named: "protty")!) // Image ratio based on screen width
                .resizable()
                .frame(width: geo.size.width * 0.39, height: geo.size.width * 0.39)
                .padding(.top, -(geo.size.width * 0.05))
                .padding(.leading, -(geo.size.width * 0.11))
        }
        .frame(maxWidth: .infinity)
    }
}
