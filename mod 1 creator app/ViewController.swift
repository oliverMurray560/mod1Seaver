//
//  ViewController.swift
//  mod 1 creator app
//
//  Created by OLIVER MURRAY on 9/7/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
var seaver = 1
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var compsOutlet: UITextField!
    
    @IBOutlet weak var atpsOutlet: UITextField!
    
    @IBOutlet weak var tdsOutlet: UITextField!
    
    @IBOutlet weak var intsOutlet: UITextField!
    
    
    @IBOutlet weak var ydsOutlet: UITextField!
    
    
    
    
    var player: AVAudioPlayer!
    
    var comps : Double?
    var atps : Double?
    var tds : Double?
    var ints : Double?
    var yds : Double?
    var qbr : Double = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ydsOutlet.delegate = self
        intsOutlet.delegate = self
        tdsOutlet.delegate = self
        atpsOutlet.delegate = self
        compsOutlet.delegate = self
        
    }

    
  
    
    
    
    @IBAction func calcAction(_ sender: Any) {
        
        comps = Double(compsOutlet.text!)
        if let c = comps{
            //labelOutlet.text = "\(c)"
            atps = Double(atpsOutlet.text!)
            if let a = atps{
            tds = Double(tdsOutlet.text!)
                if let t = tds{
            ints = Double(intsOutlet.text!)
                    if let i = ints{
            yds = Double(ydsOutlet.text!)
                        if let y = yds{
let p1 : Double = ((c/a - 0.3) * 5)
let p2 : Double = ((y/a - 3) * 0.25)
let p3 : Double = ((t/a) * 20)
let p4 : Double = (2.375 - (i/a * 25))
qbr = (((p1 + p2 + p3 + p4)/6)*100)
                            if qbr > 158.33
                            {
                                qbr = 158.33
                            }
                            else if qbr < 0
                            {
                                qbr = 0
                            }
            
            labelOutlet.text = "\(qbr)"
              
              //end of 5th if
                        }
                  else
                        {
                      labelOutlet.text = "Invalid yards"
                        }
                        
          //end of 4th if
        }
              else
                    {
                  labelOutlet.text = "Invalid Ints"
                    }
        //end of third if
               }
                else
                {
                labelOutlet.text = "Invalid TD's"
                }
                
                //end of second if
            }
            else
            {
                labelOutlet.text = "Invalid attempts"
            }
     //end of first if
        }
        else
        {
            labelOutlet.text = "Invalid completions"
        }
        
    }
    
      
    @IBAction func playbutton(_ sender: UIButton) {
        
        playSound()
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func playSound(){
        
        let url = Bundle.main.url(forResource: "cMusic", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
    
    
    

}

