//
//  ViewController.swift
//  HackwichFive
//
//  Created by CM Student on 3/7/19.
//  Copyright © 2019 Naohiro Kiryu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue: Int = 0
    
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(Slider.value)
        
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        Slider.setThumbImage(thumbImageNormal, for: .normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderHasMoved(_ sender: Any) {
        
        print("The value of the slider is:\(Slider.value)")
        currentValue = lroundf(Slider.value)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        Slider.value = Float(currentValue)
        
    updateTargetLabel()
    }
    
    func updateTargetLabel(){
        
        targetLabel.text = String(targetValue)
        
    }
    
    @IBAction func myGuessButtonPressed(_ sender: Any) {
    
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
}

