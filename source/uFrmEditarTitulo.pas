unit uFrmEditarTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DBXpress;

type
  TfrmEditarTitulo = class(TForm)
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    cmbLoja: TDBLookupComboBox;
    Label3: TLabel;
    spLocCliente: TSpeedButton;
    lbl_NMCLIE: TLabel;
    Label2: TLabel;
    dbeDTEMISS: TDBEdit;
    Label4: TLabel;
    txtDescricao: TDBMemo;
    Label5: TLabel;
    dbeDTVENC: TDBEdit;
    Label6: TLabel;
    dbeVLPARC: TDBEdit;
    Label7: TLabel;
    dbeCDBANC: TDBEdit;
    Label8: TLabel;
    dbeNRAGEN: TDBEdit;
    Label9: TLabel;
    dbeNRCONT: TDBEdit;
    Label10: TLabel;
    dbeNRCHEQ: TDBEdit;
    Label14: TLabel;
    DBText2: TDBText;
    Label12: TLabel;
    DBText1: TDBText;
    edtCDCLIE: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCREDKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRPARCKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCDBANCKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRAGENKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRCONTKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNRCHEQKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCDBANCExit(Sender: TObject);
  private
    procedure VALIDAR_CLIENTE;
    procedure BUSCA;
    procedure DESABILITAR_CONTROLES(W_TIPO : String);
    Function VALIDAR_EDICAO() : Boolean;
    procedure CONTROLES(TIPO : String);            
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarTitulo: TfrmEditarTitulo;
  M_CDCLIE, W_CDLOJA : integer;
  M_NMCLIE, M_FLGRAV : String;

implementation

uses udmConsulta, uLocCliente, uFuncoes, uDm2, UFrmAdmin, Udm;

{$R *.dfm}

procedure TfrmEditarTitulo.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmEditarTitulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;}
end;


procedure TfrmEditarTitulo.FormShow(Sender: TObject);
begin
     If (VALIDAR_EDICAO() = True ) Then
         M_FLGRAV := 'S'
     Else
         M_FLGRAV := 'N';
     //
     lbl_NMCLIE.Caption := '';
     W_CDLOJA := dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger;  
     //
     If (M_FLGRAV = 'S') Then
        CONTROLES('H');
     If (M_FLGRAV = 'N') Then
        CONTROLES('D');
     //
     VALIDAR_CLIENTE;   
end;

procedure TfrmEditarTitulo.spLocClienteClick(Sender: TObject);
begin
      with TfrmLocCliente.create(self) do
          try
            uLocCliente.M_NRFROM := 4; 
            showmodal;
          finally
            free;
            edtCDCLIE.Text     := uFuncoes.StrZero(InttoStr(M_CDCLIE),7);
            lbl_NMCLIE.Caption := M_NMCLIE;
          end;
end;

procedure TfrmEditarTitulo.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
        lbl_NMCLIE.Caption := '';
end;

