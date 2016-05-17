object frmGrupoLojas: TfrmGrupoLojas
  Left = 214
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro Lojas por Grupos'
  ClientHeight = 444
  ClientWidth = 635
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Grupo:'
      FocusControl = cmbGrupos
      Transparent = True
    end
    object lblRegistros: TLabel
      Left = 496
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Registros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object cmbGrupos: TComboBox
      Left = 16
      Top = 22
      Width = 289
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnEnter = cmbGruposEnter
    end
    object BitBtn1: TBitBtn
      Left = 312
      Top = 21
      Width = 75
      Height = 25
      Caption = 'C&onsultar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 635
    Height = 346
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 344
      Align = alClient
      DataSource = dsConsultar
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = DBGrid1Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'CLI_CODIGO'
          ReadOnly = True
          Title.Caption = 'C'#211'DIGO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_FANTASIA'
          ReadOnly = True
          Title.Caption = 'LOJA\COMODAT'#193'RIO\LOCAT'#193'RIO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 278
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NRBOX'
          Title.Caption = 'N'#186'. BOX'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 218
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 403
    Width = 635
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtGravar: TBitBtn
      Left = 536
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
      TabOrder = 0
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
    object BtCancelar: TBitBtn
      Left = 456
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
      TabOrder = 1
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
  end
  object dstConsultar: TSQLDataSet
    CommandText = 
      'select CL.CLI_CODIGO, CL.CLI_FANTASIA, CL.CLI_CGC, CL.CLI_NRBOX,' +
      ' CL.cli_tipopessoa , CL.CLI_CDGRUPO'#13#10'from CLIENTES CL WHERE (CL.' +
      'CLI_CDGRUPO = :pCDGRUPO)'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDGRUPO'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 416
    Top = 105
    object dstConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstConsultarCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConsultarCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstConsultarCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
      ProviderFlags = [pfInUpdate]
    end
    object dstConsultarCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstConsultarCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspConsultar: TDataSetProvider
    DataSet = dstConsultar
    Options = [poAllowCommandText]
    OnGetTableName = dspConsultarGetTableName
    Left = 456
    Top = 105
  end
  object cdsConsultar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDGRUPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultar'
    Left = 488
    Top = 105
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsConsultarCLI_CGC: TStringField
      FieldName = 'CLI_CGC'
      Size = 14
    end
    object cdsConsultarCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
    object cdsConsultarCLI_TIPOPESSOA: TStringField
      FieldName = 'CLI_TIPOPESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarCLI_CDGRUPO: TIntegerField
      FieldName = 'CLI_CDGRUPO'
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    OnDataChange = dsConsultarDataChange
    Left = 520
    Top = 105
  end
end
