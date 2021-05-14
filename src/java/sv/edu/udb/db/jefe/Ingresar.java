package sv.edu.udb.db.jefe;

/**
 *
 * @author Edwin Orellana
 */

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ingresar {

    private String titulo_solicitud = "";
    private String descripcion_solicitud = "";
    private int id_solicitud = 0;
    private int departamento_id = 0;
    private int tipo_solicitud = 0;

    /**
     * @return the id_solicitud
     */
    public int getId_solicitud() {
        return id_solicitud;
    }

    /**
     * @param id_solicitud the id_solicitud to set
     */
    public void setId_solicitud(int id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    /**
     * @return the titulo_solicitud
     */
    public String getTitulo_solicitud() {
        return titulo_solicitud;
    }

    /**
     * @param titulo_solicitud the titulo_solicitud to set
     */
    public void setTitulo_solicitud(String titulo_solicitud) {
        this.titulo_solicitud = titulo_solicitud;
    }

    /**
     * @return the descripcion_solicitud
     */
    public String getDescripcion_solicitud() {
        return descripcion_solicitud;
    }

    /**
     * @param descripcion_solicitud the descripcion_solicitud to set
     */
    public void setDescripcion_solicitud(String descripcion_solicitud) {
        this.descripcion_solicitud = descripcion_solicitud;
    }

    /**
     * @return the departamento_id
     */
    public int getDepartamento_id() {
        return departamento_id;
    }

    /**
     * @param departamento_id the departamento_id to set
     */
    public void setDepartamento_id(int departamento_id) {
        this.departamento_id = departamento_id;
    }

    /**
     * @return the tipo_solicitud
     */
    public int getTipo_solicitud() {
        return tipo_solicitud;
    }

    /**
     * @param tipo_solicitud the tipo_solicitud to set
     */
    public void setTipo_solicitud(int tipo_solicitud) {
        this.tipo_solicitud = tipo_solicitud;
    }

    public String getUpdateDatos() throws SQLException {
        String informacion = "";
        int idSolicitud = getId_solicitud();
        String titulo = getTitulo_solicitud();
        String descripcion = getDescripcion_solicitud();
        int departamento = getDepartamento_id();
        String departamento_nombre = "";
        int tipoSolucitud = getTipo_solicitud();
        String solicitudtipo = "";
        Date date = new Date();
        DateFormat hourDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        if (tipoSolucitud == 1) {
            solicitudtipo = "Sistema nuevo";
        } else {
            solicitudtipo = "Cambio a sistema actual";
        }
         ConexionBase conexionDepartamento = new ConexionBase();
        ResultSet rs2 = null;
        conexionDepartamento.setRs("SELECT * FROM departamento WHERE departamento_id = " + departamento + "");
        rs2 = conexionDepartamento.getRs();
        if (rs2.next()) {
            departamento_nombre = rs2.getString(3);
        }
        informacion = "<p class='fw-bolder' > <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-bookmark\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z\"/>\n"
                + "</svg> Titulo de su solicitud: </p><p>" + titulo + "</p><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-textarea-t\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M1.5 2.5A1.5 1.5 0 0 1 3 1h10a1.5 1.5 0 0 1 1.5 1.5v3.563a2 2 0 0 1 0 3.874V13.5A1.5 1.5 0 0 1 13 15H3a1.5 1.5 0 0 1-1.5-1.5V9.937a2 2 0 0 1 0-3.874V2.5zm1 3.563a2 2 0 0 1 0 3.874V13.5a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V9.937a2 2 0 0 1 0-3.874V2.5A.5.5 0 0 0 13 2H3a.5.5 0 0 0-.5.5v3.563zM2 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm12 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z\"/>\n"
                + "  <path d=\"M11.434 4H4.566L4.5 5.994h.386c.21-1.252.612-1.446 2.173-1.495l.343-.011v6.343c0 .537-.116.665-1.049.748V12h3.294v-.421c-.938-.083-1.054-.21-1.054-.748V4.488l.348.01c1.56.05 1.963.244 2.173 1.496h.386L11.434 4z\"/>\n"
                + "</svg> Descripcion: </p><p>" + descripcion + "</p><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-question-square\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z\"/>\n"
                + "  <path d=\"M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z\"/>\n"
                + "</svg> tipo de solicitud:</p><p>" + solicitudtipo + "</p><p class='fw-bolder'><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-building\" viewBox=\"0 0 16 16\">\n"
                + "  <path fill-rule=\"evenodd\" d=\"M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z\"/>\n"
                + "  <path d=\"M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z\"/>\n"
                + "</svg>  Departamento: </p><p>" + departamento_nombre + "</P><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-clock-history\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z\"/>\n"
                + "  <path d=\"M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z\"/>\n"
                + "  <path d=\"M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z\"/>\n"
                + "</svg> Fecha y hora: </p><p>" + hourDateFormat.format(date) + "</P><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-clipboard-check\" viewBox=\"0 0 16 16\">\n"
                + "  <path fill-rule=\"evenodd\" d=\"M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z\"/>\n"
                + "  <path d=\"M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z\"/>\n"
                + "  <path d=\"M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z\"/>\n"
                + "</svg> Estado: </p><p>En espera de nueva revision </p>";
        
        
//        ****UPDATE
        String QueryUpdate = "UPDATE solicitud SET departamento_id='" + departamento + "',tipo_solicitud='" + tipoSolucitud + "',caso='" + titulo + "',descripcion='" + descripcion + "',fecha_registro='" + hourDateFormat.format(date) + "',estado= 3 WHERE solicitud_id = "+idSolicitud+"";
        ConexionBase conUpdate = new ConexionBase();
        conUpdate.setQuery(QueryUpdate);
        return informacion;
    }

    public String getIngresarDatos() throws SQLException {
        String titulo = getTitulo_solicitud();
        String descripcion = getDescripcion_solicitud();
        int departamento = getDepartamento_id();
        String departamento_nombre = "";
        int tipoSolucitud = getTipo_solicitud();
        String solicitudtipo = "";
        Date date = new Date();
        DateFormat hourDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        if (tipoSolucitud == 1) {
            solicitudtipo = "Sistema nuevo";
        } else {
            solicitudtipo = "Cambio a sistema actual";
        }
        ConexionBase con2 = new ConexionBase();
        ResultSet rs2 = null;
        con2.setRs("SELECT * FROM departamento WHERE departamento_id = " + departamento + "");
        rs2 = con2.getRs();
        if (rs2.next()) {
            departamento_nombre = rs2.getString(3);
        }

        String informacion = "<p class='fw-bolder' > <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-bookmark\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z\"/>\n"
                + "</svg> Titulo de su solicitud: </p><p>" + titulo + "</p><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-textarea-t\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M1.5 2.5A1.5 1.5 0 0 1 3 1h10a1.5 1.5 0 0 1 1.5 1.5v3.563a2 2 0 0 1 0 3.874V13.5A1.5 1.5 0 0 1 13 15H3a1.5 1.5 0 0 1-1.5-1.5V9.937a2 2 0 0 1 0-3.874V2.5zm1 3.563a2 2 0 0 1 0 3.874V13.5a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V9.937a2 2 0 0 1 0-3.874V2.5A.5.5 0 0 0 13 2H3a.5.5 0 0 0-.5.5v3.563zM2 7a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm12 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z\"/>\n"
                + "  <path d=\"M11.434 4H4.566L4.5 5.994h.386c.21-1.252.612-1.446 2.173-1.495l.343-.011v6.343c0 .537-.116.665-1.049.748V12h3.294v-.421c-.938-.083-1.054-.21-1.054-.748V4.488l.348.01c1.56.05 1.963.244 2.173 1.496h.386L11.434 4z\"/>\n"
                + "</svg> Descripcion: </p><p>" + descripcion + "</p><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-question-square\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z\"/>\n"
                + "  <path d=\"M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z\"/>\n"
                + "</svg> tipo de solicitud:</p><p>" + solicitudtipo + "</p><p class='fw-bolder'><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-building\" viewBox=\"0 0 16 16\">\n"
                + "  <path fill-rule=\"evenodd\" d=\"M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z\"/>\n"
                + "  <path d=\"M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z\"/>\n"
                + "</svg>  Departamento: </p><p>" + departamento_nombre + "</P><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-clock-history\" viewBox=\"0 0 16 16\">\n"
                + "  <path d=\"M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z\"/>\n"
                + "  <path d=\"M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z\"/>\n"
                + "  <path d=\"M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z\"/>\n"
                + "</svg> Fecha y hora: </p><p>" + hourDateFormat.format(date) + "</P><p class='fw-bolder'> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"26\" height=\"26\" fill=\"grey\" class=\"bi bi-clipboard-check\" viewBox=\"0 0 16 16\">\n"
                + "  <path fill-rule=\"evenodd\" d=\"M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z\"/>\n"
                + "  <path d=\"M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z\"/>\n"
                + "  <path d=\"M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z\"/>\n"
                + "</svg> Estado: </p><p>En espera</p>";

//        **********INSERT*************
        ResultSet rs = null;
        ConexionBase con = new ConexionBase();
        String Query = "INSERT INTO solicitud(departamento_id, tipo_solicitud, caso, descripcion, fecha_registro, estado) VALUES (" + departamento + ",'" + tipoSolucitud + "','" + titulo + "','" + descripcion + "','" + hourDateFormat.format(date) + "',3)";
        con.setQuery(Query);
        return informacion;
    }
    
    public String getDeleted() throws SQLException {
        int id = getId_solicitud();
        String QueryDelete = "DELETE FROM solicitud WHERE solicitud_id = "+id+"";
        ConexionBase conDelete = new ConexionBase();
        conDelete.setQuery("SET FOREIGN_KEY_CHECKS = 0");
        conDelete.setQuery(QueryDelete);
        conDelete.setQuery("SET FOREIGN_KEY_CHECKS = 1");
        return "Su solicitud se ha eliminado exitosamente !.";
    }

    public String getTest() {
        return "Retorno del get";
    }
}
