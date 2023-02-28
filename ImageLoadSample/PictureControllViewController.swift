//
//  PictureControllViewController.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/17.
//

import UIKit

private var selectedRow: Int = 0
private var selectedRowColorProcess: Int = 0
private var selectedRowFilter: Int = 0
private var selectedRowChoshoku: Int = 0

class PictureControllViewController: UIViewController, PickerViewKeyboardDelegate {

    @IBOutlet weak var colorProcessSelect: PickerViewKeyboard!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pictureControllSelect: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var PictureControlerView: UIView!
    
    @IBOutlet weak var filterSelect: PickerViewKeyboard!
    @IBOutlet weak var ChoshokuSelect: PickerViewKeyboard!
    
    @IBOutlet weak var pictureControlBrightStackView: UIStackView!
    @IBOutlet weak var CameraGokanBrightStackView: UIStackView!
    @IBOutlet weak var selectStackView: UIStackView!
    @IBOutlet weak var pictureControlColorStackView: UIStackView!
    @IBOutlet weak var cameraGokanColorStackView: UIStackView!
    
    @IBOutlet weak var PictureControlTekiyoView: UIView!
    @IBOutlet weak var PictureControlBrightView: UIView!
    
    // ピクチャーコントロール系コントローラ
    @IBOutlet weak var tekiyoLabel: UILabel!
    @IBOutlet weak var tekiyoSlider: UISlider!
    @IBOutlet weak var quickSharpLabel: UILabel!
    @IBOutlet weak var quickSharpSlider: UISlider!
    @IBOutlet weak var rinkakuLabel: UILabel!
    @IBOutlet weak var rinkakuSlider: UISlider!
    @IBOutlet weak var middleRangeSharpLabel: UILabel!
    @IBOutlet weak var middleRangeSharpSlider: UISlider!
    @IBOutlet weak var meiryoLabel: UILabel!
    @IBOutlet weak var meiryoSlider: UISlider!
    @IBOutlet weak var contrastLabel: UILabel!
    @IBOutlet weak var contrastSlider: UISlider!
    @IBOutlet weak var brightLabel: UILabel!
    @IBOutlet weak var brightSlider: UISlider!
    @IBOutlet weak var filterButton: PickerViewKeyboard!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var choshokuButton: PickerViewKeyboard!
    @IBOutlet weak var choshokuLabel: UILabel!
    @IBOutlet weak var saidoLabel: UILabel!
    @IBOutlet weak var saidoSlider: UISlider!
    @IBOutlet weak var shikisoLabel: UILabel!
    @IBOutlet weak var shikisoSlider: UISlider!
    @IBOutlet weak var notanLabel: UILabel!
    @IBOutlet weak var notanSlider: UISlider!
    
