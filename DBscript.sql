USE [E:\PROJECTS\TRADINGSOLUTIONS\TRADINGBLL\TRADING.MDF]
GO
/****** Object:  Table [dbo].[IncomeStatement]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeStatement](
	[Type] [nvarchar](50) NULL,
	[AccountId] [nvarchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[value] [float] NULL,
	[NetProfit] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FiscalYear]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiscalYear](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[f_from] [date] NULL,
	[f_to] [date] NULL,
	[e_date] [date] NULL,
 CONSTRAINT [PK_FiscalYear] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnerEquity]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerEquity](
	[OldCapital] [float] NULL,
	[newcapital] [float] NULL,
	[netincome] [float] NULL,
	[ow] [float] NULL,
	[finalcapital] [float] NULL,
	[fromDate] [date] NULL,
	[toDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ledgers]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledgers](
	[type] [nvarchar](50) NOT NULL,
	[e_date] [date] NULL,
 CONSTRAINT [PK_Ledgers] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceSheet]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceSheet](
	[ACCOUNTID] [nvarchar](50) NULL,
	[ACCOUNTNAME] [nvarchar](50) NULL,
	[ACCOUNTTOTAL] [float] NULL,
	[TYPE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrialBalance]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrialBalance](
	[AccountId] [nvarchar](50) NULL,
	[AccountName] [nvarchar](max) NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ShowLedgers]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowLedgers]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	select type from ledgers
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ShowFiscalYear]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowFiscalYear]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	select * from fiscalyear
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateFiscalYearOnlogin]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFiscalYearOnlogin]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@to date
AS
	/* SET NOCOUNT ON */
	Declare @id int

	select @id = max(id) from fiscalyear

	

	update fiscalYear

	set f_to = @to
	where
	(id = @id)

	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[InsertFiscalYear]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFiscalYear]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@from_n date,
	@to_n date,
	@to date
AS
	/* SET NOCOUNT ON */

	declare @id int

	select @id = max(id) from fiscalyear

	update fiscalyear

	set f_to = @to

	where
	(id =@id)

	insert into fiscalyear
	values
	(@from_n,@to_n,@from_n)
	RETURN
GO
/****** Object:  Table [dbo].[ChartOfAccounts]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChartOfAccounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[type] [nvarchar](50) NULL,
	[e_date] [date] NULL,
 CONSTRAINT [PK_CharOfAccounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteChartOfAccounts]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteChartOfAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@id int
AS
	/* SET NOCOUNT ON */
	delete from
	chartofaccounts
	where
	(id = @id)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetAccountId]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountId]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@type nvarchar(50)
AS
	/* SET NOCOUNT ON */
	Declare @numGet nvarchar(50),@numTake int

	
	select @numGet = num from chartofaccounts
	where
	(type = @type)

	set @numTake = max(cast(substring(@numget,2,10) as int))

	set @numtake = @numTake+1
	
	select @numtake

	RETURN
GO
/****** Object:  Table [dbo].[Postings]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[acc_num] [nvarchar](50) NULL,
	[type] [nvarchar](max) NULL,
	[amount] [float] NULL,
	[e_date] [date] NULL,
 CONSTRAINT [PK_Postings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertChartOfAccounts]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertChartOfAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@num nvarchar(50),
	@name nvarchar(50),
	@type nvarchar(50),
	@e_date date

AS
	/* SET NOCOUNT ON */
	INSERT INTO ChartOfAccounts
                         (num, name, type, e_date)
VALUES        (@num,@name,@type,@e_date)
	RETURN
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 07/05/2013 20:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[amount] [float] NULL,
	[des] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[e_date] [date] NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CheckNameOfChartOfAccounts]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckNameOfChartOfAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@name nvarchar(50)
AS
	/* SET NOCOUNT ON */
	select name from 
	chartofaccounts
	where
	(name = @name)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ShowChartOfAccounts]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowChartOfAccounts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	SELECT      id as'ID',  num AS 'ACCOUNT ID', name AS 'NAME', type AS 'TYPE', e_date AS 'OPENING DATE'
