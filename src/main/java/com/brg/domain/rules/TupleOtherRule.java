package com.brg.domain.rules;

import com.brg.domain.BusinessRule;
import com.brg.domain.RuleValueBundle;


public class TupleOtherRule extends BusinessRule {

    public TupleOtherRule(RuleValueBundle bundle) {
        super(bundle);
    }

    @Override
    public boolean validateRule() {
        return false;
    }
}
