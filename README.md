
# Task Flow

**Task Flow** is a Flutter-based mobile application that allows users to efficiently manage tasks. The app allows users to **add**, **view**, **edit**, and **delete** tasks, providing a simple interface to keep track of to-do items. The app follows the **MVVM (Model-View-ViewModel)** architecture pattern and uses **SQLite** for local data storage.

## Features
- **Add Task**: Users can add new tasks with a title, description, and due date.
- **Edit Task**: Users can update existing tasks.
- **Delete Task**: Tasks can be removed from the list.
- **Task List**: The list of tasks is displayed using a `ListView`, showing task titles and due dates.
- **Persistent Data**: Tasks are stored locally in a SQLite database, ensuring data persistence even when the app is closed.

## Technologies Used
- **Flutter**: A UI toolkit for building natively compiled applications for mobile from a single codebase.
- **Dart**: The programming language used for Flutter development.
- **SQLite**: A lightweight local database for storing task data.
- **Provider**: State management package to manage and update UI based on the data.
- **sqflite**: Flutter plugin for SQLite database access.
- **MVVM Architecture**: A clean architecture pattern used to separate concerns in the app.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/smThilshan/task_flow.git

2. Navigate to the project directory:
    cd task-flow

3. Install the dependencies:
    flutter pub get

4. Run the app on an emulator or physical device:
    flutter run


Usage

Adding a Task

Tap on the Add Task button.
Fill in the task title, description, and due date.
Press Save to add the task.

Editing a Task

Tap on a task from the list to view details.
Press the Edit button to modify the task details.
Press Save to update the task.

Deleting a Task

Swipe left on a task or press the delete icon to remove it from the list.

Architecture

Task Flow follows the MVVM (Model-View-ViewModel) architecture, which separates the UI logic from business logic.

Model: The model contains the task data and the SQLite database interaction.

View: The view is the UI that displays the task list and individual task details.

ViewModel: The ViewModel acts as an intermediary between the View and Model, managing the task data and providing it to the View.

SQLite Database Schema

The app uses a simple SQLite schema with the following table:

Tasks Table

id: INTEGER PRIMARY KEY (auto-incremented)
title: TEXT (Task title)
description: TEXT (Task description)
dueDate: TEXT (Task due date)

### Notes:
1. **App Name**: I've used `Task Flow` as the app's name in the README.

2. **GitHub URL**: Replace the clone URL (`https://github.com/smThilshan/task_flow.git`) with the actual URL of your GitHub repository.
3. **Known Issues**: You can add any issues you’ve encountered or leave it blank if there are no issues.

Let me know if you'd like to make any changes!


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
