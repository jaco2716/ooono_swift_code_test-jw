# OOONO Nearby road works positions code test

The content of this repo consists of the start for the project as well as this readme.
Below you will fild the instructions for the code test, as well as a sketch of layout.
The goal is to implement the functionality under Tasks.
For each subtask, please make a local commit.

When you are finished, the project should be compressed to a `.zip` and send by email.
Please do not push to this repo.

## Expectation
All UI elements should be done programmatically, both UIKit and SwiftUI is perfectly fine, so no `Storyboards` or `.xib` files.
How the UI looks is not the main concern, but it should be functional. We are interested in the code.

## Example
Please disregard the difference in size.

![Main Screen](/Screenshots/MainScreen.png)
![Details screen](/Screenshots/DetailsScreen.png)

# Tasks
The goal for this task is to construct an app, where you are able to see all nearby road works.
For simplicity all network calls is replaced with a local function call see Getting started.

## Required tasks
- Main Screen
  - Show list of road works in alphabetical order
  - If user click a road work, open a details screen
- Details screen
  - Show details for the road works
  - Be able to go back to Main Screen
- Main screen
  - Show number of votes for road work
- Add timer to get list of roadworks every 15 seconds and refresh view

## Optional tasks
- Be able to sort road works based on city or votes
- Details screen
  - Be able to upvote a road work
  - Main screen should update number of votes


# Getting started
To start clone this project
```bash
git clone https://github.com/ooemil/ooono_swift_code_test.git
```

To get list of roadworks call:
```swift
 GetRoadWorksHelper.shared.getRoadWorks()
```