FROM            ChartOfAccounts
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ReportOwnerEquity]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportOwnerEquity]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@FROM DATE,
	@TO DATE

AS
	/* SET NOCOUNT ON */
	DELETE FROM OWNEREQUITY

	DECLARE  @TOTALCAPITAL FLOAT = 0, @TOTALWITHDRAWL FLOAT = 0, @TOTALREVENUE FLOAT = 0, @TOTALEXPENSE FLOAT = 0, @OLDNETPROFIT FLOAT = 0
	,@NEWCAPITAL FLOAT = 0, @NEWREVENUE FLOAT = 0, @NEWEXPENSE FLOAT = 0, @NEWNETPROFIT FLOAT = 0, @WITHDRAWL FLOAT = 0

	--GETTING OLD CAPITAL
	SELECT @TOTALCAPITAL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'CREDIT' AND E_DATE < @FROM)
		IF(@TOTALCAPITAL IS NULL)
		BEGIN
		SET @TOTALCAPITAL = 0
		END
		PRINT 'OLD CAPITAL'
		PRINT @TOTALCAPITAL

	--GETTING OLD WITHDRAWL
	SELECT @TOTALWITHDRAWL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'DEBIT' AND E_DATE <= @FROM)
		IF(@TOTALWITHDRAWL IS NULL)
			BEGIN
			SET @TOTALWITHDRAWL = 0
			END
			PRINT 'OLD WITHDRAWL'
		PRINT @TOTALWITHDRAWL
	
	--GETTING TOTAL REVENUE
	SELECT @TOTALREVENUE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '5%' AND TYPE = 'CREDIT' AND E_DATE <= @FROM)
		IF(@TOTALREVENUE IS NULL)
			BEGIN
			SET @TOTALREVENUE = 0
			END
		PRINT 'OLD REVENUE'
		PRINT @TOTALREVENUE

		--GETTING TOTAL REVENUE
	SELECT @TOTALEXPENSE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '3%' AND TYPE = 'DEBIT' AND E_DATE <= @FROM)
		IF(@TOTALEXPENSE IS NULL)
			BEGIN
			SET @TOTALEXPENSE = 0
			END
		PRINT 'OLD EXPENSE'
		PRINT @TOTALEXPENSE


		SET @OLDNETPROFIT = @TOTALREVENUE - @TOTALEXPENSE

		PRINT 'OLD NET PROFIT'
		IF(@OLDNETPROFIT IS NULL)
			BEGIN
			SET @OLDNETPROFIT = 0
			END
		PRINT @OLDNETPROFIT
		
		SET @NEWCAPITAL = @TOTALCAPITAL + (@OLDNETPROFIT) - (@TOTALWITHDRAWL )
		PRINT 'NEW CAPITAL'
		PRINT @NEWCAPITAL


		-- CALCULATING NEW OWNER EQUITY

		DECLARE @NEWOC FLOAT

		--GETTING NEW CAPITAL
		SELECT @NEWOC = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'CREDIT' AND E_DATE BETWEEN @FROM AND @TO)

		--GETTING NEW REVENUE
		SELECT @NEWREVENUE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '5%' AND TYPE = 'CREDIT' AND E_DATE BETWEEN @FROM AND @TO)
		IF(@NEWREVENUE IS NULL)
			BEGIN
			SET @NEWREVENUE = 0
			END
		PRINT 'NEW REVENUE'
		PRINT @NEWREVENUE

		--GETTING NEW EXPENSE
		
		SELECT @NEWEXPENSE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '3%' AND TYPE = 'DEBIT' AND E_DATE BETWEEN @FROM AND @TO)
		IF(@NEWEXPENSE IS NULL)
			BEGIN
			SET @NEWEXPENSE = 0
			END
		PRINT 'NEW EXPENSE'
		PRINT @NEWEXPENSE

		--SETTING NEW INCOME
		SET @NEWNETPROFIT = @NEWREVENUE - @NEWEXPENSE
		PRINT 'NEW NET PROFIT'
		PRINT @NEWNETPROFIT

		--GETTING WITHDRAWL
		SELECT @WITHDRAWL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'DEBIT' AND E_DATE BETWEEN @FROM AND @TO)
		PRINT 'NEW WITHDRAWL'
		IF(@WITHDRAWL IS NULL)
			BEGIN
			SET @WITHDRAWL = 0
			END

		PRINT @WITHDRAWL

		DECLARE @FINALCAPITAL FLOAT

		SET @FINALCAPITAL = (( @NEWNETPROFIT) - @WITHDRAWL) + @NEWOC

		PRINT 'FINAL POSITION OF CAPITAL'
		PRINT @FINALCAPITAL

		

		INSERT INTO OWNEREQUITY
		VALUES
		(@NEWCAPITAL,@NEWOC,@NEWNETPROFIT,@WITHDRAWL,@FINALCAPITAL,@FROM,@TO)

		SELECT * FROM OWNEREQUITY
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ReportIncomeStatement]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportIncomeStatement]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@FROM DATE,
	@TO DATE
