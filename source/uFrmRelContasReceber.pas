unit uFrmRelContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ppPrnabl, ppCtrls, ppBands, ppCache, ppVar, ComCtrls;

type
  TfrmRelContReceber = class(TForm)
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    Panel2: TPanel;
    BtSair: TBitBtn;
    btImprimir: TBitBtn;
    dstContas: TSQLDataSet;
    dspContas: TDataSetProvider;
    cdsContas: TClientDataSet;
    dsContas: TDataSource;
    cdsContasREC_LOJA: TIntegerField;
    cdsContasEMP_FANTASIA: TStringField;
    cdsContasCLI_FANTASIA: TStringField;
    cdsContasREC_CREDITO: TIntegerField;
    cdsContasREC_PARCELA: TIntegerField;
    cdsContasREC_QTPARCELAS: TIntegerField;
    cdsContasREC_CLIENTE: TIntegerField;
    cdsContasREC_NRVENDA: TIntegerField;
    cdsContasREC_DATAEMISSAO: TDateField;
    cdsContasREC_DATAVENCIMENTO: TDateField;
    cdsContasREC_VALORPARCELA: TFMTBCDField;
    cdsContasREC_SITUACAO: TStringField;
    cdsContasREC_DATAPAGAMENTO: TDateField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    cdsContasREC_DESCRICAO: TMemoField;
    cdsContasREC_PAGO: TFMTBCDField;
    cdsContasREC_USUARIO: TIntegerField;
    ppDBText9: TppDBText;
    ppLine6: TppLine;
    ppLabel14: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel15: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppDBImage2: TppDBImage;
    ppLabel5: TppLabel;
    txtPeriodo: TppLabel;
    lblSituacao: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    spLocClientes: TSpeedButton;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    edtCDCLIE: TEdit;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    spLocClientes2: TSpeedButton;
    lbl_NMCLIE2: TLabel;
    edtDTINIC2: TDateEdit;
    edtDTFINA2: TDateEdit;
    edtCDCLIE2: TEdit;
    rgPeriodos: TRadioGroup;
    rbTipo: TRadioGroup;
    cdsRecebidas: TClientDataSet;
    dsRecebidas: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppReport2: TppReport;
    cdsRecebidasREC_LOJA: TIntegerField;
    cdsRecebidasEMP_FANTASIA: TStringField;
    cdsRecebidasCLI_FANTASIA: TStringField;
    cdsRecebidasREC_CREDITO: TIntegerField;
    cdsRecebidasREC_PARCELA: TIntegerField;
    cdsRecebidasREC_QTPARCELAS: TIntegerField;
    cdsRecebidasREC_CLIENTE: TIntegerField;
    cdsRecebidasREC_NRVENDA: TIntegerField;
    cdsRecebidasREC_DATAEMISSAO: TDateField;
    cdsRecebidasREC_DATAVENCIMENTO: TDateField;
    cdsRecebidasREC_VALORPARCELA: TFMTBCDField;
    cdsRecebidasREC_PAGO: TFMTBCDField;
    cdsRecebidasREC_VALORJUROS: TFMTBCDField;
    cdsRecebidasREC_VALORDESCONTO: TFMTBCDField;
    cdsRecebidasREC_RESTANTE: TFMTBCDField;
    cdsRecebidasREC_SITUACAO: TStringField;
    cdsRecebidasREC_DATAPAGAMENTO: TDateField;
    cdsRecebidasREC_DESCRICAO: TMemoField;
    cdsRecebidasREC_USUARIO: TIntegerField;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBImage1: TppDBImage;
    lblRelatorio: TppLabel;
    txtPeriodo2: TppLabel;
    lblSituacao2: TppLabel;
    ppLine4: TppLine;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel24: TppLabel;
    ppLine7: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel25: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel26: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine8: TppLine;
    ppDBCalc4: TppDBCalc;
    cdsRecebidasDIAS: TFloatField;
    cdsContasDIAS: TFloatField;
    rbSituacao: TRadioGroup;
    lblData: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppDBText17: TppDBText;
    cdsRecebidasREC_NOSSO_NUMERO: TStringField;
    ppDBText18: TppDBText;
    ppDBText20: TppDBText;
    ppDBText19: TppDBText;
    ppLabel13: TppLabel;
    ppLabel27: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    Label2: TLabel;
    cmbNMLOJA: TComboBox;
    Label4: TLabel;
    txtLoja: TppLabel;
    rbOrdem: TRadioGroup;
    lblOrdem: TppLabel;
    cdsContasCLI_NRBOX: TStringField;
    cdsRecebidasCLI_NRBOX: TStringField;
    ppDBText21: TppDBText;
    ppLabel28: TppLabel;
    ppDBCalc7: TppDBCalc;
    lbl_NMCLIE: TEdit;
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure edtCDCLIE2Change(Sender: TObject);
    procedure edtCDCLIE2KeyPress(Sender: TObject; var Key: Char);
    procedure spLocClientes2Click(Sender: TObject);
    procedure edtDTVENC_RECExit(Sender: TObject);
    procedure edtDTVENC2_RECExit(Sender: TObject);
    procedure edtDTINIC2Exit(Sender: TObject);
    procedure cdsRecebidasCalcFields(DataSet: TDataSet);
    procedure cdsContasCalcFields(DataSet: TDataSet);
    procedure edtDTFINA2Exit(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure cmbNMLOJAKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelContReceber: TfrmRelContReceber;

implementation

uses uFuncoes, uLocCliente, Udm, udmConsulta;

{$R *.dfm}

procedure TfrmRelContReceber.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.text) Then
         lbl_NMCLIE.Clear;
