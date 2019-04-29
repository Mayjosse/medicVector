<%@ Page Title="Agregar servicio" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeFile="servicioAdd.aspx.cs" Inherits="servicios_servicioAdd" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Agregar Servicio</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="agregarServicio">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ServicioNombre" CssClass="col-md-2 control-label">Nombre</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ServicioNombre" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ServicioNombre"
                                CssClass="text-danger" ErrorMessage="Nombre obligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Descripcion" CssClass="col-md-2 control-label">Descripción</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Requisitos" CssClass="col-md-2 control-label">Requisitos</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Requisitos" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Requisitos"
                                CssClass="text-danger" ErrorMessage="Requisitos obligatorios." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Duracion" CssClass="col-md-2 control-label">Tiempo Estimado (en minutos)</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="Duracion" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                ControlToValidate="Duracion" runat="server"
                                ErrorMessage="Solo acepta números"
                                ValidationExpression="\d+">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Duracion"
                                CssClass="text-danger" ErrorMessage="Tiempo estimado es obligatorio." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="AddUser_Click" Text="Agregar Servicio" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

