//
//  ViewController.swift
//  CompactController
//
//  Created by Роман Крендясов on 15.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var button: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("Present", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(button)
        button.addTarget(self, action: #selector(pressPresentButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    @objc
    private func pressPresentButton(_ sender: UIButton) {
        let controller = CompactController()
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = CGSize(width: 300, height: 280)
        
        if let popoverViewController =
            controller.popoverPresentationController {
            popoverViewController.delegate = self
            popoverViewController.permittedArrowDirections = .up
            popoverViewController.sourceView = button
            popoverViewController.sourceRect = CGRect(x: button.bounds.midX, y: button.bounds.maxY, width: 0, height: 0)
        }
        present(controller, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

#Preview {
    ViewController()
}
