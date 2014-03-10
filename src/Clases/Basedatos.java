package Clases;
import java.sql.*;

import javax.swing.JOptionPane;

public class Basedatos {

	//declaramos un objeto tipo connection
	private Connection conexion=null;
	//metodo para conectar
	
	private  void Conectar()
	{
		
		
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			//establecer url conexion
			conexion= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/id_check_db","root", "12345");
		}
		catch(SQLException ex)
		{
			JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
		}
		catch(Exception ex)
		{
			JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
		}
	}
	
	public ResultSet Consultar(String SQLQuery)
	{
		this.Conectar();
		ResultSet rs=null;
		Statement sentencia=null;
		
		try
		{
		sentencia=conexion.createStatement();
		rs=sentencia.executeQuery(SQLQuery);
		}
		catch(SQLException ex)
		{
			JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
		}
		catch(Exception ex)
		{
			JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
		}
		
		return rs;
		
	}
}
