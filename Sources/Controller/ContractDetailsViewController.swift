import UIKit
import PlaygroundSupport

// Fourth Screen
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
    var id: String?
    var metadataLabel: UILabel!
    var createContractButton: NFTButton!
    var contractProgressView: NFTProgressView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
        // Hide keyboard when user taps anywhere on the screen
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
        contractDescription.font = UIFont.systemFont(ofSize: 20)
        contractDescription.textColor = .paragraphColor
        contractDescription.translatesAutoresizingMaskIntoConstraints = false
        
        tokenName = NFTTextField(frame: .zero, placeholder: "Name")
        tokenName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
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
                "name": ""
                "id": ""
                "emoji": "\(selectedEmoji)"
            }
            """
        metadataLabel.font = UIFont.systemFont(ofSize: 14)
        metadataLabel.textColor = .metadataColor
        metadataLabel.numberOfLines = 0
        metadataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        createContractButton = NFTButton(type: .system)
        createContractButton.setTitle("Create Contract", for: .normal)
        createContractButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        createContractButton.isUserInteractionEnabled = false
        createContractButton.backgroundColor = .gray
        createContractButton.addTarget(self, action: #selector(createContractPressed), for: .touchUpInside)
        
        contractProgressView = NFTProgressView(progressViewStyle: .bar)
        
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
        view.addSubview(createContractButton)
        view.addSubview(contractProgressView)
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
            generateAddressButton.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 56),
            
            generateIDButton.topAnchor.constraint(equalTo: generateAddressButton.bottomAnchor, constant: 16),
            generateIDButton.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 56),
            
            metadataLabel.topAnchor.constraint(equalTo: contractDescription.bottomAnchor, constant: 16),
            metadataLabel.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 304),
            
            createContractButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            createContractButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            contractProgressView.topAnchor.constraint(equalTo: createContractButton.topAnchor),
            contractProgressView.leadingAnchor.constraint(equalTo: createContractButton.trailingAnchor, constant: 16),
            contractProgressView.widthAnchor.constraint(equalToConstant: 375),
            contractProgressView.heightAnchor.constraint(equalToConstant: 35),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    // Update metadata every time the textfield changes
    @objc func textFieldDidChange(_ textField: UITextField) {
        metadataLabel.text = """
            {
                "name": "\(textField.text ?? "")"
                "id": "\(id ?? "")"
                "emoji": "\(selectedEmoji)"
            }
            """
    }
    
    @objc func generateAddressPressed() {
        generateAddressButton.backgroundColor = .clear
        generateAddressButton.setTitleColor(.paragraphColor, for: .normal)
        generateAddressButton.setTitle("0x89205A3A3b2A69De6D\nbf7f01ED13B2108B2c43e7", for: .normal)
        generateAddressButton.titleLabel?.numberOfLines = 0
        generateAddressButton.isUserInteractionEnabled = false
        generateAddressButton.topAnchor.constraint(equalTo: contractDescription.bottomAnchor, constant: 8).isActive = true
        generateAddressButton.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 48).isActive = true
    }
    
    @objc func generateIDPressed() {
        id = "24"
        generateIDButton.backgroundColor = .clear
        generateIDButton.setTitleColor(.paragraphColor, for: .normal)
        generateIDButton.setTitle("\(id!)", for: .normal)
        generateIDButton.isUserInteractionEnabled = false
        generateIDButton.topAnchor.constraint(equalTo: generateAddressButton.bottomAnchor, constant: 8).isActive = true
        generateIDButton.leadingAnchor.constraint(equalTo: tokenName.trailingAnchor, constant: 48).isActive = true
        
        metadataLabel.text = """
            {
                "name": "\(tokenName.text ?? "")"
                "id": "\(id!)"
                "emoji": "\(selectedEmoji)"
            }
            """
        
        createContractButton.isUserInteractionEnabled = true
        createContractButton.backgroundColor = .buttonColor
    }
    
    // Validate that all sections are filled out before moving on
    func validateInput() -> Bool {
        return (tokenName.text?.count)! > 0 &&
            (tokenSymbol.text?.count)! > 0 &&
            ((generateAddressButton.titleLabel?.text?.hasPrefix("0")) != nil)
    }
    
    @objc func createContractPressed() {
        if !validateInput() {
            let ac = UIAlertController(title: "Please Complete All Sections", message: "", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        
        createContractButton.isUserInteractionEnabled = false
        createContractButton.backgroundColor = .gray
        tokenName.isUserInteractionEnabled = false
        tokenSymbol.isUserInteractionEnabled = false
        self.contractProgressView.animate(from: 0, to: 0.95, duration: 5)
        
        // Wait 0.5 seconds after the animation to continue
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            self.contractProgressView.progressTintColor = .errorRed
            self.contractProgressView.progressLabel.text = "Stop! You must pay gas fees to continue..."
            self.contractProgressView.progressLabel.textColor = .paragraphColor
            self.nextButton.startAnimating()
        }
    }
    
    @objc func nextPressed() {
        let vc = GasFeesViewController()
        vc.selectedEmoji = self.selectedEmoji
        vc.tokenName = self.tokenName!.text!
        vc.tokenSymbol = self.tokenSymbol!.text!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
