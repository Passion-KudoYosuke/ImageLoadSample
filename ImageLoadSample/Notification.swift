//
//  Notification.swift
//  ImageLoadSample
//
//  Created by kudo on 2023/02/17.
//

import Foundation

extension Notification.Name{
    static let postSwitchInfo = Notification.Name("postSwitchInfo")
    static let postInfoButton = Notification.Name("postInfoButton")
    static let postPictureControllSelect = Notification.Name("postPictureControllSelect")
    static let postSliderChangeStart = Notification.Name("postSliderChangStart")
    static let postSliderChangeValue = Notification.Name("postSliderChangValue")
    static let postSliderChangeEnd = Notification.Name("postSliderChangEnd")
    
    
    // ピクチャーコントロール
    static let postColorProcessButton = Notification.Name("postColorProcessButton")
}


