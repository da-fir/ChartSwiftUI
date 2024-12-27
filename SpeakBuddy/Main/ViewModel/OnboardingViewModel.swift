//
//  OnboardingViewModel.swift
//  SpeakBuddy
//
//  Created by Darul Firmansyah on 27/12/24.
//
import SwiftUI

final class OnboardingViewModel: ObservableObject {
    let title: String = "Hello\nSpeakBuddy"
    let info1: String = "スピークバディで"
    let info2: String = "レベルアップ"
    let buttonTitle: String = "プランに登録する"
    
    @Published var chartData: [ChartData] = OnboardingChartGenerator.chartData
}
