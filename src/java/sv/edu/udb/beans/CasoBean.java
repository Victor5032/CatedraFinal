/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.beans;

/**
 *
 * @author Victor López
 */

import java.sql.*;
import java.util.concurrent.ThreadLocalRandom;
import sv.edu.udb.database.Conexion;

public class CasoBean {
    private int casoId;
    private String codigo;
    private int solicitudId;
    private String descripcion;
    private int programador;
    private String fechaInicio;
    private String fechaLimite;
    private int tester;   

    Conexion conex;
    
    /**
     * @return the casoId
     */
    public int getCasoId() {
        return casoId;
    }
   
    /**
     * @param casoId the casoId to set
     */
    public void setCasoId(int casoId) {
        this.casoId = casoId;
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the solicitudId
     */
    public int getSolicitudId() {
        return solicitudId;
    }

    /**
     * @param solicitudId the solicitudId to set
     */
    public void setSolicitudId(int solicitudId) {
        this.solicitudId = solicitudId;
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
     * @return the programador
     */
    public int getProgramador() {
        return programador;
    }

    /**
     * @param programador the programador to set
     */
    public void setProgramador(int programador) {
        this.programador = programador;
    }

    /**
     * @return the fechaInicio
     */
    public String getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaLimite
     */
    public String getFechaLimite() {
        return fechaLimite;
    }

    /**
     * @param fechaLimite the fechaLimite to set
     */
    public void setFechaLimite(String fechaLimite) {
        this.fechaLimite = fechaLimite;
    }

    /**
     * @return the tester
     */
    public int getTester() {
        return tester;
    }

    /**
     * @param tester the tester to set
     */
    public void setTester(int tester) {
        this.tester = tester;
    }
    
    public void generarCodigo() {
        String query = "SELECT CONCAT(departamento.codigo, DATE_FORMAT(solicitud.fecha_registro, '%Y%m%d')) FROM solicitud INNER JOIN departamento ON departamento.departamento_id = solicitud.departamento_id WHERE solicitud.solicitud_id = " + getSolicitudId();

        String response = "";
        String fechaCaso = getFechaInicio().replace("-", "");
        
        try {
            conex = new Conexion();

            conex.setRs(query);
            
            ResultSet result = conex.getRs();
            
            result.last();

            response = result.getString(1) + "-" + ThreadLocalRandom.current().nextInt(100, 999) + "-" + fechaCaso + "-" + ThreadLocalRandom.current().nextInt(100, 999);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        setCodigo(response);
    }

    public String getnuevoCaso() {
        String sql = "UPDATE solicitud SET estado = 1 WHERE solicitud_id = " + getSolicitudId();
        
        generarCodigo();

        String query = "INSERT INTO caso (codigo, solicitud_id, caso_descripcion, programador, fecha_inicio, fecha_limite, tester, estado) VALUES ("
                + "'" + getCodigo() + "', "
                + getSolicitudId() + ", "
                + "'" + getDescripcion() + "',"
                + getProgramador() + ", "
                + "'" + getFechaInicio() + "', "
                + "'" + getFechaLimite() + "', "
                + getTester() + ", "
                + "5)";

        String message = "";


        try {
            conex = new Conexion();

            conex.setQuery(sql);

            conex.setQuery(query);

            message = "Caso asignado";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }
}