AS
	/* SET NOCOUNT ON */
	DELETE FROM INCOMESTATEMENT

	DECLARE @I INT, @MAXID INT, @ACCIDR INT,@ACCIDE INT,@ACCNAME NVARCHAR(50), @ACCNUM NVARCHAR(50),@TOTALREVENUE FLOAT, @TOTALEXPENSE FLOAT
		
		SET @I = 1;

		SELECT @MAXID = MAX(ID) FROM CHARTOFACCOUNTS

		WHILE(@I<=@MAXID)
		BEGIN
			SET @TOTALREVENUE = 0
			SET @ACCIDR = NULL
			SET @ACCNAME = NULL

			SELECT @ACCIDR = NUM, @ACCNAME = NAME FROM CHARTOFACCOUNTS
				WHERE(ID = @I AND (NUM LIKE '5%'))

			
			IF(@ACCIDR IS NOT NULL)
				BEGIN
			SELECT @TOTALREVENUE = SUM(AMOUNT) FROM POSTINGS
				WHERE(ACC_NUM = @ACCIDR AND TYPE = 'CREDIT' AND (E_DATE BETWEEN @FROM AND @TO))

				PRINT 'ACCOUNT ID'
				PRINT @ACCIDR
				PRINT 'TOTAL REVENUE'
				PRINT @TOTALREVENUE
				PRINT 'ACCOUNT NAME'
				PRINT @ACCNAME

				INSERT INTO INCOMESTATEMENT (Type,AccountId,AccountName,value)
					VALUES('REVENUE',@ACCIDR,@ACCNAME,@TOTALREVENUE)

				END		

			SET @I = @I +1;
		END

	SET @I = 0
	SET @MAXID = 0
		
		SET @I = 1;

		SELECT @MAXID = MAX(ID) FROM CHARTOFACCOUNTS

		WHILE(@I<=@MAXID)
		BEGIN
			SET @TOTALEXPENSE = 0
			SET @ACCIDE = NULL
			SET @ACCNAME = NULL

			SELECT @ACCIDE = NUM, @ACCNAME = NAME FROM CHARTOFACCOUNTS
				WHERE(ID = @I AND (NUM LIKE '3%'))

			
			IF(@ACCIDE IS NOT NULL)
				BEGIN
			SELECT @TOTALEXPENSE = SUM(AMOUNT) FROM POSTINGS
				WHERE(ACC_NUM = @ACCIDE AND TYPE = 'DEBIT' AND (E_DATE BETWEEN @FROM AND @TO))

				PRINT 'ACCOUNT ID'
				PRINT @ACCIDE
				PRINT 'ACCOUNT NAME'
				PRINT @ACCNAME
				PRINT 'TOTAL EXPENSE'
				PRINT @TOTALEXPENSE

				INSERT INTO INCOMESTATEMENT (Type,AccountId,AccountName,value)
					VALUES('EXPENSE',@ACCIDE,@ACCNAME,@TOTALEXPENSE)

				END		

			SET @I = @I +1;
		END

