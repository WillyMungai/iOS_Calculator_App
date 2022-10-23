/*
 Group 14
 Name Bing Pan                               301317241
 Name Wilson Mungai Muguthi                  301287641
 Name Gideon Shewana                         301195064
 
 Last Modification: 10/08/2022
 
 Version 1
 
 Description
 
 A simple calculator that calculates the simplest input with operations of +,-,/,x,%, and displays
 the results in the format of a float number.
 This app cannot handle special input cases and exceptions yet. These features will be implemented
 during our next milestone.
 */

import UIKit

class ViewController: UIViewController {
    var leftOperand: Float = 0.0
    var rightOperand: Float = 0.0
    var haveLeftOperand: Bool = false
    var haveRightOperand: Bool = false
    var resultLabelReady: Bool = true
    var result: Float = 0.0
    var activeOperator: String = ""
    
    
    var input:String = "";
    var inputArray = [String]();
    var numberInput = [String]();
    var operatorInput = [String]();
    var finalInput = [String]();
    var sign:String = "+";
    

    //Result Label
    @IBOutlet weak var ResultLabel: UILabel!

    @IBOutlet weak var FinalResultLabel: UILabel!
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
    }
    
    
    func evalute(){
            processInput();
            mergeInput();
            calculate();
        }
        
        func calculate(){
            performGeneratingRandomInt()
            performPiCalculation(input: finalInput)
            performSquareRootCalculation(input: finalInput)
            performExponentCalculation(input: finalInput)
            performSinCalculation(input: finalInput)
            performCosCalculation(input: finalInput)
            performTanCalculation(input: finalInput)
            performPercentage(input: finalInput)
            performMultiplyDivide(input: finalInput)
            performAddSubstract(input: finalInput)
        }
        
        
        // Operator Functions
        func add(lhs: String, rhs: String)->Float{
            return Float(lhs)! + Float(rhs)!
        }
        
        func subtract(lhs: String, rhs: String) -> Float{
            return Float(lhs)! - Float(rhs)!
        }
        
        func multiply(lhs: String, rhs: String) -> Float{
            return Float(lhs)! * Float(rhs)!
        }
        
        func divide(lhs: String, rhs: String)-> Float{
            return Float(lhs)! / Float(rhs)!
        }
        
        func calculate_pi(val: String) -> String {
            return String(Float(val)! * 3.1415926)
        }
        
        func calculate_squareroot(val: String) -> Float {
            return  Float(val)!.squareRoot()
        }
        
        
        func calculate_exponent(val: String) -> Float {
            return Float(val)! * Float(val)!
        }
        
        
        func calculate_sin(val: String) -> Float {
            return sin(Float(val)!)
        }
        
        func calculate_cos(val: String) -> Float {
            return cos(Float(val)!)
        }
        
        
        func calculate_tan(val: String) -> Float {
            return tan(Float(val)!)
        }
        
       
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
        
        
        //parse the user input and store them into two String arrays,
        //i.e. numberInput & operatorInput
        func processInput(){
            var inputToken: String = "";
            var length: Int = 0;
            
            if (!input.isEmpty){
                length = input.count - 1
                
                for idx in 0...length{
                    let ch = input[input.index(input.startIndex, offsetBy: idx)];
                    
                    if(!isNumber(ch)){
                        operatorInput += retrieveOperators(ch: String(ch))
                    }else{
                        inputToken.append(String(ch))
                        if(idx < length){
                            continue
                        }
                    }
                    numberInput.append(inputToken)
                    inputToken = "";
                }
            }
        }
        
        
        //Based on the user's input sequence,
        //merge numberInput and operatorInput arrays into one final String array,
        //which is named as "finalInput" String array
        func mergeInput(){
            let numLength = numberInput.count - 1;
            let operatorLength = operatorInput.count - 1;
            
            for idx in 0...numLength{
                finalInput.append(numberInput[idx]);
                if(idx <= operatorLength){
                    finalInput.append(operatorInput[idx]);
                }
            }
            print("finalInput:")
            dump(finalInput)
        }
        
        
        func performSignConversion(){
            var temp:String = "";
            
            for idx in 0...finalInput.count-1{
                if (finalInput[idx] == "positiveSign"){
                    temp = finalInput[idx+1]
                    finalInput[idx] = temp
                    }
                
                if (finalInput[idx] == "negativeSign"){
                    var i = finalInput[idx+1]
                    var n = Int(i)! * -1
                    finalInput[idx] = String(n)
                    }
            }
                
            
            print("After sign conversion , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This function generates an Int between 1 and 1000 only
        //And this function assumes that there is an operator both immediately before and after this function
        func performGeneratingRandomInt() {
            var temp:String = "";
            
            for idx in 0...finalInput.count-1{
                if (finalInput[idx] == "R"){
                    temp = String(Int.random(in: 1..<1000))
                    finalInput[idx] = temp
                    }
                }
            print("After generating a random int , the finalInput: ")
            dump(finalInput)
        }
       
        
    //This program assumes that π is entered after a number
        func performPiCalculation(input: [String]) {
            var temp:String = "";

            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("π") == true){
                    for char in finalInput[idx]{
                        if(char != "π"){
                            temp.append(char)
                        }
                    }
                    temp = calculate_pi(val: temp)
                    finalInput[idx] = temp
                    }
                }
            print("after cal π , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This program assumes that √ operator is entered before a number
        func performSquareRootCalculation(input: [String]) {
            var temp:String = "";
            
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("√") == true){
                    
                    for char in finalInput[idx]{
                        if(char != "√"){
                            temp.append(char)
                        }
                    }
                    temp = String(calculate_squareroot(val: temp))
                    finalInput[idx] = temp
                    }
                }
            print("after cal √ , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This program assumes that exponent operator is entered after a number
        func performExponentCalculation(input: [String]) {
            var temp:String = "";
           
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("E") == true){
                    for char in finalInput[idx]{
                        if(char != "E"){
                            temp.append(char)
                        }
                    }
                    temp = String(calculate_exponent(val: temp))
                    finalInput[idx] = temp
                    }
                }
            print("after cal Exponent , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This program assumes that sin operator is entered before a number
        func performSinCalculation(input: [String]) {
            var temp:String = "";
           
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("S") == true){
                    for char in finalInput[idx]{
                        if(char != "S"){
                            temp.append(char)
                        }
                    }
                    temp = String(calculate_sin(val: temp))
                    finalInput[idx] = temp
                    }
                }
            print("after cal Sin , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This program assumes that cos operator is entered before a number
        func performCosCalculation(input: [String]) {
            var temp:String = "";
            
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("C") == true){
                    for char in finalInput[idx]{
                        if(char != "C"){
                            temp.append(char)
                        }
                    }
                    temp = String(calculate_cos(val: temp))
                    finalInput[idx] = temp
                    }
                }
            print("after cal Cos , the finalInput: ")
            dump(finalInput)
        }
        
        
        //This program assumes that tan operator is entered before a number
        func performTanCalculation(input: [String]) {
            var temp:String = "";
            
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("T") == true){
                    for char in finalInput[idx]{
                        if(char != "T"){
                            temp.append(char)
                        }
                    }
                    temp = String(calculate_cos(val: temp))
                    finalInput[idx] = temp
                    }
                }
            print("after cal Tan , the finalInput: ")
            dump(finalInput)
        }
        
        
        
        //Warning:
        //this function can not process correctly the percentage input at the end of the user input
        func performPercentage(input: [String]) {
            var temp:String = "";
           
            for idx in 0...finalInput.count-1{
                if (finalInput[idx].contains("%") == true){
                    for char in finalInput[idx]{
                        if(char != "%"){
                            temp.append(char)
                        }
                    }
                    temp = String( Float(temp)! / 100)
                    finalInput[idx] = temp
                }
            }
            
            print("after cal % , the finalInput: ")
            dump(finalInput)
        }
        
        func isPercentage(input:String) -> Bool{
            return input == "%" ? true : false;
        }
        
        
        func performMultiplyDivide(input: [String]) {
            var temp:String = "";
            
            while(hasHigerPrecedenceOperator(input: finalInput)){
                for idx in 0...finalInput.count-1{
                    if (finalInput[idx] == "X"){
                        temp = String(multiply(lhs:finalInput[idx-1], rhs:finalInput[idx+1]))
                        finalInput[idx-1] = temp
                        finalInput.removeSubrange(idx...idx+1)
                        break
                    }
                    else if (finalInput[idx] == "/"){
                        temp = String(divide(lhs:finalInput[idx-1], rhs:finalInput[idx+1]))
                        finalInput[idx-1] = temp
                        finalInput.removeSubrange(idx...idx+1)
                        break
                    }
                }
            }
            print("after cal X and /, the finalInput: ")
            dump(finalInput)
        }

        
        func performAddSubstract(input: [String]){
            var temp:String = "";
            var finished:Bool = false;
            
            while(finished != true){
                for idx in 0...finalInput.count-1 {
                    if (finalInput[idx] == "+"){
                        temp = String(add(lhs:finalInput[idx-1], rhs:finalInput[idx+1]))
                        finalInput[idx-1] = temp
                        finalInput.removeSubrange(idx...idx+1)
                        break
                    }
                    else if (finalInput[idx] == "-"){
                        temp = String(subtract(lhs:finalInput[idx-1], rhs:finalInput[idx+1]))
                        finalInput[idx-1] = temp
                        finalInput.removeSubrange(idx...idx+1)
                        break
                    }
                }
                
                if(finalInput.count == 1){
                    finished = true;
                }
            }
            print("after cal + and -, the finalInput: ")
            dump(finalInput)
        }
        
        
        func hasHigerPrecedenceOperator(input: [String]) -> Bool{
            var hasHigerPrecedOperator: Bool = false;
            
            for str in finalInput{
                if(isHigherPrecedenceOperator(op:str)){
                    hasHigerPrecedOperator = true;
                }
            }
            return hasHigerPrecedOperator;
        }
        
        
        func isHigherPrecedenceOperator(op:String) -> Bool{
            var isHigher: Bool = false;
            if ((op != "+") || (op != "-")){
                isHigher = true;
            }
            return isHigher;
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
        case "sin":
            activeOperator = "S"
        case "cos":
            activeOperator = "C"
        case "tan":
            activeOperator = "T"
        case "ex":
            activeOperator = "E"
        case "√":
            activeOperator = "√"
        case "π":
            activeOperator = "π"
        case "Rand":
            activeOperator = "R"
        case "+":
            activeOperator = "+"
        case "-":
            activeOperator = "-"
        case "X":
            activeOperator = "X"
        case "/":
            activeOperator = "/"
        case "%":
            activeOperator = "%"
        case "+/-":
            if(sign == "+"){
                activeOperator = "positiveSign"
                sign = "-"
            }else{
                activeOperator = "negativeSign"
                sign = "+"
            }
        case "CALCULATE":
            evalute()
        default:
            print("")
        }
        input.append(activeOperator)
    }
    
    
    //To-do:
    // remove the initial zero
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
            ResultLabel.text?.append("8")
        case "9":
            numberInput.append("9")
            ResultLabel.text?.append("9")
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
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let currentInput = button.titleLabel!.text
        switch currentInput {
        case "AC":
            ResultLabel.text = "0"
            FinalResultLabel.text = "0"
            result = 0.0
            leftOperand = 0.0
            rightOperand = 0.0
            haveLeftOperand = false
            haveRightOperand = false
            activeOperator = ""
            input = "";
            
            
            inputArray = [];
            numberInput = [];
            operatorInput = [];
            finalInput = [];
            
            //bool var for status
        case "<-":
            if(ResultLabel.text!.count > 1)
            {
                ResultLabel.text?.removeLast()
                input.removeLast()
            }
            else
            {
                ResultLabel.text = "0"
            }
            
        default:
            break;
        }
    }
    
    
}
