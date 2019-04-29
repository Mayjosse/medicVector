<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Llena el formulario de afiliación</h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">RFC</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="RFC Obligatorio" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Contraseña es Obligatoria" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar contraseña</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Campo Obligatorio" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden" />
            </div>
        </div>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" ID="razonSociallbl" CssClass="col-md-2 control-label">Razón social</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="razonSocial" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="razonSocial"
                    CssClass="text-danger" ErrorMessage="Razón social Obligatoria" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" ID="telefonolbl" CssClass="col-md-2 control-label">Teléfono</asp:Label>
            <div class="col-md-10">

                <asp:TextBox runat="server" ID="telefono" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="telefono"
                    CssClass="text-danger" ErrorMessage="Teléfono Obligatorio" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" ID="direccionlbl" CssClass="col-md-2 control-label">Dirección</asp:Label>
            <div class="col-md-10">

                <asp:TextBox runat="server" ID="direccion" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="direccion"
                    CssClass="text-danger" ErrorMessage="Dirección es Obligatoria" />
            </div>

        </div>
        <div class="form-group">
            <asp:Label runat="server" ID="coordenadaslbl" CssClass="col-md-2 control-label">Coordenadas</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="altitud" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="altitud"
                    CssClass="text-danger" ErrorMessage="Latitud Obligatoria" />
                <asp:TextBox runat="server" ID="latitud" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="latitud"
                    CssClass="text-danger" ErrorMessage="Latitud Obligatoria" />
            </div>
        </div>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>

