-- SakhiCare Database Setup
CREATE DATABASE IF NOT EXISTS SakhiCare;
USE SakhiCare;

-- 1️⃣ USERS TABLE
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(15),
    location VARCHAR(100)
);

-- 2️⃣ HEALTH STATUS TABLE
CREATE TABLE HealthStatus (
    health_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    health_issues TEXT,
    blood_reports TEXT,
    doctor VARCHAR(100),
    appointment_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);

-- 3️⃣ DIET PLAN TABLE
CREATE TABLE DietPlan (
    diet_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    age_group VARCHAR(50),
    diet_plan TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);

-- 4️⃣ CANCER AWARENESS TABLE
CREATE TABLE CancerAwareness (
    cancer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    cancer_type VARCHAR(100),
    symptoms TEXT,
    awareness_level VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);

-- 5️⃣ SKIN CARE TABLE
CREATE TABLE SkinCare (
    skin_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    skin_type VARCHAR(50),
    past_history TEXT,
    care_plan TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);

-- 🌸 SAMPLE DATA INSERTION

-- Users
INSERT INTO Users (username, age, email, password, mobile_no, location)
VALUES
('Riya Sharma', 22, 'riya@gmail.com', 'Riya@123', '9876543210', 'Pune'),
('Meena Patel', 28, 'meena@gmail.com', 'Meena@123', '9823456789', 'Mumbai'),
('Anjali Verma', 30, 'anjali@gmail.com', 'Anjali@123', '9812345678', 'Nashik');

-- Health Status
INSERT INTO HealthStatus (user_id, health_issues, blood_reports, doctor, appointment_date)
VALUES
(1, 'PCOS', 'Normal Hormones', 'Dr. K. Deshmukh', '2025-10-30'),
(2, 'Iron Deficiency', 'Low Hemoglobin', 'Dr. R. Mehta', '2025-11-02'),
(3, 'Thyroid Imbalance', 'TSH High', 'Dr. S. Jadhav', '2025-11-05');

-- Diet Plan
INSERT INTO DietPlan (user_id, age_group, diet_plan)
VALUES
(1, '18–25', 'High protein + fruits + low sugar'),
(2, '26–35', 'Iron-rich greens + whole grains'),
(3, '26–35', 'Low salt + high fiber diet');

-- Cancer Awareness
INSERT INTO CancerAwareness (user_id, cancer_type, symptoms, awareness_level)
VALUES
(1, 'Breast Cancer', 'Lumps, fatigue', 'Moderate'),
(2, 'Cervical Cancer', 'Irregular bleeding', 'High'),
(3, 'Ovarian Cancer', 'Bloating, back pain', 'Low');

-- Skin Care
INSERT INTO SkinCare (user_id, skin_type, past_history, care_plan)
VALUES
(1, 'Oily', 'Acne', 'Cleanser + clay mask twice weekly'),
(2, 'Dry', 'Pigmentation', 'Hydration + SPF moisturizer'),
(3, 'Combination', 'Dark spots', 'Vitamin C serum + daily sunscreen');
