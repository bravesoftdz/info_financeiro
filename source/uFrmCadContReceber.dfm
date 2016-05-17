object frmCadContaReceber: TfrmCadContaReceber
  Left = 206
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Contas Receber'
  ClientHeight = 473
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 304
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 510
      Top = 6
      Width = 54
      Height = 13
      Caption = 'N'#186'. Credito:'
      Transparent = True
    end
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 55
      Height = 13
      Caption = 'C&ondominio'
      FocusControl = cmbNMLOJA
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 136
      Height = 13
      Caption = '&Loja\Comodat'#225'rio\Locat'#225'rio:'
      FocusControl = edtCDCLIE
    end
    object Label4: TLabel
      Left = 16
      Top = 87
      Width = 80
      Height = 13
      Caption = 'Data da &Emiss'#227'o'
      FocusControl = edtDTMOVI
      Transparent = True
    end
    object Label7: TLabel
      Left = 16
      Top = 126
      Width = 51
      Height = 13
      Caption = '&Descri'#231#227'o:'
      FocusControl = mmoDescricao
      Transparent = True
    end
    object Label6: TLabel
      Left = 16
      Top = 261
      Width = 104
      Height = 13
      Caption = '&Quantidades Parcelas'
      Transparent = True
    end
    object Label10: TLabel
      Left = 466
      Top = 214
      Width = 97
      Height = 13
      Caption = 'Total da Movimento:'
      Transparent = True
      Visible = False
    end
    object lbl_NRCRED: TLabel
      Left = 486
      Top = 24
      Width = 77
      Height = 22
      Caption = '0000000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_VLTOTAL: TLabel
      Left = 525
      Top = 232
      Width = 38
      Height = 22
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object spLocCliente: TSpeedButton
      Left = 138
      Top = 62
      Width = 23
      Height = 22
      Hint = 'Localizar a Loja\Comodat'#225'rio\Locat'#225'rio'
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
      OnClick = spLocClienteClick
    end
    object Label5: TLabel
      Left = 16
      Top = 218
      Width = 46
      Height = 13
      Caption = '&Natureza:'
      FocusControl = cmbNaturezas
      Transparent = True
    end
    object spNatureza: TSpeedButton
      Left = 490
      Top = 148
      Width = 23
      Height = 22
      Hint = 'Localizar natureza'
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
      Visible = False
      OnClick = spNaturezaClick
    end
    object cmbNMLOJA: TComboBox
      Left = 16
      Top = 25
      Width = 350
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnKeyPress = cmbNMLOJAKeyPress
    end
    object edtCDCLIE: TEdit
      Left = 16
      Top = 63
      Width = 121
      Height = 21
      MaxLength = 7
      TabOrder = 1
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object edtDTMOVI: TMaskEdit
      Left = 16
      Top = 102
      Width = 120
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = edtDTMOVIExit
      OnKeyPress = edtDTMOVIKeyPress
    end
    object mmoDescricao: TMemo
      Left = 16
      Top = 144
      Width = 350
      Height = 65
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edtQTPARC: TCurrencyEdit
      Left = 16
      Top = 276
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = '0;-,0'
      MaxLength = 2
      MaxValue = 99.000000000000000000
      MinValue = 1.000000000000000000
      TabOrder = 5
      Value = 1.000000000000000000
      OnEnter = edtQTPARCEnter
      OnExit = edtQTPARCExit
      OnKeyPress = edtQTPARCKeyPress
    end
    object edtCDNATU: TEdit
      Left = 376
      Top = 149
      Width = 121
      Height = 21
      MaxLength = 4
      TabOrder = 6
      Visible = False
      OnChange = edtCDNATUChange
      OnExit = edtCDNATUExit
      OnKeyPress = edtCDNATUKeyPress
    end
    object lbl_NMCLIE: TEdit
      Left = 164
      Top = 63
      Width = 400
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
      TabOrder = 7
    end
    object lbl_Natureza: TEdit
      Left = 380
      Top = 173
      Width = 202
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
      TabOrder = 8
      Visible = False
    end
    object cmbNaturezas: TComboBox
      Left = 16
      Top = 237
      Width = 350
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 304
    Width = 598
    Height = 128
    Align = alBottom
    TabOrder = 1
    object dbgridParcelas: TDBGrid
      Left = 1
      Top = 1
      Width = 596
      Height = 126
      Align = alClient
      DataSource = DM2.dsParcelas
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = dbgridParcelasColEnter
      OnColExit = dbgridParcelasColExit
      OnEnter = dbgridParcelasEnter
      OnKeyDown = dbgridParcelasKeyDown
      OnKeyPress = dbgridParcelasKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PAR_NRPARCELA'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' PC'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PAR_VENCIMENTO'
          Title.Caption = 'DT.VENCIMENTO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR PARCELA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_BANCO'
          Title.Caption = 'BANCO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_AGENCIA'
          Title.Caption = 'AGENCIA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_CONTA'
          Title.Alignment = taRightJustify
          Title.Caption = 'N'#186' CONTA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR_CHEQUE'
          Title.Alignment = taRightJustify
          Title.Caption = 'CHEQUE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 598
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object BtAdicionar: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtAdicionarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000EFA54A00C684
        6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
        8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
        9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
        AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
        B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
        C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
        DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
        09090909090909090937373710302926231A16110E0E0E130937373710302C28
        26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
        292823221A11110E093737371736322E2E2C2826221A11110937373718383432
        2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
        34322E2C28262323093737371D3838383532312E2C282822093737371E383838
        3835323131302719093737371F383838383834342E0D0C0A093737371F383838
        383838362A0204000137373725383838383838382B070503373737371F353434
        343434342A070B37373737371F212121211F1F211C0637373737}
    end
    object BtCancelar: TBitBtn
      Left = 298
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Enabled = False
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
    object BtGravar: TBitBtn
      Left = 378
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
      TabOrder = 2
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
    object BtSair: TBitBtn
      Left = 468
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
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
    object btClonar: TBitBtn
      Left = 210
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Clona&r'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btClonarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFA0756E7443427443427443427443427443427443427443
        42744342744342FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFFF8E5F7
        EDD9F7EBD5F4E9D1F4E9D0F4E7CFF6EAD0EEDDC4754443FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA0756EF7EDDCF2D9BFF2D7BBF0D5BAEFD4B5EED3B2EED9
        BFE5D0BA754443FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFAEFDEFC
        C591FCC591FCC591FCC591FCC591FCC591E3D1BC754443FF00FFFF00FFA0756E
        744342744342744342A0756EFCF4E7F6D9BAF7D7B6F6D4B5F6D4B2F4D1ADF0DC
        C2E6D3C081524CFF00FFFF00FFA0756EFFF8E5F7EDD9F7EBD5A0756EFEF6EBF8
        DABCF8D9B8F8D8B7F7D5B6F7D4B2F3DEC7E7D7C581524DFF00FFFF00FFA0756E
        F7EDDCF2D9BFF2D7BBA0756EFEFAF2FCC591FCC591FCC591FCC591FCC591FCC5
        91EBDDCF8F5F5AFF00FFFF00FFA0756EFAEFDEFCC591FCC591A0756EFFFCFAFC
        E3CCFBE0C7FADEC6F8DEC4FCE2C6FCF0DEE1D7CE8F5E59FF00FFFF00FFA0756E
        FCF4E7F6D9BAF7D7B6A0756EFFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1
        AFA793959E675AFF00FFFF00FFA0756EFEF6EBF8DABCF8D9B8A0756EFFFFFFFF
        FFFFFFFEFEFFFCF8FFFEFAA0756EA0756EA0756EA0756EFF00FFFF00FFA0756E
        FEFAF2FCC591FCC591A0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A1
        54B6735DFF00FFFF00FFFF00FFA0756EFFFCFAFCE3CCFBE0C7A0756EA0756EA0
        756EA0756EA0756EA0756EA0756EAA6D68FF00FFFF00FFFF00FFFF00FFA0756E
        FFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1AFA793959E675AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA0756EFFFFFFFFFFFFFFFEFEFFFCF8FFFEFAA0
        756EA0756EA0756EA0756EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A154B6735DFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA0756EA0756EA0756EA0756EA0756EA0756EA0
        756EAA6D68FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object dstContasReceber: TSQLDataSet
    CommandText = 
      'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)'#13#10'and' +
      ' (REC_LOJA = :pLOJA) '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 264
    Top = 104
    object dstContasReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object dstContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstContasReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContasReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstContasReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstContasReceberREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object dstContasReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_SEUNUMERO: TStringField
      FieldName = 'REC_SEUNUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dstContasReceberREC_CDCEDENTE: TIntegerField
      FieldName = 'REC_CDCEDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NRFATURA: TStringField
      FieldName = 'REC_NRFATURA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
  end
  object dspContasReceber: TDataSetProvider
    DataSet = dstContasReceber
    Options = [poAllowCommandText]
    OnGetTableName = dspContasReceberGetTableName
    Left = 336
    Top = 104
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspContasReceber'
    OnCalcFields = cdsContasReceberCalcFields
    Left = 400
    Top = 104
    object cdsContasReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsContasReceberREC_LOJA: TIntegerField
      FieldName = 'REC_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object cdsContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_PARCELA: TIntegerField
      FieldName = 'REC_PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsContasReceberREC_DESCRICAO: TMemoField
      FieldName = 'REC_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasReceberREC_DATAEMISSAO: TDateField
      FieldName = 'REC_DATAEMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_DATAVENCIMENTO: TDateField
      FieldName = 'REC_DATAVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContasReceberREC_VALORPARCELA: TFMTBCDField
      FieldName = 'REC_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContasReceberREC_DATAPAGAMENTO: TDateField
      FieldName = 'REC_DATAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;'
    end
    object cdsContasReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_PAGO: TFMTBCDField
      FieldName = 'REC_PAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_RESTANTE: TFMTBCDField
      FieldName = 'REC_RESTANTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_BANCO: TStringField
      FieldName = 'REC_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cdsContasReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsContasReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cdsContasReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsContasReceberREC_TIPOMODALIDADE: TIntegerField
      FieldName = 'REC_TIPOMODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
    end
    object cdsContasReceberREC_NMSITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'REC_NMSITUACAO'
      Size = 15
      Calculated = True
    end
    object cdsContasReceberREC_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REC_ATRASO'
      Calculated = True
    end
    object cdsContasReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsContasReceberREC_NOSSO_NUMERO: TStringField
      FieldName = 'REC_NOSSO_NUMERO'
    end
    object cdsContasReceberREC_SEUNUMERO: TStringField
      FieldName = 'REC_SEUNUMERO'
      Size = 15
    end
    object cdsContasReceberREC_CDCEDENTE: TIntegerField
      FieldName = 'REC_CDCEDENTE'
    end
    object cdsContasReceberREC_NRFATURA: TStringField
      FieldName = 'REC_NRFATURA'
      FixedChar = True
      Size = 10
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 96
    object pmnClientesItem: TMenuItem
      Caption = '&Lojas\Comodat'#225'rios\Locat'#225'rios...'
      OnClick = pmnClientesItemClick
    end
    object pmnBancosItem: TMenuItem
      Caption = '&Bancos...'
      OnClick = pmnBancosItemClick
    end
    object pmnNaturezasItem: TMenuItem
      Caption = '&Naturezas...'
      OnClick = pmnNaturezasItemClick
    end
  end
end
