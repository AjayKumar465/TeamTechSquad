package com.teamtechsquad;

import java.sql.SQLException;


public class H2Server {
public static void main(String[] args) throws SQLException {
	org.h2.tools.Server.createTcpServer().start();
}
}
