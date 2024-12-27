USE [master]
GO
/****** Object:  Database [Maria_MC]    Script Date: 27/12/2024 16:02:40 ******/
CREATE DATABASE [Maria_MC]
GO
USE [Maria_MC]
GO
BEGIN
EXEC [Maria_MC].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO
ALTER DATABASE [Maria_MC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Maria_MC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Maria_MC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Maria_MC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Maria_MC] SET ARITHABORT OFF 
GO
ALTER DATABASE [Maria_MC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Maria_MC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Maria_MC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Maria_MC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Maria_MC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Maria_MC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Maria_MC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Maria_MC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Maria_MC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Maria_MC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Maria_MC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Maria_MC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Maria_MC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Maria_MC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Maria_MC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Maria_MC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Maria_MC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Maria_MC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Maria_MC] SET  MULTI_USER 
GO
ALTER DATABASE [Maria_MC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Maria_MC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Maria_MC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Maria_MC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Maria_MC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Maria_MC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Maria_MC] SET QUERY_STORE = ON
GO
ALTER DATABASE [Maria_MC] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Maria_MC]
GO
/****** Object:  Table [dbo].[CierreDeCaja]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CierreDeCaja](
	[IdCierre] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[FechaDesde] [datetime] NOT NULL,
	[Fechahasta] [datetime] NOT NULL,
	[CantidadDeVentas] [int] NOT NULL,
	[CantidadDePrendas] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[TotalEfectivo] [decimal](18, 2) NOT NULL,
	[TotalMp] [decimal](18, 2) NOT NULL,
	[AperturaEfCaja] [decimal](18, 2) NOT NULL,
	[CierreEfCaja] [decimal](18, 2) NOT NULL,
	[EfectivoAGuardar] [decimal](18, 2) NOT NULL,
	[EnCaja] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CierreDeCaja] PRIMARY KEY CLUSTERED 
(
	[IdCierre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CierreDeCajaDetalle]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CierreDeCajaDetalle](
	[IdDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCierre] [bigint] NOT NULL,
	[IdTipoFormaPago] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CierreDeCajaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdCierre] ASC,
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Mail] [varchar](100) NOT NULL,
	[NroDocumento] [varchar](11) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[SaldoEnCuenta] [numeric](18, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[IdCompra] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[IdCompra] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[TotalDeCompra] [numeric](18, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[TotalCreditoEnTienda] [numeric](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprasFormasDePago]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprasFormasDePago](
	[IdCompra] [bigint] NOT NULL,
	[IdTipoFormaPago] [int] NOT NULL,
	[Valor] [numeric](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC,
	[IdTipoFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[IdComprobante] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[NroPuntoVenta] [int] NOT NULL,
	[NroComprobante] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Total] [numeric](18, 2) NOT NULL,
	[FacturaHtml] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[IdComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaCorriente]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaCorriente](
	[IdCtacte] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdMovimiento] [bigint] NOT NULL,
	[Importe] [numeric](18, 2) NOT NULL,
	[SaldoActual] [numeric](18, 2) NOT NULL,
	[IdTipoDeMovimiento] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdCierre] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCtacte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gasto]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gasto](
	[IdGasto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Importe] [numeric](18, 2) NOT NULL,
	[IdTipoDeGasto] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoFormaPago] [int] NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Gasto] PRIMARY KEY CLUSTERED 
(
	[IdGasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IdIngreso] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Importe] [numeric](18, 2) NOT NULL,
	[IdTipoDeIngreso] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoFormaPago] [int] NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParamAfip]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParamAfip](
	[IdSucursal] [int] NOT NULL,
	[PuntoDeVenta] [int] NOT NULL,
	[CuitFactura] [varchar](11) NOT NULL,
	[Token] [varchar](2500) NOT NULL,
	[Sign] [varchar](2500) NOT NULL,
	[FechaExpiracion] [datetime] NULL,
	[TokenPadron] [varchar](2500) NULL,
	[SignPadron] [varchar](2500) NULL,
	[FechaExpiracionPadron] [datetime] NULL,
	[TipoFactura] [char](1) NOT NULL,
	[NombreFantasia] [varchar](50) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[Domicilio] [varchar](30) NOT NULL,
	[CondicionFrenteAlIva] [varchar](30) NOT NULL,
	[FechaInicioActividades] [datetime] NOT NULL,
	[UltimoComprobanteAprobado] [bigint] NOT NULL,
 CONSTRAINT [PK_ParamAfip] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoEstado]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoEstado](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Stock] [int] NOT NULL,
	[PrecioDeCompra] [numeric](18, 2) NOT NULL,
	[PrecioDeVenta] [numeric](18, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[idTipoTalle] [int] NOT NULL,
	[idTipoMarca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[OpenedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablaDeConfiguracion]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaDeConfiguracion](
	[IdConfiguracion] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](10) NULL,
	[IdSucursal] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[ValorString] [varchar](100) NULL,
	[ValorBool] [bit] NULL,
	[ValorDecimal] [decimal](18, 2) NULL,
	[ValorInteger] [int] NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[IdConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEstado]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEstado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoFormasDePago]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoFormasDePago](
	[IdTipoFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Descuento] [numeric](3, 2) NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMarca]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMarca](
	[IdTipoMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_TipoMarca] PRIMARY KEY CLUSTERED 
(
	[IdTipoMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeGasto]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeGasto](
	[IdTipoDeGasto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_TiposDeGasto] PRIMARY KEY CLUSTERED 
(
	[IdTipoDeGasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeIngreso]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeIngreso](
	[IdTipoDeIngreso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_TiposDeIngreso] PRIMARY KEY CLUSTERED 
(
	[IdTipoDeIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeMovimiento]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeMovimiento](
	[IdTipoDeMovimiento] [char](1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoDeMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[IdTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposProducto]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposProducto](
	[IdTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[Categoria] [varchar](20) NULL,
 CONSTRAINT [PK_TiposProducto] PRIMARY KEY CLUSTERED 
(
	[IdTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTalle]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTalle](
	[IdTipoTalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[categoria] [varchar](20) NULL,
 CONSTRAINT [PK_TipoTalle] PRIMARY KEY CLUSTERED 
(
	[IdTipoTalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](256) NOT NULL,
	[IdEmpleado] [int] NULL,
	[Activo] [char](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Perfil] [varchar](50) NULL,
	[token] [varchar](2048) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [bigint] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[TotalDeVenta] [numeric](18, 2) NOT NULL,
	[IdComprobante] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IdVenta] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Valor] [numeric](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaFormasDePago]    Script Date: 27/12/2024 16:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaFormasDePago](
	[IdVenta] [bigint] NOT NULL,
	[IdTipoFormaPago] [int] NOT NULL,
	[ValorParcial] [numeric](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC,
	[IdTipoFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CierreDeCaja] ON 
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (38, 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-05-23T11:57:06.370' AS DateTime), 2, 2, 11, CAST(-12750.00 AS Decimal(18, 2)), CAST(-48500.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(7250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (39, 1, CAST(N'2024-05-23T11:57:06.370' AS DateTime), CAST(N'2024-05-24T10:17:38.477' AS DateTime), 1, 1, 11, CAST(10000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(7250.00 AS Decimal(18, 2)), CAST(17250.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (40, 1, CAST(N'2024-05-24T10:17:38.477' AS DateTime), CAST(N'2024-05-24T10:19:22.813' AS DateTime), 1, 1, 11, CAST(13000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17250.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(10250.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (41, 1, CAST(N'2024-05-24T10:19:22.813' AS DateTime), CAST(N'2024-05-30T17:50:59.453' AS DateTime), 2, 2, 11, CAST(41000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(41000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (42, 1, CAST(N'2024-05-30T17:50:59.453' AS DateTime), CAST(N'2024-08-08T14:20:52.400' AS DateTime), 2, 3, 11, CAST(13460.00 AS Decimal(18, 2)), CAST(35001.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(3460.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCaja] ([IdCierre], [IdSucursal], [FechaDesde], [Fechahasta], [CantidadDeVentas], [CantidadDePrendas], [IdUsuario], [TotalEfectivo], [TotalMp], [AperturaEfCaja], [CierreEfCaja], [EfectivoAGuardar], [EnCaja]) VALUES (43, 1, CAST(N'2024-08-08T14:20:52.400' AS DateTime), CAST(N'2024-10-16T11:01:33.423' AS DateTime), 14, 15, 11, CAST(79016.00 AS Decimal(18, 2)), CAST(26500.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(79016.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CierreDeCaja] OFF
GO
SET IDENTITY_INSERT [dbo].[CierreDeCajaDetalle] ON 
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (117, 38, 4, CAST(65000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (118, 38, 6, CAST(-85750.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (119, 38, 10, CAST(2250.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (120, 38, 2, CAST(-113500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (121, 38, 1, CAST(-15000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (122, 39, 1, CAST(10000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (123, 40, 1, CAST(13000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (124, 41, 1, CAST(41000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (125, 41, 6, CAST(55000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (126, 42, 4, CAST(40001.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (127, 42, 10, CAST(27450.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (128, 42, 2, CAST(-5000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (129, 42, 6, CAST(-9765.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (130, 42, 1, CAST(-13990.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (131, 43, 1, CAST(43970.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (132, 43, 6, CAST(16590.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (133, 43, 10, CAST(35046.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[CierreDeCajaDetalle] ([IdDetalle], [IdCierre], [IdTipoFormaPago], [Total]) VALUES (134, 43, 4, CAST(26500.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CierreDeCajaDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'Maria Iustina', N'Chequer', N'iuschequer@gmail.com', N'34139217', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:58:51.213' AS DateTime), CAST(N'2024-04-24T11:58:51.213' AS DateTime), NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'Juan', N'De los Palotes', N'jp@gmail.com', N'12345678', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:58:51.213' AS DateTime), CAST(N'2024-04-24T11:58:51.213' AS DateTime), NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (3, N'Cliente Test', N'Apellido test', N'test@test.com', N'87654321', 1, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:58:51.213' AS DateTime), CAST(N'2024-04-24T11:58:51.213' AS DateTime), NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (4, N'Tomás Ricardo', N'Garcia del hoyo', N'tomasgdh@gmail.com', N'31004023', 1, CAST(-7575.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:58:51.213' AS DateTime), CAST(N'2024-04-24T11:58:51.213' AS DateTime), NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (5, N'Maria Cecilia', N'Brignone', N'marycecibri@gmail.com', N'14222117', 1, CAST(8250.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:58:51.213' AS DateTime), CAST(N'2024-04-24T11:58:51.213' AS DateTime), NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (6, N'Cliente Generico', N'Cliente Generico', N'--', N'-1', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-04-24T15:13:14.743' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (10, N'Jose', N'Garcia del Hoyo', N'tomasgdh@gmail.com', N'12345678', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-05-02T11:14:55.993' AS DateTime), CAST(N'2024-05-02T11:14:57.260' AS DateTime), 11)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (11, N'ROQUE', N'GARCIA DEL HOYO', N'test1@test.com', N'11122233', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-05-02T11:30:09.457' AS DateTime), CAST(N'2024-05-02T11:30:09.470' AS DateTime), 11)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (12, N'MERCEDES', N'GARCIA DEL HOYO', N'test4@test.com', N'1111111', 1, CAST(39750.00 AS Numeric(18, 2)), CAST(N'2024-05-02T11:39:09.180' AS DateTime), CAST(N'2024-05-02T11:39:09.193' AS DateTime), 11)
GO
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [Mail], [NroDocumento], [IdTipoDocumento], [SaldoEnCuenta], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (13, N'MILAGROS', N'CHEQUER', N'test5@test.com', N'22222222', 1, CAST(0.00 AS Numeric(18, 2)), CAST(N'2024-05-02T11:41:28.697' AS DateTime), CAST(N'2024-05-02T11:41:28.713' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (9, 6, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (10, 7, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (11, 8, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (12, 9, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (13, 10, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (14, 11, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (15, 12, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 13, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 14, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 15, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 16, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 17, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 18, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 19, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 20, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (16, 21, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (17, 63, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (17, 64, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (18, 73, 1)
GO
INSERT [dbo].[CompraDetalle] ([IdCompra], [IdProducto], [Cantidad]) VALUES (19, 74, 1)
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (9, 1, CAST(N'2024-05-10T23:57:36.777' AS DateTime), 4, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-10T23:57:36.777' AS DateTime), CAST(N'2024-05-10T23:57:36.777' AS DateTime), 11, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (10, 1, CAST(N'2024-05-13T14:39:28.290' AS DateTime), 4, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T14:39:28.290' AS DateTime), CAST(N'2024-05-13T14:39:28.290' AS DateTime), 11, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (11, 1, CAST(N'2024-05-13T16:35:41.003' AS DateTime), 4, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T16:35:41.003' AS DateTime), CAST(N'2024-05-13T16:35:41.003' AS DateTime), 11, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (12, 1, CAST(N'2024-05-13T17:29:56.773' AS DateTime), 5, CAST(10000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:29:56.773' AS DateTime), CAST(N'2024-05-13T17:29:56.773' AS DateTime), 11, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (13, 1, CAST(N'2024-05-13T17:33:56.710' AS DateTime), 1, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:33:56.710' AS DateTime), CAST(N'2024-05-13T17:33:56.710' AS DateTime), 11, CAST(6000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (14, 1, CAST(N'2024-05-13T17:36:35.533' AS DateTime), 12, CAST(13500.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:36:35.533' AS DateTime), CAST(N'2024-05-13T17:36:35.533' AS DateTime), 11, CAST(0.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (15, 1, CAST(N'2024-05-13T18:18:20.123' AS DateTime), 2, CAST(15000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:18:20.123' AS DateTime), CAST(N'2024-05-13T18:18:20.123' AS DateTime), 11, CAST(0.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (16, 1, CAST(N'2024-05-13T18:22:03.707' AS DateTime), 12, CAST(50000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.707' AS DateTime), CAST(N'2024-05-13T18:22:03.707' AS DateTime), 11, CAST(39750.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (17, 1, CAST(N'2024-06-05T12:50:43.747' AS DateTime), 5, CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:50:43.747' AS DateTime), CAST(N'2024-06-05T12:50:43.747' AS DateTime), 11, CAST(8250.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (18, 1, CAST(N'2024-06-11T16:41:12.160' AS DateTime), 4, CAST(4990.00 AS Numeric(18, 2)), CAST(N'2024-06-11T16:41:12.163' AS DateTime), CAST(N'2024-06-11T16:41:12.163' AS DateTime), 11, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[Compras] ([IdCompra], [IdSucursal], [FechaCompra], [IdCliente], [TotalDeCompra], [CreatedDate], [ModifiedDate], [IdUsuario], [TotalCreditoEnTienda]) VALUES (19, 1, CAST(N'2024-06-11T16:43:16.573' AS DateTime), 4, CAST(24000.00 AS Numeric(18, 2)), CAST(N'2024-06-11T16:43:16.573' AS DateTime), CAST(N'2024-06-11T16:43:16.573' AS DateTime), 11, CAST(0.00 AS Numeric(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (9, 2, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (9, 6, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (10, 2, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (10, 6, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (11, 2, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (11, 6, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (12, 2, CAST(10000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (12, 6, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (13, 2, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (13, 6, CAST(6000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (14, 2, CAST(13500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (15, 1, CAST(15000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (16, 2, CAST(50000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (16, 6, CAST(39750.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (17, 2, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (17, 6, CAST(8250.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (18, 1, CAST(4990.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (18, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[ComprasFormasDePago] ([IdCompra], [IdTipoFormaPago], [Valor]) VALUES (19, 1, CAST(24000.00 AS Numeric(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Comprobante] ON 
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (1, 1, 1, 10, CAST(N'2024-09-19T18:07:48.117' AS DateTime), N'C', CAST(12800.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000010</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 19/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>12345678
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del Hoyo, Jose
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000069</td>
                                <td>POLLERA - GAP</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 6.500,00</td>
                                <td style="text-align:right;">$ 6.500,00</td>
                            </tr>
                            
                            <tr>
                                <td>00000070</td>
                                <td>ZAPATO - VICTORIA''S SECRET</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 7.000,00</td>
                                <td style="text-align:right;">$ 7.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>13500,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>700,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12800,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199802023
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240929
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-19T18:07:48.117' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (2, 1, 1, 11, CAST(N'2024-09-19T18:08:06.893' AS DateTime), N'C', CAST(12800.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000011</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 19/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>12345678
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del Hoyo, Jose
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000069</td>
                                <td>POLLERA - GAP</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 6.500,00</td>
                                <td style="text-align:right;">$ 6.500,00</td>
                            </tr>
                            
                            <tr>
                                <td>00000070</td>
                                <td>ZAPATO - VICTORIA''S SECRET</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 7.000,00</td>
                                <td style="text-align:right;">$ 7.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>13500,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>700,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12800,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199802094
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240929
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-19T18:08:06.893' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (3, 1, 1, 12, CAST(N'2024-09-19T18:44:06.823' AS DateTime), N'C', CAST(5500.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000012</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 19/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>0
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Consumidor Final
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000067</td>
                                <td>SWEATER - FOREVER 21</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 5.500,00</td>
                                <td style="text-align:right;">$ 5.500,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>5500,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>0,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>5500,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199803773
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240929
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-19T18:44:06.877' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (4, 1, 1, 13, CAST(N'2024-09-20T15:45:05.020' AS DateTime), N'C', CAST(12000.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000013</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 20/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>31004023
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del hoyo, Tomás Ricardo
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000063</td>
                                <td>CAMISA - ABERCROMBIE & FITCH</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>0,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199852976
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240930
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-20T15:45:05.023' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (5, 1, 1, 14, CAST(N'2024-09-20T15:51:20.043' AS DateTime), N'C', CAST(12000.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000014</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 20/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>31004023
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del hoyo, Tomás Ricardo
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000063</td>
                                <td>CAMISA - ABERCROMBIE & FITCH</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>0,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199853359
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240930
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-20T15:51:20.073' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (6, 1, 1, 15, CAST(N'2024-09-20T15:53:35.020' AS DateTime), N'C', CAST(12000.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000015</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 20/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>31004023
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del hoyo, Tomás Ricardo
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000063</td>
                                <td>CAMISA - ABERCROMBIE & FITCH</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>0,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199853493
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240930
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-20T15:53:35.020' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (7, 1, 1, 16, CAST(N'2024-09-20T15:54:18.310' AS DateTime), N'C', CAST(12000.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type="text/css">
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class="bill-container">
		<tr class="bill-emitter-row">
			<td>
				<div class="bill-type">
					C
				</div>
				<div class="text-lg text-center">
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class="text-lg">
						Factura
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class="col-6 margin-b-0">
							<strong>Comp. Nro: 00000016</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 20/09/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row">
			<td colspan="2">
				<div>
					<div class="row">
						<p class="col-4 margin-b-0">
							<strong>CUIL/CUIT/DNI: </strong>31004023
						</p>
						<p class="col-8 margin-b-0">
							<strong>Apellido y Nombre / Razón social: </strong>Garcia del hoyo, Tomás Ricardo
						</p>
					</div>
					<div class="row">
						<p class="col-6 margin-b-0">
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class="col-6 margin-b-0">
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td colspan="2">
				<div style="min-height:550px;">
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000063</td>
                                <td>CAMISA - ABERCROMBIE & FITCH</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                                <td style="text-align:right;">$ 12.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class="bill-row total-row">
			<td colspan="2">
				<div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Subtotal: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Descuentos: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>0,00</strong>
						</p>
					</div>
					<div class="row text-right">
						<p class="col-10 margin-b-0">
							<strong>Importe total: $</strong>
						</p>
						<p class="col-2 margin-b-0">
							<strong>12000,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class="bill-row row-details">
			<td>
				<div>
					<div class="row">
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class="row text-right margin-b-10">
						<strong>CAE Nº:&nbsp;</strong> 74384199853540
					</div>
					<div class="row text-right">
						<strong>Fecha de Vto. de CAE:&nbsp;</strong> 20240930
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-09-20T15:54:18.310' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (8, 1, 1, 18, CAST(N'2024-10-10T16:04:41.203' AS DateTime), N'C', CAST(6000.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type=''text/css''>
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class=''bill-container''>
		<tr class=''bill-emitter-row''>
			<td>
				<div class=''bill-type''>
					C
				</div>
				<div class=''text-lg text-center''>
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class=''text-lg''>
						Factura
					</div>
					<div class=''row''>
						<p class=''col-6 margin-b-0''>
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class=''col-6 margin-b-0''>
							<strong>Comp. Nro: 00000018</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 10/10/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class=''bill-row''>
			<td colspan=''2''>
				<div>
					<div class=''row''>
						<p class=''col-4 margin-b-0''>
							<strong>CUIL/CUIT/DNI: </strong>11122233
						</p>
						<p class=''col-8 margin-b-0''>
							<strong>Apellido y Nombre / Razón social: </strong>GARCIA DEL HOYO, ROQUE
						</p>
					</div>
					<div class=''row''>
						<p class=''col-6 margin-b-0''>
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class=''col-6 margin-b-0''>
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class=''bill-row row-details''>
			<td colspan=''2''>
				<div style=''min-height:550px;''>
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000068</td>
                                <td>CAMISA - MANGO</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 6.000,00</td>
                                <td style="text-align:right;">$ 6.000,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class=''bill-row total-row''>
			<td colspan=''2''>
				<div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Subtotal: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>6000,00</strong>
						</p>
					</div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Descuentos: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>0,00</strong>
						</p>
					</div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Importe total: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>6000,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class=''bill-row row-details''>
			<td>
				<div>
					<div class=''row''>
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class=''row text-right margin-b-10''>
						<p><strong>CAE Nº:&nbsp;</strong> 74414201722671</p>
					</div>
					<div class=''row text-right''>
						<p><strong>Fecha de Vto. de CAE:&nbsp;</strong> 20241020</p>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-10-10T16:04:41.203' AS DateTime), 11)
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [IdSucursal], [NroPuntoVenta], [NroComprobante], [Fecha], [Tipo], [Total], [FacturaHtml], [CreatedDate], [IdUsuario]) VALUES (9, 1, 1, 19, CAST(N'2024-10-16T11:04:46.950' AS DateTime), N'C', CAST(7100.00 AS Numeric(18, 2)), N'<!DOCTYPE html>
<html>
<head>
	<title>Factura</title>
	<style type=''text/css''>
		*{
			box-sizing: border-box;
			-webkit-user-select: none; /* Chrome, Opera, Safari */
			-moz-user-select: none; /* Firefox 2+ */
			-ms-user-select: none; /* IE 10+ */
			user-select: none; /* Standard syntax */
		}
		.bill-container{
			width: 750px;
			position: absolute;
			left:0;
			right: 0;
			margin: auto;
			border-collapse: collapse;
			font-family: sans-serif;
			font-size: 13px;
		}

		.bill-emitter-row td{
			width: 50%;
			border-bottom: 1px solid; 
			padding-top: 10px;
			padding-left: 10px;
			vertical-align: top;
		}
		.bill-emitter-row{
			position: relative;
		}
		.bill-emitter-row td:nth-child(2){
			padding-left: 60px;
		}
		.bill-emitter-row td:nth-child(1){
			padding-right: 60px;
		}

		.bill-type{
			border: 1px solid;
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin-right: -30px;
			background: white;
			width: 60px;
			height: 50px;
			position: absolute;
			left: 0;
			right: 0;
			top: -1px;
			margin: auto;
			text-align: center;
			font-size: 40px;
			font-weight: 600;
		}
		.text-lg{
			font-size: 30px;
		}
		.text-center{
			text-align: center;
		}

		.col-2{
			width: 16.66666667%;
			float: left;
		}
		.col-3{
			width: 25%;
			float: left;
		}
		.col-4{
			width: 33.3333333%;
			float: left;
		}
		.col-5{
			width: 41.66666667%;
			float: left;
		}
		.col-6{
			width: 50%;
			float: left;
		}
		.col-8{
			width: 66.66666667%;
			float: left;
		}
		.col-10{
			width: 83.33333333%;
			float: left;
		}
		.row{
			overflow: hidden;
		}

		.margin-b-0{
			margin-bottom: 0px;
		}

		.bill-row td{
			padding-top: 5px
		}

		.bill-row td > div{
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			margin: 0 -1px 0 -2px;
			padding: 0 10px 13px 10px;
		}
		.row-details table {
			border-collapse: collapse;
			width: 100%;
		}
		.row-details td > div, .row-qrcode td > div{
			border: 0;
			margin: 0 -1px 0 -2px;
			padding: 0;
		}
		.row-details table td{
			padding: 5px;
		}
		.row-details table tr:nth-child(1){
			border-top: 1px solid; 
			border-bottom: 1px solid; 
			background: #c0c0c0;
			font-weight: bold;
			text-align: center;
		}
		.row-details table tr +  tr{
			border-top: 1px solid #c0c0c0; 
			
		}
		.text-right{
			text-align: right;
		}

		.margin-b-10 {
			margin-bottom: 10px;
		}

		.total-row td > div{
			border-width: 2px;
		}

		.row-qrcode td{
			padding: 10px;
		}		

		#qrcode {
			width: 25%;
		}
	</style>
