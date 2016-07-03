//
//  DependentComponetPickerViewController.swift
//  Pickers
//
//  Created by 周登峰 on 7/2/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit

class DependentComponetPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var dependDentPicker: UIPickerView!
    private let stateComp=0;
    private let zipComp=1;
    private var stateZip:[String:[String]]!;
    private var stateValues:[String]!;
    private var zipValues:[String]!;
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle=NSBundle.mainBundle();
        let plistUrl=bundle.URLForResource("statedictionary", withExtension: "plist");
        stateZip=NSDictionary(contentsOfURL: plistUrl!)! as! [String : [String]] ;
        let allState=stateZip.keys.sort();
        stateValues=allState as [String];
        zipValues=stateZip[stateValues[0]];
        
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
        if component==stateComp{
            return stateValues.count;
        }else{
            return zipValues.count;
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==stateComp{
            return stateValues[row];
        }else{
            return zipValues[row];
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component==stateComp{
            let selectState=stateValues[row];
            zipValues=stateZip[selectState];
            dependDentPicker.reloadComponent(zipComp);
            dependDentPicker.selectRow(0, inComponent: zipComp, animated: true);
        }
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth=pickerView.bounds.size.width;
        if component==zipComp{
            return pickerWidth/3;
        }else{
            return 2*pickerWidth/3;
        }
    }
    
    @IBAction func SelectedValue(sender: AnyObject) {
        let row=dependDentPicker.selectedRowInComponent(stateComp);
        let state=stateValues[row];
        let zip=zipValues[dependDentPicker.selectedRowInComponent(zipComp)];
        let message="you selected is \(state)  and \(zip)";
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
