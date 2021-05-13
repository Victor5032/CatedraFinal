/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.beans;

/**
 *
 * @author Kevin
 */

import java.sql.*;

import sv.edu.udb.database.Conexion;

public class SolicitudBean {
    private int departamentoid;
    private int tipoid;
    private int estadosoli;
    private String observaciones;
    
    private String departamento;
    private String tipo;
    private String caso;
    private String descripcion;
    private String registro;
    private int solicitud_id;

    Conexion conex;
    
    /**
     * @return the departamentoid
     */
    public int getDepartamentoid() {
        return departamentoid;
    }

    /**
     * @param departamentoid the departamentoid to set
     */
    public void setDepartamentoid(int departamentoid) {
        this.departamentoid = departamentoid;
    }

    /**
     * @return the tipoid
     */
    public int getTipoid() {
        return tipoid;
    }

    /**
     * @param tipoid the tipoid to set
     */
    public void setTipoid(int tipoid) {
        this.tipoid = tipoid;
    }

    /**
     * @return the estadosoli
     */
    public int getEstadosoli() {
        return estadosoli;
    }

    /**
     * @param estadosoli the estadosoli to set
     */
    public void setEstadosoli(int estadosoli) {
        this.estadosoli = estadosoli;
    }

    /**
     * @return the departamento
     */
    public String getDepartamento() {
        return departamento;
    }

    /**
     * @param departamento the departamento to set
     */
    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the caso
     */
    public String getCaso() {
        return caso;
    }

    /**
     * @param caso the caso to set
     */
    public void setCaso(String caso) {
        this.caso = caso;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @param registro the observaciones to set
     */
    public void setRegistro(String registro) {
        this.registro = registro;
    }

    /**
     * @return the registro
     */
    public String getRegistro() {
        return registro;
    }
    
    /**
     * @return the solicitud_id
     */
    public int getSolicitud_id() {
        return solicitud_id;
    }

    /**
     * @param solicitud_id the solicitud_id to set
     */
    public void setSolicitud_id(int solicitud_id) {
        this.solicitud_id = solicitud_id;
    }
    
    public String getinfoSolicitud() {
        String sql = "SELECT solicitud.solicitud_id, departamento.departamento, tipo_solicitud.tipo, solicitud.caso, solicitud.descripcion, DATE(solicitud.fecha_registro) AS fecha_registro, estado_solicitud.estado, solicitud.departamento_id FROM solicitud INNER JOIN departamento ON solicitud.departamento_id = departamento.departamento_id INNER JOIN tipo_solicitud ON solicitud.tipo_solicitud = tipo_solicitud.tipo_solicitud_id INNER JOIN estado_solicitud ON solicitud.estado = estado_solicitud.estado_solicitud_id WHERE solicitud.solicitud_id = " + getSolicitud_id();

        try {
            conex = new Conexion();

            conex.setRs(sql);

            ResultSet rs = conex.getRs();

            rs.last();

            setDepartamento(rs.getString(2));
            setTipo(rs.getString(3));
            setCaso(rs.getString(4));
            setDescripcion(rs.getString(5));
            setRegistro(rs.getString(6));
            setDepartamentoid(rs.getInt(8));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return "";
    }

    public String getrechazarSolicitud() {
        String sql = "UPDATE solicitud SET estado = 2, observaciones = '" + getObservaciones() + "' WHERE solicitud_id = " + getSolicitud_id();
        String message = "";
        
        try {
            conex = new Conexion();

            conex.setQuery(sql);

            message = "Solicitud rechazada";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }
}
