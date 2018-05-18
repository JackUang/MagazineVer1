/* 20170623 */

-- �j�M�b�a�����s�i, �s�W ���OICON ��ܶ������
ALTER TABLE [POP].[dbo].[InfoGroupp] ADD DisplayOrder int NOT NULL DEFAULT 0
GO

-- 20170629 [Infos] ��ƪ�s�W [i_open] ���
ALTER TABLE [POP].[dbo].[Infos] ADD i_open bit NOT NULL DEFAULT 0
GO

-- [ApComplex] ��ƪ�s�W [ig_id] ���
ALTER TABLE [POP].[dbo].[ApComplex] ADD [ig_id] int NOT NULL
GO

-- 20170915 Modify
-- �����s�i�j�M���G View
--CREATE VIEW "V_Infos_LJ_InfoGroupp_LJ_User2Free_LJ_Community_LJ_Club_LJ_ApComplex" 
CREATE VIEW "uv_ClassifiedAdsSearch" 
AS (
SELECT [i_id]
      ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[bill]
      ,[i_LINE]
      ,[i_open]
      ,[or_number]
      ,[i_create_datetime]
      ,[i_probation]
      ,[i_formal_period]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
	  ,[DisplayOrder]

	  ,[U2_id]
      ,[free_id]

	  ,[co_name]
      ,[co_belong]
      ,[co_location1]
      ,[co_location2]
      ,[co_location3]
      ,[co_location4]

	  ,[cl_name]
      ,[cl_belong]
      ,[cl_location1]
      ,[cl_location2]
      ,[cl_location3]
      ,[cl_location4]

	  ,[ac_zipcode]
      ,[ac_name]
      ,[ac_location1]
      ,[ac_location2]
      ,[ac_location3]
      ,[ac_belong]
      ,[ac_family]
      ,[ac_building]

  FROM [POP].[dbo].[Infos]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[User2Free]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[User2Free].[ig_id]
  LEFT JOIN [POP].[dbo].[Community]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Community].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Community].[co_id]
  LEFT JOIN [POP].[dbo].[Club]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Club].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Club].[cl_id]
  LEFT JOIN [POP].[dbo].[ApComplex]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[ApComplex].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[ApComplex].[ac_Id]
);
GO

/* 20170628 */
--�s�W ���I���� ��ƪ�
CREATE TABLE BroadcastPointType
(
bpt_id int not null identity(1,1) primary key,
bpt_broadcastPoint nvarchar(200)
)
GO

/* ���ո��
INSERT INTO "BroadcastPointType" ("bpt_broadcastPoint") VALUES ('���缽�I')
GO
INSERT INTO "BroadcastPointType" ("bpt_broadcastPoint") VALUES ('�[�����I')
GO
*/

-- �b BeaconDevice �s�W ���I���� ���A�����p�� ���I���� ��ƪ�
ALTER TABLE BeaconDevice
    ADD bpt_id INTEGER default (0),
    FOREIGN KEY(bpt_id) REFERENCES BroadcastPointType(bpt_id);
GO

-- �����s�i�j�M���G View
--CREATE VIEW "V_DeviceInfo_LJ_BeaconDevice_LJ_BroadcastPointType_LJ_BeaconDeviceFlow_LJ_Infos_LJ_InfoGroupp" 
CREATE VIEW uv_ConditionalSearchPushAdvertisin 
AS (
SELECT [POP].[dbo].[BeaconDevice].[d_id]
      ,[POP].[dbo].[DeviceInfo].[i_id]

	  ,[d_name]
      ,[d_out_day]
      ,[d_location1]
      ,[d_location2]
      ,[d_location3]
      ,[d_location4]
      ,[d_holder]
      ,[d_memo]
      ,[belongto]
      ,[d_owner]
      ,[POP].[dbo].[BeaconDevice].[bdf_id]
      ,[POP].[dbo].[BeaconDevice].[bpt_id]

	  ,[bpt_broadcastPoint]

	  ,[bdf_name]
      ,[bdf_content]
      ,[bdf_price]

	  ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[bill]
      ,[i_LINE]
	  ,[i_open]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
      ,[DisplayOrder]

	  ,[U2_id]
      ,[free_id]

	  ,[co_id]
      ,[co_name]
      ,[co_belong]
      ,[co_location1]
      ,[co_location2]
      ,[co_location3]
      ,[co_location4]

	  ,[ac_Id]
      ,[ac_zipcode]
      ,[ac_name]
      ,[ac_location1]
      ,[ac_location2]
      ,[ac_location3]
      ,[ac_belong]
      ,[ac_family]
      ,[ac_building]

	  ,[cl_id]
      ,[cl_name]
      ,[cl_belong]
      ,[cl_location1]
      ,[cl_location2]
      ,[cl_location3]
      ,[cl_location4]

  FROM [POP].[dbo].[DeviceInfo]
  LEFT JOIN [POP].[dbo].[BeaconDevice]
  ON [POP].[dbo].[DeviceInfo].[d_id] = [POP].[dbo].[BeaconDevice].[d_id]
  LEFT JOIN [POP].[dbo].[BroadcastPointType]
  ON [POP].[dbo].[BeaconDevice].[bpt_id] = [POP].[dbo].[BroadcastPointType].[bpt_id]
  LEFT JOIN [POP].[dbo].[BeaconDeviceFlow]
  ON [POP].[dbo].[BeaconDevice].[bdf_id] = [POP].[dbo].[BeaconDeviceFlow].[bdf_id]
  LEFT JOIN [POP].[dbo].[Infos]
  ON [POP].[dbo].[DeviceInfo].[i_id] = [POP].[dbo].[Infos].[i_id]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[User2Free]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[User2Free].[ig_id]
  LEFT JOIN [POP].[dbo].[Community]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Community].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Community].[co_id]
  LEFT JOIN [POP].[dbo].[ApComplex]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[ApComplex].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[ApComplex].[ac_id]
  LEFT JOIN [POP].[dbo].[Club]
  ON [POP].[dbo].[User2Free].[ig_id] = [POP].[dbo].[Club].[ig_id] AND [POP].[dbo].[User2Free].[free_id] = [POP].[dbo].[Club].[cl_id]
  
  WHERE [POP].[dbo].[Infos].[i_expired_day] >= Convert(varchar(10),getdate(),111)
);
GO