    // カメラ互換系コントローラ
    @IBOutlet weak var CameraQuickSharpLabel: UILabel!
    @IBOutlet weak var CameraQuickSharpSlider: UISlider!
    @IBOutlet weak var CameraRinkakuLabel: UILabel!
    @IBOutlet weak var CameraRinkakuSlider: UISlider!
    @IBOutlet weak var CameraMeiryoLabel: UILabel!
    @IBOutlet weak var CameraMeiryoSlider: UISlider!
    @IBOutlet weak var CameraContrastLabel: UILabel!
    @IBOutlet weak var CameraContrastSlider: UISlider!
    @IBOutlet weak var CameraBrightLabel: UILabel!
    @IBOutlet weak var CameraBrightSlider: UISlider!
    @IBOutlet weak var CameraSaidoLabel: UILabel!
    @IBOutlet weak var CameraSaidoSlider: UISlider!
    @IBOutlet weak var CameraShikisoLabel: UILabel!
    @IBOutlet weak var CameraShikisoSlider: UISlider!
    @IBOutlet weak var CameraNotanLabel: UILabel!
    @IBOutlet weak var CameraNotanSlider: UISlider!
    
    
    let colorProcessList = ["最新のピクチャーコントロール", "カメラ互換"]
    let filterList = ["Off", "Yellow", "Orange", "Red", "Green"]
    let choshokuList = ["B&W", "Sepia", "Cyanotype", "Red", "Yellow", "Green", "Blue Green", "Blue", "Purple Blue", "Red Purple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景のみ透過
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        // カラープロセス初期設定
        colorProcessSelect.delegate = self
        colorProcessSelect.setTitle(colorProcessList[0], for: .normal)
        
        // ピクチャーコントロール初期設定
        pictureControllSelect.setTitle("撮影時の設定([SD]スタンダード)", for: .normal)
        
        // カラープロセスビュー初期設定（最新のピクチャーコントロール表示）
        CameraGokanBrightStackView.isHidden = true
        cameraGokanColorStackView.isHidden = true
        PictureControlTekiyoView.isHidden = true
        
        // フィルター初期設定
        filterSelect.delegate = self
        filterSelect.setTitle(filterList[0], for: .normal)
        
        // 調色初期設定
        ChoshokuSelect.delegate = self
        ChoshokuSelect.setTitle(choshokuList[0], for: .normal)
        
        // カラープロセス待受
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotifyOperateColorProcessButton(notification: )), name: .postColorProcessButton, object: nil)
    }
    
    
    @IBAction func actionPictureControllSelect(_ sender: Any) {
        NotificationCenter.default.post(name: .postPictureControllSelect, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isPortrait {
            colorProcessSelect.frame.size.width = 240
            pictureControllSelect.frame.size.width = 240
            
            colorProcessSelect.imageEdgeInsets = UIEdgeInsets(top: 0, left: 230, bottom: 0, right: 0)
            pictureControllSelect.imageEdgeInsets = UIEdgeInsets(top: 0, left: 230, bottom: 0, right: 0)
            
        } else {
            colorProcessSelect.frame.size.width = 175
            pictureControllSelect.frame.size.width = 175
            
            colorProcessSelect.imageEdgeInsets = UIEdgeInsets(top: 0, left: 165, bottom: 0, right: 0)
            pictureControllSelect.imageEdgeInsets = UIEdgeInsets(top: 0, left: 165, bottom: 0, right: 0)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String> {
        var returnList:Array<String> = []
        
        if sender.tag == 1 {
            returnList = colorProcessList
        }else if sender.tag == 2 {
            returnList = filterList
        }else if sender.tag == 3 {
            returnList = choshokuList
        }
        
        return returnList
    }
    
    func initSelectedRow(sender: PickerViewKeyboard) -> Int {
        var returnRow:Int = 0
        
        if sender.tag == 1 {
            returnRow = selectedRowColorProcess
        }else if sender.tag == 2 {
            returnRow = selectedRowFilter
        }else if sender.tag == 3 {
            returnRow = selectedRowChoshoku
        }
        
        return returnRow
    }
    
    func didCancel(sender: PickerViewKeyboard) {
        sender.resignFirstResponder()
    }
    
    // ピッカーにてDoneが押された時
    func didDone(sender: PickerViewKeyboard, selectedData: String) {
        if sender.tag == 1 {
            if !(0...1 ~= selectedRow) {
                return
            }
            
            selectedRowColorProcess = selectedRow
            colorProcessSelect.setTitle(colorProcessList[selectedRowColorProcess], for: .normal)
            
            if selectedRowColorProcess == 0 {
                pictureControlBrightStackView.isHidden = false
                pictureControlColorStackView.isHidden = false
                CameraGokanBrightStackView.isHidden = true
                cameraGokanColorStackView.isHidden = true
            } else {
                pictureControlBrightStackView.isHidden = true
                pictureControlColorStackView.isHidden = true
                CameraGokanBrightStackView.isHidden = false
                cameraGokanColorStackView.isHidden = false
            }
            
        }else if sender.tag == 2 {
            if !(0...4 ~= selectedRow) {
                return
            }
            
            selectedRowFilter = selectedRow
            filterSelect.setTitle(filterList[selectedRowFilter], for: .normal)
        }else if sender.tag == 3 {
            if !(0...9 ~= selectedRow) {
                return
            }
            
            
            selectedRowChoshoku = selectedRow
            ChoshokuSelect.setTitle(choshokuList[selectedRowChoshoku], for: .normal)
        }

        sender.resignFirstResponder()
    }
    
    
    
    @IBAction func sliderStartTouchDown(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        self.sliderOtherControlHiddenOn()
        
        if sender.tag == 11 {
            tekiyoSlider.isHidden = false
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        }else if sender.tag == 12 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = false
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        }else if sender.tag == 13 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = false
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 14 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = false
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 15 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = false
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 16 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = false
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 17 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = false
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 18 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = false
            shikisoSlider.isHidden = true
            notanSlider.isHidden = true
        } else if sender.tag == 19 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = false
            notanSlider.isHidden = true
        } else if sender.tag == 20 {
            tekiyoSlider.isHidden = true
            quickSharpSlider.isHidden = true
            rinkakuSlider.isHidden = true
            middleRangeSharpSlider.isHidden = true
            meiryoSlider.isHidden = true
            contrastSlider.isHidden = true
            brightSlider.isHidden = true
            saidoSlider.isHidden = true
            shikisoSlider.isHidden = true
            notanSlider.isHidden = false
        } else if sender.tag == 21 {
            CameraQuickSharpSlider.isHidden = false
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 22 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = false
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 23 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = false
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 24 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = false
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 25 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = false
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 26 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = false
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 27 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = false
            CameraNotanSlider.isHidden = true
        } else if sender.tag == 28 {
            CameraQuickSharpSlider.isHidden = true
            CameraRinkakuSlider.isHidden = true
            CameraMeiryoSlider.isHidden = true
            CameraContrastSlider.isHidden = true
            CameraBrightSlider.isHidden = true
            CameraSaidoSlider.isHidden = true
            CameraShikisoSlider.isHidden = true
            CameraNotanSlider.isHidden = false
        }
        
        NotificationCenter.default.post(name: .postSliderChangeStart, object: nil)
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        var postValue:String = ""
        
        if sender.tag == 11 {
            postValue = "適用度：" + String(sender.value)
        }else if sender.tag == 12 {
            postValue = "クイックシャープ：" + String(sender.value)
        }else if sender.tag == 13 {
            postValue = "輪郭調整：" + String(sender.value)
        } else if sender.tag == 14 {
            postValue = "ミドルレンジシャープ：" + String(sender.value)
        } else if sender.tag == 15 {
            postValue = "明瞭度：" + String(sender.value)
        } else if sender.tag == 16 {
            postValue = "コントラスト：" + String(sender.value)
        } else if sender.tag == 17 {
            postValue = "明るさ：" + String(sender.value)
        } else if sender.tag == 18 {
            postValue = "色の濃さ(彩度)：" + String(sender.value)
        } else if sender.tag == 19 {
            postValue = "色合い(色相)：" + String(sender.value)
        } else if sender.tag == 20 {
            postValue = "色の濃淡を調整：" + String(sender.value)
        } else if sender.tag == 21 {
            postValue = "クイック調整：" + String(sender.value)
        } else if sender.tag == 22 {
            postValue = "輪郭調整：" + String(sender.value)
        } else if sender.tag == 23 {
            postValue = "明瞭度：" + String(sender.value)
        } else if sender.tag == 24 {
            postValue = "コントラスト：" + String(sender.value)
        } else if sender.tag == 25 {
            postValue = "明るさ：" + String(sender.value)
        } else if sender.tag == 26 {
            postValue = "色の濃さ(彩度)：" + String(sender.value)
        } else if sender.tag == 27 {
            postValue = "色合い(色相)：" + String(sender.value)
        } else if sender.tag == 28 {
            postValue = "色の濃淡を調整：" + String(sender.value)
        }
        
        
        NotificationCenter.default.post(name: .postSliderChangeValue, object: nil, userInfo: ["valueKey": postValue])
    }
    
    @IBAction func sliderEndTouchDown(_ sender: Any) {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.sliderOtherControlHiddenOff()
        NotificationCenter.default.post(name: .postSliderChangeEnd, object: nil)
    }
    
    private func sliderOtherControlHiddenOn(){
        colorProcessSelect.isHidden = true
        resetButton.isHidden = true
        pictureControllSelect.isHidden = true
        confirmButton.isHidden = true
        quickSharpLabel.isHidden = true
        rinkakuLabel.isHidden = true
        middleRangeSharpLabel.isHidden = true
        meiryoLabel.isHidden = true
        contrastLabel.isHidden = true
        brightLabel.isHidden = true
        filterLabel.isHidden = true
        filterButton.isHidden = true
        choshokuLabel.isHidden = true
        choshokuButton.isHidden = true
        saidoLabel.isHidden = true
        shikisoLabel.isHidden = true
        notanLabel.isHidden = true
        
        // カメラ互換
        CameraQuickSharpLabel.isHidden = true
        CameraRinkakuLabel.isHidden = true
        CameraMeiryoLabel.isHidden = true
        CameraContrastLabel.isHidden = true
        CameraBrightLabel.isHidden = true
        CameraSaidoLabel.isHidden = true
        CameraShikisoLabel.isHidden = true
        CameraNotanLabel.isHidden = true
    }
    
    private func sliderOtherControlHiddenOff(){
        colorProcessSelect.isHidden = false
        resetButton.isHidden = false
        pictureControllSelect.isHidden = false
        confirmButton.isHidden = false
        tekiyoLabel.isHidden = false
        quickSharpLabel.isHidden = false
        rinkakuLabel.isHidden = false
        middleRangeSharpLabel.isHidden = false
        meiryoLabel.isHidden = false
        contrastLabel.isHidden = false
        brightLabel.isHidden = false
        filterLabel.isHidden = false
        filterButton.isHidden = false
        choshokuLabel.isHidden = false
        choshokuButton.isHidden = false
        saidoLabel.isHidden = false
        shikisoLabel.isHidden = false
        notanLabel.isHidden = false
        quickSharpSlider.isHidden = false
        rinkakuSlider.isHidden = false
        middleRangeSharpSlider.isHidden = false
        meiryoSlider.isHidden = false
        contrastSlider.isHidden = false
        brightSlider.isHidden = false
        saidoSlider.isHidden = false
        shikisoSlider.isHidden = false
        notanSlider.isHidden = false
        
        // カメラ互換
        CameraQuickSharpLabel.isHidden = false
        CameraRinkakuLabel.isHidden = false
        CameraMeiryoLabel.isHidden = false
        CameraContrastLabel.isHidden = false
        CameraBrightLabel.isHidden = false
        CameraSaidoLabel.isHidden = false
        CameraShikisoLabel.isHidden = false
        CameraNotanLabel.isHidden = false
        CameraQuickSharpSlider.isHidden = false
        CameraRinkakuSlider.isHidden = false
        CameraMeiryoSlider.isHidden = false
        CameraContrastSlider.isHidden = false
        CameraBrightSlider.isHidden = false
        CameraSaidoSlider.isHidden = false
        CameraShikisoSlider.isHidden = false
        CameraNotanSlider.isHidden = false
    }
    
    // カラープロセスビュー切り替え
    @objc func handleNotifyOperateColorProcessButton(notification:Notification){
        let value:Bool = notification.userInfo?["valueKey"] as! Bool
        
        if value {
            pictureControlBrightStackView.isHidden = false
            pictureControlColorStackView.isHidden = false
            CameraGokanBrightStackView.isHidden = true
            cameraGokanColorStackView.isHidden = true
            
            PictureControlTekiyoView.isHidden = true
            PictureControlBrightView.isHidden = false
        } else {
            pictureControlBrightStackView.isHidden = false
            pictureControlColorStackView.isHidden = false
            CameraGokanBrightStackView.isHidden = true
            cameraGokanColorStackView.isHidden = true
            
            PictureControlTekiyoView.isHidden = false
            PictureControlBrightView.isHidden = true
        }
    }
}

