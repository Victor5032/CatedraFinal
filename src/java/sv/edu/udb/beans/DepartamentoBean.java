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
import sv.edu.udb.database.Conexion;

public class DepartamentoBean {
    private int departamento_id;
    private int jefe;
    private String codigo;
    private String departamento;

    Conexion conex;

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
     * @return the jefe
     */
    public int getJefe() {
        return jefe;
    }

    /**
     * @param jefe the jefe to set
     */
    public void setJefe(int jefe) {
        this.jefe = jefe;
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

    public String getborrarDepartamento() {
        String sql = "DELETE FROM departamento WHERE departamento_id = " + getDepartamento_id();
        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Departamento eliminado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }

    public String getagregarDepartamento() {
        String sql = "INSERT INTO departamento (codigo, departamento, jefe) VALUES ("
                + "'" + getCodigo() + "', "
                + "'" + getDepartamento() + "', "
                + getJefe() + ")";
        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Departamento agregado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }

    public String geteditarDepartamento() {
        String sql = "UPDATE departamento SET "
                + "codigo = '" + getCodigo() + "', "
                + "departamento = '" + getDepartamento() + "', "
                + "jefe = " + getJefe()
                + " WHERE departamento_id = " + getDepartamento_id();
        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Departamento actualizado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }
}
