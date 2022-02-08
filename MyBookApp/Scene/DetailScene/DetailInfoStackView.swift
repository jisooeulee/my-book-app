//
//  DetailInfoStackView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/08.
//

import UIKit

class DetailInfoStackView: UIView {
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = NSLayoutConstraint.Axis.horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 10
        
        return sv
    }()
    
    let categoriesView: DetailInfoView = DetailInfoView()
    let publisherView: DetailInfoView = DetailInfoView()
    let publishedDateView: DetailInfoView = DetailInfoView()
    let pageCountView: DetailInfoView = DetailInfoView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError(ErrorMessage.unavailable)
    }
    
    func setup() {
        backgroundColor = .clear
    }
    
    func addViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(categoriesView)
        stackView.addArrangedSubview(publisherView)
        stackView.addArrangedSubview(publishedDateView)
        stackView.addArrangedSubview(pageCountView)
    }
    
    func setConstraints() {
        stackViewConstraints()
    }
    
    private func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

