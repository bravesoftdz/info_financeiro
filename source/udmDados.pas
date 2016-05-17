unit udmDados;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, controls,Dialogs;

type
  TdmDados = class(TDataModule)
    dstCedente: TSQLDataSet;
    dstCedenteCODIGO: TIntegerField;
    dstCedenteCEDENTE_CODIGO: TStringField;
    dstCedenteCEDENTE_CODIGO_DIGITO: TStringField;
    dstCedenteBANCO_CODIGO: TStringField;
    dstCedenteBANCO_NOME: TStringField;
    dstCedenteAGENCIA_DIGITO: TStringField;
    dstCedenteAGENCIA_NOME: TStringField;
    dstCedenteCONTA_NUMERO: TStringField;
    dstCedenteCONTA_NUMERO_DIGITO: TStringField;
    dstCedentePROXIMO_NOSSO_NUMERO: TIntegerField;
    dstCedenteTIPO_INSCRICAO: TStringField;
    dstCedenteNUMERO_INSCRICAO: TStringField;
    dstCedenteRUA: TStringField;
    dstCedenteNUMERO: TIntegerField;
    dstCedenteCOMPLEMENTO: TStringField;
    dstCedenteBAIRRO: TStringField;
    dstCedenteCIDADE: TStringField;
    dstCedenteESTADO: TStringField;
    dstCedenteCEP: TStringField;
    dstCedenteEMAIL: TStringField;
    dstCedenteLOGO_BANCO: TBlobField;
    dspCedente: TDataSetProvider;
    cdsCedente: TClientDataSet;
    cdsCedenteCODIGO: TIntegerField;
    cdsCedenteCEDENTE_CODIGO: TStringField;
    cdsCedenteCEDENTE_CODIGO_DIGITO: TStringField;
    cdsCedenteBANCO_CODIGO: TStringField;
    cdsCedenteBANCO_NOME: TStringField;
    cdsCedenteAGENCIA_DIGITO: TStringField;
    cdsCedenteAGENCIA_NOME: TStringField;
    cdsCedenteCONTA_NUMERO: TStringField;
    cdsCedenteCONTA_NUMERO_DIGITO: TStringField;
    cdsCedentePROXIMO_NOSSO_NUMERO: TIntegerField;
    cdsCedenteTIPO_INSCRICAO: TStringField;
    cdsCedenteNUMERO_INSCRICAO: TStringField;
    cdsCedenteRUA: TStringField;
    cdsCedenteNUMERO: TIntegerField;
    cdsCedenteCOMPLEMENTO: TStringField;
    cdsCedenteBAIRRO: TStringField;
    cdsCedenteCIDADE: TStringField;
    cdsCedenteESTADO: TStringField;
    cdsCedenteCEP: TStringField;
    cdsCedenteEMAIL: TStringField;
    cdsCedenteLOGO_BANCO: TBlobField;
    dstCedenteCEDENTE_NOME: TStringField;
    cdsCedenteCEDENTE_NOME: TStringField;
    dstCedenteINICIO_NOSSO_NUMERO: TStringField;
    cdsCedenteINICIO_NOSSO_NUMERO: TStringField;
    dstCedenteNUMERO_CONVENIO: TStringField;
    cdsCedenteNUMERO_CONVENIO: TStringField;
    dstCedenteACEITE: TStringField;
    dstCedenteTIPO_BOLETO: TIntegerField;
    cdsCedenteACEITE: TStringField;
    cdsCedenteTIPO_BOLETO: TIntegerField;
    dstPermissoes: TSQLDataSet;
    dspPermissoes: TDataSetProvider;
    cdsPermissoes: TClientDataSet;
    dstPermissoesUSU_CODIGO: TIntegerField;
    dstPermissoesMEN_CODIGO: TIntegerField;
    dstPermissoesPG_NOVO: TStringField;
    dstPermissoesPU_ALTERAR: TStringField;
    dstPermissoesPU_APAGAR: TStringField;
    dstPermissoesPU_CONSULTAR: TStringField;
    cdsPermissoesUSU_CODIGO: TIntegerField;
    cdsPermissoesMEN_CODIGO: TIntegerField;
    cdsPermissoesPG_NOVO: TStringField;
    cdsPermissoesPU_ALTERAR: TStringField;
    cdsPermissoesPU_APAGAR: TStringField;
    cdsPermissoesPU_CONSULTAR: TStringField;
    spAcessoMenu: TSQLStoredProc;
    spDireitoAcesso: TSQLStoredProc;
    qryAux: TSQLQuery;
    dstContaSaldo: TSQLDataSet;
    dspContaSaldo: TDataSetProvider;
    dstContaSaldoCGS_CODIGO: TIntegerField;
    dstContaSaldoCGS_DESCRICAO: TStringField;
    dstContaSaldoCGS_VALOR_SALDO: TFMTBCDField;
    dstContaSaldoCGS_AGENCIA: TStringField;
    dstContaSaldoCGS_BANCO: TIntegerField;
    dstContaSaldoCGS_NRCONTA: TStringField;
    cdsContaSaldo: TClientDataSet;
    cdsContaSaldoCGS_CODIGO: TIntegerField;
    cdsContaSaldoCGS_DESCRICAO: TStringField;
    cdsContaSaldoCGS_VALOR_SALDO: TFMTBCDField;
    cdsContaSaldoCGS_AGENCIA: TStringField;
    cdsContaSaldoCGS_BANCO: TIntegerField;
    cdsContaSaldoCGS_NRCONTA: TStringField;
    dstDados: TSQLDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    dspAux: TDataSetProvider;
    dstAux: TSQLDataSet;
    cdsAux: TClientDataSet;
    dstTransportadora: TSQLDataSet;
    dstTransportadoraTRP_CODIGO: TIntegerField;
    dstTransportadoraTRP_NOME: TStringField;
    dstTransportadoraTRP_PEFRETE: TBCDField;
    dspTransportadora: TDataSetProvider;
    cdsTransportadora: TClientDataSet;
    cdsTransportadoraTRP_CODIGO: TIntegerField;
    cdsTransportadoraTRP_NOME: TStringField;
    cdsTransportadoraTRP_PEFRETE: TBCDField;
    dstPlanos: TSQLDataSet;
    dstPlanosPLA_CODIGO: TIntegerField;
    dstPlanosPLA_DESCRICAO: TStringField;
    dspPlanos: TDataSetProvider;
    cdsPlanos: TClientDataSet;
    cdsPlanosPLA_CODIGO: TIntegerField;
    cdsPlanosPLA_DESCRICAO: TStringField;
    dstTransportadoraTRP_NRFONE: TStringField;
    cdsTransportadoraTRP_NRFONE: TStringField;
    dstItensPedido: TSQLDataSet;
    dstItensPedidoMOP_PEDIDO: TIntegerField;
    dstItensPedidoMOP_PRODUTO: TStringField;
    dstItensPedidoMOP_QUANTIDADE: TFMTBCDField;
    dstItensPedidoMOP_UNIDADE: TStringField;
    dstItensPedidoMOP_VALOR: TFMTBCDField;
    dstItensPedidoMOP_DESCONTO: TFMTBCDField;
    dstItensPedidoMOP_SERIE: TStringField;
    dstItensPedidoMOP_CUSTO: TFMTBCDField;
    dstItensPedidoMOP_COMPRA: TFMTBCDField;
    dstItensPedidoMOP_CODCOR: TIntegerField;
    dstItensPedidoMOP_VALIPI: TFMTBCDField;
    dspItensPedido: TDataSetProvider;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoMOP_PEDIDO: TIntegerField;
    cdsItensPedidoMOP_PRODUTO: TStringField;
    cdsItensPedidoMOP_QUANTIDADE: TFMTBCDField;
    cdsItensPedidoMOP_UNIDADE: TStringField;
    cdsItensPedidoMOP_VALOR: TFMTBCDField;
    cdsItensPedidoMOP_DESCONTO: TFMTBCDField;
    cdsItensPedidoMOP_SERIE: TStringField;
    cdsItensPedidoMOP_CUSTO: TFMTBCDField;
    cdsItensPedidoMOP_COMPRA: TFMTBCDField;
    cdsItensPedidoMOP_CODCOR: TIntegerField;
    cdsItensPedidoMOP_VALIPI: TFMTBCDField;
    cdsMatriz: TClientDataSet;
    cdsMatrizCLI_CODIGO: TIntegerField;
    cdsMatrizCLI_FANTASIA: TStringField;
    cdsMatrizCLI_RAZAO: TStringField;
    dstMesas: TSQLDataSet;
    dstMesasMES_CODIGO: TIntegerField;
    dstMesasMES_DESCRICAO: TStringField;
    dspMesas: TDataSetProvider;
    cdsMesas: TClientDataSet;
    cdsMesasMES_CODIGO: TIntegerField;
    cdsMesasMES_DESCRICAO: TStringField;
    dstPreVenda: TSQLDataSet;
    dstItensVenda: TSQLDataSet;
    dstItensVendaPVI_PEDIDO: TIntegerField;
    dstItensVendaPVI_ITEM: TIntegerField;
    dstItensVendaPVI_PRODUTO: TStringField;
    dstItensVendaPVI_QUANTIDADE: TFMTBCDField;
    dstItensVendaPVI_UNIDADE: TStringField;
    dstItensVendaPVI_VALOR: TFMTBCDField;
    dstItensVendaPVI_DESCONTO: TFMTBCDField;
    dstItensVendaPVI_SERIE: TStringField;
    dstItensVendaPVI_CUSTO: TFMTBCDField;
    dstItensVendaPVI_COMPRA: TFMTBCDField;
    dstItensVendaPVI_CODCOR: TIntegerField;
    dstItensVendaPVI_VALIPI: TFMTBCDField;
    dstItensVendaPVI_CDVENDEDOR: TIntegerField;
    dstPreVendaPRV_PEDIDO: TIntegerField;
    dstPreVendaPRV_CUPOM: TIntegerField;
    dstPreVendaPRV_LOJA: TIntegerField;
    dstPreVendaPRV_SEQUENCIA: TIntegerField;
    dstPreVendaPRV_CLIENTE: TIntegerField;
    dstPreVendaPRV_DATAVENDA: TDateField;
    dstPreVendaPRV_HORAVENDA: TStringField;
    dstPreVendaPRV_DATACANC: TDateField;
    dstPreVendaPRV_HORACANC: TStringField;
    dstPreVendaPRV_MOTCANC: TStringField;
    dstPreVendaPRV_VENDEDOR: TIntegerField;
    dstPreVendaPRV_VALOR: TFMTBCDField;
    dstPreVendaPRV_ENTRADA: TFMTBCDField;
    dstPreVendaPRV_DESCONTO: TFMTBCDField;
    dstPreVendaPRV_ACRESCIMO: TFMTBCDField;
    dstPreVendaPRV_DEVOLUSAO: TFMTBCDField;
    dstPreVendaPRV_TROCO: TFMTBCDField;
    dstPreVendaPRV_SITUACAO: TStringField;
    dstPreVendaDOM_ENDERECO: TStringField;
    dstPreVendaDOM_NUMERO: TStringField;
    dstPreVendaDOM_BAIRRO: TStringField;
    dstPreVendaDOM_CIDADE: TStringField;
    dstPreVendaDOM_REFERE: TStringField;
    dstPreVendaPRV_NOMECLIENTE: TStringField;
    dstPreVendaPRV_OBSERVACAO: TMemoField;
    dspPreVenda: TDataSetProvider;
    cdsPreVenda: TClientDataSet;
    dspItensVenda: TDataSetProvider;
    cdsItensVenda: TClientDataSet;
    cdsPreVendaPRV_PEDIDO: TIntegerField;
    cdsPreVendaPRV_CUPOM: TIntegerField;
    cdsPreVendaPRV_LOJA: TIntegerField;
    cdsPreVendaPRV_SEQUENCIA: TIntegerField;
    cdsPreVendaPRV_CLIENTE: TIntegerField;
    cdsPreVendaPRV_DATAVENDA: TDateField;
    cdsPreVendaPRV_HORAVENDA: TStringField;
    cdsPreVendaPRV_DATACANC: TDateField;
    cdsPreVendaPRV_HORACANC: TStringField;
    cdsPreVendaPRV_MOTCANC: TStringField;
    cdsPreVendaPRV_VENDEDOR: TIntegerField;
    cdsPreVendaPRV_VALOR: TFMTBCDField;
    cdsPreVendaPRV_ENTRADA: TFMTBCDField;
    cdsPreVendaPRV_DESCONTO: TFMTBCDField;
    cdsPreVendaPRV_ACRESCIMO: TFMTBCDField;
    cdsPreVendaPRV_DEVOLUSAO: TFMTBCDField;
    cdsPreVendaPRV_TROCO: TFMTBCDField;
    cdsPreVendaPRV_SITUACAO: TStringField;
    cdsPreVendaDOM_ENDERECO: TStringField;
    cdsPreVendaDOM_NUMERO: TStringField;
    cdsPreVendaDOM_BAIRRO: TStringField;
    cdsPreVendaDOM_CIDADE: TStringField;
    cdsPreVendaDOM_REFERE: TStringField;
    cdsPreVendaPRV_NOMECLIENTE: TStringField;
    cdsPreVendaPRV_OBSERVACAO: TMemoField;
    cdsItensVendaPVI_PEDIDO: TIntegerField;
    cdsItensVendaPVI_ITEM: TIntegerField;
    cdsItensVendaPVI_PRODUTO: TStringField;
    cdsItensVendaPVI_QUANTIDADE: TFMTBCDField;
    cdsItensVendaPVI_UNIDADE: TStringField;
    cdsItensVendaPVI_VALOR: TFMTBCDField;
    cdsItensVendaPVI_DESCONTO: TFMTBCDField;
    cdsItensVendaPVI_SERIE: TStringField;
    cdsItensVendaPVI_CUSTO: TFMTBCDField;
    cdsItensVendaPVI_COMPRA: TFMTBCDField;
    cdsItensVendaPVI_CODCOR: TIntegerField;
    cdsItensVendaPVI_VALIPI: TFMTBCDField;
    cdsItensVendaPVI_CDVENDEDOR: TIntegerField;
    cdsListaProdutos: TClientDataSet;
    cdsListaProdutosPRO_CODIGO: TStringField;
    cdsListaProdutosPRO_BARRAS: TStringField;
    cdsListaProdutosPRO_DESCRICAO: TStringField;
    cdsItensVendaPVI_NMPROD: TStringField;
    cdsItensVendaPVI_SUBTOTAL: TFloatField;
    cdsListaVendedores: TClientDataSet;
    cdsListaVendedoresFUN_CODIGO: TIntegerField;
    cdsListaVendedoresFUN_NOME: TStringField;
    cdsItensVendaPVI_NMVEND: TStringField;
    cdsMesasOcupadas: TClientDataSet;
    cdsMesasOcupadasPRV_PEDIDO: TIntegerField;
    cdsMesasOcupadasPRV_LOJA: TIntegerField;
    cdsMesasOcupadasPRV_SITUACAO: TStringField;
    dstPreVendaPRV_NRMESA: TStringField;
    cdsPreVendaPRV_NRMESA: TStringField;
    dstPromocoes: TSQLDataSet;
    dstPromocoesPRM_IDPRODUTO: TStringField;
    dstPromocoesPRM_DTCADA: TDateField;
    dstPromocoesPRM_DTALTE: TDateField;
    dspPromocoes: TDataSetProvider;
    cdsPromocoes: TClientDataSet;
    cdsPromocoesPRM_IDPRODUTO: TStringField;
    cdsPromocoesPRM_DTCADA: TDateField;
    cdsPromocoesPRM_DTALTE: TDateField;
    cdsPromocoesPRM_NMPROD: TStringField;
    dstPromocoesPRM_ALTUSU: TIntegerField;
    dstPromocoesPRM_CADUSU: TIntegerField;
    cdsPromocoesPRM_ALTUSU: TIntegerField;
    cdsPromocoesPRM_CADUSU: TIntegerField;
    dstPromocoesPRM_VLSEGU: TFMTBCDField;
    dstPromocoesPRM_VLTERC: TFMTBCDField;
    dstPromocoesPRM_VLQUAR: TFMTBCDField;
    dstPromocoesPRM_VLQUIN: TFMTBCDField;
    dstPromocoesPRM_VLSEXT: TFMTBCDField;
    dstPromocoesPRM_VLSABA: TFMTBCDField;
    dstPromocoesPRM_VLDOMI: TFMTBCDField;
    cdsPromocoesPRM_VLSEGU: TFMTBCDField;
    cdsPromocoesPRM_VLTERC: TFMTBCDField;
    cdsPromocoesPRM_VLQUAR: TFMTBCDField;
    cdsPromocoesPRM_VLQUIN: TFMTBCDField;
    cdsPromocoesPRM_VLSEXT: TFMTBCDField;
    cdsPromocoesPRM_VLSABA: TFMTBCDField;
    cdsPromocoesPRM_VLDOMI: TFMTBCDField;
    cdsPromocoesPRM_VLUNIT: TFloatField;
    dstPreVendaDOM_NRFONE: TStringField;
    dstPreVendaDOM_COMPLEMENTO: TStringField;
    cdsPreVendaDOM_NRFONE: TStringField;
    cdsPreVendaDOM_COMPLEMENTO: TStringField;
    cdsMesasOcupadasPRV_NRMESA: TStringField;
    cdsBuscaTelefone: TClientDataSet;
    dstServicos: TSQLDataSet;
    dstServicosSTS_SEQUENCIA: TIntegerField;
    dstServicosSTS_NRMESA: TStringField;
    dstServicosSTS_DATA: TDateField;
    dstServicosSTS_HORA: TStringField;
    dstServicosSTS_IDPRODUTO: TStringField;
    dstServicosSTS_QUANTIDADE: TFMTBCDField;
    dstServicosSTS_STATUS: TStringField;
    dspServicos: TDataSetProvider;
    cdsServicos: TClientDataSet;
    cdsServicosSTS_SEQUENCIA: TIntegerField;
    cdsServicosSTS_NRMESA: TStringField;
    cdsServicosSTS_DATA: TDateField;
    cdsServicosSTS_HORA: TStringField;
    cdsServicosSTS_IDPRODUTO: TStringField;
    cdsServicosSTS_QUANTIDADE: TFMTBCDField;
    cdsServicosSTS_STATUS: TStringField;
    cdsListaServicos: TClientDataSet;
    cdsListaServicosSTS_SEQUENCIA: TIntegerField;
    cdsListaServicosSTS_NRMESA: TStringField;
    cdsListaServicosSTS_IDPRODUTO: TStringField;
    cdsListaServicosSTS_STATUS: TStringField;
    cdsListaServicosPRO_DESCRICAO: TStringField;
    cdsListaServicosSTS_STDESC: TStringField;
    cdsPrevendasAbertas: TClientDataSet;
    dstItensVendaPVI_SEQ_SERVICO: TIntegerField;
    cdsItensVendaPVI_SEQ_SERVICO: TIntegerField;
    cdsItensVendaPVI_STATUS: TStringField;
    dstCedenteAGENCIA_CODIGO: TStringField;
    cdsCedenteAGENCIA_CODIGO: TStringField;
    dstGrupos: TSQLDataSet;
    dstGruposGRU_CODIGO: TIntegerField;
    dstGruposGRU_DESCRICAO: TStringField;
    dspGrupos: TDataSetProvider;
    cdsGrupos: TClientDataSet;
    cdsGruposGRU_CODIGO: TIntegerField;
    cdsGruposGRU_DESCRICAO: TStringField;
    dstCedenteCARTEIRA: TStringField;
    cdsCedenteCARTEIRA: TStringField;
    cdsTitulos: TClientDataSet;
    cdsTitulosCDS_NOSSONUMERO: TStringField;
    cdsTitulosCDS_DTVENC: TStringField;
    cdsTitulosCDS_DTPAGA: TStringField;
    cdsTitulosCDS_DTCRED: TStringField;
    cdsTitulosCDS_VLTARIFA: TFloatField;
    cdsTitulosCDS_OUTRAS_DESPESAS: TFloatField;
    cdsTitulosCDS_JUROS_DESCONTO: TFloatField;
    cdsTitulosCDS_IOF_DESCONTO: TFloatField;
    cdsTitulosCDS_VLABATIMENTO: TFloatField;
    cdsTitulosCDS_VLDESC: TFloatField;
    cdsTitulosCDS_VLRECEBIDO: TFloatField;
    cdsTitulosCDS_JUROS_MORA: TFloatField;
    cdsTitulosCDS_OUTROS_RECEBIMENTOS: TFloatField;
    cdsTitulosCDS_VALOR_LANCAMENTO: TFloatField;
    cdsTitulosCDS_VALOR_DOCUMENTO: TFloatField;
    cdsTitulosCDS_FLBAIXA: TBooleanField;
    cdsTitulosCDS_CDCLIE: TIntegerField;
    cdsTitulosCDS_NMCLIE: TStringField;
    cdsTitulosCDS_CPFCGC: TStringField;
    qryPadrao: TSQLQuery;
    dspPadrao: TDataSetProvider;
    cdsClientesAdiplentes: TClientDataSet;
    cdsClientesAdiplentesCLI_CODIGO: TIntegerField;
    cdsClientesAdiplentesCLI_RAZAO: TStringField;
    cdsClientesAdiplentesCLI_CGC: TStringField;
    cdsClientesAdiplentesCLI_CDGRUPO: TIntegerField;
    cdsClientesAdiplentesGRU_DESCRICAO: TStringField;
    cdsClientesAdiplentesCLI_NRBOX: TStringField;
    cdsClientesAdiplentesCLI_FANTASIA: TStringField;
    cdsParcelasCliente: TClientDataSet;
    cdsParcelasClienteREC_SEQUENCIA: TIntegerField;
    cdsParcelasClienteREC_LOJA: TIntegerField;
    cdsParcelasClienteREC_CREDITO: TIntegerField;
    cdsParcelasClienteREC_PARCELA: TIntegerField;
    cdsParcelasClienteREC_CLIENTE: TIntegerField;
    cdsParcelasClienteREC_DATAEMISSAO: TDateField;
    cdsParcelasClienteREC_DATAVENCIMENTO: TDateField;
    cdsParcelasClienteREC_DATAPAGAMENTO: TDateField;
    cdsParcelasClienteREC_SITUACAO: TStringField;
    cdsParcelasClienteREC_VALORPARCELA: TFMTBCDField;
    cdsParcelasClienteREC_PAGO: TFMTBCDField;
    cdsParcelasClienteREC_NOSSO_NUMERO: TStringField;
    cdsListaClientes: TClientDataSet;
    cdsListaClientesCDS_CODIGO: TIntegerField;
    cdsListaClientesCDS_NOME: TStringField;
    cdsListaClientesCDS_CGCCPF: TStringField;
    cdsListaClientesCDS_CDGRUPO: TIntegerField;
    cdsListaClientesCDS_NMGRUPO: TStringField;
    cdsListaClientesCDS_NRBOX: TStringField;
    cdsListaClientesCDS_QTPARC: TIntegerField;
    cdsListaClientesCDS_QTPAGA: TIntegerField;
    cdsInadimplentes: TClientDataSet;
    cdsListaClientesCDS_QTABERTAS: TFloatField;
    cdsListaClientesCDS_VLPAGO: TFloatField;
    cdsListaClientesCDS_VLDEBITO: TFloatField;
    cdsListaClientesCDS_VLMULTA: TFloatField;
    cdsListaClientesCDS_VLJUROS: TFloatField;
    cdsListaClientesCDS_SUBTOTAL: TFloatField;
    cdsParcelasClienteREC_PEMULTA: TFMTBCDField;
    cdsParcelasClienteREC_PEJURO: TFMTBCDField;
    cdsListaClientesCDS_VLPCATUAL: TFloatField;
    dstRenegociacao: TSQLDataSet;
    dstRenegociacaoRNG_CODIGO: TIntegerField;
    dstRenegociacaoRNG_CDLOJA: TIntegerField;
    dstRenegociacaoRNG_CLIENTE: TIntegerField;
    dstRenegociacaoRNG_DTMOVI: TDateField;
    dstRenegociacaoRGN_TOTAL_RENEGOCIACAO: TFMTBCDField;
    dstRenegociacaoRGN_DESCONTO: TBCDField;
    dstRenegociacaoRGN_VLENTRADA: TFMTBCDField;
    dstRenegociacaoRGN_VLFINANCIADO: TFMTBCDField;
    dstRenegociacaoRGN_PEJUROS: TBCDField;
    dstRenegociacaoRGN_QUANTIDADE: TIntegerField;
    dstRenegociacaoRGN_VLPARCELA: TFMTBCDField;
    dstRenegociacaoRGN_DTVENC1: TDateField;
    dstRenegociacaoRGN_DTVENC2: TDateField;
    dstRenegociacaoRGN_OBSERVACAO: TMemoField;
    dstRenegociacaoRGN_USUARIO: TIntegerField;
    dstRenegociacaoRNG_NOME_CLIENTE: TStringField;
    dstRenegociacaoRNG_NRBOX: TStringField;
    dspRenegociacao: TDataSetProvider;
    cdsRenegociacao: TClientDataSet;
    cdsRenegociacaoRNG_CODIGO: TIntegerField;
    cdsRenegociacaoRNG_CDLOJA: TIntegerField;
    cdsRenegociacaoRNG_CLIENTE: TIntegerField;
    cdsRenegociacaoRNG_DTMOVI: TDateField;
    cdsRenegociacaoRGN_TOTAL_RENEGOCIACAO: TFMTBCDField;
    cdsRenegociacaoRGN_DESCONTO: TBCDField;
    cdsRenegociacaoRGN_VLENTRADA: TFMTBCDField;
    cdsRenegociacaoRGN_VLFINANCIADO: TFMTBCDField;
    cdsRenegociacaoRGN_PEJUROS: TBCDField;
    cdsRenegociacaoRGN_QUANTIDADE: TIntegerField;
    cdsRenegociacaoRGN_VLPARCELA: TFMTBCDField;
    cdsRenegociacaoRGN_DTVENC1: TDateField;
    cdsRenegociacaoRGN_DTVENC2: TDateField;
    cdsRenegociacaoRGN_OBSERVACAO: TMemoField;
    cdsRenegociacaoRGN_USUARIO: TIntegerField;
    cdsRenegociacaoRNG_NOME_CLIENTE: TStringField;
    cdsRenegociacaoRNG_NRBOX: TStringField;
    dstEletros: TSQLDataSet;
    dstEletrosELE_CODIGO: TIntegerField;
    dstEletrosELE_DESCRICAO: TStringField;
    dspEletros: TDataSetProvider;
    cdsEletros: TClientDataSet;
    cdsEletrosELE_CODIGO: TIntegerField;
    cdsEletrosELE_DESCRICAO: TStringField;
    dstClienteEletro: TSQLDataSet;
    dstClienteEletroCLE_CLIENTE: TIntegerField;
    dstClienteEletroCLE_ELETRO: TIntegerField;
    dspCLienteEletro: TDataSetProvider;
    cdsClienteEletro: TClientDataSet;
    cdsClienteEletroCLE_CLIENTE: TIntegerField;
    cdsClienteEletroCLE_ELETRO: TIntegerField;
    cdsListaEletros: TClientDataSet;
    cdsListaEletrosELE_CODIGO: TIntegerField;
    cdsListaEletrosELE_DESCRICAO: TStringField;
    cdsClienteEletroCLE_DESCRICAO: TStringField;
    dstMovimentoBox: TSQLDataSet;
    dstMovimentoBoxMBX_CODIGO: TIntegerField;
    dstMovimentoBoxMBX_NRPISO: TIntegerField;
    dstMovimentoBoxMBX_CLIENTE: TIntegerField;
    dstMovimentoBoxMBX_DTMOVI: TDateField;
    dstMovimentoBoxMBX_HOMOVI: TStringField;
    dstMovimentoBoxMBX_NUMBOX: TStringField;
    dstMovimentoBoxMBX_SITUACAO: TStringField;
    dstMovimentoBoxMBX_USUARIO: TIntegerField;
    dspMovimentoBox: TDataSetProvider;
    cdsMovimentoBox: TClientDataSet;
    cdsMovimentoBoxMBX_CODIGO: TIntegerField;
    cdsMovimentoBoxMBX_NRPISO: TIntegerField;
    cdsMovimentoBoxMBX_CLIENTE: TIntegerField;
    cdsMovimentoBoxMBX_DTMOVI: TDateField;
    cdsMovimentoBoxMBX_HOMOVI: TStringField;
    cdsMovimentoBoxMBX_NUMBOX: TStringField;
    cdsMovimentoBoxMBX_SITUACAO: TStringField;
    cdsMovimentoBoxMBX_USUARIO: TIntegerField;
    dstMovimentoBoxMBX_LOJA: TIntegerField;
    cdsMovimentoBoxMBX_LOJA: TIntegerField;
    cdsMovimentoBoxMBX_NMCLIE: TStringField;
    cdsMovimentoBoxMBX_STDESC: TStringField;
    dstMovimentoBoxMBX_JUSTIFICATIVA: TStringField;
    cdsMovimentoBoxMBX_JUSTIFICATIVA: TStringField;
    procedure dspContaSaldoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspTransportadoraGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspPlanosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspItensPedidoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspMesasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspItensVendaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspPreVendaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsItensVendaCalcFields(DataSet: TDataSet);
    procedure dspPromocoesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsPromocoesCalcFields(DataSet: TDataSet);
    procedure dspServicosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsListaServicosCalcFields(DataSet: TDataSet);
    procedure dspGruposGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsListaClientesCalcFields(DataSet: TDataSet);
    procedure dspMovimentoBoxGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsMovimentoBoxCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Incluir_Conta_Saldo(aDescricao : String; aSaldo : Double);
    procedure Incluir_Movimento_Contas(
      aLOJA, aNRCAIXA, aCONTA_SAIU, aNATUREZA, aCLIENTE, aFORNECEDOR : INTEGER;
      aVLANTERIOR, aVLMOVIMENTO, aVLATUAL : Double;
      aNRDOCUMENTO, aTPMOVI, aHOMOVI, aDESCRICAO, aNOME_PORTADOR, aCHEQUE : String;
      aDTMOVI : TDate);
    function GetValorAtual(aCodConta : Integer) : Double;
    Procedure SetSaldoConta(aCodConta : Integer; aValor : Double; aTipo : String);
    Function GetModaRecebimento(aCodModa : Integer) : integer;
    Function GetDescricaoMesa(aDescricao : String) : Boolean;
    Function GetMesa(iCodigo : Integer) : Boolean;
    Function CarregarDadosItens(aCds : TClientDataSet) : Boolean;
    Function FecharStatusPedido(iPedido : Integer) : Boolean;
    Function GetPedidoMesa(aMesa : String) : integer;
    Function GetProdutoPromocao(aCodigo : String ) : Boolean;
    Function GetStatusServico(iSequencia : integer) : String;
    Function Carregar_Titulos(iCedente: Integer; aArquivo : string) : boolean;
    Function ConsultaClientes(iGrupo : Integer; aDtInicial, aDtFinal : TDatetime) : Boolean;
    Function ConsultaClientesInadimplente(iGrupo, iDia : Integer; aDtInicial, aDtFinal : TDatetime) : Boolean;
    Function ClientesGeraLista(aCDS : TClientDataSet; aDtInicial, aDtFinal : TDatetime) : Boolean;
    Function GeraListaInadimplentes(aCDS : TClientDataSet; aDtInicial, aDtFinal : TDatetime) : Boolean;
    Procedure AddClienteLista(iCodigo, iGrupo : Integer; aNome, aCPFCGC, aNMGRUP, aNRBOX : String;
          fParcelas, fPagas : Integer; fVLPAGO, fVLDEBITO, fTotalMulta, fTotalJuros, fValorAtualPC : Double);
    Function AddRegistroRenegociacao(iCDLOJA, iCLIENTE, iQUANTIDADE, iUSUARIO : integer;
      fTOTAL_RENEGOCIACAO, fDESCONTO, fVLENTRADA, fVLFINANCIADO, fPEJUROS, fVLPARCELA : double;
      aDTMOVI, aDTVENC1 : TDATE; aDTVENC2, aOBSERVACAO : String) : Boolean;
    Procedure AbrirEletroCliente(iCliente : Integer);
    Function GetVerificaEletroCliente(iCliente, iEletro : Integer) : Boolean;
    Function AddRegistroMov_Box(iLoja, iCLIENTE, iUSUARIO : Integer; aDTMOVI: TDATE;
        aHOMOVI, aNUMBOX : String): Boolean;
  end;

