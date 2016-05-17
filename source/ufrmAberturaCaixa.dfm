object frmAberturaCaixa: TfrmAberturaCaixa
  Left = 254
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abertura de Caixa'
  ClientHeight = 297
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCliente: TPanel
    Left = 0
    Top = 29
    Width = 411
    Height = 227
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Registro:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 23
      Height = 13
      Caption = '&Loja:'
      FocusControl = cmbLoja
      Transparent = True
    end
    object DBText1: TDBText
      Left = 16
      Top = 22
      Width = 79
      Height = 22
      AutoSize = True
      Color = clBtnFace
      DataField = 'CAI_NUMERO'
      DataSource = Dm.dsCaixa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 90
      Width = 91
      Height = 13
      Caption = '&Operador do Caixa:'
      FocusControl = dbeCAIXA
      Transparent = True
    end
    object lbl_NMUSUA: TLabel
      Left = 149
      Top = 110
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object sbLocCaixa: TSpeedButton
      Left = 117
      Top = 104
      Width = 23
      Height = 22
      Hint = 'Localiza caixa'
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
      OnClick = sbLocCaixaClick
    end
    object Label3: TLabel
      Left = 16
      Top = 127
      Width = 57
      Height = 13
      Caption = '&Valor Inicial:'
      FocusControl = edtVLINIC
      Transparent = True
    end
    object edtSENHA: TLabeledEdit
      Left = 18
      Top = 181
      Width = 100
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = '&Senha:'
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 3
      OnChange = edtSENHAChange
      OnKeyPress = edtSENHAKeyPress
    end
    object cmbLoja: TDBLookupComboBox
      Left = 16
      Top = 64
      Width = 353
      Height = 21
      DataField = 'CAI_NOMELOJA'
      DataSource = Dm.dsCaixa
      TabOrder = 0
      OnExit = cmbLojaExit
      OnKeyPress = cmbLojaKeyPress
    end
    object dbeCAIXA: TEdit
      Left = 16
      Top = 104
      Width = 100
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnChange = dbeCAIXAChange
      OnEnter = dbeCAIXAEnter
      OnExit = dbeCAIXAExit
      OnKeyPress = dbeCAIXAKeyPress
    end
    object edtVLINIC: TCurrencyEdit
      Left = 17
      Top = 142
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-,0.00'
      TabOrder = 2
      OnEnter = edtVLINICEnter
      OnKeyPress = edtVLINICKeyPress
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 256
    Width = 411
    Height = 41
    Align = alBottom
    TabOrder = 1
    object pnlBotoes: TPanel
      Left = 1
      Top = -1
      Width = 409
      Height = 41
      Align = alBottom
      Color = clNavy
      TabOrder = 0
      object BtCancelar: TBitBtn
        Left = 242
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtCancelarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
          0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
          0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
          1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
          3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
          5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
          2828281F05002828282828282828282828282817050713282828282828282828
          2828282817060715282828282828282828282828281507062328280004040404
          040404232828000701282802090807070707061B28282706062328040B090711
          2727272828282800071328060D070A07232828282828281C070128070E13020B
          082028282828281C0701280F101D28020D0818282828280107132816191E2828
          140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
          282827140808041B282828282828282828282828282828282828282828282828
          2828282828282828282828282828282828282828282828282828}
      end
      object BtGravar: TBitBtn
        Left = 322
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Gravar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtGravarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000942929009431
          31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
          4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
          5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
          73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
          8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
          A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
          BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
          CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
          E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
          33343433332505050B4848191516111B27384647452D0002131048191515111A
          05184046492E0102121048191515111C03032F42493200011210481915151120
          0601243A493200011210481915151221231D1F27322C04041310481915151515
          1515151313151515160F48190D111E282B292B2828292B26150C481909384544
          4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
          3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
          4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
          4343434343434630130F4848092D3A363636363636363A2A0748}
      end
    end
  end
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 29
    Align = alTop
    BevelInner = bvRaised
    Color = clBlue
    TabOrder = 2
    Visible = False
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from USUARIOS')
    SQLConnection = Dm.SqlAdmin
    Left = 172
    Top = 38
  end
  object dstCaixa: TSQLDataSet
    CommandText = 
      'Select CAI_LOJA, CAI_DTABERTURA from CAIXA'#13#10'Where (CAI_LOJA = :p' +
      'CODIGO) and (CAI_DTABERTURA = :pDTABERTURA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTABERTURA'
        ParamType = ptInput
        Value = 0d
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 208
    Top = 37
    object dstCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
    end
    object dstCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = dstCaixa
    Options = [poAllowCommandText]
    Left = 240
    Top = 37
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'pDTABERTURA'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'dspCaixa'
    Left = 272
    Top = 37
    object cdsCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
    end
    object cdsCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
    end
  end
  object ppDBPLoja: TppDBPipeline
    DataSource = Dm.DsEmpresas
    UserName = 'DBPLoja'
    Left = 304
    Top = 125
    object ppDBPLojappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_CODIGO'
      FieldName = 'EMP_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPLojappField2: TppField
      FieldAlias = 'EMP_FANTASIA'
      FieldName = 'EMP_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPLojappField3: TppField
      FieldAlias = 'EMP_RAZAO'
      FieldName = 'EMP_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPLojappField4: TppField
      FieldAlias = 'EMP_ENDERECO'
      FieldName = 'EMP_ENDERECO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPLojappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_NUMERO'
      FieldName = 'EMP_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPLojappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAI_CODIGO'
      FieldName = 'BAI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPLojappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CID_CODIGO'
      FieldName = 'CID_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPLojappField8: TppField
      FieldAlias = 'EMP_CNPJ'
      FieldName = 'EMP_CNPJ'
      FieldLength = 14
      DisplayWidth = 14
      Position = 7
    end
    object ppDBPLojappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_LIMCAIXA'
      FieldName = 'EMP_LIMCAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPLojappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_SEQUENCIA'
      FieldName = 'EMP_SEQUENCIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPLojappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_VENDA'
      FieldName = 'EMP_VENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPLojappField12: TppField
      FieldAlias = 'EMP_DTCAIXA'
      FieldName = 'EMP_DTCAIXA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPLojappField13: TppField
      FieldAlias = 'EMP_FLCAIXA'
      FieldName = 'EMP_FLCAIXA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppDBPLojappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_CAIXA'
      FieldName = 'EMP_CAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPLojappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMP_NRNOTA'
      FieldName = 'EMP_NRNOTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
  end
  object ppRepAbertura: TppReport
    AutoStop = False
    DataPipeline = ppDBPCaixa
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
    Template.FileName = 'Z:\EMPRESA\SERVICO\DELPHI\Relatorios\rbAberturaCaixa.rtm'
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
    Top = 37
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPCaixa'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMP_RAZAO'
        DataPipeline = ppDBPLoja
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPLoja'
        mmHeight = 4763
        mmLeft = 43656
        mmTop = 5027
        mmWidth = 107950
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'CGC :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 70379
        mmTop = 10583
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'EMP_CNPJ'
        DataPipeline = ppDBPLoja
        DisplayFormat = '99.999.999/9999-99;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPLoja'
        mmHeight = 4763
        mmLeft = 83079
        mmTop = 10583
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'ABERTURA DE CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 80169
        mmTop = 16140
        mmWidth = 36777
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197909
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Registro Inicial :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CAI_RGINICIAL'
        DataPipeline = ppDBPCaixa
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCaixa'
        mmHeight = 4763
        mmLeft = 29369
        mmTop = 1323
        mmWidth = 32808
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2647
        mmTop = 7144
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Abertura:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2646
        mmTop = 12700
        mmWidth = 24341
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CAI_DTABERTURA'
        DataPipeline = ppDBPCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCaixa'
        mmHeight = 4741
        mmLeft = 29370
        mmTop = 12700
        mmWidth = 32809
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Hora Abertura:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2646
        mmTop = 17992
        mmWidth = 24341
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CAI_HOABERTURA'
        DataPipeline = ppDBPCaixa
        DisplayFormat = '##:##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCaixa'
        mmHeight = 4741
        mmLeft = 29370
        mmTop = 17991
        mmWidth = 32809
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Caixa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 2646
        mmTop = 23548
        mmWidth = 24341
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CAI_CAIXA'
        DataPipeline = ppDBPCaixa
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPCaixa'
        mmHeight = 4763
        mmLeft = 29369
        mmTop = 23548
        mmWidth = 7408
        BandType = 4
      end
      object txtNMCAIX: TppLabel
        UserName = 'txtNMCAIX'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 37306
        mmTop = 23548
        mmWidth = 3048
        BandType = 4
      end
      object lbl_VLINIC: TppLabel
        UserName = 'lbl_VLINIC'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 7144
        mmWidth = 6879
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 198000
        BandType = 8
      end
    end
  end
  object ppDBPCaixa: TppDBPipeline
    DataSource = Dm.dsCaixa
    UserName = 'DBPCaixa'
    Left = 304
    Top = 157
    object ppDBPCaixappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_NUMERO'
      FieldName = 'CAI_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPCaixappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_LOJA'
      FieldName = 'CAI_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPCaixappField3: TppField
      FieldAlias = 'CAI_DTABERTURA'
      FieldName = 'CAI_DTABERTURA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPCaixappField4: TppField
      FieldAlias = 'CAI_DTFECHAMENTO'
      FieldName = 'CAI_DTFECHAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPCaixappField5: TppField
      FieldAlias = 'CAI_HOABERTURA'
      FieldName = 'CAI_HOABERTURA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppDBPCaixappField6: TppField
      FieldAlias = 'CAI_HOFECHAMENTO'
      FieldName = 'CAI_HOFECHAMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDBPCaixappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_RGINICIAL'
      FieldName = 'CAI_RGINICIAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPCaixappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_RGFINAL'
      FieldName = 'CAI_RGFINAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPCaixappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAI_CAIXA'
      FieldName = 'CAI_CAIXA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPCaixappField10: TppField
      FieldAlias = 'CAI_SITUACAO'
      FieldName = 'CAI_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppDBPCaixappField11: TppField
      FieldAlias = 'CAI_NOMELOJA'
      FieldName = 'CAI_NOMELOJA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
  end
  object qryCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select CAI_LOJA, CAI_CAIXA, CAI_SITUACAO from CAIXA'
      'Where (CAI_CAIXA = :pCAIXA)'
      'AND (CAI_SITUACAO = :pSITUACAO)')
    SQLConnection = Dm.SqlAdmin
    Left = 312
    Top = 37
  end
  object qryLojas2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS'
      'order by EMP_FANTASIA')
    SQLConnection = Dm.SqlAdmin
    Left = 256
    Top = 1
    object qryLojas2EMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
    end
    object qryLojas2EMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object qryLojas2EMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
  end
  object qryLoja: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS'
      'Where (EMP_CODIGO = :pCODIGO)')
    SQLConnection = Dm.SqlAdmin
    Left = 192
    Top = 1
  end
  object cdsLojas2: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS order b' +
      'y EMP_FANTASIA'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 352
    Top = 133
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 184
    Top = 184
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS order b' +
      'y EMP_FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 184
    Top = 128
  end
  object cdsLoja: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS Where (' +
      'EMP_CODIGO = :pCODIGO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 165
  end
  object cdsProcurar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 368
    Top = 165
  end
  object cdsCaixa2: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select CAI_LOJA, CAI_CAIXA, CAI_SITUACAO from CAIXA Where (CAI_C' +
      'AIXA = :pCAIXA) AND (CAI_SITUACAO = :pSITUACAO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 320
    Top = 205
  end
end
