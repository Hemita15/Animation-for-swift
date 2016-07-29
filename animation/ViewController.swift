//
//  ViewController.swift
//  animation
//
//  Created by Hemita Pathak on 15/07/16.
//  Copyright © 2016 InformationWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
  /*  override func viewWillAppear(animated: Bool) {
        let fish = UIImageView()
        let fullRotation = CGAffineTransform()
        fish.image = UIImage(named: "bluefish.jpg")
        fish.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        fish.transform = CGAffineTransformRotate(fullRotation, 180)
        self.view.addSubview(fish)
        
        
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations: {self.fish.transform = CGAffineTransformMakeRotation(fullRotation)}, completion: nil)
        
       /*
        
        UIView.animateWithDuration(1.0, animations: {
            // animating `transform` allows us to change 2D geometry of the object
            // like `scale`, `rotation` or `translate`
            self.fish.transform = CGAffineTransformMakeRotation(fullRotation) }) */
    } */
    
    override func viewWillAppear(animated: Bool) {
    
        for i in 0...3 {
        
    let fish = UIImageView()
    fish.image = UIImage(named: "bluefish.png")
    fish.frame = CGRect(x: 55, y: 300, width: 50, height: 50)
    self.view.addSubview(fish)
    
    // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
   // let fullRotation = CGFloat(M_PI * 2)
     
    
    UIView.animateWithDuration(1.0, animations: {
    // animating `transform` allows us to change 2D geometry of the object
    // like `scale`, `rotation` or `translate`
    fish.transform = CGAffineTransformMakeRotation(360)
    })
        
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
            
          //  let options = UIViewAnimationOptions.CurveLinear
            
            // define the animation
          //  UIView.animateWithDuration(duration, delay: delay, options: options, animations: { fish.transform = CGAffineTransformMakeRotation(1/3 * 360)} , completion: nil)
        
        
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                fish.transform = CGAffineTransformMakeRotation(1/3 * 360)
            })
           UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
                fish.transform = CGAffineTransformMakeRotation(2/3 * 0)
            })
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                fish.transform = CGAffineTransformMakeRotation(3/3 * 0)
            })
            
            }, completion: {finished in
                // any code entered here will be applied
                // once the animation has completed
                
        }) 
        
        // randomly create a value between 0.0 and 150.0
        let randomYOffset = CGFloat( arc4random_uniform(150))
        
        // for every y-value on the bezier curve
        // add our random y offset so that each individual animation
        // will appear at a different y-position
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
        path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset),controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
        path.addQuadCurveToPoint(CGPoint(x: 550, y: 519 + randomYOffset), controlPoint: CGPoint(x: 336, y: 493 + randomYOffset))
       // path.addLineToPoint(CGPoint(x: 290 , y: 340 + randomYOffset))
            
        
        
        // create the animation
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.CGPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        //Add the animation
        fish.layer.addAnimation(anim, forKey: "animate position along path")
            
        // each square will take between 4.0 and 8.0 seconds to complete one animation loop
        anim.duration = Double(arc4random_uniform(40)+30) / 10
            
        // stagger each animation by a random value
    
       anim.timeOffset = Double(arc4random_uniform(464
        ))
    
    }
    
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