var
  dmDados: TdmDados;

implementation

uses Udm, udmConsulta, uDmRelatorios, uFuncoes;

{$R *.dfm}

procedure TdmDados.dspContaSaldoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTAS_SALDOS';
end;

function TdmDados.GetModaRecebimento(aCodModa: Integer): integer;
begin
     With dmConsultas.cdsConsulta2 do
     begin
          Active := False;
          CommandText := 'Select * from MODALIDADE Where (MOD_CODIGO = :pCODIGO)';
          Params.ParamByName('pCODIGO').AsInteger := aCodModa;
          //
          Active := True;
          //
          if not (IsEmpty)
           and not (FieldByName('MOD_CAIXA_GERAL').IsNull) Then
             Result := FieldByName('MOD_CAIXA_GERAL').AsInteger;
         //
         Active := False;
     End;
End;

function TdmDados.GetValorAtual(aCodConta: Integer): Double;
begin
     Dm.FilterCDS(dmRelatorios.cdsContSaldo, fsInteger , InttoStr(aCodConta));
     //
     if not (dmRelatorios.cdsContSaldo.IsEmpty) Then
         Result := dmRelatorios.cdsContSaldoCGS_VALOR_SALDO.AsFloat
     Else
         Result := 0;
end;

procedure TdmDados.Incluir_Conta_Saldo(aDescricao: String; aSaldo: Double);
begin
  Dm.Start;
  Try
     Dm.RefreshCDS(Dm.CdsConfig);
     //
     Dm.CdsConfig.Edit;
     Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger :=
        Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger + 1;
     Dm.CdsConfig.ApplyUpdates(0);
     //
     With dmDados.cdsContaSaldo do
      begin
           Append;
           FieldByName('CGS_CODIGO').AsInteger   := Dm.CdsConfigCFG_CONTAS_SALDO.AsInteger;
           FieldByName('CGS_DESCRICAO').AsString := aDescricao;
           FieldByName('CGS_VALOR_SALDO').AsFloat := 0;
           ApplyUpdates(0);
      End;
      Dm.Comit(Dm.Transc);
  Except
      Dm.Rollback;
  End;