procedure TfrmEditarTitulo.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmEditarTitulo.edtNRCREDKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmEditarTitulo.edtNRPARCKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
    //
    If (key = #13) Then
    begin
        key := #0;
        BUSCA;
    End;
end;

procedure TfrmEditarTitulo.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
        edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
        VALIDAR_CLIENTE;
     End;
end;

procedure TfrmEditarTitulo.VALIDAR_CLIENTE;
begin
  If not uFuncoes.Empty(edtCDCLIE.text) Then
  Begin
     With dmConsultas.qryCliente do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
          //
          Open;
     End;
     //
     If (dmConsultas.qryCliente.IsEmpty) Then
     Begin
          Application.MessageBox('C�digo de cliente n�o cadastro!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMCLIE.Caption := '';
          edtCDCLIE.Clear;
          edtCDCLIE.SetFocus;
          Exit;
     End
     Else
        lbl_NMCLIE.Caption := dmConsultas.qryCliente.FieldByName('CLI_FANTASIA').AsString;
  End;
end;

procedure TfrmEditarTitulo.BUSCA;
begin
end;

procedure TfrmEditarTitulo.BtCancelarClick(Sender: TObject);
begin
     dm2.cdsContasReceber.Cancel;
     //
     Close;
end;

procedure TfrmEditarTitulo.BtGravarClick(Sender: TObject);
Var
  TD : TTransactionDesc;
  M_NRCRED, M_CDLOJA : Integer;
  M_DTEMIS : TDate;
  M_DESCRI : String;
  iUsuario : Integer;
begin
  If (M_FLGRAV = 'S') Then
  Begin
     If uFuncoes.Empty(cmbLoja.Text) Then
     Begin
          Application.MessageBox('Selecione a loja!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbLoja.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Application.MessageBox('Digite o c�digo do cliente!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtCDCLIE.SetFocus;
          Exit;
     End;
     //
     If (dbeDTEMISS.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data da emiss�o!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDTEMISS.SetFocus;
          Exit;
     End;
     //
     If (dbeDTVENC.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data de vencimento!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDTVENC.SetFocus;
          Exit;
     End;
     //
     If (txtDescricao.Lines.Text = '') Then
     Begin
          Application.MessageBox('Digite a descri��o da conta!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          txtDescricao.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeVLPARC.Text) or
       (dm2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency = 0) Then
     Begin
          Application.MessageBox('Digite o valor da parcela!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeVLPARC.SetFocus;
          Exit;
     End;
     //
     If not uFuncoes.Empty(dbeCDBANC.Text) Then
     Begin
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
          If uFuncoes.Empty(dbeNRCHEQ.Text) Then
          Begin
              Application.MessageBox('Digite o n�mero do cheque!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeNRCHEQ.SetFocus;
              Exit;
          End;
          //
     End;
  End;    //Fluxo de Grava
     iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
     // Inicia um transa��o no BD
     TD.TransactionID  := StrtoInt(uFrmAdmin.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     Dm.SqlAdmin.StartTransaction(TD);
     //
     try
        //
        dm2.cdsContasReceber.Post;
        dm2.cdsContasReceber.ApplyUpdates(0);
        //
        If (M_FLGRAV = 'S') Then
        Begin
           M_NRCRED := dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
           M_DTEMIS := dm2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime;
           M_CDCLIE := dm2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger;
           M_CDLOJA := dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
           M_DESCRI := txtDescricao.Lines.Text;
           //
           dm2.cdsContasReceber.Close;
           With dm2.dstContasReceber do
           Begin
                Active := False;
                CommandText := 'Select * from CONTASRECEBER Where (REC_LOJA = :pLOJA) '+
                               'AND (REC_CREDITO = :pNRCRETIDO)';
                Params.ParamByName('pLOJA').AsInteger      := W_CDLOJA;
                Params.ParamByName('pNRCRETIDO').AsInteger := M_NRCRED;
                Active := True;
           End;
           dm2.cdsContasReceber.FetchParams;
           dm2.cdsContasReceber.Open;
           dm2.cdsContasReceber.DisableControls;
           dm2.cdsContasReceber.First;
           While not (dm2.cdsContasReceber.Eof) do
           Begin
                dm2.cdsContasReceber.Edit;
                dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger      := M_NRCRED;
                dm2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime := M_DTEMIS ;
                dm2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger      := M_CDCLIE;
                dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger         := M_CDLOJA;
                dm2.cdsContasReceber.FieldByName('REC_DESCRICAO').AsString     := M_DESCRI;
                //
                dm2.cdsContasReceber.Next;
           End;
           //
           dm2.cdsContasReceber.ApplyUpdates(0);
           //
           dm2.cdsContasReceber.EnableControls;
        End;
        // Grava
        Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
        //
        Application.MessageBox (PChar('Registro gravado com sucesso!!!'),
                     'ATEN��O',MB_ICONINFORMATION+ MB_OK);
        //
        Dm.Start;
        Try
           If not (dm.IncluirTarefaUsuario( iUsuario,
               'Editou Conta Receber > N�.Credito : '+uFuncoes.StrZero(InttoStr(M_NRCRED),7)+
               ' Cliente: ' +  uFuncoes.StrZero(InttoStr(M_CDCLIE),7)+' *F*')) Then
                  ShowMessage('Erro ao adicionar tarefa do usu�rio.');
            dm.Comit(Dm.Transc);

        Except
             dm.Rollback;
        End;
        //
        Close;
     Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao tentar incluir conta!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transa��o no BD.
              Dm.SqlAdmin.Rollback(TD);
        End;
     End;

end;

procedure TfrmEditarTitulo.DESABILITAR_CONTROLES(W_TIPO: String);
begin
     If (W_TIPO = 'D') Then
     Begin
         cmbLoja.ReadOnly   := True;
         edtCDCLIE.ReadOnly := False;
         dbeDTEMISS.ReadOnly := False;
         txtDescricao.ReadOnly := True;
         dbeVLPARC.ReadOnly := True;
         dbeCDBANC.ReadOnly := True;
         dbeNRAGEN.ReadOnly := True;
         dbeNRCONT.ReadOnly := True;
         dbeNRCHEQ.ReadOnly := True;
     End
     Else
     Begin
         cmbLoja.ReadOnly   := False;
         edtCDCLIE.ReadOnly := False;
         dbeDTEMISS.ReadOnly := False;
         txtDescricao.ReadOnly := False;
         dbeVLPARC.ReadOnly := False;
         dbeCDBANC.ReadOnly := False;
         dbeNRAGEN.ReadOnly := False;
         dbeNRCONT.ReadOnly := False;
         dbeNRCHEQ.ReadOnly := False;
     End;
end;

function TfrmEditarTitulo.VALIDAR_EDICAO: Boolean;
begin
     With dm2.qryProcContReceber do
     Begin
          Close;
          Params.ParamByName('pLOJA').AsInteger      := dm2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger;
          Params.ParamByName('pNRCREDITO').AsInteger := dm2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
          Params.ParamByName('pSITUACAO').AsString   := 'P';
          Open;
          //

     End;
     If (dm2.qryProcContReceber.IsEmpty) Then
         result := true
     Else
         result := False;
end;

procedure TfrmEditarTitulo.CONTROLES(TIPO: String);
begin
     If (TIPO = 'D') Then
     Begin
         dbeDTEMISS.Enabled    := False;
         txtDescricao.Enabled := False;
         //
         cmbLoja.Enabled      := False;
         edtCDCLIE.Enabled    := False;
         dbeVLPARC.Enabled     := False;
         dbeCDBANC.Enabled    := False;
         dbeNRAGEN.Enabled    := False;
         dbeNRCONT.Enabled    := False;
         dbeNRCHEQ.Enabled    := False;
         //
         M_FLGRAV := 'N';
     End;
     //
     If (TIPO = 'H') Then
     Begin
         dbeDTEMISS.Enabled    := False;
         txtDescricao.Enabled := True;
         edtCDCLIE.Enabled    := False;
         //
         cmbLoja.Enabled      := True;
         dbeVLPARC.Enabled     := True;
         dbeCDBANC.Enabled    := True;
         dbeNRAGEN.Enabled    := True;
         dbeNRCONT.Enabled    := True;
         dbeNRCHEQ.Enabled    := True;
     End;
end;

procedure TfrmEditarTitulo.dbeCDBANCKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;

end;

procedure TfrmEditarTitulo.dbeNRAGENKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;

end;

procedure TfrmEditarTitulo.dbeNRCONTKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;

end;

procedure TfrmEditarTitulo.dbeNRCHEQKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmEditarTitulo.dbeCDBANCExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCDBANC.Text) Then
     Begin
        If (uFuncoes.LOCALIZAR_BANCO(uFuncoes.StrZero(dbeCDBANC.Text,3)) = False) Then
        begin
             Application.MessageBox('C�digo de banco n�o cadastrado!!!','ATEN��O',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeCDBANC.Clear;
             dbeCDBANC.SetFocus;
             Exit;
        End
        Else
            dbeCDBANC.Text := uFuncoes.StrZero(dbeCDBANC.Text,3);        
     End;
end;

end.
