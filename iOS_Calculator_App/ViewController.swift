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
    }

    // Event Handlers

   @IBAction func OperatorButton_Pressed(_ sender: UIButton)
   {
       var activeOperator:String = ""
       let button = sender as UIButton
       let currentInput = button.titleLabel!.text
       _ = ResultLabel.text
       
       //To do list:
       //1. repeated input of a same operator is ignored here
       //2. The input of a different operator is ignored here. Future solution: to replace the prceeding one with the latest input
       switch currentInput
       {
       case "+":
           activeOperator = "+"
       case "-":
           activeOperator = "-"
       case "X":
           activeOperator = "X"
       case "/":
           activeOperator = "/"
       case "=":
           processResult()
       default:
           print("")
       }
       
       input.append(activeOperator)
       
       /*
        if(!haveLeftOperand)
        {
            haveLeftOperand = true
            leftOperand = Float(resultLabelText!)!
            resultLabelReady = false
        }
        else
        {
            rightOperand = Float(resultLabelText!)!
            haveRightOperand = true
        }
               
            if(haveLeftOperand && haveRightOperand)
        {
            Evaluate()
            leftOperand = result
            rightOperand = 0.0
            resultLabelReady = false
        }
        */
               
   }
       
   
       /*
       if(!haveLeftOperand)
       {
            haveLeftOperand = true
            leftOperand = Float(resultLabelText!)!
            resultLabelReady = false
       }
       else
       {
            rightOperand = Float(resultLabelText!)!
            haveRightOperand = true
       }
        
    }
        
        if(haveLeftOperand && haveRightOperand)
        {
            Evaluate()
            leftOperand = result
            rightOperand = 0.0
            resultLabelReady = false
        }
        */
              
    }
    //To-do:
   //1. need to connect the +/- sign button to this action
   //2. remove the initial zero
   @IBAction func NumberButton_Pressed(_ sender: UIButton)
   {
       var numberInput:String = ""
       let button = sender as UIButton
       let currentInput = button.titleLabel!.text
       _ = ResultLabel.text

       switch currentInput
       {
       case "0":
           numberInput.append("0")
           ResultLabel.text?.append("0")
//            if(resultLabelText != "0")
//            {
//                ResultLabel.text?.append("0")
//            }
       case ".":
           numberInput.append(".")
           ResultLabel.text?.append(".")
//            if(!resultLabelText!.contains("."))
//            {
//                ResultLabel.text?.append(".")
//            }
           
       case "1":
           numberInput.append("1")
           ResultLabel.text?.append("1")
           
       case "2":
           numberInput.append("2")
           ResultLabel.text?.append("2")
       case "3":
           numberInput.append("3")
           ResultLabel.text?.append("3")
       case "4":
           numberInput.append("4")
           ResultLabel.text?.append("4")
       case "5":
           numberInput.append("5")
           ResultLabel.text?.append("5")
       case "6":
           numberInput.append("6")
           ResultLabel.text?.append("6")
       case "7":
           numberInput.append("7")
           ResultLabel.text?.append("7")
       case "8":
           numberInput.append("8")
           numberInput.append("8")
                      ResultLabel.text?.append("8")
        case "9":
            numberInput.append("9")
            ResultLabel.text?.append("9ß")
        default: break
           
          //            if((resultLabelText == "0") || (!resultLabelReady))
          //            {
          //                ResultLabel.text = ""
          //                resultLabelReady = true
          //            }
          //
          //            if(resultLabelReady)
          //            {
          //                ResultLabel.text?.append(currentInput!)
          //                resultLabelReady = false
          //            }
    }
                  
        input.append(numberInput)
       print("input: " + input)
    }
