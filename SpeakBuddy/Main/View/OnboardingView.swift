//
//  OnboardingView.swift
//  SpeakBuddy
//
//  Created by Darul Firmansyah on 27/12/24.
//

import SwiftUI

struct OnboardingView: View {
    let isBigScreenDevice = UIDevice.current.userInterfaceIdiom == .pad // determine device type
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        GeometryReader { geo in // using geoproxy to determine possible space
            VStack(spacing: 20) {
                Text(viewModel.title)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: isBigScreenDevice ? 54 : 36, weight: .bold))
                    .padding(.horizontal, 16)
                    .padding(.top, geo.size.width * 0.148) // top margin based on screen ratio
                    .multilineTextAlignment(.center)
                
                ChartGroupView(geo: geo, chartData: viewModel.chartData)
                    .padding(.horizontal, geo.size.width * 0.15)
                    .padding(.top, geo.size.height * 0.05)
                
                VStack {
                    VStack {
                        Text(viewModel.info1)
                            .font(.system(size: isBigScreenDevice ? 30 : 20, weight: .medium))
                        Text(viewModel.info2)
                            .font(.system(size: isBigScreenDevice ? 45 : 30, weight: .semibold))
                            .foregroundStyle(
                                LinearGradient(gradient: Gradient(colors: [
                                    Color(hex: "#1F8FFF"),
                                    Color(hex: "#58C0FF")
                                ]), startPoint: .bottom, endPoint: .top)
                            )
                    }
                    
                    Button() {
                    } label: {
                        Text(viewModel.buttonTitle)
                            .font(.system(size: isBigScreenDevice ? 24 : 16 , weight: .medium))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                        
                    }
                    .padding()
                    .background(Color(hex: "#3BA7FF"))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(.white, lineWidth: 2)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .frame(maxHeight: .infinity)
                .frame(maxHeight: geo.size.height * 0.189)
                .frame(maxWidth: 350) // prevent button to over width
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [
                    Color(hex: "#D5D2FF"),
                    Color.white
                ]), startPoint: .top, endPoint: .bottom)
            )
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    // no op
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: isBigScreenDevice ? 30 : 20, weight: .bold))
                        .foregroundColor(.black)
                        .padding(12)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .padding()
            }
        }
    }
}
