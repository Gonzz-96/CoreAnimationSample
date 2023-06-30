//
//  ViewController.swift
//  CoreAnimationSample
//
//  Created by Erick Gonzalo Campos on 29/06/23.
//

import UIKit

class ViewController: UIViewController {

    var myView: UIView!
    var shapeLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        self.shapeLayer = shapeLayer
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let path = UIBezierPath()
        path.move(to: view.center)
        path.addCurve(to: view.center,
                      controlPoint1: CGPoint(x: view.center.x + 150, y: view.center.y + 150),
                      controlPoint2: CGPoint(x: view.center.x - 150, y: view.center.y + 150))
        path.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.path = path.cgPath
    }

    private func springAnimation() {
        // spring == curves
        let jump = CASpringAnimation(keyPath: "transform.scale")
        jump.damping = 10
        jump.mass = 1
        jump.initialVelocity = 100
        jump.stiffness = 1500.0

        jump.fromValue = 1.0
        jump.toValue = 2.0
        jump.duration = jump.settlingDuration
        myView.layer.add(jump, forKey: nil)
    }


    private func basicAnimation() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = CGPoint.zero
        animation.toValue = view.bounds.size.width
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime() + 0.4
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.delegate = self
        myView.layer.add(animation, forKey: nil)
    }

}

extension ViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("Animation did start")
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Animation did stop")
    }
}
