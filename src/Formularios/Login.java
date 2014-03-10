package Formularios;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import javax.swing.JTextField;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

//importando Result Set
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JLabel;


//agregar  la clase BaseDatos
import Clases.Basedatos;
import javax.swing.JPasswordField;

public class Login extends JFrame {

	private JPanel contentPane;
	private JTextField txtId;

// creao un atributo con la clase Basedatos
	private Basedatos bd =null;
	// creo un atributo con ResultSet
	private ResultSet rs=null;
	private JPasswordField txtPasword;
	
	
	
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login frame = new Login();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Login() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 318, 239);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton btnNewButton = new JButton("Aceptar");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				// Logica Login
boolean respuesta=false;
bd=new Basedatos();
String id = txtId.getText();
String Passwd= new String(txtPasword.getPassword()); 
//new  String 
String SQLQuery= "SELECT * FROM administrador WHERE idpersonal='" + id+"' AND  Pasword='"+ Passwd+"'";
rs=bd.Consultar(SQLQuery);


try
{
while(rs.next())
{
respuesta=true;	
}
	if(respuesta)
	{
		Principal nuevoprincipal = new Principal();
		nuevoprincipal.setVisible(true);
		
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Credenciales Incorrectas", "Mensaje",JOptionPane.INFORMATION_MESSAGE );
	}
}
catch(SQLException ex)
{
	JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
}
catch(Exception ex)
{
	JOptionPane.showMessageDialog(null, "No se logró establecer conexion con la base de datos", "ERROR",JOptionPane.ERROR_MESSAGE );
}

				// Termina logica login

				
				
			
				
				
				
			}
		});
		btnNewButton.setBounds(83, 91, 89, 23);
		contentPane.add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("Cancelar");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
			}
		});
		
		
		btnNewButton_1.setBounds(197, 91, 89, 23);
		contentPane.add(btnNewButton_1);
		
		txtId = new JTextField();
		txtId.setBounds(83, 29, 201, 20);
		contentPane.add(txtId);
		txtId.setColumns(10);
		
		JLabel lblContrasea = new JLabel("Contrase\u00F1a");
		lblContrasea.setBounds(8, 66, 65, 14);
		contentPane.add(lblContrasea);
		
		JLabel lblUsuario = new JLabel("Usuario");
		lblUsuario.setBounds(10, 32, 46, 14);
		contentPane.add(lblUsuario);
		
		txtPasword = new JPasswordField();
		txtPasword.setBounds(83, 60, 203, 20);
		contentPane.add(txtPasword);
	}
}
