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
class ThirdViewController: UIViewController, UITextFieldDelegate,   Utils, Validator {
    
    //MARK: - IBOutlets
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var zipLabel: UITextField!
    @IBOutlet weak var salesLabel: UITextField!
    @IBOutlet weak var estDateLabel: UITextField!
    @IBOutlet weak var sicCodeLabel: UITextField!
    @IBOutlet weak var validateLabel: UILabel!
    
   // @IBOutlet weak var myDatePicker: UIDatePicker!
    
    //MARK: - IBActions
    @IBAction func estDateFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        // datePickerView.backgroundColor = UIColor.lightGray
        datePickerView.backgroundColor = UIColor(red: 1, green: 0.9608, blue: 0.8196, alpha: 1.0)
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ThirdViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    
    
    
    
    
    /**
        IBAction to submit Form data to server.
     */
    
    @IBAction func submitForm(_ sender: AnyObject) {
        
        if formIsValidated() {   // All fields have been validated
            
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
            
        }  // end if
        
    } // end func
    
    
    
    
    
    
    // MARK: -  View Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use method from protocol
        self.climb()
        
        // Call method from GlobalFunctions.swift
        GlobalFunctions.printCompanyName()
        
        self.hideKeyboardWhenTappedAround()
        validateLabel.isHidden = true
        
    }  // end method
    
    
    
   
    
    
    
    // MARK: - Validation Related
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("I just began editing ..")
    }
    
    
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        estDateLabel.text  = dateFormatter.string(from: sender.date)
    }
    
    
    
    
    func formIsValidated() -> Bool {
        
        print("formIsValidated .....starting")
        let idIsValid: Bool = false
        let nameIsValid:Bool = false
        let emailIsValid:Bool = false
        let zipIsValid:Bool = false
        let salesIsValid:Bool =  false
        var dateIsValid:Bool = false
        var siccodeIsValid:Bool =  false
        
        // ID Validation
        if (idLabel.text?.contains("5"))!{
            self.idLabel.layer.borderColor = UIColor.red.cgColor
            self.idLabel.layer.borderWidth = 1
            self.idLabel.layer.cornerRadius = 4
            self.idLabel.backgroundColor = UIColor(red: 1, green: 0.9608, blue: 0.8196, alpha: 1.0)
            self.idLabel.text = ""
            self.idLabel.placeholder  = "ID cannot contain 5 character."
            
        }
    
        // Name Validation
        if (nameLabel.text?.contains("j"))! {
            self.nameLabel.layer.borderColor = UIColor.red.cgColor
            self.nameLabel.layer.borderWidth = 1
            self.nameLabel.layer.cornerRadius = 4
            self.nameLabel.backgroundColor = UIColor(red: 1, green: 0.9608, blue: 0.8196, alpha: 1.0)
            self.nameLabel.text = ""
            self.nameLabel.placeholder  = "Name cannot contain j character."
            
        }
        
        // Email Validation
        if !isValidEmail(testStr: emailLabel.text!)  {
            print("Looks like email is NOT Valid")
            self.emailLabel.layer.borderColor = UIColor.red.cgColor
            self.emailLabel.layer.borderWidth = 1
            self.emailLabel.layer.cornerRadius = 4
            self.emailLabel.backgroundColor = UIColor(red: 1, green: 0.9608, blue: 0.8196, alpha: 1.0)
            self.emailLabel.text = ""
            self.emailLabel.placeholder  = "Enter valid email address."
        }
        
        
        // Zip Validation
        if zipLabel.text == "99999" {
            self.zipLabel.layer.borderColor = UIColor.red.cgColor
            self.zipLabel.layer.borderWidth = 1
            self.zipLabel.layer.cornerRadius = 4
            self.zipLabel.backgroundColor = UIColor(red: 1, green: 0.9608, blue: 0.8196, alpha: 1.0)
            self.zipLabel.text = ""
            self.zipLabel.placeholder  = "Zip cannot be 99999"
        }
        
        
        if idIsValid && nameIsValid && emailIsValid && zipIsValid   {
            return true
        } else {
            validateLabel.isHidden = false
            return false
        }
        
    } // end func
        
    
    
    
   
    
    // this is the delegate method. Is called after every character is entered in Text field
    func textField( _ textField: UITextField,
                    shouldChangeCharactersIn range: NSRange,
                    replacementString string: String) -> Bool {
        
        if textField == idLabel {
            // Rule: Allow max length of 4 and block certain characers
            let characterCountLimit = 4
            // We need to figure out how many characters would be in the string after the change happens
            let startingLength = textField.text?.characters.count ?? 0
            let lengthToAdd = string.characters.count
            let lengthToReplace = range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            return newLength <= characterCountLimit
                        
        } else if textField == nameLabel {
            let characterCountLimit = 4
            // We need to figure out how many characters would be in the string after the change happens
            let startingLength = textField.text?.characters.count ?? 0
            let lengthToAdd = string.characters.count
            let lengthToReplace = range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            //print (newLength)
            // Let's block certain characters
            let blockedChars = "@#$%&*(){}!~|\\/<>^+=?,:\"'"
            return newLength <= characterCountLimit  && !blockedChars.contains(string)
           
        }  else if textField == nameLabel {
            let characterCountLimit = 4
            // We need to figure out how many characters would be in the string after the change happens
            let startingLength = textField.text?.characters.count ?? 0
            let lengthToAdd = string.characters.count
            let lengthToReplace = range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            print (newLength)
            return newLength <= characterCountLimit
        }  else if   textField == emailLabel  {
            //TODO: - Add code
        
            
            
        }  else if   textField == zipLabel  {
            let characterCountLimit = 5
            // We need to figure out how many characters would be in the string after the change happens
            let startingLength = textField.text?.characters.count ?? 0
            let lengthToAdd = string.characters.count
            let lengthToReplace = range.length
            let newLength = startingLength + lengthToAdd - lengthToReplace
            print (newLength)
            return newLength <= characterCountLimit
        }  else if   textField == salesLabel  {
            
            switch string {  // string is the character just entered by user
                case "0","1","2","3","4","5","6","7","8","9":
                    // Check if there is an existing decimal char
                    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
                    if existingTextHasDecimalSeparator != nil {
                        let array = textField.text?.characters.map{String($0) }
                        let decimalIndex = array?.index(of: ".")
                        let newcharIndex = array?.endIndex
                        if (newcharIndex! - decimalIndex! ) > 2 {
                            return false
                        }
                    }
                    return true
                case ".":
                    let array = textField.text?.characters.map{String($0) }
                    var decimalCount = 0
                    for character in array! {
                        if character == "." {
                            decimalCount += 1
                        }
                    }
                    
                    if decimalCount == 1 {
                        return false
                    } else {
                        return true
                    }
                default:
                    let array = string.characters.map{String($0)}
                    if array.count == 0 {
                        return true
                    }
            
            } // end switch
 
            
            return false
         
        }  else if   textField == sicCodeLabel  {
            
            return true
            
            
            
            
        } // end if
            
            
            
            
        
        // default
        return true
        
        
    }  //end function
    
    
   
    
    

    
    
}  // end class

