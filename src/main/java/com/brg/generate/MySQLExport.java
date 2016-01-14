package com.brg.generate;

import com.brg.domain.DatabaseType;
import com.brg.domain.RuleOperand;
import com.brg.domain.RuleValueBundle;


public class MySQLExport extends BaseTemplate implements ExportTemplate {

    @Override
    public String fillTemplate(RuleValueBundle bundle, RuleOperand operand, String code) {
        return this.fillTemplateWithBundle(this.getTemplate(), bundle, operand, code);
    }

    @Override
    public DatabaseType getType() {
        return DatabaseType.MYSQL;
    }

    @Override
    public void setCode(String code){
        this.code = code;
    }

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public void setRuleClass(String clazz) {
        this.ruleClass = clazz;
    }

    @Override
    public String getRuleClass() {
        return this.ruleClass;
    }

    @Override
    public String getSource() {
        return this.source;
    }

    @Override
    public void setSource(String source) {
        this.source = source;
    }
}
