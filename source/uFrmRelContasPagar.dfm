object frmRelContasPagar: TfrmRelContasPagar
  Left = 253
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Contas '#224' Pagar'
  ClientHeight = 296
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 386
    Height = 255
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '&Dados'
      object Label1: TLabel
        Left = 16
        Top = 93
        Width = 41
        Height = 13
        Caption = 'P&er'#237'odo '
        FocusControl = edtDTINIC
        Transparent = True
      end
      object Label3: TLabel
        Left = 16
        Top = 178
        Width = 54
        Height = 13
        Caption = 'F&ornecedor'
        FocusControl = edtCDFORN
      end
      object spLocFornecedor: TSpeedButton
        Left = 82
        Top = 194
        Width = 23
        Height = 22
        Hint = 'Localizar fornecedor'
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
        OnClick = spLocFornecedorClick
      end
      object Label5: TLabel
        Left = 16
        Top = 135
        Width = 55
        Height = 13
        Caption = '&Condominio'
        FocusControl = cmbNMLOJA
        Transparent = True
      end
      object Label6: TLabel
        Left = 146
        Top = 115
        Width = 6
        Height = 13
        Caption = #224
        Transparent = True
      end
      object rgTipos: TRadioGroup
        Left = 14
        Top = 6
        Width = 267
        Height = 39
        Caption = '[ Tipo ]'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '&Emiss'#227'o'
          '&Vencimento'
          '&Pagamento')
        TabOrder = 0
      end
      object edtDTINIC: TDateEdit
        Left = 16
        Top = 111
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnExit = edtDTINICExit
      end
      object edtDTFINA: TDateEdit
        Left = 159
        Top = 111
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
        OnExit = edtDTFINAExit
      end
      object edtCDFORN: TEdit
        Left = 16
        Top = 194
        Width = 65
        Height = 21
        MaxLength = 6
        TabOrder = 5
        OnChange = edtCDFORNChange
        OnEnter = edtCDFORNEnter
        OnExit = edtCDFORNExit
        OnKeyPress = edtCDFORNKeyPress
      end
      object cmbNMLOJA: TComboBox
        Left = 15
        Top = 151
        Width = 265
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 4
      end
      object rbSituacao: TRadioGroup
        Left = 16
        Top = 49
        Width = 265
        Height = 39
        Caption = '[ Situa'#231#227'o ]'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '&Abertas'
          '&Pagas'
          '&Todas')
        TabOrder = 1
      end
      object lbl_NMFORN: TEdit
        Left = 108
        Top = 194
        Width = 250
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Pagas'
      ImageIndex = 1
      TabVisible = False
      object Label2: TLabel
        Left = 16
        Top = 52
        Width = 41
        Height = 13
        Caption = 'Per'#237'odo '
        Transparent = True
      end
      object Label4: TLabel
        Left = 16
        Top = 96
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
      end
      object SpeedButton1: TSpeedButton
        Left = 138
        Top = 112
        Width = 23
        Height = 22
        Hint = 'Localizar fornecedor'
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
      end
      object lbl_NMFORN2: TLabel
        Left = 165
        Top = 118
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rbTipo2: TRadioGroup
        Left = 14
        Top = 10
        Width = 259
        Height = 39
        Caption = '[ Tipo ]'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&Pagamento'
          '&Vencimento')
        TabOrder = 0
      end
      object edtDTINIC2: TDateEdit
        Left = 16
        Top = 70
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnExit = edtDTINIC2Exit
      end
      object edtDTFINA2: TDateEdit
        Left = 152
        Top = 70
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnExit = edtDTFINA2Exit
      end
      object edtCDCLIE2: TEdit
        Left = 16
        Top = 112
        Width = 121
        Height = 21
        MaxLength = 7
        TabOrder = 3
        OnKeyPress = edtCDCLIE2KeyPress
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 255
    Width = 386
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 296
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtSairClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
    object btImprimir: TBitBtn
      Left = 208
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = btImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
  end
  object dstContas: TSQLDataSet
    CommandText = 
      'Select CP.PAG_LOJA, EP.EMP_FANTASIA, CP.PAG_NRENTRADA, CP.PAG_PA' +
      'RCELA, CP.PAG_DATACOMPRA, CP.PAG_DATAVENCIMENTO , CP.PAG_FORNECE' +
      'DOR, CP.PAG_NRNOTA, CP.PAG_DESCRICAO, CP.PAG_VALORPARCELA, CP.PA' +
      'G_SITUACAO, CP.PAG_DATAPAGAMENTO, CP.PAG_VALORPAGO, CP.PAG_VALOR' +
      'DESCONTO, CP.PAG_VALORJUROS, CP.PAG_USUARIO, (Select F.FOR_FANTA' +
      'SIA FROM FORNECEDORES F WHERE (CP.PAG_FORNECEDOR = F.FOR_CODIGO)' +
      ') AS fornecedor FROM CONTASPAGAR CP INNER join EMPRESAS EP ON CP' +
      '.PAG_LOJA = EP.EMP_CODIGO '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 181
  end
  object dspContas: TDataSetProvider
    DataSet = dstContas
    Options = [poAllowCommandText]
    Left = 40
    Top = 181
  end
  object cdsContas: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select CP.PAG_LOJA, EP.EMP_FANTASIA, CP.PAG_NRENTRADA, CP.PAG_PA' +
      'RCELA, CP.PAG_DATACOMPRA, CP.PAG_DATAVENCIMENTO , CP.PAG_FORNECE' +
      'DOR, CP.PAG_NRNOTA, CP.PAG_DESCRICAO, CP.PAG_VALORPARCELA, CP.PA' +
      'G_SITUACAO, CP.PAG_DATAPAGAMENTO, CP.PAG_VALORPAGO, CP.PAG_VALOR' +
      'DESCONTO, CP.PAG_VALORJUROS, CP.PAG_USUARIO, (Select F.FOR_FANTA' +
      'SIA FROM FORNECEDORES F WHERE (CP.PAG_FORNECEDOR = F.FOR_CODIGO)' +
      ') AS fornecedor FROM CONTASPAGAR CP INNER join EMPRESAS EP ON CP' +
      '.PAG_LOJA = EP.EMP_CODIGO '
    Params = <>
    ProviderName = 'dspContas'
    OnCalcFields = cdsContasCalcFields
    Left = 320
    Top = 165
    object cdsContasPAG_LOJA: TIntegerField
      FieldName = 'PAG_LOJA'
      Required = True
    end
    object cdsContasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsContasPAG_NRENTRADA: TIntegerField
      FieldName = 'PAG_NRENTRADA'
      Required = True
    end
    object cdsContasPAG_PARCELA: TStringField
      FieldName = 'PAG_PARCELA'
      FixedChar = True
      Size = 2
    end
    object cdsContasPAG_DATACOMPRA: TDateField
      FieldName = 'PAG_DATACOMPRA'
    end
    object cdsContasPAG_DATAVENCIMENTO: TDateField
      FieldName = 'PAG_DATAVENCIMENTO'
    end
    object cdsContasPAG_FORNECEDOR: TIntegerField
      FieldName = 'PAG_FORNECEDOR'
    end
    object cdsContasPAG_NRNOTA: TStringField
      FieldName = 'PAG_NRNOTA'
      FixedChar = True
      Size = 12
    end
    object cdsContasPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      Precision = 15
      Size = 2
    end
    object cdsContasPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsContasPAG_DATAPAGAMENTO: TDateField
      FieldName = 'PAG_DATAPAGAMENTO'
    end
    object cdsContasPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      Precision = 15
      Size = 2
    end
    object cdsContasPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      Precision = 15
      Size = 2
    end
    object cdsContasPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      Precision = 15
      Size = 2
    end
    object cdsContasPAG_USUARIO: TIntegerField
      FieldName = 'PAG_USUARIO'
    end
    object cdsContasFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 50
    end
    object cdsContasDIAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DIAS'
    end
    object cdsContasPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      BlobType = ftMemo
    end
  end
  object dsAbertas: TDataSource
    DataSet = cdsContas
    Left = 284
    Top = 176
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 316
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = Dm.ppDBParametros
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBParametros'
        mmHeight = 23283
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'RELAT'#211'RIO : CONTAS '#192' PAGAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 178330
        mmTop = 2117
        mmWidth = 55287
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'txtPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 11377
        mmWidth = 16140
        BandType = 0
      end
      object lblSituacao: TppLabel
        UserName = 'lblSituacao'
        Caption = 'lblSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 178330
        mmTop = 15875
        mmWidth = 17463
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 32808
        mmWidth = 284428
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 38894
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3895
        mmLeft = 1323
        mmTop = 34131
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23548
        mmTop = 34131
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 63500
        mmTop = 34131
        mmWidth = 4403
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'COMPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 46302
        mmTop = 34131
        mmWidth = 14309
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'N'#186'.NOTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 71438
        mmTop = 34131
        mmWidth = 13462
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 98161
        mmTop = 34396
        mmWidth = 22691
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'PARCELA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 189707
        mmTop = 34396
        mmWidth = 15325
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 214842
        mmTop = 34396
        mmWidth = 9483
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 233363
        mmTop = 34396
        mmWidth = 11007
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'DESCONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3895
        mmLeft = 247386
        mmTop = 34396
        mmWidth = 18119
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'ATS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 274373
        mmTop = 34396
        mmWidth = 6350
        BandType = 0
      end
      object txtLoja: TppLabel
        UserName = 'txtLoja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 178330
        mmTop = 6879
        mmWidth = 16171
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'Label13'
        Caption = 'Label13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 178330
        mmTop = 20373
        mmWidth = 12531
        BandType = 0
      end
      object lblFornecedor: TppLabel
        UserName = 'lblFornecedor'
        Caption = 'lblFornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 178330
        mmTop = 24871
        mmWidth = 19558
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PAG_DATAVENCIMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 1588
        mmTop = 244
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PAG_DATAPAGAMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 23813
        mmTop = 244
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PAG_NRENTRADA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 44979
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PAG_PARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 265
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PAG_NRNOTA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'FORNECEDOR'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 265
        mmWidth = 85725
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PAG_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 188384
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PAG_VALORPAGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 207434
        mmTop = 244
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PAG_VALORJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 227013
        mmTop = 244
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PAG_VALORDESCONTO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 248180
        mmTop = 244
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DIAS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 268023
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284428
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 232569
        mmTop = 2117
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
        mmLeft = 250561
        mmTop = 2117
        mmWidth = 32279
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
        Transparent = True
        mmHeight = 3969
        mmLeft = 267230
        mmTop = 6615
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
        mmLeft = 280723
        mmTop = 6615
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284428
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'PAG_VALORPAGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 207434
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3895
        mmLeft = 0
        mmTop = 1852
        mmWidth = 18119
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3725
        mmLeft = 18785
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PAG_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 188384
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'PAG_VALORDESCONTO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 248180
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'PAG_VALORJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 227013
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsAbertas
    UserName = 'DBPipeline1'
    Left = 316
    Top = 96
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_LOJA'
      FieldName = 'PAG_LOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'EMP_FANTASIA'
      FieldName = 'EMP_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_NRENTRADA'
      FieldName = 'PAG_NRENTRADA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'PAG_PARCELA'
      FieldName = 'PAG_PARCELA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'PAG_DATACOMPRA'
      FieldName = 'PAG_DATACOMPRA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'PAG_DATAVENCIMENTO'
      FieldName = 'PAG_DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_FORNECEDOR'
      FieldName = 'PAG_FORNECEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'PAG_NRNOTA'
      FieldName = 'PAG_NRNOTA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORPARCELA'
      FieldName = 'PAG_VALORPARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'PAG_SITUACAO'
      FieldName = 'PAG_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'PAG_DATAPAGAMENTO'
      FieldName = 'PAG_DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORPAGO'
      FieldName = 'PAG_VALORPAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORDESCONTO'
      FieldName = 'PAG_VALORDESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORJUROS'
      FieldName = 'PAG_VALORJUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 16
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_USUARIO'
      FieldName = 'PAG_USUARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'PAG_DESCRICAO'
      FieldName = 'PAG_DESCRICAO'
      FieldLength = 1
      DataType = dtMemo
      DisplayWidth = 10
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
end
