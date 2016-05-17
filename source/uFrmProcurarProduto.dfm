object frmLocalizaProduto: TfrmLocalizaProduto
  Left = 218
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Procurar Produto'
  ClientHeight = 366
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 28
    Align = alTop
    Color = clBlue
    TabOrder = 1
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 28
    Width = 704
    Height = 37
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 62
      Height = 13
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtNMDESC: TEdit
      Left = 77
      Top = 8
      Width = 444
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 0
      OnChange = edtNMDESCChange
      OnKeyDown = edtNMDESCKeyDown
      OnKeyPress = edtNMDESCKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 325
    Width = 704
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Label2: TLabel
      Left = 10
      Top = 15
      Width = 135
      Height = 13
      Caption = 'Aplica'#231#227'o/Localiza'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object BitBtn1: TBitBtn
      Left = 604
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object btnConfirme: TBitBtn
      Left = 516
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 1
      OnClick = btnConfirmeClick
      Kind = bkOK
    end
    object DBEdit1: TDBEdit
      Left = 146
      Top = 12
      Width = 343
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PRO_APLICACAO'
      DataSource = dsProdutos
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
  object GridProdutos: TDBGrid
    Left = 0
    Top = 65
    Width = 704
    Height = 260
    Align = alClient
    DataSource = dsProdutos
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridProdutosDblClick
    OnKeyDown = GridProdutosKeyDown
    OnKeyPress = GridProdutosKeyPress
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRO_CODIGO'
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_REFERENCIA'
        Title.Caption = 'REFERENCIA'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_NOME'
        Title.Caption = 'FABRICANTE'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNI_CODIGO'
        Title.Caption = 'UNIDADE'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRO_VLVENDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'VALOR'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EST_QUANTIDADE'
        Title.Caption = 'ESTOQUE'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_APLICACAO'
        Title.Caption = 'APLIC.\LOCALIZA'#199#195'O'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 488
    Top = 88
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_DESCRICAO, P.PRO_APLICA' +
      'CAO, P.PRO_VLFRACAO, P.PRO_VLVENDA, P.UNI_CODIGO, P.FOR_CODIGO, ' +
      'PRO_REFERENCIA, '#13#10'(Select FOR_FANTASIA from FORNECEDORES F'#13#10'Wher' +
      'e (F.FOR_CODIGO = P.FOR_CODIGO)) AS FOR_NOME,'#13#10'(Select E.EST_QUA' +
      'NTIDADE from ESTOQUE E'#13#10'Where (E.PRO_CODIGO = P.PRO_CODIGO) '#13#10'AN' +
      'D (E.EST_CODIGOLOJA = :pCDLOJA)) AS EST_QUANTIDADE'#13#10'from PRODUTO' +
      'S P'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 368
    Top = 88
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    Left = 408
    Top = 88
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutos'
    Left = 448
    Top = 88
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 60
    end
    object cdsProdutosPRO_VLFRACAO: TFMTBCDField
      FieldName = 'PRO_VLFRACAO'
      DisplayFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_APLICACAO: TStringField
      FieldName = 'PRO_APLICACAO'
      Size = 60
    end
    object cdsProdutosPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      FixedChar = True
      Size = 2
    end
    object cdsProdutosFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
    end
    object cdsProdutosFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 50
    end
    object cdsProdutosEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsProdutosPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
  end
end
