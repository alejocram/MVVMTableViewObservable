//
//  PhotoDetailViewController.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 9/11/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var createdAtLabel: UILabel!
    @IBOutlet var cameraLabel: UILabel!
    
    var viewModel = PhotoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Detail"
        initVM()
    }
    
    func initVM() {
        self.viewModel.photo.bind { [weak self] photo in
            self?.title = photo?.name
            self?.descriptionLabel.text = photo?.description
            self?.createdAtLabel.text = photo?.created_at.formatted()
            self?.cameraLabel.text = photo?.camera
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
