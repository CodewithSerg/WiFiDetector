//
//  CurrentNetworkView.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 19.04.24.
//

import UIKit
import SnapKit

// MARK: - CurrentNetworkView

final class CurrentNetworkView: UIView {

	var buttonAction: (() -> Void)?

	private let mainStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = 8
		return stack
	}()

	private let nameLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 28, weight: .bold)
		label.textColor = .cyan
		label.textAlignment = .center
		label.text = "WIFI_Name"

		return label
	}()

	private let title: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.textColor = .white
		label.textAlignment = .center
		label.text = "Current Wi-Fi"
		return label
	}()

	private let subTitle: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 17, weight: .regular)
		label.textColor = .cyan
		label.textAlignment = .center
		label.text = "Ready to Scan this network"
		return label
	}()

	private lazy var button: UIButton = {
		let button = UIButton()
		button.setTitle("Scan Current Network", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
		button.layer.cornerRadius = 25
		button.backgroundColor = UIColor(named: "#6D59D3")
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupUI() {
		addSubview(mainStack)
		[title, nameLabel, subTitle, button].forEach {
			mainStack.addArrangedSubview($0)
		}
		backgroundColor = UIColor(named: "100D2C")
		layer.cornerRadius = 8
	}

	private func setupConstraints() {
		mainStack.snp.makeConstraints {
			$0.leading.trailing.equalToSuperview().inset(16)
			$0.top.bottom.equalToSuperview().inset(24)
		}
		button.snp.makeConstraints {
			$0.height.equalTo(50)
		}
		mainStack.setCustomSpacing(16, after: nameLabel)
	}

	@objc
	private func buttonTapped() {
		button.animateClick { [weak self] in
			self?.buttonAction?()
		}
	}

	func configure(with name: String) {
		nameLabel.text = name
	}

}
