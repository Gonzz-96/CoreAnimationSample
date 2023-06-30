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

//    func experiment() {
//        let myView = UIView()
//        let layer = myView.layer
//    }
}

