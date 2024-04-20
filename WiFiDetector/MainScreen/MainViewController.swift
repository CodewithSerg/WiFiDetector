//
//  MainViewController.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 12.04.24.
//

import UIKit
import SnapKit

// MARK: - MainViewController

class MainViewController: UIViewController, UITableViewDelegate {

	lazy var layout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumInteritemSpacing = 12
		layout.minimumLineSpacing = 15
		return layout
	}()

	lazy var collection: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collection.delegate = self
		collection.collectionViewLayout = layout
		collection.dataSource = self
		collection.backgroundColor = .clear
		collection.register(ActionCell.self, forCellWithReuseIdentifier: "actionCell")
		return collection
	}()

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

	let viewModel = MainViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Main Screen"
		navigationController?.navigationBar.isHidden = false
		setupUI()
		currentNetworkView.buttonAction = { [weak self] in
			let searchVC = SearchViewController()
			self?.navigationController?.pushViewController(searchVC, animated: true)
		}
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		setupConstraints()
	}

	private func setupUI() {
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
		scrollView.addSubview(currentNetworkView)
		scrollView.addSubview(collection)
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
		collection.snp.makeConstraints {
			$0.top.equalTo(currentNetworkView.snp.bottom).offset(16)
			$0.leading.trailing.equalToSuperview().inset(36)
			$0.height.equalTo(358)
			$0.bottom.equalToSuperview()//.inset(20)
		}
	}
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		viewModel.cells.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actionCell", for: indexPath) as? ActionCell
		let model = viewModel.cells[indexPath.row]
		cell?.configure(model: model)
		cell?.action = { [weak self] type in
//			vm.didTap()
			print(">>> tap cell \(type)")
		}
		return cell ?? UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath
	) -> CGSize {
		let width = (collectionView.frame.width - 20) / 2
		return CGSize(width: width, height: width)
	}
}