DECLARE @GETREVENUE FLOAT, @GETEXPENSE FLOAT, @NETPROFIT FLOAT

		SELECT @GETREVENUE = SUM(VALUE) FROM INCOMESTATEMENT
			WHERE(TYPE = 'REVENUE')


			PRINT 'ALL REVENUE'
			PRINT @GETREVENUE

		SELECT @GETEXPENSE = SUM(VALUE) FROM INCOMESTATEMENT
			WHERE(TYPE = 'EXPENSE')

			PRINT 'ALL EXPENSE'

			PRINT @GETEXPENSE

			SET @NETPROFIT = @GETREVENUE - @GETEXPENSE

			
			INSERT INTO INCOMESTATEMENT (NETPROFIT)
			VALUES(@NETPROFIT)
		SELECT * FROM INCOMESTATEMENT
		
		 
		 

		

		

	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[ReportGeneralJournal]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportGeneralJournal]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@from date,
	@to date
AS
	/* SET NOCOUNT ON */
	SELECT        ChartOfAccounts.type, Journal.e_date, ChartOfAccounts.num, ChartOfAccounts.name, Journal.des, Journal.type AS Expr1, Journal.amount
FROM            Journal INNER JOIN
                         ChartOfAccounts ON Journal.acc_id = ChartOfAccounts.id
						 where
						 (journal.e_date between @from and @to)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ReportBalanceSheet]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportBalanceSheet]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@FROM DATE,
	@TO DATE
