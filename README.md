 Lecturer Contact Management System

Overview
Welcome to the Lecturer Contact Management System! This Node.js-based application helps you efficiently manage and organize lecturer contacts for academic purposes. It provides a user-friendly interface on the admin side for adding, editing, deleting lecturer information and on the student side he or she can view the lecturer contact information for that particular semester in a given year

Technologies Used
- Node.js: Server-side runtime environment
- MySQL: Relational database for storing lecturer data
- Pug : A concise and indentation-based template engine for Node.js, simplifying HTML markup creation with a focus on readability and flexibility.

Prerequisites
Make sure you have the following installed before setting up the system:
- Node.js
- MySQL

Installation
1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Run `npm install` to install dependencies.

Configuration
Create a `.env` file and set the following environment variables:
```
DB_HOST= localhost
DB_USER= root
DB_PASSWORD= ' '
DB_NAME= lecturer_contact


Database Setup
1. Create a MySQL database.
2. Run the SQL scripts in the `database` folder to set up the necessary tables.

Usage
1. Run `npm start` to start the server.
2. Open your browser and go to `http://localhost:5000/login` to access the application.

