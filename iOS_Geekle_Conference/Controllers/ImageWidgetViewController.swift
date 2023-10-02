//
//  ImageWidgetViewController.swift
//  iOS_Geekle_Conference
//
//  Created by Adi Mizrahi on 19/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class ImageWidgetViewController: UIViewController {
    
    @IBOutlet weak var vwBack: UIView!
    @IBOutlet weak var ivMain: CLDUIImageView!
    @IBOutlet weak var btnLocal: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnPublicId: UIButton!

    var cloudinary: CLDCloudinary!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setCloudinary()
        setBackButton()
        setButtons()
    }

    func setCloudinary() {
        cloudinary = CLDCloudinary(configuration: CLDConfiguration(cloudName: "adimizrahi2", secure: true))
    }

    func setBackButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(stepBack))
        vwBack.addGestureRecognizer(gesture)
    }

    func setButtons() {
        btnLocal.addTarget(self, action: #selector(loadLocalImage), for: .touchUpInside)
        btnRemote.addTarget(self, action: #selector(loadRemoteImageFromUrl), for: .touchUpInside)
        btnPublicId.addTarget(self, action: #selector(loadRemoteImageFromPublicId), for: .touchUpInside)
    }

    @objc func stepBack() {
        self.dismiss(animated: true)
    }

    @objc func loadLocalImage() {
        ivMain.image = UIImage(named: "white-dog")
    }

    @objc func loadRemoteImageFromUrl() {
        ivMain.cldSetImage("https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&quality=85&auto=format&fit=max&s=a52bbe202f57ac0f5ff7f47166906403", cloudinary: cloudinary)
    }

    @objc func loadRemoteImageFromPublicId() {
        ivMain.cldSetImage(publicId: "sample", cloudinary: cloudinary)
    }
}