</head>
<body>
	<table class=''bill-container''>
		<tr class=''bill-emitter-row''>
			<td>
				<div class=''bill-type''>
					C
				</div>
				<div class=''text-lg text-center''>
					MARIA MODA CIRCULAR
				</div>
				<p><strong>Razón social:</strong> Maria Iustina Chequer Charan</p>
				<p><strong>Domicilio Comercial:</strong> Camacua 85</p>
				<p><strong>Condición Frente al IVA:</strong> Monotributista</p>
			</td>
			<td>
				<div>
					<div class=''text-lg''>
						Factura
					</div>
					<div class=''row''>
						<p class=''col-6 margin-b-0''>
							<strong>Punto de Venta: 0001</strong>
						</p>
						<p class=''col-6 margin-b-0''>
							<strong>Comp. Nro: 00000019</strong> 
						</p>
					</div>
					<p><strong>Fecha de Emisión:</strong> 16/10/2024</p>
					<p><strong>CUIT:</strong> 27-34139217-4</p>
					<p><strong>Ingresos Brutos:</strong> 27-34139217-4</p>
					<p><strong>Fecha de Inicio de Actividades:</strong> 01/11/2020</p>
				</div>
			</td>
		</tr>
		<tr class=''bill-row''>
			<td colspan=''2''>
				<div>
					<div class=''row''>
						<p class=''col-4 margin-b-0''>
							<strong>CUIL/CUIT/DNI: </strong>34139217
						</p>
						<p class=''col-8 margin-b-0''>
							<strong>Apellido y Nombre / Razón social: </strong>Chequer, Maria Iustina
						</p>
					</div>
					<div class=''row''>
						<p class=''col-6 margin-b-0''>
							<strong>Condición Frente al IVA: </strong>Consumidor Final
						</p>
						<p class=''col-6 margin-b-0''>
							<strong>Domicilio: </strong> - 
						</p>
					</div>
					<p>
						<strong>Condicion de venta: </strong>Contado
					</p>
				</div>
			</td>
		</tr>
		<tr class=''bill-row row-details''>
			<td colspan=''2''>
				<div style=''min-height:550px;''>
					
                        <table id=''TablaProductos''>
                            <tr style="text-align:left;">
                                <td>Código</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <td>U. Medida</td>
                                <td>Precio Unit.</td>
                                <td>Subtotal</td>
                            </tr>
                            
                            <tr>
                                <td>00000071</td>
                                <td>CARTERA - NIKE</td>
                                <td>1,00</td>
                                <td>Unidad</td>
                                <td style="text-align:right;">$ 7.500,00</td>
                                <td style="text-align:right;">$ 7.500,00</td>
                            </tr>
                            
                        </table>
				</div>
			</td>
		</tr>
		<tr class=''bill-row total-row''>
			<td colspan=''2''>
				<div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Subtotal: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>7500,00</strong>
						</p>
					</div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Descuentos: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>400,00</strong>
						</p>
					</div>
					<div class=''row text-right''>
						<p class=''col-10 margin-b-0''>
							<strong>Importe total: $</strong>
						</p>
						<p class=''col-2 margin-b-0''>
							<strong>7100,00</strong>
						</p>
					</div>
				</div>
			</td>
		</tr>
		<tr class=''bill-row row-details''>
			<td>
				<div>
					<div class=''row''>
						<img id=''qrcode'' src=''data:image/png;base64,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'' alt=''QR Comprobante'' />
					</div>
				</div>
			</td>
			<td>
				<div>
					<div class=''row text-right margin-b-10''>
						<p><strong>CAE Nº:&nbsp;</strong> 74424201989398</p>
					</div>
					<div class=''row text-right''>
						<p><strong>Fecha de Vto. de CAE:&nbsp;</strong> 20241026</p>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>', CAST(N'2024-10-16T11:04:46.973' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[Comprobante] OFF
