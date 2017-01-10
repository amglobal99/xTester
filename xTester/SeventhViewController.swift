//
//  SeventhViewController.swift
//  xTester
//
//  Created by Dad on 10/7/16.
//  Copyright © 2016 Natsys. All rights reserved.
//




import UIKit
//import PSOperations


let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg",
                 "http://www.fujifilm.com/products/digital_cameras/x/fujifilm_x_t1/sample_images/img/index/ff_x_t1_003.JPG"
]


/// Class used to download Image from URL
class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage? {
      if let data = try? Data(contentsOf: URL(string: url)!)   {
        return UIImage(data: data)
      } else {
        return nil
      }
      
    } // end func
  
}




class SeventhViewController: UIViewController {
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    // Create a new queue
    var queue = OperationQueue()
    var queue2 = OperationQueue()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    ///   This function uses BlockOperation ( subclass of Operation)
  
    @IBAction func didClickOnStart(_ sender: AnyObject) {
      
      self.imageView1.image = nil
      self.imageView2.image = nil
      self.imageView3.image = nil
      self.imageView4.image = nil
      
      
        // To make this a serial queue, enable line below
        //queue.maxConcurrentOperationCount = 1
      
              
      // Second Operation
      let operation2 = BlockOperation() {
        print("Started operation 2. Executing on: \(Thread.current)")
        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
        OperationQueue.main.addOperation(){
          self.imageView2.image = img2
        }
        //print("Operation 2. Finished operation tasks.")
      }
      
      operation2.completionBlock = {
        print("     Operation 2 completion handler. Thread: \(Thread.current) ")
      }
      queue.addOperation(operation2)
      
      
      
    
      // Create First operation
      let operation1 = BlockOperation() {
        print("Started operation 1. Executing on: \(Thread.current)")
        GlobalFunctions.printCompanyName(str: "        Running a function outside this file.")
        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
        OperationQueue.main.addOperation(){
          self.imageView1.image = img1
        }
        //print("Operation 1. Finished operation tasks.")
      }
      
      operation1.completionBlock = {
        print("     Operation 1  completion handler. Thread: \(Thread.current) ")
      }
      // Operation 1 is dependent on Opaeration 2
      operation1.addDependency(operation2)
      queue.addOperation(operation1)
      
      
      
      
      // Third Operation
        let operation3 = BlockOperation() {
            print("Started operation 3. Executing on: \(Thread.current)")
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            OperationQueue.main.addOperation(){
                self.imageView3.image = img3
            }
        }
        operation3.completionBlock = {
            print("     Operation 3 completion handler. Thread: \(Thread.current)  ")
        }
      queue.addOperation(operation3)
        
    
      
      // Fourth Operation
        let operation4 = BlockOperation() {
          print("Started operation 4. Executing on: \(Thread.current)")
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            OperationQueue.main.addOperation(){
                self.imageView4.image = img4
            }
        }
        operation4.completionBlock = {
            print("     Operation 4 completion handler. Thread: \(Thread.current) ")
        }
      queue.addOperation(operation4)
      
      
      
      
      
      
      // Final Operation
      let operation5 = BlockOperation(){
        print("Started operation 5. Executing on: \(Thread.current)")
      
      }
      operation5.addDependency(operation1)
      operation5.addDependency(operation3)
      operation5.addDependency(operation4)
      operation5.completionBlock = {
        print("     Operation 5 completion handler. Thread: \(Thread.current) ")
      }
      queue2.addOperation(operation5)
      
      
      
        
    }  // end function
    
    
    
    
    
    
  @IBAction func sliderValueChanged(_ sender: UISlider) {
      //print("is main thread :  \(Thread.isMainThread)  ");
        self.sliderValueLabel.text = "Slider: \(sender.value * 100.0)"
    }
    
    
    
    @IBAction func didClickOnCancel(_ sender: AnyObject) {
        print("Executing didClcikOnCancel method ...")
        self.queue.cancelAllOperations()
    }
    
    
    
    
    
}  // end class

