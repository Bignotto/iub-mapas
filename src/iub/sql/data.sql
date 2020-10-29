select
    pedido.DocEntry [NumeroPedido],
    pedido.CardCode [CodigoCliente],
    sum(linha.OpenCreQty) [QuantidadeUrnas]

from [dbo].[ORDR] pedido
    inner join [dbo].[RDR1] linha on linha.DocEntry = pedido.DocEntry

    inner join [dbo].[OITM] produto on produto.ItemCode = linha.ItemCode

where pedido.DocStatus = 'O'
    and produto.u_UPTpProd in ('0','1','2','3','4','5')

group BY
    pedido.DocEntry,
    pedido.CardCode