GO
SET IDENTITY_INSERT [dbo].[CuentaCorriente] ON 
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (6, 1, CAST(N'2024-05-10T23:58:02.493' AS DateTime), 9, CAST(5000.00 AS Numeric(18, 2)), CAST(-5000.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-10T23:58:02.510' AS DateTime), CAST(N'2024-05-10T23:58:02.520' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (7, 1, CAST(N'2024-05-13T14:39:33.003' AS DateTime), 10, CAST(5000.00 AS Numeric(18, 2)), CAST(-10000.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T14:39:33.003' AS DateTime), CAST(N'2024-05-13T14:39:33.003' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (8, 1, CAST(N'2024-05-13T16:35:46.067' AS DateTime), 11, CAST(5000.00 AS Numeric(18, 2)), CAST(-15000.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T16:35:46.067' AS DateTime), CAST(N'2024-05-13T16:35:46.067' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (9, 1, CAST(N'2024-05-13T17:19:18.943' AS DateTime), 12, CAST(60000.00 AS Numeric(18, 2)), CAST(45000.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-13T17:19:18.943' AS DateTime), CAST(N'2024-05-13T17:19:18.943' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (10, 1, CAST(N'2024-05-13T17:30:01.410' AS DateTime), 12, CAST(10000.00 AS Numeric(18, 2)), CAST(35000.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T17:30:01.410' AS DateTime), CAST(N'2024-05-13T17:30:01.410' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (11, 1, CAST(N'2024-05-13T17:33:56.797' AS DateTime), 13, CAST(5000.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T17:33:56.797' AS DateTime), CAST(N'2024-05-13T17:33:56.797' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (12, 1, CAST(N'2024-05-13T17:36:35.587' AS DateTime), 14, CAST(13500.00 AS Numeric(18, 2)), CAST(16500.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T17:36:35.587' AS DateTime), CAST(N'2024-05-13T17:36:35.587' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (13, 1, CAST(N'2024-05-13T18:18:20.217' AS DateTime), 15, CAST(15000.00 AS Numeric(18, 2)), CAST(1500.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T18:18:20.217' AS DateTime), CAST(N'2024-05-13T18:18:20.217' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (14, 1, CAST(N'2024-05-13T18:22:03.833' AS DateTime), 16, CAST(50000.00 AS Numeric(18, 2)), CAST(-48500.00 AS Numeric(18, 2)), N'C', CAST(N'2024-05-13T18:22:03.833' AS DateTime), CAST(N'2024-05-13T18:22:03.833' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (15, 1, CAST(N'2024-05-16T17:23:22.877' AS DateTime), 13, CAST(12250.00 AS Numeric(18, 2)), CAST(-36250.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-16T17:23:22.877' AS DateTime), CAST(N'2024-05-16T17:23:22.877' AS DateTime), 38)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (17, 1, CAST(N'2024-05-24T10:17:17.283' AS DateTime), 14, CAST(10000.00 AS Numeric(18, 2)), CAST(-6250.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-24T10:17:17.283' AS DateTime), CAST(N'2024-05-24T10:17:17.283' AS DateTime), 39)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (18, 1, CAST(N'2024-05-24T10:18:26.323' AS DateTime), 15, CAST(13000.00 AS Numeric(18, 2)), CAST(6750.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-24T10:18:26.323' AS DateTime), CAST(N'2024-05-24T10:18:26.323' AS DateTime), 40)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (19, 1, CAST(N'2024-05-30T10:24:14.347' AS DateTime), 16, CAST(5000.00 AS Numeric(18, 2)), CAST(11750.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-30T10:24:14.347' AS DateTime), CAST(N'2024-05-30T10:24:14.347' AS DateTime), 41)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (20, 1, CAST(N'2024-05-30T17:05:24.013' AS DateTime), 17, CAST(36000.00 AS Numeric(18, 2)), CAST(47750.00 AS Numeric(18, 2)), N'V', CAST(N'2024-05-30T17:05:24.013' AS DateTime), CAST(N'2024-05-30T17:05:24.013' AS DateTime), 41)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (21, 1, CAST(N'2024-06-05T12:49:11.210' AS DateTime), 18, CAST(63501.00 AS Numeric(18, 2)), CAST(111251.00 AS Numeric(18, 2)), N'V', CAST(N'2024-06-05T12:49:11.210' AS DateTime), CAST(N'2024-06-05T12:49:11.210' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (22, 1, CAST(N'2024-06-05T12:50:43.907' AS DateTime), 17, CAST(5000.00 AS Numeric(18, 2)), CAST(106251.00 AS Numeric(18, 2)), N'C', CAST(N'2024-06-05T12:50:43.907' AS DateTime), CAST(N'2024-06-05T12:50:43.907' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (23, 1, CAST(N'2024-06-11T16:41:12.377' AS DateTime), 18, CAST(4990.00 AS Numeric(18, 2)), CAST(101261.00 AS Numeric(18, 2)), N'C', CAST(N'2024-06-11T16:41:12.377' AS DateTime), CAST(N'2024-06-11T16:41:12.377' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (24, 1, CAST(N'2024-06-11T16:43:16.633' AS DateTime), 19, CAST(24000.00 AS Numeric(18, 2)), CAST(77261.00 AS Numeric(18, 2)), N'C', CAST(N'2024-06-11T16:43:16.633' AS DateTime), CAST(N'2024-06-11T16:43:16.633' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (25, 1, CAST(N'2024-06-14T19:54:11.660' AS DateTime), 16, CAST(-5000.00 AS Numeric(18, 2)), CAST(82261.00 AS Numeric(18, 2)), N'G', CAST(N'2024-06-14T19:54:11.720' AS DateTime), CAST(N'2024-06-14T19:54:11.720' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (26, 1, CAST(N'2024-06-14T21:18:00.027' AS DateTime), 17, CAST(10000.00 AS Numeric(18, 2)), CAST(72261.00 AS Numeric(18, 2)), N'G', CAST(N'2024-06-14T21:18:00.193' AS DateTime), CAST(N'2024-06-14T21:18:00.193' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (27, 1, CAST(N'2024-06-14T21:22:02.773' AS DateTime), 18, CAST(-10000.00 AS Numeric(18, 2)), CAST(82261.00 AS Numeric(18, 2)), N'G', CAST(N'2024-06-14T21:22:02.793' AS DateTime), CAST(N'2024-06-14T21:22:02.793' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (28, 1, CAST(N'2024-06-18T16:14:43.367' AS DateTime), 1, CAST(5000.00 AS Numeric(18, 2)), CAST(77261.00 AS Numeric(18, 2)), N'I', CAST(N'2024-06-18T16:14:43.647' AS DateTime), CAST(N'2024-06-18T16:14:43.647' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (29, 1, CAST(N'2024-06-18T16:45:43.443' AS DateTime), 19, CAST(5000.00 AS Numeric(18, 2)), CAST(72261.00 AS Numeric(18, 2)), N'G', CAST(N'2024-06-18T16:45:43.730' AS DateTime), CAST(N'2024-06-18T16:45:43.730' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (30, 1, CAST(N'2024-06-18T16:46:56.227' AS DateTime), 20, CAST(1000.00 AS Numeric(18, 2)), CAST(71261.00 AS Numeric(18, 2)), N'G', CAST(N'2024-06-18T16:46:56.257' AS DateTime), CAST(N'2024-06-18T16:46:56.257' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (31, 1, CAST(N'2024-06-18T16:49:27.873' AS DateTime), 2, CAST(10000.00 AS Numeric(18, 2)), CAST(61261.00 AS Numeric(18, 2)), N'I', CAST(N'2024-06-18T16:49:27.920' AS DateTime), CAST(N'2024-06-18T16:49:27.920' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (32, 1, CAST(N'2024-08-08T14:15:26.773' AS DateTime), 19, CAST(4950.00 AS Numeric(18, 2)), CAST(66211.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-08T14:15:26.777' AS DateTime), CAST(N'2024-08-08T14:15:26.777' AS DateTime), 42)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (33, 1, CAST(N'2024-08-16T18:15:49.173' AS DateTime), 20, CAST(5485.00 AS Numeric(18, 2)), CAST(71696.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:15:49.173' AS DateTime), CAST(N'2024-08-16T18:15:49.173' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (34, 1, CAST(N'2024-08-16T18:16:11.967' AS DateTime), 21, CAST(5485.00 AS Numeric(18, 2)), CAST(77181.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:16:11.967' AS DateTime), CAST(N'2024-08-16T18:16:11.967' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (35, 1, CAST(N'2024-08-16T18:41:14.087' AS DateTime), 22, CAST(4936.50 AS Numeric(18, 2)), CAST(82117.50 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:41:14.087' AS DateTime), CAST(N'2024-08-16T18:41:14.087' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (36, 1, CAST(N'2024-08-16T18:43:32.507' AS DateTime), 23, CAST(4936.50 AS Numeric(18, 2)), CAST(87054.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:43:32.507' AS DateTime), CAST(N'2024-08-16T18:43:32.507' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (37, 1, CAST(N'2024-08-16T18:43:50.993' AS DateTime), 24, CAST(4936.50 AS Numeric(18, 2)), CAST(91990.50 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:43:50.993' AS DateTime), CAST(N'2024-08-16T18:43:50.993' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (38, 1, CAST(N'2024-08-16T18:44:19.297' AS DateTime), 25, CAST(4936.50 AS Numeric(18, 2)), CAST(96927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-16T18:44:19.297' AS DateTime), CAST(N'2024-08-16T18:44:19.297' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (42, 1, CAST(N'2024-08-21T09:55:20.087' AS DateTime), 29, CAST(0.00 AS Numeric(18, 2)), CAST(96927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-21T09:55:20.087' AS DateTime), CAST(N'2024-08-21T09:55:20.090' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (43, 1, CAST(N'2024-08-26T15:39:00.047' AS DateTime), 30, CAST(12000.00 AS Numeric(18, 2)), CAST(108927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-26T15:39:00.047' AS DateTime), CAST(N'2024-08-26T15:39:00.047' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (44, 1, CAST(N'2024-08-26T15:48:21.423' AS DateTime), 31, CAST(29000.00 AS Numeric(18, 2)), CAST(137927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-26T15:48:21.423' AS DateTime), CAST(N'2024-08-26T15:48:21.423' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (45, 1, CAST(N'2024-08-27T14:01:02.803' AS DateTime), 32, CAST(4500.00 AS Numeric(18, 2)), CAST(142427.00 AS Numeric(18, 2)), N'V', CAST(N'2024-08-27T14:01:02.803' AS DateTime), CAST(N'2024-08-27T14:01:02.803' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (46, 1, CAST(N'2024-09-12T11:11:51.347' AS DateTime), 37, CAST(5000.00 AS Numeric(18, 2)), CAST(147427.00 AS Numeric(18, 2)), N'V', CAST(N'2024-09-12T11:11:51.350' AS DateTime), CAST(N'2024-09-12T11:11:51.350' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (47, 1, CAST(N'2024-09-12T12:02:50.743' AS DateTime), 38, CAST(5500.00 AS Numeric(18, 2)), CAST(152927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-09-12T12:02:50.743' AS DateTime), CAST(N'2024-09-12T12:02:50.743' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (48, 1, CAST(N'2024-09-12T12:45:07.233' AS DateTime), 39, CAST(6000.00 AS Numeric(18, 2)), CAST(158927.00 AS Numeric(18, 2)), N'V', CAST(N'2024-09-12T12:45:07.233' AS DateTime), CAST(N'2024-09-12T12:45:07.233' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (49, 1, CAST(N'2024-09-19T18:04:09.590' AS DateTime), 40, CAST(12800.00 AS Numeric(18, 2)), CAST(171727.00 AS Numeric(18, 2)), N'V', CAST(N'2024-09-19T18:04:09.590' AS DateTime), CAST(N'2024-09-19T18:04:09.590' AS DateTime), 43)
GO
INSERT [dbo].[CuentaCorriente] ([IdCtacte], [IdSucursal], [Fecha], [IdMovimiento], [Importe], [SaldoActual], [IdTipoDeMovimiento], [CreatedDate], [ModifiedDate], [IdCierre]) VALUES (50, 1, CAST(N'2024-10-16T11:04:06.887' AS DateTime), 41, CAST(3600.00 AS Numeric(18, 2)), CAST(175327.00 AS Numeric(18, 2)), N'V', CAST(N'2024-10-16T11:04:06.887' AS DateTime), CAST(N'2024-10-16T11:04:06.887' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[CuentaCorriente] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Nombre], [Apellido], [FechaNacimiento], [Direccion], [Telefono], [Email], [Activo], [CreatedDate], [ModifiedDate]) VALUES (3, N'Tomás', N'García del Hoyo', CAST(N'1984-05-14' AS Date), N'Bonifacio 3444', N'11-6268-2772', N'tomasgdh@gmail.com', N'S', CAST(N'2024-07-05T18:08:20.280' AS DateTime), CAST(N'2024-07-05T18:08:20.280' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Gasto] ON 
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (8, 1, CAST(N'2024-06-14T18:56:16.993' AS DateTime), CAST(5000.00 AS Numeric(18, 2)), 1, CAST(N'2024-06-14T18:56:17.020' AS DateTime), CAST(N'2024-06-14T21:13:51.867' AS DateTime), 11, 4, N'COMPRA SUPER2')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (9, 1, CAST(N'2024-06-14T19:16:07.303' AS DateTime), CAST(1000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-14T19:16:07.303' AS DateTime), CAST(N'2024-06-14T19:16:07.443' AS DateTime), 11, 2, N'OTRO GASTO TEST')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (10, 1, CAST(N'2024-06-14T19:18:44.183' AS DateTime), CAST(2000.00 AS Numeric(18, 2)), 1, CAST(N'2024-06-14T19:18:44.183' AS DateTime), CAST(N'2024-06-14T19:18:44.337' AS DateTime), 11, 1, N'TEST 3')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (11, 1, CAST(N'2024-06-14T19:20:29.047' AS DateTime), CAST(254.00 AS Numeric(18, 2)), 4, CAST(N'2024-06-14T19:20:29.047' AS DateTime), CAST(N'2024-06-14T19:20:34.520' AS DateTime), 11, 2, N'TEST4')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (12, 1, CAST(N'2024-06-14T19:25:23.100' AS DateTime), CAST(5000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-14T19:25:23.100' AS DateTime), CAST(N'2024-06-14T19:25:33.650' AS DateTime), 11, 1, N'TEST5 ')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (13, 1, CAST(N'2024-06-14T19:27:32.570' AS DateTime), CAST(1.00 AS Numeric(18, 2)), 4, CAST(N'2024-06-14T19:27:32.570' AS DateTime), CAST(N'2024-06-14T19:27:34.963' AS DateTime), 11, 6, N'TEST6')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (14, 1, CAST(N'2024-06-14T19:31:42.307' AS DateTime), CAST(30000.00 AS Numeric(18, 2)), 1, CAST(N'2024-06-14T19:31:42.307' AS DateTime), CAST(N'2024-06-14T19:31:44.090' AS DateTime), 11, 1, N'TEST7')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (15, 1, CAST(N'2024-06-14T19:34:43.557' AS DateTime), CAST(4251.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-14T19:34:43.557' AS DateTime), CAST(N'2024-06-14T19:34:45.790' AS DateTime), 11, 2, N'TEST8 - SUPER')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (16, 1, CAST(N'2024-06-14T19:54:11.660' AS DateTime), CAST(-5000.00 AS Numeric(18, 2)), 4, CAST(N'2024-06-14T19:54:11.660' AS DateTime), CAST(N'2024-06-14T19:54:11.670' AS DateTime), 11, 1, N'ANULA EL ID 8 COMPRA SUPER')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (17, 1, CAST(N'2024-06-14T21:18:00.027' AS DateTime), CAST(10000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-14T21:18:00.027' AS DateTime), CAST(N'2024-06-14T21:18:00.070' AS DateTime), 11, 1, N'TEST 9')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (18, 1, CAST(N'2024-06-14T21:22:02.773' AS DateTime), CAST(-10000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-14T21:22:02.773' AS DateTime), CAST(N'2024-06-14T21:22:02.780' AS DateTime), 11, 1, N'ANULA MOVIMIENTO 17')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (19, 1, CAST(N'2024-06-18T16:45:43.443' AS DateTime), CAST(5000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-18T16:45:43.447' AS DateTime), CAST(N'2024-06-18T16:45:43.583' AS DateTime), 11, 1, N'TEST - TOMI')
GO
INSERT [dbo].[Gasto] ([IdGasto], [IdSucursal], [Fecha], [Importe], [IdTipoDeGasto], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (20, 1, CAST(N'2024-06-18T16:46:56.227' AS DateTime), CAST(1000.00 AS Numeric(18, 2)), 3, CAST(N'2024-06-18T16:46:56.227' AS DateTime), CAST(N'2024-06-18T16:46:56.230' AS DateTime), 11, 4, N'TEST ADD')
GO
SET IDENTITY_INSERT [dbo].[Gasto] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingreso] ON 
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdSucursal], [Fecha], [Importe], [IdTipoDeIngreso], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (1, 1, CAST(N'2024-06-18T16:14:43.367' AS DateTime), CAST(5000.00 AS Numeric(18, 2)), 1, CAST(N'2024-06-18T16:14:43.367' AS DateTime), CAST(N'2024-06-18T16:14:43.500' AS DateTime), 11, 1, N'TEST')
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdSucursal], [Fecha], [Importe], [IdTipoDeIngreso], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoFormaPago], [Descripcion]) VALUES (2, 1, CAST(N'2024-06-18T16:49:27.873' AS DateTime), CAST(10000.00 AS Numeric(18, 2)), 2, CAST(N'2024-06-18T16:49:27.873' AS DateTime), CAST(N'2024-06-18T16:49:27.883' AS DateTime), 11, 1, N'MAS PLATA EN CAJA DESDE AHORA 30K')
GO
SET IDENTITY_INSERT [dbo].[Ingreso] OFF
GO
INSERT [dbo].[ParamAfip] ([IdSucursal], [PuntoDeVenta], [CuitFactura], [Token], [Sign], [FechaExpiracion], [TokenPadron], [SignPadron], [FechaExpiracionPadron], [TipoFactura], [NombreFantasia], [RazonSocial], [Domicilio], [CondicionFrenteAlIva], [FechaInicioActividades], [UltimoComprobanteAprobado]) VALUES (1, 1, N'27341392174', N'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/Pgo8c3NvIHZlcnNpb249IjIuMCI+CiAgICA8aWQgc3JjPSJDTj13c2FhaG9tbywgTz1BRklQLCBDPUFSLCBTRVJJQUxOVU1CRVI9Q1VJVCAzMzY5MzQ1MDIzOSIgZHN0PSJDTj13c2ZlLCBPPUFGSVAsIEM9QVIiIHVuaXF1ZV9pZD0iMTcyODE4NTM0OSIgZ2VuX3RpbWU9IjE3MjkwODc0MTciIGV4cF90aW1lPSIxNzI5MTMwNjc3Ii8+CiAgICA8b3BlcmF0aW9uIHR5cGU9ImxvZ2luIiB2YWx1ZT0iZ3JhbnRlZCI+CiAgICAgICAgPGxvZ2luIGVudGl0eT0iMzM2OTM0NTAyMzkiIHNlcnZpY2U9IndzZmUiIHVpZD0iU0VSSUFMTlVNQkVSPUNVSVQgMjczNDEzOTIxNzQsIENOPWNlcnRtYXJpYW1jIiBhdXRobWV0aG9kPSJjbXMiIHJlZ21ldGhvZD0iMjIiPgogICAgICAgICAgICA8cmVsYXRpb25zPgogICAgICAgICAgICAgICAgPHJlbGF0aW9uIGtleT0iMjczNDEzOTIxNzQiIHJlbHR5cGU9IjQiLz4KICAgICAgICAgICAgPC9yZWxhdGlvbnM+CiAgICAgICAgPC9sb2dpbj4KICAgIDwvb3BlcmF0aW9uPgo8L3Nzbz4K', N'SK9w1f6/Mvpppxl8z+LZG3YVMLfWem6QWctJOwT881SS+uxRq7TP3sHwxnWRxB9DL6+A8LNWebCdwARscUNOWEkuzEPnm0Tst3XFz1pSMe8cf0wG3uyuMLDEbgFsDG4u+cnf9GKU9seYXlouo91vx+83g52H3KN4WU0ixmTKxBw=', CAST(N'2024-10-16T11:04:37.870' AS DateTime), N'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/Pgo8c3NvIHZlcnNpb249IjIuMCI+CiAgICA8aWQgc3JjPSJDTj13c2FhaG9tbywgTz1BRklQLCBDPUFSLCBTRVJJQUxOVU1CRVI9Q1VJVCAzMzY5MzQ1MDIzOSIgdW5pcXVlX2lkPSIyMDUwODE1OTIxIiBnZW5fdGltZT0iMTcyNzI4NDYyMiIgZXhwX3RpbWU9IjE3MjczMjc4ODIiLz4KICAgIDxvcGVyYXRpb24gdHlwZT0ibG9naW4iIHZhbHVlPSJncmFudGVkIj4KICAgICAgICA8bG9naW4gZW50aXR5PSIzMzY5MzQ1MDIzOSIgc2VydmljZT0id3Nfc3JfcGFkcm9uX2ExMyIgdWlkPSJTRVJJQUxOVU1CRVI9Q1VJVCAyNzM0MTM5MjE3NCwgQ049Y2VydG1hcmlhbWMiIGF1dGhtZXRob2Q9ImNtcyIgcmVnbWV0aG9kPSIyMiI+CiAgICAgICAgICAgIDxyZWxhdGlvbnM+CiAgICAgICAgICAgICAgICA8cmVsYXRpb24ga2V5PSIyNzM0MTM5MjE3NCIgcmVsdHlwZT0iNCIvPgogICAgICAgICAgICA8L3JlbGF0aW9ucz4KICAgICAgICA8L2xvZ2luPgogICAgPC9vcGVyYXRpb24+Cjwvc3NvPgo=', N'P8yMLTW9W+ekcLTWimRAS9SdIFzNT8XYP14elaVvPZDh1wOctvSOKrS4AQdyPfoFsNFU6wDDVKalbUSZrgWAJWC0AGTtK0jee8EY+G2aHm0vA4ONESnT2IearJnSD2/nZHcB9b2gtdeRJW1un23Uf/c+cdtzE+Vz7QqTAS4o1jQ=', CAST(N'2024-09-25T14:18:02.313' AS DateTime), N'C', N'MARIA MODA CIRCULAR', N'Maria Iustina Chequer Charan', N'Camacua 85', N'Monotributista', CAST(N'2020-11-01T00:00:00.000' AS DateTime), 19)
GO
SET IDENTITY_INSERT [dbo].[ProductoEstado] ON 
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (17, 6, 1, CAST(N'2024-05-10T23:57:41.957' AS DateTime), CAST(N'2024-05-13T17:19:11.080' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (18, 7, 1, CAST(N'2024-05-13T14:39:30.333' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (19, 8, 1, CAST(N'2024-05-13T16:35:42.950' AS DateTime), CAST(N'2024-05-30T10:24:14.173' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (20, 6, 5, CAST(N'2024-05-13T17:19:11.083' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (21, 9, 1, CAST(N'2024-05-13T17:29:56.807' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (22, 10, 1, CAST(N'2024-05-13T17:33:56.767' AS DateTime), CAST(N'2024-05-30T17:05:23.987' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (23, 11, 1, CAST(N'2024-05-13T17:36:35.563' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (24, 12, 1, CAST(N'2024-05-13T18:18:20.187' AS DateTime), CAST(N'2024-06-05T12:49:11.070' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (25, 13, 1, CAST(N'2024-05-13T18:22:03.730' AS DateTime), CAST(N'2024-06-05T12:49:11.080' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (26, 14, 1, CAST(N'2024-05-13T18:22:03.747' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (27, 15, 1, CAST(N'2024-05-13T18:22:03.757' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (28, 16, 1, CAST(N'2024-05-13T18:22:03.767' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (29, 17, 1, CAST(N'2024-05-13T18:22:03.773' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (30, 18, 1, CAST(N'2024-05-13T18:22:03.780' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (31, 19, 1, CAST(N'2024-05-13T18:22:03.790' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (32, 20, 1, CAST(N'2024-05-13T18:22:03.797' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (33, 21, 1, CAST(N'2024-05-13T18:22:03.813' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (34, 4, 5, CAST(N'2024-05-16T17:23:22.780' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (35, 2, 5, CAST(N'2024-05-24T10:17:17.180' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (36, 3, 5, CAST(N'2024-05-24T10:18:26.303' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (37, 22, 1, CAST(N'2024-05-27T15:25:54.773' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (38, 23, 1, CAST(N'2024-05-27T15:28:51.343' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (39, 24, 1, CAST(N'2024-05-27T15:28:57.933' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (40, 25, 1, CAST(N'2024-05-27T15:28:59.330' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (41, 26, 1, CAST(N'2024-05-27T15:29:00.340' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (42, 27, 1, CAST(N'2024-05-27T15:29:07.317' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (43, 28, 1, CAST(N'2024-05-27T15:29:07.327' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (44, 29, 1, CAST(N'2024-05-27T15:29:07.333' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (45, 30, 1, CAST(N'2024-05-27T15:29:07.340' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (46, 31, 1, CAST(N'2024-05-27T15:29:31.517' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (47, 32, 1, CAST(N'2024-05-27T15:29:31.523' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (48, 33, 1, CAST(N'2024-05-27T15:29:31.530' AS DateTime), CAST(N'2024-08-08T14:15:26.633' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (49, 34, 1, CAST(N'2024-05-27T15:29:31.537' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (50, 35, 1, CAST(N'2024-05-27T15:29:31.547' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (51, 36, 1, CAST(N'2024-05-27T15:29:31.553' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (52, 37, 1, CAST(N'2024-05-27T15:29:31.560' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (53, 38, 1, CAST(N'2024-05-27T15:29:31.570' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (54, 39, 1, CAST(N'2024-05-28T10:27:37.923' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (55, 40, 1, CAST(N'2024-05-28T10:27:37.940' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (56, 41, 1, CAST(N'2024-05-28T10:27:37.950' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (57, 42, 1, CAST(N'2024-05-28T10:27:37.957' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (58, 43, 1, CAST(N'2024-05-28T10:27:37.963' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (59, 44, 1, CAST(N'2024-05-28T10:27:37.970' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (60, 45, 1, CAST(N'2024-05-28T10:27:37.977' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (61, 46, 1, CAST(N'2024-05-28T10:27:37.983' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (62, 47, 1, CAST(N'2024-05-28T11:40:20.800' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (63, 48, 1, CAST(N'2024-05-28T11:40:20.810' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (64, 49, 1, CAST(N'2024-05-28T11:40:20.820' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (65, 50, 1, CAST(N'2024-05-28T11:40:20.827' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (66, 51, 1, CAST(N'2024-05-28T11:40:20.837' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (67, 52, 1, CAST(N'2024-05-28T11:40:20.847' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (68, 53, 1, CAST(N'2024-05-28T11:40:20.857' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (69, 54, 1, CAST(N'2024-05-28T11:40:20.863' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (70, 55, 1, CAST(N'2024-05-28T11:40:29.747' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (71, 56, 1, CAST(N'2024-05-28T11:40:29.757' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (72, 57, 1, CAST(N'2024-05-28T11:40:29.763' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (73, 58, 1, CAST(N'2024-05-28T11:40:29.770' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (74, 59, 1, CAST(N'2024-05-28T11:40:29.780' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (75, 60, 1, CAST(N'2024-05-28T11:40:29.787' AS DateTime), CAST(N'2024-08-16T18:15:49.080' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (76, 61, 1, CAST(N'2024-05-28T11:40:29.793' AS DateTime), CAST(N'2024-08-21T09:55:19.827' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (77, 62, 1, CAST(N'2024-05-28T11:40:29.803' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (78, 8, 5, CAST(N'2024-05-30T10:24:14.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (79, 10, 5, CAST(N'2024-05-30T17:05:23.987' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (80, 12, 5, CAST(N'2024-06-05T12:49:11.070' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (81, 13, 5, CAST(N'2024-06-05T12:49:11.080' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (82, 63, 1, CAST(N'2024-06-05T12:50:43.857' AS DateTime), CAST(N'2024-08-26T15:38:59.940' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (83, 64, 1, CAST(N'2024-06-05T12:50:43.877' AS DateTime), CAST(N'2024-08-26T15:48:21.337' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (84, 65, 1, CAST(N'2024-06-05T12:52:40.023' AS DateTime), CAST(N'2024-08-27T14:01:02.730' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (85, 66, 1, CAST(N'2024-06-05T12:52:40.033' AS DateTime), CAST(N'2024-09-12T11:11:51.293' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (86, 67, 1, CAST(N'2024-06-05T12:52:40.040' AS DateTime), CAST(N'2024-09-12T12:02:50.683' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (87, 68, 1, CAST(N'2024-06-05T12:52:40.047' AS DateTime), CAST(N'2024-09-12T12:45:07.213' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (88, 69, 1, CAST(N'2024-06-05T12:52:40.053' AS DateTime), CAST(N'2024-09-19T18:04:09.503' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (89, 70, 1, CAST(N'2024-06-05T12:52:40.060' AS DateTime), CAST(N'2024-09-19T18:04:09.500' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (90, 71, 1, CAST(N'2024-06-05T12:52:40.067' AS DateTime), CAST(N'2024-10-16T11:04:06.837' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (91, 72, 1, CAST(N'2024-06-05T12:52:40.077' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (92, 73, 1, CAST(N'2024-06-11T16:41:12.290' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (93, 74, 1, CAST(N'2024-06-11T16:43:16.613' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (94, 33, 5, CAST(N'2024-08-08T14:15:26.633' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (95, 60, 5, CAST(N'2024-08-16T18:15:49.080' AS DateTime), CAST(N'2024-08-16T18:16:11.947' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (96, 60, 5, CAST(N'2024-08-16T18:16:11.947' AS DateTime), CAST(N'2024-08-16T18:41:14.063' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (97, 60, 5, CAST(N'2024-08-16T18:41:14.063' AS DateTime), CAST(N'2024-08-16T18:43:32.483' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (98, 60, 5, CAST(N'2024-08-16T18:43:32.483' AS DateTime), CAST(N'2024-08-16T18:43:50.980' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (99, 60, 5, CAST(N'2024-08-16T18:43:50.980' AS DateTime), CAST(N'2024-08-16T18:44:19.283' AS DateTime), 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (100, 60, 5, CAST(N'2024-08-16T18:44:19.283' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (104, 61, 5, CAST(N'2024-08-21T09:55:19.837' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (105, 63, 5, CAST(N'2024-08-26T15:38:59.943' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (106, 64, 5, CAST(N'2024-08-26T15:48:21.337' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (107, 65, 5, CAST(N'2024-08-27T14:01:02.730' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (112, 66, 5, CAST(N'2024-09-12T11:11:51.293' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (113, 67, 5, CAST(N'2024-09-12T12:02:50.683' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (114, 68, 5, CAST(N'2024-09-12T12:45:07.213' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (115, 70, 5, CAST(N'2024-09-19T18:04:09.500' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (116, 69, 5, CAST(N'2024-09-19T18:04:09.503' AS DateTime), NULL, 11)
GO
INSERT [dbo].[ProductoEstado] ([ID], [IdProducto], [IdEstado], [FechaInicio], [FechaFin], [IdUsuario]) VALUES (117, 71, 5, CAST(N'2024-10-16T11:04:06.840' AS DateTime), NULL, 11)
GO
SET IDENTITY_INSERT [dbo].[ProductoEstado] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (1, 4, N'Test Producto 1', 1, CAST(3500.00 AS Numeric(18, 2)), CAST(12000.00 AS Numeric(18, 2)), CAST(N'2024-04-24T10:20:03.547' AS DateTime), CAST(N'2024-06-11T20:06:47.113' AS DateTime), 11, 1, 5, 34)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (2, 5, N'Test Producto 2', 0, CAST(2500.00 AS Numeric(18, 2)), CAST(10000.00 AS Numeric(18, 2)), CAST(N'2024-04-24T10:20:03.547' AS DateTime), CAST(N'2024-05-24T10:17:17.167' AS DateTime), 11, 2, 4, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (3, 5, N'Test Producto 3', 0, CAST(5000.00 AS Numeric(18, 2)), CAST(13000.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:37:50.827' AS DateTime), CAST(N'2024-05-24T10:18:26.303' AS DateTime), 11, 3, 5, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (4, 5, N'Test Producto 4', 0, CAST(10000.00 AS Numeric(18, 2)), CAST(20000.00 AS Numeric(18, 2)), CAST(N'2024-04-24T11:37:50.827' AS DateTime), CAST(N'2024-05-16T17:23:22.760' AS DateTime), 11, 8, 5, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (6, 5, N'test', 0, CAST(15000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)), CAST(N'2024-05-10T23:57:37.250' AS DateTime), CAST(N'2024-05-13T17:19:11.073' AS DateTime), 11, 7, 3, 24)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (7, 1, N'test', 1, CAST(15000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T14:39:28.320' AS DateTime), CAST(N'2024-05-13T14:39:28.320' AS DateTime), 11, 7, 3, 24)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (8, 5, N'test', 0, CAST(15000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T16:35:41.017' AS DateTime), CAST(N'2024-05-30T10:24:14.160' AS DateTime), 11, 8, 4, 22)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (9, 1, N'Test Pantalon', 1, CAST(15000.00 AS Numeric(18, 2)), CAST(65000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:29:56.787' AS DateTime), CAST(N'2024-06-11T20:07:13.280' AS DateTime), 11, 1, 4, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (10, 5, N'test 10', 0, CAST(9000.00 AS Numeric(18, 2)), CAST(36000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:33:56.750' AS DateTime), CAST(N'2024-05-30T17:05:23.980' AS DateTime), 11, 3, 5, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (11, 1, N'test', 1, CAST(13500.00 AS Numeric(18, 2)), CAST(54000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T17:36:35.547' AS DateTime), CAST(N'2024-06-11T20:07:34.517' AS DateTime), 11, 8, 5, 47)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (12, 5, N'asdasdasd', 0, CAST(15000.00 AS Numeric(18, 2)), CAST(60001.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:18:20.170' AS DateTime), CAST(N'2024-06-05T12:49:11.060' AS DateTime), 11, 4, 3, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (13, 5, N'test', 0, CAST(1500.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.717' AS DateTime), CAST(N'2024-06-05T12:49:11.077' AS DateTime), 11, 4, 1, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (14, 1, N'test', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(12000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.730' AS DateTime), CAST(N'2024-05-13T18:22:03.730' AS DateTime), 11, 8, 2, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (15, 2, N'test', 1, CAST(4500.00 AS Numeric(18, 2)), CAST(22530.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.747' AS DateTime), CAST(N'2024-06-05T12:53:04.423' AS DateTime), 11, 5, 4, 36)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (16, 1, N'test', 1, CAST(6000.00 AS Numeric(18, 2)), CAST(24000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.757' AS DateTime), CAST(N'2024-05-13T18:22:03.757' AS DateTime), 11, 1, 4, 44)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (17, 1, N'test', 1, CAST(7500.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.767' AS DateTime), CAST(N'2024-05-13T18:22:03.767' AS DateTime), 11, 5, 5, 34)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (18, 1, N'test', 1, CAST(9000.00 AS Numeric(18, 2)), CAST(36000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.773' AS DateTime), CAST(N'2024-05-13T18:22:03.773' AS DateTime), 11, 2, 6, 39)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (19, 1, N'test', 1, CAST(10500.00 AS Numeric(18, 2)), CAST(42000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.780' AS DateTime), CAST(N'2024-05-13T18:22:03.780' AS DateTime), 11, 9, 6, 10)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (20, 1, N'test', 1, CAST(12000.00 AS Numeric(18, 2)), CAST(48000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.790' AS DateTime), CAST(N'2024-05-13T18:22:03.790' AS DateTime), 11, 3, 3, 26)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (21, 1, N'test', 1, CAST(22500.00 AS Numeric(18, 2)), CAST(90000.00 AS Numeric(18, 2)), CAST(N'2024-05-13T18:22:03.803' AS DateTime), CAST(N'2024-05-13T18:22:03.803' AS DateTime), 11, 6, 4, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (22, 1, N'hola', 1, CAST(100.00 AS Numeric(18, 2)), CAST(15000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:25:54.067' AS DateTime), CAST(N'2024-06-05T12:08:59.157' AS DateTime), 11, 1, 4, 48)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (23, 1, N'Producto de Prueba 1', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:28:47.033' AS DateTime), CAST(N'2024-05-27T15:28:47.043' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (24, 1, N'Producto de Prueba 2', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:28:57.890' AS DateTime), CAST(N'2024-05-27T15:28:57.890' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (25, 1, N'Producto de Prueba 3', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:28:59.310' AS DateTime), CAST(N'2024-05-27T15:28:59.310' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (26, 1, N'Producto de Prueba 4', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:00.327' AS DateTime), CAST(N'2024-05-27T15:29:00.327' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (27, 1, N'Producto de Prueba 5', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:07.297' AS DateTime), CAST(N'2024-05-27T15:29:07.297' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (28, 1, N'Producto de Prueba 6', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:07.317' AS DateTime), CAST(N'2024-05-27T15:29:07.317' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (29, 1, N'Producto de Prueba 7', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:07.327' AS DateTime), CAST(N'2024-05-27T15:29:07.327' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (30, 1, N'Producto de Prueba 8', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:07.333' AS DateTime), CAST(N'2024-05-27T15:29:07.333' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (31, 1, N'Producto de Prueba 1', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.500' AS DateTime), CAST(N'2024-05-27T15:29:31.500' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (32, 1, N'Producto de Prueba 2', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.517' AS DateTime), CAST(N'2024-05-27T15:29:31.517' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (33, 5, N'Producto de Prueba 3', 0, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.523' AS DateTime), CAST(N'2024-08-08T14:15:26.623' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (34, 1, N'Producto de Prueba 4', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.530' AS DateTime), CAST(N'2024-05-27T15:29:31.530' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (35, 1, N'Producto de Prueba 5', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.540' AS DateTime), CAST(N'2024-05-27T15:29:31.540' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (36, 1, N'Producto de Prueba 6', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.547' AS DateTime), CAST(N'2024-05-27T15:29:31.547' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (37, 1, N'Producto de Prueba 7', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.553' AS DateTime), CAST(N'2024-05-27T15:29:31.553' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (38, 1, N'Producto de Prueba 8', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-05-27T15:29:31.560' AS DateTime), CAST(N'2024-05-27T15:29:31.560' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (39, 1, N'Producto de Prueba 1', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.900' AS DateTime), CAST(N'2024-05-28T10:27:37.900' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (40, 1, N'Producto de Prueba 2', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.923' AS DateTime), CAST(N'2024-05-28T10:27:37.923' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (41, 1, N'Producto de Prueba 3', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.940' AS DateTime), CAST(N'2024-05-28T10:27:37.940' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (42, 1, N'Producto de Prueba 4', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.950' AS DateTime), CAST(N'2024-05-28T10:27:37.950' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (43, 1, N'Producto de Prueba 5', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.957' AS DateTime), CAST(N'2024-05-28T10:27:37.957' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (44, 1, N'Producto de Prueba 6', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.963' AS DateTime), CAST(N'2024-05-28T10:27:37.963' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (45, 1, N'Producto de Prueba 7', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.970' AS DateTime), CAST(N'2024-05-28T10:27:37.970' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (46, 1, N'Producto de Prueba 8', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T10:27:37.977' AS DateTime), CAST(N'2024-05-28T10:27:37.977' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (47, 1, N'Producto de Prueba 1', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.783' AS DateTime), CAST(N'2024-05-28T11:40:20.783' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (48, 1, N'Producto de Prueba 2', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.800' AS DateTime), CAST(N'2024-05-28T11:40:20.800' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (49, 1, N'Producto de Prueba 3', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.810' AS DateTime), CAST(N'2024-05-28T11:40:20.810' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (50, 1, N'Producto de Prueba 4', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.820' AS DateTime), CAST(N'2024-05-28T11:40:20.820' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (51, 1, N'Producto de Prueba 5', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.827' AS DateTime), CAST(N'2024-05-28T11:40:20.827' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (52, 1, N'Producto de Prueba 6', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.837' AS DateTime), CAST(N'2024-05-28T11:40:20.837' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (53, 1, N'Producto de Prueba 7', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.847' AS DateTime), CAST(N'2024-05-28T11:40:20.847' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (54, 1, N'Producto de Prueba 8', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:20.857' AS DateTime), CAST(N'2024-05-28T11:40:20.857' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (55, 1, N'Producto de Prueba 1', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.740' AS DateTime), CAST(N'2024-05-28T11:40:29.740' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (56, 1, N'Producto de Prueba 2', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.747' AS DateTime), CAST(N'2024-05-28T11:40:29.747' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (57, 1, N'Producto de Prueba 3', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.757' AS DateTime), CAST(N'2024-05-28T11:40:29.757' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (58, 1, N'Producto de Prueba 4', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.763' AS DateTime), CAST(N'2024-05-28T11:40:29.763' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (59, 1, N'Producto de Prueba 5', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.770' AS DateTime), CAST(N'2024-05-28T11:40:29.770' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (60, 5, N'Producto de Prueba 6', -5, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.780' AS DateTime), CAST(N'2024-08-16T18:44:19.283' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (61, 5, N'Producto de Prueba 7', 0, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.787' AS DateTime), CAST(N'2024-08-21T09:55:19.753' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (62, 1, N'Producto de Prueba 8', 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-05-28T11:40:29.793' AS DateTime), CAST(N'2024-05-28T11:40:29.793' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (63, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(12000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:50:43.813' AS DateTime), CAST(N'2024-08-26T15:38:59.913' AS DateTime), 11, 4, 4, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (64, 5, NULL, 0, CAST(7500.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:50:43.857' AS DateTime), CAST(N'2024-08-26T15:48:21.327' AS DateTime), 11, 1, 4, 24)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (65, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(4500.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.010' AS DateTime), CAST(N'2024-08-27T14:01:02.723' AS DateTime), 11, 1, 3, 1)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (66, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.023' AS DateTime), CAST(N'2024-09-12T11:11:51.290' AS DateTime), 11, 2, 3, 2)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (67, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(5500.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.033' AS DateTime), CAST(N'2024-09-12T12:02:50.677' AS DateTime), 11, 3, 3, 3)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (68, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(6000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.040' AS DateTime), CAST(N'2024-09-12T12:45:07.210' AS DateTime), 11, 4, 3, 4)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (69, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(6500.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.047' AS DateTime), CAST(N'2024-09-19T18:04:09.503' AS DateTime), 11, 5, 3, 5)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (70, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(7000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.053' AS DateTime), CAST(N'2024-09-19T18:04:09.493' AS DateTime), 11, 6, 3, 6)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (71, 5, NULL, 0, CAST(3000.00 AS Numeric(18, 2)), CAST(7500.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.060' AS DateTime), CAST(N'2024-10-16T11:04:06.807' AS DateTime), 11, 7, 3, 7)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (72, 1, NULL, 1, CAST(3000.00 AS Numeric(18, 2)), CAST(8000.00 AS Numeric(18, 2)), CAST(N'2024-06-05T12:52:40.070' AS DateTime), CAST(N'2024-06-05T12:52:40.070' AS DateTime), 11, 8, 3, 8)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (73, 1, NULL, 1, CAST(6000.00 AS Numeric(18, 2)), CAST(24000.00 AS Numeric(18, 2)), CAST(N'2024-06-11T16:41:12.243' AS DateTime), CAST(N'2024-06-11T16:41:12.243' AS DateTime), 11, 4, 5, 35)
GO
INSERT [dbo].[Productos] ([IdProducto], [IdEstado], [Descripcion], [Stock], [PrecioDeCompra], [PrecioDeVenta], [CreatedDate], [ModifiedDate], [IdUsuario], [IdTipoProducto], [idTipoTalle], [idTipoMarca]) VALUES (74, 1, NULL, 1, CAST(24000.00 AS Numeric(18, 2)), CAST(96000.00 AS Numeric(18, 2)), CAST(N'2024-06-11T16:43:16.587' AS DateTime), CAST(N'2024-06-11T16:43:16.587' AS DateTime), 11, 7, 4, 24)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1, 11, CAST(N'2024-06-24T15:20:21.380' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (2, 11, CAST(N'2024-06-24T15:26:36.467' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (3, 11, CAST(N'2024-06-24T15:34:30.517' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (4, 11, CAST(N'2024-06-24T15:54:07.480' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (5, 11, CAST(N'2024-06-24T15:54:51.933' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (6, 11, CAST(N'2024-06-24T16:04:08.683' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (7, 11, CAST(N'2024-06-24T16:12:03.640' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (8, 11, CAST(N'2024-06-24T16:15:09.577' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (9, 11, CAST(N'2024-06-24T16:21:06.713' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (10, 11, CAST(N'2024-06-24T16:22:17.287' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (11, 11, CAST(N'2024-06-24T16:23:56.310' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (12, 11, CAST(N'2024-06-24T16:25:22.853' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (13, 11, CAST(N'2024-06-24T16:26:22.867' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (14, 11, CAST(N'2024-06-24T16:27:21.373' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (15, 11, CAST(N'2024-06-24T16:28:47.593' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (16, 11, CAST(N'2024-06-24T16:29:54.887' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (17, 11, CAST(N'2024-06-24T16:30:51.127' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (18, 11, CAST(N'2024-06-24T16:33:25.340' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (19, 11, CAST(N'2024-06-25T11:27:04.417' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (20, 11, CAST(N'2024-06-25T16:37:45.167' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (21, 11, CAST(N'2024-06-26T12:03:02.467' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (22, 11, CAST(N'2024-07-03T16:07:58.093' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (23, 11, CAST(N'2024-07-03T16:15:14.847' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (24, 11, CAST(N'2024-07-03T16:18:36.500' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (25, 11, CAST(N'2024-07-04T18:00:57.050' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (26, 11, CAST(N'2024-07-04T18:37:35.993' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (27, 11, CAST(N'2024-07-05T10:08:35.660' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (28, 11, CAST(N'2024-07-05T10:17:33.970' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (29, 11, CAST(N'2024-07-05T10:18:06.807' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (30, 11, CAST(N'2024-07-05T10:19:48.920' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (31, 11, CAST(N'2024-07-05T10:24:11.940' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (32, 11, CAST(N'2024-07-05T10:26:37.190' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (33, 11, CAST(N'2024-07-05T10:41:35.933' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (34, 11, CAST(N'2024-07-05T10:51:27.300' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (35, 11, CAST(N'2024-07-05T10:52:04.570' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (36, 11, CAST(N'2024-07-05T10:52:37.050' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (37, 11, CAST(N'2024-07-05T10:55:26.267' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (38, 11, CAST(N'2024-07-05T13:04:29.653' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (39, 11, CAST(N'2024-07-05T13:07:58.390' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (40, 11, CAST(N'2024-07-05T13:08:20.800' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (41, 11, CAST(N'2024-07-05T13:08:35.207' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (42, 11, CAST(N'2024-07-05T13:09:00.947' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (43, 11, CAST(N'2024-07-05T13:11:03.973' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (44, 11, CAST(N'2024-07-05T13:13:30.327' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (45, 11, CAST(N'2024-07-05T13:18:08.843' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (46, 11, CAST(N'2024-07-05T13:19:14.823' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (47, 11, CAST(N'2024-07-05T13:20:18.523' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (48, 11, CAST(N'2024-07-05T13:20:33.580' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (49, 11, CAST(N'2024-07-05T14:04:25.000' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (50, 11, CAST(N'2024-07-05T14:06:18.347' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (51, 11, CAST(N'2024-07-05T14:08:48.150' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (52, 11, CAST(N'2024-07-05T14:10:18.680' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (53, 11, CAST(N'2024-07-05T14:10:51.460' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (54, 11, CAST(N'2024-07-05T14:14:48.937' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (55, 11, CAST(N'2024-07-05T14:17:08.037' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (56, 11, CAST(N'2024-07-05T14:18:13.000' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (57, 11, CAST(N'2024-07-05T14:24:07.727' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (58, 11, CAST(N'2024-07-05T14:26:44.860' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (59, 11, CAST(N'2024-07-05T14:27:30.047' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (60, 11, CAST(N'2024-07-05T14:34:18.693' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (61, 11, CAST(N'2024-07-05T14:38:14.277' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (62, 11, CAST(N'2024-07-05T15:44:08.450' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (63, 11, CAST(N'2024-07-05T15:46:48.980' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (64, 11, CAST(N'2024-07-05T15:47:31.920' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (65, 11, CAST(N'2024-07-05T15:48:44.400' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (66, 11, CAST(N'2024-07-05T15:50:27.393' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (67, 11, CAST(N'2024-07-05T15:56:32.940' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (68, 11, CAST(N'2024-07-05T15:57:17.597' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (69, 11, CAST(N'2024-07-05T16:00:25.533' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (70, 11, CAST(N'2024-07-05T16:04:03.667' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (71, 11, CAST(N'2024-07-05T16:04:49.883' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (72, 11, CAST(N'2024-07-05T16:08:20.017' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (73, 11, CAST(N'2024-07-05T16:11:56.030' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (74, 11, CAST(N'2024-07-05T16:12:28.810' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (75, 11, CAST(N'2024-07-05T16:20:28.797' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (76, 11, CAST(N'2024-07-05T16:28:41.657' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (77, 11, CAST(N'2024-07-05T16:31:28.233' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (78, 11, CAST(N'2024-07-05T16:31:51.983' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (79, 11, CAST(N'2024-07-05T16:38:22.630' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (80, 11, CAST(N'2024-07-05T16:42:41.303' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (81, 11, CAST(N'2024-07-05T18:21:04.223' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (82, 11, CAST(N'2024-07-05T18:24:39.073' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1081, 11, CAST(N'2024-07-29T11:50:28.993' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1082, 11, CAST(N'2024-07-29T11:54:01.203' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1083, 11, CAST(N'2024-07-30T11:58:40.583' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1084, 11, CAST(N'2024-08-08T14:08:16.930' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1085, 11, CAST(N'2024-08-14T15:46:13.687' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1086, 11, CAST(N'2024-08-15T11:46:43.180' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1087, 11, CAST(N'2024-08-15T11:51:40.097' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1088, 11, CAST(N'2024-08-15T11:51:54.930' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1089, 11, CAST(N'2024-08-15T11:55:00.867' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1090, 11, CAST(N'2024-08-15T11:56:16.217' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1091, 11, CAST(N'2024-08-15T12:09:32.990' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1092, 11, CAST(N'2024-08-15T12:12:13.267' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1093, 11, CAST(N'2024-08-15T12:17:21.617' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1094, 11, CAST(N'2024-08-15T14:27:59.077' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1095, 11, CAST(N'2024-08-15T14:29:14.277' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1096, 11, CAST(N'2024-08-15T14:35:49.563' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1097, 11, CAST(N'2024-08-15T15:31:11.093' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1098, 11, CAST(N'2024-08-15T16:43:11.200' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1099, 11, CAST(N'2024-08-16T10:01:27.287' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1100, 11, CAST(N'2024-08-16T13:29:24.367' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1101, 11, CAST(N'2024-08-26T11:26:48.200' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1102, 11, CAST(N'2024-08-26T15:46:31.013' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1103, 11, CAST(N'2024-09-12T11:07:42.787' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1104, 11, CAST(N'2024-09-12T12:02:10.303' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1105, 11, CAST(N'2024-09-19T18:01:58.740' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1106, 11, CAST(N'2024-09-20T11:14:05.637' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1107, 11, CAST(N'2024-09-20T12:18:56.320' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1108, 11, CAST(N'2024-09-26T11:25:41.553' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1109, 11, CAST(N'2024-09-26T12:38:47.753' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1110, 11, CAST(N'2024-09-26T14:31:13.920' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1111, 11, CAST(N'2024-09-26T14:46:40.057' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1112, 11, CAST(N'2024-09-26T14:48:26.527' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1113, 11, CAST(N'2024-09-26T15:55:57.643' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1114, 11, CAST(N'2024-09-26T16:32:50.560' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1115, 11, CAST(N'2024-09-26T17:34:01.487' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1116, 11, CAST(N'2024-09-26T17:51:30.920' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1117, 11, CAST(N'2024-09-26T18:24:37.563' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1118, 11, CAST(N'2024-09-26T18:48:46.027' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1119, 11, CAST(N'2024-09-26T18:55:11.680' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1120, 11, CAST(N'2024-09-26T19:06:16.353' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1121, 11, CAST(N'2024-09-26T19:09:44.337' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1122, 11, CAST(N'2024-09-26T19:13:37.960' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1123, 11, CAST(N'2024-09-26T19:17:08.703' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1124, 11, CAST(N'2024-09-26T19:22:05.047' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1125, 11, CAST(N'2024-09-26T19:24:54.810' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1126, 11, CAST(N'2024-09-26T19:54:15.553' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1127, 11, CAST(N'2024-09-27T10:04:32.920' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1128, 11, CAST(N'2024-09-27T10:12:19.480' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1129, 11, CAST(N'2024-09-27T10:20:12.183' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1130, 11, CAST(N'2024-09-27T10:24:11.503' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1131, 11, CAST(N'2024-09-27T10:59:48.953' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1132, 11, CAST(N'2024-09-27T11:00:00.083' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1133, 11, CAST(N'2024-09-27T11:00:34.750' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1134, 11, CAST(N'2024-09-27T11:01:02.367' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1135, 11, CAST(N'2024-09-27T11:03:35.980' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1136, 11, CAST(N'2024-09-27T11:07:13.253' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1137, 11, CAST(N'2024-09-27T11:07:58.510' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1138, 11, CAST(N'2024-09-27T11:14:07.583' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1139, 11, CAST(N'2024-09-27T11:18:39.717' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1140, 11, CAST(N'2024-09-27T11:20:55.583' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1141, 11, CAST(N'2024-09-27T11:23:44.727' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1142, 11, CAST(N'2024-09-27T11:29:30.793' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1143, 11, CAST(N'2024-09-27T11:34:02.473' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1144, 11, CAST(N'2024-09-27T11:39:38.607' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1145, 11, CAST(N'2024-09-27T11:50:27.163' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1146, 11, CAST(N'2024-09-27T12:02:35.910' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1147, 11, CAST(N'2024-09-27T12:17:42.240' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1148, 11, CAST(N'2024-09-27T12:24:09.720' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1149, 11, CAST(N'2024-09-27T12:31:22.643' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1150, 11, CAST(N'2024-09-27T12:38:51.213' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1151, 11, CAST(N'2024-09-27T12:50:04.397' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1152, 11, CAST(N'2024-09-27T14:03:50.663' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1153, 11, CAST(N'2024-09-27T14:26:45.773' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1154, 11, CAST(N'2024-09-27T14:50:32.127' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1155, 11, CAST(N'2024-09-27T16:41:00.853' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1156, 11, CAST(N'2024-09-30T10:05:12.210' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1157, 11, CAST(N'2024-09-30T10:25:52.347' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1158, 11, CAST(N'2024-09-30T11:03:01.710' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1159, 11, CAST(N'2024-09-30T11:22:53.417' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1160, 11, CAST(N'2024-09-30T11:51:31.687' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1161, 11, CAST(N'2024-09-30T12:11:22.847' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1162, 11, CAST(N'2024-09-30T12:41:00.217' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1163, 11, CAST(N'2024-09-30T12:58:16.250' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1164, 11, CAST(N'2024-09-30T14:27:33.273' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1165, 11, CAST(N'2024-09-30T15:04:39.280' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1166, 11, CAST(N'2024-09-30T15:33:56.553' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1167, 11, CAST(N'2024-09-30T16:32:51.427' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1168, 11, CAST(N'2024-10-01T14:58:52.170' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1169, 11, CAST(N'2024-10-08T12:34:01.773' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1170, 11, CAST(N'2024-10-09T10:46:13.460' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1171, 11, CAST(N'2024-10-09T12:49:02.883' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1172, 11, CAST(N'2024-10-10T14:57:33.223' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1173, 11, CAST(N'2024-10-14T10:53:16.927' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1174, 11, CAST(N'2024-10-16T09:45:15.407' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1175, 11, CAST(N'2024-10-16T11:00:16.907' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1176, 11, CAST(N'2024-10-17T14:47:11.710' AS DateTime))
GO
INSERT [dbo].[Sessions] ([Id], [IdUsuario], [OpenedAt]) VALUES (1177, 11, CAST(N'2024-10-18T15:47:47.360' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursales] ON 
GO
INSERT [dbo].[Sucursales] ([IdSucursal], [Descripcion], [Direccion], [Telefono], [Activo], [CreatedDate], [ModifiedDate]) VALUES (1, N'Flores - Camacua 85', N'Camacua 85', N'', N'S', CAST(N'2024-04-29T10:22:36.547' AS DateTime), CAST(N'2024-04-29T10:22:36.547' AS DateTime))
GO
INSERT [dbo].[Sucursales] ([IdSucursal], [Descripcion], [Direccion], [Telefono], [Activo], [CreatedDate], [ModifiedDate]) VALUES (2, N'Caballito - Yerbal 898', N'Yerbal 898', N'', N'S', CAST(N'2024-04-29T10:22:36.547' AS DateTime), CAST(N'2024-04-29T10:22:36.547' AS DateTime))
GO
INSERT [dbo].[Sucursales] ([IdSucursal], [Descripcion], [Direccion], [Telefono], [Activo], [CreatedDate], [ModifiedDate]) VALUES (3, N'Sucursal de Testing', N'Direccion testing', N'', N'S', CAST(N'2024-04-29T10:48:18.250' AS DateTime), CAST(N'2024-04-29T10:48:18.250' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
GO
SET IDENTITY_INSERT [dbo].[TablaDeConfiguracion] ON 
GO
INSERT [dbo].[TablaDeConfiguracion] ([IdConfiguracion], [Clave], [IdSucursal], [Descripcion], [ValorString], [ValorBool], [ValorDecimal], [ValorInteger]) VALUES (3, N'EnCaja', 1, N'Indica cuanto Dinero debe quedar en caja', NULL, NULL, CAST(30000.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[TablaDeConfiguracion] ([IdConfiguracion], [Clave], [IdSucursal], [Descripcion], [ValorString], [ValorBool], [ValorDecimal], [ValorInteger]) VALUES (4, N'EnCaja', 2, N'Indica cuanto Dinero debe quedar en caja', NULL, NULL, CAST(20000.00 AS Decimal(18, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[TablaDeConfiguracion] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEstado] ON 
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'INGRESADO', N'S', CAST(N'2024-06-10T10:59:01.460' AS DateTime), CAST(N'2024-06-11T16:11:07.040' AS DateTime), 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'RETIRADO PARA LIMPIAR', N'S', CAST(N'2024-06-10T10:59:14.080' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (3, N'EN STOCK', N'S', CAST(N'2024-06-10T10:59:23.617' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (4, N'PARA LA VENTA', N'S', CAST(N'2024-06-10T10:59:41.143' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (5, N'VENDIDO', N'S', CAST(N'2024-06-10T10:59:44.730' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (6, N'SEÑADO', N'S', CAST(N'2024-06-10T10:59:54.350' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (7, N'EXPIRACION DE SEÑA', N'S', CAST(N'2024-06-10T11:00:04.303' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (8, N'RETIRO EMPLEADAS', N'S', CAST(N'2024-06-10T11:00:20.907' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoEstado] ([IdEstado], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (9, N'ESTADO RESERVADO', N'N', CAST(N'2024-06-11T16:11:30.947' AS DateTime), CAST(N'2024-06-11T16:11:37.397' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[TipoEstado] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoFormasDePago] ON 
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (1, N'EFECTIVO', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), CAST(N'2024-06-11T13:57:34.590' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (2, N'MP - TRANSFERENCIA', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (3, N'MP - QR', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (4, N'MP - DEBITO', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (5, N'MP - CREDITO', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (6, N'CREDITO EN TIENDA', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (7, N'EFECTIVO - 20% OFF', N'N', CAST(N'2024-06-10T16:09:41.600' AS DateTime), CAST(N'2024-06-11T16:39:40.137' AS DateTime), CAST(0.20 AS Numeric(3, 2)), 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (8, N'RESERVADO', N'N', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (9, N'RESERVADO', N'N', CAST(N'2024-06-10T16:09:41.600' AS DateTime), NULL, NULL, 11)
GO
INSERT [dbo].[TipoFormasDePago] ([IdTipoFormaPago], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [Descuento], [IdUsuario]) VALUES (10, N'EFECTIVO - 10% OFF', N'S', CAST(N'2024-06-10T16:09:41.600' AS DateTime), CAST(N'2024-06-11T16:08:27.600' AS DateTime), CAST(0.10 AS Numeric(3, 2)), 11)
GO
SET IDENTITY_INSERT [dbo].[TipoFormasDePago] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMarca] ON 
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'ZARA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), CAST(N'2024-06-10T15:02:54.003' AS DateTime), 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'H&M', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (3, N'FOREVER 21', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (4, N'MANGO', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (5, N'GAP', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (6, N'VICTORIA''S SECRET', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (7, N'NIKE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (8, N'ADIDAS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (9, N'LEVI''S', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (10, N'CALVIN KLEIN', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (11, N'RALPH LAUREN', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (12, N'GUCCI', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (13, N'PRADA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (14, N'VERSACE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (15, N'TOMMY HILFIGER', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (16, N'BURBERRY', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (17, N'CHANEL', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (18, N'LOUIS VUITTON', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (19, N'BALENCIAGA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (20, N'DIOR', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (21, N'FENDI', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (22, N'MICHAEL KORS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (23, N'MARC JACOBS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (24, N'ALEXANDER WANG', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (25, N'STELLA MCCARTNEY', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (26, N'DOLCE & GABBANA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (27, N'COACH', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (28, N'KATE SPADE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (29, N'TORY BURCH', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (30, N'ASOS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (31, N'TOPSHOP', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (32, N'URBAN OUTFITTERS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (33, N'FREE PEOPLE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (34, N'AMERICAN EAGLE OUTFITTERS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (35, N'ABERCROMBIE & FITCH', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (36, N'ANTHROPOLOGIE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (37, N'J.CREW', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (38, N'OLD NAVY', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (39, N'BANANA REPUBLIC', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (40, N'LULULEMON', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (41, N'REFORMATION', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (42, N'MADEWELL', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (43, N'RAG & BONE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (44, N'ALLSAINTS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (45, N'THE NORTH FACE', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (46, N'PATAGONIA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (47, N'COLUMBIA SPORTSWEAR', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (48, N'UNDER ARMOUR', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (49, N'ATHLETA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (50, N'FABLETICS', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
INSERT [dbo].[TipoMarca] ([IdTipoMarca], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (51, N'SIN MARCA', N'S', CAST(N'2024-06-10T14:45:20.173' AS DateTime), NULL, 11)
GO
SET IDENTITY_INSERT [dbo].[TipoMarca] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeGasto] ON 
GO
INSERT [dbo].[TiposDeGasto] ([IdTipoDeGasto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'COMPRA DE LOTE', N'S', CAST(N'2024-06-07T20:08:49.943' AS DateTime), CAST(N'2024-06-11T13:57:15.937' AS DateTime), 11)
GO
INSERT [dbo].[TiposDeGasto] ([IdTipoDeGasto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'GASTOS Y SERVICIOS', N'S', CAST(N'2024-06-08T19:36:02.083' AS DateTime), CAST(N'2024-06-08T19:36:02.107' AS DateTime), 11)
GO
INSERT [dbo].[TiposDeGasto] ([IdTipoDeGasto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (3, N'GASTOS VARIOS', N'S', CAST(N'2024-06-08T20:03:47.130' AS DateTime), CAST(N'2024-06-08T20:03:47.160' AS DateTime), 11)
GO
INSERT [dbo].[TiposDeGasto] ([IdTipoDeGasto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (4, N'COMISION MP', N'S', CAST(N'2024-06-08T20:03:57.330' AS DateTime), CAST(N'2024-06-10T09:58:33.383' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[TiposDeGasto] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeIngreso] ON 
GO
INSERT [dbo].[TiposDeIngreso] ([IdTipoDeIngreso], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'VENTA', N'S', CAST(N'2024-06-10T10:29:10.947' AS DateTime), CAST(N'2024-06-14T12:30:52.663' AS DateTime), 11)
GO
INSERT [dbo].[TiposDeIngreso] ([IdTipoDeIngreso], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'INGRESO A CAJA', N'S', CAST(N'2024-06-10T10:29:22.690' AS DateTime), CAST(N'2024-06-10T10:29:22.730' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[TiposDeIngreso] OFF
GO
INSERT [dbo].[TiposDeMovimiento] ([IdTipoDeMovimiento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate]) VALUES (N'C', N'Compra', N'S', CAST(N'2023-12-01T16:08:25.363' AS DateTime), CAST(N'2023-12-01T16:08:25.363' AS DateTime))
GO
INSERT [dbo].[TiposDeMovimiento] ([IdTipoDeMovimiento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate]) VALUES (N'G', N'Gastos', N'S', CAST(N'2023-12-01T16:08:25.363' AS DateTime), CAST(N'2023-12-01T16:08:25.363' AS DateTime))
GO
INSERT [dbo].[TiposDeMovimiento] ([IdTipoDeMovimiento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate]) VALUES (N'I', N'Ingreso', N'S', CAST(N'2023-12-01T16:08:25.363' AS DateTime), CAST(N'2023-12-01T16:08:25.363' AS DateTime))
GO
INSERT [dbo].[TiposDeMovimiento] ([IdTipoDeMovimiento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate]) VALUES (N'V', N'Venta', N'S', CAST(N'2023-12-01T16:08:25.363' AS DateTime), CAST(N'2023-12-01T16:08:25.363' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] ON 
GO
INSERT [dbo].[TiposDocumento] ([IdTipoDocumento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (1, N'DNI', N'S', CAST(N'2024-06-11T18:11:12.643' AS DateTime), CAST(N'2024-06-11T18:12:49.460' AS DateTime), 11)
GO
INSERT [dbo].[TiposDocumento] ([IdTipoDocumento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (2, N'CUIT/CUIL', N'S', CAST(N'2024-06-11T18:11:24.153' AS DateTime), CAST(N'2024-06-11T18:15:08.847' AS DateTime), 11)
GO
INSERT [dbo].[TiposDocumento] ([IdTipoDocumento], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (3, N'PASAPORTE', N'S', CAST(N'2024-06-11T18:12:39.317' AS DateTime), CAST(N'2024-06-11T18:12:39.320' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposProducto] ON 
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (1, N'PANTALON', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), CAST(N'2024-06-10T15:40:05.363' AS DateTime), 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (2, N'REMERA', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), CAST(N'2024-06-10T15:40:12.280' AS DateTime), 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (3, N'SWEATER', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (4, N'CAMISA', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (5, N'POLLERA', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (6, N'ZAPATO', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), CAST(N'2024-06-10T15:39:40.113' AS DateTime), 11, N'CALZADO')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (7, N'CARTERA', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (8, N'CAMPERA', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (9, N'SACO', N'S', CAST(N'2024-06-10T15:30:29.537' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (10, N'CINTURON', N'S', CAST(N'2024-06-10T15:39:59.220' AS DateTime), CAST(N'2024-06-10T15:39:59.257' AS DateTime), 11, N'ROPA')
GO
INSERT [dbo].[TiposProducto] ([IdTipoProducto], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [Categoria]) VALUES (11, N'ZAPATILLA', N'S', CAST(N'2024-10-14T16:08:04.400' AS DateTime), CAST(N'2024-10-14T16:08:04.400' AS DateTime), 11, N'CALZADO')
GO
SET IDENTITY_INSERT [dbo].[TiposProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTalle] ON 
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (1, N'XXS - EXTRA EXTRA SMALL', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), CAST(N'2024-06-10T15:26:10.727' AS DateTime), 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (2, N'XS - EXTRA SMALL', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), CAST(N'2024-06-10T15:26:17.157' AS DateTime), 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (3, N'S - SMALL', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (4, N'M - MEDIUM', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (5, N'L - LARGE', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (6, N'XL - EXTRA LARGE', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (7, N'XXL - EXTRA EXTRA LARGE', N'S', CAST(N'2024-06-10T15:19:49.877' AS DateTime), NULL, 11, N'ROPA')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (101, N'34 ARG - 22.0 cm - USA 4.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (102, N'35 ARG - 22.5 cm - USA 5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (103, N'36 ARG - 23.0 cm - USA 5.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (104, N'37 ARG - 23.5 cm - USA 6.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (105, N'38 ARG - 24.0 cm - USA 7', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (106, N'39 ARG - 24.5 cm - USA 7.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (107, N'40 ARG - 25.0 cm - USA 8', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (108, N'41 ARG - 25.5 cm - USA 8.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (109, N'42 ARG - 26.0 cm - USA 9', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (110, N'43 ARG - 27.5 cm - USA 10.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (111, N'44 ARG - 28.5 cm - USA 11.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (112, N'45 ARG - 29.0 cm - USA 12', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (113, N'46 ARG - 30.0 cm - USA 13', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (114, N'26 ARG - 16.5 cm - USA 9', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (115, N'27 ARG - 17.0 cm - USA 10', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (116, N'28 ARG - 17.5 cm - USA 10.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (117, N'29 ARG - 18.0 cm - USA 11', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (118, N'30 ARG - 18.5 cm - USA 12', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (119, N'31 ARG - 19.0 cm - USA 12.5', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (120, N'32 ARG - 20.0 cm - USA 13', N'S', NULL, NULL, NULL, N'CALZADO')
GO
INSERT [dbo].[TipoTalle] ([IdTipoTalle], [Descripcion], [Activo], [CreatedDate], [ModifiedDate], [IdUsuario], [categoria]) VALUES (121, N'33 ARG - 21.0 cm - USA 1', N'S', NULL, NULL, NULL, N'CALZADO')
GO
SET IDENTITY_INSERT [dbo].[TipoTalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([IdUsuario], [NombreUsuario], [Contraseña], [IdEmpleado], [Activo], [CreatedDate], [ModifiedDate], [Perfil], [token]) VALUES (11, N'tomasgdh@gmail.com', N'SHA512$1D207FD8A1CC4C79$1200$51574BBA3B22B26813A3AD50587EDEB6B96CB87FAFDE9090D1A3C3C8FAC5EA4B7D210D3DF211829BCB5B033848D2AC5B5413F495D9E68E689A150083D98CA1AC', 3, N's', CAST(N'2024-04-19T18:51:10.463' AS DateTime), CAST(N'2024-04-19T18:51:10.463' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTZWN1cml0eSBUb2tlbiIsImp0aSI6Ijc3ODk4YzIxLTY0NmEtNGVjNi1iZjE2LWQxZjFmNTdhZTIwZSIsInVzZXJJZCI6IjExIiwibm9tYnJlQ29tcGxldG8iOiJUb23DoXMsIEdhcmPDrWEgZGVsIEhveW8iLCJzZXNzaW9uSWQiOiIxMTc3Iiwicm9sZSI6IlsnQScsXSIsImV4cCI6MTcyOTMyMDQ2NywiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1MjU1IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo1MjU1In0.FuB1kvo5O-ytL_CQNO3FlIOu_aYy_uEFC-u0GeqRnvs')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (12, 1, CAST(N'2024-05-13T17:19:11.017' AS DateTime), 5, CAST(60000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-13T17:19:11.017' AS DateTime), CAST(N'2024-05-13T17:19:11.017' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (13, 1, CAST(N'2024-05-16T17:23:22.650' AS DateTime), 5, CAST(19750.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-16T17:23:22.650' AS DateTime), CAST(N'2024-05-16T17:23:22.650' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (14, 1, CAST(N'2024-05-24T10:17:16.967' AS DateTime), 4, CAST(10000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-24T10:17:16.967' AS DateTime), CAST(N'2024-05-24T10:17:16.967' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (15, 1, CAST(N'2024-05-24T10:18:26.290' AS DateTime), 5, CAST(13000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-24T10:18:26.290' AS DateTime), CAST(N'2024-05-24T10:18:26.290' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (16, 1, CAST(N'2024-05-30T10:24:13.913' AS DateTime), 4, CAST(60000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-30T10:24:13.913' AS DateTime), CAST(N'2024-05-30T10:24:13.913' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (17, 1, CAST(N'2024-05-30T17:05:23.960' AS DateTime), 3, CAST(36000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-05-30T17:05:23.960' AS DateTime), CAST(N'2024-05-30T17:05:23.960' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (18, 1, CAST(N'2024-06-05T12:49:10.930' AS DateTime), 4, CAST(63501.00 AS Numeric(18, 2)), NULL, CAST(N'2024-06-05T12:49:10.930' AS DateTime), CAST(N'2024-06-05T12:49:10.933' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (19, 1, CAST(N'2024-08-08T14:15:26.430' AS DateTime), 5, CAST(4950.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-08T14:15:26.430' AS DateTime), CAST(N'2024-08-08T14:15:26.440' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (20, 1, CAST(N'2024-08-16T18:15:48.983' AS DateTime), 4, CAST(7000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:15:48.983' AS DateTime), CAST(N'2024-08-16T18:15:48.983' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (21, 1, CAST(N'2024-08-16T18:16:11.933' AS DateTime), 4, CAST(7000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:16:11.933' AS DateTime), CAST(N'2024-08-16T18:16:11.933' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (22, 1, CAST(N'2024-08-16T18:41:14.043' AS DateTime), 4, CAST(6451.50 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:41:14.043' AS DateTime), CAST(N'2024-08-16T18:41:14.043' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (23, 1, CAST(N'2024-08-16T18:43:32.460' AS DateTime), 4, CAST(6451.50 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:43:32.460' AS DateTime), CAST(N'2024-08-16T18:43:32.460' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (24, 1, CAST(N'2024-08-16T18:43:50.963' AS DateTime), 4, CAST(6451.50 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:43:50.963' AS DateTime), CAST(N'2024-08-16T18:43:50.963' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (25, 1, CAST(N'2024-08-16T18:44:19.270' AS DateTime), 4, CAST(6451.50 AS Numeric(18, 2)), NULL, CAST(N'2024-08-16T18:44:19.270' AS DateTime), CAST(N'2024-08-16T18:44:19.270' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (29, 1, CAST(N'2024-08-21T09:55:19.140' AS DateTime), 1, CAST(7500.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-21T09:55:19.140' AS DateTime), CAST(N'2024-08-21T09:55:19.143' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (30, 1, CAST(N'2024-08-26T15:38:59.710' AS DateTime), 4, CAST(12000.00 AS Numeric(18, 2)), 7, CAST(N'2024-08-26T15:38:59.710' AS DateTime), CAST(N'2024-08-26T15:38:59.713' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (31, 1, CAST(N'2024-08-26T15:48:21.250' AS DateTime), 10, CAST(29000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-26T15:48:21.250' AS DateTime), CAST(N'2024-08-26T15:48:21.250' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (32, 1, CAST(N'2024-08-27T14:01:02.630' AS DateTime), 2, CAST(4500.00 AS Numeric(18, 2)), NULL, CAST(N'2024-08-27T14:01:02.630' AS DateTime), CAST(N'2024-08-27T14:01:02.630' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (37, 1, CAST(N'2024-09-12T11:11:51.280' AS DateTime), 11, CAST(5000.00 AS Numeric(18, 2)), NULL, CAST(N'2024-09-12T11:11:51.280' AS DateTime), CAST(N'2024-09-12T11:11:51.280' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (38, 1, CAST(N'2024-09-12T12:02:50.613' AS DateTime), 11, CAST(5500.00 AS Numeric(18, 2)), 3, CAST(N'2024-09-12T12:02:50.613' AS DateTime), CAST(N'2024-09-12T12:02:50.613' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (39, 1, CAST(N'2024-09-12T12:45:07.187' AS DateTime), 11, CAST(6000.00 AS Numeric(18, 2)), 8, CAST(N'2024-09-12T12:45:07.187' AS DateTime), CAST(N'2024-09-12T12:45:07.187' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (40, 1, CAST(N'2024-09-19T18:04:09.410' AS DateTime), 10, CAST(12800.00 AS Numeric(18, 2)), 2, CAST(N'2024-09-19T18:04:09.410' AS DateTime), CAST(N'2024-09-19T18:04:09.410' AS DateTime), 11)
GO
INSERT [dbo].[Venta] ([IdVenta], [IdSucursal], [FechaVenta], [IdCliente], [TotalDeVenta], [IdComprobante], [CreatedDate], [ModifiedDate], [IdUsuario]) VALUES (41, 1, CAST(N'2024-10-16T11:04:06.760' AS DateTime), 1, CAST(7100.00 AS Numeric(18, 2)), 9, CAST(N'2024-10-16T11:04:06.760' AS DateTime), CAST(N'2024-10-16T11:04:06.760' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (12, 6, 1, CAST(60000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (13, 4, 1, CAST(20000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (14, 2, 1, CAST(10000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (15, 3, 1, CAST(13000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (16, 8, 1, CAST(60000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (17, 10, 1, CAST(36000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (18, 12, 1, CAST(60001.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (18, 13, 1, CAST(6000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (19, 33, 1, CAST(5500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (20, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (21, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (22, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (23, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (24, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (25, 60, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (29, 61, 1, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (30, 63, 1, CAST(12000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (31, 64, 1, CAST(30000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (32, 65, 1, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (37, 66, 1, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (38, 67, 1, CAST(5500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (39, 68, 1, CAST(6000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (40, 69, 1, CAST(6500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (40, 70, 1, CAST(7000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaDetalle] ([IdVenta], [IdProducto], [Cantidad], [Valor]) VALUES (41, 71, 1, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (12, 4, CAST(55000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (12, 6, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (13, 4, CAST(10000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (13, 6, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (13, 10, CAST(2250.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (14, 1, CAST(10000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (15, 1, CAST(13000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (16, 1, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (16, 6, CAST(55000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (17, 1, CAST(36000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (18, 4, CAST(41001.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (18, 10, CAST(22500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (19, 10, CAST(4950.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (20, 1, CAST(5485.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (20, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (21, 1, CAST(5485.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (21, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (22, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (22, 10, CAST(4936.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (23, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (23, 10, CAST(4936.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (24, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (24, 10, CAST(4936.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (25, 6, CAST(1515.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (25, 10, CAST(4936.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (29, 6, CAST(7500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (30, 1, CAST(12000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (31, 4, CAST(20000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (31, 10, CAST(9000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (32, 1, CAST(4500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (37, 1, CAST(5000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (38, 1, CAST(5500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (39, 1, CAST(6000.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (40, 4, CAST(6500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (40, 10, CAST(6300.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (41, 6, CAST(3500.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[VentaFormasDePago] ([IdVenta], [IdTipoFormaPago], [ValorParcial]) VALUES (41, 10, CAST(3600.00 AS Numeric(18, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Usuario]    Script Date: 27/12/2024 16:02:40 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_Usuario] UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CompraDetalle] ADD  DEFAULT ((1)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[Compras] ADD  DEFAULT ((0)) FOR [TotalDeCompra]
GO
ALTER TABLE [dbo].[Compras] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Compras] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_Compras_TotalCreditoEnTienda]  DEFAULT ((0)) FOR [TotalCreditoEnTienda]
GO
ALTER TABLE [dbo].[ComprasFormasDePago] ADD  DEFAULT ((0)) FOR [Valor]
GO
ALTER TABLE [dbo].[Comprobante] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CuentaCorriente] ADD  DEFAULT ((0)) FOR [Importe]
GO
ALTER TABLE [dbo].[CuentaCorriente] ADD  DEFAULT ((0)) FOR [SaldoActual]
GO
ALTER TABLE [dbo].[CuentaCorriente] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CuentaCorriente] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Gasto] ADD  DEFAULT ((0)) FOR [Importe]
GO
ALTER TABLE [dbo].[Gasto] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Gasto] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Ingreso] ADD  DEFAULT ((0)) FOR [Importe]
GO
ALTER TABLE [dbo].[Ingreso] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Ingreso] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('C') FOR [TipoFactura]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('MARIA MODA CIRCULAR') FOR [NombreFantasia]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('Maria Iustina Chequer Charan') FOR [RazonSocial]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('Camacua 85') FOR [Domicilio]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('Monotributista') FOR [CondicionFrenteAlIva]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ('2020-11-01') FOR [FechaInicioActividades]
GO
ALTER TABLE [dbo].[ParamAfip] ADD  DEFAULT ((0)) FOR [UltimoComprobanteAprobado]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [PrecioDeCompra]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [PrecioDeVenta]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Sucursales] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[Sucursales] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Sucursales] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TipoFormasDePago] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TipoFormasDePago] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TipoFormasDePago] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TipoMarca] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TipoMarca] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TipoMarca] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TiposDeGasto] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TiposDeGasto] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TiposDeGasto] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TiposDeIngreso] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TiposDeIngreso] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TiposDeIngreso] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TiposDeMovimiento] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TiposDeMovimiento] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TiposDeMovimiento] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TiposDocumento] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TiposDocumento] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TiposDocumento] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[TiposProducto] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[TiposProducto] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TiposProducto] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('S') FOR [Activo]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT ((0)) FOR [TotalDeVenta]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[VentaDetalle] ADD  DEFAULT ((1)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[VentaDetalle] ADD  DEFAULT ((0)) FOR [Valor]
GO
ALTER TABLE [dbo].[VentaFormasDePago] ADD  DEFAULT ((0)) FOR [ValorParcial]
GO
ALTER TABLE [dbo].[CierreDeCaja]  WITH CHECK ADD  CONSTRAINT [FK_CierreDeCaja_Sucursales] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[CierreDeCaja] CHECK CONSTRAINT [FK_CierreDeCaja_Sucursales]
GO
ALTER TABLE [dbo].[CierreDeCaja]  WITH CHECK ADD  CONSTRAINT [FK_CierreDeCaja_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[CierreDeCaja] CHECK CONSTRAINT [FK_CierreDeCaja_Usuarios]
GO
ALTER TABLE [dbo].[CierreDeCajaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CierreDeCaja_CierreDeCajaDetalle] FOREIGN KEY([IdCierre])
REFERENCES [dbo].[CierreDeCaja] ([IdCierre])
GO
ALTER TABLE [dbo].[CierreDeCajaDetalle] CHECK CONSTRAINT [FK_CierreDeCaja_CierreDeCajaDetalle]
GO
ALTER TABLE [dbo].[CierreDeCajaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CierreDeCajaDetalle_TipoFormasDePago] FOREIGN KEY([IdTipoFormaPago])
REFERENCES [dbo].[TipoFormasDePago] ([IdTipoFormaPago])
GO
ALTER TABLE [dbo].[CierreDeCajaDetalle] CHECK CONSTRAINT [FK_CierreDeCajaDetalle_TipoFormasDePago]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([IdCompra])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ComprasFormasDePago]  WITH CHECK ADD  CONSTRAINT [FK_Compras_CompraFormaPago] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([IdCompra])
GO
ALTER TABLE [dbo].[ComprasFormasDePago] CHECK CONSTRAINT [FK_Compras_CompraFormaPago]
GO
ALTER TABLE [dbo].[ComprasFormasDePago]  WITH CHECK ADD  CONSTRAINT [FK_Compras_TipoFormaPago] FOREIGN KEY([IdTipoFormaPago])
REFERENCES [dbo].[TipoFormasDePago] ([IdTipoFormaPago])
GO
ALTER TABLE [dbo].[ComprasFormasDePago] CHECK CONSTRAINT [FK_Compras_TipoFormaPago]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Sucursal]
GO
ALTER TABLE [dbo].[Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Comprobante_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Comprobante] CHECK CONSTRAINT [FK_Comprobante_Usuario]
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD FOREIGN KEY([IdTipoDeMovimiento])
REFERENCES [dbo].[TiposDeMovimiento] ([IdTipoDeMovimiento])
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD  CONSTRAINT [FK_CuentaCorriente_CierreDeCaja] FOREIGN KEY([IdCierre])
REFERENCES [dbo].[CierreDeCaja] ([IdCierre])
GO
ALTER TABLE [dbo].[CuentaCorriente] CHECK CONSTRAINT [FK_CuentaCorriente_CierreDeCaja]
GO
ALTER TABLE [dbo].[Gasto]  WITH CHECK ADD  CONSTRAINT [FK_Gasto_FormaPago] FOREIGN KEY([IdTipoFormaPago])
REFERENCES [dbo].[TipoFormasDePago] ([IdTipoFormaPago])
GO
ALTER TABLE [dbo].[Gasto] CHECK CONSTRAINT [FK_Gasto_FormaPago]
GO
ALTER TABLE [dbo].[Gasto]  WITH CHECK ADD  CONSTRAINT [FK_Gasto_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Gasto] CHECK CONSTRAINT [FK_Gasto_Sucursal]
GO
ALTER TABLE [dbo].[Gasto]  WITH CHECK ADD  CONSTRAINT [FK_Gasto_TipoDeGasto] FOREIGN KEY([IdTipoDeGasto])
REFERENCES [dbo].[TiposDeGasto] ([IdTipoDeGasto])
GO
ALTER TABLE [dbo].[Gasto] CHECK CONSTRAINT [FK_Gasto_TipoDeGasto]
GO
ALTER TABLE [dbo].[Gasto]  WITH CHECK ADD  CONSTRAINT [FK_Gasto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Gasto] CHECK CONSTRAINT [FK_Gasto_Usuario]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_FormaPago] FOREIGN KEY([IdTipoFormaPago])
REFERENCES [dbo].[TipoFormasDePago] ([IdTipoFormaPago])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_FormaPago]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Sucursal]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_TipoDeIngreso] FOREIGN KEY([IdTipoDeIngreso])
REFERENCES [dbo].[TiposDeIngreso] ([IdTipoDeIngreso])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_TipoDeIngreso]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Usuario]
GO
ALTER TABLE [dbo].[ProductoEstado]  WITH CHECK ADD  CONSTRAINT [FK_EstadoP_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[TipoEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[ProductoEstado] CHECK CONSTRAINT [FK_EstadoP_Estado]
GO
ALTER TABLE [dbo].[ProductoEstado]  WITH CHECK ADD  CONSTRAINT [FK_EstadoP_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[ProductoEstado] CHECK CONSTRAINT [FK_EstadoP_Producto]
GO
ALTER TABLE [dbo].[ProductoEstado]  WITH CHECK ADD  CONSTRAINT [FK_EstadoP_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProductoEstado] CHECK CONSTRAINT [FK_EstadoP_Usuario]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[TipoEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Producto_Estado]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoMarca] FOREIGN KEY([idTipoMarca])
REFERENCES [dbo].[TipoMarca] ([IdTipoMarca])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Producto_TipoMarca]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TiposProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TiposProducto] ([IdTipoProducto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Producto_TiposProducto]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoTalle] FOREIGN KEY([idTipoTalle])
REFERENCES [dbo].[TipoTalle] ([IdTipoTalle])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Producto_TipoTalle]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Producto_Usuario]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TablaDeConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_Configuracion_Sucursales] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[TablaDeConfiguracion] CHECK CONSTRAINT [FK_Configuracion_Sucursales]
GO
ALTER TABLE [dbo].[TipoEstado]  WITH CHECK ADD  CONSTRAINT [FK_TipoEstado_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TipoEstado] CHECK CONSTRAINT [FK_TipoEstado_Usuario]
GO
ALTER TABLE [dbo].[TipoFormasDePago]  WITH CHECK ADD  CONSTRAINT [FK_TipoFormasDePago_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TipoFormasDePago] CHECK CONSTRAINT [FK_TipoFormasDePago_Usuario]
GO
ALTER TABLE [dbo].[TipoMarca]  WITH CHECK ADD  CONSTRAINT [FK_TipoMarca_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TipoMarca] CHECK CONSTRAINT [FK_TipoMarca_Usuario]
GO
ALTER TABLE [dbo].[TiposDeGasto]  WITH CHECK ADD  CONSTRAINT [FK_TiposDeGasto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiposDeGasto] CHECK CONSTRAINT [FK_TiposDeGasto_Usuario]
GO
ALTER TABLE [dbo].[TiposDeIngreso]  WITH CHECK ADD  CONSTRAINT [FK_TiposDeIngreso_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiposDeIngreso] CHECK CONSTRAINT [FK_TiposDeIngreso_Usuario]
GO
ALTER TABLE [dbo].[TiposDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TipoDocumento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiposDocumento] CHECK CONSTRAINT [FK_TipoDocumento_Usuario]
GO
ALTER TABLE [dbo].[TiposProducto]  WITH CHECK ADD  CONSTRAINT [FK_TiposProducto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiposProducto] CHECK CONSTRAINT [FK_TiposProducto_Usuario]
GO
ALTER TABLE [dbo].[TipoTalle]  WITH CHECK ADD  CONSTRAINT [FK_TipoTalle_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[TipoTalle] CHECK CONSTRAINT [FK_TipoTalle_Usuario]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursales] ([IdSucursal])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Sucursal]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Usuario]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaFormasDePago]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[VentaFormasDePago]  WITH CHECK ADD  CONSTRAINT [FK_VentaFormasDePago_TipoFormasDePago] FOREIGN KEY([IdTipoFormaPago])
REFERENCES [dbo].[TipoFormasDePago] ([IdTipoFormaPago])
GO
ALTER TABLE [dbo].[VentaFormasDePago] CHECK CONSTRAINT [FK_VentaFormasDePago_TipoFormasDePago]
GO
ALTER TABLE [dbo].[CuentaCorriente]  WITH CHECK ADD CHECK  (([IdTipoDeMovimiento]='I' OR [IdTipoDeMovimiento]='G' OR [IdTipoDeMovimiento]='V' OR [IdTipoDeMovimiento]='C'))
GO
USE [master]
GO
ALTER DATABASE [Maria_MC] SET  READ_WRITE 
GO
