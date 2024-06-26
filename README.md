# payment-gateway

A Flutter Technical Assessment for a potential career change.

## The Ask

Create a system that allows admins to submit credit card number for validation.

The requirements (tasks that I need complete) of said system are as follows:

- [x] Users should be able to add in their card number, type, cvv and issuing country
- [x] From the card number, the app should be able to infer the card type (bonus)
- [x] Allow the user to save the provided card (should it be valid) in local storage
- [x] Display the Credit cards that have been captured (for the current session of the app, or every card ever added?)
    - [x] Created screen
    - [x] Add functionality to read/write to storage
- [x] Don't allow duplicate cards to be captured
- [x] Ensure that the country of issue, isn't on the 'banned countries' list
    - [x] Create a store of banned countries that the card can't be from
    - [x] Make said list configurable
- [x] Allow users to scan the card as well and pre-populate the card details from this (where applicable)

Don't forget:

- [ ] Unit tests
- [x] Developer Documentation

## Screenshots of the App
> Note: I used Android as my preferred testing platform, as I am most familiar with it and could easily test the camera functionality on a physical device.

| Card Capture                                                    | Card History                                                    | Banned Countries                                                        |
|-----------------------------------------------------------------|-----------------------------------------------------------------|-------------------------------------------------------------------------|
| ![Card Capture](./payment_gateway/screenshots/card_capture.png) | ![Card History](./payment_gateway/screenshots/card_history.png) | ![Banned Countries](./payment_gateway/screenshots/banned_countries.png) |

Potential packages to make use of:

- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [credit_card_scanner](https://pub.dev/packages/credit_card_scanner)
