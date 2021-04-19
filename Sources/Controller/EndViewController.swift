import UIKit
import PlaygroundSupport

public class EndViewController: UIViewController {
    var endTitle: UILabel!
    var endDescription: UILabel!
    var cardView: NFTCard!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = .backgroundColor
        
        endTitle = UILabel()
        endTitle.text = "Congratulations! 🎉"
        endTitle.font = UIFont.boldSystemFont(ofSize: 44)
        endTitle.textColor = .titleColor
        endTitle.translatesAutoresizingMaskIntoConstraints = false
        
        endDescription = UILabel()
        endDescription.text = StringConstants.endDescription
        endDescription.numberOfLines = 0
        endDescription.font = UIFont.systemFont(ofSize: 22)
        endDescription.textColor = .paragraphColor
        endDescription.translatesAutoresizingMaskIntoConstraints = false
        
        cardView = NFTCard()
        
    }
    
    public override func viewDidLayoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = cardView.bounds
        gradientLayer.colors = [UIColor(red: 19/255, green: 44/255, blue: 173/255, alpha: 1).cgColor, UIColor(red: 137/255, green: 97/255, blue: 250/255, alpha: 1).cgColor]
        gradientLayer.locations = [0.0, 1.3]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        cardView.layer.insertSublayer(gradientLayer, at: 0)
    }

    func layout() {
        view.addSubview(endTitle)
        view.addSubview(endDescription)
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            endTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            endTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            endDescription.leadingAnchor.constraint(equalTo: endTitle.leadingAnchor),
            endDescription.topAnchor.constraint(equalTo: endTitle.bottomAnchor, constant: 16),
            endDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            cardView.widthAnchor.constraint(equalToConstant: 200),
            cardView.heightAnchor.constraint(equalToConstant: 285),
        ])
    }
}
