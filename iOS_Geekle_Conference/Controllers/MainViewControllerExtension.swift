//
//  MainViewControllerExtension.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 12/09/2023.
//

import Foundation
import UIKit
extension MainViewController: CategoryTableControllerDelegate {
    func itemSelected(indexPath: IndexPath) {
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            let controller = UIStoryboard(name: "Optimization", bundle: nil).instantiateViewController(withIdentifier: "OptimizationViewController")
            goToController(controller: controller)
        case IndexPath(row: 1, section: 0):
            let controller = UIStoryboard(name: "Transform", bundle: nil).instantiateViewController(withIdentifier: "TransformViewController")
            goToController(controller: controller)
        case IndexPath(row: 2, section: 0):
            let controller = UIStoryboard(name: "ComplexTransform", bundle: nil).instantiateViewController(withIdentifier: "ComplexTransformViewController")
            goToController(controller: controller)
        case IndexPath(row: 0, section: 1):
            let controller = UIStoryboard(name: "Upload", bundle: nil).instantiateViewController(withIdentifier: "UploadViewController")
            goToController(controller: controller)
        case IndexPath(row: 1, section: 1):
            let controller = UIStoryboard(name: "UploadLarge", bundle: nil).instantiateViewController(withIdentifier: "UploadLargeViewController")
            goToController(controller: controller)
        case IndexPath(row: 2, section: 1):
            let controller = UIStoryboard(name: "FetchUpload", bundle: nil).instantiateViewController(withIdentifier: "FetchUploadViewController")
            goToController(controller: controller)
        case IndexPath(row: 3, section: 1):
            let controller = UIStoryboard(name: "PreProcessing", bundle: nil).instantiateViewController(withIdentifier: "PreProcessingViewController")
            goToController(controller: controller)
        case IndexPath(row: 0, section: 2):
            let controller = UIStoryboard(name: "UploadWidget", bundle: nil).instantiateViewController(withIdentifier: "UploadWidgetViewController")
            goToController(controller: controller)
        case IndexPath(row: 1, section: 2):
            let controller = UIStoryboard(name: "ImageWidget", bundle: nil).instantiateViewController(withIdentifier: "ImageWidgetViewController")
            goToController(controller: controller)
        case IndexPath(row: 2, section: 2):
            let controller = UIStoryboard(name: "VideoWidget", bundle: nil).instantiateViewController(withIdentifier: "VideoWidgetViewController")
            goToController(controller: controller)
        default:
           break
        }
    }

    func goToController(controller: UIViewController) {
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }


}
