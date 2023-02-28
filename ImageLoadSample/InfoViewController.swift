//
//  InfoViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/14.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoSwitch: UISwitch!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var histogramButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        if delegate.strucInfoState.switchState{
            if delegate.strucInfoState.infoButtonSate{
                infoButton.setTitleColor(UIColor.yellow, for: .normal)
                infoButton.tintColor = UIColor.yellow
                
                histogramButton.setTitleColor(UIColor.white, for: .normal)
                histogramButton.tintColor = UIColor.white
            }else{
                infoButton.setTitleColor(UIColor.white, for: .normal)
                infoButton.tintColor = UIColor.white
                
                histogramButton.setTitleColor(UIColor.yellow, for: .normal)
                histogramButton.tintColor = UIColor.yellow
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            if touch.view?.tag != 1{
                self.dismiss(animated: true)
            }
        }
    }
    

    @IBAction func actionSwitch(_ sender: UISwitch) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        if sender.isOn{
            delegate.strucInfoState.switchState = true
            if delegate.strucInfoState.infoButtonSate {
                infoButton.setTitleColor(UIColor.yellow, for: .normal)
                infoButton.tintColor = UIColor.yellow
                histogramButton.setTitleColor(UIColor.white, for: .normal)
                histogramButton.tintColor = UIColor.white
            }else{
                infoButton.setTitleColor(UIColor.white, for: .normal)
                infoButton.tintColor = UIColor.white
                histogramButton.setTitleColor(UIColor.yellow, for: .normal)
                histogramButton.tintColor = UIColor.yellow
            }
            
        }else{
            delegate.strucInfoState.switchState = false
            infoButton.setTitleColor(UIColor.white, for: .normal)
            infoButton.tintColor = UIColor.white
            histogramButton.setTitleColor(UIColor.white, for: .normal)
            histogramButton.tintColor = UIColor.white
        }
        
        NotificationCenter.default.post(name: .postSwitchInfo, object: nil)
    }
    
    @IBAction func actionInfoButton(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.strucInfoState.switchState = true
        delegate.strucInfoState.infoButtonSate = true
        delegate.strucInfoState.histogramButtonState = false
        
        infoSwitch.isOn = true
        infoSwitch.sendActions(for: .valueChanged)
        
        infoButton.setTitleColor(UIColor.yellow, for: .normal)
        infoButton.tintColor = UIColor.yellow
        
        histogramButton.setTitleColor(UIColor.white, for: .normal)
        histogramButton.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postSwitchInfo, object: nil)
    }
    
    @IBAction func actionHistogramButton(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.strucInfoState.switchState = true
        delegate.strucInfoState.infoButtonSate = false
        delegate.strucInfoState.histogramButtonState = true
        
        infoSwitch.isOn = true
        infoSwitch.sendActions(for: .valueChanged)
        
        infoButton.setTitleColor(UIColor.white, for: .normal)
        infoButton.tintColor = UIColor.white
        
        histogramButton.setTitleColor(UIColor.yellow, for: .normal)
        histogramButton.tintColor = UIColor.yellow
        
        NotificationCenter.default.post(name: .postSwitchInfo, object: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
