//
//  BezierVC.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 15/05/26.
//

import UIKit

class BezierVC: UIViewController {

    
    var shape: CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shape?.removeFromSuperlayer()
//        drawSquare()
        drawAryan()
    }
    
    private func drawSquare(){
        shape = CAShapeLayer()
        shape!.fillColor = UIColor.white.cgColor
        shape!.lineWidth = 5
        shape!.strokeColor = UIColor.black.cgColor
        shape!.position = CGPoint(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 50)
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addCurve(to: CGPoint(x: 0, y: 100), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 75, y: 100))
        path.addLine(to: .zero)
        path.close()
        
        shape!.path = path.cgPath
        view.layer.addSublayer(shape!)
    }
    
    private func drawAryan(){
        shape = CAShapeLayer()
        shape?.position = .zero
        shape?.strokeColor = UIColor.black.cgColor
        shape?.lineWidth = 5
        shape?.fillColor = nil
        shape?.position = CGPoint(x: -100, y: 0)
        
        let namePath = UIBezierPath()
        
        // MARK: A
        namePath.move(to: CGPoint(x: 100, y: 250))
        namePath.addLine(to: CGPoint(x: 130, y: 150))
        namePath.addLine(to: CGPoint(x: 160, y: 250))
        namePath.move(to: CGPoint(x: 110, y: 210))
        namePath.addLine(to: CGPoint(x: 150, y: 210))        
        
        // MARK: B
        namePath.move(to: CGPoint(x: 200, y: 250))
        namePath.addLine(to: CGPoint(x: 200, y: 150))
        namePath.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 250, y: 130), controlPoint2: CGPoint(x: 250, y: 230))
        namePath.move(to: CGPoint(x: 200, y: 200))
        namePath.addLine(to: CGPoint(x: 240, y: 250))
        
        // MARK: Y
        namePath.move(to: CGPoint(x: 270, y: 150))
        namePath.addLine(to: CGPoint(x: 300, y: 200))
        namePath.addLine(to: CGPoint(x: 300, y: 250))
        namePath.move(to: CGPoint(x: 330, y: 150))
        namePath.addLine(to: CGPoint(x: 300, y: 200))

        // MARK: A
        namePath.move(to: CGPoint(x: 350, y: 250))
        namePath.addLine(to: CGPoint(x: 380, y: 150))
        namePath.addLine(to: CGPoint(x: 410, y: 250))
        namePath.move(to: CGPoint(x: 360, y: 210))
        namePath.addLine(to: CGPoint(x: 400, y: 210))
        
        // MARK: N
        namePath.move(to: CGPoint(x: 430, y: 250))
        namePath.addLine(to: CGPoint(x: 430, y: 150))
        namePath.addLine(to: CGPoint(x: 490, y: 250))
        namePath.addLine(to: CGPoint(x: 490, y: 150))
        
        shape!.path = namePath.cgPath
        
        view.layer.addSublayer(shape!)
    }
    
    
    
}

#Preview {
    BezierVC()
}
