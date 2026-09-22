# College Management System

## Abstract

The College Management System centralizes the administration of academic institutions by managing students, faculty, departments, courses, examinations, attendance, and fees. The system reduces manual administrative work and improves communication among students, faculty, and administrators.

Students can access academic records, faculty members can upload marks and attendance, and administrators can generate institutional reports.

## Modules

- Student Management
- Faculty Management
- Department Management
- Attendance
- Examination
- Fee Management
- Reports

A web based college management system built with Java Servlets, JSP and MySQL 8. It manages students, faculty, departments, courses, attendance, exams, marks and fees with role based access for Admin, Faculty and Student.

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 8 |
| UI | JSP + CSS |
| Controllers | Java Servlets 3.1 |
| Architecture | UI -> Controller -> Service -> DAO -> Database |
| Database | MySQL 8.0 |
| Server | Apache Tomcat 8.0.9 |
| IDE | Apache NetBeans |

## Prerequisites

1. JDK 8 installed
2. NetBeans IDE with Java Web support
3. MySQL Server 8.0 running locally
4. MySQL Connector/J jar added to the project libraries (already configured in this project)
5. Apache Tomcat 8.x registered in NetBeans

## How to Start the Program

### Step 1: Create the database

Open MySQL Workbench or a terminal and run the schema script.

Using Workbench: open `database/college_db.sql` and execute it.

Using terminal:

```
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p < database\college_db.sql
```

This creates the `college_management` database with all tables and sample data.

### Step 2: Set your MySQL password

The app connects as root. Set your MySQL root password in one of these ways.

Option A: edit `src/java/com/college/cms/util/DBConnection.java` and change the default password value.

Option B: set an environment variable before starting Tomcat.

```
set CMS_DB_PASSWORD=your_mysql_password
```

Optional environment variables: `CMS_DB_URL` and `CMS_DB_USER`.

### Step 3: Build and run in NetBeans

1. Open the project in NetBeans
2. Right click the project and select Clean and Build
3. Right click the project and select Run
4. NetBeans starts Tomcat and opens the browser

App URL: http://localhost:8084/College_Management_Sys

Note: the port (8084) comes from your NetBeans private Tomcat copy, not the shared 8080 Tomcat. Check the port under Tools > Servers if yours differs.

You will land on the landing page. Sign in from there, or use the Login button in the top-right corner.

### Step 4: Login

| Role | Username | Password | Notes |
|---|---|---|---|
| Admin | admin | admin123 | Full access to all modules |
| Faculty | akumar | welcome123 | Seeded faculty account |
| Student | 73152313001 | welcome123 | Seeded student account (any Reg No from the seed data) |

New student and faculty logins created through the app use the roll no or emp code as username with password `welcome123`.

The student seed data comes from `Placement II YEAR DATA.xlsx` (132 CSE II year students). To load it into an existing database run `database/import_placement_students.sql`.

## Features by Role

### Admin

- Dashboard with counts, fee summary and attendance defaulters list
- Student management: add, edit, delete, search, filter by department and year, view profile
- Faculty management: add, edit, delete
- Department management: add, edit, delete
- Course management: add, edit, delete, assign faculty to courses
- Attendance: mark attendance for any course
- Exams and marks: create exams, enter marks, auto grade calculation
- Fee management: generate fee records, record full or partial payments, delete records
- Reports: student list, attendance defaulters below 75 percent, result summary, fee collection summary, CSV export

### Faculty

- Dashboard listing assigned courses
- Mark attendance for assigned courses
- Create exams and enter marks

### Student

- Dashboard showing overall attendance percentage and fee due
- View course wise attendance percentages
- View published marks and grades
- View fee records and payment status

## Project Structure Explained

### Code Structure

