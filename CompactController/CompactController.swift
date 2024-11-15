//
//  CompactController.swift
//  CompactController
//
//  Created by Роман Крендясов on 15.11.2024.
//

import UIKit

class CompactController: UIViewController {
    
    lazy private var heightSegmentController: UISegmentedControl = {
        let segmentController = UISegmentedControl()
        segmentController.insertSegment(withTitle: "280pt", at: 0, animated: true)
        segmentController.insertSegment(withTitle: "150pt", at: 1, animated: true)
        segmentController.selectedSegmentIndex = 0
        segmentController.translatesAutoresizingMaskIntoConstraints = false
        return segmentController
    }()
    
    lazy private var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.setImage(UIImage(named: "x.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightText
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(closeButton)
        view.addSubview(heightSegmentController)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        heightSegmentController.addTarget(self, action: #selector(changeValueSegmentControl), for: .valueChanged)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            closeButton.heightAnchor.constraint(equalTo: heightSegmentController.heightAnchor, multiplier: 1),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            heightSegmentController.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            heightSegmentController.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    private func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc
    private func changeValueSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.animatePopover(280)
        } else if sender.selectedSegmentIndex == 1 {
            self.animatePopover(150)
        }
    }
    
    private func animatePopover(_ height: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: height)
            self.preferredContentSize = CGSize(width: self.view.frame.width, height: height)
        }
    }
    
}

#Preview {
    CompactController()
}