end;

procedure TdmDados.Incluir_Movimento_Contas(aLOJA, aNRCAIXA,
  aCONTA_SAIU, aNATUREZA, aCLIENTE, aFORNECEDOR: INTEGER; aVLANTERIOR,
  aVLMOVIMENTO, aVLATUAL: Double; aNRDOCUMENTO, aTPMOVI, aHOMOVI, aDESCRICAO,
  aNOME_PORTADOR, aCHEQUE: String; aDTMOVI: TDate);
begin
   Dm.Start;
   try
     With cdsDados do
      begin
           Active := False;
           CommandText := 'Select * from MOVIMENTO_CONTAS Where (CGM_LOJA = :pLOJA)';
           Params.ParamByName('pLOJA').AsInteger := -1;
           Active := True;
           //
           Append;
           FieldByName('CGM_LOJA').AsInteger    := aLOJA;
           FieldByName('CGM_TIPO_MOV').AsString := aTPMOVI;
           FieldByName('CGM_NRCAIXA').AsInteger := aNRCAIXA;
           FieldByName('CGM_DTMOVI').AsDateTime := aDTMOVI;
           FieldByName('CGM_HOMOVI').AsString   := aHOMOVI;
           FieldByName('CGM_NRDOCUMENTO').AsString  := aNRDOCUMENTO;
           FieldByName('CGM_CONTA_SAIU').AsInteger  := aCONTA_SAIU;
           FieldByName('CGM_VLANTERIOR').AsFloat    := aVLANTERIOR;
           FieldByName('CGM_VLMOVIMENTO').AsFloat   := aVLMOVIMENTO;
           FieldByName('CGM_VLATUAL').AsFloat       := aVLATUAL;
           FieldByName('CGM_NATUREZA').AsInteger := aNATUREZA;
           FieldByName('CGM_DESCRICAO').AsString := aDESCRICAO;
           FieldByName('CGM_NOME_PORTADOR').AsString := aNOME_PORTADOR;
           FieldByName('CGM_CLIENTE').AsInteger      := aCLIENTE;
           FieldByName('CGM_FORNECEDOR').AsInteger   := aFORNECEDOR;
           FieldByName('CGM_CHEQUE').AsString        := aCHEQUE;
           // Grava
           ApplyUpdates(0);
      End;
      Dm.Comit(Dm.Transc);
    Except
         Dm.Rollback;
    End;
