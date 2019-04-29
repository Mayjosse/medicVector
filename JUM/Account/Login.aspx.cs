using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using JUM;
using System.Collections.Generic;
using System.Linq;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register";
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {

            JUMEntities jum = new JUMEntities();
            var _usuario = jum.Usuarios
                .FirstOrDefault(u => u.IdUsuario == UserName.Text
                             && u.Pass == Password.Text);

            if (_usuario != null)
            {
                IdentityHelper.RedirectToReturnUrl("Default.aspx", Response);
            }
            else    //User was not found
            {
                FailureText.Text = "RFC/ CURP o contraseña inexistente.";
                ErrorMessage.Visible = true;
            }
        }
    }
}