USE DatabasicDemoCompany;
GO


SET IDENTITY_INSERT ContactsCategories ON

INSERT INTO ContactsCategories (IdContactCategory, Name) VALUES 
(1, 'Personal phone'),
(2, 'Company phone'),
(3, 'Personal email'),
(4, 'Company email'),
(5, 'Fax'),
(6, 'Skype'),
(7, 'ICQ'),
(8, 'Facebook');

SET IDENTITY_INSERT ContactsCategories OFF