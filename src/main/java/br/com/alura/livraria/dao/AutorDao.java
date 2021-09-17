package br.com.alura.livraria.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.com.alura.livraria.modelo.Autor;

public class AutorDao {

	private Connection connection;

	public AutorDao(Connection connection) {
		this.connection = connection;
	}

	public void cadastrar(Autor autor) {
		try {
			String sql = "INSERT INTO autores(nome, email, dataNascimento, miniCurriculo) VALUES(?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, autor.getNome());
			ps.setString(2, autor.getEmail());
			ps.setDate(3, Date.valueOf(autor.getDataNascimento()));
			ps.setString(4, autor.getMiniCurriculo());

			ps.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Autor> listar() {
		try {
			String sql = "SELECT * FROM autores";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<Autor> autores = new ArrayList<>();
			while (rs.next()) {
				String nome = rs.getString("nome");
				String email = rs.getString("email");
				LocalDate dataNascimento = rs.getDate("dataNascimento").toLocalDate();
				String miniCurriculo = rs.getString("miniCurriculo");

				Autor autor = new Autor(nome, email, dataNascimento, miniCurriculo);
				autores.add(autor);
			}

			return autores;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
