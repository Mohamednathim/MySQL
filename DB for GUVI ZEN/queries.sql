-- Create 
CREATE TABLE MENTOR (
  Mentor_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Mentor_Name VARCHAR(255),
  Email VARCHAR(255),
  Mobile_Number VARCHAR(255)
);

CREATE TABLE BATCH (
  Batch_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Batch_Name VARCHAR(255),
  Total_Student INTEGER,
  Mentor_Id INTEGER,
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id)
);

CREATE TABLE STUDENTS (
  Student_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Student_Name VARCHAR(255),
  Mobile_Number VARCHAR(255),
  Email VARCHAR(255),
  Mentor_Name VARCHAR(255),
  Batch_Id INTEGER,
  Batch_Name VARCHAR(255),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);

CREATE TABLE TASK (
  Task_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Task_Name VARCHAR(255),
  Student_Id INTEGER,
  Mentor_Id INTEGER,
  Mentor_Name VARCHAR(255),
  Batch_Name VARCHAR(255),
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id)
);

CREATE TABLE DASHBOARD (
  Dashboard_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  Student_Id INTEGER,
  Mentor_Id INTEGER,
  Batch_Id INTEGER,
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Mentor_Id) REFERENCES MENTOR(Mentor_Id),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);

CREATE TABLE QUERY (
  Query_Id INTEGER AUTO_INCREMENT PRIMARY KEY,
  QueryText TEXT,
  Student_Id INTEGER,
  Batch_Id INTEGER,
  FOREIGN KEY (Student_Id) REFERENCES STUDENTS(Student_Id),
  FOREIGN KEY (Batch_Id) REFERENCES BATCH(Batch_Id)
);

-- Insert 
INSERT INTO MENTOR (Mentor_Name,Email, Mobile_Number)
VALUES ('Pugazh','pugazh1@gmail.com','9876543210'),
       ('Sangeetha','sangeetha24@gmail.com', '9786345201'),
       ('Swetha','swetha4@gmail.com', '9786689907');

INSERT INTO BATCH (Batch_Name, Total_Student, Mentor_Id)
VALUES ('B52WD2', 18, 1),
       ('B52WD4', 20, 2),
       ('B53WD6', 16, 3);

INSERT INTO STUDENTS (Student_Name, Mobile_Number, Email, Mentor_Name, Batch_Id, Batch_Name)
VALUES ('John', '7846783468', 'johndoe@gmail.com', 'Pugazh', 1, 'B52WD2'),
       ('Josy', '9846766834', 'josy@gmail.com', 'Pugazh', 1, 'B52WD2'),
       ('Atlas','9846766834', 'atlas@gmail.com', 'Sangeetha', 2, 'B52WD4'),
       ('Hena','7806456788', 'hena@gmail.com', 'Swetha', 3, 'B52WD6');

INSERT INTO TASK (Task_Name, Student_Id, Mentor_Id, Mentor_Name, Batch_Name)
VALUES ('Task 1', 1, 1, 'Pugazh', 'B52WD2'),
       ('Task 2', 2, 1, 'Pugazh', 'B52WD2');
       
INSERT INTO DASHBOARD (Student_Id, Mentor_Id, Batch_Id)
VALUES  (1, 1, 1),
        (2, 1, 1),
        (3, 2, 2);

INSERT INTO QUERY (QueryText, Student_Id, Batch_Id)
VALUES ('How to solve problem x,y,z?', 1, 1),
       ('Could you please connect the Zoom call?', 2, 1),
       ('How to do this task?', 3, 2);
       
       
-- Update 
UPDATE STUDENTS
SET Mentor_Name = 'Swetha', Batch_Id = '3' , Batch_Name = 'B53WD6'
WHERE Student_Id = 2;
 
UPDATE MENTOR
SET Mobile_Number = "7845007421"
WHERE Mentor_Id = 1;

UPDATE BATCH
SET Total_Student = 19
WHERE Batch_Id = 1;

UPDATE QUERY
SET QueryText = 'How to solve problem (x+y+z)?'
WHERE Query_Id = 1;

-- Select 
SELECT * FROM MENTOR;

SELECT * FROM BATCH;

SELECT * FROM STUDENTS;

SELECT * FROM TASK;

SELECT * FROM DASHBOARD;

SELECT * FROM QUERY;
