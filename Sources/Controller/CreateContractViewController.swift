import UIKit
import PlaygroundSupport

public class CreateContractViewController: UIViewController {
    var contractTitle: UILabel!
    var nextButton: NextButton!
    var contractDescription: UILabel!
    var selectedEmoji = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = .backgroundColor
        
        contractTitle = UILabel()
        
        contractTitle.text = "Creating the Smart Contract"
        contractTitle.font = UIFont.boldSystemFont(ofSize: 34)
        contractTitle.textColor = .titleColor
        contractTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contractDescription = UILabel()
        contractDescription.text = StringConstants.createSmartContractDescription
        contractDescription.numberOfLines = 0
        contractDescription.font = UIFont.systemFont(ofSize: 26)
        contractDescription.textColor = .paragraphColor
        contractDescription.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = NextButton(frame: .zero, animationDelay: 10)
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
    func layout() {
        view.addSubview(contractTitle)
        view.addSubview(contractDescription)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            contractTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            contractTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            contractDescription.leadingAnchor.constraint(equalTo: contractTitle.leadingAnchor),
            contractDescription.topAnchor.constraint(equalTo: contractTitle.bottomAnchor, constant: 16),
            contractDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    
    @objc func nextPressed() {
        let vc = NFTSelectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