end;

procedure TfrmRelContReceber.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClientesClick(Sender);
     End;
     //
     if (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) then
     begin
          key := #0;
          If (btImprimir.Enabled) Then
             btImprimir.SetFocus;
     End;
end;

procedure TfrmRelContReceber.spLocClientesClick(Sender: TObject);
begin
    edtCDCLIE.SetFocus;
    frmLocCliente := TfrmLocCliente.create(application);
    try
        frmLocCliente.showmodal;
    finally
        If not (frmLocCliente.cdsConsultaCliente.IsEmpty) Then
        begin
             edtCDCLIE.Text     := frmLocCliente.cdsConsultaClienteCLI_CODIGO.AsString;
             lbl_NMCLIE.Text    := frmLocCliente.cdsConsultaClienteCLI_FANTASIA.AsString;
        End;
        //
        frmLocCliente.Release;
        frmLocCliente := nil;
    end;
     Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmRelContReceber.FormShow(Sender: TObject);
begin
     lbl_NMCLIE.Clear;
     lbl_NMCLIE2.Caption := '';
     //
     dmConsultas.Lojas(cmbNMLOJA);
     PageControl1.ActivePageIndex := 0;
     //
     edtDTINIC.Setfocus;
end;

procedure TfrmRelContReceber.edtDTINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
     Begin
          try
              StrToDate(edtDTINIC.Text);
              edtDTINIC.Text := DatetoStr(edtDTINIC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINIC.Clear;
                     edtDTINIC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.edtDTFINAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
     Begin
          try
              StrToDate(edtDTFINA.Text);
              edtDTFINA.Text := DatetoStr(edtDTFINA.Date);
              //
              If (edtDTFINA.Date < edtDTINIC.Date) Then
              Begin
                   Application.MessageBox(PChar('Per�odo final deve ser maior ou igual ao inicial!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINA.Date := Date;
                   edtDTFINA.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINA.Clear;
                     edtDTFINA.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.btImprimirClick(Sender: TObject);
Var
    Texto : String;
    aLoja, aCampo, aCampoDescricao : String;
begin
      If Empty(cmbNMLOJA.Text) Then
       begin
            cmbNMLOJA.SetFocus;
            raise Exception.Create('Selecione o condominio.');
       End;
      //
      Case rbOrdem.ItemIndex of
         0 :begin
                aCampo := 'R.REC_DATAEMISSAO';
                aCampoDescricao := 'ORDEM : DATA DE EMISS�O';
            End;
         1 : begin
                  aCampo := 'R.REC_DATAVENCIMENTO';
                  aCampoDescricao := 'ORDEM : DATA DE VENCIMENTO';
             End;
         2 : begin
                 aCampo := 'R.REC_DATAPAGAMENTO';
                 aCampoDescricao := 'ORDEM : DATA DE PAGAMENTO';
             End;
      End;
      //
      try
          btImprimir.Enabled := False;
          aLoja := InttoStr(uFuncoes.CDLOJA(cmbNMLOJA.Text));
          //
          With cdsRecebidas do
            begin
                 Active := False;
                 Texto := 'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, C.cli_nrbox, R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATAVENCIMENTO, R.REC_VALORPARCELA, R.REC_PAGO, R.rec_valorjuros, R.REC_NOSSO_NUMERO, ';
                 Texto := Texto + 'R.rec_valordesconto, R.REC_VLMULTA, R.rec_restante, R.REC_SITUACAO, R.REC_DATAPAGAMENTO, R.REC_DESCRICAO, REC_USUARIO from CONTASRECEBER R INNER join EMPRESAS EP ON R.REC_LOJA = EP.EMP_CODIGO INNER join CLIENTES C ON R.REC_CLIENTE = C.CLI_CODIGO ';
                 If (rbSituacao.ItemIndex = 0) Then
                     Texto := Texto + 'Where (R.REC_LOJA = '+QuotedStr(aLoja)+') and (R.REC_SITUACAO = '+QuotedStr('A')+')';
                 If (rbSituacao.ItemIndex = 1) Then
                     Texto := Texto + 'Where (R.REC_LOJA = '+QuotedStr(aLoja)+') and (R.REC_SITUACAO = '+QuotedStr('P')+')';
                 If (rbSituacao.ItemIndex = 2) Then
                     Texto := Texto + 'Where (R.REC_LOJA = '+QuotedStr(aLoja)+') and ((R.REC_SITUACAO = '+QuotedStr('A')+') or (R.REC_SITUACAO = '+QuotedStr('P')+'))';
                 //
                 If not Empty(edtCDCLIE.Text) Then
                     Texto := Texto + ' and (R.REC_CLIENTE = '+QuotedStr(edtCDCLIE.Text) +')';
                 If (rgPeriodos.ItemIndex = 0) Then
                 begin
                     If (edtDTINIC.Text <> '  /  /    ')  Then
                         Texto := Texto + ' and (R.REC_DATAEMISSAO >= :pDTINIC)';
                     If (edtDTFINA.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAEMISSAO <= :pDTFINA)';
                 End;
                 If (rgPeriodos.ItemIndex = 1) Then
                 begin
                     If (edtDTINIC.Text <> '  /  /    ')  Then
                        Texto := Texto + ' and (R.REC_DATAVENCIMENTO >= :pDTINIC)';
                     If (edtDTFINA.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAVENCIMENTO <= :pDTFINA)';
                 End;
                 //
                 If (rgPeriodos.ItemIndex = 2) Then
                 begin
                     If (edtDTINIC.Text <> '  /  /    ')  Then
                        Texto := Texto + ' and (R.REC_DATAPAGAMENTO >= :pDTINIC)';
                     If (edtDTFINA.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAPAGAMENTO <= :pDTFINA)';
                 End;
                 //
                 Texto := Texto + ' order by '+aCampo;
                 // Where (REC_SITUACAO = :pSITUACAO)
                 CommandText := Texto;
                 FetchParams;
                 //
                 If (edtDTINIC.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTINIC').AsDateTime := edtDTINIC.Date;
                 If (edtDTFINA.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTFINA').AsDateTime := edtDTFINA.Date;
                 //
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                       With ppReport2 do
                        begin
                             If (rbSituacao.ItemIndex = 0) Then
                                lblRelatorio.Caption := 'RELA��O DE CONTAS � RECEBER';
                             If (rbSituacao.ItemIndex = 1) Then
                                lblRelatorio.Caption := 'RELA��O DE CONTAS RECEBIDAS';
                             If (rbSituacao.ItemIndex = 2) Then
                                lblRelatorio.Caption := 'RELA��O DE CONTAS � RECEBER E RECEBIDAS';
                             //
                             txtPeriodo2.Caption  := 'PER�ODO DE MOVIMENTO  : '+ edtDTINIC.Text + ' � '+edtDTFINA.Text;
                             if (rbSituacao.ItemIndex = 0) Then
                                lblSituacao2.Caption := 'SITUA��O : ABERTAS';
                             if (rbSituacao.ItemIndex = 1) Then
                                lblSituacao2.Caption := 'SITUA��O : PAGAS';
                             if (rbSituacao.ItemIndex = 2) Then
                                lblSituacao2.Caption := 'SITUA��O : TODAS';
                            //
                            if (rgPeriodos.ItemIndex = 0) Then
                               lblData.Caption := 'DATA : EMISS�O';
                            if (rgPeriodos.ItemIndex = 1) Then
                               lblData.Caption := 'DATA : VENCIMENTO';
                            if (rgPeriodos.ItemIndex = 2) Then
                               lblData.Caption := 'DATA : PAGAMENTO';
                            //
                            lblOrdem.Caption := aCampoDescricao;
                            txtLoja.Caption  := 'CONDOMINIO : '+cmbNMLOJA.Text;
                            //
                            PrintReport;
                        End;
                  End
                  Else
                       Application.MessageBox(PChar('N�o h� movimento no per�odo.'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            End;  //fim-with   cdsContas
      finally
          btImprimir.Enabled := True;
      End;
      Application.ProcessMessages;

{    if (PageControl1.ActivePageIndex = 0) Then
    begin
      try
          btImprimir.Enabled := False;
          //
          With cdsContas do
            begin
                 Active := False;
                 Texto := 'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATAVENCIMENTO, R.REC_VALORPARCELA, R.REC_SITUACAO, R.REC_DATAPAGAMENTO, ';
                 Texto := Texto + 'R.REC_DESCRICAO, R.REC_PAGO, REC_USUARIO from CONTASRECEBER R INNER join EMPRESAS EP ON R.REC_LOJA = EP.EMP_CODIGO ';
                 Texto := Texto + 'INNER join CLIENTES C ON R.REC_CLIENTE = C.CLI_CODIGO ';
                 Texto := Texto + 'Where (REC_SITUACAO = :pSITUACAO) ';
                 If not Empty(edtCDCLIE.Text) Then
                     Texto := Texto + ' and (R.REC_CLIENTE = '+QuotedStr(edtCDCLIE.Text) +')';
                 If (rgPeriodos.ItemIndex = 0) Then
                 begin
                     If (edtDTINIC.Text <> '  /  /    ')  Then
                         Texto := Texto + ' and (R.REC_DATAEMISSAO >= :pDTINIC)';
                     If (edtDTFINA.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAEMISSAO <= :pDTFINA)';
                 End
                 Else
                 begin
                     If (edtDTINIC.Text <> '  /  /    ')  Then
                        Texto := Texto + ' and (R.REC_DATAVENCIMENTO >= :pDTINIC)';
                     If (edtDTFINA.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAVENCIMENTO <= :pDTFINA)';
                 End;
                 //
                 Texto := Texto + ' order by R.REC_DATAEMISSAO ';
                 FetchParams;
                 CommandText := Texto;
                 Params.ParamByName('pSITUACAO').AsString := 'A';
                 //
                 If (edtDTINIC.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTINIC').AsDate := edtDTINIC.Date;
                 If (edtDTFINA.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTFINA').AsDate := edtDTFINA.Date;
                 //
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                       With ppReport1 do
                        begin
                             If (rgPeriodos.ItemIndex = 0) Then
                                  txtPeriodo.Caption  := 'PER�ODO DE MOVIMENTO  : '+ edtDTINIC.Text + ' � '+edtDTFINA.Text
                             Else
                                  txtPeriodo.Caption  := 'PER�ODO DE VENCIMENTO : '+ edtDTINIC.Text + ' � '+edtDTFINA.Text;
                             lblSituacao.Caption := 'SITUA��O : ABERTAS';
                            //
                            PrintReport;
                        End;
                  End
                  Else
                       Application.MessageBox(PChar('N�o h� movimento no per�odo.'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            End;  //fim-with   cdsContas
      finally
          btImprimir.Enabled := True;
      End;
      Application.ProcessMessages;
    //
    End   // PageControl1
    Else
    begin
      try
          btImprimir.Enabled := False;
          //
          With cdsRecebidas do
            begin
                 Active := False;
                 Texto := 'Select R.REC_LOJA, EP.EMP_FANTASIA, C.CLI_FANTASIA, R.REC_CREDITO, R.REC_PARCELA, R.REC_QTPARCELAS, R.REC_CLIENTE, R.REC_NRVENDA, R.REC_DATAEMISSAO, R.REC_DATAVENCIMENTO, R.REC_VALORPARCELA, R.REC_PAGO, R.rec_valorjuros, ';
                 Texto := Texto + 'R.rec_valordesconto, R.rec_restante, R.REC_SITUACAO, R.REC_DATAPAGAMENTO, R.REC_DESCRICAO, REC_USUARIO from CONTASRECEBER R INNER join EMPRESAS EP ON R.REC_LOJA = EP.EMP_CODIGO INNER join CLIENTES C ON R.REC_CLIENTE = C.CLI_CODIGO ';
                 Texto := Texto + ' Where (REC_SITUACAO = :pSITUACAO) ';
                 If not Empty(edtCDCLIE2.Text) Then
                     Texto := Texto + ' and (R.REC_CLIENTE = '+QuotedStr(edtCDCLIE2.Text) +')';
                 If (rbTipo.ItemIndex = 0) Then
                 begin
                     If (edtDTINIC2.Text <> '  /  /    ')  Then
                         Texto := Texto + ' and (R.REC_DATAPAGAMENTO >= :pDTINIC)';
                     If (edtDTFINA2.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAPAGAMENTO <= :pDTFINA)';
                 End
                 Else
                 begin
                     If (edtDTINIC2.Text <> '  /  /    ')  Then
                        Texto := Texto + ' and (R.REC_DATAVENCIMENTO >= :pDTINIC)';
                     If (edtDTFINA2.Text <> '  /  /    ') Then
                         Texto := Texto + ' and (R.REC_DATAVENCIMENTO <= :pDTFINA)';
                 End;
                 //
                 Texto := Texto + ' order by R.REC_DATAEMISSAO ';
                 FetchParams;
                 CommandText := Texto;
                 Params.ParamByName('pSITUACAO').AsString := 'P';
                 //
                 If (edtDTINIC2.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTINIC').AsDate := edtDTINIC2.Date;
                 If (edtDTFINA2.Text <> '  /  /    ') Then
                     Params.ParamByName('pDTFINA').AsDate := edtDTFINA2.Date;
                 //
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                       With ppReport2 do
                        begin
                             If (rgPeriodos.ItemIndex = 0) Then
                                  txtPeriodo2.Caption  := 'PER�ODO DE PAGAMENTO  : '+ edtDTINIC2.Text + ' � '+edtDTFINA2.Text
                             Else
                                  txtPeriodo2.Caption  := 'PER�ODO DE VENCIMENTO : '+ edtDTINIC2.Text + ' � '+edtDTFINA2.Text;
                             lblSituacao2.Caption := 'SITUA��O : RECEBIDAS';
                            //
                            PrintReport;
                        End;
                  End
                  Else
                       Application.MessageBox(PChar('N�o h� movimento no per�odo.'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            End;  //fim-with   cdsContas
      finally
          btImprimir.Enabled := True;
      End;
      Application.ProcessMessages;
    End;                            }
end;

procedure TfrmRelContReceber.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmRelContReceber.edtCDCLIE2Change(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.text) Then
         lbl_NMCLIE.Clear;
end;

procedure TfrmRelContReceber.edtCDCLIE2KeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClientes2Click(Sender);
     End;
end;

procedure TfrmRelContReceber.spLocClientes2Click(Sender: TObject);
begin
    edtCDCLIE2.SetFocus;
    frmLocCliente := TfrmLocCliente.create(application);
    try
        frmLocCliente.showmodal;
    finally
        If not (frmLocCliente.cdsConsultaCliente.IsEmpty) Then
        begin
             edtCDCLIE2.Text     := frmLocCliente.cdsConsultaClienteCLI_CODIGO.AsString;
             lbl_NMCLIE2.Caption := frmLocCliente.cdsConsultaClienteCLI_FANTASIA.AsString;
        End;
        //
        frmLocCliente.Release;
        frmLocCliente := nil;
    end;
end;

procedure TfrmRelContReceber.edtDTVENC_RECExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINIC.Text);
              edtDTINIC.Text := DatetoStr(edtDTINIC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINIC.Clear;
                     edtDTINIC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.edtDTVENC2_RECExit(Sender: TObject);
begin
     If (edtDTFINA2.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINA2.Text);
              edtDTFINA2.Text := DatetoStr(edtDTFINA2.Date);
              //
              If (edtDTFINA2.Date < edtDTFINA2.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINA2.Date := Date;
                   edtDTFINA2.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINA2.Clear;
                     edtDTFINA2.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.edtDTINIC2Exit(Sender: TObject);
begin
     If (edtDTINIC2.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINIC2.Text);
              edtDTINIC2.Text := DatetoStr(edtDTINIC2.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINIC2.Clear;
                     edtDTINIC2.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.cdsRecebidasCalcFields(DataSet: TDataSet);
begin
     if (cdsRecebidasREC_SITUACAO.AsString = 'P') Then
          cdsRecebidasDIAS.AsFloat  :=
            cdsRecebidasREC_DATAPAGAMENTO.AsDateTime - cdsRecebidasrec_datavencimento.AsDateTime ;
     //
     if (cdsRecebidasREC_SITUACAO.AsString = 'A') Then
          cdsRecebidasDIAS.AsFloat  :=
            Date() - cdsRecebidasrec_datavencimento.AsDateTime ;
end;

procedure TfrmRelContReceber.cdsContasCalcFields(DataSet: TDataSet);
begin
       cdsContasDIAS.AsFloat  :=
         Date() - cdsRecebidasrec_datavencimento.AsDateTime ;
end;

procedure TfrmRelContReceber.edtDTFINA2Exit(Sender: TObject);
begin
     If (edtDTFINA2.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINA2.Text);
              edtDTFINA2.Text := DatetoStr(edtDTFINA2.Date);
              //
              If (edtDTFINA2.Date < edtDTINIC2.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINA2.Date := Date;
                   edtDTFINA2.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINA2.Clear;
                     edtDTFINA2.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelContReceber.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          If not (dmConsultas.GetCliente(StrtoInt(edtCDCLIE.Text)))  Then
          Begin
              Application.MessageBox(PChar('Loja n�o cadastrado!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMCLIE.Clear;
              edtCDCLIE.Clear;
              edtCDCLIE.SetFocus;
              Exit;
          End
          else
              lbl_NMCLIE.Text := dmConsultas.qryConsulta.fieldByName('CLI_FANTASIA').asString;
    End;
end;

procedure TfrmRelContReceber.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
        begin
             key := #0;
             edtDTFINA.SetFocus;
        End;
end;

procedure TfrmRelContReceber.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
        begin
             key := #0;
             cmbNMLOJA.SetFocus;
        End;
end;

procedure TfrmRelContReceber.cmbNMLOJAKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (key = #13) and not uFuncoes.Empty(cmbNMLOJA.Text) then
     begin
          key := #0;
          edtCDCLIE.SetFocus;
     End;
end;

end.
