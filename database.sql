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
    [createdDate] DATE NULL,
    [status] INT DEFAULT 0, -- 0: Chưa kích hoạt, 1: Đã kích hoạt
    [code] NVARCHAR(50) NULL  -- Mã OTP xác nhận
);
GO

-- 2. Bảng Category cho bài CRUD Category
CREATE TABLE [Category] (
    [cate_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [cate_name] NVARCHAR(255) NOT NULL,
    [icons] NVARCHAR(255) NULL
);
GO

-- 3. Bảng Video (Câu 4: Mối quan hệ 1-N với User)
CREATE TABLE [Video] (
    [videoId] VARCHAR(50) PRIMARY KEY,
    [title] NVARCHAR(255) NOT NULL,
    [poster] NVARCHAR(255) NULL,
    [views] INT DEFAULT 0,
    [description] NVARCHAR(MAX) NULL,
    [active] BIT DEFAULT 1,
    [userId] INT NOT NULL,
    CONSTRAINT FK_Video_User FOREIGN KEY ([userId]) REFERENCES [User]([id]) ON DELETE CASCADE
);
GO

-- Thêm sẵn 1 tài khoản Admin (roleid = 1, status = 1 để đăng nhập được ngay)
INSERT INTO [User] (email, username, fullname, password, avatar, roleid, phone, createdDate, status, code)
VALUES ('admin@hcmute.edu.vn', 'admin', N'Nguyễn Hoài Hảo', '123', NULL, 1, '0908617108', GETDATE(), 1, NULL);
GO
