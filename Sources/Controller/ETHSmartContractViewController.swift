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
        view.backgroundColor = .backgroundColor
        
        ethTitle = UILabel()
        ethTitle.text = "The Ethereum Blockchain and Smart Contracts"
        ethTitle.font = UIFont.boldSystemFont(ofSize: 34)
        ethTitle.textColor = .titleColor
        ethTitle.translatesAutoresizingMaskIntoConstraints = false
        
        ethDescription = UILabel()
        ethDescription.text = StringConstants.ethSmartContractsDescription
        ethDescription.numberOfLines = 0
        ethDescription.font = UIFont.systemFont(ofSize: 25)
        ethDescription.textColor = .paragraphColor
        ethDescription.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = NextButton(frame: .zero, animationDelay: 25)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
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
        let vc = NFTSelectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
