//
//  SecondVC.swift
//  PinchToZoomGesture
//
//  Created by Hamza Mustafa on 18/12/2020.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        guard let gestureView = pinchGesture.view else {
            return
        }
        gestureView.transform = gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
    }
}
