import Foundation
import UIKit
import PlaygroundSupport


// All multi-line strings needed for each screen
public enum StringConstants {
    static let introDescription = """
        Non-Fungible Tokens (NFTs) have been gaining a lot of attention in the past few months and you might be wondering what they are. NFTs allow people to sell digital assets such as art, music, images, videos, etc to others with the use of blockchain technology. Every NFT is completely unique and cannot be duplicated or exchanged.\n\nThe purpose of this Playground is to show you how NFTs are created (also called "minted") behind the scenes and how the overall technology works. We will be creating out own NFT store using a simulated blockchain.
        """
    static let ethSmartContractsDescription = """
        Before we mint our own NFT, we must understand how it all works. Most Cryptocurrencies utilize a blockchain which is essentially a decentralized public database used as a ledger for transactions. NFTs make use of the Ethereum blockchain specifically because of the ERC-721 Standard which defines a set of behaviors needed for storing information about an NFT.\n\nThis information is stored on a Smart Contract which is a digital agreement between a buyer and a seller that is automatically executed through code. These contracts are coded in the Solidity programming language and are stored directly on the blockchain.
        """
    static let nftSelectionIntro = """
        We can now start minting our own NFT! For the purpose of this demonstration, we'll be using an emoji. Typically, an NFT should be something completely unique that you've created, it just needs to be digital.\n\nPlease select an emoji to get started:
        """
}

// Colors used throughout the playground
extension UIColor {
    static var backgroundColor: UIColor { return UIColor(red: 29/255, green: 29/255, blue: 64/255, alpha: 1) }
    static var titleColor: UIColor { return UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1) }
    static  var paragraphColor: UIColor { return UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1) }
    static var buttonColor: UIColor { return UIColor(red: 82/255, green: 79/255, blue: 233/255, alpha: 1) }
}