end;

procedure TdmDados.SetSaldoConta(aCodConta: Integer; aValor: Double;
  aTipo: String);
begin
     Dm.FilterCDS(dmRelatorios.cdsContSaldo, fsInteger , InttoStr(aCodConta));
     //
     if not (dmRelatorios.cdsContSaldo.IsEmpty) Then
      begin
           dmRelatorios.cdsContSaldo.edit;
           If (aTipo = 'E') Then
              dmRelatorios.cdsContSaldo.FieldByName('CGS_VALOR_SALDO').AsFloat :=
                  dmRelatorios.cdsContSaldo.FieldByName('CGS_VALOR_SALDO').AsFloat + aValor
           Else
              dmRelatorios.cdsContSaldo.FieldByName('CGS_VALOR_SALDO').AsFloat :=
                  dmRelatorios.cdsContSaldo.FieldByName('CGS_VALOR_SALDO').AsFloat - aValor;
           // Grava
           dmRelatorios.cdsContSaldo.ApplyUpdates(0);
      End;
end;

procedure TdmDados.dspTransportadoraGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'TRANSPORTADORA';
end;

procedure TdmDados.dspPlanosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PLANO_PAGAMENTO';
end;

procedure TdmDados.dspItensPedidoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PROVENDAS';
end;

procedure TdmDados.dspMesasGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'MESAS';
end;

