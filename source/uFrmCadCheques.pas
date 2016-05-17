unit uFrmCadCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls,
  DBXpress, UFrmAdmin;

type
  TfrmCadCheques = class(TfrmCadastro)
    edtCDLOJA: TEdit;
    Label2: TLabel;
    lbl_NMLOJA: TLabel;
    Label3: TLabel;
    edtCPFCGC: TEdit;
    qryProcurar: TSQLQuery;
    Label1: TLabel;
    dbeNOME: TDBEdit;
    Label4: TLabel;
    dbeENDERECO: TDBEdit;
    Label5: TLabel;
    dbeBAIRRO: TDBEdit;
    Label6: TLabel;
    dbeCIDADE: TDBEdit;
    Label7: TLabel;
    dbeFONE: TDBEdit;
    Label8: TLabel;
    dbeIDENTIDADE: TDBEdit;
    Label9: TLabel;
    dbeEMISSOR: TDBEdit;
    Label10: TLabel;
    cmbUFCLIE: TDBComboBox;
    Panel5: TPanel;
    Label11: TLabel;
    dbeDTRECE: TDBEdit;
    Label12: TLabel;
    dbeDTVENC: TDBEdit;
    Label13: TLabel;
    dbeCDBANC: TDBEdit;
    Label14: TLabel;
    dbeNRAGEN: TDBEdit;
    Label15: TLabel;
    dbeNRCONT: TDBEdit;
    Label16: TLabel;
    dbeNRDOCU: TDBEdit;
    Label17: TLabel;
    dbeVALOR: TDBEdit;
    Panel6: TPanel;
    lbl_NMBANC: TLabel;
    procedure edtCDLOJAExit(Sender: TObject);
    procedure edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDLOJAChange(Sender: TObject);
    procedure edtCPFCGCExit(Sender: TObject);
    procedure edtCDLOJAEnter(Sender: TObject);
    procedure edtCPFCGCEnter(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure cmbUFCLIEExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeIDENTIDADEExit(Sender: TObject);
    procedure dbeCDBANCExit(Sender: TObject);
    procedure dbeNRAGENExit(Sender: TObject);
    procedure dbeNRCONTExit(Sender: TObject);
    procedure dbeNRDOCUExit(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure dbeCDBANCChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     procedure VALIDAR_LOJA;
     procedure VALIDAR_CLIENTE;
     procedure VALIDAR_BANCO;
     procedure tratabotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCheques: TfrmCadCheques;
  Transacao: TTransactionDesc;  

implementation

uses Udm, uFuncoes;

{$R *.dfm}

{ TfrmCadCheques }

procedure TfrmCadCheques.VALIDAR_CLIENTE;
begin
   If not uFuncoes.Empty(edtCPFCGC.Text) Then
   Begin
      Try
        If not (uFuncoes.CPF(edtCPFCGC.Text)) Then
        Begin
          MessageDlg('CPF inv�lido!!!', mtInformation, [mbOk], 0);
          edtCPFCGC.Clear;
          edtCPFCGC.SetFocus;
          Exit;
        End;
      Except
          MessageDlg('CPF inv�lido!!!', mtInformation, [mbOk], 0);
          edtCPFCGC.Clear;
          edtCPFCGC.SetFocus;
          Exit;
      End;
   End;
   //
     dm.cdsClientesCheques.Close;
     With dm.dstClientesCheques do
     begin
          Active := False;
          CommandText := 'Select * from CHEQUE_CLIENTES ';
          CommandText := CommandText + 'Where (CLC_CPFCGC = :pCPFCGC)';
          Params.ParamByName('pCPFCGC').AsString := edtCPFCGC.Text;
          //
          Active := True;
     End;
     dm.cdsClientesCheques.Open;
     //
     If (dm.cdsClientesCheques.IsEmpty) Then
     Begin
         { Application.MessageBox('Registro de cliente n�o cadastrado!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);}
          //
          dm.cdsClientesCheques.Append;
          dbeNOME.SetFocus;
          //
     End
     Else
         BtAdicionar.SetFocus;
end;

procedure TfrmCadCheques.VALIDAR_LOJA;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select EMP_CODIGO, EMP_RAZAO from EMPRESAS');
          SQL.Add('Where (EMP_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDLOJA.Text);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de loja n�o cadastrado!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMLOJA.Caption := '';
          edtCDLOJA.SetFocus;
          edtCDLOJA.Clear;
          Exit;
     End
     Else
     Begin
         lbl_NMLOJA.Caption := qryProcurar.FieldByName('EMP_RAZAO').AsString;
         edtCDLOJA.Text := uFuncoes.StrZero(edtCDLOJA.Text,3);
     End;
end;

procedure TfrmCadCheques.edtCDLOJAExit(Sender: TObject);
begin
  inherited;
     If not ufuncoes.Empty(edtCDLOJA.Text) Then
        VALIDAR_LOJA;
end;

procedure TfrmCadCheques.edtCDLOJAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadCheques.edtCDLOJAChange(Sender: TObject);
begin
  inherited;
    If uFuncoes.Empty(edtCDLOJA.Text) Then
    Begin
       lbl_NMLOJA.Caption := '';
       edtCPFCGC.Clear; 
    End;
end;

procedure TfrmCadCheques.edtCPFCGCExit(Sender: TObject);
begin
  inherited;
   //
   If not ufuncoes.Empty(edtCPFCGC.Text) Then
          VALIDAR_CLIENTE;
end;

procedure TfrmCadCheques.edtCDLOJAEnter(Sender: TObject);
begin
  inherited;
      dm.cdsClientesCheques.Cancel;
      dm.cdsClientesCheques.Close;
end;

procedure TfrmCadCheques.edtCPFCGCEnter(Sender: TObject);
begin
  inherited;
     dm.cdsClientesCheques.Cancel;
     dm.cdsClientesCheques.Close;
end;

procedure TfrmCadCheques.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsCheques.RecordCount > 0 then
  Begin
      tratabotoes;
      dm.cdsCheques.Edit;
  End;
end;

procedure TfrmCadCheques.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCheques.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(edtCDLOJA.Text) Then
  Begin
       Application.MessageBox('Digite o codigo da loja!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtCDLOJA.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(edtCPFCGC.Text) Then
  Begin
       Application.MessageBox('Digite CPF/CGC do cliente!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtCPFCGC.SetFocus;
       Exit;
  End;
  //
  tratabotoes;
  //
  dm.cdsCheques.Close;
  With dm.dstCheques do
  Begin
       Active := False;
       CommandText := 'Select * from CHEQUES Where (CHE_DOCUMENTO = :pDOCUMENTO)'+
                      'And (CHE_LOJA = :pLOJA)';
       ParamByName('pDOCUMENTO').AsString  := '';
       ParamByName('pLOJA').AsInteger      := StrtoInt(edtCDLOJA.Text);
       Active := True;
  End;
  dm.cdsCheques.Open;
  //
  dm.cdsCheques.Append;
  dm.cdsCheques.FieldByName('CHE_LOJA').AsInteger  := StrtoInt(edtCDLOJA.Text);
  dm.cdsCheques.FieldByName('CHE_VALORDOCUMENTO').AsCurrency := 0;
  //
  dbeDTRECE.SetFocus;
end;

procedure TfrmCadCheques.cmbUFCLIEExit(Sender: TObject);
begin
  inherited;
     {if application.MessageBox('Gravar dados do cliente','Gravar registro',
        mb_yesno+MB_ICONQUESTION) = id_yes then
     begin}
           dm.cdsClientesCheques.Edit;
           dm.cdsClientesCheques.FieldByName('CLC_CPFCGC').AsString := edtCPFCGC.Text;
           dm.cdsClientesCheques.FieldByName('CLC_SITUACAO').AsString := 'N';
           dm.cdsClientesCheques.FieldByName('CLC_DTALTERACAO').AsDateTime := Date;
           dm.cdsClientesCheques.Post;
           dm.cdsClientesCheques.ApplyUpdates(0);
     //end;
end;

procedure TfrmCadCheques.FormCreate(Sender: TObject);
begin
  inherited;
     TabSheet2.TabVisible := False;
end;

procedure TfrmCadCheques.BtCancelarClick(Sender: TObject);
begin
  inherited;
       tratabotoes;
       dm.cdsCheques.Cancel;
       dm.cdsCheques.Close;
end;

procedure TfrmCadCheques.BtGravarClick(Sender: TObject);
begin
    If (dbeDTRECE.Text = '  /  /    ') Then
    Begin
         Application.MessageBox('Digite a data do recebeimento!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeDTRECE.SetFocus;
         Exit;
    End;
    //
    If (dbeDTVENC.Text = '  /  /    ') Then
    Begin
         Application.MessageBox('Digite a data do vencimento!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeDTVENC.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeCDBANC.Text) Then
    Begin
         Application.MessageBox('Digite o c�digo do banco!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeCDBANC.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeNRAGEN.Text) Then
    Begin
         Application.MessageBox('Digite o n�mero da ag�ncia!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeNRAGEN.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeNRCONT.Text) Then
    Begin
         Application.MessageBox('Digite o n�mero da conta!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeNRCONT.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeNRDOCU.Text) Then
    Begin
         Application.MessageBox('Digite o n�mero do documento!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeNRDOCU.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeVALOR.Text) or
     (dm.cdsCheques.FieldByName('CHE_VALORDOCUMENTO').AsCurrency = 0) Then
    Begin
         Application.MessageBox('Digite o valor do cheque!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeVALOR.SetFocus;
         Exit;
    End;
    //
     Try
        tratabotoes;
        //
        Transacao.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
        Transacao.IsolationLevel := xilREPEATABLEREAD;
        dm.SqlAdmin.StartTransaction(Transacao);
        //
        dm.cdsCheques.FieldByName('CHE_SACADO').AsString := dbeNOME.Text;
        dm.cdsCheques.FieldByName('CHE_CPFCGC').AsString := edtCPFCGC.Text;
        dm.cdsCheques.FieldByName('CHE_DTALTERACAO').AsDateTime := Date();
        dm.cdsCheques.FieldByName('SEN_CODIGO').AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
        dm.cdsCheques.Post;
        dm.cdsCheques.ApplyUpdates(0);
        //
        Application.MessageBox(PChar('Registro de cheque incluido!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        dm.cdsCheques.Close;
        edtCDLOJA.Clear;
        edtCPFCGC.Clear;
        edtCDLOJA.SetFocus;
        //
        dm.SqlAdmin.Commit(Transacao);
        //
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dm.SqlAdmin.Rollback(Transacao);
        End;
     End;
  inherited;
end;

procedure TfrmCadCheques.FormActivate(Sender: TObject);
begin
  inherited;
      edtCDLOJA.SetFocus;
      lbl_NMBANC.Caption := '';
end;

procedure TfrmCadCheques.dbeIDENTIDADEExit(Sender: TObject);
begin
  inherited;
      If not uFuncoes.Empty(dbeIDENTIDADE.Text) Then
          dbeIDENTIDADE.Text := uFuncoes.StrZero(dbeIDENTIDADE.Text,11); 
end;

procedure TfrmCadCheques.VALIDAR_BANCO;
begin
     With qryProcurar do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select BAN_CODIGO, BAN_NOME from BANCOS');
          SQL.Add('Where (BAN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(dbeCDBANC.Text,3);
          //
          Open;
     End;
     //
     If (qryProcurar.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de banco n�o cadastrado!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMBANC.Caption := '';
          dbeCDBANC.SetFocus;
          dbeCDBANC.Clear;
          Exit;
     End
     Else
     Begin
         lbl_NMBANC.Caption := qryProcurar.FieldByName('BAN_NOME').AsString;
         dbeCDBANC.Text := uFuncoes.StrZero(dbeCDBANC.Text,3);
         dbeNRAGEN.SetFocus; 
     End;
end;

procedure TfrmCadCheques.dbeCDBANCExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(dbeCDBANC.Text) Then
        VALIDAR_BANCO;
end;

procedure TfrmCadCheques.dbeNRAGENExit(Sender: TObject);
begin
  inherited;
       If not uFuncoes.Empty(dbeNRAGEN.Text) Then
           dbeNRAGEN.Text := uFuncoes.StrZero(dbeNRAGEN.Text,5);
end;

procedure TfrmCadCheques.dbeNRCONTExit(Sender: TObject);
begin
  inherited;
       If not uFuncoes.Empty(dbeNRCONT.Text) Then
           dbeNRCONT.Text := uFuncoes.StrZero(dbeNRCONT.Text,12);
end;

procedure TfrmCadCheques.dbeNRDOCUExit(Sender: TObject);
begin
  inherited;
      If not uFuncoes.Empty(dbeNRDOCU.Text) Then
          dbeNRDOCU.Text := uFuncoes.StrZero(dbeNRDOCU.Text,8); 
end;

procedure TfrmCadCheques.dbeDTVENCExit(Sender: TObject);
begin
  inherited;
     If StrtoDate(dbeDTVENC.Text) < StrtoDate(dbeDTRECE.Text) Then
         dbeDTVENC.SetFocus;
end;

procedure TfrmCadCheques.dbeCDBANCChange(Sender: TObject);
begin
  inherited;
      If uFuncoes.Empty(dbeCDBANC.Text) Then
        lbl_NMBANC.Caption := '';
end;

procedure TfrmCadCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
end;

end.
