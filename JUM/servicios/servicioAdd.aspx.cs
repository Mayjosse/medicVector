using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class servicios_servicioAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void AddUser_Click(object sender, EventArgs e)
    {
        JUMEntities jum = new JUMEntities();
        Servicio _servicio = new Servicio();
        _servicio.Nombre = ServicioNombre.Text;
        _servicio.Descripcion = Descripcion.Text;
        _servicio.Requisitos = Requisitos.Text;
        _servicio.Duracion = Int32.Parse(Duracion.Text);
        _servicio.Activo = true;
        jum.Servicios.Add(_servicio);
        jum.SaveChanges();
    }
}