function TdmDados.GetDescricaoMesa(aDescricao: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from MESAS Where (MES_DESCRICAO = :pDESCRICAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := aDescricao;
      Open;
      //
      if not (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

function TdmDados.GetMesa(iCodigo: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select * from MESAS Where (MES_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := iCodigo;
      Open;
      //
      if NOT (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

procedure TdmDados.dspItensVendaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PRE_VENDA_ITENS';
end;

procedure TdmDados.dspPreVendaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PRE_VENDA';
end;

procedure TdmDados.cdsItensVendaCalcFields(DataSet: TDataSet);
Var
   aStatus : String;
begin
      If (cdsItensVendaPVI_QUANTIDADE.AsFloat > 0) Then
       cdsItensVendaPVI_SUBTOTAL.AsFloat :=
           cdsItensVendaPVI_VALOR.AsFloat * cdsItensVendaPVI_QUANTIDADE.AsFloat;
      //
      If (cdsItensVenda.State = dsInternalCalc ) Then
       begin
            aStatus := GetStatusServico(cdsItensVendaPVI_SEQ_SERVICO.AsInteger);
            if (aStatus = 'C') Then
               cdsItensVendaPVI_STATUS.AsString := 'Cozinha';
            if (aStatus = 'P') Then
               cdsItensVendaPVI_STATUS.AsString := 'Pronto';
            if (aStatus = 'E') or uFuncoes.Empty(aStatus) Then
               cdsItensVendaPVI_STATUS.AsString := 'Entregue';
       End;
end;

function TdmDados.CarregarDadosItens(aCds: TClientDataSet): Boolean;
begin
      If not (Dm.cdsItensVendas.Active) Then
         Dm.cdsItensVendas.Open;
      //
      Dm.cdsItensVendas.EmptyDataSet;
      //
      With aCds do
        begin
             DisableControls;
             First;
             while not (Eof) do
              begin
                   dm.cdsItensVendas.Append;
                   //
                   dm.cdsItensVendasITE_NRITEN.AsInteger := FieldByName('PVI_ITEM').AsInteger;
                   dm.cdsItensVendasITE_CDITEN.AsString  := FieldByName('PVI_PRODUTO').AsString;
                   dm.cdsItensVendasITE_NMDESC.AsString  := FieldByName('PVI_NMPROD').AsString;
                   dm.cdsItensVendasITE_QTITEN.AsFloat   := FieldByName('PVI_QUANTIDADE').AsFloat;
                   dm.cdsItensVendasITE_CDUNID.AsString  := FieldByName('PVI_UNIDADE').AsString;
                   dm.cdsItensVendasITE_VLUNIT.AsFloat   := FieldByName('PVI_VALOR').AsFloat;
                   dm.cdsItensVendasITE_VLDESC.AsFloat   := FieldByName('PVI_DESCONTO').AsFloat;
                   dm.cdsItensVendasITE_VLCUST.AsFloat   := FieldByName('PVI_CUSTO').AsFloat;
                   dm.cdsItensVendasITE_VLCOMP.AsFloat   := FieldByName('PVI_COMPRA').AsFloat;
                   dm.cdsItensVendasITE_VALIPI.AsFloat   := FieldByName('PVI_VALIPI').AsFloat;
                   dm.cdsItensVendasITE_VENDEDOR.AsInteger := FieldByName('PVI_CDVENDEDOR').AsInteger;
                   dm.cdsItensVendasITE_CDBAIX.AsString  := FieldByName('PVI_PRODUTO').AsString;
                   //
                   dm.cdsItensVendas.Post;
                   //
                   Next;
              End;
             EnableControls;
        End;
end;

function TdmDados.FecharStatusPedido(iPedido: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'UpDate PRE_VENDA Set PRV_SITUACAO = :pSITUACAO where (PRV_PEDIDO = :pPEDIDO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
   begin
    Dm.Start;
    try
        try
          SQLConnection := dm.SQLAdmin;
          sql.Add(texto);
          Params.ParamByName('pSITUACAO').AsString := 'F';
          Params.ParamByName('pPEDIDO').AsInteger  := iPedido;
          ExecSQL();
          //
          Dm.Comit(Dm.Transc);
          //
          result := True;
        finally
          free;
        end;
    Except
        Dm.Rollback;
    End;
  End;
end;

function TdmDados.GetPedidoMesa(aMesa : String): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PRV_PEDIDO, PRV_NRMESA, PRV_SITUACAO from PRE_VENDA Where (PRV_NRMESA = :pNRMESA) AND (PRV_SITUACAO = :pSITUACAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pNRMESA').AsString   := aMesa;
      Params.ParamByName('pSITUACAO').AsString := 'A';
      Open;
      //
      if NOT (IsEmpty) Then
        result := FieldByName('PRV_PEDIDO').AsInteger;
    finally
      free;
    end;
end;

procedure TdmDados.dspPromocoesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PROMOCAO';
end;

procedure TdmDados.cdsPromocoesCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(cdsPromocoesPRM_IDPRODUTO.AsString) Then
      Begin
        cdsPromocoesPRM_NMPROD.AsString := uFuncoes.NOME_PRODUTO(cdsPromocoesPRM_IDPRODUTO.AsString);
        cdsPromocoesPRM_VLUNIT.AsFloat  := dmConsultas.GetProdutoValor(cdsPromocoesPRM_IDPRODUTO.AsString);
      End
     Else
        cdsPromocoesPRM_NMPROD.Clear;  
end;

function TdmDados.GetProdutoPromocao(aCodigo: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRM_IDPRODUTO from PROMOCAO Where (PRM_IDPRODUTO = :pIDPRODUTO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pIDPRODUTO').AsString   := aCodigo;
      Open;
      //
      if NOT (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

procedure TdmDados.dspServicosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'STATUS_SERVICOS';
end;

procedure TdmDados.cdsListaServicosCalcFields(DataSet: TDataSet);
begin
      If not uFuncoes.Empty(cdsListaServicosSTS_STATUS.AsString) Then
      begin
          if (cdsListaServicosSTS_STATUS.AsString = 'C') Then
             cdsListaServicosSTS_STDESC.AsString := 'Cozinha';
          if (cdsListaServicosSTS_STATUS.AsString = 'P') Then
             cdsListaServicosSTS_STDESC.AsString := 'Pronto';
          if (cdsListaServicosSTS_STATUS.AsString = 'E') Then
             cdsListaServicosSTS_STDESC.AsString := 'Entegre';
      End;
end;

function TdmDados.GetStatusServico(iSequencia: integer): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select STS_SEQUENCIA, STS_STATUS from STATUS_SERVICOS Where (STS_SEQUENCIA = :pSEQUENCIA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
      Open;
      //
      if not (IsEmpty) Then
          result := FieldByName('STS_STATUS').AsString;

    finally
      free;
    end;
end;

procedure TdmDados.dspGruposGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName:= 'GRUPOS';
end;

function TdmDados.Carregar_Titulos(iCedente: Integer; aArquivo: string): boolean;
var
     arq: TextFile;
     linha, M_TEXTO1, M_TEXTO2 : String;
     M_TEXTO3, M_TEXTO4, M_TEXTO5, M_TEXTO6, M_TEXTO7, M_TEXTO8 : String;
     //
     aNossoNumero : String;
     aDataPagamento, aDataVenc, aDataCredito : TDate;
     ValorIOF, ValorAbatimento, ValorDesconto : double;
     ValorDocumento, ValorMoraJuros, ValorOutrosCreditos, ValorRecebido : double;
     aCedente, aConvenio, aNomeCedente, aNomeBanco, aNumeroConta, aContaDig, aAgencia, aAgenteDig : String;
     iCliente : Integer;
     aNomeCliente, aCPFCGC : String;
     qraux : TSQLquery;
     texto : string;
begin
     result := False;
     //
     if not (cdsTitulos.Active) Then
        cdsTitulos.Open;
     cdsTitulos.EmptyDataSet;
     //
     Dm.FilterCDS(dmDados.cdsCedente, fsInteger, InttoStr(iCedente));
     //
     If not (dmDados.cdsCedente.IsEmpty) Then
      begin
           aConvenio    := dmDados.cdsCedenteNUMERO_CONVENIO.AsString;
           aNomeCedente := dmDados.cdsCedenteCEDENTE_NOME.AsString;
           aNumeroConta := uFuncoes.StrZero(uFuncoes.Alltrim(dmDados.cdsCedenteCONTA_NUMERO.AsString),12);
           aContaDig    := dmDados.cdsCedenteCONTA_NUMERO_DIGITO.AsString;
           aNomeBanco   := dmDados.cdsCedenteBANCO_NOME.AsString;
           aAgencia     := dmDados.cdsCedenteAGENCIA_CODIGO.AsString;
           aAgenteDig   := dmDados.cdsCedenteAGENCIA_DIGITO.AsString;
      End
      Else
          raise Exception.Create('Erro ao tentar abrir dados do cedente.');
     //
     try
        AssignFile ( arq, aArquivo );
        Reset ( arq );
        //  1� linha
        ReadLn ( arq, linha );
        M_TEXTO1 := Copy(linha,33,9);  // numero convenio
        M_TEXTO2 := Copy(linha,53,5);  // Ag�ncia mantendora da conta
        M_TEXTO3 := Copy(linha,58,1);  // D�gito verificador da Ag�ncia
        M_TEXTO4 := Copy(linha,59,12); // N�mero da Conta Corrente
        M_TEXTO5 := Copy(linha,71,1);  // D�gito verificador Conta Corrente
        M_TEXTO6 := Copy(linha,73,30); // Nome da Empresa
        M_TEXTO7 := uFuncoes.Alltrim(Copy(linha,103,30)); // Nome do Banco
        M_TEXTO8 := Copy(linha,181,11); // 'PROCESSAMEN'
        //
        if (M_TEXTO1 = '00'+aConvenio) and (M_TEXTO2 = aAgencia)
         and (M_TEXTO3 = aAgenteDig) and (M_TEXTO4 = aNumeroConta)
         and (M_texto7 = aNomeBanco) AND (M_TEXTO8 = 'PROCESSAMEN') Then
         begin
            // linha 2
            ReadLn ( arq, linha );
            // linha 3 em diante
            While not Eof ( arq ) do
              begin
                  ReadLn ( arq, linha );
                  //
                  if (Copy(linha,1,3) = '001') and (Copy(linha,14,1) = 'T')
                     AND (Copy(linha,24,12) = aNumeroConta) AND (Copy(linha,38,7) = aConvenio) Then
                  begin
                     //
                     aNossoNumero   := Copy(linha,45,10);
                     //
                     ReadLn ( arq, linha );
                     //
                     if (Copy(linha,1,3) = '001') and (Copy(linha,14,1) = 'U') Then
                     begin
                         aDataPagamento := EncodeDate(StrtoInt(Copy(linha,142,4)),
                                               StrtoInt(Copy(linha,140,2)),
                                               StrtoInt(Copy(linha,138,2)));
                         //
                         aDataCredito   := EncodeDate(StrtoInt(Copy(linha,150,4)),
                                               StrtoInt(Copy(linha,148,2)),
                                               StrtoInt(Copy(linha,146,2)));
                         //  Valor Pago pelo Sacado 78 - 92 : 13
                         ValorDocumento  := StrtoFloat(Copy(linha,80,13))/100;
                         // Valor do IOF Recolhido 63 - 77 : 13
                         ValorIOF        := StrtoFloat(Copy(linha,63,77))/100;
                         // Valor do Abat. Concedido/Cancel. 48 - 62 : 13
                         ValorAbatimento := StrtoFloat(Copy(linha,48,13))/100;
                         // Valor do Desconto Concedido 33  - 47 : 13
                         ValorDesconto   := StrtoFloat(Copy(linha,33,15))/100;
                         // Juros / Multa / Encargos 18 - 32 : 13
                         ValorMoraJuros  := StrtoFloat(Copy(linha,20,13))/100;
                         // Valor de Outros Cr�ditos 123 - 137 : 13
                         ValorOutrosCreditos  := StrtoFloat(Copy(linha,123,13))/100;
                         // Valor L�quido a ser Creditado  93 - 107 : 13
                         ValorRecebido   := StrtoFloat(Copy(linha,95,13))/100;
                         //
                         With cdsTitulos do
                          begin
                               DisableControls;
                               Append;
                               FieldByName('CDS_NOSSONUMERO').AsString := aNossoNumero;
                               //FieldByName('CDS_DTVENC').AsString      := DatetoStr();
                               FieldByName('CDS_DTPAGA').AsString      := DatetoStr(aDataPagamento);
                               FieldByName('CDS_DTCRED').AsString      := DatetoStr(aDataCredito);
                               // FieldByName('CDS_VLTARIFA').AsString    := FloatToStrf(valor, fffixed, 16, 2));
                               //FieldByName('CDS_OUTRAS_DESPESAS').AsFloat := FloatToStrf(valor, fffixed, 11, 2));
                               //FieldByName('CDS_JUROS_DESCONTO').AsFloat := StrtoFloat(FormatFloat('###,##0.#0',StrtoFloat(ValorDesconto)));
                               FieldByName('CDS_IOF_DESCONTO').AsString  := floattostrf(ValorIOF,ffFixed,13,2);
                               FieldByName('CDS_VLABATIMENTO').AsString  := floattostrf(ValorAbatimento,ffFixed,13,2);
                               FieldByName('CDS_VLDESC').AsString        := floattostrf(ValorDesconto,ffFixed,13,2);
                               FieldByName('CDS_VALOR_DOCUMENTO').AsString := floattostrf(ValorDocumento,ffFixed,13,2);
                               FieldByName('CDS_VLRECEBIDO').AsString := floattostrf(ValorRecebido,ffFixed,13,2);
                               FieldByName('CDS_JUROS_MORA').AsString := floattostrf(ValorMoraJuros,ffFixed,13,2);
                               FieldByName('CDS_OUTROS_RECEBIMENTOS').AsString  := floattostrf(ValorOutrosCreditos,ffFixed,13,2);
                               //FieldByName('CDS_VALOR_LANCAMENTO').AsFloat    := StrtoFloat(FormatFloat('###,##0.#0',StrtoFloat()));
                               FieldByName('CDS_FLBAIXA').AsBoolean := False;
                               //
                               texto := ' Select R.REC_SEQUENCIA, R.REC_CLIENTE, CL.CLI_CODIGO, CL.CLI_FANTASIA, CL.CLI_TIPOPESSOA, CL.CLI_CGC, R.REC_NOSSO_NUMERO, R.REC_CDCEDENTE ';
                               texto := texto + ' from CONTASRECEBER R Inner Join CLIENTES CL on CL.CLI_CODIGO = R.REC_CLIENTE Where (R.REC_NOSSO_NUMERO = :pNOSSONUMERO) and (R.REC_CDCEDENTE = :pCDCEDENTE) ';
                               QrAux := TSqlquery.Create(nil);
                               with QrAux do
                                try
                                     SQLConnection := dm.SQLAdmin;
                                     sql.Add(texto);
                                     Params.ParamByName('pNOSSONUMERO').AsString  := aNossoNumero;
                                     Params.ParamByName('pCDCEDENTE').AsInteger   := iCedente;
                                     Open;
                                     //
                                     If not (IsEmpty) Then
                                      begin
                                           cdsTitulos.FieldByName('CDS_CDCLIE').AsInteger := FieldByName('REC_CLIENTE').AsInteger;
                                           cdsTitulos.FieldByName('CDS_NMCLIE').AsString  := FieldByName('CLI_FANTASIA').AsString;
                                           If (FieldByName('CLI_TIPOPESSOA').AsString = 'F') Then
                                               cdsTitulos.FieldByName('CDS_CPFCGC').AsString := uFuncoes.FormataCPF(FieldByName('CLI_CGC').AsString)
                                           Else
                                               cdsTitulos.FieldByName('CDS_CPFCGC').AsString := uFuncoes.FormataCNPJ(FieldByName('CLI_CGC').AsString);
                                      End;
                                finally
                                   free;
                                end;
                               //
                               Post;
                               EnableControls;
                          End;
                     End;
                  End;
              end;
             //
             result := True;
         End;
     Finally
         CloseFile ( arq );
     End;
end;

function TdmDados.ConsultaClientes(iGrupo : Integer; aDtInicial,
  aDtFinal: TDatetime): Boolean;
Var
   aTexto : String;
begin
     Result := false;
     //
     aTexto := 'Select CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC, CL.CLI_CDGRUPO, ';
     aTexto := aTexto + 'G.GRU_DESCRICAO, CL.CLI_NRBOX from CLIENTES CL ';
     aTexto := aTexto + 'inner Join CONTASRECEBER R ON CL.CLI_CODIGO = R.REC_CLIENTE ';
     aTexto := aTexto + 'inner Join GRUPOS G ON CL.CLI_CDGRUPO = G.GRU_CODIGO ';
     aTexto := aTexto + 'Where (R.rec_datavencimento >= :pDATA) AND (R.rec_datavencimento <= :pDTFINAL) ';
     If (iGrupo > 0) Then
        aTexto := aTexto + ' and (CL.CLI_CDGRUPO = '+QuotedStr(IntToStr(iGrupo))+') ';
     aTexto := aTexto + 'Group By CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC, ';
     aTexto := aTexto + 'CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX order by G.GRU_DESCRICAO, CL.CLI_RAZAO, CL.CLI_NRBOX';
     With cdsClientesAdiplentes do
      begin
           DisableControls;
           Close;
           CommandText := aTexto;
           Params[0].AsDate := aDtInicial;
           Params[1].AsDate := aDtFinal;
           Open;
           //
           if not (IsEmpty) Then
            begin
                 Result := True;
                 //
                 ClientesGeraLista(cdsClientesAdiplentes, aDtInicial, aDtFinal);
                 If not (cdsListaClientes.IsEmpty) Then
                    cdsListaClientes.First;
            End;
           EnableControls;
      End;
end;

function TdmDados.ClientesGeraLista(aCDS: TClientDataSet; aDtInicial,
  aDtFinal: TDatetime): Boolean;
Var
  M_CDCLIE : Integer;
  aFluxoGravar : Boolean;
  M_QTPARC, M_QTPAGA : Integer;
begin
     cdsListaClientes.Open;
     cdsListaClientes.EmptyDataSet;
     //
     With aCDS do
      begin
           DisableControls;
           First;
           //
           While not (Eof) do
            begin
                 M_CDCLIE := FieldByName('CLI_CODIGO').AsInteger;
                 aFluxoGravar := True;
                 //
                 With cdsParcelasCliente do
                  begin
                       close;
                       Params.ParamByName('pCLIENTE').AsInteger := M_CDCLIE;
                       Params.ParamByName('pDTINIC').AsDate     := aDtInicial;
                       Params.ParamByName('pDTFINA').AsDate     := aDtFinal;
                       Open;
                       //
                       If not (IsEmpty) Then
                        begin
                             First;
                             M_QTPARC := 0;
                             M_QTPAGA := 0;
                             //
                             while not (Eof) do
                              begin
                                   M_QTPARC := M_QTPARC + 1;
                                   if (FieldByName('REC_SITUACAO').AsString = 'A')
                                     and (FieldByName('REC_DATAPAGAMENTO').IsNull) Then
                                    // AND (FieldByName('REC_PAGO').AsFloat < 1) Then
                                          aFluxoGravar := False
                                   Else
                                       M_QTPAGA := M_QTPAGA + 1;
                                   //
                                   Next;
                              End;
                              //
                              If (aFluxoGravar) Then
                                begin
                                     dmDados.AddClienteLista(
                                      aCDS.FieldByName('CLI_CODIGO').AsInteger, aCDS.FieldByName('CLI_CDGRUPO').AsInteger,
                                      aCDS.FieldBYName('CLI_RAZAO').AsString, aCDS.FieldBYName('CLI_CGC').AsString,
                                      aCDS.FieldByName('GRU_DESCRICAO').AsString, aCDS.FieldByName('CLI_NRBOX').AsString,
                                      M_QTPARC, M_QTPAGA,0,0, 0, 0, 0);
                                End;
                        End;
                  End;
                 //
                 Next;
            End;
           //
           EnableControls;
      End;
end;

procedure TdmDados.AddClienteLista(iCodigo, iGrupo: Integer; aNome,
  aCPFCGC, aNMGRUP, aNRBOX: String; fParcelas, fPagas: Integer; fVLPAGO, fVLDEBITO,
  fTotalMulta, fTotalJuros, fValorAtualPC : Double);
Var
   M_NRDOCU : String;
begin
     If not (cdsListaClientes.Active) Then
      begin
           cdsListaClientes.Open;
           cdsListaClientes.EmptyDataSet;
      End;
      //
      With cdsListaClientes do
        begin
             Append;
             FieldByName('CDS_CODIGO').AsInteger := iCodigo;
             FieldByName('CDS_NOME').AsString    := aNome;
             If (Dm.VerificaTipoPessoa(iCodigo) = 0) Then
                M_NRDOCU := uFuncoes.FormataCNPJ(aCPFCGC)
             Else
                M_NRDOCU := uFuncoes.FormataCPF(aCPFCGC);
             FieldByName('CDS_CGCCPF').AsString  := M_NRDOCU;
             FieldByName('CDS_CDGRUPO').AsInteger := iGrupo;
             FieldByName('CDS_NMGRUPO').AsString := aNMGRUP;
             FieldByName('CDS_NRBOX').AsString   := aNRBOX;
             FieldByName('CDS_QTPARC').AsFloat   := fParcelas;
             FieldByName('CDS_QTPAGA').AsFloat   := fPagas;
             FieldByName('CDS_QTABERTAS').AsFloat := fParcelas - fPagas;
             FieldByName('CDS_VLPAGO').AsFloat   := fVLPAGO;
             FieldByName('CDS_VLDEBITO').AsFloat := fVLDEBITO;
             FieldByName('CDS_VLMULTA').AsFloat  := fTotalMulta;
             FieldByName('CDS_VLJUROS').AsFloat  := fTotalJuros;
             FieldByName('CDS_VLPCATUAL').AsFloat := fValorAtualPC;
             //
             Post;
        end;
End;

function TdmDados.ConsultaClientesInadimplente(iGrupo, iDia : Integer; aDtInicial,
  aDtFinal: TDatetime): Boolean;
Var
   aTexto : String;
begin
     Result := false;
     //
     aTexto := 'Select CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC, CL.CLI_CDGRUPO, ';
     aTexto := aTexto + 'G.GRU_DESCRICAO, CL.CLI_NRBOX from CLIENTES CL ';
     aTexto := aTexto + 'inner Join CONTASRECEBER R ON CL.CLI_CODIGO = R.REC_CLIENTE ';
     aTexto := aTexto + 'inner Join GRUPOS G ON CL.CLI_CDGRUPO = G.GRU_CODIGO ';
     aTexto := aTexto + 'Where (R.rec_datavencimento >= :pDATA) AND (R.rec_datavencimento <= :pDTFINAL) ';
     if (iDia > 0) Then
        aTexto := aTexto + 'and (EXTRACT(DAY from R.rec_datavencimento) = '+QuotedStr(IntToStr(iDia))+')';
     If (iGrupo > 0) Then
        aTexto := aTexto + ' and (CL.CLI_CDGRUPO = '+QuotedStr(IntToStr(iGrupo))+') ';
     aTexto := aTexto + 'Group By CL.CLI_CODIGO, CL.CLI_RAZAO, CL.CLI_FANTASIA, CL.CLI_CGC, ';
     aTexto := aTexto + 'CL.CLI_CDGRUPO, G.GRU_DESCRICAO, CL.CLI_NRBOX order by G.GRU_DESCRICAO, CL.CLI_RAZAO, CL.CLI_NRBOX';
     With cdsClientesAdiplentes do
      begin
           DisableControls;
           Close;
           CommandText := aTexto;
           Params[0].AsDate := aDtInicial;
           Params[1].AsDate := aDtFinal;
           Open;
           //
           if not (IsEmpty) Then
            begin
                 Result := True;
                 //
                 GeraListaInadimplentes(cdsClientesAdiplentes, aDtInicial, aDtFinal);
                 If not (cdsListaClientes.IsEmpty) Then
                    cdsListaClientes.First;
            End;
           EnableControls;
      End;
end;

function TdmDados.GeraListaInadimplentes(aCDS: TClientDataSet; aDtInicial,
  aDtFinal: TDatetime): Boolean;
Var
  M_CDCLIE : Integer;
  aFluxoGravar : Boolean;
  M_QTPARC, M_QTPAGA : Integer;
  M_VLPAGO, M_VLDEBI : Double;
  M_VLMULT, M_VLJURO, W_VLJURO, M_QTDIAS : Double;
  M_PEMULT, M_PEJURO, M_VLPCATUAL : Double;
begin
     cdsListaClientes.Open;
     cdsListaClientes.EmptyDataSet;
     //
     With aCDS do
      begin
           DisableControls;
           First;
           //
           While not (Eof) do
            begin
                 M_CDCLIE := FieldByName('CLI_CODIGO').AsInteger;
                 aFluxoGravar := False;
                 //
                 M_VLMULT := 0;
                 M_VLJURO := 0;
                 M_QTDIAS := 0;
                 M_VLPCATUAL := 0;
                 M_PEMULT := 0;
                 M_PEJURO := 0;
                 //
                 With cdsParcelasCliente do
                  begin
                       close;
                       Params.ParamByName('pCLIENTE').AsInteger := M_CDCLIE;
                       Params.ParamByName('pDTINIC').AsDate     := aDtInicial;
                       Params.ParamByName('pDTFINA').AsDate     := aDtFinal;
                       Open;
                       //
                       If not (IsEmpty) Then
                        begin
                             First;
                             M_QTPARC := 0;
                             M_QTPAGA := 0;
                             M_VLPAGO := 0;
                             M_VLDEBI := 0;
                             //
                             while not (Eof) do
                              begin
                                   M_QTPARC := M_QTPARC + 1;
                                   if (FieldByName('REC_SITUACAO').AsString = 'A')
                                     and (FieldByName('REC_DATAPAGAMENTO').IsNull) Then
                                      begin
                                          aFluxoGravar := True;
                                          M_VLDEBI := M_VLDEBI + FieldByName('REC_VALORPARCELA').AsFloat;
                                          //
                                          {If (FieldByName('REC_DATAVENCIMENTO').IsNull) then
                                           begin}
                                                M_QTDIAS := Date() - FieldByName('REC_DATAVENCIMENTO').AsDateTime;
                                                //
                                                M_PEMULT := FieldByName('REC_PEMULTA').AsFloat;
                                                // percentual de multa
                                                If (M_PEMULT = 0) Then
                                                   M_PEMULT := Dm.CdsConfigCFG_MULTA.AsFloat;
                                                // % de juros
                                                M_PEJURO := FieldByName('REC_PEJURO').AsFloat;
                                                If (M_PEJURO = 0) Then
                                                   M_PEJURO := Dm.CdsConfigCFG_JUROS.AsFloat;
                                                // Multa
                                                if (M_PEMULT > 0) Then
                                                  M_VLMULT :=  M_VLMULT + (uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByName('REC_VALORPARCELA').AsFloat, M_PEMULT),2));
                                                // Juros
                                                if (M_PEJURO > 0) Then
                                                 begin
                                                       W_VLJURO := uFuncoes.Arredondar(uFuncoes.Gerapercentual(FieldByNAme('REC_VALORPARCELA').AsFloat, M_PEJURO),2);
                                                       W_VLJURO := uFuncoes.Arredondar(((W_VLJURO / 30) * M_QTDIAS),2);
                                                       M_VLJURO := M_VLJURO + W_VLJURO;
                                                 End;
                                           //End;
                                      End
                                     Else
                                      begin
                                          M_QTPAGA := M_QTPAGA + 1;
                                          M_VLPAGO := M_VLPAGO + FieldByName('REC_PAGO').AsFloat;
                                      End;
                                   // Valor da Parcela
                                   M_VLPCATUAL := FieldByName('REC_VALORPARCELA').AsFloat;
                                   //
                                   Next;
                              End;
                              //
                              If (aFluxoGravar) Then
                                begin
                                     dmDados.AddClienteLista(
                                      aCDS.FieldByName('CLI_CODIGO').AsInteger, aCDS.FieldByName('CLI_CDGRUPO').AsInteger,
                                      aCDS.FieldBYName('CLI_RAZAO').AsString, aCDS.FieldBYName('CLI_CGC').AsString,
                                      aCDS.FieldByName('GRU_DESCRICAO').AsString, aCDS.FieldByName('CLI_NRBOX').AsString,
                                      M_QTPARC, M_QTPAGA, M_VLPAGO, M_VLDEBI, M_VLMULT, M_VLJURO, M_VLPCATUAL);
                                End;
                        End;
                  End;
                 //
                 Next;
            End;
           //
           EnableControls;
      End;
end;

procedure TdmDados.cdsListaClientesCalcFields(DataSet: TDataSet);
begin
     cdsListaClientesCDS_SUBTOTAL.AsFloat :=
         cdsListaClientesCDS_VLDEBITO.AsFloat +
         cdsListaClientesCDS_VLMULTA.AsFloat +
         cdsListaClientesCDS_VLJUROS.AsFloat;
end;

function TdmDados.AddRegistroRenegociacao(iCDLOJA, iCLIENTE, iQUANTIDADE,
  iUSUARIO: integer; fTOTAL_RENEGOCIACAO, fDESCONTO, fVLENTRADA,
  fVLFINANCIADO, fPEJUROS, fVLPARCELA: double; aDTMOVI, aDTVENC1: TDATE;
  aDTVENC2, aOBSERVACAO: String): Boolean;
Var
   iCodigo : Integer;
begin
     Result := False;
     try
          Dm.RefreshCDS(Dm.CdsConfig);
          Dm.CdsConfig.Edit;
          Dm.CdsConfigCFG_RENEGOCIACAO.AsInteger :=
             Dm.CdsConfigCFG_RENEGOCIACAO.AsInteger + 1;
          Dm.CdsConfig.ApplyUpdates(0);
          //
          iCodigo := Dm.CdsConfigCFG_RENEGOCIACAO.AsInteger;
          //
          Dm.FilterCDS(cdsRenegociacao, fsInteger, inttostr(iCodigo));
          //
          if (cdsRenegociacao.IsEmpty) Then
          begin
              With cdsRenegociacao do
               begin
                    Append;
                    FieldByName('RNG_CODIGO').AsInteger := iCodigo;
                    FieldByName('RNG_CDLOJA').AsInteger := iCDLOJA;
                    FieldByName('RNG_CLIENTE').AsInteger := iCLIENTE;
                    FieldByName('RNG_DTMOVI').AsDateTime := aDTMOVI;
                    FieldByName('RGN_TOTAL_RENEGOCIACAO').AsFloat := fTOTAL_RENEGOCIACAO;
                    FieldByName('RGN_DESCONTO').AsFloat  := fDESCONTO;
                    FieldByName('RGN_VLENTRADA').AsFloat := fVLENTRADA;
                    FieldByName('RGN_VLFINANCIADO').AsFloat := fVLFINANCIADO;
                    FieldByName('RGN_PEJUROS').AsFloat   := fPEJUROS;
                    FieldByName('RGN_QUANTIDADE').AsInteger := iQUANTIDADE;
                    FieldByName('RGN_VLPARCELA').AsFloat := fVLPARCELA;
                    FieldByName('RGN_DTVENC1').AsDateTime := aDTVENC1;
                    if not uFuncoes.Empty(uFuncoes.RemoveChar(aDTVENC2)) Then
                       FieldByName('RGN_DTVENC2').AsDateTime := StrToDate(aDTVENC2);
                    FieldByName('RGN_OBSERVACAO').AsString := aOBSERVACAO;
                    FieldByName('RGN_USUARIO').AsInteger   := iUSUARIO;
                    //
                    dm.FilterCDS(Dm.CdsClientes, fsInteger, InttoStr(iCLIENTE));
                    if not (Dm.CdsClientes.IsEmpty) Then
                    begin
                        FieldByName('RNG_NOME_CLIENTE').AsString := Dm.CdsClientesCLI_RAZAO.AsString;
                        FieldByName('RNG_NRBOX').AsString        := Dm.CdsClientesCLI_NRBOX.AsString;
                    End;
                    //
                    ApplyUpdates(0);
               End;
          End;
     Except

     End;
end;

procedure TdmDados.AbrirEletroCliente(iCliente: Integer);
begin
     Dm.FilterCDS(cdsClienteEletro, fsInteger, InttoStr(iCliente));
end;

function TdmDados.GetVerificaEletroCliente(iCliente,
  iEletro: Integer): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := false;
  texto := 'Select CLE_CLIENTE, CLE_ELETRO from CLIENTE_ELETRO Where (CLE_CLIENTE = :pCLIENTE) and (CLE_ELETRO = :pELETRO) ';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := Dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCLIENTE').AsInteger := iCliente;
      Params.ParamByName('pELETRO').AsInteger  := iEletro;
      Open;
      //
      If not (IsEmpty) Then
          result := True;
    finally
      free;
    end;
end;

procedure TdmDados.dspMovimentoBoxGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'MOVIMENTO_BOX';
end;

function TdmDados.AddRegistroMov_Box(iLoja, iCLIENTE, iUSUARIO: Integer;
  aDTMOVI: TDATE; aHOMOVI, aNUMBOX: String): Boolean;
Var
   iCodigo : Integer;
begin
     result := False;
     try
         Dm.RefreshCDS(dm.CdsConfig);
         dm.CdsConfig.edit;
         dm.CdsConfigCFG_CDMOVBOX.AsInteger := dm.CdsConfigCFG_CDMOVBOX.AsInteger + 1;
         dm.CdsConfig.ApplyUpdates(0);
         //
         iCodigo := dm.CdsConfigCFG_CDMOVBOX.AsInteger;
         //
         With cdsMovimentoBox do
         begin
              Append;
              FieldByName('MBX_CODIGO').AsInteger  := iCodigo;
              FieldByName('MBX_LOJA').AsInteger    := iLoja;
              FieldByName('MBX_CLIENTE').AsInteger := iCLIENTE;
              FieldByName('MBX_NUMBOX').AsString   := aNUMBOX;
              FieldByName('MBX_DTMOVI').AsDateTime := aDTMOVI;
              FieldByName('MBX_HOMOVI').AsString   := aHOMOVI;
              FieldByName('MBX_SITUACAO').AsString := 'A';
              FieldByName('MBX_USUARIO').AsInteger := iUSUARIO;
              Post;
         End;
     Except

     End;
end;

procedure TdmDados.cdsMovimentoBoxCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(cdsMovimentoBoxMBX_CLIENTE.AsString) Then
        cdsMovimentoBoxMBX_NMCLIE.AsString := uFuncoes.NOME_CLIENTE(cdsMovimentoBoxMBX_CLIENTE.AsInteger);
     //
     If (cdsMovimentoBoxMBX_SITUACAO.AsString = 'A') Then
         cdsMovimentoBoxMBX_STDESC.AsString := 'ABERTO';
     If (cdsMovimentoBoxMBX_SITUACAO.AsString = 'F') Then
         cdsMovimentoBoxMBX_STDESC.AsString := 'FECHADO';
     If (cdsMovimentoBoxMBX_SITUACAO.AsString = 'L') Then
         cdsMovimentoBoxMBX_STDESC.AsString := 'LACRADO';
end;

end.