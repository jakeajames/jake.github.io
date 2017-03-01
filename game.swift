//
//  ViewController.swift
//  TTT
//
//  Created by jakea james on 8/23/16.
//  Copyright © 2016 jakea james. All rights reserved.
//

import UIKit

var score = 0;
var storet = "";
class ViewController: UIViewController  {
    
    @IBOutlet weak var store: UIButton!
    
   
    @IBAction func c(_ sender: Any) {
        if(score >= 20) {
            score += 80;
    }
        else {
            
            let alert = UIAlertController(title: "Store", message: "You don't have enough clicks! Get 20 clicks first", preferredStyle: UIAlertControllerStyle.alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            

        }
    }
    @IBAction func cc(_ sender: Any) {
        if(score >= 50) {
            score += 150;
        }
        else {
            
            let alert = UIAlertController(title: "Store", message: "You don't have enough clicks! Get 50 clicks first", preferredStyle: UIAlertControllerStyle.alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }

    }
    @IBAction func ac(_ sender: Any) {
        
        if(score >= 200) {
            score += 850;
        }
        else {
            
            let alert = UIAlertController(title: "Store", message: "You don't have enough clicks! Get 200 clicks first", preferredStyle: UIAlertControllerStyle.alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        

        
    }
    @IBAction func showscore(_ sender: Any) {
 
        let alert = UIAlertController(title: "Score", message: "Your score is: \(score)", preferredStyle: UIAlertControllerStyle.alert)
        
       
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Reset", style: UIAlertActionStyle.cancel, handler: { action in
            score = 0;
        
        }))
        
        
       
        self.present(alert, animated: true, completion: nil)
            }
    @IBAction func clickme(_ sender: Any) {
        score += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://raw.githubusercontent.com/jakeajames/iApps4YOU/master/store.json"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    storet = parsedData["doit"] as! String
                    print(storet)
                   
                    
                } catch let error as NSError {
                   
                }
            }
            
            }.resume()
        
        if (storet == "yes") {
            print(storet)
            store.isHidden = false;
            
        }
    }
    
    
    
      
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   }
