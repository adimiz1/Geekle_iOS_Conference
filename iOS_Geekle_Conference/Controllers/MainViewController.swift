//
//  ViewController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 11/09/2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tvMain: UITableView!

    var tableController: CategoryTableController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    private func setTableView() {
        tableController = CategoryTableController(delegate: self)
        tvMain.delegate = tableController
        tvMain.dataSource = tableController
    }
}

