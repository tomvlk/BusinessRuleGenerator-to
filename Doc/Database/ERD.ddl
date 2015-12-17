-- Tables

CREATE TABLE Category (
  CategoryID number(10) NOT NULL, 
  Sign       varchar2(255) NOT NULL, 
  PRIMARY KEY (CategoryID));
CREATE TABLE BusinessRule (
  BusinessRuleID number(10) NOT NULL, 
  CategoryID     number(10) NOT NULL, 
  RuleOperandID  number(10), 
  BundleID       number(10), 
  Code           varchar2(255) NOT NULL, 
  RuleName       varchar2(255) NOT NULL, 
  Description    varchar2(255) NOT NULL,
  ClassName 	 varchar2(255) NOT NULL, 
  PRIMARY KEY (BusinessRuleID));
CREATE TABLE RuleOperand (
  RuleOperandID number(10) NOT NULL, 
  Name          varchar2(255) NOT NULL, 
  Sign          varchar2(255) NOT NULL, 
  PRIMARY KEY (RuleOperandID));
CREATE TABLE Bundle (
  BundleID number(10) NOT NULL, 
  PRIMARY KEY (BundleID));
CREATE TABLE BundleKeyEntry (
  EntryID  number(10) NOT NULL, 
  BundleID number(10) NOT NULL, 
  Key    varchar2(255) NOT NULL, 
  PRIMARY KEY (EntryID));
CREATE TABLE EntryKeyValue (
  EntryValueID number(10) NOT NULL, 
  EntryID      number(10) NOT NULL, 
  String_Value varchar2(255), 
  Int_Value    number(10), 
  Float_Value  varchar2(255), 
  Description  varchar2(255), 
  PRIMARY KEY (EntryValueID));

-- Constraints

ALTER TABLE BusinessRule ADD CONSTRAINT FK1_BusinessRu FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);
ALTER TABLE BusinessRule ADD CONSTRAINT FK2_BusinessRu FOREIGN KEY (RuleOperandID) REFERENCES RuleOperand (RuleOperandID);
ALTER TABLE BusinessRule ADD CONSTRAINT FK3_BusinessRu FOREIGN KEY (BundleID) REFERENCES Bundle (BundleID);
ALTER TABLE BundleKeyEntry ADD CONSTRAINT FK1_BundleKeyE FOREIGN KEY (BundleID) REFERENCES Bundle (BundleID);
ALTER TABLE EntryKeyValue ADD CONSTRAINT FK1_EntryKeyVa FOREIGN KEY (EntryID) REFERENCES BundleKeyEntry (EntryID);

-- Sequences

CREATE SEQUENCE cat_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

CREATE SEQUENCE br_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

CREATE SEQUENCE ope_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

CREATE SEQUENCE bun_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

CREATE SEQUENCE bke_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

CREATE SEQUENCE ekv_seq_pk
  START WITH 100000
  INCREMENT BY 1
  CACHE 1;

-- Triggerss

CREATE OR REPLACE TRIGGER cat_trg_pk
  BEFORE INSERT ON Category
  FOR EACH ROW
  WHEN (NEW.CategoryID IS NULL)
BEGIN
  :NEW.CategoryID := cat_seq_pk.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER br_trg_pk
  BEFORE INSERT ON BusinessRule
  FOR EACH ROW
  WHEN (NEW.BusinessRuleID IS NULL)
BEGIN 
  :NEW.BusinessRuleID := br_seq_pk.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER ope_trg_pk
  BEFORE INSERT ON RuleOperand
  FOR EACH ROW
  WHEN (NEW.RuleOperandID IS NULL)
BEGIN 
  :NEW.RuleOperandID := ope_seq_pk.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER bun_trg_pk
  BEFORE INSERT ON Bundle
  FOR EACH ROW
  WHEN (NEW.BundleID IS NULL)
BEGIN 
   :NEW.BundleID := bun_seq_pk.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER bke_trg_pk
  BEFORE INSERT ON BundleKeyEntry
  FOR EACH ROW
  WHEN (NEW.EntryID IS NULL)
BEGIN 
    :NEW.EntryID := bke_seq_pk.NEXTVAL;
END;

CREATE OR REPLACE TRIGGER ekv_trg_pk
  BEFORE INSERT ON EntryKeyValue
  FOR EACH ROW
  WHEN (NEW.EntryValueID IS NULL)
BEGIN 
  :NEW.EntryValueID := ekv_seq_pk.NEXTVAL;
END;





