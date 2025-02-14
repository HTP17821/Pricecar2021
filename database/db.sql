-- Bảng [dim_car_model] - Mẫu xe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dim_car_model')
    CREATE TABLE [dim_car_model] (
        [car_model_id] INT PRIMARY KEY,  
        [car_model] NVARCHAR(255) NOT NULL  
    );

-- Bảng [dim_car_type] - Loại xe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dim_car_type')
    CREATE TABLE [dim_car_type] (
        [car_type_id] INT PRIMARY KEY,   
        [car_type] NVARCHAR(255) NOT NULL   
    );

-- Bảng [dim_color] - Màu sắc ngoại thất của xe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dim_color')
    CREATE TABLE [dim_color] (
        [color_id] INT PRIMARY KEY,   
        [out_color] NVARCHAR(255)   
    );

-- Bảng [dim_poster] - Người đăng tin
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dim_poster')
    CREATE TABLE [dim_poster] (
        [poster_id] INT PRIMARY KEY,   
        [poster_name] NVARCHAR(255) NOT NULL,   
        [poster_add] NVARCHAR(255) NOT NULL,   
        [poster_tel] NVARCHAR(255) NOT NULL   
    );

-- Bảng [dim_car_condition] - Tình trạng xe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dim_car_condition')
    CREATE TABLE [dim_car_condition] (
        [condition_id] INT PRIMARY KEY,  
        [new_old] NVARCHAR(50) NOT NULL  
    );

-- Bảng [fact_car_sale] - Thông tin đăng bán xe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'fact_car_sale')
    CREATE TABLE [fact_car_sale] (
        [sale_id] INT PRIMARY KEY IDENTITY(1,1),  -- ID tự động tăng
        [car_model_id] INT,   
        [car_type_id] INT,   
        [color_id] INT,   
        [poster_id] INT,   
        [condition_id] INT,  
        
        [km] BIGINT,   
        [door_num] INT,    
        [seat_num] INT,    
        [car_year] INT,    
        [price_num] BIGINT,   
        [price_words] NVARCHAR(255),   
        [area] NVARCHAR(255),  

        FOREIGN KEY ([car_model_id]) REFERENCES [dim_car_model]([car_model_id]),
        FOREIGN KEY ([car_type_id]) REFERENCES [dim_car_type]([car_type_id]),
        FOREIGN KEY ([color_id]) REFERENCES [dim_color]([color_id]),
        FOREIGN KEY ([poster_id]) REFERENCES [dim_poster]([poster_id]),
        FOREIGN KEY ([condition_id]) REFERENCES [dim_car_condition]([condition_id])
    );
