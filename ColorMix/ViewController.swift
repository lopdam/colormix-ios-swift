//
//  ViewController.swift
//  ColorMix
//
//  Created by bigsur on 22/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    // Switchs
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    
    // Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // Values
    var red:CGFloat = 255.0
    var green:CGFloat=255.0
    var blue:CGFloat=255.0
    
    //Events Handler
    @IBAction func switchChanged(_ sender: UISwitch) {
        
        updateControls()
        updateColor()
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        updateColor()
        
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        red=255.0
        green=255.0
        blue=255.0

        redSwitch.isOn=false
        greenSwitch.isOn=false
        blueSwitch.isOn=false
        
        redSlider.value=255
        greenSlider.value=255
        blueSlider.value=255
        
        let color=UIColor(red:red,green: green,blue: blue,alpha: 1);
        
        colorView.backgroundColor=color
        
        updateControls()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth=5
        colorView.layer.cornerRadius=20
        colorView.layer.borderColor=UIColor.black.cgColor
        updateControls()
    }
    
    func updateColor(){
        
        if(redSwitch.isOn){

            red=CGFloat(redSlider.value)
        }
        
        if(greenSwitch.isOn){
            
            green=CGFloat(greenSlider.value)
        }
        
        if (blueSwitch.isOn) {
            
            blue=CGFloat(blueSlider.value)
        }
        
        
        let color=UIColor(red:red,green: green,blue: blue,alpha: 1);
        colorView.backgroundColor=color
        
    }
    
    func updateControls(){
        redSlider.isEnabled=redSwitch.isOn
        greenSlider.isEnabled=greenSwitch.isOn
        blueSlider.isEnabled=blueSwitch.isOn
    }
    
    func onCheck(_ slider:UISlider,_ color:String){
        slider.isEnabled=true
        
        switch color {
        case "red":
            red=CGFloat(redSlider.value)
        case "green":
            green=CGFloat(greenSlider.value)
        case "blue":
            blue=CGFloat(blueSlider.value)
        default:
            ()
        }
        
    }
   
}
