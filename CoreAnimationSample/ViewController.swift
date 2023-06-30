//
//  ViewController.swift
//  CoreAnimationSample
//
//  Created by Erick Gonzalo Campos on 29/06/23.
//

import UIKit

class ViewController: UIViewController {

    var myView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))
        myView = UIView(frame: frame)
        myView.backgroundColor = .blue
        view.addSubview(myView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // namespace for Core Animation: CA
//        basicAnimation()
        springAnimation()
    }

//    func experiment() {
//        let myView = UIView()
//        let layer = myView.layer
//    }

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
