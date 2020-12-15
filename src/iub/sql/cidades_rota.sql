/*
Quantidade de urnas por Municípios na Rota
*/
select
    Rota.DocEntry [NumeroRota],
    Municipio.Name [Municipio],
    Municipio.State [Estado],
    sum(Linha.U_UPQtdade) [ProdutoQuantidade]

from [dbo].[@UPP_OCRT] Rota
    inner join [dbo].[@UPP_CRT1] Linha on Linha.DocEntry = Rota.DocEntry

    inner join [dbo].[OCRD] Cliente on Cliente.CardCode = Linha.U_UPCrdCod
        inner join [dbo].[CRD1] ClienteEndereco on Cliente.CardCode = ClienteEndereco.CardCode
            and ClienteEndereco.AdresType = 'S'
        inner join [dbo].[OCNT] Municipio on Municipio.AbsId = ClienteEndereco.County
where Rota.DocEntry = 5483--3456

group by
    Rota.DocEntry,
    Municipio.Name,
    Municipio.[State]
