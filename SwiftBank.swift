// Write your code below 🏦
struct SwiftBank {
  private let password: String
  private var balance: Double = 0 {
    didSet {
      if balance < 100 {
        displayLowBalanceMessage()
      }
    }
  }
  static let depositBonusRate = 0.01
  private var hasReceivedBonus: Bool = false

  init(password: String, initialDeposit: Double){
    self.password = password
    makeDeposit(ofAmount: initialDeposit)
  }

  private func isValid(_ enteredPassword : String) -> Bool {
    if enteredPassword == self.password {
      return true
    } else {
      return false
    }
  }

  private func finalDepositWithBonus(fromInitialDeposit deposit : Double) -> Double { 
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  mutating func makeDeposit(ofAmount depositAmount : Double) { 
    if depositAmount <= 0 {
      print("Error: You cannot make a deposit of less than $1")
      return
    }
    if self.hasReceivedBonus == false && depositAmount >= 1000{
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount) 
    print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus).")
        self.hasReceivedBonus = true
        self.balance += depositWithBonus
        return
      }
    print("Making a deposit of $\(depositAmount)")
    self.balance += depositAmount
}

  func displayBalance(usingPassword password: String) {
    if isValid(_: password) == false {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    } else {
      print("Your current balance is $\(balance)")
      }
  }

  mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
    if isValid(_: password) == false {
      print("Invalid password. Cannot make withdrawal.")
      return
    } 
    if withdrawalAmount <= 0 {
      print("Error: You cannot make a withdrawal of less than $1")
      return
    }
    if withdrawalAmount > self.balance {
      print("You cannot make a withdrawal higher than your balance. Your current balance is $\(self.balance)")
      return
    }
    print("Making a $\(withdrawalAmount) withdrawal")
    self.balance -= withdrawalAmount
  }

private func displayLowBalanceMessage() {
  print("Alert: Your balance is under $100")
  }
}

var myAccount = SwiftBank(password: "myPassword", initialDeposit: 1000)
myAccount.makeDeposit(ofAmount: 50)
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "yourPassword")
myAccount.displayBalance(usingPassword: "myPassword")
myAccount.makeDeposit(ofAmount: 1000)
myAccount.makeDeposit(ofAmount: 1000)
myAccount.makeDeposit(ofAmount: 0)
myAccount.makeDeposit(ofAmount: -3)
myAccount.makeWithdrawal(ofAmount: 0, usingPassword: "yourPassword")
myAccount.makeWithdrawal(ofAmount: 0, usingPassword: "myPassword")
myAccount.makeWithdrawal(ofAmount: -5, usingPassword: "myPassword")
myAccount.displayBalance(usingPassword: "myPassword")
myAccount.makeWithdrawal(ofAmount: 5000, usingPassword: "myPassword")
myAccount.displayBalance(usingPassword: "myPassword")