SELECT [addressID], [userID], [fullName], [phone], [city], [district], [wardss], [addressHouse], [status] FROM [dbo].[tblAddress]
WHERE [userID]=2 AND [fullName]=N'Minh Tai' AND [phone]=N'0384600000' AND [city]=N'HCM' AND [district]=N'District 9' AND [wardss]=N'Long Thanh My' AND [addressHouse]=N'FPT University' AND [status]!=N'PRIMARY'
