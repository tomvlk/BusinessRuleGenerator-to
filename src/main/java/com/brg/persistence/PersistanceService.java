package com.brg.persistence;


import com.brg.common.AbstractFacadeService;
import com.brg.common.Config;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class PersistanceService extends AbstractFacadeService implements PersistanceServiceImpl {

    private Connection connection;

    private BusinessRuleService businessRuleService = new BusinessRuleService();

    public PersistanceService() {

        // TODO: Move this to the connection holder(s). This is only for prototype.
        // TODO: Refactor
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException clfe) {
            clfe.printStackTrace();
            return;
        }

        Properties p;

        try {
            p = Config.getInstance().getConfig();
        }catch (IOException ioe) {
            ioe.printStackTrace();
            return;
        }

        String connectString = "jdbc:oracle:thin:@" + p.getProperty("repository_host");
        connectString += ":" + p.getProperty("repository_port");
        connectString += "/" + p.getProperty("repository_service");

        try{
            connection = DriverManager.getConnection(connectString, p.getProperty("repository_username"), p.getProperty("repository_password"));
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }

    @Override
    public BusinessRuleService getBusinessRuleService() {
        return this.businessRuleService;
    }

    @Override
    public Connection getConnection() {
        return this.connection;
    }

}