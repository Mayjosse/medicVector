using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using JUM;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        JUMEntities jum = new JUMEntities();
        Afiliado _afiliado = new Afiliado();
        _afiliado.RFC = UserName.Text;
        _afiliado.Nombre = razonSocial.Text;
        _afiliado.Telefono = telefono.Text;
        _afiliado.Direccion = direccion.Text;
        _afiliado.Coordenadas =string.Format("{0},{1}", altitud.Text, latitud.Text);
        _afiliado.Activo = true;
        jum.Afiliadoes.Add(_afiliado);
        jum.SaveChanges();

        Usuario _usuario = new Usuario();
        _usuario.IdUsuario = _afiliado.RFC;
        _usuario.Pass = Password.Text;
        _usuario.Tipo = 1;
        jum.Usuarios.Add(_usuario);
        jum.SaveChanges();

        IdentityHelper.RedirectToReturnUrl("Default.aspx", Response);
    }
}