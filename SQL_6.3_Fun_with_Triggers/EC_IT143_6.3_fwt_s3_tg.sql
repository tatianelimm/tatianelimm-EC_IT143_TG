-- Alteração da tabela
ALTER TABLE dbo.t_w3_schools_customers
ADD LastModified DATETIME NULL,
    ModifiedBy VARCHAR(100) NULL;
