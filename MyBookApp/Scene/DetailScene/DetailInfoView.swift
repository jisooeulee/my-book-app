//
//  DetailInfoView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/08.
//

import UIKit

class DetailInfoView: UIView {
    
    let mainTitleLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 10, weight: .semibold)
        lb.textColor = .systemBackground
        lb.textAlignment = .center
        
        return lb
    }()
    
    let contentLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 9, weight: .regular)
        lb.textColor = .systemBackground
        lb.textAlignment = .center
        
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setup() {
        backgroundColor = .white
        setCornerRadius(cornerRadius: 4, masksToBounds: false)
        detailStackViewDropShadow(color: UIColor.gray.cgColor)
    }
    
    func addViews() {
        addSubview(mainTitleLabel)
        addSubview(contentLabel)
    }
    
    func setConstraints() {
        mainTitleLabelConstraints()
        contentLabelConstraints()
    }
    
    private func mainTitleLabelConstraints() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainTitleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        mainTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    private func contentLabelConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
    }
}

