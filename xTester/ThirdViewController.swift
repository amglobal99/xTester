//
//  ThirdViewController.swift
//  xxxDump
//
//  Created by Dad on 5/2/16.
//  Copyright © 2016 Dad. All rights reserved.
//  test Comment



import Foundation
import UIKit
import Alamofire



// Make the class confirm to Utils protocol
class ThirdViewController: UIViewController, UITextFieldDelegate,   Utils {
    
    
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var zipLabel: UITextField!
    @IBOutlet weak var salesLabel: UITextField!
    @IBOutlet weak var estDateLabel: UITextField!
    @IBOutlet weak var sicCodeLabel: UITextField!
    
    
    
    
    @IBAction func validateForm(_ sender: AnyObject) {
        
        print("I am validating .....")
        
        if idLabel.text == "" {
            print("id is empty")
        }
        
        
        
        
    } // end func
    
    
    
    
    
    /**
        IBAction to submit Form data to server.
 
     */
    
    
    @IBAction func submitForm(_ sender: AnyObject) {
        
        let jsonTodo: Data   // variable to hold Data created from JSON object

        // Get values for fields on Form
        let id = Int(idLabel.text!)
        let title = nameLabel.text
        var json:[String:Any] = [:]  // create Dictionary
        
        // Set values in Dictionary using Form data entry values
        json["userId"] = 1
        json["completed"] = false
        json["title"] = title
        
        // Use a do-catch block since JSONSerialiation.data method can throw an error
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: json, options: [])
        } catch {
            print("Error: cannot create JSON")
            return
        }
        
        // Create Alamofire POST request
        let endPoint: String = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: endPoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        print("Sending Alamofire request")
        Alamofire.request(urlRequest)
            .validate(statusCode: [201] )  // this is check #1 ... Code 201 indicates that Resource was created by POST
            .responseString
            { response in
                // check #2
                guard response.result.error == nil else {
                    print("+++++++ We did not get status Code of 201 back ++++++++++++++++++++++++++")
                    print("Our Error: \(response.result.error!) ")
                    return
                }
                
                print("IsSuccess: \(response.result.isSuccess)")
                
                print("\n\n+++++++++++++++ Response Result Value +++++++++++++++")
                print("Response String: \(response.result.value!)")
                print("+++++++++++++++++++++++++++++++++++++++++")
                
                print("\n++++++++++++++ Response Status Code ++++++++++++++")
                let statusCode = response.response?.statusCode
                print("Status Code: \(statusCode!)")
                print("+++++++++++++++++++++++++++++++++++++++++")
                
                print("\n\n +++++++++++++++++++ Entire RESPONSE ++++++++++++++++++++++++++++++")
                debugPrint(response)   // This prints output for data, response, result  value
                print("\n\n+++++++++++++++++++  end Entire Response +++++++++++++++++++++++++")
                
        }  // end closure
        
        
    } // end func
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use method from protocol
        self.climb()
        
        // Call method from GlobalFunctions.swift
        GlobalFunctions.printCompanyName()
        
        self.hideKeyboardWhenTappedAround()
        
    }  // end method
    
    
    
   
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // Form Related Functions .... Validation etc
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("I just began editing ..")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}  // end class

