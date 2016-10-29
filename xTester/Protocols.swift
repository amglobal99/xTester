//
//  Utils.swift
//  xTester
//
//  Created by Dad on 10/10/16.
//  Copyright © 2016 Natsys. All rights reserved.
//

// We will create a librray of commonly used function here



import Foundation
import UIKit
import BRYXBanner



// MARK: Protocols

protocol Utils {}   // This protocol contains common utility functions
protocol Shakeable { }   // allows elemenst to shake
protocol Dimmable { }   // allows elements to dim










// MARK: - Extensions


// MARK: - Extensions Utils
extension Utils {
    
    // This is a simple test method
    func climb() -> Void {
        print("I am climbing .....")
    }
    
    
    
    
    
    
    
    //  ******************  JSON Section   **************************************
    
    // THis function creates a Dictionary from a JSON object
    // For example, let's say you have a JSON object with many attributes
    // You want to retrieve values and group them into sections.
    // Example: I have an atribute called "section" with values such as Technology, Science, Business
    // My JSon object has name field with values say John, MAry, Carla etc
    // I want a Dictionary with key as say "Science" and value array as ["MAry","Bob","Kelly.....]
    
    /*
    func getDictionaryFromJson(rootElement:String,
                               categoryElement:String,
                               valueElement:String,
                               jsonObject: [String: AnyObject]) -> [String:[String]]?  {
        
        var finalDictionary = [String:[String]]()
        
        // get array of keys
        let keyArray:[String] = getKeyArrayFromJSON(rootElement: rootElement, key: categoryElement, jsonObject: jsonObject)!
        
        //print(keyArray)
        //print ("key1: \(categoryElement) \n key2: \(valueElement)")
        
        var tempArr = [String]()   // temporary storage
        
        for item in keyArray {  // Process each section
            guard
                let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
                else {
                    return nil
            }
            
            // process all items and check for items that match item
            for obj in jsObject  {
                let  val1 = obj[categoryElement] as? String
                let  val2 = obj[valueElement] as? String
                if val1 == item {
                    tempArr.append(val2!)
                }
            }  // for obj
            
            
            // Now add an entry to our final Dictonary
            finalDictionary.updateValue(tempArr, forKey: item)
            
            // clear array
            tempArr.removeAll()
            
        }// item in keyArray
        
        // Return the final Dictionary
        return finalDictionary
        
    }  // end funtion
    
 
    
    
    
    
    
    func getDictionaryFromJson(_ rootElement:String,
                               categoryElement:String,
                               valueElement:String,
                               jsonObject: [String: AnyObject]) -> [String:[String]]?  {
        
        var finalDictionary = [String:[String]]()
        
        // get array of keys
        let keyArray:[String] = getKeyArrayFromJSON(rootElement, key: categoryElement, jsonObject: jsonObject)!
        
        //print(keyArray)
        //print ("key1: \(categoryElement) \n key2: \(valueElement)")
        
        var tempArr = [String]()   // temporary storage
        
        for item in keyArray {  // Process each section
            
            guard
                let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
                else {
                    return nil
            }
            
            // process all items and check for items that match item
            for obj in jsObject  {
                let  val1 = obj[categoryElement] as? String
                let  val2 = obj[valueElement] as? String
                if val1 == item {
                    tempArr.append(val2!)
                }
            }  // for obj
            
            
            // Now add an entry to our final Dictonary
            finalDictionary.updateValue(tempArr, forKey: item)
            
            // clear array
            tempArr.removeAll()
            
        }// item in keyArray
        
        // Return the final Dictionary
        return finalDictionary
        
    }  // end funtion
    

    
    
    
    
    
    
    
    
    
    
    
    // This is a helper function. 
    
    func getKeyArrayFromJSON(_ rootElement:String,
                             key:String,
                             jsonObject: [String: AnyObject]) -> [String]? {
        
        var tempArray = [String]()   // create empty array
        guard
            let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
        else {
                //print("is nil...")
                return nil
        }
        
        for obj in jsObject {
            guard
                let key = obj[key] as? String
            else {
                break
            }
            tempArray.append(key)
        }  // for obj
        
        
        // return array
        return Array(Set(tempArray)  )
        
    }  // end function
    
    

    
    // **************************** end JSON section ************************************************************
    
    
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //  ********************** Date / Time Section **********************************
    
    
    // ***********************************************
    // Function computes difference between two Dates
    //
    // ************************************************
    
    func timeDiff(_ date1: Date) -> Double {
        let  date2: Date = Date()
        return date2.timeIntervalSince(date1)
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Banner Related
    func showBanner(title:String, subtitle:String, image: UIImage?, bkColor: UIColor) {
        let banner: Banner? = Banner(title: title, subtitle: subtitle, image: image, backgroundColor: bkColor)
        banner?.dismissesOnSwipe = true
        banner?.show(duration: nil)
    }
    
    

    
    
    
    
    
    
    
    
}  // end extension







// MARK: - Extension Shakeable

 extension Shakeable where Self:UIView {
    
//extension Shakeable   {
    
    /*
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    */
    
    
    
    // Usage for this function
    //You can call this function on any UIView, button, label textview etc. This way
    //yourView.shake()
    //Or this way if you want to add some custom parameters :
    //yourView.shake(count: 5, for: 1.5, withTanslation: 10)
    
    //
    func shake(count : Float? = nil,for duration : TimeInterval? = nil,withTanslation translation : Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        layer.add(animation, forKey: "shake")
    }
    
   
    
}





