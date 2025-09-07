# Simple Quiz App 🎓🚀

## Project Introduction 🎯
A simple quiz application built with **Flutter** and **Dart**.  
It includes two quiz types: **Multiple Choice** and **True/False** with clean UI and separated quiz logic.

---

## Technologies Used 💻
- **Language**: Dart  
- **Framework**: Flutter  

---

## Widgets Overview 🔧

- **Container**: A flexible box for layout, styling, and padding.  
- **Column**: Arranges children vertically.  
- **Row**: Arranges children horizontally.  
- **Text**: Displays text.  
- **ElevatedButton**: Raised material button.  
- **Radio**: Single radio option.  
- **RadioGroup**: Groups radios together with shared state.  
- **Future.delayed**: Runs code after a delay.  
- **SnackBar**: Temporary bottom message.  
- **Icon**: Shows an icon.  
- **AlertDialog**: Popup dialog for alerts/results.  
- **AppBar**: Top navigation bar.  
- **Scaffold**: Basic page structure with AppBar, body, etc.  
- **MaterialApp**: Root app configuration (theme, routes).  
- **ListView**: Scrollable list of widgets.  
- **SizedBox**: Adds spacing or fixed dimensions.  
- **Expanded**: Expands a widget to fill remaining space.  

---

## Key Features 🛠️
- Multiple Choice Quiz  
- True/False Quiz  
- Feedback with SnackBar & AlertDialog  
- Organized logic and UI separation  

---

## Screenshots 📸

### 1) Screen 1 & Screen 2
| Screen 1 | Screen 2 |
| --- | --- |
| ![Screen 1](assets/images/screen1.png) | ![Screen 2](assets/images/screen2.png) |

### 2) Screen 3 & Screen 4
| Screen 3 | Screen 4 |
| --- | --- |
| ![Screen 3](assets/images/screen3.png) | ![Screen 4](assets/images/screen4.png) |

### 3) Screen 5
![Screen 5](assets/images/screen5.png)

---

## Project Structure 📂 
The project follows a clean and organized directory structure:

```plaintext
lib
├─ logic
│ ├─ multiple_question_brain.dart # Multiple-choice quiz controller/logic
│ ├─ multiple_qusetion.dart # (data/model) multiple-choice questions
│ ├─ question.dart # Generic question model
│ └─ true_false_brain.dart # True/False quiz controller/logic
├─ main.dart # App entry point
├─ multiple_quiz.dart # Multiple-choice quiz UI
└─ true_false_quiz.dart # True/False quiz UI

test
└─ widget_test.dart # Basic widget test
