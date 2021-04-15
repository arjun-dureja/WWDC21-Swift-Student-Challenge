import UIKit
import PlaygroundSupport

public class HomeViewController: UIViewController {
    var nftTitle: UILabel!
    var nextButton: NextButton!
    var nftDescription: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 64/255, alpha: 1)
        
        nftTitle = UILabel()
        nftTitle.text = "Non-Fungible Tokens"
        nftTitle.font = UIFont.boldSystemFont(ofSize: 44)
        nftTitle.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        nftTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nftDescription = UILabel()
        nftDescription.text = StringConstants.introDescription
        nftDescription.numberOfLines = 0
        nftDescription.font = UIFont.systemFont(ofSize: 26)
        nftDescription.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        nftDescription.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = NextButton(type: .system)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
    @objc func animateNext() {
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction], animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction]) {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        })
    }
    
    func layout() {
        view.addSubview(nextButton)
        view.addSubview(nftDescription)
        view.addSubview(nftTitle)
        
        NSLayoutConstraint.activate([
            nftTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            nftTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            nftDescription.leadingAnchor.constraint(equalTo: nftTitle.leadingAnchor),
            nftDescription.topAnchor.constraint(equalTo: nftTitle.bottomAnchor, constant: 16),
            nftDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    
    @objc func nextPressed() {
        let vc = ETHSmartContractViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
