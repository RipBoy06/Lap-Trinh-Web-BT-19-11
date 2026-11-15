CREATE DATABASE ShoppingServiceMVC;
GO
USE ShoppingServiceMVC;
GO

-- 1. Bảng User cho bài Login & Register
CREATE TABLE [User] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [email] NVARCHAR(255) NOT NULL,
    [username] NVARCHAR(255) NOT NULL,
    [fullname] NVARCHAR(255) NULL,
    [password] NVARCHAR(255) NOT NULL,
    [avatar] NVARCHAR(255) NULL,
    [roleid] INT DEFAULT 3, -- 1: Admin, 2: Manager, 3/5: User
    [phone] NVARCHAR(50) NULL,
    [createdDate] DATE NULL
);
GO

-- 2. Bảng Category cho bài CRUD Category
CREATE TABLE [Category] (
    [cate_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [cate_name] NVARCHAR(255) NOT NULL,
    [icons] NVARCHAR(255) NULL
);
GO

-- Thêm sẵn 1 tài khoản Admin (roleid = 1) để test
INSERT INTO [User] (email, username, fullname, password, avatar, roleid, phone, createdDate)
VALUES ('admin@hcmute.edu.vn', 'admin', N'Nguyễn Hoài Hảo', '123', NULL, 1, '0908617108', GETDATE());
GO