// ピッカー用クラス群
class PickerViewKeyboard: UIButton{
    var delegate: PickerViewKeyboardDelegate!
    var pickerView: UIPickerView!

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // ピッカーに表示させるデータ
    var data: Array<String> {
        return delegate.titlesOfPickerViewKeyboard(sender: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(didTouchUpInside(_:)), for: .touchUpInside)
    }

    @objc func didTouchUpInside(_ sender: UIButton) {
        becomeFirstResponder()
    }

    override var inputView: UIView? {
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.backgroundColor = UIColor.darkGray
        pickerView.setValue(UIColor.white, forKey: "textColor")
        let row = delegate.initSelectedRow(sender: self)
        pickerView.selectRow(row, inComponent: 0, animated: true)

        return pickerView
    }

    override var inputAccessoryView: UIView? {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        toolbar.barStyle = UIBarStyle.black

        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        //let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PickerViewKeyboard.cancelPicker))
        let cancelItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(PickerViewKeyboard.cancelPicker))
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        //let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PickerViewKeyboard.donePicker))
        let doneButtonItem = UIBarButtonItem(title: "決定", style: .done, target: self, action: #selector(PickerViewKeyboard.donePicker))

        let toolbarItems = [space, cancelItem, flexSpaceItem, doneButtonItem, space]

        toolbar.setItems(toolbarItems, animated: true)

        return toolbar
    }

    @objc func cancelPicker() {
        delegate.didCancel(sender: self)
    }

    @objc func donePicker() {
        delegate.didDone(sender: self, selectedData: data[pickerView.selectedRow(inComponent: 0)])
    }
}

extension PickerViewKeyboard: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
}

protocol PickerViewKeyboardDelegate {
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String>
    func initSelectedRow(sender: PickerViewKeyboard) -> Int
    func didCancel(sender: PickerViewKeyboard)
    func didDone(sender: PickerViewKeyboard, selectedData: String)
}

// ボタン用
extension UIButton{
    func iconToRight(){
        contentHorizontalAlignment = .trailing
        
        semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
        ? .forceLeftToRight : .forceRightToLeft
    }
}
