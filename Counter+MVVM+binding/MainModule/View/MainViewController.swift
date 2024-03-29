//
//  ViewController.swift
//  Counter+MVVM+binding
//
//  Created by Нурдаулет on 27.03.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private var viewModel: MainViewModel?
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.cornerCurve = .continuous
        return button
    }()
    
    init(viewModel: MainViewModel? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTarget()
        setupBindingWithViewModel()
    }
    
    @objc private func plusButtonTapped() {
        viewModel?.plusButtonTapped()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(counterLabel)
        counterLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(counterLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    private func setupTarget() {
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
}

extension MainViewController {
    private func setupBindingWithViewModel() {
        viewModel?.count?.bind({ [unowned self] count in
            self.counterLabel.text = String(count)
        })
    }
}
