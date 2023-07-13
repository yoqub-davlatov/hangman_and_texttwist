# Hangman & TextTwist mobile game application

## Project description
Two-in-one game application that combines classic games Hangman and TextTwist. The application is powered by the OpenAI API, which allows for dynamic and limitless word options. Therefore, the game never runs out of new challenges to test your vocabulary and word-guessing skills.

## Demo

<figure class="video_container">
  <iframe src="https://www.youtube.com/watch?v=rtatEDtoYYY&list=LL&index=66" frameborder="0" allowfullscreen="true"> </iframe>
</figure>


## How to use
1. Launch the game application.
2. Choose the game mode you want to play: TextTwist or Hangman.
3. **Hangman Game:**
	- Select a category: On the category page, choose a category from the provided list or enter your own custom category.
	- Choose the number of words: You can select the number of words you want to guess for each category. This allows you to customize the game difficulty and challenge yourself accordingly.
	- Start the game: Once you have selected the category and the number of words, click on the "Continue" button to begin playing Hangman. After that you need to wait for the OpenAI API Response and click "Yes" to start the game.
	- Guess the word: You will see the description of the word, and you will need to guess the letters one at a time.
	- Tries and hints: You have a total of 6 tries to guess the word correctly. If you find yourself stuck, you can use up to 3 hints to get the additional information about the word.
	- Pass or Fail: Guess the letters correctly to reveal the word and move to the next category to guess all words. If you run out of tries before guessing the word, the game ends, and you lose.
4. **TextTwist Game**:
	- Select a category: On the category page, choose a category from the provided list or enter your own custom category.
	- Start the game: Once you have selected the category, click on the "Continue" button to begin playing TextTwist.
	- Compose the words: You will be presented with the set of letters that can be used to create and reveal the hidden words.
	- Submit your answers: Enter your words in the provided input field and click the "Submit" button. If the word you submit is correct, the corresponding blank fields will turn green, revealing the letters of the guessed word.
	- Remove redundant letters: You can remove the letters that won't be needed to guess the remaining words by clicking the "Hint" button.
	- Win or Give Up: If you struggle to find any more words, you have the option to give up and end the game.
5. Enjoy playing the game, challenge yourself to guess the words correctly, and have fun while testing your vocabulary and word-guessing skills!

## Features list
- **Limitless Word Options**: The application utilizes the OpenAI API, allowing you to choose any category you want and providing an unlimited number of word options. This ensures endless gameplay possibilities and keeps the game challenging and exciting.
- **Two Games in One**: The application offers two classic games, Hangman and TextTwist, in a single package. This provides an opportunity to test and improve your vocabulary, word-guessing, and anagram-solving skills all within one convenient application. Enjoy the variety and challenge yourself with both games.
- **User-friendly Interface**: The game application features a user-friendly and intuitive interface. It is designed to be simple and easy to navigate, allowing players to focus on the gameplay and enjoy a seamless gaming experience.

## Project Installation
To install the game application from the repository, follow these steps:
1. Clone the Git repository: Open your terminal or command prompt and navigate to the directory where you want to clone the repository. Then, run the following command:
```bash
git clone https://gitlab.pg.innopolis.university/hangman-and-wordtwist-s23/hangmanandtexttwist.git
```
2. Navigate to the project directory: After cloning the repository, navigate to the project's root directory using the terminal or command prompt:
```bash
cd repository
```
3. Install dependencies: Use the `flutter pub get` command to fetch and install the required dependencies for the Flutter project:
```bash
flutter pub get
```
4. Connect a device: Connect your Android or iOS device to your computer or set up an emulator to run the Flutter application.
5. Run the application: To run the Flutter application on a connected device or emulator, use the `flutter run` command:
```bash
flutter run
```
The application will be compiled and launched on your device or emulator.
### Installation with APK
To install the game application on your Android device using the APK file, follow these steps:
1. Download the APK: Click on the [link](https://www.youtube.com/watch?v=dQw4w9WgXcQ) to download the APK file for the game application.

2. Transfer the APK to your device: Connect your Android device to your computer using a USB cable. Copy the downloaded APK file to your device's storage or SD card.

3. Enable installation from unknown sources: On your Android device, go to "Settings" and then "Security" or "Privacy." Enable the option to install applications from unknown sources. This allows you to install apps from sources other than the Google Play Store.

4. Locate the APK file: Use a file manager app on your Android device to navigate to the directory where you transferred the APK file.

5. Install the APK: Tap on the APK file to start the installation process. Review the permissions requested by the application and proceed with the installation by following the on-screen prompts.

6. Complete the installation: Once the installation is complete, you will find the game application installed on your device's app drawer or home screen.

7. Launch the game application: Tap on the game application icon to launch it. You can now enjoy playing the game on your Android device.
## Frameworks and Technologies
- **Flutter**: The application was developed using the Flutter framework, allowing for cross-platform app development.

- **Dart**: The Dart programming language was used to write the application's logic and handle the game's business logic.

- **GitLab**: GitLab served as the remote repository for version control and collaboration.

- **OpenAI API**: The game application is powered by the OpenAI API, enabling dynamic and limitless word options for an engaging gaming experience.

These frameworks and technologies were essential in developing the game application, providing the necessary tools and capabilities to create the desired product.

## Contributing  for customer
Contributions to the game application are welcome! If you find an issue, have an idea for an improvement, or want to contribute new features, please follow these steps:
1. Fork the repository.
1. Create a new branch for your contribution:
```bash
git checkout -b feature/your-feature-name
```
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository.
5. Submit a pull request to the main repository explaining your changes.

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://gitlab.pg.innopolis.university/hangman-and-wordtwist-s23/hangmanandtexttwist/-/blob/main/LICENSE)

The game application is open-source and released under the MIT License. Click on the badge to view the license details.