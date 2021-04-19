import UIKit
import PlaygroundSupport

// First Screen
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
        view.backgroundColor = .backgroundColor
        
        nftTitle = UILabel()
        nftTitle.text = "Non-Fungible Tokens"
        nftTitle.font = UIFont.boldSystemFont(ofSize: 44)
        nftTitle.textColor = .titleColor
        nftTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nftDescription = UILabel()
        nftDescription.text = StringConstants.introDescription
        nftDescription.numberOfLines = 0
        nftDescription.font = UIFont.systemFont(ofSize: 26)
        nftDescription.textColor = .paragraphColor
        nftDescription.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = NextButton(frame: .zero, animationDelay: 20)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
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
