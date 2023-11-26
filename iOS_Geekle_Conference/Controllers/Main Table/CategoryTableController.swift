//
//  CategoryTableController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 12/09/2023.
//

import Foundation
import UIKit

protocol CategoryTableControllerDelegate {
    func itemSelected(indexPath: IndexPath)
}

class CategoryTableController: NSObject, UITableViewDelegate, UITableViewDataSource {

    var delegate: CategoryTableControllerDelegate

    init(delegate: CategoryTableControllerDelegate) {
        self.delegate = delegate
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Delivery"
        case 1:
            return "Upload"
        case 2:
            return "UI"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        case 2:
            return 4
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
        cell.selectionStyle = .none
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            cell.lbMain.text = "Optimization"
        case IndexPath(row: 1, section: 0):
            cell.lbMain.text = "Transform"
        case IndexPath(row: 2, section: 0):
            cell.lbMain.text = "Complex Transform"
        case IndexPath(row: 0, section: 1):
            cell.lbMain.text = "Upload"
        case IndexPath(row: 1, section: 1):
            cell.lbMain.text = "Upload Large"
        case IndexPath(row: 2, section: 1):
            cell.lbMain.text = "Fetch Upload"
        case IndexPath(row: 3, section: 1):
            cell.lbMain.text = "Pre Processing Image"
        case IndexPath(row: 0, section: 2):
            cell.lbMain.text = "Upload Widget"
        case IndexPath(row: 1, section: 2):
            cell.lbMain.text = "Image Widget"
        case IndexPath(row: 2, section: 2):
            cell.lbMain.text = "Video Player"
        case IndexPath(row: 3, section: 2):
            cell.lbMain.text = "Video Feed"
        default:
            cell.lbMain.text = ""
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.itemSelected(indexPath: indexPath)
    }


}
