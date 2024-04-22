//
//  ResultCell.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 22.04.24.
//

import UIKit

final class ResultCell: UITableViewCell {

	private let image: UIImageView = {
		let imageView = UIImageView()
		imageView.clipsToBounds = true
		return imageView
	}()

	private let title: UILabel = {
		let title = UILabel()
		title.font = .systemFont(ofSize: 17, weight: .medium)
		title.textColor = .white
		return title
	}()

	private let subTitle: UILabel = {
		let title = UILabel()
		title.font = .systemFont(ofSize: 13, weight: .medium)
		title.textColor = .gray
		return title
	}()

	private let arrowImage: UIImageView = {
		let imageView = UIImageView()
		return imageView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupUI() {
		contentView.backgroundColor = .clear
		backgroundColor = .clear
		[image, title, subTitle, arrowImage].forEach { contentView.addSubview($0) }
	}
	private func setupConstraints() {
		image.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(16)
			$0.centerY.equalToSuperview()
		}
		title.snp.makeConstraints {
			$0.leading.equalTo(image.snp.trailing).offset(16)
			$0.top.equalToSuperview().offset(7)

		}
		subTitle.snp.makeConstraints {
			$0.leading.equalTo(title.snp.leading)
			$0.top.equalTo(title.snp.bottom).offset(4)
			$0.bottom.equalToSuperview().inset(20)
		}
		arrowImage.snp.makeConstraints {
			$0.trailing.equalToSuperview().inset(16)
			$0.centerY.equalToSuperview()
		}
	}

	func configure() {
		title.text = "title"
		subTitle.text = "subtitle"
		image.image = UIImage(named: "networkNorm")
		arrowImage.image = UIImage(named: "arrowBack")
	}
}
