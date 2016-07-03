//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by 周登峰 on 7/2/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{

    private let characterNames=["m386","m276","389","m447","365","219"];
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SelectValue(sender: AnyObject) {
        let row=pickerView.selectedRowInComponent(0);
        let selected=characterNames[row];
        let message="you selected is \(selected)";
        let alert=UIAlertController(title: "date and time selected", message: message, preferredStyle: .Alert);
        let action=UIAlertAction(title: "that's so true!", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
    }

    // returns the number of 'columns' to display.

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // returns the # of rows in each component..
     func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return characterNames.count;
        
    }

 
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
      return  characterNames[row];
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
