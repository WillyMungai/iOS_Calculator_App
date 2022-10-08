/*
 * File Name: Calculator Milestone One
 * Last Modified: 25/09/2022
 * Version1
 *
 * Author: Wilson Mungai
 * Student ID: 301287641
 *
 * Author: Gideon Shewana
 * Student ID: 301195054
 *
 * Author: Bing Pan
 * Student ID: 301317241

 * Description:
 * This Calculator App allows users to add, subtract, multiply, divide integers as well as decimal numbers and displays the results.
 * During the input, it gives users the options to change or clear what they already type.
 * Specifically, the Back button allows the users to remove what are entered backwards.
 * The AC button allows the users to clear all the input numbers at once.
 * In contract, the CE button allows users just to remove their latest entry.
 */

import UIKit

class ViewController: UIViewController {

    //Result Label
       @IBOutlet weak var ResultLabel: UILabel!
       
       override func viewDidLoad()
       {
           super.viewDidLoad()
       }
       
       // Operator Functions
       func Add(lhs: Float, rhs: Float)->Float
       {
           return lhs + rhs
       }
       
       func Subtract(lhs: Float, rhs: Float) -> Float
       {
           return lhs - rhs
       }
       
       func Multiply(lhs: Float, rhs: Float) -> Float
       {
           return lhs * rhs
       }
       
       func Divide(lhs: Float, rhs: Float)->Float
       {
           return lhs / rhs
       }
        result = Multiply(lhs: leftOperand, rhs: rightOperand)
    //        case "/":
    //            result = Divide(lhs: leftOperand, rhs: rightOperand)
    //        case "=":
    //            print()
    //            //result = processResult();
    //        default:
    //            result = 0.0
    //        }
    //
    //        ResultLabel.text = String(result)
    //    }
        
        func retrieveOperators(ch:String) ->[String] {
            var operators = [String]()
            operators.append(ch)
            return operators
        }
        
        func isNumber(_ char: Character) -> Bool {
            var state: Bool = false;
            
            if ((char != "+") && (char != "-") && (char != "X") && (char != "/")){
                state = true;
            }
            return state;
        }
        
        //process the user input based on operator precedences and caluculate the final result
        //func processResult() -> Float{
        func processResult(){
            var inputToken: String = "";
            var length: Int = 0;
            var operators = [String]()
         
            if (!input.isEmpty){
                length = input.count - 1
                
                for idx in 0...length{
                    var ch = input[input.index(input.startIndex, offsetBy: idx)];
                    
                    if(!isNumber(ch)){
                        operators += retrieveOperators(ch: String(ch))
                    }else{
                        inputToken.append(String(ch))
                        if(idx < length){
                            continue
                        }
                    }
                    
                    inputArray.append(inputToken)
                    inputToken = "";
                    
            //                if(isNumber(char)){
            //                    inputToken.append(String(char))
            //                    continue;
            //                }
            //                else{
            //                    inputToken = String(char)
            //                }
            //                print("current token: " + inputToken)
            //                inputArray.append(inputToken)
            //                inputToken = "";
                        }
                    }
                    
                    print("The inputArray: ")
                    dump(inputArray)
                    print("The operators: ")
                    dump(operators)
                
                    
                    
                    
                    //split the input string into tokens for numbers and operators and append them an array of strings
                    
                    //check the array for * and / in order to calculate the adjuscent operands for results
                    
                    //remove those array elements involved in the above operations and put back the calculation result
                    
                   
                    
                    //return finalResult;
                }
                    
                    
       
   //    func Evaluate()
   //    {
   //
   //        switch activeOperator
   //        {
   //        case "+":
   //            result = Add(lhs: leftOperand, rhs: rightOperand)
   //        case "-":
   //            result = Subtract(lhs: leftOperand, rhs: rightOperand)
   //        case "X":
    
    // Event Handlers
    
    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
       
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
    }
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        
        }
    
    }

}