/*
UPDATE [POP].[dbo].[Infos]
SET [i_expired_day] = DATEADD(day,0, DATEADD(month,+3,[i_expired_day])) 
WHERE  year([i_expired_day]) = 2017
*/

-- �N BeaconDeviceFlow ��ƪ� bdf_id �]�w�� IDENTITY(1,1)

/*

�u�n����U�C�y�k�Y�i�N��ƪ����۰ʽs�����k�s
DBCC CHECKIDENT(��ƪ�W��, RESEED, 0)

INSERT INTO "BeaconDeviceFlow" ("bdf_name", "bdf_content", "bdf_price") VALUES ('A', '�p', '100')
GO
INSERT INTO "BeaconDeviceFlow" ("bdf_name", "bdf_content", "bdf_price") VALUES ('B', '��', '200')
GO
INSERT INTO "BeaconDeviceFlow" ("bdf_name", "bdf_content", "bdf_price") VALUES ('C', '�j', '300')
GO

*/

-- �N BeaconDevice ��ƪ� bdf_id, bpt_id ��J�����

-- �j�M�����s�i ���έp���

--CREATE PROCEDURE usp_Statistics_DeviceInfo_LJ_BeaconDevice_LJ_BroadcastPointType_LJ_BeaconDeviceFlow_LJ_Infos_LJ_InfoGroupp
CREATE PROCEDURE usp_PushAdvertisingStatistics
	@GetAllData bit,
	@CountyCity varchar(10),
	@TownshipCity varchar(10),
	@BdfBroadcastPoint varchar(200),
	@DName varchar(20),
	@NowDatetime datetime
