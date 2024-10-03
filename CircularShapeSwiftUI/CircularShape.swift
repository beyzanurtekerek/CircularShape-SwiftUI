//
//  CircularShape.swift
//  CircularShapeSwiftUI
//
//  Created by Beyza Nur Tekerek on 4.10.2024.
//

import SwiftUI
import Foundation

struct CircularShape: Shape { // shape bir protocol

    var percent : Double
    var startAngle : Double
    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }

    
    init(percent: Double = 100, startAngle: Double = -90) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    static func percentToAngle(percent: Double, startAngle:Double) -> Double {
        return (percent / 100 * 360 + startAngle)
    }
        
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Self.percentToAngle(percent: percent, startAngle: startAngle)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
   
}

