//
//  ResultSearchScreenController.swift
//  WiFiDetector
//
//  Created by Sergey Antoniuk on 22.04.24.
//

import UIKit

final class ResultSearchScreenController: UIViewController {

	private let searchTitle: UILabel = {
		let label = UILabel()
		label.text = "searchTitle"
		label.textColor = .white
		return label
	}()

	private let searchSubtitle: UILabel = {
		let label = UILabel()
		label.text = "searchSubtitle"
		label.textColor = .white
		return label
	}()

	private lazy var table: UITableView = {
		let table = UITableView()
		table.delegate = self
		table.dataSource = self
		table.layer.cornerRadius = 8
		table.showsVerticalScrollIndicator = false
		table.backgroundColor = UIColor(named: "100D2C")
		table.separatorColor = .blue
		table.register(ResultCell.self, forCellReuseIdentifier: "resultCell")
		return table
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewWillLayoutSubviews() {
		setupConstraints()
	}

	private func setupUI() {
		[searchTitle, searchSubtitle, table].forEach { view.addSubview($0) }
	}
	private func setupConstraints() {
		searchTitle.snp.makeConstraints {
			$0.top.equalToSuperview().offset(108)
			$0.centerX.equalToSuperview()
		}
		searchSubtitle.snp.makeConstraints {
			$0.top.equalTo(searchTitle.snp.bottom)
			$0.centerX.equalToSuperview()
		}
		table.snp.makeConstraints {
			$0.top.equalTo(searchSubtitle.snp.bottom).offset(32)
			$0.leading.trailing.equalToSuperview().offset(8)
			$0.bottom.equalToSuperview()
		}
	}
}

extension ResultSearchScreenController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		4
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? ResultCell
		cell?.configure()
		cell?.separatorInset.left = -10
		cell?.selectionStyle = .none
		return cell ?? UITableViewCell()
	}
}
