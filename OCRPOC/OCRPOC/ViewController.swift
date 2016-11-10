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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var updateProgressPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = recognizeTextFromImage(UIImage (named: "Lenore")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func activityIndicatorStartAnimating()
    {
        activityIndicator.startAnimating()
    }
    
    func activityIndicatorStopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    func recognizeTextFromImage(_ image : UIImage) -> String {
        
        if let tesseract = G8Tesseract(language: "eng"){
            tesseract.delegate = self
            tesseract.image = image.g8_blackAndWhite()
            tesseract.recognize()
            return tesseract.recognizedText
        }
        else
        {
            return "error"
        }
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        
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
