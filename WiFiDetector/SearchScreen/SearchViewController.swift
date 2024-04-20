//
//  SearchViewController.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 19.04.24.
//

import UIKit
import Lottie
import SnapKit

final class SearchViewController: UIViewController {

	let viewModel = SearchViewModel()

	private let lottieView: LottieAnimationView = {
		let lottieView = LottieAnimationView(name: "search", imageProvider: nil)
		lottieView.contentMode = .scaleAspectFit
		lottieView.loopMode = .loop
		return lottieView
	}()

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.textColor = .white
		label.textAlignment = .center
		label.text = "Scanning Your Wi-Fi"
		return label
	}()

	private let subtitleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 28, weight: .semibold)
		label.textColor = UIColor(named: "#6D59D3")
		label.numberOfLines = .zero
		label.textAlignment = .center
		label.text = "Ready to Scan this network"
		return label
	}()


	private let counterLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = .systemFont(ofSize: 17, weight: .semibold)
		label.text = "0%"
		return label
	}()

	private lazy var mainButton: UIButton = {
		let button = UIButton()
		button.setTitle("Stop", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
		button.backgroundColor = UIColor(named: "#6D59D3")
		button.layer.cornerRadius = 25
		button.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
		return button
	}()

	private let counterDevicesLabel = UILabel()


	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()

	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		setupConstraints()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		lottieView.play()
	}

	private func setupUI() {
		[lottieView, titleLabel, subtitleLabel, counterLabel, mainButton].forEach {
			view.addSubview($0)
		}
	}

	private func setupConstraints() {
		titleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
		}

		subtitleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(titleLabel.snp.bottom)
			$0.bottom.equalTo(lottieView.snp.top).inset(-20)
		}

		lottieView.snp.makeConstraints {
			$0.center.equalToSuperview()
			$0.leading.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(lottieView.snp.width)

		}

		counterLabel.snp.makeConstraints {
			$0.center.equalToSuperview()
		}

		mainButton.snp.makeConstraints {
			$0.bottom.equalTo(view.safeAreaLayoutGuide).inset(46)
			$0.height.equalTo(50)
			$0.leading.trailing.equalToSuperview().inset(20)
		}
	}

	@objc private func didTouchButton() {
		print(">>> serrch tapped")
	}

}
