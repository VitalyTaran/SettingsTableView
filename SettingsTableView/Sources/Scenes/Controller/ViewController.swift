//
//  ViewController.swift
//  SettingsTableView
//
//  Created by Виталий Таран on 09.06.2022.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(title: "Общее", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed, handler: {
                
            }, isOn: true)),
         
    ]))
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink){
         print("Tapped first cell")
    }),
    .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bonjour"), iconBackgroundColor: .link){
        
    }),
    .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen){
    
    }),
    .staticCell(model: SettingsOption(title: "ICloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
        
    })
    ]))
        
        models.append(Section(title: "Apps", options: [
            .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "note"), iconBackgroundColor: .systemOrange){
         print("Tapped first cell")
    }),
    .staticCell(model: SettingsOption(title: "Звуки & Уведомления", icon: UIImage(systemName: "badge.plus.radiowaves.right"), iconBackgroundColor: .systemRed){
        
    }),
    .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon"), iconBackgroundColor: .systemPurple){
    
    }),
    .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple){
        
    })
    ]))
        
        models.append(Section(title: "Notification", options: [
            .staticCell(model: SettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray){
         print("Tapped first cell")
    }),
    .staticCell(model: SettingsOption(title: "Пункт Управления", icon: UIImage(systemName: "wrench.and.screwdriver"), iconBackgroundColor: .systemGray){
        
    }),
    .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue){
    
    }),
    .staticCell(model: SettingsOption(title: "Экран 'Домой'", icon: UIImage(systemName: "apps.ipad"), iconBackgroundColor: .systemBlue){
        
    })
    ]))
        
    }
    
    
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
        }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
        
        
    }
    
        func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let type = models[indexPath.section].options[indexPath.row]
            switch type.self {
            case .staticCell(let model):
                model.handler()
            case .switchCell(let model):
                model.handler()
                
            }
        }

}



