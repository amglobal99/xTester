//
//  TwelfthA4ViewController.swift
//  xTester
//
//  Created by Jack Patil on 3/29/17.
//  Copyright © 2017 Natsys. All rights reserved.
//

import Foundation
import Eureka

class TwelfthA4ViewController: FormViewController {
  
  
  var zip: TextRow!
  var mileage: IntRow!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    zip = TextRow("zip"){
      $0.title = "Zipcode"
      //$0.value = customer.address?.zip
      $0.cell.textField.keyboardType = UIKeyboardType.numberPad
      //$0.validationOptions = .validatesOnChangeAfterBlurred
      $0.validationOptions = .validatesOnChange
      $0.add(rule: RuleMaxLength(maxLength: 5) )
      $0.add(rule: RuleMinLength(minLength: 5) )
      $0.maxLength = 5
      
      /*
       let ruleClosureZip = RuleClosure<String> { rowValue in
       // return (rowValue == nil || rowValue!.isEmpty) ? ValidationError(msg: "Field required!") : nil
       return (rowValue == "77777") ? ValidationError(msg: "Field required! silly") : nil
       
       }
       $0.add(rule: ruleClosureZip)
       */
      
      }
      
      .cellUpdate { cell, row in
        let gold = UIColor(hexString: "#f3e5abff")
        if !row.isValid {
          print("value not valid")
          cell.titleLabel?.textColor = .red
          cell.textField.backgroundColor  = gold
          cell.textField.layer.borderColor = UIColor(hexString: "#FF0000FF")?.cgColor
          cell.textField.layer.borderWidth = 1
        } else {
          if cell.textField.hasText   {
            cell.textField.backgroundColor  = UIColor.clear
            cell.textField.layer.borderWidth = 0
          } else {
            cell.textField.backgroundColor  = gold
            cell.textField.layer.borderColor = UIColor(hexString: "#FF0000FF")?.cgColor
            cell.textField.layer.borderWidth = 0
          }
        }
      }
      
      .onChange { row in
        print("Changed")
    }
    
    
    mileage = IntRow("mileage"){
      $0.title = "Vehicle Mileage"
      //$0.value = customer?.mileage
      
      $0.placeholder = "Required field"
      $0.cell.textField.backgroundColor  = UIColor.yellow
      $0.add(rule: RuleRequired())
      }
      .cellUpdate { cell, row in
        //print("I updated ..")
        
        if !row.isValid {
          print("value not valid")
          cell.titleLabel?.textColor = .red
          //cell.textField.backgroundColor  = UIColor.red
          cell.textField.backgroundColor  = UIColor.yellow
          cell.textField.placeholder =  "Enter valid amt."
        } else {
          if cell.textField.hasText   {
            cell.textField.backgroundColor  = UIColor.clear
          } else {
            cell.textField.backgroundColor  = UIColor.yellow
          }
        }
        
        
      }.onChange { r   in
        print("I changed ..")
    }
    
    
    
    
    

    /// THIS IS WHERE THE FORM BEGINS
    
    
    
    form
      +++ Section("Section1")
      
      <<< TextRow(){ row in
        row.title = "Text Row"
        row.placeholder = "Enter text here"
          }
      
      <<< PhoneRow(){
        $0.title = "Phone Row"
        $0.placeholder = "And numbers here"
          }
      
      +++ Section("Section2")
      
      <<< DateRow(){
        $0.title = "Date Row"
        $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    
    
    <<< zip
    
    <<< mileage
    
    
    
    
  } // end Form
  
  
  
  
  
  
  
  
  
  // Function to enable us to limit the number of characters user can enter in a Text Field
  
  override func textInput<T>(_ textInput: UITextInput, shouldChangeCharactersInRange range: NSRange,
                          replacementString string: String, cell: Cell<T>) -> Bool {
    var text: String?
    var maxLength: Int?
    let textAreaRow = cell.baseRow as? TextAreaRow
    let textRow = cell.baseRow as? TextRow
    
    if textAreaRow != nil {
      text = textAreaRow?.value as String?
      maxLength = textAreaRow?.maxLength
    } else if textRow != nil {
      text = textRow?.value as String?
      maxLength = textRow?.maxLength
    }
    
    if text == nil || maxLength == nil {
      return true
    }
    
    return text!.characters.count + string.characters.count - range.length <= maxLength!
  }
  

  
  
  
  
  
}  // end class
