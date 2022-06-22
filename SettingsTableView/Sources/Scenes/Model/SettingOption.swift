//
//  SettingOption.swift
//  SettingsTableView
//
//  Created by Виталий Таран on 22.06.2022.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct Section {
    let title: String
    let options: [SettingsOptionType]
}
