package br.com.alura.livraria.factory;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/livraria?useSSL=false&serverTimeZone=UTC";
			String user = "root";
			String password = "root";

			Class.forName("com.mysql.cj.jdbc.Driver");

			return DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
