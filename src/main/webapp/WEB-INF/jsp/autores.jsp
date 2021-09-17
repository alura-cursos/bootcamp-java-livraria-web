<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cadastro de Autores</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<div class="card mt-2">
			<div class="card-header text-center">
				<h2>CADASTRO DE AUTOR</h2>
			</div>
			
			<div class="card-body">
				<form method="post" action="<c:url value="/autores"/>">
					<div class="form-group">
						<label for="nome">NOME</label>
						<input id="nome" name="nome" class="form-control" required="required">
					</div>
					
					<div class="form-group">
						<label for="email">EMAIL</label>
						<input id="email" name="email" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="dataNascimento">DATA NASCIMENTO</label>
						<input id="dataNascimento" name="dataNascimento" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="miniCurriculo">MINI CURRICULO</label>
						<textarea id="miniCurriculo" name="miniCurriculo" class="form-control" rows="10"></textarea>
					</div>
					
					<input type="submit" value="Salvar" class="btn btn-primary mt-1">
				</form>
			</div>
		</div>
		
		<div class="card mt-2">
			<div class="card-header text-center">
				<h2>LISTA DE AUTORES</h2>
			</div>
			
			<div class="card-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>NOME</th>
							<th>EMAIL</th>
							<th>DATA NASCIMENTO</th>
						</tr>
					</thead>
		
					<tbody>
						<c:forEach items="${autores}" var="autor">
							<tr>
								<td>${autor.nome}</td>
								<td>${autor.email}</td>
								<td>
									<fmt:parseDate value="${autor.dataNascimento}" pattern="yyyy-MM-dd" var="formatada" type="date" />
									<fmt:formatDate value="${formatada}" pattern="dd/MM/yyyy" type="date"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>