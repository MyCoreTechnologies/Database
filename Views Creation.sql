USE `SELIT_Database`;
CREATE  OR REPLACE VIEW AUTHOR_DETAIL
AS SELECT BOOK_Book_Number, Author_Name
FROM BOOK_AUTHOR, AUTHOR
WHERE AUTHOR_Author_Number = Author_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW SUBJECT_DETAIL
AS SELECT BOOK_Book_Number, Subject_Code
FROM BOOK_SUBJECT, SUBJECT
WHERE SUBJECT_Subject_Number = Subject_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW BOOK_DETAIL
AS SELECT Book_Number, Book_Name, Book_Edition, Author_Name, Subject_Code, Book_Price, Book_ISBN_10_Number, Book_ISBN_13_Number, Book_Type,
          Date_Placed, Student_Number, First_Name, Contact_Number, Email_Address
FROM BOOK, STUDENT, AUTHOR_DETAIL, SUBJECT_DETAIL
WHERE STUDENT_Student_Number = Student_Number
AND Book_Number = AUTHOR_DETAIL.BOOK_Book_Number
AND Book_Number = SUBJECT_DETAIL.BOOK_Book_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW STUDENT_DETAIL
AS SELECT student.Student_Number, student.First_Name, student.Last_Name, student.Contact_Number, student.Email_Address,
		  province.Province_Name, hostel.Hostel_Name, student.Student, student.Admin
FROM student, province, hostel
WHERE student.PROVINCE_Province_Number = province.Province_Number
AND student.HOSTEL_Hostel_Number = hostel.Hostel_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW FACULTY_DETAIL
AS SELECT Faculty_Number "Faculty Number", Subject_Code "Subject Code"
FROM FACULTY, SUBJECT
WHERE SUBJECT.FACULTY_Faculty_Number = Faculty.Faculty_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW HOSTEL_STUDENT_DETAIL
AS SELECT Hostel_Name "Hostel", Student_Number "Student Number", SUBSTR(First_Name,1,1)"Initial", Last_Name "Last Name"
FROM HOSTEL, STUDENT
WHERE Student.HOSTEL_Hostel_Number = Hostel.Hostel_Number;

USE `SELIT_Database`;
CREATE  OR REPLACE VIEW PROVICE_STUDENT_DETAIL
AS SELECT Province_Name "Province", Student_Number "Student Number", SUBSTR(First_Name,1,1)"Initial", Last_Name "Last Name"
FROM PROVINCE, STUDENT
WHERE Student.PROVINCE_Province_Number = Province.Province_Number;

CREATE  OR REPLACE VIEW STUDENT_OFFENCE_DETAIL
AS SELECT Student_Number "Student Offence", Email_Address "Student Email Address", Date_Of_Offence "Offence Date", Type_Of_Offence "Offence Type", Reason 
FROM STUDENT, STUDENT_OFFENCE
WHERE student.Student_Number = student_offence.STUDENT_Student_Number;
