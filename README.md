# SMS Notification App

This project implements a real-time SMS notification system as a part of a Ruby on Rails application. It demonstrates the integration of a third-party SMS API service (such as ClickSend) to send notifications promptly based on specific triggers within the application. This feature is particularly useful for scenarios like user sign-ups, transaction alerts, or any other event where immediate user notification is beneficial.

## Features

- User: Represents a user related data
- SmsSender: A notification services for sending sms
- List Sms Logs: View a list of sent Sms with messages.

# Build With

- Framework: Ruby on Rails 7
- Database: sqlite3
- Sms API: ClickSend
- Unit Tests: RSpec & VCR

# Getting Started

## Prerequisites

- npm

  ```bash
  npm install npm@latest -g
  ```

## Installation

1. **Clone the Repository**:
   ```bash
   git clone [<repository-url>](https://github.com/Owner/repo.git)
   cd repo
   ```
2. **Initialize the Database**:
   - Before starting the application for the first time, ensure that the database is set up correctly.
   ```bash
   rails db:create db:migrate
   ```
   - Now run the application with
   ```bash
   rails server
   ```

## Run Tests

```bash
    rpsec
```
