-- Agregar la columna IdRevert
ALTER TABLE [dbo].[Gasto]
ADD [IdRevert] BIGINT NULL;

-- Crear la clave foránea para IdRevert que referencia a IdGasto
ALTER TABLE [dbo].[Gasto]
ADD CONSTRAINT [FK_Gasto_IdRevert] FOREIGN KEY ([IdRevert])
REFERENCES [dbo].[Gasto]([IdGasto])

ALTER TABLE [dbo].[Gasto]
alter column [Descripcion] [varchar](250) NULL

ALTER TABLE [dbo].[Ingreso]
ADD [IdRevert] BIGINT NULL;

-- Crear la clave foránea para IdRevert que referencia a IdGasto
ALTER TABLE [dbo].[Ingreso]
ADD CONSTRAINT [FK_Ingreso_IdRevert] FOREIGN KEY ([IdRevert])
REFERENCES [dbo].[Ingreso]([IdIngreso])

ALTER TABLE [dbo].[Ingreso]
alter column [Descripcion] [varchar](250) NULL