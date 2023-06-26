//
//  UIKitViewController.swift
//  SwiftHelper (iOS)
//
//  Created by sauron on 2022/6/14.
//  Copyright © 2022 com.teenloong. All rights reserved.
//

import SwiftUI
import SnapKit

fileprivate let controls: [SUINavigationLink<String>] = [
    SUINavigationLink("UIButton", destination: { UIButtonDemoViewController() }),
    SUINavigationLink("UIImageView", destination: { UIImageViewDemoViewController() }),
    SUINavigationLink("UIStepper", destination: { UIStepperDemoViewController() }),
    SUINavigationLink("UISwitch", destination: { UISwitchDemoViewController() }),
]

fileprivate  let sections: [SUISection<String, [SUINavigationLink<String>]>] = [
    SUISection("Controls", value: controls)
]

enum UIKitSection: String, CaseIterable {
    case UserInterface
    
    var items:[String] {
        []
    }
}

class UIKitViewController: UIViewController {
    typealias SectionType = SUISection<String, [SUINavigationLink<String>]>
    
    private var tableView: UITableView!
    
    private let sections: [SUISection<String, [SUINavigationLink<String>]>] = [
        SUISection("Controls", value: controls),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        view.backgroundColor = .systemPink
        configureTableView()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
        //        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        //        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reusedIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

struct UIKitViewController_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlatformViewControllerRepresent(UIKitViewController()).ignoresSafeArea()
        }
    }
}

extension UIKitViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reusedIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = sections[indexPath.section].value[indexPath.row].label
        cell.setSelected(false, animated: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].label
    }
}

extension UIKitViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: UIViewController = sections[indexPath.section].value[indexPath.row].destination()
        navigationController?.pushViewController(vc, animated: true)
    }
}
