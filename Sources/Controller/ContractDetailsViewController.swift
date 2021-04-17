import UIKit
import PlaygroundSupport

public class ContractDetailsViewController: UIViewController {
    var contractTitle: UILabel!
    var nextButton: NextButton!
    var contractDescription: UILabel!
    var selectedEmoji = ""
    var nftValuesLabel: UILabel!
    var tokenName: NFTTextField!
    var tokenSymbol: NFTTextField!
    var generateAddressButton: NFTButton!
    var generateIDButton: NFTButton!
    var metadataLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        tokenName.resignFirstResponder()
        tokenSymbol.resignFirstResponder()
    }
    
    func style() {
        view.backgroundColor = .backgroundColor
        
        contractTitle = UILabel()
        contractTitle.text = "Creating the Smart Contract \(selectedEmoji)"
        contractTitle.font = UIFont.boldSystemFont(ofSize: 38)
        contractTitle.textColor = .titleColor
        contractTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contractDescription = UILabel()
        contractDescription.text = StringConstants.contractDetailsDescription
        contractDescription.numberOfLines = 0
        contractDescription.font = UIFont.systemFont(ofSize: 22)
        contractDescription.textColor = .paragraphColor
        contractDescription.translatesAutoresizingMaskIntoConstraints = false
        
        tokenName = NFTTextField(frame: .zero, placeholder: "Name")
        tokenSymbol = NFTTextField(frame: .zero, placeholder: "Symbol")
        
        generateAddressButton = NFTButton(type: .system)
        generateAddressButton.setTitle("Generate Address", for: .normal)
        generateAddressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        generateAddressButton.addTarget(self, action: #selector(generateAddressPressed), for: .touchUpInside)
        
        generateIDButton = NFTButton(type: .system)
        generateIDButton.setTitle("Generate Token ID", for: .normal)
        generateIDButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        generateIDButton.addTarget(self, action: #selector(generateIDPressed), for: .touchUpInside)
        
        metadataLabel = UILabel()
        metadataLabel.text = """
            {
                "name": "test"
                "id": "12"
                "emoji": "\(selectedEmoji)"
            }
            """
        metadataLabel.font = UIFont.systemFont(ofSize: 16)
        metadataLabel.textColor = .paragraphColor
        metadataLabel.numberOfLines = 0
        metadataLabel.translatesAutoresizingMaskIntoConstraints = false
    
        nextButton = NextButton(frame: .zero, animationDelay: 0)
        nextButton.stopAnimating()
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
    func layout() {
        view.addSubview(contractTitle)
        view.addSubview(contractDescription)
        view.addSubview(tokenName)
        view.addSubview(tokenSymbol)
        view.addSubview(generateAddressButton)
        view.addSubview(generateIDButton)
        view.addSubview(metadataLabel)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            contractTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            contractTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            contractDescription.leadingAnchor.constraint(equalTo: contractTitle.leadingAnchor),
            contractDescription.topAnchor.constraint(equalTo: contractTitle.bottomAnchor, constant: 16),
            contractDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            tokenName.topAnchor.constraint(equalTo: contractDescription.bottomAnchor, constant: 16),
            tokenName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            tokenName.heightAnchor.constraint(equalToConstant: 32),
            tokenName.widthAnchor.constraint(equalToConstant: 142),
            
            tokenSymbol.topAnchor.constraint(equalTo: tokenName.bottomAnchor, constant: 16),
            tokenSymbol.leadingAnchor.constraint(equalTo: tokenName.leadingAnchor),
            tokenSymbol.heightAnchor.constraint(equalToConstant: 32),
            tokenSymbol.widthAnchor.constraint(equalToConstant: 142),
            
            generateAddressButton.topAnchor.constraint(equalTo: contractDescription.bottomAnchor, constant: 16),
            generateAddressButton.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 72),
            
            generateIDButton.topAnchor.constraint(equalTo: generateAddressButton.bottomAnchor, constant: 16),
            generateIDButton.leadingAnchor.constraint(equalTo: generateAddressButton.leadingAnchor),
            
            metadataLabel.topAnchor.constraint(equalTo: contractDescription.bottomAnchor, constant: 16),
            metadataLabel.leadingAnchor.constraint(equalTo: generateIDButton.trailingAnchor, constant: 96),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    @objc func generateAddressPressed() {

    }
    
    @objc func generateIDPressed() {
        
    }
    
    @objc func nextPressed() {
        let vc = CreateContractViewController()
        vc.selectedEmoji = self.selectedEmoji
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
