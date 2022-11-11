//
//  PhotoViewController.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 8/11/22.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private let viewModel = PhotoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo List"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        initVM()
    }
    
    private func initVM() {
        viewModel.photos.bind { [weak self] photos in
            DispatchQueue.main.async {
                if photos.count > 0 {
                    self?.tableView.reloadData()
                }
            }
        }
        viewModel.error.bind { error in
            print(error?.localizedDescription)
        }
        viewModel.getPhotos()
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

extension PhotoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.photos.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.title.text = self.viewModel.photos.value[indexPath.row].name
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.photoSelected(at: indexPath)
        let controller = storyboard?.instantiateViewController(withIdentifier: "PhotoDetailViewController") as! PhotoDetailViewController
        navigationController?.pushViewController(controller, animated: true)
    }
}

class PhotoCell: UITableViewCell {
    @IBOutlet var title: UILabel!
}
