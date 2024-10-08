import json
from card import Card  # Import the Card class from card.py


# ATM class to handle ATM operations
class ATM:
    def __init__(self, json_file):
        self.json_file = json_file
        self.current_card = None

    def load_cards(self):
        """Loads the list of cards from the JSON file"""
        try:
            with open(self.json_file, 'r') as file:
                return [Card(**card) for card in json.load(file)]  # Create Card objects from JSON data
        except FileNotFoundError:
            return []

    def validate_card_number(self):
        cards = self.load_cards()
        for card in cards:
            if card.number == card.number:
                print("Card inserted.")
                return True
            else:
                print("Card number incorrect.")
                return False

    def insert_card(self, card_number, pin):
        """Inserts a card into the ATM and verifies the PIN"""
        cards = self.load_cards()  # Load cards from the JSON file
        for card in cards:
            if card.number == card_number:
                if card.pin == pin:
                    self.current_card = card
                    print("Authentication successful!")
                else:
                    print("Incorrect PIN!")
                return
        print("Incorrect card number")

    def eject_card(self):
        """Ejects the card from the ATM"""
        if self.current_card:
            print(f"Card {self.current_card.number} has been ejected.")
            self.current_card = None
        else:
            print("Error")

    def check_balance(self):
        """Checks the balance of the currently authenticated card"""
        if self.current_card:
            print(f"Balance for card {self.current_card.number}: {self.current_card.balance} PLN")
        else:
            print("Error")

    def deposit(self, amount):
        """Deposits money into the authenticated card's account"""
        if self.current_card:
            if amount > 0:
                self.current_card.balance += amount
                print(f"Deposited: {amount} PLN. New balance: {self.current_card.balance} PLN")
            else:
                print("Deposit amount must be greater than zero!")
        else:
            print("Error")

    def withdraw(self, amount):
        """Withdraws money from the authenticated card's account"""
        if self.current_card:
            if amount > 0:
                if amount <= self.current_card.balance:
                    self.current_card.balance -= amount
                    print(f"Withdrew: {amount} PLN. Remaining balance: {self.current_card.balance} PLN")
                else:
                    print("Insufficient funds!")
            else:
                print("Withdrawal amount must be greater than zero!")
        else:
            print("Error")
