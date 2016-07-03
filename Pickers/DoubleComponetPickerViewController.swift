//
//  DoubleComponetPickerViewController.swift
//  Pickers
//
//  Created by 周登峰 on 7/2/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit

class DoubleComponetPickerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    private let firstComp=0;
    private let secondComp=1;
    @IBOutlet weak var doublePicker: UIPickerView!
    private let firstTypes=["m386","m276","389","m447","365","219"];
    private let secondTypes=["1号线","2号线","3号线","4号线","5号线","11号线"];
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==firstComp{
            return firstTypes.count;
        }else
        {
            return secondTypes.count;
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      if component==firstComp
      {
        return firstTypes[row];
      }else{
        return secondTypes[row];
        }
    }
//    
    @IBAction func SelectValue(sender: AnyObject) {
        let row=doublePicker.selectedRowInComponent(firstComp);
        let selected=firstTypes[row];
        let seconeSelected=secondTypes[doublePicker.selectedRowInComponent(secondComp)];
        let message="you selected is \(selected)  and \(seconeSelected)";
        let alert=UIAlertController(title: "date and time selected", message: message, preferredStyle: .Alert);
        let action=UIAlertAction(title: "that's so true!", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
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