AS
	/* SET NOCOUNT ON */
	DELETE FROM OWNEREQUITY

	DECLARE  @TOTALCAPITAL FLOAT = 0, @TOTALWITHDRAWL FLOAT = 0, @TOTALREVENUE FLOAT = 0, @TOTALEXPENSE FLOAT = 0, @OLDNETPROFIT FLOAT = 0
	,@NEWCAPITAL FLOAT = 0, @NEWREVENUE FLOAT = 0, @NEWEXPENSE FLOAT = 0, @NEWNETPROFIT FLOAT = 0, @WITHDRAWL FLOAT = 0

	--GETTING OLD CAPITAL
	SELECT @TOTALCAPITAL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'CREDIT' AND E_DATE < @FROM)
		IF(@TOTALCAPITAL IS NULL)
		BEGIN
		SET @TOTALCAPITAL = 0
		END
		PRINT 'OLD CAPITAL'
		PRINT @TOTALCAPITAL

	--GETTING OLD WITHDRAWL
	SELECT @TOTALWITHDRAWL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'DEBIT' AND E_DATE <= @FROM)
		IF(@TOTALWITHDRAWL IS NULL)
			BEGIN
			SET @TOTALWITHDRAWL = 0
			END
			PRINT 'OLD WITHDRAWL'
		PRINT @TOTALWITHDRAWL
	
	--GETTING TOTAL REVENUE
	SELECT @TOTALREVENUE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '5%' AND TYPE = 'CREDIT' AND E_DATE <= @FROM)
		IF(@TOTALREVENUE IS NULL)
			BEGIN
			SET @TOTALREVENUE = 0
			END
		PRINT 'OLD REVENUE'
		PRINT @TOTALREVENUE

		--GETTING TOTAL REVENUE
	SELECT @TOTALEXPENSE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '3%' AND TYPE = 'DEBIT' AND E_DATE <= @FROM)
		IF(@TOTALEXPENSE IS NULL)
			BEGIN
			SET @TOTALEXPENSE = 0
			END
		PRINT 'OLD EXPENSE'
		PRINT @TOTALEXPENSE


		SET @OLDNETPROFIT = @TOTALREVENUE - @TOTALEXPENSE

		PRINT 'OLD NET PROFIT'
		IF(@OLDNETPROFIT IS NULL)
			BEGIN
			SET @OLDNETPROFIT = 0
			END
		PRINT @OLDNETPROFIT
		
		SET @NEWCAPITAL = @TOTALCAPITAL + (@OLDNETPROFIT) - (@TOTALWITHDRAWL )
		PRINT 'NEW CAPITAL'
		PRINT @NEWCAPITAL


		-- CALCULATING NEW OWNER EQUITY

		DECLARE @NEWOC FLOAT

		--GETTING NEW CAPITAL
		SELECT @NEWOC = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'CREDIT' AND E_DATE BETWEEN @FROM AND @TO)

		--GETTING NEW REVENUE
		SELECT @NEWREVENUE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '5%' AND TYPE = 'CREDIT' AND E_DATE BETWEEN @FROM AND @TO)
		IF(@NEWREVENUE IS NULL)
			BEGIN
			SET @NEWREVENUE = 0
			END
		PRINT 'NEW REVENUE'
		PRINT @NEWREVENUE

		--GETTING NEW EXPENSE
		
		SELECT @NEWEXPENSE = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '3%' AND TYPE = 'DEBIT' AND E_DATE BETWEEN @FROM AND @TO)
		IF(@NEWEXPENSE IS NULL)
			BEGIN
			SET @NEWEXPENSE = 0
			END
		PRINT 'NEW EXPENSE'
		PRINT @NEWEXPENSE

		--SETTING NEW INCOME
		SET @NEWNETPROFIT = @NEWREVENUE - @NEWEXPENSE
		PRINT 'NEW NET PROFIT'
		PRINT @NEWNETPROFIT

		--GETTING WITHDRAWL
		SELECT @WITHDRAWL = SUM(AMOUNT) FROM POSTINGS
		WHERE (ACC_NUM LIKE '2%' AND TYPE = 'DEBIT' AND E_DATE BETWEEN @FROM AND @TO)
		PRINT 'NEW WITHDRAWL'
		IF(@WITHDRAWL IS NULL)
			BEGIN
			SET @WITHDRAWL = 0
			END

		PRINT @WITHDRAWL

		DECLARE @FINALCAPITAL FLOAT

		SET @FINALCAPITAL = (( @NEWNETPROFIT) - @WITHDRAWL) + @NEWOC

		PRINT 'FINAL POSITION OF CAPITAL'
		PRINT @FINALCAPITAL
		
		PRINT '-----------------------------------------------------------------------------'
		--TILL HERE WE GOT THE FINAL CAPITAL 
		--MAKING BALANCE SHEET

		DELETE FROM BALANCESHEET

		DECLARE @I INT, @ACCOUNTSDEBIT FLOAT, @ACCOUNTSCREDIT FLOAT, @ACCOUNTSTOTAL FLOAT,
		@MAXID INT,@ID INT,@ACCOUNTNAME NVARCHAR(50),@ASSETSTOTAL FLOAT,@OCTOTAL FLOAT
	
			SET @OCTOTAL = 0
			SET @ASSETSTOTAL =0

			SELECT @MAXID = ID FROM CHARTOFACCOUNTS

			SET @I =1

			WHILE(@I<=@MAXID)
				BEGIN
				SET @ACCOUNTSDEBIT = 0
				SET @ACCOUNTSCREDIT = 0
				SET @ACCOUNTSTOTAL = 0

				SELECT @ID = NUM , @ACCOUNTNAME = NAME FROM
				CHARTOFACCOUNTS
					WHERE(ID = @I)

					PRINT 'ACCOUNT ID'
					PRINT @ID
					PRINT 'ACCOUNT NAME'
					PRINT @ACCOUNTNAME

				SET @I = @I + 1;
				IF(@ID  LIKE '1%')
					BEGIN
					PRINT '-------------ASSETS------------'
				SELECT @ACCOUNTSDEBIT = SUM(AMOUNT) FROM POSTINGS
					WHERE (ACC_NUM = @ID AND (TYPE = 'DEBIT') AND (E_DATE BETWEEN @FROM AND @TO))

					SELECT @ACCOUNTSCREDIT = SUM(AMOUNT) FROM POSTINGS
					WHERE (ACC_NUM = @ID AND (TYPE = 'CREDIT') AND (E_DATE BETWEEN @FROM AND @TO))
					
					IF(@ACCOUNTSDEBIT IS NULL)
					BEGIN
					 SET @ACCOUNTSDEBIT = 0
					END
					IF(@ACCOUNTSCREDIT IS NULL)
					BEGIN
					 SET @ACCOUNTSCREDIT = 0
					END
					PRINT 'DEBIT'
					PRINT @ACCOUNTSDEBIT
					PRINT 'CREDIT'
					PRINT @ACCOUNTSCREDIT

					SET @ACCOUNTSTOTAL = @ACCOUNTSDEBIT - @ACCOUNTSCREDIT

					PRINT 'TOTAL ACCOUNT AMOUNT'
					PRINT @ACCOUNTSTOTAL

					INSERT INTO BALANCESHEET
						VALUES(@ID,@ACCOUNTNAME,@ACCOUNTSTOTAL,'ASSETS')

					SET @ASSETSTOTAL = @ASSETSTOTAL + @ACCOUNTSTOTAL

					
					END -- ENDING IF

					ELSE IF(@ID  LIKE '4%')
					BEGIN
					PRINT '-------------LIABILITY------------'
				SELECT @ACCOUNTSDEBIT = SUM(AMOUNT) FROM POSTINGS
					WHERE (ACC_NUM = @ID AND (TYPE = 'DEBIT') AND (E_DATE BETWEEN @FROM AND @TO))

					SELECT @ACCOUNTSCREDIT = SUM(AMOUNT) FROM POSTINGS
					WHERE (ACC_NUM = @ID AND (TYPE = 'CREDIT') AND (E_DATE BETWEEN @FROM AND @TO))
					
					IF(@ACCOUNTSDEBIT IS NULL)
					BEGIN
					 SET @ACCOUNTSDEBIT = 0
					END
					IF(@ACCOUNTSCREDIT IS NULL)
					BEGIN
					 SET @ACCOUNTSCREDIT = 0
					END
					PRINT 'DEBIT'
					PRINT @ACCOUNTSDEBIT
					PRINT 'CREDIT'
					PRINT @ACCOUNTSCREDIT

					SET @ACCOUNTSTOTAL =@ACCOUNTSCREDIT - @ACCOUNTSDEBIT

					
					PRINT 'TOTAL ACCOUNT AMOUNT'
					PRINT @ACCOUNTSTOTAL

					INSERT INTO BALANCESHEET
						VALUES(@ID,@ACCOUNTNAME,@ACCOUNTSTOTAL,'OC+LIABILITY')
					SET @OCTOTAL = @OCTOTAL + @ACCOUNTSTOTAL

						

					END -- ENDING ELSE IF

				
				END-- ENDING WHILE

				INSERT INTO BALANCESHEET
						VALUES('2XXX','FINAL CAPITAL',@FINALCAPITAL,'OC')

				SET @OCTOTAL = @OCTOTAL + @FINALCAPITAL

				PRINT 'ASSETS TOTAL IS ' 
				PRINT @ASSETSTOTAL
				PRINT 'OC TOTAL IS ' 
				PRINT @OCTOTAL


				SELECT * FROM BALANCESHEET
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[InsertJournalAndPosting]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertJournalAndPosting]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@ACCiD INT,
	@acc_num nvarchar(50),
	@Amount float,
	@Des nvarchar(max),
	@type nvarchar(50),
	@eDate date
