import PlaygroundSupport
import UIKit

public class NFTCard: UIView {
    var emojiLabel: UILabel!
    var nameLabel: UILabel!
    var symbolLabel: UILabel!
    var idLabel: UILabel!
    var detailsStackView: UIStackView!
    var dateLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        
        let timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(self.animate), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        self.translatesAutoresizingMaskIntoConstraints = false

        emojiLabel = UILabel()
        emojiLabel.font = UIFont.systemFont(ofSize: 80)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        symbolLabel = UILabel()
        symbolLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        symbolLabel.font = UIFont.systemFont(ofSize: 16)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        idLabel = UILabel()
        idLabel.text = "ID: 24"
        idLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        idLabel.font = UIFont.systemFont(ofSize: 16)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailsStackView = UIStackView(arrangedSubviews: [nameLabel, symbolLabel, idLabel])
        detailsStackView.axis = .vertical
        detailsStackView.distribution = .equalSpacing
        detailsStackView.alignment = .leading
        detailsStackView.spacing = 10
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        self.addSubview(emojiLabel)
        self.addSubview(detailsStackView)
        
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            self.widthAnchor.constraint(equalToConstant: 200),
            self.heightAnchor.constraint(equalToConstant: 285),
            
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            
            detailsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailsStackView.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 32),
            detailsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            detailsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @objc func animate() {
        UIView.animate(withDuration: 3, animations: {
            self.layer.transform = CATransform3DMakeRotation(25*CGFloat(Double.pi/180), 1.0, -1.0, 0.0)
        }, completion: { _ in
            UIView.animate(withDuration: 3) {
                self.layer.transform = CATransform3DMakeRotation(335*CGFloat(Double.pi/180), -1.0, -1.0, 0.0)
            }
        })
    }
}
