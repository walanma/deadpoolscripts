USE [ToniqDatabase]
SET NOCOUNT ON
select
	CASE stockPoint.Name 
		WHEN 'UNICHEM-DISP' THEN 'Unichem St. Lukes'
		WHEN 'LIFE-DISP' THEN 'Life St. Lukes'
		ELSE 'Unknown'  
	END as [Store Name],
	drug.BrandName as [Brand],
	drug.GenericName as [Generic Name],
	drug.Strength as [Strength],
	drug.PackSize/100 as [Pack Size],
	cast(round(stockCard.SOH,2) as varchar) as [SOH],
	drug.SpecifiedPackPharmacode as [Pharmacode],
	cast((drug.AverageWholeSalePrice/100.00) as decimal(8,2)) as [w/s price],
	convert(varchar,cast(stockCard.LastSaleDate as datetime), 103) as [last sale] 
from dbo.StockCards as stockCard
inner join dbo.StockPoints as stockPoint on stockPoint.id = stockCard.StockPointId
inner join dbo.BrandDrugs as drug on drug.SpecifiedPackPharmacode = stockCard.PharmaCode
where (getdate() - 180) > cast(stockCard.LastSaleDate as datetime)
and (getdate() - 1095) < cast(stockCard.LastSaleDate as datetime)
and stockCard.SOH between 0.001 and 1000
and stockPoint.name like '%DISP'
and drug.AverageWholeSalePrice >= 100
order by drug.AverageWholeSalePrice DESC