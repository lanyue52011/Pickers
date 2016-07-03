//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by 周登峰 on 7/2/16.
//  Copyright © 2016 tab. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var winLable: UILabel!
    @IBOutlet weak var customPicker: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    private var images:[UIImage]!
    private var winSoundID:SystemSoundID=0
    private var crunchSoundID:SystemSoundID=0
    override func viewDidLoad() {
        super.viewDidLoad()
        images=[UIImage.init(named:"seven")!,
                UIImage.init(named: "bar")!,
                UIImage.init(named: "crown")!,
                UIImage.init(named: "cherry")!,
                UIImage.init(named: "lemon")!,
                UIImage.init(named: "apple")!]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count;
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let image=images[row]
        let imageView=UIImageView(image:image)
        return imageView
    }
    
    @IBAction func start(sender: AnyObject) {
        
        var win=false;
        var lastVal = -1
        var numInRow = -1
        //let lastVal=-1
        
        for i in 0..<5 {
            let newValue=Int(arc4random_uniform(UInt32(images.count)));
            if lastVal==newValue{
                numInRow=numInRow+1
            }else{
                numInRow=1
            }
            lastVal=newValue
            customPicker.selectRow(newValue, inComponent: i, animated: true)
            customPicker.reloadComponent(i)
            if numInRow>=3
            {
                win=true
            }
            
        }
        if crunchSoundID==0{
            
            let path=NSBundle.mainBundle().pathForResource("crunch", ofType : "wav")
            let url=NSURL(fileURLWithPath: path!)
            AudioServicesCreateSystemSoundID(url, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        if win{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(0.5*Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
                self.playSound()
            }
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(0.5*Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
                self.showButton()
            }
        }
        startButton.hidden=true
        winLable.text=""
        
    }
    
    func showButton()
    {
        startButton.hidden=false
    }
    
    func playSound() {
        if winSoundID==0{
            // let winSoundRul=NSBundle.mainBundle().URLForResource("win", withExtension: "wav") as! CFURLRef
            
            let path=NSBundle.mainBundle().pathForResource("win", ofType : "wav")
            let url=NSURL(fileURLWithPath: path!)
            AudioServicesCreateSystemSoundID(url, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        winLable.text="winner!"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(1.5*Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
            self.showButton()
        }
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
