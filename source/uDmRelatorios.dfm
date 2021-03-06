object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 220
  Top = 160
  Height = 626
  Width = 745
  object dstMovCaixa: TSQLDataSet
    CommandText = 'select * from MOVIMENTO_CAIXA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pRGINICIAL'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 16
  end
  object dspMovCaixa: TDataSetProvider
    DataSet = dstMovCaixa
    Options = [poAllowCommandText]
    Left = 96
    Top = 16
  end
  object cdsMovCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovCaixa'
    Left = 168
    Top = 16
  end
  object dstTotalProdutos: TSQLDataSet
    CommandText = 
      'Select H.HIS_LOJA, H.HIS_PRODUTO, SUM(HIS_MOVIMENTO) AS TOTAL, H' +
      '.HIS_VLVENDA,'#13#10'(Select P.PRO_DESCRICAO from produtos P Where (P.' +
      'pro_codigo = h.HIS_PRODUTO))'#13#10'AS PRO_NOME'#13#10'from historico H wher' +
      'e (H.HIS_LOJA = :pLOJA) AND (HIS_TIPO = '#39'V'#39') AND'#13#10'(HIS_DATA >= :' +
      'pDTINIC) AND (HIS_DATA <= :pDTFINA)'#13#10'GROUP BY HIS_LOJA, HIS_PROD' +
      'UTO, H.HIS_VLVENDA order BY HIS_PRODUTO;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 72
  end
  object dspTotalProdutos: TDataSetProvider
    DataSet = dstTotalProdutos
    Options = [poAllowCommandText]
    Left = 120
    Top = 72
  end
  object cdsTotalProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspTotalProdutos'
    OnCalcFields = cdsTotalProdutosCalcFields
    Left = 208
    Top = 72
    object cdsTotalProdutosHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
    end
    object cdsTotalProdutosHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsTotalProdutosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 3
    end
    object cdsTotalProdutosPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 60
    end
    object cdsTotalProdutosHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 15
      Size = 2
    end
    object cdsTotalProdutosHIS_VLTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'HIS_VLTOTAL'
      Calculated = True
    end
  end
  object dstClientes: TSQLDataSet
    CommandText = 
      'select CLI_CODIGO, CLI_FANTASIA, CLI_RAZAO, CLI_TIPOPESSOA, CLI_' +
      'CGC, CLI_ENDERECO, CLI_NUMERO, CLI_CEP, CLI_FONE1, CLI_INSCESTAD' +
      'UAL, CLI_ORGAOEMISSOR, CLI_UFEMISSOR,  '#13#10'CLI_DTANIVERSARIO, CLI_' +
      'UFCLIENTE,'#13#10'(Select C.CID_NOME from CIDADES C Where (C.CID_CODIG' +
      'O = CLIENTES.CID_CODIGO)) AS CLI_NMCIDADE,'#13#10'(Select B.BAI_NOME f' +
      'rom BAIRROS B Where (B.BAI_CODIGO = CLIENTES.BAI_CODIGO)) AS CLI' +
      '_NMBAIRRO,'#13#10'CLI_FONE2, CLI_FONE3, CLI_RAMAL1, CLI_RAMAL2, CLI_RA' +
      'MAL3, CLI_FAX, CLI_PAGINA '#13#10'from CLIENTES order by CLI_FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 128
    object dstClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object dstClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClientesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClientesCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClientesCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClientesCLI_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object dstClientesCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstClientesCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstClientesCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClientesCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClientesCLI_NMCIDADE: TStringField
      FieldName = 'CLI_NMCIDADE'
      Size = 40
    end
    object dstClientesCLI_NMBAIRRO: TStringField
      FieldName = 'CLI_NMBAIRRO'
    end
    object dstClientesCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      Size = 10
    end
    object dstClientesCLI_FONE3: TStringField
      FieldName = 'CLI_FONE3'
      Size = 10
    end
    object dstClientesCLI_RAMAL1: TStringField
      FieldName = 'CLI_RAMAL1'
      FixedChar = True
      Size = 4
    end
    object dstClientesCLI_RAMAL2: TStringField
      FieldName = 'CLI_RAMAL2'
      FixedChar = True
      Size = 4
    end
    object dstClientesCLI_RAMAL3: TStringField
      FieldName = 'CLI_RAMAL3'
      FixedChar = True
      Size = 4
    end
    object dstClientesCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      Size = 10
    end
    object dstClientesCLI_PAGINA: TStringField
      FieldName = 'CLI_PAGINA'
      Size = 60
    end
    object dstClientesCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      FixedChar = True
      Size = 2
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = dstClientes
    Options = [poAllowCommandText]
    Left = 80
    Top = 128
  end
  object cdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    OnCalcFields = cdsClientesCalcFields
    Left = 144
    Top = 128
    object cdsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsClientesCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClientesCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClientesCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsClientesCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClientesCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '000000'
    end
    object cdsClientesCLI_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsClientesCLI_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClientesCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsClientesCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLI_DTANIVERSARIO: TDateField
      Alignment = taRightJustify
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsClientesCLI_NMTPPESSOA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLI_NMTPPESSOA'
      Size = 10
      Calculated = True
    end
    object cdsClientesCLI_NMCIDADE: TStringField
      FieldName = 'CLI_NMCIDADE'
      Size = 40
    end
    object cdsClientesCLI_NMBAIRRO: TStringField
      FieldName = 'CLI_NMBAIRRO'
    end
    object cdsClientesCLI_FONE2: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE2'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_FONE3: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE3'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_RAMAL1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_RAMAL1'
      FixedChar = True
      Size = 4
    end
    object cdsClientesCLI_RAMAL2: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_RAMAL2'
      FixedChar = True
      Size = 4
    end
    object cdsClientesCLI_RAMAL3: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_RAMAL3'
      FixedChar = True
      Size = 4
    end
    object cdsClientesCLI_FAX: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FAX'
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsClientesCLI_PAGINA: TStringField
      FieldName = 'CLI_PAGINA'
      Size = 60
    end
    object cdsClientesCODIGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODIGO'
      Size = 7
      Calculated = True
    end
    object cdsClientesFONE1: TStringField
      FieldKind = fkCalculated
      FieldName = 'FONE1'
      Size = 13
      Calculated = True
    end
    object cdsClientesFONE2: TStringField
      FieldKind = fkCalculated
      FieldName = 'FONE2'
      Size = 13
      Calculated = True
    end
    object cdsClientesFONE3: TStringField
      FieldKind = fkCalculated
      FieldName = 'FONE3'
      Size = 13
      Calculated = True
    end
    object cdsClientesCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsClientesCLI_NRCPFCGC: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CLI_NRCPFCGC'
      Size = 18
    end
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 216
    Top = 128
  end
  object ppRepFichaCliente: TppReport
    AutoStop = False
    DataPipeline = ppDBFichaCliente
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbFichaCliente.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 384
    Top = 128
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBFichaCliente'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELA'#199#195'O DE CLIENTES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 138642
        mmTop = 1058
        mmWidth = 42598
        BandType = 0
      end
      object txtTipo: TppLabel
        UserName = 'Label8'
        Caption = 'Label8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 138907
        mmTop = 6085
        mmWidth = 10583
        BandType = 0
      end
      object txtRegiao: TppLabel
        UserName = 'Label21'
        Caption = 'Label21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 10583
        mmWidth = 12435
        BandType = 0
      end
      object txtFluxo: TppLabel
        UserName = 'Label25'
        Caption = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 19315
        mmWidth = 12435
        BandType = 0
      end
      object txtOrdem: TppLabel
        UserName = 'txtOrdem'
        Caption = 'txtOrdem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 138907
        mmTop = 14817
        mmWidth = 14817
        BandType = 0
      end
      object txtSituacao: TppLabel
        UserName = 'txtSituacao'
        Caption = 'SITUA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 24606
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 75406
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#211'DIGO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 15663
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CODIGO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4064
        mmLeft = 1058
        mmTop = 6615
        mmWidth = 14478
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'TIPO DE PESSOA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 53711
        mmTop = 2117
        mmWidth = 30141
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CLI_NMTPPESSOA'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 3969
        mmLeft = 53711
        mmTop = 6615
        mmWidth = 32808
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FANTASIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 10848
        mmWidth = 18965
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CLI_FANTASIA'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 1059
        mmTop = 15346
        mmWidth = 41825
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'RAZ'#195'O SOCIAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1059
        mmTop = 19844
        mmWidth = 28025
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CLI_RAZAO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 1059
        mmTop = 24342
        mmWidth = 41825
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'ENDERE'#199'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 28840
        mmWidth = 21251
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CLI_ENDERECO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 33338
        mmWidth = 71078
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CLI_NUMERO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 101600
        mmTop = 33338
        mmWidth = 23029
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'NUMERO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 28840
        mmWidth = 16933
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 28840
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CLI_CEP'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 127000
        mmTop = 33338
        mmWidth = 15579
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'CIDADE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 37835
        mmWidth = 14647
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CLI_NMCIDADE'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 794
        mmTop = 42333
        mmWidth = 22056
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'BAIRRO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 37835
        mmWidth = 15071
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CLI_NMBAIRRO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 101336
        mmTop = 42333
        mmWidth = 14901
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'FONE 01:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 46567
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'FONE1'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4064
        mmLeft = 794
        mmTop = 51065
        mmWidth = 11853
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'RAMAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 46567
        mmWidth = 13801
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'CLI_RAMAL1'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 22490
        mmTop = 51065
        mmWidth = 21421
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'FONE 02:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 49213
        mmTop = 46567
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'FONE2'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4064
        mmLeft = 49213
        mmTop = 51065
        mmWidth = 11853
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'RAMAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 46567
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'CLI_RAMAL2'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 51065
        mmWidth = 21421
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'FONE 03:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 46567
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'FONE3'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4064
        mmLeft = 101336
        mmTop = 51065
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'CLI_RAMAL3'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 126736
        mmTop = 51065
        mmWidth = 21421
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'RAMAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 126736
        mmTop = 46567
        mmWidth = 13758
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'CNPJ/CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 55563
        mmWidth = 18711
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'INSC.EST./RG.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 49213
        mmTop = 55563
        mmWidth = 26077
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'CLI_INSCESTADUAL'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 49213
        mmTop = 60061
        mmWidth = 34332
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = #211'RG'#195'O EMISSOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 55563
        mmWidth = 32004
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'CLI_ORGAOEMISSOR'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 101336
        mmTop = 60061
        mmWidth = 6985
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 133615
        mmTop = 55563
        mmWidth = 5927
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CLI_UFEMISSOR'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 3979
        mmLeft = 133615
        mmTop = 60061
        mmWidth = 19579
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'DATA NASCIMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 64294
        mmWidth = 35814
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'CLI_DTANIVERSARIO'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 794
        mmTop = 68792
        mmWidth = 17526
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'HOME PAGE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 49213
        mmTop = 64294
        mmWidth = 22860
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText201'
        AutoSize = True
        DataField = 'CLI_PAGINA'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 49213
        mmTop = 68792
        mmWidth = 20659
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'CLI_UFCLIENTE'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 4022
        mmLeft = 90223
        mmTop = 42333
        mmWidth = 3302
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label101'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 90223
        mmTop = 37835
        mmWidth = 5927
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CLI_NRCPFCGC'
        DataPipeline = ppDBFichaCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBFichaCliente'
        mmHeight = 3979
        mmLeft = 794
        mmTop = 60061
        mmWidth = 46821
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
  end
  object ppDBFichaCliente: TppDBPipeline
    DataSource = dsClientes
    UserName = 'DBFichaCliente'
    Left = 288
    Top = 128
    object ppDBFichaClienteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CODIGO'
      FieldName = 'CLI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBFichaClienteppField2: TppField
      FieldAlias = 'CLI_FANTASIA'
      FieldName = 'CLI_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBFichaClienteppField3: TppField
      FieldAlias = 'CLI_RAZAO'
      FieldName = 'CLI_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBFichaClienteppField4: TppField
      FieldAlias = 'CLI_TIPOPESSOA'
      FieldName = 'CLI_TIPOPESSOA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppDBFichaClienteppField5: TppField
      FieldAlias = 'CLI_CGC'
      FieldName = 'CLI_CGC'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object ppDBFichaClienteppField6: TppField
      FieldAlias = 'CLI_ENDERECO'
      FieldName = 'CLI_ENDERECO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBFichaClienteppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_NUMERO'
      FieldName = 'CLI_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBFichaClienteppField8: TppField
      FieldAlias = 'CLI_CEP'
      FieldName = 'CLI_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object ppDBFichaClienteppField9: TppField
      FieldAlias = 'CLI_FONE1'
      FieldName = 'CLI_FONE1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBFichaClienteppField10: TppField
      FieldAlias = 'CLI_INSCESTADUAL'
      FieldName = 'CLI_INSCESTADUAL'
      FieldLength = 14
      DisplayWidth = 14
      Position = 9
    end
    object ppDBFichaClienteppField11: TppField
      FieldAlias = 'CLI_ORGAOEMISSOR'
      FieldName = 'CLI_ORGAOEMISSOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppDBFichaClienteppField12: TppField
      FieldAlias = 'CLI_UFEMISSOR'
      FieldName = 'CLI_UFEMISSOR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 11
    end
    object ppDBFichaClienteppField13: TppField
      FieldAlias = 'CLI_DTANIVERSARIO'
      FieldName = 'CLI_DTANIVERSARIO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object ppDBFichaClienteppField14: TppField
      FieldAlias = 'CLI_NMTPPESSOA'
      FieldName = 'CLI_NMTPPESSOA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppDBFichaClienteppField15: TppField
      FieldAlias = 'CLI_NMCIDADE'
      FieldName = 'CLI_NMCIDADE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 14
    end
    object ppDBFichaClienteppField16: TppField
      FieldAlias = 'CLI_NMBAIRRO'
      FieldName = 'CLI_NMBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDBFichaClienteppField17: TppField
      FieldAlias = 'CLI_FONE2'
      FieldName = 'CLI_FONE2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppDBFichaClienteppField18: TppField
      FieldAlias = 'CLI_FONE3'
      FieldName = 'CLI_FONE3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDBFichaClienteppField19: TppField
      FieldAlias = 'CLI_RAMAL1'
      FieldName = 'CLI_RAMAL1'
      FieldLength = 4
      DisplayWidth = 4
      Position = 18
    end
    object ppDBFichaClienteppField20: TppField
      FieldAlias = 'CLI_RAMAL2'
      FieldName = 'CLI_RAMAL2'
      FieldLength = 4
      DisplayWidth = 4
      Position = 19
    end
    object ppDBFichaClienteppField21: TppField
      FieldAlias = 'CLI_RAMAL3'
      FieldName = 'CLI_RAMAL3'
      FieldLength = 4
      DisplayWidth = 4
      Position = 20
    end
    object ppDBFichaClienteppField22: TppField
      FieldAlias = 'CLI_FAX'
      FieldName = 'CLI_FAX'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppDBFichaClienteppField23: TppField
      FieldAlias = 'CLI_PAGINA'
      FieldName = 'CLI_PAGINA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 22
    end
    object ppDBFichaClienteppField24: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 23
    end
    object ppDBFichaClienteppField25: TppField
      FieldAlias = 'FONE1'
      FieldName = 'FONE1'
      FieldLength = 13
      DisplayWidth = 13
      Position = 24
    end
    object ppDBFichaClienteppField26: TppField
      FieldAlias = 'FONE2'
      FieldName = 'FONE2'
      FieldLength = 13
      DisplayWidth = 13
      Position = 25
    end
    object ppDBFichaClienteppField27: TppField
      FieldAlias = 'FONE3'
      FieldName = 'FONE3'
      FieldLength = 13
      DisplayWidth = 13
      Position = 26
    end
    object ppDBFichaClienteppField28: TppField
      FieldAlias = 'CLI_UFCLIENTE'
      FieldName = 'CLI_UFCLIENTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 27
    end
    object ppDBFichaClienteppField29: TppField
      FieldAlias = 'CLI_NRCPFCGC'
      FieldName = 'CLI_NRCPFCGC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 28
    end
  end
  object dstVendedores: TSQLDataSet
    CommandText = 
      'select FUN_CODIGO, FUN_NOME, FUN_CEP, FUN_PECOMI, FUN_TPFUNC, FU' +
      'N_FONE from FUNCIONARIOS Where (FUN_TPFUNC = :pTPFUNC) order by ' +
      'FUN_NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pTPFUNC'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 184
  end
  object dspVendedores: TDataSetProvider
    DataSet = dstVendedores
    Options = [poAllowCommandText]
    Left = 96
    Top = 184
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pTPFUNC'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspVendedores'
    OnCalcFields = cdsVendedoresCalcFields
    Left = 176
    Top = 184
    object cdsVendedoresFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsVendedoresFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsVendedoresFUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      FixedChar = True
      Size = 10
    end
    object cdsVendedoresCODIGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODIGO'
      Size = 5
      Calculated = True
    end
    object cdsVendedoresFONE: TStringField
      FieldKind = fkCalculated
      FieldName = 'FONE'
      Size = 13
      Calculated = True
    end
    object cdsVendedoresFUN_PECOMI: TBCDField
      FieldName = 'FUN_PECOMI'
      Precision = 9
      Size = 2
    end
  end
  object dsVendedores: TDataSource
    DataSet = cdsVendedores
    Left = 248
    Top = 184
  end
  object ppDBVendedores: TppDBPipeline
    DataSource = dsVendedores
    UserName = 'DBFichaCliente1'
    Left = 328
    Top = 184
  end
  object ppRepVendedores: TppReport
    AutoStop = False
    DataPipeline = ppDBVendedores
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\EMPRESA\SERVICO\DELPHI\Relatorios\rbRelVendedores.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 416
    Top = 184
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBVendedores'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 0
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label1'
        Caption = 'RELA'#199#195'O DE VENDEDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 144992
        mmTop = 1058
        mmWidth = 48683
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 24342
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 25400
        mmWidth = 14478
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 25400
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 111919
        mmTop = 25400
        mmWidth = 16669
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 29898
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'CODIGO'
        DataPipeline = ppDBVendedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4064
        mmLeft = 1058
        mmTop = 434
        mmWidth = 14478
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = 'FUN_NOME'
        DataPipeline = ppDBVendedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4064
        mmLeft = 17198
        mmTop = 434
        mmWidth = 19897
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'FONE'
        DataPipeline = ppDBVendedores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBVendedores'
        mmHeight = 4064
        mmLeft = 111919
        mmTop = 434
        mmWidth = 9906
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLVENDA from P' +
      'RODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 232
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 96
    Top = 232
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 168
    Top = 232
  end
  object dstVendas: TSQLDataSet
    CommandText = 
      'Select V.MOV_PEDIDO, V.MOV_LOJA, V.MOV_SEQUENCIA, V.MOV_CLIENTE,' +
      #13#10'CL.CLI_FANTASIA, CLI_RAZAO, CL.CLI_ENDERECO, CL.CLI_CEP, CL.CL' +
      'I_CGC, CL.cli_fone1, '#13#10'CL.CLI_FAX, CL.CLI_INSCESTADUAL, CL.CLI_U' +
      'FCLIENTE, CI.CID_NOME, CL.BAI_CODIGO, CL.CLI_NUMERO, '#13#10'CL.CLI_EN' +
      'D_COBRANCA,'#13#10'V.MOV_DATAVENDA, V.MOV_VALOR, V.MOV_SITUACAO,'#13#10'V.MO' +
      'V_NOMECLIENTE, V.MOV_TABELA, V.DOM_BAIRRO,'#13#10'V.MOV_TIPO_FRETE, V.' +
      'MOV_PERC_FRETE, V.MOV_TABELA_PLANO,'#13#10'V.MOV_OBSERVACAO, MOV_MODAL' +
      'IDADE_PEDIDO, MOV_OBS1, MOV_OBS2,'#13#10'(Select B.BAI_NOME from BAIRR' +
      'OS B Where (B.BAI_CODIGO = CL.BAI_CODIGO)) as BAIRRO,'#13#10'(Select T' +
      '.TRP_NOME from TRANSPORTADORA T Where (T.TRP_CODIGO = V.MOV_IDTR' +
      'ANSPORTADORA)) as TRANSPORTADORA,'#13#10'(Select TP.PRC_DESCRICAO from' +
      ' TAB_PRECOS TP Where (TP.PRC_CODIGO = V.MOV_TABELA)) as NOME_TAB' +
      #13#10'from VENDAS V'#13#10'INNER join CLIENTES CL ON V.MOV_CLIENTE = CL.CL' +
      'I_CODIGO'#13#10'INNER join CIDADES  CI ON CL.CID_CODIGO = CI.CID_CODIG' +
      'O'#13#10'Where (V.MOV_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 296
  end
  object dspVenda: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    Left = 80
    Top = 288
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspVenda'
    Left = 144
    Top = 288
    object cdsVendasMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsVendasMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsVendasMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
    end
    object cdsVendasMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsVendasCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsVendasCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object cdsVendasCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsVendasCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsVendasCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsVendasCLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsVendasCLI_INSCESTADUAL: TStringField
      FieldName = 'CLI_INSCESTADUAL'
      Size = 14
    end
    object cdsVendasMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsVendasMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsVendasCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsVendasCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsVendasDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      Size = 30
    end
    object cdsVendasCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsVendasBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsVendasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ReadOnly = True
    end
    object cdsVendasTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      ReadOnly = True
      Size = 50
    end
    object cdsVendasMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsVendasNOME_TAB: TStringField
      FieldName = 'NOME_TAB'
      ReadOnly = True
      Size = 40
    end
    object cdsVendasCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsVendasMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
    object cdsVendasMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsVendasCLI_END_COBRANCA: TStringField
      FieldName = 'CLI_END_COBRANCA'
      Size = 50
    end
    object cdsVendasMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
    end
    object cdsVendasMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      BlobType = ftMemo
    end
    object cdsVendasMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      BlobType = ftMemo
    end
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 208
    Top = 288
  end
  object ppRepVendas: TppReport
    AutoStop = False
    DataPipeline = ppDBPItensVenda
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelOrcamento.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 296
    Top = 304
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPItensVenda'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 98161
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 25400
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 193146
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 21696
        mmLeft = 4498
        mmTop = 2646
        mmWidth = 107950
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'P E D I D O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 115623
        mmTop = 1852
        mmWidth = 25665
        BandType = 0
      end
      object txtPedido: TppLabel
        UserName = 'txtPedido'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 128323
        mmTop = 8467
        mmWidth = 61648
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 25135
        mmLeft = 113506
        mmTop = 1058
        mmWidth = 2646
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 113771
        mmTop = 15081
        mmWidth = 81756
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Shape = stRoundRect
        mmHeight = 55033
        mmLeft = 2381
        mmTop = 27252
        mmWidth = 193146
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'RAZ'#195'O SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 6879
        mmTop = 27781
        mmWidth = 20659
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'C'#243'digo Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 160338
        mmTop = 27781
        mmWidth = 17695
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2646
        mmTop = 34925
        mmWidth = 192882
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2646
        mmTop = 41804
        mmWidth = 192882
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 49213
        mmWidth = 192882
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 56092
        mmWidth = 192882
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3704
        mmTop = 35190
        mmWidth = 11599
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 35190
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 42333
        mmWidth = 5757
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 53711
        mmTop = 42333
        mmWidth = 8551
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161396
        mmTop = 42333
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 49742
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label401'
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 53446
        mmTop = 49742
        mmWidth = 4403
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 98161
        mmTop = 49742
        mmWidth = 7366
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Inscri'#231#227'o Estadual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 143669
        mmTop = 49742
        mmWidth = 22352
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label402'
        Caption = 'Endere'#231'o de Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 3969
        mmTop = 56356
        mmWidth = 26755
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Endere'#231'o de Cobran'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 63236
        mmWidth = 27855
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2646
        mmTop = 69321
        mmWidth = 192882
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 51594
        mmTop = 41804
        mmWidth = 1058
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 119327
        mmTop = 35190
        mmWidth = 1058
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 97102
        mmTop = 49213
        mmWidth = 794
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 142082
        mmTop = 49213
        mmWidth = 1058
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 159544
        mmTop = 41804
        mmWidth = 1058
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 158486
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 62971
        mmWidth = 192882
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2117
        mmTop = 75671
        mmWidth = 192882
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 14552
        mmLeft = 2381
        mmTop = 83344
        mmWidth = 193146
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Frete:CIF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 3440
        mmTop = 70908
        mmWidth = 11980
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Condi'#231#245'es de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 69586
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 135996
        mmTop = 69586
        mmWidth = 13758
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13229
        mmLeft = 66146
        mmTop = 69321
        mmWidth = 529
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 134144
        mmTop = 69321
        mmWidth = 794
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 121973
        mmTop = 75671
        mmWidth = 794
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Fone do Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 75936
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 123031
        mmTop = 75936
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'C'#211'DIGO/REF.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 5821
        mmTop = 88636
        mmWidth = 18754
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 31221
        mmTop = 88636
        mmWidth = 10499
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'DESCRI'#199#195'O DOS PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 44450
        mmTop = 88636
        mmWidth = 39624
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'VALOR UNIT'#193'RIO L'#205'QUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11113
        mmLeft = 131498
        mmTop = 84138
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'VALOR TOTAL DO ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10848
        mmLeft = 152136
        mmTop = 84138
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 174361
        mmTop = 87577
        mmWidth = 3175
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 29369
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 43392
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 128059
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 169863
        mmTop = 83344
        mmWidth = 1323
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line401'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 148167
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'CLI_RAZAO'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3725
        mmLeft = 6879
        mmTop = 31221
        mmWidth = 132027
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CLI_ENDERECO'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3302
        mmLeft = 3704
        mmTop = 38365
        mmWidth = 110331
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'BAIRRO'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 38365
        mmWidth = 73554
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'CLI_CEP'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 45773
        mmWidth = 30427
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'CID_NOME'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 53711
        mmTop = 45773
        mmWidth = 98954
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'CLI_UFCLIENTE'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 161132
        mmTop = 45773
        mmWidth = 30427
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'CLI_CGC'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 98161
        mmTop = 52917
        mmWidth = 42333
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'CLI_INSCESTADUAL'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 52917
        mmWidth = 49477
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'CLI_ENDERECO'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 59267
        mmWidth = 110331
        BandType = 0
      end
      object txtFormaPagamento: TppLabel
        UserName = 'txtFormaPagamento'
        Caption = 'XXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 67469
        mmTop = 72761
        mmWidth = 5334
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label1'
        Caption = 'REFER'#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3302
        mmLeft = 116417
        mmTop = 88636
        mmWidth = 10000
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label2'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 115623
        mmTop = 16140
        mmWidth = 19579
        BandType = 0
      end
      object txtFornecedor: TppLabel
        UserName = 'txtFornecedor'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 115623
        mmTop = 20902
        mmWidth = 3048
        BandType = 0
      end
      object txtCDCLIE: TppLabel
        UserName = 'txtCDCLIE'
        Caption = 'txtCDCLIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 160338
        mmTop = 31221
        mmWidth = 23548
        BandType = 0
      end
      object txtFone2: TppLabel
        UserName = 'txtFone2'
        Caption = 'txtFone2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 52652
        mmWidth = 24871
        BandType = 0
      end
      object txtFax2: TppLabel
        UserName = 'txtFax2'
        Caption = 'txtFone2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 52652
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label118'
        Caption = 'Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 7144
        mmTop = 75936
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'TRANSPORTADORA'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 78581
        mmWidth = 58738
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'NOME_TAB'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3175
        mmLeft = 135996
        mmTop = 72496
        mmWidth = 57679
        BandType = 0
      end
      object cbkCIF: TmyCheckBox
        UserName = 'cbkCIF'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 16933
        mmTop = 69586
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = 'FOB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 23283
        mmTop = 70908
        mmWidth = 5842
        BandType = 0
      end
      object cbkFOB: TmyCheckBox
        UserName = 'cbkFOB'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 30427
        mmTop = 69586
        mmWidth = 6350
        BandType = 0
      end
      object txtPercFrete1: TppLabel
        UserName = 'txtPercFrete1'
        Caption = 'Valor Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 35719
        mmTop = 69586
        mmWidth = 14012
        BandType = 0
      end
      object txtValorFrete: TppLabel
        UserName = 'txtValorFrete1'
        Caption = 'Valor Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 50271
        mmTop = 72761
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        Caption = 'COR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 105569
        mmTop = 88900
        mmWidth = 6265
        BandType = 0
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'CLI_NUMERO'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3260
        mmLeft = 118004
        mmTop = 59267
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label121'
        Caption = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 114829
        mmTop = 59267
        mmWidth = 1588
        BandType = 0
      end
      object txtPercFrete: TppLabel
        UserName = 'txtPercFrete'
        Caption = 'txtPercFrete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 48885
        mmTop = 69586
        mmWidth = 15409
        BandType = 0
      end
      object txtFoneRepresentante: TppLabel
        UserName = 'txtFoneRepresentante'
        Caption = 'txtFoneRepresentante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 67469
        mmTop = 79111
        mmWidth = 27940
        BandType = 0
      end
      object txtNmRepresentanta: TppLabel
        UserName = 'txtNmRepresentanta'
        Caption = 'txtNmRepresentanta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 123031
        mmTop = 79111
        mmWidth = 25950
        BandType = 0
      end
      object ppLine102: TppLine
        UserName = 'Line402'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 182298
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label123'
        Caption = 'DESC.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 184680
        mmTop = 87577
        mmWidth = 8678
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'CLI_END_COBRANCA'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3260
        mmLeft = 3969
        mmTop = 66146
        mmWidth = 110331
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label126'
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 118004
        mmTop = 56356
        mmWidth = 10075
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ITE_REFERE'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3598
        mmLeft = 5821
        mmTop = 100
        mmWidth = 19558
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'ITE_QTITEN'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3429
        mmLeft = 30427
        mmTop = 100
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'ITE_NMDESC'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3429
        mmLeft = 44450
        mmTop = 100
        mmWidth = 59267
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'ITE_VLUNIT'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 129646
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'ITE_VLSUBT'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'ITE_VALIPI'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 3969
        mmWidth = 193146
        BandType = 4
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 29369
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 43392
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 128059
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 148167
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 169863
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 195263
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine48: TppLine
        UserName = 'Line48'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 2381
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'ITE_REFERE'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3429
        mmLeft = 116417
        mmTop = 100
        mmWidth = 10000
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'ITE_NOMCOR'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3429
        mmLeft = 105569
        mmTop = 100
        mmWidth = 17198
        BandType = 4
      end
      object ppLine103: TppLine
        UserName = 'Line103'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 182298
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'ITE_VLDESC'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 183092
        mmTop = 265
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel124: TppLabel
        UserName = 'Label124'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191823
        mmTop = 265
        mmWidth = 2910
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object lbl_Rodape: TppLabel
        UserName = 'lbl_Rodape'
        Caption = 
          'Avenida Jos'#233' dos Santos e Silva, 1969/N - Salas 108 - Centro - T' +
          'eresina - Piau'#237' - E-mail: sac@infog2.com.br - Fone/Fax(86) 3226-' +
          '4510 - Cel.:(86) 8814-0597'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 194205
        BandType = 8
      end
      object ppLine90: TppLine
        UserName = 'Line90'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 11906
        mmWidth = 12700
        BandType = 8
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 148696
        mmTop = 7673
        mmWidth = 15579
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 165365
        mmTop = 7673
        mmWidth = 30427
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 165629
        mmTop = 11906
        mmWidth = 1778
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 70908
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Shape = stRoundRect
        mmHeight = 59796
        mmLeft = 2117
        mmTop = 8731
        mmWidth = 193146
        BandType = 7
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 9790
        mmWidth = 24342
        BandType = 7
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 43127
        mmWidth = 192882
        BandType = 7
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'Data: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 46567
        mmWidth = 9525
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 3440
        mmTop = 62971
        mmWidth = 53711
        BandType = 7
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 61913
        mmTop = 62971
        mmWidth = 55033
        BandType = 7
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24077
        mmTop = 63765
        mmWidth = 8467
        BandType = 7
      end
      object ppLabel61: TppLabel
        UserName = 'Label601'
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 80169
        mmTop = 63765
        mmWidth = 18521
        BandType = 7
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24606
        mmLeft = 120121
        mmTop = 43392
        mmWidth = 2646
        BandType = 7
      end
      object ppLine32: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 120121
        mmTop = 50006
        mmWidth = 72761
        BandType = 7
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 120121
        mmTop = 56092
        mmWidth = 72761
        BandType = 7
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 157692
        mmTop = 43392
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'SUB TOTAL           R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121179
        mmTop = 45508
        mmWidth = 36248
        BandType = 7
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'TOTAL PEDIDO  = R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121179
        mmTop = 64029
        mmWidth = 35719
        BandType = 7
      end
      object txtSubTotal: TppLabel
        UserName = 'txtSubTotal'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179388
        mmTop = 45508
        mmWidth = 6879
        BandType = 7
      end
      object txtIPI: TppLabel
        UserName = 'txtSubTotal1'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179388
        mmTop = 57679
        mmWidth = 6879
        BandType = 7
      end
      object txtTOTAL: TppLabel
        UserName = 'txtSubTotal2'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179388
        mmTop = 64029
        mmWidth = 6879
        BandType = 7
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        AutoSize = True
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 46567
        mmWidth = 31411
        BandType = 7
      end
      object ppLine91: TppLine
        UserName = 'Line901'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = 'IPI      (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 57679
        mmWidth = 14552
        BandType = 7
      end
      object txtObservacao: TppMemo
        UserName = 'txtObservacao'
        Caption = 'txtObservacao'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 28575
        mmLeft = 5821
        mmTop = 13494
        mmWidth = 183621
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object txtPercIPI: TppLabel
        UserName = 'txtPercIPI'
        Caption = '0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 57679
        mmWidth = 9790
        BandType = 7
      end
      object ppLine104: TppLine
        UserName = 'Line104'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 120386
        mmTop = 62177
        mmWidth = 72761
        BandType = 7
      end
      object ppLabel125: TppLabel
        UserName = 'Label125'
        Caption = 'DESCONTOS ( - )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 51594
        mmWidth = 28840
        BandType = 7
      end
      object txtDesconto: TppLabel
        UserName = 'txtDesconto'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179388
        mmTop = 51594
        mmWidth = 6879
        BandType = 7
      end
    end
  end
  object ppDBPItensVenda: TppDBPipeline
    DataSource = dmConsultas.dsItemVendas
    UserName = 'DBPItensVenda'
    Left = 384
    Top = 304
    object ppDBPItensVendappField1: TppField
      FieldAlias = 'ITE_NRITEN'
      FieldName = 'ITE_NRITEN'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppDBPItensVendappField2: TppField
      FieldAlias = 'ITE_CDITEN'
      FieldName = 'ITE_CDITEN'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDBPItensVendappField3: TppField
      FieldAlias = 'ITE_NMDESC'
      FieldName = 'ITE_NMDESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBPItensVendappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITE_QTITEN'
      FieldName = 'ITE_QTITEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPItensVendappField5: TppField
      FieldAlias = 'ITE_CDUNID'
      FieldName = 'ITE_CDUNID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPItensVendappField6: TppField
      FieldAlias = 'ITE_VLUNIT'
      FieldName = 'ITE_VLUNIT'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPItensVendappField7: TppField
      FieldAlias = 'ITE_VLSUBT'
      FieldName = 'ITE_VLSUBT'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPItensVendappField8: TppField
      FieldAlias = 'ITE_FLCANC'
      FieldName = 'ITE_FLCANC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppDBPItensVendappField9: TppField
      FieldAlias = 'ITE_VLCOMP'
      FieldName = 'ITE_VLCOMP'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPItensVendappField10: TppField
      FieldAlias = 'ITE_VLCUST'
      FieldName = 'ITE_VLCUST'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPItensVendappField11: TppField
      FieldAlias = 'ITE_NRLOTE'
      FieldName = 'ITE_NRLOTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppDBPItensVendappField12: TppField
      FieldAlias = 'ITE_CDBAIX'
      FieldName = 'ITE_CDBAIX'
      FieldLength = 13
      DisplayWidth = 13
      Position = 11
    end
    object ppDBPItensVendappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITE_VLDESC'
      FieldName = 'ITE_VLDESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPItensVendappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITE_VLACRE'
      FieldName = 'ITE_VLACRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPItensVendappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITE_VALIPI'
      FieldName = 'ITE_VALIPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPItensVendappField16: TppField
      FieldAlias = 'ITE_REFERE'
      FieldName = 'ITE_REFERE'
      FieldLength = 14
      DisplayWidth = 14
      Position = 15
    end
    object ppDBPItensVendappField17: TppField
      FieldAlias = 'ITE_VLSUBTOT2'
      FieldName = 'ITE_VLSUBTOT2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPItensVendappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'ITE_CODCOR'
      FieldName = 'ITE_CODCOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPItensVendappField19: TppField
      FieldAlias = 'ITE_NOMCOR'
      FieldName = 'ITE_NOMCOR'
      FieldLength = 25
      DisplayWidth = 25
      Position = 18
    end
  end
  object ppDBPVendas: TppDBPipeline
    DataSource = dsVendas
    UserName = 'DBPVendas'
    Left = 304
    Top = 248
  end
  object ppRepOrcamento: TppReport
    AutoStop = False
    DataPipeline = ppDBPItensVenda
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbRelOrcamento.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 248
    Top = 16
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPItensVenda'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 98161
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape1'
        mmHeight = 25400
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 193146
        BandType = 0
      end
      object ppDBImage4: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 21696
        mmLeft = 4498
        mmTop = 2646
        mmWidth = 107950
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label32'
        Caption = 'OR'#199'AMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 115623
        mmTop = 1852
        mmWidth = 40746
        BandType = 0
      end
      object txtOrcamento: TppLabel
        UserName = 'txtPedido'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 128323
        mmTop = 8467
        mmWidth = 62442
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 25135
        mmLeft = 113506
        mmTop = 1058
        mmWidth = 2646
        BandType = 0
      end
      object ppLine49: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 113771
        mmTop = 15081
        mmWidth = 81756
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape2'
        Shape = stRoundRect
        mmHeight = 55033
        mmLeft = 2381
        mmTop = 27252
        mmWidth = 193146
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label33'
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 6879
        mmTop = 27781
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label34'
        Caption = 'C'#243'digo Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 160338
        mmTop = 27781
        mmWidth = 17695
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2646
        mmTop = 34925
        mmWidth = 192882
        BandType = 0
      end
      object ppLine51: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2646
        mmTop = 41804
        mmWidth = 192882
        BandType = 0
      end
      object ppLine52: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 49213
        mmWidth = 192882
        BandType = 0
      end
      object ppLine53: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 56092
        mmWidth = 192882
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label35'
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3704
        mmTop = 35190
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label36'
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 35190
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label37'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 42333
        mmWidth = 5757
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label38'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 53711
        mmTop = 42333
        mmWidth = 8551
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label39'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 161396
        mmTop = 42333
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label40'
        Caption = 'Fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 49742
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label401'
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 53446
        mmTop = 49742
        mmWidth = 4403
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label42'
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 98161
        mmTop = 49742
        mmWidth = 7366
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label43'
        Caption = 'Inscri'#231#227'o Estadual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 143669
        mmTop = 49742
        mmWidth = 22352
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label402'
        Caption = 'Endere'#231'o de Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 56356
        mmWidth = 25569
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label45'
        Caption = 'Endere'#231'o de Cobran'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3969
        mmTop = 63236
        mmWidth = 27855
        BandType = 0
      end
      object ppLine54: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2646
        mmTop = 69321
        mmWidth = 192882
        BandType = 0
      end
      object ppLine55: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 51594
        mmTop = 41804
        mmWidth = 1058
        BandType = 0
      end
      object ppLine56: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 119327
        mmTop = 35190
        mmWidth = 1058
        BandType = 0
      end
      object ppLine57: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 97102
        mmTop = 49213
        mmWidth = 794
        BandType = 0
      end
      object ppLine58: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 142082
        mmTop = 49213
        mmWidth = 1058
        BandType = 0
      end
      object ppLine59: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 159544
        mmTop = 41804
        mmWidth = 1058
        BandType = 0
      end
      object ppLine60: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 158486
        mmTop = 27517
        mmWidth = 1058
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 62971
        mmWidth = 192882
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2117
        mmTop = 75671
        mmWidth = 192882
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape3'
        mmHeight = 14552
        mmLeft = 2381
        mmTop = 83344
        mmWidth = 193146
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label46'
        Caption = 'Frete:CIF _____________ FOB _____________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 3440
        mmTop = 71967
        mmWidth = 59182
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label47'
        Caption = 'Condi'#231#245'es de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 69586
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label48'
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 135996
        mmTop = 69586
        mmWidth = 13758
        BandType = 0
      end
      object ppLine63: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13229
        mmLeft = 66146
        mmTop = 69321
        mmWidth = 529
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 134144
        mmTop = 69321
        mmWidth = 794
        BandType = 0
      end
      object ppLine65: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 121973
        mmTop = 75671
        mmWidth = 794
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label49'
        Caption = 'Fone do Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 75936
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'Label50'
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 123031
        mmTop = 75936
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label51'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 5821
        mmTop = 88636
        mmWidth = 11176
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label52'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 34925
        mmTop = 88636
        mmWidth = 10499
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label53'
        Caption = 'DESCRI'#199#195'O DOS PRODUTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 53711
        mmTop = 88636
        mmWidth = 39624
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label54'
        Caption = 'VALOR UNIT'#193'RIO L'#205'QUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11113
        mmLeft = 139965
        mmTop = 84138
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label55'
        Caption = 'VALOR TOTAL DO ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10848
        mmLeft = 177007
        mmTop = 84667
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label56'
        Caption = 'IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 162190
        mmTop = 88371
        mmWidth = 3175
        BandType = 0
      end
      object ppLine66: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 32279
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine67: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 47096
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 135202
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine69: TppLine
        UserName = 'Line40'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 172244
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'Line401'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14552
        mmLeft = 157427
        mmTop = 83608
        mmWidth = 1323
        BandType = 0
      end
      object txtCondPaga: TppLabel
        UserName = 'txtFormaPagamento'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 67469
        mmTop = 72761
        mmWidth = 1778
        BandType = 0
      end
      object txtRazao: TppLabel
        UserName = 'txtRazao'
        Caption = 'txtRazao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 30956
        mmWidth = 137848
        BandType = 0
      end
      object txtEndereco: TppLabel
        UserName = 'txtEndereco'
        Caption = 'txtEndereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 38365
        mmWidth = 108744
        BandType = 0
      end
      object txtFone: TppLabel
        UserName = 'txtFone'
        Caption = 'txtFone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 52917
        mmWidth = 38894
        BandType = 0
      end
      object txtCep: TppLabel
        UserName = 'txtCep'
        Caption = 'txtCep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 45773
        mmWidth = 33602
        BandType = 0
      end
      object txtFax: TppLabel
        UserName = 'txtFax'
        Caption = 'txtFax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 52917
        mmWidth = 34131
        BandType = 0
      end
      object txtCNPJ: TppLabel
        UserName = 'txtCNPJ'
        Caption = 'txtCNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 98161
        mmTop = 52917
        mmWidth = 41275
        BandType = 0
      end
      object txtEndereco2: TppLabel
        UserName = 'txtEndereco1'
        Caption = 'txtEndereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 59796
        mmWidth = 110861
        BandType = 0
      end
      object txtCodigo: TppLabel
        UserName = 'txtCodigo'
        Caption = 'txtCodigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 160338
        mmTop = 31221
        mmWidth = 11345
        BandType = 0
      end
      object txtBairro: TppLabel
        UserName = 'txtBairro'
        Caption = 'txtBairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 38629
        mmWidth = 70908
        BandType = 0
      end
      object txtUF: TppLabel
        UserName = 'txtUF'
        Caption = 'txtUF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 161396
        mmTop = 45773
        mmWidth = 6519
        BandType = 0
      end
      object txtInscricao: TppLabel
        UserName = 'txtInscricao'
        Caption = 'txtInscricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 53181
        mmWidth = 49742
        BandType = 0
      end
      object txtFornecedor2: TppLabel
        UserName = 'txtFornecedor2'
        Caption = 'txtFornecedor2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 115359
        mmTop = 20638
        mmWidth = 23876
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 115359
        mmTop = 15875
        mmWidth = 18034
        BandType = 0
      end
      object txtCidade2: TppLabel
        UserName = 'txtCidade2'
        Caption = 'txtCidade2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3302
        mmLeft = 53711
        mmTop = 45773
        mmWidth = 12869
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText57: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ITE_CDITEN'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 4064
        mmLeft = 10213
        mmTop = 100
        mmWidth = 20743
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText27'
        DataField = 'ITE_QTITEN'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 33338
        mmTop = 100
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText28'
        DataField = 'ITE_NMDESC'
        DataPipeline = ppDBPItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 50006
        mmTop = 100
        mmWidth = 83344
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText29'
        DataField = 'ITE_VLUNIT'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 136525
        mmTop = 100
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText30'
        DataField = 'ITE_VLSUBT'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 174625
        mmTop = 100
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText31'
        DataField = 'ITE_VALIPI'
        DataPipeline = ppDBPItensVenda
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPItensVenda'
        mmHeight = 3440
        mmLeft = 159809
        mmTop = 100
        mmWidth = 7938
        BandType = 4
      end
      object ppLabel92: TppLabel
        UserName = 'Label57'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 168011
        mmTop = 100
        mmWidth = 3133
        BandType = 4
      end
      object ppLine71: TppLine
        UserName = 'Line35'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 3969
        mmWidth = 193146
        BandType = 4
      end
      object ppLine72: TppLine
        UserName = 'Line42'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 32279
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine73: TppLine
        UserName = 'Line43'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 47096
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine74: TppLine
        UserName = 'Line44'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 135202
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine75: TppLine
        UserName = 'Line45'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 157427
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine76: TppLine
        UserName = 'Line46'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 172244
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine77: TppLine
        UserName = 'Line47'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 195263
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine78: TppLine
        UserName = 'Line48'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 2381
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel100: TppLabel
        UserName = 'lbl_Rodape'
        Caption = 
          'Rua Coelho Rodrigues, 1213/N - Salas 302/303 - Centro - Teresina' +
          ' - Piau'#237' - E-mail: soeiro.rep@uol.com.br - Fone/Fax(86) 3221-808' +
          '8 - Cel.:(86) 9928-0989 / (86) 9994-2623'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 3704
        mmTop = 2117
        mmWidth = 190765
        BandType = 8
      end
      object ppLine92: TppLine
        UserName = 'Line902'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 7408
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 148696
        mmTop = 9525
        mmWidth = 15579
        BandType = 8
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 13758
        mmWidth = 12700
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 165629
        mmTop = 13758
        mmWidth = 1778
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 165365
        mmTop = 9525
        mmWidth = 30427
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 62177
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'Shape4'
        Shape = stRoundRect
        mmHeight = 47361
        mmLeft = 2646
        mmTop = 9790
        mmWidth = 193146
        BandType = 7
      end
      object ppLabel93: TppLabel
        UserName = 'Label58'
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 10848
        mmWidth = 24342
        BandType = 7
      end
      object ppLine79: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 4498
        mmTop = 18785
        mmWidth = 187590
        BandType = 7
      end
      object ppLine80: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 4498
        mmTop = 23548
        mmWidth = 187590
        BandType = 7
      end
      object ppLine81: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 4498
        mmTop = 28310
        mmWidth = 187590
        BandType = 7
      end
      object ppLine82: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 4498
        mmTop = 33073
        mmWidth = 187590
        BandType = 7
      end
      object ppLine83: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2646
        mmTop = 34925
        mmWidth = 192882
        BandType = 7
      end
      object ppLabel94: TppLabel
        UserName = 'Label59'
        Caption = 'Data: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 36248
        mmWidth = 9525
        BandType = 7
      end
      object ppLine84: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 3969
        mmTop = 47890
        mmWidth = 53711
        BandType = 7
      end
      object ppLine85: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 62442
        mmTop = 47890
        mmWidth = 55033
        BandType = 7
      end
      object ppLabel95: TppLabel
        UserName = 'Label60'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 48683
        mmWidth = 8467
        BandType = 7
      end
      object ppLabel96: TppLabel
        UserName = 'Label601'
        Caption = 'Representante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 48683
        mmWidth = 18521
        BandType = 7
      end
      object ppLine86: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 120386
        mmTop = 35190
        mmWidth = 2646
        BandType = 7
      end
      object ppLine87: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 120386
        mmTop = 41540
        mmWidth = 72761
        BandType = 7
      end
      object ppLine88: TppLine
        UserName = 'Line33'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 120386
        mmTop = 48419
        mmWidth = 72761
        BandType = 7
      end
      object ppLine89: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21431
        mmLeft = 157957
        mmTop = 35190
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel97: TppLabel
        UserName = 'Label62'
        Caption = 'SUB TOTAL           R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 37306
        mmWidth = 36248
        BandType = 7
      end
      object ppLabel98: TppLabel
        UserName = 'Label63'
        Caption = 'IPI                         R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 44186
        mmWidth = 35719
        BandType = 7
      end
      object ppLabel99: TppLabel
        UserName = 'Label64'
        Caption = 'TOTAL PEDIDO      R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 52652
        mmWidth = 37306
        BandType = 7
      end
      object txtSubTotal2: TppLabel
        UserName = 'txtSubTotal'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 37306
        mmWidth = 6879
        BandType = 7
      end
      object txtIPI2: TppLabel
        UserName = 'txtSubTotal1'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 44186
        mmWidth = 6879
        BandType = 7
      end
      object txtTotal2: TppLabel
        UserName = 'txtSubTotal2'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 52652
        mmWidth = 6879
        BandType = 7
      end
      object ppDBText63: TppDBText
        UserName = 'DBText44'
        AutoSize = True
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPVendas'
        mmHeight = 3979
        mmLeft = 14288
        mmTop = 36248
        mmWidth = 31750
        BandType = 7
      end
    end
  end
  object ppDBPItensOrcamento: TppDBPipeline
    DataSource = dmConsultas.dsItemVendas
    UserName = 'DBPItensOrcamento'
    Left = 352
    Top = 16
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select CODIGO, CEDENTE_NOME, CEDENTE_CODIGO from CEDENTES order ' +
      'by CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 32
    Top = 344
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 96
    Top = 344
  end
  object cdsTotalMes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsTotalMesCalcFields
    Left = 168
    Top = 344
    Data = {
      7F0000009619E0BD0100000018000000060000000000030000007F0003414E4F
      0400010000000000034D45530400010000000000084E4F4D455F4D4553010049
      0000000100055749445448020002000C00084152454345424552080004000000
      000008524543454249444F08000400000000000553414C444F08000400000000
      000000}
    object cdsTotalMesANO: TIntegerField
      FieldName = 'ANO'
    end
    object cdsTotalMesMES: TIntegerField
      FieldName = 'MES'
    end
    object cdsTotalMesNOME_MES: TStringField
      FieldName = 'NOME_MES'
      Size = 12
    end
    object cdsTotalMesARECEBER: TFloatField
      FieldName = 'ARECEBER'
    end
    object cdsTotalMesRECEBIDO: TFloatField
      FieldName = 'RECEBIDO'
    end
    object cdsTotalMesSALDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
  end
  object ppRepTotalMes: TppReport
    AutoStop = False
    DataPipeline = ppDBPTotalMes
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 376
    Top = 360
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPTotalMes'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppDBImage5: TppDBImage
        UserName = 'DBImage5'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label105'
        Caption = 'RELA'#199#195'O DE CONTAS A RECEBER POR M'#202'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114829
        mmTop = 1058
        mmWidth = 76729
        BandType = 0
      end
      object lblLoja: TppLabel
        UserName = 'lblLoja'
        Caption = 'lblLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 115094
        mmTop = 6085
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label107'
        Caption = 'M'#202'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 2117
        mmTop = 27517
        mmWidth = 7662
        BandType = 0
      end
      object ppLine94: TppLine
        UserName = 'Line94'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 32015
        mmWidth = 197380
        BandType = 0
      end
      object ppLine95: TppLine
        UserName = 'Line95'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 26458
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = 'A RECEBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 49742
        mmTop = 27517
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label1101'
        Caption = 'RECEBIDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 77894
        mmTop = 27517
        mmWidth = 20532
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = 'SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 113221
        mmTop = 27517
        mmWidth = 12192
        BandType = 0
      end
      object lblExercicio: TppLabel
        UserName = 'lblExercicio'
        Caption = 'lblExercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 115094
        mmTop = 11377
        mmWidth = 17738
        BandType = 0
      end
      object lblNomeCliente: TppLabel
        UserName = 'lblNomeCliente'
        Caption = 'lblNomeCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 115094
        mmTop = 16140
        mmWidth = 23791
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'NOME_MES'
        DataPipeline = ppDBPTotalMes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 265
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'ARECEBER'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'RECEBIDO'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 4022
        mmLeft = 77788
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'SALDO'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 4022
        mmLeft = 105304
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine93: TppLine
        UserName = 'Line93'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel109: TppLabel
        UserName = 'Label109'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine96: TppLine
        UserName = 'Line96'
        Pen.Style = psDot
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'ARECEBER'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 4022
        mmLeft = 50271
        mmTop = 2381
        mmWidth = 20638
        BandType = 7
      end
      object ppLabel113: TppLabel
        UserName = 'Label113'
        Caption = 'TOTAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 2360
        mmTop = 2381
        mmWidth = 13885
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'RECEBIDO'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 3969
        mmLeft = 77788
        mmTop = 2381
        mmWidth = 20638
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SALDO'
        DataPipeline = ppDBPTotalMes
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalMes'
        mmHeight = 3969
        mmLeft = 105304
        mmTop = 2381
        mmWidth = 20638
        BandType = 7
      end
    end
  end
  object ppDBPTotalMes: TppDBPipeline
    DataSource = dsTotalMes
    UserName = 'DBPTotalMes'
    Left = 304
    Top = 360
    object ppDBPTotalMesppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANO'
      FieldName = 'ANO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPTotalMesppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPTotalMesppField3: TppField
      FieldAlias = 'NOME_MES'
      FieldName = 'NOME_MES'
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object ppDBPTotalMesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARECEBER'
      FieldName = 'ARECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPTotalMesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBIDO'
      FieldName = 'RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPTotalMesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsTotalMes: TDataSource
    DataSet = cdsTotalMes
    Left = 120
    Top = 375
  end
  object cdsTotalNatureza: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 240
    Data = {
      820000009619E0BD010000001800000004000000000003000000820004544950
      4F01004900000001000557494454480200020001000944455343524943414F01
      00490000000100055749445448020002001E000556414C4F5208000400000000
      000E5449504F5F44455343524943414F01004900000001000557494454480200
      02000A000000}
    object cdsTotalNaturezaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsTotalNaturezaTIPO_DESCRICAO: TStringField
      FieldName = 'TIPO_DESCRICAO'
      Size = 10
    end
    object cdsTotalNaturezaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsTotalNaturezaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsTotalNatureza: TDataSource
    DataSet = cdsTotalNatureza
    Left = 488
    Top = 240
  end
  object ppRepTotalNatureza: TppReport
    AutoStop = False
    DataPipeline = ppDBPTotalNatureza
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 480
    Top = 344
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPTotalNatureza'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppDBImage6: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object lblNomeRel: TppLabel
        UserName = 'lblNomeRel'
        Caption = 'RELA'#199#195'O TOTAL PAGO E TOTAL RECEBIDO POR NATUREZA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 93398
        mmTop = 1058
        mmWidth = 103844
        BandType = 0
      end
      object lblLoja2: TppLabel
        UserName = 'lblLoja1'
        Caption = 'lblLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 93398
        mmTop = 6085
        mmWidth = 10054
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 93398
        mmTop = 11113
        mmWidth = 15536
        BandType = 0
      end
      object lblTipoNatureza: TppLabel
        UserName = 'lblTipoNatureza'
        Caption = 'lblTipoNatureza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 93398
        mmTop = 15610
        mmWidth = 24511
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'DESCRICAO'
        DataPipeline = ppDBPTotalNatureza
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPTotalNatureza'
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 264
        mmWidth = 71173
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'VALOR'
        DataPipeline = ppDBPTotalNatureza
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPTotalNatureza'
        mmHeight = 3969
        mmLeft = 114565
        mmTop = 264
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine99: TppLine
        UserName = 'Line99'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel115: TppLabel
        UserName = 'Label115'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 2381
        mmWidth = 17198
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 2381
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable101'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 191823
        mmTop = 6879
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPO'
      DataPipeline = ppDBPTotalNatureza
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPTotalNatureza'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15346
        mmPrintPosition = 0
        object ppLine97: TppLine
          UserName = 'Line97'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLine98: TppLine
          UserName = 'Line98'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 14288
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppDBText49: TppDBText
          UserName = 'DBText49'
          DataField = 'TIPO_DESCRICAO'
          DataPipeline = ppDBPTotalNatureza
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppDBPTotalNatureza'
          mmHeight = 3979
          mmLeft = 1588
          mmTop = 1852
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
        object ppLabel106: TppLabel
          UserName = 'Label106'
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 1588
          mmTop = 9790
          mmWidth = 20955
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4191
          mmLeft = 125127
          mmTop = 9790
          mmWidth = 12192
          BandType = 3
          GroupNo = 0
        end
        object ppLine101: TppLine
          UserName = 'Line101'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 7144
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Total ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 2117
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object ppLine100: TppLine
          UserName = 'Line100'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = ppDBPTotalNatureza
          DisplayFormat = '###,###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPTotalNatureza'
          mmHeight = 3969
          mmLeft = 114565
          mmTop = 2117
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPTotalNatureza: TppDBPipeline
    DataSource = dsTotalNatureza
    UserName = 'DBPTotalNatureza'
    Left = 480
    Top = 296
    object ppDBPTotalNaturezappField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object ppDBPTotalNaturezappField2: TppField
      FieldAlias = 'TIPO_DESCRICAO'
      FieldName = 'TIPO_DESCRICAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPTotalNaturezappField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppDBPTotalNaturezappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object rvpBoleto: TRvProject
    Engine = RvSystem2
    ProjectFile = 'C:\Empresa\SERVICO\InfoFinanceiro\Relatorios\rvBoleto.rav'
    Left = 352
    Top = 72
  end
  object RvSystem2: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Visualizar Impress'#227'o'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Visualizar Impress'#227'o'
    SystemPrinter.Units = unMM
    SystemPrinter.UnitsFactor = 25.400000000000000000
    OnAfterPrint = RvSystem2AfterPrint
    Left = 488
    Top = 136
  end
  object gbCobranca1: TgbCobranca
    NumeroArquivo = 0
    LayoutArquivo = laCNAB240
    TipoMovimento = tmRetorno
    Left = 440
    Top = 16
  end
  object gbTitulo1: TgbTitulo
    TipoOcorrencia = toRemessaRegistrar
    LocalPagamento = 'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'
    Cedente.TipoInscricao = tiPessoaFisica
    Sacado.TipoInscricao = tiPessoaFisica
    Sacado.ContaBancaria.Banco.Codigo = '104'
    AceiteDocumento = adNao
    EspecieDocumento = edRecibo
    EmissaoBoleto = ebClienteEmite
    Left = 504
    Top = 8
  end
  object rvpBoletoBB: TRvProject
    Engine = RvSystem2
    ProjectFile = 'C:\Empresa\Cartao\Relatorios\rvBoleto2.rav'
    Left = 288
    Top = 72
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select V.MOV_PEDIDO, V.MOV_LOJA, V.MOV_DATAVENDA, V.MOV_CLIENTE,' +
      ' H.HIS_PRODUTO, P.PRO_DESCRICAO, H.HIS_MOVIMENTO, H.HIS_VLCOMPRA' +
      ' from VENDAS V INNER join HISTORICO H ON V.MOV_PEDIDO = H.HIS_DO' +
      'CUMENTO INNER join PRODUTOS P ON H.HIS_PRODUTO = P.PRO_CODIGO WH' +
      'ERE (V.MOV_PEDIDO = :pVENDA) AND (V.MOV_LOJA = :pLOJA)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 232
    Top = 336
  end
  object cdsBoleto: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select R.REC_SEQUENCIA, R.REC_CREDITO, R.REC_LOJA, R.rec_dataemi' +
      'ssao, R.rec_parcela, R.rec_qtparcelas, R.rec_cliente, R.rec_nrve' +
      'nda, R.rec_descricao, R.rec_datavencimento, R.rec_valorparcela, ' +
      'R.rec_natureza, R.rec_situacao, C.cli_tipopessoa, C.cli_cgc, C.c' +
      'li_fantasia, C.cli_razao, C.cli_endereco, C.cli_numero, C.cli_ce' +
      'p, C.cli_ufcliente, c.bai_codigo, c.cid_codigo from CONTASRECEBE' +
      'R R INNER join CLIENTES C ON R.REC_CLIENTE = C.CLI_CODIGO WHERE ' +
      '(R.REC_SEQUENCIA = :pSEQUENCIA) and (R.REC_CREDITO = :pCREDITO) ' +
      'AND (R.REC_SITUACAO = :pSITUACAO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 232
    Top = 384
    object cdsBoletoREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsBoletoREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      Required = True
    end
    object cdsBoletoREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
    end
    object cdsBoletoREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      Required = True
    end
    object cdsBoletoREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
    end
    object cdsBoletoREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
    end
    object cdsBoletoREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
    end
    object cdsBoletoREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBoletoREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
    end
    object cdsBoletoREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      Precision = 15
      Size = 2
    end
    object cdsBoletoREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsBoletoREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsBoletoCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsBoletoCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsBoletoCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsBoletoCLI_RAZAO: TStringField
      FieldName = 'CLI_RAZAO'
      Size = 50
    end
    object cdsBoletoCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object cdsBoletoCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsBoletoCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Size = 8
    end
    object cdsBoletoCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      FixedChar = True
      Size = 2
    end
    object cdsBoletoREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      Required = True
    end
    object cdsBoletoBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
    end
    object cdsBoletoCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
    end
  end
  object rvdstConfig: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Dm.CdsConfig
    Left = 416
    Top = 72
  end
  object rvdstBoleto: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsBoleto
    Left = 480
    Top = 72
  end
  object rvdstCedente: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmDados.cdsCedente
    Left = 544
    Top = 72
  end
  object cdsAcessos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 560
    Top = 360
  end
  object cdsContaSaldo: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select CGS_CODIGO, CGS_DESCRICAO from CONTAS_SALDOS'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 248
    Top = 232
    object cdsContaSaldoCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContaSaldoCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
  end
  object cdsModalidade: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select MOD_CODIGO, MOD_NOME from MODALIDADE MOD_CODIGO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 544
    Top = 192
    object cdsModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
  end
  object cdsContasPagar: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select CP.pag_sequencia, CP.pag_loja, CP.pag_datacompra, CP.pag_' +
      'datavencimento, F.FOR_FANTASIA, CP.PAG_VALORPARCELA from CONTASP' +
      'AGAR CP INNER join FORNECEDORES F ON CP.PAG_FORNECEDOR = F.FOR_C' +
      'ODIGO Where (CP.pag_situacao = :pSITUACAO)'
    Params = <
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 560
    Top = 280
    object cdsContasPagarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      Required = True
    end
    object cdsContasPagarPAG_LOJA: TIntegerField
      FieldName = 'PAG_LOJA'
      Required = True
    end
    object cdsContasPagarPAG_DATACOMPRA: TDateField
      FieldName = 'PAG_DATACOMPRA'
    end
    object cdsContasPagarPAG_DATAVENCIMENTO: TDateField
      FieldName = 'PAG_DATAVENCIMENTO'
    end
    object cdsContasPagarFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsContasPagarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      Precision = 15
      Size = 2
    end
  end
  object cdsCedentes: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select CODIGO, CEDENTE_NOME, CEDENTE_CODIGO from CEDENTES order ' +
      'by CODIGO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 560
    Top = 128
    object cdsCedentesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCedentesCEDENTE_NOME: TStringField
      FieldName = 'CEDENTE_NOME'
      Size = 30
    end
    object cdsCedentesCEDENTE_CODIGO: TStringField
      FieldName = 'CEDENTE_CODIGO'
      Size = 12
    end
  end
  object cdsContSaldo: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from CONTAS_SALDOS Where (CGS_CODIGO = :pCODIGO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 360
    Top = 232
    object cdsContSaldoCGS_CODIGO: TIntegerField
      FieldName = 'CGS_CODIGO'
      Required = True
    end
    object cdsContSaldoCGS_DESCRICAO: TStringField
      FieldName = 'CGS_DESCRICAO'
      Size = 30
    end
    object cdsContSaldoCGS_VALOR_SALDO: TFMTBCDField
      FieldName = 'CGS_VALOR_SALDO'
      Precision = 15
      Size = 2
    end
    object cdsContSaldoCGS_AGENCIA: TStringField
      FieldName = 'CGS_AGENCIA'
      Size = 5
    end
    object cdsContSaldoCGS_BANCO: TIntegerField
      FieldName = 'CGS_BANCO'
    end
    object cdsContSaldoCGS_NRCONTA: TStringField
      FieldName = 'CGS_NRCONTA'
      Size = 10
    end
  end
  object cdsLojas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 56
    Top = 392
  end
  object cdsValidarAcesso: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pUSUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspValidarAcesso'
    Left = 552
    Top = 414
  end
  object dstValidarAcesso: TSQLDataSet
    CommandText = 
      'Select PU.usu_codigo, count(*) as QUANT from PERMISSOES_USUARIOS' +
      ' PU Where (PU.usu_codigo = :pUSUARIO) group by PU.usu_codigo'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pUSUARIO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 392
    Top = 408
  end
  object dspValidarAcesso: TDataSetProvider
    DataSet = dstValidarAcesso
    Options = [poAllowCommandText]
    Left = 480
    Top = 408
  end
  object rvPedido: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rvPedido.rav'
    Left = 176
    Top = 400
  end
  object RvNDRWriter1: TRvNDRWriter
    StatusFormat = 'Printing page %p'
    Units = unMM
    UnitsFactor = 25.400000000000000000
    Title = 'Rave Report'
    Orientation = poPortrait
    ScaleX = 100.000000000000000000
    ScaleY = 100.000000000000000000
    StreamMode = smUser
    Left = 280
    Top = 416
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Visualizar Impress'#227'o'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.Units = unMM
    SystemPrinter.UnitsFactor = 25.400000000000000000
    Left = 120
    Top = 424
  end
  object rvdItensVenda: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dmConsultas.cdsItensVendas
    Left = 336
    Top = 408
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 480
    Top = 192
  end
  object SaveDialog1: TSaveDialog
    Left = 336
    Top = 120
  end
  object rvdConfig: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Dm.CdsConfig
    Left = 32
    Top = 432
  end
  object dstComissoes: TSQLDataSet
    CommandText = 
      'select F.fun_codigo, F.fun_nome, Sum(V.mov_valor) as Total ,'#13#10'Su' +
      'm(V.mov_taxa_servico) as TAXA'#13#10'from vendas v'#13#10'inner join provend' +
      'as p on v.mov_pedido = p.mop_pedido'#13#10'inner join funcionarios f o' +
      'n f.fun_codigo = p.mop_cdvendedor'#13#10'where (V.MOV_SEQUENCIA >= :pI' +
      'NICIAL) '#13#10'AND (V.MOV_SEQUENCIA <= :pFINAL)'#13#10'AND (V.mov_situacao ' +
      '= '#39'F'#39') and (v.mov_taxa_servico > 0)'#13#10'and NOT (V.MOV_NRMESA like ' +
      #39'T%'#39')'#13#10'and (p.mop_nritem = 1)'#13#10' group by F.fun_codigo, F.fun_nom' +
      'e'#13#10' order by F.FUN_NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pFINAL'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 40
    Top = 480
  end
  object dspComissoes: TDataSetProvider
    DataSet = dstComissoes
    Options = [poAllowCommandText]
    Left = 112
    Top = 480
  end
  object cdsComissoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspComissoes'
    Left = 184
    Top = 480
    object cdsComissoesFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsComissoesFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsComissoesTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsComissoesTAXA: TFMTBCDField
      FieldName = 'TAXA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object dstTeleEntregas: TSQLDataSet
    CommandText = 
      'Select Count(*) as QUANTIDADE, Sum(M.MOV_VALOR) AS TOTAL_VENDA, ' +
      'Sum(((M.mov_valor*M.mov_taxa_servico)/100)) AS TOTAL_SERVICO'#13#10'fr' +
      'om VENDAS M'#13#10'where (M.MOV_SEQUENCIA >= :pINICIAL) '#13#10'AND (M.MOV_S' +
      'EQUENCIA <= :pFINAL)'#13#10'AND (M.mov_situacao = '#39'F'#39') AND (M.mov_nrme' +
      'sa like '#39'T%'#39')'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFINAL'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 288
    Top = 472
  end
  object dspTeleEntregas: TDataSetProvider
    DataSet = dstTeleEntregas
    Options = [poAllowCommandText]
    Left = 368
    Top = 464
  end
  object cdsTeleEntrega: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspTeleEntregas'
    Left = 448
    Top = 480
    object cdsTeleEntregaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      ReadOnly = True
      Required = True
    end
    object cdsTeleEntregaTOTAL_VENDA: TFMTBCDField
      FieldName = 'TOTAL_VENDA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsTeleEntregaTOTAL_SERVICO: TFMTBCDField
      FieldName = 'TOTAL_SERVICO'
      ReadOnly = True
      Precision = 18
      Size = 8
    end
  end
  object cdsDetalheMovCaixa: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select MC.MCA_TIPOMOV, MC.MCA_NATUREZA, N.NAT_NOME, Sum(MC.MCA_V' +
      'LMODALIDADE) AS VALOR from MOVIMENTO_CAIXA MC INNER JOIN NATUREZ' +
      'A N ON MC.MCA_NATUREZA = N.NAT_CODIGO Where (MC.MCA_SEQUENCIA >=' +
      ' :pRGINICIAL) and (MC.MCA_SEQUENCIA <= :pRGFINAL) and (MC.MCA_TI' +
      'POMOV = :pTIPOMOV) AND (MC.MCA_CAIXA = :pCAIXA) Group by MC.MCA_' +
      'TIPOMOV, MC.MCA_NATUREZA, N.NAT_NOME'
    Params = <
      item
        DataType = ftInteger
        Name = 'pRGINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRGFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 552
    Top = 472
    object cdsDetalheMovCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      FixedChar = True
      Size = 1
    end
    object cdsDetalheMovCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
    end
    object cdsDetalheMovCaixaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsDetalheMovCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsMovModalidade: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select MC.MCA_MODALIDADE, M.MOD_NOME, Sum(MC.MCA_VLMODALIDADE) A' +
      'S VALOR from MOVIMENTO_CAIXA MC INNER JOIN MODALIDADE M ON MC.MC' +
      'A_MODALIDADE = M.MOD_CODIGO Where (MC.MCA_SEQUENCIA >= :pRGINICI' +
      'AL) and (MC.MCA_SEQUENCIA <= :pRGFINAL) AND (MC.MCA_CAIXA = :pCA' +
      'IXA) AND (MC.MCA_TIPOMOV <> :pTIPOMOV) Group by MC.MCA_MODALIDAD' +
      'E, M.MOD_NOME;'
    Params = <
      item
        DataType = ftInteger
        Name = 'pRGINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRGFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 512
    Top = 520
    object cdsMovModalidadeMCA_MODALIDADE: TIntegerField
      FieldName = 'MCA_MODALIDADE'
    end
    object cdsMovModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsMovModalidadeVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsMovModalidade2: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select MC.MCA_MODALIDADE, M.MOD_NOME, MC.MCA_TIPOMOV, Sum(MC.MCA' +
      '_VLMODALIDADE) AS VALOR, Sum(MC.mca_vltroco) AS TROCO, (Sum(MC.M' +
      'CA_VLMODALIDADE) - Sum(MC.mca_vltroco)) AS TOTAL from MOVIMENTO_' +
      'CAIXA MC INNER JOIN MODALIDADE M ON MC.MCA_MODALIDADE = M.MOD_CO' +
      'DIGO Where (MC.MCA_SEQUENCIA >= :pRGINICIAL) and (MC.MCA_SEQUENC' +
      'IA <= :pRGFINAL) AND (MC.MCA_CAIXA = :pCAIXA) and (MC.MCA_MODALI' +
      'DADE = :pMODALIDADE) and (MC.MCA_TIPOMOV = :pTIPOMOV1) Group by ' +
      'MC.MCA_MODALIDADE, M.MOD_NOME, MC.MCA_TIPOMOV'
    Params = <
      item
        DataType = ftInteger
        Name = 'pRGINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRGFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 280
    Top = 528
    object cdsMovModalidade2MCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsMovModalidade2MOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsMovModalidade2MCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      FixedChar = True
      Size = 1
    end
    object cdsMovModalidade2VALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMovModalidade2TROCO: TFMTBCDField
      FieldName = 'TROCO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsMovModalidade2TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsMovModaCredito: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select MC.MCA_MODALIDADE, M.MOD_NOME, MC.MCA_TIPOMOV, Sum(MC.MCA' +
      '_VLMODALIDADE) AS VALOR  from MOVIMENTO_CAIXA MC INNER JOIN MODA' +
      'LIDADE M ON MC.MCA_MODALIDADE = M.MOD_CODIGO Where (MC.MCA_SEQUE' +
      'NCIA >= :pRGINICIAL) and (MC.MCA_SEQUENCIA <= :pRGFINAL) AND  (M' +
      'C.MCA_CAIXA = :pCAIXA) and (MC.MCA_MODALIDADE = :pMODALIDADE) an' +
      'd (MC.MCA_TIPOMOV = :pTIPOMOV1) Group by MC.MCA_MODALIDADE, M.MO' +
      'D_NOME, MC.MCA_TIPOMOV'
    Params = <
      item
        DataType = ftInteger
        Name = 'pRGINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRGFINAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pMODALIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV1'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 160
    Top = 528
    object cdsMovModaCreditoMCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsMovModaCreditoMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsMovModaCreditoMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      FixedChar = True
      Size = 1
    end
    object cdsMovModaCreditoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsModalidades: TClientDataSet
    Aggregates = <>
    CommandText = 'Select MOD_CODIGO, MOD_NOME from MODALIDADE'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 392
    Top = 520
  end
  object rv2Boletos: TRvProject
    Engine = RvSystem3
    ProjectFile = 'C:\Empresa\SERVICO\InfoFinanceiro\Relatorios\rv2Boletos.rav'
    Left = 632
    Top = 72
  end
  object RvSystem3: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Status do Relat'#243'rio'
    TitlePreview = 'Visualizar Impress'#227'o'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.Units = unCM
    SystemPrinter.UnitsFactor = 2.540000000000000000
    Left = 632
    Top = 128
  end
  object cds2Boletos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 184
    Data = {
      E50200009619E0BD010000001800000017000000000003000000E5020D434453
      5F53455155454E43494104000100000000000B4344535F434C49454E54450400
      0100000000000D4344535F4E4D434C49454E5445010049000000010005574944
      5448020002003200074344535F43504601004900000001000557494454480200
      020015000C4344535F454E44455245434F010049000000010005574944544802
      00020032000A4344535F43494441444501004900000001000557494454480200
      02001E000A4344535F42414952524F0100490000000100055749445448020002
      001E000D4344535F44455343524943414F04004B000000020007535542545950
      4502004900050054657874000557494454480200020090010D4344535F444F43
      554D454E544F0100490000000100055749445448020002000A000F4344535F4E
      4F53534F4E554D45524F01004900000001000557494454480200020012000A43
      44535F4454444F43550400060000000000134344535F445450524F4345535341
      4D454E544F0400060000000000104344535F445456454E43494D454E544F0400
      0600000000000C4344535F434152544549524101004900000001000557494454
      48020002000A00094344535F56414C4F520800040000000000074344535F4345
      5001004900000001000557494454480200020009000B4344535F424F584D4553
      410100490000000100055749445448020002001400134344535F4C494E48415F
      44494749544156454C0100490000000100055749445448020002003600114344
      535F434F4449474F5F4241525241530100490000000100055749445448020002
      0036000B4344535F4147454E4349410100490000000100055749445448020002
      0005000A4344535F44494147454E010049000000010005574944544802000200
      01000D4344535F4344434544454E544501004900000001000557494454480200
      02000C000E4344535F44475F4E4E554D45524F01004900000001000557494454
      480200020001000000}
    object cds2BoletosCDS_SEQUENCIA: TIntegerField
      FieldName = 'CDS_SEQUENCIA'
    end
    object cds2BoletosCDS_CLIENTE: TIntegerField
      FieldName = 'CDS_CLIENTE'
    end
    object cds2BoletosCDS_NMCLIENTE: TStringField
      FieldName = 'CDS_NMCLIENTE'
      Size = 50
    end
    object cds2BoletosCDS_CPF: TStringField
      FieldName = 'CDS_CPF'
      Size = 21
    end
    object cds2BoletosCDS_ENDERECO: TStringField
      FieldName = 'CDS_ENDERECO'
      Size = 50
    end
    object cds2BoletosCDS_CIDADE: TStringField
      FieldName = 'CDS_CIDADE'
      Size = 30
    end
    object cds2BoletosCDS_BAIRRO: TStringField
      FieldName = 'CDS_BAIRRO'
      Size = 30
    end
    object cds2BoletosCDS_DESCRICAO: TMemoField
      FieldName = 'CDS_DESCRICAO'
      BlobType = ftMemo
      Size = 400
    end
    object cds2BoletosCDS_DOCUMENTO: TStringField
      FieldName = 'CDS_DOCUMENTO'
      Size = 15
    end
    object cds2BoletosCDS_NOSSONUMERO: TStringField
      FieldName = 'CDS_NOSSONUMERO'
      Size = 18
    end
    object cds2BoletosCDS_DTDOCU: TDateField
      FieldName = 'CDS_DTDOCU'
    end
    object cds2BoletosCDS_DTPROCESSAMENTO: TDateField
      FieldName = 'CDS_DTPROCESSAMENTO'
    end
    object cds2BoletosCDS_DTVENCIMENTO: TDateField
      FieldName = 'CDS_DTVENCIMENTO'
    end
    object cds2BoletosCDS_CARTEIRA: TStringField
      FieldName = 'CDS_CARTEIRA'
      Size = 10
    end
    object cds2BoletosCDS_VALOR: TFloatField
      FieldName = 'CDS_VALOR'
    end
    object cds2BoletosCDS_CEP: TStringField
      FieldName = 'CDS_CEP'
      Size = 9
    end
    object cds2BoletosCDS_BOXMESA: TStringField
      FieldName = 'CDS_BOXMESA'
    end
    object cds2BoletosCDS_LINHA_DIGITAVEL: TStringField
      FieldName = 'CDS_LINHA_DIGITAVEL'
      Size = 54
    end
    object cds2BoletosCDS_CODIGO_BARRAS: TStringField
      FieldName = 'CDS_CODIGO_BARRAS'
      Size = 54
    end
    object cds2BoletosCDS_AGENCIA: TStringField
      FieldName = 'CDS_AGENCIA'
      Size = 5
    end
    object cds2BoletosCDS_DIAGEN: TStringField
      FieldName = 'CDS_DIAGEN'
      Size = 1
    end
    object cds2BoletosCDS_CDCEDENTE: TStringField
      FieldName = 'CDS_CDCEDENTE'
      Size = 12
    end
    object cds2BoletosCDS_DG_NNUMERO: TStringField
      FieldName = 'CDS_DG_NNUMERO'
      Size = 1
    end
  end
  object rvdst2Boletos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cds2Boletos
    Left = 632
    Top = 240
  end
end