AS
	IF(1 = @GetAllData)
		BEGIN
			SELECT 
				row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
			FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
			WHERE [i_open] = 1 AND [i_expired_day] >= @NowDatetime
			GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
		END
	ELSE
		BEGIN
			IF(@BdfBroadcastPoint = 'all')
				BEGIN
					IF (@DName IS NULL OR @DName = N'')
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
							FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
							WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
							GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
					ELSE
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
							FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
							WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [d_name] like '%' + @DName + '%' AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
							GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
				END
			ELSE
				BEGIN
					IF (@DName IS NULL OR @DName = N'')
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
						  FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
						  WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [bpt_broadcastPoint] = @BdfBroadcastPoint AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
						  GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]

					ELSE
						SELECT 
							row_number() OVER(ORDER BY bpt_broadcastPoint) AS rowNumber, COUNT([d_name]) AS quantity, [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
						  FROM [POP].[dbo].[uv_ConditionalSearchPushAdvertisin]
						  WHERE [d_location1] = @CountyCity AND [d_location2] = @TownshipCity AND [bpt_broadcastPoint] = @BdfBroadcastPoint AND [d_name] like '%' + @DName + '%' AND [i_open] = 1 AND [i_expired_day] >= @NowDatetime
						  GROUP BY [bpt_broadcastPoint], [bdf_name], [d_name], [d_location3], [d_location4], [bdf_price]
				END
		END
GO

-- 20170722
-- 20170915 Modify
-- �����s�i�j�M���G View
CREATE VIEW "uv_AdvertisingCategoryCount" 
AS (
	SELECT [ig_id], [ig_name], COUNT( [ig_id]) AS "count"
	  FROM [POP].[dbo].[uv_ClassifiedAdsSearch]
	  WHERE [i_expired_day] >= Convert(varchar(10),getdate(),111) AND [i_open] = 1
	  GROUP BY [ig_id], [ig_name]
);
GO

--20170908
--�������I���
CREATE VIEW "uv_AllBroadcast"
AS(
	SELECT [d_id]
      ,[d_name]
      ,[d_out_day]
      ,[d_location1]
      ,[d_location2]
      ,[d_location3]
      ,[d_location4]
      ,[d_holder]
      ,[d_memo]
      ,[belongto]
      ,[d_owner]
      ,[POP].[dbo].[BeaconDevice].[bdf_id]
      ,[POP].[dbo].[BeaconDevice].[bpt_id]

      ,[bpt_broadcastPoint]

      ,[bdf_name]
      ,[bdf_content]
      ,[bdf_price]
  FROM [POP].[dbo].[BeaconDevice]
  LEFT JOIN [POP].[dbo].[BroadcastPointType]
  ON [POP].[dbo].[BeaconDevice].[bpt_id] = [POP].[dbo].[BroadcastPointType].[bpt_id]
  LEFT JOIN [POP].[dbo].[BeaconDeviceFlow]
  ON [POP].[dbo].[BeaconDevice].[bdf_id] = [POP].[dbo].[BeaconDeviceFlow].[bdf_id]
);
GO

--20170912
--�s�W���
ALTER TABLE [POP].[dbo].[Infos] ADD [or_number] nvarchar(50) ; -- �q��s��
ALTER TABLE [POP].[dbo].[Infos] ADD [i_create_datetime] datetime; -- �s�خɶ�
ALTER TABLE [POP].[dbo].[Infos] ADD [i_probation] nvarchar(256); -- �եδ��ɶ�
ALTER TABLE [POP].[dbo].[Infos] ADD [i_formal_period] nvarchar(256); -- �������ɶ�


-- 20170913

CREATE TABLE InvoiceType
(
	inv_id int not null identity(1,1) primary key,
	inv_type nvarchar(50),
	inv_description nvarchar(200)
)
GO

INSERT INTO [dbo].[InvoiceType]
           ([inv_type]
           ,[inv_description])
     VALUES
           (N'2', N'�G�p��')
GO

INSERT INTO [dbo].[InvoiceType]
           ([inv_type]
           ,[inv_description])
     VALUES
           (N'3', N'�T�p��')
GO

CREATE TABLE OrderRecord
(
	or_id int not null identity(1,1) primary key,
	or_number nvarchar(50) not null, -- �q��s��
	or_create_datetime datetime not null, -- �q��s�خɶ�
	or_invoice_title nvarchar(50), -- �o�����Y
	or_invoice_address nvarchar(512), -- �o���a�}
	or_invoice_code nvarchar(50),  -- �o���s��
	inv_type nvarchar(50) , -- �o������
	or_invoice_public bit NOT NULL DEFAULT(0), -- �O�_�}�o��
	u_id nvarchar(128) REFERENCES AspNetUsers (Id), -- User Id
	bill int not null DEFAULT(0), -- �q���`��
	or_payment_status bit NOT NULL DEFAULT(0), -- �I�ڪ��A false:���I�ڡAtrue:�w�I��
	or_payment_confirmed bit NOT NULL DEFAULT(0), -- �T�{�I�ڪ��A
	or_remitMoney_name nvarchar(50), -- �״ڤH�m�W
	or_remitMoney_time datetime, -- �q���״ڮɶ�
	or_remitMoney int not null DEFAULT(0) -- �״ڪ��B
)
GO

-- �Z�n�d��
CREATE VIEW "uv_PublishedInquire" 
AS (
	SELECT [i_id]
      ,[i_name]
      ,[i_content]
      ,[i_initial_day]
      ,[i_expired_day]
      ,[i_location1]
      ,[i_location2]
      ,[i_pic1]
      ,[i_pic2]
      ,[i_pic3]
      ,[i_pic4]
      ,[i_pic5]
      ,[i_URL]
      ,[POP].[dbo].[Infos].[ig_id]
      ,[POP].[dbo].[Infos].[u_id]
      ,[i_unconfirm]
      ,[ip_discount]
      ,[ip_days]
      ,[POP].[dbo].[Infos].[bill]
      ,[i_LINE]
      ,[i_open]
      ,[POP].[dbo].[Infos].[or_number]
      ,[i_create_datetime]
      ,[i_probation]
      ,[i_formal_period]

	  ,[ig_name]
      ,[ig_pic]
      ,[ig_price]
      ,[DisplayOrder]

	  ,[or_id]
      ,[or_create_datetime]
      ,[or_invoice_title]
      ,[or_invoice_address]
      ,[or_invoice_code]
      ,[inv_type]
      ,[or_invoice_public]
      ,[or_payment_status]
      ,[or_payment_confirmed]
  FROM [POP].[dbo].[Infos]
  LEFT JOIN [POP].[dbo].[InfoGroupp]
  ON [POP].[dbo].[Infos].[ig_id] = [POP].[dbo].[InfoGroupp].[ig_id]
  LEFT JOIN [POP].[dbo].[OrderRecord]
  ON [POP].[dbo].[Infos].[or_number] = [POP].[dbo].[OrderRecord].[or_number] 
);
GO