import UIKit
import PlaygroundSupport

public class ETHSmartContractViewController: UIViewController {
    var ethTitle: UILabel!
    var nextButton: NextButton!
    var ethDescription: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 64/255, alpha: 1)
        
        ethTitle = UILabel()
        ethTitle.text = "The Ethereum Blockchain and Smart Contracts"
        ethTitle.font = UIFont.boldSystemFont(ofSize: 34)
        ethTitle.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        ethTitle.translatesAutoresizingMaskIntoConstraints = false
        
        ethDescription = UILabel()
        ethDescription.text = StringConstants.ethSmartContractsDescription
        ethDescription.numberOfLines = 0
        ethDescription.font = UIFont.systemFont(ofSize: 26)
        ethDescription.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        ethDescription.translatesAutoresizingMaskIntoConstraints = false
        
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
        view.addSubview(ethTitle)
        view.addSubview(ethDescription)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            ethTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            ethTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            ethDescription.leadingAnchor.constraint(equalTo: ethTitle.leadingAnchor),
            ethDescription.topAnchor.constraint(equalTo: ethTitle.bottomAnchor, constant: 16),
            ethDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    
    @objc func nextPressed() {
        print("hey")
    }
    
}