// MARK: - Extension Dimmable

    enum Direction { case In, Out }


    extension Dimmable where Self: UIViewController {
        
                func dim(direction: Direction, color: UIColor = UIColor.black, alpha: CGFloat = 0.0, speed: Double = 0.0) {
                    
                        switch direction {
                            
                        case .In:
                            // Create and add a dim view
                            let dimView = UIView(frame: view.frame)
                            dimView.backgroundColor = color
                            dimView.alpha = 0.0
                            view.addSubview(dimView)
                            // Deal with Auto Layout
                            dimView.translatesAutoresizingMaskIntoConstraints = false
                            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
                            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
                            // Animate alpha (the actual "dimming" effect)
                            UIView.animate(withDuration: speed) { () -> Void in
                                dimView.alpha = alpha
                            }
                        case .Out:
                            UIView.animate(withDuration: speed, animations: { () -> Void in
                                self.view.subviews.last?.alpha = alpha ?? 0
                                }, completion: { (complete) -> Void in
                                    self.view.subviews.last?.removeFromSuperview()
                            })
                    }
            }  // end func
        
    } // end extension
    







/// *******************************************  NEW JSON xection ********************************
//
//
//


/*
func getDictionaryFromJson(rootElement:String,
                           categoryElement:String,
                           valueElement:String,
                           jsonObject: [String: AnyObject]) -> [String:[String]]?  {
    
    var finalDictionary = [String:[String]]()
    
    // get array of keys
    let keyArray:[String] = getKeyArrayFromJSON(rootElement: rootElement, key: categoryElement, jsonObject: jsonObject)!
    
    //print(keyArray)
    //print ("key1: \(categoryElement) \n key2: \(valueElement)")
    
    var tempArr = [String]()   // temporary storage
    
    for item in keyArray {  // Process each section
        guard
            let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
            else {
                return nil
        }
        
        // process all items and check for items that match item
        for obj in jsObject  {
            let  val1 = obj[categoryElement] as? String
            let  val2 = obj[valueElement] as? String
            if val1 == item {
                tempArr.append(val2!)
            }
        }  // for obj
        
        
        // Now add an entry to our final Dictonary
        finalDictionary.updateValue(tempArr, forKey: item)
        
        // clear array
        tempArr.removeAll()
        
    }// item in keyArray
    
    // Return the final Dictionary
    return finalDictionary
    
}  // end funtion


*/




func getDictionaryFromJson(_ rootElement:String,
                           categoryElement:String,
                           valueElement:String,
                           jsonObject: [String: AnyObject]) -> [String:[String]]?  {
    
    var finalDictionary = [String:[String]]()
    
    // get array of keys
    let keyArray:[String] = getKeyArrayFromJSON(rootElement, key: categoryElement, jsonObject: jsonObject)!
    
    //print(keyArray)
    //print ("key1: \(categoryElement) \n key2: \(valueElement)")
    
    var tempArr = [String]()   // temporary storage
    
    for item in keyArray {  // Process each section
        
        guard
            let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
            else {
                return nil
        }
        
        // process all items and check for items that match item
        for obj in jsObject  {
            let  val1 = obj[categoryElement] as? String
            let  val2 = obj[valueElement] as? String
            if val1 == item {
                tempArr.append(val2!)
            }
        }  // for obj
        
        
        // Now add an entry to our final Dictonary
        finalDictionary.updateValue(tempArr, forKey: item)
        
        // clear array
        tempArr.removeAll()
        
    }// item in keyArray
    
    // Return the final Dictionary
    return finalDictionary
    
}  // end funtion













// This is a helper function. Given some JSON object, we specify a key , say for example "name".
// this function retrievs an aray of all name attributes

func getKeyArrayFromJSON(_ rootElement:String,   key:String, jsonObject: [String: AnyObject]) -> [String]? {
    
        var tempArray = [String]()   // create empty array
    
        guard  let jsObject = jsonObject[rootElement] as? [[String: AnyObject]]
        else {
                print("getKeyArrayFromJOSN : got a nil...")
                return nil
        }
        
        for obj in jsObject {
            guard  let key = obj[key] as? String
            else {
                break
            }
            tempArray.append(key)
        }
    
        return Array(Set(tempArray)  )    // return array
    
}  // end function






func getJSONObject (for url:String) -> Any? {
    print("getJSONObject ... starting ")
    var object:Any?
    guard let url = URL(string: url)  else {
        return nil
    }
    let urlRequest = URLRequest(url: url)
    let session = URLSession.shared
    
    // make the request
    let task = session.dataTask(with: urlRequest, completionHandler:
        { (data, response, error) in
            if (error != nil) {
                print("This is an error: \(error) " )
                return
            }
            //NSLog("Full Response From Server: \n \(response!)  " )
            
                if data != nil {
                   // print("Yes ... we do have JSON data")
                    if let jsonData =  data {      // Let's parse our JSON
                        do {
                            object = try? JSONSerialization.jsonObject(with: jsonData, options: [])
                            // let object = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                            if object != nil {
                               print(object!)
                            }
                        } catch let error {
                            print("Error ceating JOSN object \(error)")
                            return
                        }
                    }// jsonData =  data
                } // data != nil
        }  // end closure
        
    )  // task = session.dataTask
    

    // Task is created in Suspended state
    task.resume()
    
    return object
    
    
}  // end func



















//***********************************  end new JSON section ******************************************************************



































