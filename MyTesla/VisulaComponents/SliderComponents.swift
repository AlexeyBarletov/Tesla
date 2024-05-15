//
//  SliderComponents.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import SwiftUI

struct BidirectionalSlider: View {
    
    @State private var value: Double = 0
    private let minValue: Double = -50
    private let maxValue: Double = 50
    private let thumbRadius: CGFloat = 12
    
    var body: some View {
            
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                //--Track
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.colorSliderLong.opacity(1))
                    .frame(width: geometry.size.width, height: 4)
                
                //--Image as Thumb
                Image(.tumb)
                    .offset(y: 8)
                    .frame(width: thumbRadius * 2)
                    .offset(x: CGFloat((maxValue + value)/(maxValue - minValue)) * geometry.size.width - thumbRadius)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ gesture in
                                updateValue(with: gesture, in: geometry)
                            })
                    )
            }
        }
        .frame(height: 100)
        .padding()
        
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let dragPortion = gesture.location.x / geometry.size.width
        let newValue = Double((maxValue - minValue) * dragPortion) - maxValue
        value = min(max(newValue,minValue),maxValue)
    }
}
#Preview {
    BidirectionalSlider()
        .environment(\.colorScheme, .dark)
}
