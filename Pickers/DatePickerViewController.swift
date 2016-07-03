//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by 周登峰 on 7/2/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let date=NSDate();
        datePicker.setDate(date, animated:false);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonPress(sender: UIButton) {
        let selectDate=datePicker.date;
        let message="the date and time you selected is \(selectDate)";
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
