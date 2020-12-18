//
//  ViewController.swift
//  PinchToZoomGesture
//
//  Created by Hamza Mustafa on 18/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let pinchGesture = UIPinchGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.image = #imageLiteral(resourceName: "bgImg")
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        
        imageView.center = view.center
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.addGestureRecognizer(pinchGesture)
        pinchGesture.addTarget(self, action: #selector(tappedPinch))
    }

    @objc func tappedPinch() {
        guard let gestureView = pinchGesture.view else {
            return
        }
        gestureView.transform = gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
        
        if pinchGesture.state == .began {
            print("zooming began")
        }
        
        if pinchGesture.state == .changed {
            print("Pinching is a continuous gesture.")
        }
        
        if pinchGesture.state == .ended {
            UIView.animate(withDuration: 0.2) {
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
