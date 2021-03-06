inherited frmRelMesasEntregas: TfrmRelMesasEntregas
  Left = 296
  Top = 233
  Caption = 'Rela'#231#227'o de Total Vendido'
  ClientHeight = 251
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 210
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 381
      Height = 208
      ActivePage = tbsMesas
      Align = alClient
      TabOrder = 0
      object tbsMesas: TTabSheet
        Caption = '&Mesas/Entregas'
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 81
          Height = 13
          Caption = 'Data Movimento:'
          Transparent = True
        end
        object rgTipo: TRadioGroup
          Left = 16
          Top = 64
          Width = 329
          Height = 81
          Caption = '[ Tipo ]'
          ItemIndex = 0
          Items.Strings = (
            '&Mesas'
            '&Entregas')
          TabOrder = 1
        end
        object edtDTMOVI1: TDateEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
      end
      object tbsProdutos: TTabSheet
        Caption = '&Produtos'
        ImageIndex = 1
        object Label2: TLabel
          Left = 16
          Top = 16
          Width = 81
          Height = 13
          Caption = 'Data Movimento:'
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 60
          Width = 40
          Height = 13
          Caption = 'Produto:'
        end
        object sbLocProduto: TSpeedButton
          Left = 137
          Top = 74
          Width = 23
          Height = 22
          Hint = 'Localiza produto'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777770077777777777770FF077777777777077FF07777
            7777770777FF077777777770777FFF00777777790777F1111077777790771117
            0B77777770799170B77777777709990B77777777770990B77777777777090B77
            777777777770B777777777777777777777777777777777777777}
          OnClick = sbLocProdutoClick
        end
        object edtDTMOVI2: TDateEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object edtCDPROD: TEdit
          Left = 16
          Top = 76
          Width = 121
          Height = 21
          MaxLength = 13
          TabOrder = 1
          OnChange = edtCDPRODChange
          OnExit = edtCDPRODExit
          OnKeyPress = edtCDPRODKeyPress
        end
        object dbeDescricao: TEdit
          Left = 16
          Top = 104
          Width = 345
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Taxa Servi'#231'o'
        ImageIndex = 2
        TabVisible = False
      end
    end
  end
  inherited Panel2: TPanel
    Top = 210
    inherited btImprimir: TBitBtn
      OnClick = btImprimirClick
    end
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select H.HIS_DATA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFEREN' +
      'CIA, H.HIS_VLVENDA, Sum(H.HIS_MOVIMENTO) As TOTAL from HISTORICO' +
      ' H Inner Join PRODUTOS P on P.PRO_CODIGO = H.HIS_PRODUTO Where (' +
      'H.HIS_DATA = :pDATA) AND (H.his_tipo = :pTIPO) Group by H.HIS_DA' +
      'TA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFERENCIA, H.HIS_VLVE' +
      'NDA  ORDER BY P.PRO_DESCRICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 13
    Top = 217
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 48
    Top = 213
  end
  object cdsMesasEntregas: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select M.MOV_PEDIDO, M.MOV_CUPOM, M.MOV_LOJA, M.MOV_DATAVENDA, M' +
      '.MOV_CLIENTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.' +
      'MOV_VENDEDOR, M.MOV_DESCONTO, M.MOV_HORAVENDA, M. MOV_ACRESCIMO,' +
      ' M.MOV_TAXA_SERVICO, M.MOV_NRMESA, (Select E.EMP_FANTASIA from E' +
      'MPRESAS E Where (E.EMP_CODIGO = M.MOV_LOJA)) as MOV_NMLOJA from ' +
      'VENDAS M Where (M.MOV_DATAVENDA = :pDATA) and (M.MOV_NRMESA LIKE' +
      ' :pMESA) order by M.MOV_PEDIDO'
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pMESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    OnCalcFields = cdsMesasEntregasCalcFields
    Left = 229
    Top = 41
    object cdsMesasEntregasMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsMesasEntregasMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
    end
    object cdsMesasEntregasMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
    end
    object cdsMesasEntregasMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
    end
    object cdsMesasEntregasMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsMesasEntregasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsMesasEntregasMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsMesasEntregasMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMesasEntregasMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsMesasEntregasMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsMesasEntregasMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsMesasEntregasMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsMesasEntregasMOV_TAXA_SERVICO: TBCDField
      FieldName = 'MOV_TAXA_SERVICO'
      Precision = 9
      Size = 2
    end
    object cdsMesasEntregasMOV_NRMESA: TStringField
      FieldName = 'MOV_NRMESA'
      Size = 6
    end
    object cdsMesasEntregasMOV_NMLOJA: TStringField
      FieldName = 'MOV_NMLOJA'
      ReadOnly = True
      Size = 50
    end
    object cdsMesasEntregasMOV_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MOV_TOTAL'
    end
  end
  object ppRepMesaEntregas: TppReport
    AutoStop = False
    DataPipeline = ppDBPMesasEntregas
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
    Left = 301
    Top = 41
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPMesasEntregas'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 29104
        mmLeft = 4498
        mmTop = 3704
        mmWidth = 42598
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 3000
        mmTop = 34396
        mmWidth = 192000
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 3000
        mmTop = 39423
        mmWidth = 192000
        BandType = 0
      end
      object txtTitulo1: TppLabel
        UserName = 'txtTitulo1'
        Caption = 'txtTitulo1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 131763
        mmTop = 5821
        mmWidth = 61648
        BandType = 0
      end
      object txtPeriodo1: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'txtTitulo1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 131763
        mmTop = 11642
        mmWidth = 61648
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 4233
        mmTop = 34925
        mmWidth = 12150
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 25135
        mmTop = 34925
        mmWidth = 9567
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 40217
        mmTop = 34925
        mmWidth = 15071
        BandType = 0
      end
      object txtMesaEntrega: TppLabel
        UserName = 'txtMesaEntrega'
        Caption = 'MESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 34925
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 134409
        mmTop = 34925
        mmWidth = 12192
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'TX SERV.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 151607
        mmTop = 34925
        mmWidth = 16002
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MOV_PEDIDO'
        DataPipeline = ppDBPMesasEntregas
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 4498
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOV_DATAVENDA'
        DataPipeline = ppDBPMesasEntregas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 21696
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MOV_NOMECLIENTE'
        DataPipeline = ppDBPMesasEntregas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 3969
        mmLeft = 39952
        mmTop = 265
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPMesasEntregas
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 125942
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MOV_TAXA_SERVICO'
        DataPipeline = ppDBPMesasEntregas
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 151607
        mmTop = 265
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MOV_NRMESA'
        DataPipeline = ppDBPMesasEntregas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 110861
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 3969
        mmTop = 1323
        mmWidth = 192088
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 133086
        mmTop = 2910
        mmWidth = 16976
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 133086
        mmTop = 7673
        mmWidth = 11853
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 3000
        mmTop = 1323
        mmWidth = 192088
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'MOV_VALOR'
        DataPipeline = ppDBPMesasEntregas
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4233
        mmLeft = 125942
        mmTop = 3704
        mmWidth = 20638
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'MOV_TAXA_SERVICO'
        DataPipeline = ppDBPMesasEntregas
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 3704
        mmWidth = 16002
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3000
        mmTop = 3704
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataPipeline = ppDBPMesasEntregas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPMesasEntregas'
        mmHeight = 4022
        mmLeft = 28840
        mmTop = 3969
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPMesasEntregas: TppDBPipeline
    DataSource = dsMesasEntregas
    UserName = 'DBPMesasEntregas'
    Left = 333
    Top = 41
    object ppDBPMesasEntregasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_PEDIDO'
      FieldName = 'MOV_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPMesasEntregasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_CUPOM'
      FieldName = 'MOV_CUPOM'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPMesasEntregasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_LOJA'
      FieldName = 'MOV_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPMesasEntregasppField4: TppField
      FieldAlias = 'MOV_DATAVENDA'
      FieldName = 'MOV_DATAVENDA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPMesasEntregasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_CLIENTE'
      FieldName = 'MOV_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPMesasEntregasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VALOR'
      FieldName = 'MOV_VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object ppDBPMesasEntregasppField7: TppField
      FieldAlias = 'MOV_NOMECLIENTE'
      FieldName = 'MOV_NOMECLIENTE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object ppDBPMesasEntregasppField8: TppField
      FieldAlias = 'MOV_SITUACAO'
      FieldName = 'MOV_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object ppDBPMesasEntregasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_VENDEDOR'
      FieldName = 'MOV_VENDEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPMesasEntregasppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_DESCONTO'
      FieldName = 'MOV_DESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 9
    end
    object ppDBPMesasEntregasppField11: TppField
      FieldAlias = 'MOV_HORAVENDA'
      FieldName = 'MOV_HORAVENDA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppDBPMesasEntregasppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_ACRESCIMO'
      FieldName = 'MOV_ACRESCIMO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 11
    end
    object ppDBPMesasEntregasppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_TAXA_SERVICO'
      FieldName = 'MOV_TAXA_SERVICO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPMesasEntregasppField14: TppField
      FieldAlias = 'MOV_NRMESA'
      FieldName = 'MOV_NRMESA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 13
    end
    object ppDBPMesasEntregasppField15: TppField
      FieldAlias = 'MOV_NMLOJA'
      FieldName = 'MOV_NMLOJA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object ppDBPMesasEntregasppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOV_TOTAL'
      FieldName = 'MOV_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object dsMesasEntregas: TDataSource
    DataSet = cdsMesasEntregas
    Left = 261
    Top = 41
  end
  object cdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select H.HIS_DATA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFEREN' +
      'CIA, H.HIS_VLVENDA, Sum(H.HIS_MOVIMENTO) As TOTAL from HISTORICO' +
      ' H Inner Join PRODUTOS P on P.PRO_CODIGO = H.HIS_PRODUTO Where (' +
      'H.HIS_DATA = :pDATA) AND (H.his_tipo = :pTIPO) Group by H.HIS_DA' +
      'TA, H.HIS_PRODUTO, P.PRO_DESCRICAO, P.PRO_REFERENCIA, H.HIS_VLVE' +
      'NDA  ORDER BY P.PRO_DESCRICAO'
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 229
    Top = 89
    object cdsProdutosHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsProdutosHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 261
    Top = 89
  end
  object ppReProdutos: TppReport
    AutoStop = False
    DataPipeline = ppDBProdutos
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
    Left = 301
    Top = 89
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProdutos'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 29104
        mmLeft = 4498
        mmTop = 3704
        mmWidth = 42598
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2910
        mmTop = 35983
        mmWidth = 192000
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 4233
        mmTop = 36513
        mmWidth = 14309
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 70379
        mmTop = 36513
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'REFERENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 32808
        mmTop = 36513
        mmWidth = 22691
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2910
        mmTop = 41010
        mmWidth = 192000
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 163248
        mmTop = 36513
        mmWidth = 23241
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'MOVIMENTO DE PRODUTOS VENDIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 8731
        mmWidth = 67733
        BandType = 0
      end
      object txtData: TppLabel
        UserName = 'txtData'
        Caption = 'DATA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 114300
        mmTop = 13758
        mmWidth = 11345
        BandType = 0
      end
      object txtProduto: TppLabel
        UserName = 'txtData1'
        Caption = 'PRODUTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 114300
        mmTop = 18521
        mmWidth = 18627
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HIS_PRODUTO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PRO_REFERENCIA'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 32808
        mmTop = 0
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 70379
        mmTop = 0
        mmWidth = 91546
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'TOTAL'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line8'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2910
        mmTop = 1588
        mmWidth = 192088
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data\Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 142200
        mmTop = 3704
        mmWidth = 16976
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 8467
        mmWidth = 11906
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
        mmHeight = 4022
        mmLeft = 160338
        mmTop = 3704
        mmWidth = 32131
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 160602
        mmTop = 8467
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 192088
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'REGISTRO(S):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 2910
        mmWidth = 24299
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 3175
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOTAL'
        DataPipeline = ppDBProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBProdutos'
        mmHeight = 4022
        mmLeft = 165629
        mmTop = 3175
        mmWidth = 19579
        BandType = 7
      end
    end
  end
  object ppDBProdutos: TppDBPipeline
    DataSource = dsProdutos
    UserName = 'DBProdutos'
    Left = 333
    Top = 89
    object ppDBProdutosppField1: TppField
      FieldAlias = 'HIS_DATA'
      FieldName = 'HIS_DATA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 0
    end
    object ppDBProdutosppField2: TppField
      FieldAlias = 'HIS_PRODUTO'
      FieldName = 'HIS_PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBProdutosppField3: TppField
      FieldAlias = 'PRO_REFERENCIA'
      FieldName = 'PRO_REFERENCIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object ppDBProdutosppField4: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppDBProdutosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'HIS_VLVENDA'
      FieldName = 'HIS_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppDBProdutosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
  end
end
