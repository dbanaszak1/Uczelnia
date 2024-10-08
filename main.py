from card import Card  # Import the Card class
from atm import ATM  # Import the ATM class


def atm_menu():
    """Displays the menu options for the ATM"""
    print("\nPlease select an operation:")
    print("1. Check Balance")
    print("2. Deposit Money")
    print("3. Withdraw Money")
    print("4. Eject Card")
    print("5. Exit")


def main() -> None:
    continue_operations = True
    while continue_operations:
        atm = ATM('cards.json')

        # User enters card details
        card_number = input("Enter your card number: ")
        pin = int(input("Enter your PIN: "))

        # Try to authenticate the card
        atm.insert_card(card_number, pin)

        # If authentication was successful, proceed to the operations menu
        if atm.current_card:
            while True:
                atm_menu()  # Show the available operations
                choice = input("Enter your choice (1-5): ")

                if choice == '1':
                    # Check balance
                    atm.check_balance()
                elif choice == '2':
                    # Deposit money
                    amount = float(input("Enter amount to deposit: "))
                    atm.deposit(amount)
                elif choice == '3':
                    # Withdraw money
                    amount = float(input("Enter amount to withdraw: "))
                    atm.withdraw(amount)
                elif choice == '4':
                    # Eject card
                    atm.eject_card()
                    break  # Exit the loop after card is ejected
                elif choice == '5':
                    continue_operations = False
                    print("Thank you for using the ATM. Goodbye!")
                    break  # Exit the loop and program
                else:
                    print("Invalid choice. Please select a valid option.")
        else:
            print("Authentication failed. Please try again.")


if __name__ == "__main__":
    main()