AS
	/* SET NOCOUNT ON */
	BEGIN TRANSACTION
	BEGIN TRY
	
	INSERT INTO Journal
                         ( acc_id, amount, des, type, e_date)
VALUES        (@accid,@amount,@des,@type,@eDate)

INSERT INTO Postings
                         (acc_id,acc_num, type, amount, e_date)
VALUES        (@accid,@acc_num,@type,@amount,@edate)
COMMIT
END TRY
BEGIN CATCH
ROLLBACK
END CATCH

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GenerateTrialBalance]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateTrialBalance]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@from date,
	@to date
AS
	/* SET NOCOUNT ON */

	declare @AssetsDebit float, @AssetsCredit float, @AssetsResult float
	declare @id nvarchar(50), @i int,@maxid int, @AccountName nvarchar(50)
	delete from trialBalance
	

	set @assetsdebit = 0
	set @assetscredit = 0
	
	select @maxid = id from chartofaccounts

	set @i = 1;

	while(@i<=@maxid)
	begin
	set @accountname = ''
	set @assetsdebit = 0
	set @assetscredit = 0
	set @assetsresult = 0

	select @id = num, @AccountName = name from chartofaccounts
	where(id = @i)
	print @id
	print @accountname

	select @assetsdebit = sum(amount) from postings
	where ((acc_num = @id) and (type = 'debit') and (amount is not null) and (e_date between @from and @to)) 

	
	
	if(@assetsdebit is null)
	begin
	set @assetsdebit = 0
	end

	print 'Print total debit here'
	print @assetsdebit

	select @assetscredit = sum(amount) from postings
	where ((acc_num = @id) and (type = 'credit') and (amount is not null) and (e_date between @from and @to)) 

	if(@assetscredit is null)
	begin
	set @assetscredit = 0
	end

	print 'Print total credit here'
	print  @assetscredit
	print ''
		

	set @assetsresult = @assetsdebit - @assetscredit

	print 'Result'
	print @assetsresult
	if(@assetsresult>0)
	begin
	print 'show on debit'
	
	insert into trialbalance 
	values
	(@id,@accountname,@assetsresult,0)
	end
	else
	begin
	print 'show on credit'
	insert into trialbalance 
	values
	(@id,@accountname,0,@assetsresult)
	end
	print ''


 set	@i = @i +1
	end

	
	

	select * from trialbalance
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[ClearAccountDB]    Script Date: 07/05/2013 20:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearAccountDB]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	delete from trialbalance
	delete from incomestatement
	delete from ownerequity
	delete from balancesheet
	delete from postings
	delete from journal
	RETURN