```
College_Management_Sys/
├── README.md
├── build.xml                     # Ant build (NetBeans)
├── .gitignore
├── .env.example                  # CMS_DB_URL / CMS_DB_USER / CMS_DB_PASSWORD
├── dist/College_Management_Sys.war   # built WAR package
├── src/
│   ├── conf/MANIFEST.MF
│   └── java/
│       └── com/college/cms/
│           ├── dao/              # data access layer (JDBC, PreparedStatement only)
│           ├── model/            # entity beans, one per table
│           ├── service/          # business logic and validation
│           ├── util/             # DBConnection, PasswordUtil, ValidationUtil, AuthUtil
│           └── web/              # servlets + AuthFilter
├── web/                          # app root served by Tomcat
│   ├── index.html                # landing page
│   ├── error.jsp                 # friendly error page
│   ├── css/style.css
│   ├── META-INF/context.xml
│   └── WEB-INF/
│       ├── web.xml               # servlet, filter and welcome-file mapping
│       └── jsp/
│           ├── login.jsp, dashboard.jsp, departments.jsp, students.jsp,
│           │   student_form.jsp, student_view.jsp, faculties.jsp,
│           │   faculty_form.jsp, courses.jsp, attendance.jsp,
│           │   my_attendance.jsp, exams.jsp, exam_form.jsp,
│           │   marks_entry.jsp, marksheet.jsp, fees.jsp, my_fees.jsp,
│           │   reports.jsp
│           └── common/
│               ├── top.jsp       # shared nav bar by role + alerts
│               └── bottom.jsp    # shared footer
└── database/
    ├── college_db.sql            # full schema + seed data
    └── import_placement_students.sql  # additive Excel student import
```

### Root Files

| File | Purpose |
|---|---|
| build.xml | Ant build script used by NetBeans to compile and package the WAR |
| database/college_db.sql | SQL schema and seed data for the whole system |

### Source Code: src/java/com/college/cms

#### model package (data classes)

Each class represents one database table as a plain Java object with getters and setters.

| File | Purpose |
|---|---|
| model/User.java | Login account: username, hashed password, role, linked student or faculty id |
| model/Department.java | Department record with name and HOD name |
| model/Student.java | Student record including department name for display and fee balance helper |
| model/Faculty.java | Faculty record including department name for display |
| model/Course.java | Course record plus assigned faculty info and department name |
| model/Attendance.java | One attendance entry for a student in a course on a date |
| model/Exam.java | Exam record linked to a course with max marks |
| model/Marks.java | Marks obtained by a student in an exam with computed grade |
| model/Fee.java | Fee record with total, paid amount, status and balance calculation |

#### dao package (database access)

Each class runs the SQL for its table using PreparedStatement only, which prevents SQL injection.

| File | Purpose |
|---|---|
| dao/UserDAO.java | Find user by username, check username exists, insert user, remove login of deleted person |
| dao/DepartmentDAO.java | CRUD operations for departments |
| dao/StudentDAO.java | CRUD, search filters, auto roll number generation (STU0001 format) |
| dao/FacultyDAO.java | CRUD and auto employee code generation (EMP0001 format) |
| dao/CourseDAO.java | CRUD plus assign or unassign faculty to a course |
| dao/AttendanceDAO.java | Save attendance with upsert, load roster status, compute attendance percentages, find defaulters |
| dao/ExamDAO.java | CRUD operations for exams |
| dao/MarksDAO.java | Save marks with upsert, load marks per exam or student, exam summaries for reports |
| dao/FeeDAO.java | Insert fee records, record payments with automatic status update, collection summary |

#### service package (business logic)

Services validate input, apply business rules and call DAOs. Validation errors throw IllegalArgumentException with a readable message shown in the UI.

| File | Purpose |
|---|---|
| service/AuthService.java | Login verification against hashed passwords, creation and removal of user accounts |
| service/DepartmentService.java | Validates and saves departments |
| service/StudentService.java | Validates student data, generates roll numbers, creates logins, deletes students |
| service/FacultyService.java | Validates faculty data, generates emp codes, creates logins, deletes faculty |
| service/CourseService.java | Validates courses and handles faculty assignment |
| service/AttendanceService.java | Saves submitted attendance statuses and prepares percentage data |
| service/ExamService.java | Validates exam data before saving |
| service/MarksService.java | Validates marks range, computes grades (90+ A+, 80+ A, 70+ B+, 60+ B, 50+ C, 40+ D, else F) |
| service/FeeService.java | Validates amounts and payments, delegates to FeeDAO |

#### util package (helpers)

| File | Purpose |
|---|---|
| util/DBConnection.java | Opens JDBC connections using env vars CMS_DB_URL, CMS_DB_USER, CMS_DB_PASSWORD with defaults |
| util/PasswordUtil.java | Salted SHA-256 hashing and constant time password verification |
| util/ValidationUtil.java | Checks for required fields, email format, phone digits, numbers, dates |
| util/AuthUtil.java | Reads the logged in user from session and enforces role checks |

