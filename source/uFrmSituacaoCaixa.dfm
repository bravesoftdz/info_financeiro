object frmSituacaoCaixa: TfrmSituacaoCaixa
  Left = 220
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Situa'#231#227'o do Caixa'
  ClientHeight = 231
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 190
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 23
      Height = 13
      Caption = '&Loja:'
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 57
      Width = 91
      Height = 13
      Caption = '&Operador do Caixa:'
      FocusControl = dbeCAIXA
      Transparent = True
    end
    object sbLocCaixa: TSpeedButton
      Left = 117
      Top = 71
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
    object lbl_NMUSUA: TLabel
      Left = 145
      Top = 77
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
    object dbeCAIXA: TEdit
      Left = 16
      Top = 71
      Width = 100
      Height = 21
      MaxLength = 3
      TabOrder = 1
      OnChange = dbeCAIXAChange
      OnEnter = dbeCAIXAEnter
      OnExit = dbeCAIXAExit
      OnKeyPress = dbeCAIXAKeyPress
    end
    object edtSENHA: TLabeledEdit
      Left = 16
      Top = 109
      Width = 100
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = '&Senha:'
      MaxLength = 6
      PasswordChar = '*'
      TabOrder = 2
      OnExit = edtSENHAExit
      OnKeyPress = edtSENHAKeyPress
    end
    object cmbNMLOJA: TComboBox
      Left = 16
      Top = 32
      Width = 299
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnExit = cmbNMLOJAExit
      OnKeyPress = cmbNMLOJAKeyPress
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 190
    Width = 343
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtCancelar: TBitBtn
      Left = 170
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtCancelarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BtGravar: TBitBtn
      Left = 250
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
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
        08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
        73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
        8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
        9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
        A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
        AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
        BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
        D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
        E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
        F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
        424242424242424242422B39180B42424242424242424242424243443C180B42
        4242424242424242424242444438180B42424242424242424242424244433918
        0A424242424242424242424242444335004201101A114242424242424242453D
        05072F343434291942424242424242221A2D34343437403E0442424242424206
        231C303437404146284242424242421B210F30373A414140310D42424242421F
        20032434373A3A37321342424242421D25030F2D37373737311042424242420D
        2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
        4227312D21252314424242424242424242420E141B1B42424242}
    end
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from USUARIOS')
    SQLConnection = Dm.SqlAdmin
    Left = 162
  end
  object qryCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end
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
      
        'Select CAI_NUMERO, CAI_LOJA, CAI_CAIXA, CAI_SITUACAO, CAI_RGINIC' +
        'IAL from CAIXA'
      'Where (CAI_LOJA = :pLOJA) AND (CAI_CAIXA = :pCAIXA)'
      'AND (CAI_SITUACAO = :pSITUACAO)')
    SQLConnection = Dm.SqlAdmin
    Left = 192
  end
  object qryLojas2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select EMP_CODIGO, EMP_FANTASIA, EMP_RAZAO from EMPRESAS'
      'order by EMP_FANTASIA')
    SQLConnection = Dm.SqlAdmin
    Left = 224
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
    Left = 254
    Top = 1
  end
  object ppRSituacaoCaixa: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeMovCaixa
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (21 x 29,7 cm) '
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'Z:\EMPRESA\SERVICO\DELPHI\Relatorios\rbSituacaoCaixa.rtm'
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
    Left = 280
    Top = 96
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeMovCaixa'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object lbl_NMRELA: TppLabel
        UserName = 'lbl_NMRELA'
        Caption = 'lbl_NMRELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 113772
        mmTop = 3175
        mmWidth = 20320
        BandType = 0
      end
      object lblCaixa: TppLabel
        UserName = 'lbl_NMRELA1'
        Caption = 'lbl_NMRELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 113772
        mmTop = 7408
        mmWidth = 20373
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1323
        mmTop = 529
        mmWidth = 41540
        BandType = 0
      end
      object lblVLINICIAL: TppLabel
        UserName = 'lblVLINICIAL'
        Caption = 'ABERTURA DO CAIXA : 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 0
        mmTop = 26458
        mmWidth = 47159
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 31221
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MCA_VLMODALIDADE'
        DataPipeline = ppDBPipeMovCaixa
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeMovCaixa'
        mmHeight = 4064
        mmLeft = 147617
        mmTop = 264
        mmWidth = 37592
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MCA_DESCNATU'
        DataPipeline = ppDBPipeMovCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeMovCaixa'
        mmHeight = 4064
        mmLeft = 1588
        mmTop = 264
        mmWidth = 71438
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MCA_OBSERVACAO'
        DataPipeline = ppDBPipeMovCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeMovCaixa'
        mmHeight = 3969
        mmLeft = 74613
        mmTop = 265
        mmWidth = 70908
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MCA_SINAL'
        DataPipeline = ppDBPipeMovCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeMovCaixa'
        mmHeight = 4064
        mmLeft = 187590
        mmTop = 265
        mmWidth = 8467
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
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
      object ppLabel2: TppLabel
        UserName = 'Label2'
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
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 63500
      mmPrintPosition = 0
      object ppMmoModa: TppMemo
        UserName = 'MmoModa'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 48154
        mmLeft = 794
        mmTop = 7938
        mmWidth = 53975
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'RESUMO MODALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 2910
        mmWidth = 40471
        BandType = 7
      end
      object MmoValor: TppMemo
        UserName = 'MmoModa1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 48154
        mmLeft = 57415
        mmTop = 7938
        mmWidth = 37042
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object mmoInfo: TppMemo
        UserName = 'mmoInfo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 48154
        mmLeft = 95515
        mmTop = 7938
        mmWidth = 37042
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object mmoDiferenca: TppMemo
        UserName = 'mmoDiferenca'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 48154
        mmLeft = 133615
        mmTop = 7938
        mmWidth = 37042
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'INFORMADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 109802
        mmTop = 2910
        mmWidth = 21960
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'DIFEREN'#199'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 2910
        mmWidth = 20638
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197380
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MCA_MODALIDADE'
      DataPipeline = ppDBPipeMovCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeMovCaixa'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 172509
          mmTop = 795
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'OBSERVA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 74877
          mmTop = 529
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'MCA_MODANOME'
          DataPipeline = ppDBPipeMovCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeMovCaixa'
          mmHeight = 3979
          mmLeft = 1588
          mmTop = 795
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 265
          mmTop = 5027
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'MCA_VLMODALIDADE'
          DataPipeline = ppDBPipeMovCaixa
          DisplayFormat = '###,###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeMovCaixa'
          mmHeight = 4233
          mmLeft = 147902
          mmTop = 1058
          mmWidth = 37306
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 529
          mmTop = 5556
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 143934
          mmTop = 265
          mmWidth = 53711
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsMovCaixa: TDataSource
    DataSet = cdsMovCaixa
    Left = 208
    Top = 128
  end
  object cdsMovCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsMovCaixaCalcFields
    Left = 208
    Top = 64
    Data = {
      E30000009619E0BD010000001800000006000000000003000000E3000E4D4341
      5F4D4F44414C494441444501004900000001000557494454480200020002000C
      4D43415F4D4F44414E4F4D450100490000000100055749445448020002001E00
      0C4D43415F4E41545552455A4104000100000000000E4D43415F4F4253455256
      4143414F0100490000000100055749445448020002002800104D43415F564C4D
      4F44414C4944414445080004000000010007535542545950450200490006004D
      6F6E6579000B4D43415F5449504F4D4F56010049000000010005574944544802
      00020001000000}
    object cdsMovCaixaMCA_MODALIDADE: TStringField
      FieldName = 'MCA_MODALIDADE'
      Size = 2
    end
    object cdsMovCaixaMCA_MODANOME: TStringField
      FieldName = 'MCA_MODANOME'
      Size = 30
    end
    object cdsMovCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
    end
    object cdsMovCaixaMCA_OBSERVACAO: TStringField
      FieldName = 'MCA_OBSERVACAO'
      Size = 40
    end
    object cdsMovCaixaMCA_VLMODALIDADE: TCurrencyField
      FieldName = 'MCA_VLMODALIDADE'
    end
    object cdsMovCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      Size = 1
    end
    object cdsMovCaixaMCA_NOMENATUREZA: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NOMENATUREZA'
      LookupDataSet = qryNatureza
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'MCA_NATUREZA'
      Size = 30
      Lookup = True
    end
    object cdsMovCaixaMCA_DESCNATU: TStringField
      FieldKind = fkCalculated
      FieldName = 'MCA_DESCNATU'
      Size = 30
      Calculated = True
    end
    object cdsMovCaixaMCA_SINAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'MCA_SINAL'
      Size = 3
      Calculated = True
    end
  end
  object qryMovCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pMODALIDADE'
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
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select MCA_MODALIDADE, MCA_NATUREZA, MCA_OBSEVACAO,'
      'Sum(MCA_VLMODALIDADE) AS TOTAL from movimento_caixa '
      'Where (MCA_MODALIDADE = :pMODALIDADE) and (MCA_LOJA = :pLOJA) '
      'AND (MCA_SEQUENCIA >= :pSEQUENCIA) AND (MCA_CAIXA = :pCAIXA) '
      'AND (MCA_TIPOMOV = :pTIPOMOV)'
      'Group by MCA_MODALIDADE, MCA_NATUREZA, MCA_OBSEVACAO')
    SQLConnection = Dm.SqlAdmin
    Left = 280
    Top = 64
  end
  object ppDBPipeMovCaixa: TppDBPipeline
    DataSource = dsMovCaixa
    UserName = 'DBPipeMovCaixa'
    Left = 208
    Top = 96
    object ppDBPipeMovCaixappField1: TppField
      FieldAlias = 'MCA_MODALIDADE'
      FieldName = 'MCA_MODALIDADE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppDBPipeMovCaixappField2: TppField
      FieldAlias = 'MCA_MODANOME'
      FieldName = 'MCA_MODANOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppDBPipeMovCaixappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MCA_NATUREZA'
      FieldName = 'MCA_NATUREZA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeMovCaixappField4: TppField
      FieldAlias = 'MCA_OBSERVACAO'
      FieldName = 'MCA_OBSERVACAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppDBPipeMovCaixappField5: TppField
      FieldAlias = 'MCA_VLMODALIDADE'
      FieldName = 'MCA_VLMODALIDADE'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeMovCaixappField6: TppField
      FieldAlias = 'MCA_TIPOMOV'
      FieldName = 'MCA_TIPOMOV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppDBPipeMovCaixappField7: TppField
      FieldAlias = 'MCA_NOMENATUREZA'
      FieldName = 'MCA_NOMENATUREZA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppDBPipeMovCaixappField8: TppField
      FieldAlias = 'MCA_DESCNATU'
      FieldName = 'MCA_DESCNATU'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPipeMovCaixappField9: TppField
      FieldAlias = 'MCA_SINAL'
      FieldName = 'MCA_SINAL'
      FieldLength = 3
      DisplayWidth = 3
      Position = 8
    end
  end
  object qryNatureza: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select NAT_CODIGO, NAT_NOME from NATUREZA'
      'order by NAT_NOME')
    SQLConnection = Dm.SqlAdmin
    Left = 288
  end
  object ppDBParametros: TppDBPipeline
    DataSource = Dm.DsConfig
    UserName = 'DBParametros'
    Left = 144
    Top = 120
    object ppDBParametrosppField32: TppField
      FieldAlias = 'CFG_IMAGEMLOGO'
      FieldName = 'CFG_IMAGEMLOGO'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object qryVLINICIAL: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
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
        Name = 'pCAIXA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pTIPOMOV'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select MCA_VLMODALIDADE from MOVIMENTO_CAIXA'
      'Where (MCA_SEQUENCIA = :pSEQUENCIA)'
      'and (MCA_LOJA = :pLOJA)'
      'AND (MCA_CAIXA = :pCAIXA)'
      'AND (MCA_TIPOMOV = :pTIPOMOV)')
    SQLConnection = Dm.SqlAdmin
    Left = 120
  end
end
