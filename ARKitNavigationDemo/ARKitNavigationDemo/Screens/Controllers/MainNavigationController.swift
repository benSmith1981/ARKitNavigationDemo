//
//  TEstCoordinatorViewController.swift
//  ARKitNavigationDemo
//
//  Created by Ben Smith on 17/11/2017.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class TEstCoordinatorViewController: UIViewController {

    
    @IBOutlet weak var flightNumberoutlet: UITextField!
    @IBOutlet weak var flightDateoutlet: UITextField!
    @IBOutlet var addItemView : UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var progressView: UIProgressView?
    var progressLabel: UILabel?
    var effect: UIVisualEffect!
    var timer: Timer!
    let rect = CGRect(
        origin: CGPoint(x: -25, y: -100),
        size: UIScreen.main.bounds.size
    )
    
    
    override func viewDidAppear(_ _animated: Bool) {
        super.viewDidAppear(_animated)
        effect = visualEffectView.effect
        visualEffectView.effect = nil

        addItemView.layer.cornerRadius = 5
        self.animeteBlurIn()
   
    }
 
    
    @IBAction func didPressFlight(_ sender: Any) {
        animateBlurout()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animeteBlurIn() {
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
    }
    
    func animateBlurout() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            self.visualEffectView.effect = nil
        }) { (succes:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
}