#### web package (controllers)

Servlets receive requests, call services and forward to JSP views. All are mapped in web.xml.

| File | Purpose |
|---|---|
| web/AuthFilter.java | Public paths (landing, login, css) bypass auth; protected pages redirect to login; sets UTF-8 and no-cache on the landing page |
| web/BaseServlet.java | Shared helpers: forward to JSP, redirect with success or error message |
| web/LoginServlet.java | Shows login page and authenticates users into a session |
| web/LogoutServlet.java | Ends the session and returns to login |
| web/DashboardServlet.java | Loads role specific dashboard data (stats, courses, attendance, fees) |
| web/DepartmentServlet.java | Department list, save and delete actions |
| web/StudentServlet.java | Student list with search and filters, form, save, delete, profile view |
| web/FacultyServlet.java | Faculty list, form, save and delete actions |
| web/CourseServlet.java | Course list, save, delete and faculty assignment actions |
| web/AttendanceServlet.java | Two step marking flow (pick course and date, then save), student view of own attendance |
| web/ExamServlet.java | Exam list, form, save and delete actions |
| web/MarksServlet.java | Two step marks entry flow, student view of own marksheet |
| web/FeeServlet.java | Fee generation, payment recording, deletion, student view of own fees |
| web/ReportServlet.java | Builds all four reports and exports them as CSV downloads |

### Web Content: web folder

| File | Purpose |
|---|---|
| index.html | Landing page: hero, feature cards and login button |
| error.jsp | Friendly error page shown on 404 or unexpected exceptions |
| css/style.css | All styling: layout, tables, forms, buttons, badges, alerts |
| WEB-INF/web.xml | Central config: servlet mappings, auth filter, session timeout, error pages |

### Views: web/WEB-INF/jsp

Views live under WEB-INF so users cannot open them directly, they are always rendered through servlets.

| File | Purpose |
|---|---|
| jsp/login.jsp | Login form |
| jsp/dashboard.jsp | Role aware dashboard for admin, faculty and student |
| jsp/departments.jsp | Department table with add and edit form |
| jsp/students.jsp | Student table with search and filter toolbar |
| jsp/student_form.jsp | Add or edit student form with optional login checkbox |
| jsp/student_view.jsp | Student profile with attendance summary |
| jsp/faculties.jsp | Faculty table |
| jsp/faculty_form.jsp | Add or edit faculty form |
| jsp/courses.jsp | Course table with inline faculty assignment dropdowns and add/edit form |
| jsp/attendance.jsp | Attendance marking page: pick course and date, then mark present or absent |
| jsp/my_attendance.jsp | Student view: overall and course wise attendance |
| jsp/exams.jsp | Exam table |
| jsp/exam_form.jsp | Create or edit exam form |
| jsp/marks_entry.jsp | Pick exam, then enter marks for each student in a grid |
| jsp/marksheet.jsp | Student view of their marks and grades |
| jsp/fees.jsp | Admin fee management: summary cards, generate form, payment forms |
| jsp/my_fees.jsp | Student view of their fee history |
| jsp/reports.jsp | Report tabs with filters and CSV export button |
| jsp/common/top.jsp | Shared page header: navigation bar filtered by role, success and error alerts, HTML escape helper |
| jsp/common/bottom.jsp | Shared page footer closing tags |

## Database Tables

| Table | Stores |
|---|---|
| department | Departments and HOD names |
| users | Login accounts with role ADMIN, FACULTY or STUDENT |
| student | Student details linked to a department |
| faculty | Faculty details linked to a department |
| course | Courses linked to a department |
| faculty_course | Which faculty teaches which course |
| attendance | Present or absent per student, course and date |
| exam | Exams per course with max marks |
| marks | Marks and grade per student per exam |
| fee | Fee totals, payments and status per student |

## Troubleshooting

| Problem | Fix |
|---|---|
| Access denied for user root | Set the correct password in DBConnection.java or via CMS_DB_PASSWORD |
| Unknown database college_management | Run database/college_db.sql first |
| Communications link failure | Start the MySQL service |
| Login page loads but login fails | Confirm seed data was inserted, try admin / admin123 |
| Port 8080 already in use | Stop the other Tomcat instance or change the port |
