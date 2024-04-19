//
//  ActionCell.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 19.04.24.
//

import UIKit

enum CellType {
	case bluetooth
	case tips
	case infrared
	case magnetic
}

final class ActionCell: UICollectionViewCell {

	var action: ((CellType) -> Void)?
	private var type: CellType  = .bluetooth

	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return  imageView
	}()

	private let label: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.textAlignment = .center
		return label
	}()



	override init(frame: CGRect) {
		super.init(frame: frame)
		let gesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
		contentView.addGestureRecognizer(gesture)
		contentView.layer.cornerRadius = 8
		contentView.backgroundColor = UIColor(named: "#23175F")
		setupUI()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupUI() {
		contentView.addSubview(label)
		contentView.addSubview(imageView)
	}

	private func setupConstraints() {
		imageView.snp.makeConstraints {
			$0.top.equalToSuperview().inset(24)
			$0.centerX.equalToSuperview()
		}

		label.snp.makeConstraints {
			$0.top.equalTo(imageView.snp.bottom).offset(8)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalToSuperview().inset(24)
		}
	}

	@objc func cellTapped() {
		animateClick { [weak self] in
			guard let self else { return }
			self.action?(self.type)
		}
	}

	func configure(type: CellType, imageStr: String) {
		self.type = type
		imageView.image = UIImage(named: imageStr)
	}
}
