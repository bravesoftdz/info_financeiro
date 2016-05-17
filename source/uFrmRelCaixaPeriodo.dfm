object FrmRelCaixaPeriodo: TFrmRelCaixaPeriodo
  Left = 216
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Caixa por Per'#237'odo'
  ClientHeight = 345
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 53
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 7
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 141
      Top = 26
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object edtDTINIC: TDateEdit
      Left = 14
      Top = 23
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo inicial'
      NumGlyphs = 2
      TabOrder = 0
      OnEnter = edtDTINICEnter
      OnExit = edtDTINICExit
      OnKeyPress = edtDTINICKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 158
      Top = 23
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo final'
      NumGlyphs = 2
      TabOrder = 1
      OnEnter = edtDTFINAEnter
      OnExit = edtDTFINAExit
      OnKeyPress = edtDTFINAKeyPress
    end
    object btnFiltra: TBitBtn
      Left = 448
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Filtra dados'
      Caption = '&Filtrar'
      TabOrder = 2
      OnClick = btnFiltraClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF075507075507FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0755079D
        D9AD47AA22035300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF135F129DD9AD47AA22095B00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF115E1191
        CE9F41A31F085A00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0F5A0E82CB953CA420075800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF12842325
        BD5014A628047407FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF138A242BD15E19B8420DA12304910B006800FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18922B3AE76F27CB5918
        B23C0C9E1D038A06008200006900FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1C992F4DFF8839E97225CB5816B53A0A9E1A018A03008300008700006A
        00FF00FFFF00FFFF00FFFF00FFFF00FF168E2836DA672CC6551BA1380F8E2707
        7F12047304006A00006900006E00007400006400FF00FFFF00FFFF00FF005200
        0466061566001468010176082A9A3A3ACCCB00C4CE05817F20963521A7371996
        2D067A0E045D08FF00FF004C00005E00748904EB9F22E796117D8F0A0AAA2755
        D48136EBFF00D8FF0D9AA440D7762CD85178C79E12811E004C00FF00FF004C00
        D7A560F3E39EE7CC62D08A0A005303005102468C4D38EDFF005F4F0044004370
        44F75FF43C1339FF00FFFF00FFFF00FFD7B48CFFFFEEF0DD8FD19212FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF9EFFFF03FFAB00AB790179FF00FFFF00FF
        FF00FFC2A072C49541FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFBD3
        FBFA2FFA8B008BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA98FAFF00FFFF00FF}
    end
  end
  object pnlCliente: TPanel
    Left = 0
    Top = 53
    Width = 543
    Height = 253
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 541
      Height = 251
      Align = alClient
      Ctl3D = False
      DataSource = dsCaixa
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CAI_CAIXA'
          Title.Caption = 'CAIXA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMP_FANTASIA'
          Title.Caption = 'LOJA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 359
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAI_DTABERTURA'
          Title.Caption = 'DATA MOVIMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 306
    Width = 543
    Height = 39
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtCancelar: TBitBtn
      Left = 346
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar Janela'
      Caption = '&Sair'
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
      Left = 162
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = BtGravarClick
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
    object btnGerar: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Gerar relat'#243'rio'
      Caption = '&Gerar'
      TabOrder = 2
      OnClick = btnGerarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
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
      'Select MCA_CAIXA, MCA_VLMODALIDADE,'
      '(Select SEN_NOME from USUARIOS Where (USUARIOS.SEN_CODIGO ='
      'MOVIMENTO_CAIXA.MCA_CAIXA)) AS MCA_NMCAIXA from MOVIMENTO_CAIXA'
      'Where (MCA_SEQUENCIA = :pSEQUENCIA)'
      'AND (MCA_CAIXA = :pCAIXA)'
      'AND (MCA_TIPOMOV = :pTIPOMOV)')
    SQLConnection = Dm.SqlAdmin
    Left = 16
    Top = 96
    object qryVLINICIALMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
    end
    object qryVLINICIALMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      Precision = 15
      Size = 2
    end
    object qryVLINICIALMCA_NMCAIXA: TStringField
      FieldName = 'MCA_NMCAIXA'
      Size = 40
    end
  end
  object qryEntradaSaida: TSQLQuery
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
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pSEQFINAL'
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
      'MCA_VLMODALIDADE from movimento_caixa '
      'Where (MCA_MODALIDADE = :pMODALIDADE)'
      'AND (MCA_SEQUENCIA >= :pSEQUENCIA) '
      'AND (MCA_SEQUENCIA <= :pSEQFINAL) '
      'AND (MCA_CAIXA = :pCAIXA) '
      'AND (MCA_TIPOMOV = :pTIPOMOV)')
    SQLConnection = Dm.SqlAdmin
    Left = 48
    Top = 96
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
        Name = 'pSEQUENCIA'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pSEQFINAL'
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
      'Sum(MCA_VLMODALIDADE) AS TOTAL,'
      'Sum(MCA_VLTROCO) AS MCA_TOTROCO from movimento_caixa '
      'Where (MCA_MODALIDADE = :pMODALIDADE)'
      
        'AND (MCA_SEQUENCIA >= :pSEQUENCIA) and (MCA_SEQUENCIA <= :pSEQFI' +
        'NAL) '
      'AND (MCA_CAIXA = :pCAIXA) AND (MCA_TIPOMOV = :pTIPOMOV)'
      'Group by MCA_MODALIDADE, MCA_NATUREZA, MCA_OBSEVACAO')
    SQLConnection = Dm.SqlAdmin
    Left = 88
    Top = 96
  end
  object dstCaixa: TSQLDataSet
    CommandText = 
      'Select CX.CAI_NUMERO, CX.CAI_LOJA, E.EMP_FANTASIA, CX.CAI_DTABER' +
      'TURA, CX.CAI_DTFECHAMENTO, CX.CAI_RGINICIAL, CX.CAI_RGFINAL,'#13#10'CX' +
      '.CAI_CAIXA, CX.CAI_SITUACAO'#13#10'from CAIXA CX'#13#10'INNER join EMPRESAS ' +
      'E ON CX.CAI_LOJA = E.EMP_CODIGO'#13#10'Where (CX.CAI_DTABERTURA >= :pD' +
      'TINCIAL)'#13#10'and (CX.CAI_DTABERTURA <= :pDTFINAL) and (CX.CAI_SITUA' +
      'CAO = :pFLSITU) order by CX.CAI_DTABERTURA;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINCIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 8
    Top = 128
    object dstCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      Required = True
    end
    object dstCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
    end
    object dstCaixaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object dstCaixaCAI_DTABERTURA: TDateField
      FieldName = 'CAI_DTABERTURA'
    end
    object dstCaixaCAI_DTFECHAMENTO: TDateField
      FieldName = 'CAI_DTFECHAMENTO'
    end
    object dstCaixaCAI_RGINICIAL: TIntegerField
      FieldName = 'CAI_RGINICIAL'
    end
    object dstCaixaCAI_RGFINAL: TIntegerField
      FieldName = 'CAI_RGFINAL'
    end
    object dstCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
    end
    object dstCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = dstCaixa
    Options = [poAllowCommandText]
    Left = 40
    Top = 128
  end
  object dsCaixa: TDataSource
    DataSet = cdsCaixa
    OnDataChange = dsCaixaDataChange
    Left = 88
    Top = 184
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINCIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspCaixa'
    Left = 72
    Top = 133
    object cdsCaixaCAI_NUMERO: TIntegerField
      FieldName = 'CAI_NUMERO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsCaixaCAI_LOJA: TIntegerField
      FieldName = 'CAI_LOJA'
      Required = True
    end
    object cdsCaixaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsCaixaCAI_DTABERTURA: TDateField
      Alignment = taRightJustify
      FieldName = 'CAI_DTABERTURA'
    end
    object cdsCaixaCAI_DTFECHAMENTO: TDateField
      FieldName = 'CAI_DTFECHAMENTO'
    end
    object cdsCaixaCAI_RGINICIAL: TIntegerField
      FieldName = 'CAI_RGINICIAL'
    end
    object cdsCaixaCAI_RGFINAL: TIntegerField
      FieldName = 'CAI_RGFINAL'
    end
    object cdsCaixaCAI_CAIXA: TIntegerField
      FieldName = 'CAI_CAIXA'
      DisplayFormat = '000'
    end
    object cdsCaixaCAI_SITUACAO: TStringField
      FieldName = 'CAI_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dstRelCaixa: TSQLDataSet
    CommandText = 
      'Select M.MOD_NOME,'#13#10'MC.MCA_LOJA, MC.MCA_CAIXA,'#13#10'Sum(MC.MCA_VLMOD' +
      'ALIDADE) AS VALOR, SUM(MC.MCA_VLTROCO) AS TROCO'#13#10'from MODALIDADE' +
      ' M'#13#10'INNER join MOVIMENTO_CAIXA MC ON M.MOD_CODIGO = MC.MCA_MODAL' +
      'IDADE'#13#10'Where (MC.MCA_DTMOVIMENTO >= :pDTINICIAL)'#13#10'And (MC.MCA_DT' +
      'MOVIMENTO <= :pDTFINAL) and (MC.MCA_CAIXA = :pCAIXA)'#13#10'AND (MC.MC' +
      'A_TIPOMOV <> :pTIPO1) AND (MC.MCA_TIPOMOV <> :pTIPO2)'#13#10'Group by ' +
      'M.MOD_NOME, MC.MCA_LOJA, MC.MCA_CAIXA;'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO1'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pTIPO2'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 24
    Top = 308
  end
  object dspRelCaixa: TDataSetProvider
    DataSet = dstRelCaixa
    Options = [poAllowCommandText]
    Left = 64
    Top = 308
  end
  object cdsRelCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINICIAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINAL'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'pCAIXA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pTIPO1'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pTIPO2'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspRelCaixa'
    Left = 104
    Top = 308
    object cdsRelCaixaMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsRelCaixaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
    end
    object cdsRelCaixaMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
    end
    object cdsRelCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object cdsRelCaixaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
  end
  object dsRelCaixa: TDataSource
    DataSet = cdsRelCaixa
    Left = 152
    Top = 308
  end
  object ppRepCaixaPeriodo: TppReport
    AutoStop = False
    DataPipeline = ppDBPMovCaixa
    NoDataBehaviors = [ndBlankReport]
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
    Template.FileName = 'C:\Empresa\SERVICO\DELPHI\Relatorios\rbSituacaoCaixaPeriodo.rtm'
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
    Left = 312
    Top = 152
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPMovCaixa'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
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
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 2646
        mmWidth = 20373
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
        mmLeft = 130440
        mmTop = 6879
        mmWidth = 20373
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 25929
        mmWidth = 197380
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'CFG_IMAGEMLOGO'
        DataPipeline = frmRelCaixaData.ppDBParametros
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
        mmTop = 27781
        mmWidth = 47159
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 265
        mmTop = 32544
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lbl_NMRELA2'
        Caption = 'RELAT'#211'RIO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109009
        mmTop = 2910
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'USU'#193'RIO....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109009
        mmTop = 7144
        mmWidth = 21251
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label8'
        Caption = 'PER'#205'ODO...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109273
        mmTop = 11642
        mmWidth = 20489
        BandType = 0
      end
      object lbl_DATA: TppLabel
        UserName = 'lbl_DATA'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 130440
        mmTop = 11642
        mmWidth = 17611
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label102'
        Caption = 'CAIXA.........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109273
        mmTop = 16140
        mmWidth = 20743
        BandType = 0
      end
      object lbl_CAIXA: TppLabel
        UserName = 'lbl_DATA1'
        Caption = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 130440
        mmTop = 16140
        mmWidth = 5842
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
        DataPipeline = ppDBPMovCaixa
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPMovCaixa'
        mmHeight = 4064
        mmLeft = 147617
        mmTop = 264
        mmWidth = 37592
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MCA_DESCNATU'
        DataPipeline = ppDBPMovCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPMovCaixa'
        mmHeight = 4064
        mmLeft = 1588
        mmTop = 264
        mmWidth = 71438
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MCA_OBSERVACAO'
        DataPipeline = ppDBPMovCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPMovCaixa'
        mmHeight = 3969
        mmLeft = 73554
        mmTop = 265
        mmWidth = 70908
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
        mmHeight = 55000
        mmLeft = 794
        mmTop = 7938
        mmWidth = 55033
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
        mmHeight = 55000
        mmLeft = 57415
        mmTop = 7938
        mmWidth = 36513
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
        mmHeight = 55000
        mmLeft = 95515
        mmTop = 7938
        mmWidth = 36513
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
        mmHeight = 55000
        mmLeft = 133615
        mmTop = 7938
        mmWidth = 36513
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
        TextAlignment = taRightJustified
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
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 81301
        mmTop = 2910
        mmWidth = 12361
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MCA_MODALIDADE'
      DataPipeline = ppDBPMovCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPMovCaixa'
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
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 172773
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'MCA_MODANOME'
          DataPipeline = ppDBPMovCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPMovCaixa'
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 794
          mmWidth = 31327
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
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 75142
          mmTop = 794
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 529
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
        object txtTOMODA: TppDBCalc
          UserName = 'txtTOMODA'
          DataField = 'MCA_VLMODALIDADE'
          DataPipeline = ppDBPMovCaixa
          DisplayFormat = '###,###,##0.#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPMovCaixa'
          mmHeight = 4233
          mmLeft = 147638
          mmTop = 1323
          mmWidth = 37306
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 143140
          mmTop = 529
          mmWidth = 53711
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBPMovCaixa: TppDBPipeline
    DataSource = dsMovCaixa
    UserName = 'DBPMovCaixa'
    Left = 352
    Top = 149
    object ppDBPMovCaixappField1: TppField
      FieldAlias = 'MCA_MODALIDADE'
      FieldName = 'MCA_MODALIDADE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppDBPMovCaixappField2: TppField
      FieldAlias = 'MCA_MODANOME'
      FieldName = 'MCA_MODANOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppDBPMovCaixappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MCA_NATUREZA'
      FieldName = 'MCA_NATUREZA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPMovCaixappField4: TppField
      FieldAlias = 'MCA_OBSERVACAO'
      FieldName = 'MCA_OBSERVACAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppDBPMovCaixappField5: TppField
      FieldAlias = 'MCA_VLMODALIDADE'
      FieldName = 'MCA_VLMODALIDADE'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPMovCaixappField6: TppField
      FieldAlias = 'MCA_TIPOMOV'
      FieldName = 'MCA_TIPOMOV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppDBPMovCaixappField7: TppField
      FieldAlias = 'MCA_DESCNATU'
      FieldName = 'MCA_DESCNATU'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppDBPMovCaixappField8: TppField
      FieldAlias = 'MCA_SINAL'
      FieldName = 'MCA_SINAL'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppDBPMovCaixappField9: TppField
      FieldAlias = 'MCA_NOMENATUREZA'
      FieldName = 'MCA_NOMENATUREZA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 8
    end
    object ppDBPMovCaixappField10: TppField
      FieldAlias = 'MCA_VLTROCO'
      FieldName = 'MCA_VLTROCO'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPMovCaixappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'MCA_VLDIGITADO'
      FieldName = 'MCA_VLDIGITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object cdsMovCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MCA_MODALIDADE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MCA_MODANOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MCA_NATUREZA'
        DataType = ftInteger
      end
      item
        Name = 'MCA_OBSERVACAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MCA_VLMODALIDADE'
        DataType = ftCurrency
      end
      item
        Name = 'MCA_TIPOMOV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MCA_VLTROCO'
        DataType = ftCurrency
      end
      item
        Name = 'MCA_VLDIGITADO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsMovCaixaIndex1'
        Fields = 'MCA_MODALIDADE'
      end>
    IndexFieldNames = 'MCA_MODALIDADE'
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 104
    Data = {
      220100009619E0BD01000000180000000800000000000300000022010E4D4341
      5F4D4F44414C494441444501004900000001000557494454480200020002000C
      4D43415F4D4F44414E4F4D450100490000000100055749445448020002001E00
      0C4D43415F4E41545552455A4104000100000000000E4D43415F4F4253455256
      4143414F0100490000000100055749445448020002002800104D43415F564C4D
      4F44414C4944414445080004000000010007535542545950450200490006004D
      6F6E6579000B4D43415F5449504F4D4F56010049000000010005574944544802
      00020001000B4D43415F564C54524F434F080004000000010007535542545950
      450200490006004D6F6E6579000E4D43415F564C444947495441444F08000400
      000000000000}
    object StringField1: TStringField
      FieldName = 'MCA_MODALIDADE'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'MCA_MODANOME'
      Size = 30
    end
    object IntegerField1: TIntegerField
      FieldName = 'MCA_NATUREZA'
    end
    object StringField3: TStringField
      FieldName = 'MCA_OBSERVACAO'
      Size = 40
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'MCA_VLMODALIDADE'
      DisplayFormat = '###,###,##0.#0'
      currency = False
    end
    object StringField4: TStringField
      FieldName = 'MCA_TIPOMOV'
      Size = 1
    end
    object StringField5: TStringField
      FieldKind = fkCalculated
      FieldName = 'MCA_DESCNATU'
      Size = 30
      Calculated = True
    end
    object StringField6: TStringField
      FieldKind = fkCalculated
      FieldName = 'MCA_SINAL'
      Size = 3
      Calculated = True
    end
    object StringField7: TStringField
      FieldKind = fkLookup
      FieldName = 'MCA_NOMENATUREZA'
      LookupDataSet = dmConsultas.cdsNatureza
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'MCA_NATUREZA'
      Size = 40
      Lookup = True
    end
    object cdsMovCaixaMCA_VLTROCO: TCurrencyField
      FieldName = 'MCA_VLTROCO'
    end
    object cdsMovCaixaMCA_VLDIGITADO: TFloatField
      FieldName = 'MCA_VLDIGITADO'
    end
  end
  object dsMovCaixa: TDataSource
    DataSet = cdsMovCaixa
    Left = 448
    Top = 141
  end
  object qryCaixaFechar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pMODALIDADE'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select CXF_NUMERO, MOD_MODALIDADE, CXF_VALOR '
      'from CAIXA_FECHAR  Where (CXF_NUMERO = :pNUMERO) '
      'and (MOD_MODALIDADE = :pMODALIDADE)')
    SQLConnection = Dm.SqlAdmin
    Left = 144
    Top = 101
  end
end
