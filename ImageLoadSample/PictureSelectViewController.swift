//
//  PictureSelectViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/21.
//

import UIKit

class PictureSelectViewController: UIViewController {
    
    @IBOutlet weak var PhotographSetting: UIButton!
    @IBOutlet weak var AutoSetting: UIButton!
    @IBOutlet weak var StandardSetting: UIButton!
    @IBOutlet weak var NutralSetting: UIButton!
    @IBOutlet weak var VividSetting: UIButton!
    @IBOutlet weak var MonoSetting: UIButton!
    @IBOutlet weak var PortlateSetting: UIButton!
    @IBOutlet weak var FukeiSetting: UIButton!
    @IBOutlet weak var FlatSetting: UIButton!
    @IBOutlet weak var CreativePictureSetting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            if touch.view?.tag != 1{
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func actionPhotographSetting(_ sender: Any) {
        PhotographSetting.tintColor = UIColor.yellow
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionAutoSetting(_ sender: Any) {
        AutoSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionStandardSetting(_ sender: Any) {
        StandardSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionNutoralSetting(_ sender: Any) {
        NutralSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionVividSetting(_ sender: Any) {
        VividSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionMonoSetting(_ sender: Any) {
        MonoSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionPortlateSetting(_ sender: Any) {
        PortlateSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        FlatSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionFukeiSetting(_ sender: Any) {
        FukeiSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    @IBAction func actionFlatSetting(_ sender: Any) {
        FlatSetting.tintColor = UIColor.yellow
        PhotographSetting.tintColor = UIColor.white
        AutoSetting.tintColor = UIColor.white
        StandardSetting.tintColor = UIColor.white
        NutralSetting.tintColor = UIColor.white
        VividSetting.tintColor = UIColor.white
        MonoSetting.tintColor = UIColor.white
        PortlateSetting.tintColor = UIColor.white
        FukeiSetting.tintColor = UIColor.white
        CreativePictureSetting.tintColor = UIColor.white
        
        NotificationCenter.default.post(name: .postColorProcessButton, object: nil, userInfo: ["valueKey": true])
    }
    
    
    @IBAction func actionCreativePictureController(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowCreativePictureControll", sender: nil)
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
