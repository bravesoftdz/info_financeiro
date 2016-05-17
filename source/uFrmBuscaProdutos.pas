unit uFrmBuscaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBuscaDados, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBuscaProduto = class(TfrmBuscaDados)
    cdsBuscaPRO_CODIGO: TStringField;
    cdsBuscaPRO_DESCRICAO: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaProduto: TfrmBuscaProduto;
  M_NRFROM : integer;

implementation

uses Udm, uFuncoes, uFrmCadEntradaMercadoria, uFrmInvertario,
  uFrmCadDerivados, uFrmRelHisEstProdutos, uCadDerivados2, uFrmRelDerivadosProdutos,
  uFrmRelEtiqProdutos, uFrmInvertarioNew;

{$R *.dfm}

procedure TfrmBuscaProduto.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsBusca do
  begin
    //
    Close;
    Params[0].AsString := edtConsultar.Text + '%';
    Open;
    //
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refa�a a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
end;

procedure TfrmBuscaProduto.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
      Close;
      ModalResult := mrOK;
   End;
end;

procedure TfrmBuscaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
         If (M_NRFROM = 1) Then
             uFrmCadEntradaMercadoria.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 2) Then
             uFrmInvertarioNew.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 3) Then
             ufrmCadDerivados.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 4) Then
             uFrmRelHisEstProdutos.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 5) Then
             uCadDerivados2.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 6) Then
             uCadDerivados2.W_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 7) Then
             uFrmRelDerivadosProdutos.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 8) Then
             uFrmRelEtiqProdutos.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
    End;
end;

procedure TfrmBuscaProduto.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   If (cdsBusca.Active = True) Then
   Begin
     IF (KEY = VK_UP) then
          cdsBusca.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsBusca.Next;
   End;
end;

procedure TfrmBuscaProduto.edtConsultarChange(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
   Begin
        with cdsBusca do
        begin
            //
            Close;
            Params[0].AsString := edtConsultar.Text + '%';
            Open;
            //
        End;
   End
   Else
       cdsBusca.Close;
end;

procedure TfrmBuscaProduto.grdConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13) and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         Close;
         ModalResult := mrOK;
    End;
end;

procedure TfrmBuscaProduto.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #13)and not (cdsBusca.IsEmpty) Then
    Begin
         Key := #0;
         //
         If (M_NRFROM = 1) Then
             uFrmCadEntradaMercadoria.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 2) Then
             uFrmInvertario.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 3) Then
             ufrmCadDerivados.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
         //
         If (M_NRFROM = 4) Then
             uFrmRelHisEstProdutos.M_CDPROD :=
                cdsBuscaPRO_CODIGO.AsString;
        //
        ModalResult := mrOK;
        Close;
    End;
end;

end.
