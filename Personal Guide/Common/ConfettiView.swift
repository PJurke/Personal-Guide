//
//  ConfettiView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.12.25.
//

import SwiftUI
import UIKit

struct ConfettiView: UIViewRepresentable {
    @Binding var counter: Int
    
    func makeUIView(context: Context) -> ConfettiUIView {
        return ConfettiUIView()
    }

    func updateUIView(_ uiView: ConfettiUIView, context: Context) {
        if counter > context.coordinator.lastCounter {
            context.coordinator.lastCounter = counter
            uiView.emit(with: context.coordinator.colors)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: ConfettiView
        var colors: [UIColor] = [.red, .blue, .green, .yellow, .purple, .orange, .cyan]
        var lastCounter: Int = 0
        
        init(_ parent: ConfettiView) {
            self.parent = parent
        }
    }
}

class ConfettiUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // No layoutSubviews needed as we position ephemeral layers on creation

    func emit(with colors: [UIColor]) {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: frame.size.width / 2, y: -50)
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
        emitter.emitterShape = .line
        emitter.birthRate = 1 // Active immediately
        
        let cells: [CAEmitterCell] = colors.compactMap { color in
            let cell = CAEmitterCell()
            cell.scale = 0.1
            cell.scaleRange = 0.2
            cell.emissionRange = .pi * 2
            cell.lifetime = 5.0
            cell.birthRate = 10 
            cell.velocity = 200
            cell.velocityRange = 50
            cell.yAcceleration = 250
            cell.spin = 2
            cell.spinRange = 3
            cell.color = color.cgColor
            cell.contents = createParticleImage().cgImage
            return cell
        }
        
        emitter.emitterCells = cells
        layer.addSublayer(emitter)
        
        // Stop emitting new particles after a short duration
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            emitter.birthRate = 0
        }
        
        // Remove the layer after all particles have effectively died (lifetime + buffer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            emitter.removeFromSuperlayer()
        }
    }
    
    private func createParticleImage() -> UIImage {
        let size = CGSize(width: 10, height: 10)
        let rect = CGRect(origin: .zero, size: size)
        
        return UIGraphicsImageRenderer(size: size).image { context in
            context.cgContext.setFillColor(UIColor.white.cgColor)
            context.cgContext.fill(rect)
        }
    }
}