GO
/****** Object:  Default [DF_CharOfAccounts_e_date]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[ChartOfAccounts] ADD  CONSTRAINT [DF_CharOfAccounts_e_date]  DEFAULT (getdate()) FOR [e_date]
GO
/****** Object:  Default [DF_Journal_e_date]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[Journal] ADD  CONSTRAINT [DF_Journal_e_date]  DEFAULT (getdate()) FOR [e_date]
GO
/****** Object:  Default [DF_Ledgers_e_date]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[Ledgers] ADD  CONSTRAINT [DF_Ledgers_e_date]  DEFAULT (getdate()) FOR [e_date]
GO
/****** Object:  Default [DF_Postings_e_date]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[Postings] ADD  CONSTRAINT [DF_Postings_e_date]  DEFAULT (getdate()) FOR [e_date]
GO
/****** Object:  ForeignKey [FK_CharOfAccounts_Ledgers]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[ChartOfAccounts]  WITH CHECK ADD  CONSTRAINT [FK_CharOfAccounts_Ledgers] FOREIGN KEY([type])
REFERENCES [dbo].[Ledgers] ([type])
GO
ALTER TABLE [dbo].[ChartOfAccounts] CHECK CONSTRAINT [FK_CharOfAccounts_Ledgers]
GO
/****** Object:  ForeignKey [FK_Journal_CharOfAccounts]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_CharOfAccounts] FOREIGN KEY([acc_id])
REFERENCES [dbo].[ChartOfAccounts] ([id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_CharOfAccounts]
GO
/****** Object:  ForeignKey [FK_Postings_CharOfAccounts]    Script Date: 07/05/2013 20:52:24 ******/
ALTER TABLE [dbo].[Postings]  WITH CHECK ADD  CONSTRAINT [FK_Postings_CharOfAccounts] FOREIGN KEY([acc_id])
REFERENCES [dbo].[ChartOfAccounts] ([id])
GO
ALTER TABLE [dbo].[Postings] CHECK CONSTRAINT [FK_Postings_CharOfAccounts]
GO
