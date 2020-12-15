/*
Quantidade de urnas em pedidos por cliente
*/

select
    SalesOrder.DocEntry [OrderId],
    SalesOrder.CardCode [CustomerId],
    sum(OrderLine.OpenCreQty) [ProductQuantity]

from [dbo].[ORDR] SalesOrder
    inner join [dbo].[RDR1] OrderLine on OrderLine.DocEntry = SalesOrder.DocEntry

    inner join [dbo].[OITM] Product on Product.ItemCode = OrderLine.ItemCode

where SalesOrder.DocStatus = 'O'
    and Product.u_UPTpProd in ('0','1','2','3','4','5')

group BY
    SalesOrder.DocEntry,
    SalesOrder.CardCode

order by 3,2 desc
