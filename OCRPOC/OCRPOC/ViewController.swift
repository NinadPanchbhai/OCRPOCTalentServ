//
//  ViewController.swift
//  OCRPOC
//
//  Created by Talenserv Mac on 11/9/16.
//  Copyright © 2016 Talenserv Mac. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController , G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseract = G8Tesseract(language: "eng"){
            tesseract.delegate = self
            tesseract.image = UIImage (named: "Lenore")?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tesseract delegate methods 
    
    func progressImageRecognitionForTesseract(tesseract: G8Tesseract!) {
        print("Image Recognition Progress :: \(tesseract.progress) %")
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
