//
//  SettingSwitchOption.swift
//  SettingsTableView
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

