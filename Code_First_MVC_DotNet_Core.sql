/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [StudentId]
      ,[StudentName]
      ,[StudentAge]
      ,[StudentMobile]
      ,[StudentEmail]
      ,[StudentPassword]
      ,[StudentConfirmPassword]
  FROM [TE_CODEFIRST].[dbo].[student]