//
//  MainViewController.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 12.04.24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

	let currentNetworkView = CurrentNetworkView()

	private let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		scrollView.contentInset.bottom = -18
		scrollView.contentInsetAdjustmentBehavior = .never
		return scrollView
	}()

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "mainScreen")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		setupConstraints()
	}

	private func setupUI() {
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
		scrollView.addSubview(currentNetworkView)
	}

	private func setupConstraints() {
		scrollView.snp.makeConstraints {
			$0.edges.size.equalToSuperview()
		}
		imageView.snp.makeConstraints {
			$0.leading.trailing.top.width.equalToSuperview()
			$0.height.equalTo(329)
		}
		currentNetworkView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(280)
			$0.leading.trailing.equalToSuperview().inset(20)
		}
	}



}

