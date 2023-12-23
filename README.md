# SMS Notification App

This project implements a real-time SMS notification system as a part of a Ruby on Rails application. It demonstrates the integration of a third-party SMS API service (such as ClickSend) to send notifications promptly based on specific triggers within the application. This feature is particularly useful for scenarios like user sign-ups, transaction alerts, or any other event where immediate user notification is beneficial.

## Features

- User: Represents a user related data.
- SmsSender: A notification services for sending sms.
- ClickSend: An API Wrapper on ClickSend API.
- List Sms Logs: View a list of sent Sms to all users with messages.

<img width="1512" alt="Screenshot app" src="https://github.com/HyugaDev/sms-notification-app/assets/144159871/3c3e2444-997a-48bc-a3a4-c7786e95d983">
<img width="1428" alt="Screenshot logs" src="https://github.com/HyugaDev/sms-notification-app/assets/144159871/18d0057d-ef8f-43b6-a9e4-d4c3cef93651">


# Build With

- Framework: Ruby on Rails 7
- Language: Ruby 3.2.2
- Database: sqlite3
- Sms API: ClickSend
- Unit Tests: RSpec & VCR

# Getting Started

## Prerequisites

- rvm
- ruby

## Installation

1. **Clone the Repository**:
   ```bash
   git clone [<repository-url>](https://github.com/HyugaDev/sms-notification-app.git)
   cd repo
   ```

2. **Bundling the Gems**:
   ```bash
   bundle install
   ```
3. **Initialize the Database**:
   - Before starting the application for the first time, ensure that the database is set up correctly.
   ```bash
   rails db:create db:migrate
   ```
   - Now run the application with
   ```bash
   rails server
   ```
4. **Credentials**:
   Credentials are already present in App in encrypted form.
## Run Tests

```bash
    rpsec
```
