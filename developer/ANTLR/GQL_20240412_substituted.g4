// Original: grammar GQL_20240412;
CONTROL_FLOWgrammarCONTROL_FLOW CONTROL_FLOWGQL_20240412CONTROL_FLOW;

// Original: options { caseInsensitive = true; }
CONTROL_FLOWoptionsCONTROL_FLOW { CONTROL_FLOWcaseInsensitiveCONTROL_FLOW = CONTROL_FLOWtrueCONTROL_FLOW; }

// 6 <GQL-program>

// Original: gqlProgram
CONTROL_FLOWgqlProgramCONTROL_FLOW
// Original: : programActivity sessionCloseCommand? EOF
: CONTROL_FLOWprogramActivityCONTROL_FLOW CONTROL_FLOWsessionCloseCommandCONTROL_FLOW? CONTROL_FLOWEOFCONTROL_FLOW
// Original: | sessionCloseCommand EOF
| CONTROL_FLOWsessionCloseCommandCONTROL_FLOW CONTROL_FLOWEOFCONTROL_FLOW
;

// Original: programActivity
CONTROL_FLOWprogramActivityCONTROL_FLOW
// Original: : sessionActivity
: CONTROL_FLOWsessionActivityCONTROL_FLOW
// Original: | transactionActivity
| CONTROL_FLOWtransactionActivityCONTROL_FLOW
;

// Original: sessionActivity
CONTROL_FLOWsessionActivityCONTROL_FLOW
: sessionResetCommand+
| sessionSetCommand+ sessionResetCommand*
;

// Original: transactionActivity
CONTROL_FLOWtransactionActivityCONTROL_FLOW
: startTransactionCommand (procedureSpecification endTransactionCommand?)?
| procedureSpecification endTransactionCommand?
// Original: | endTransactionCommand
| CONTROL_FLOWendTransactionCommandCONTROL_FLOW
;

// Original: endTransactionCommand
CONTROL_FLOWendTransactionCommandCONTROL_FLOW
// Original: : rollbackCommand
: CONTROL_FLOWrollbackCommandCONTROL_FLOW
// Original: | commitCommand
| CONTROL_FLOWcommitCommandCONTROL_FLOW
;

// 7.1 <session set command>

// Original: sessionSetCommand
CONTROL_FLOWsessionSetCommandCONTROL_FLOW
// Original: : SESSION SET (sessionSetSchemaClause | sessionSetGraphClause | sessionSetTimeZoneClause | sessionSetParameterClause)
// Original: : SESSION KEYWORD (sessionSetSchemaClause | sessionSetGraphClause | sessionSetTimeZoneClause | sessionSetParameterClause)
: KEYWORD KEYWORD (sessionSetSchemaClause | sessionSetGraphClause | sessionSetTimeZoneClause | sessionSetParameterClause)
;

// Original: sessionSetSchemaClause
CONTROL_FLOWsessionSetSchemaClauseCONTROL_FLOW
// Original: : SCHEMA schemaReference
: CONTROL_FLOWSCHEMACONTROL_FLOW CONTROL_FLOWschemaReferenceCONTROL_FLOW
;

// Original: sessionSetGraphClause
CONTROL_FLOWsessionSetGraphClauseCONTROL_FLOW
// Original: : PROPERTY? GRAPH graphExpression
: CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW
;

// Original: sessionSetTimeZoneClause
CONTROL_FLOWsessionSetTimeZoneClauseCONTROL_FLOW
// Original: : TIME ZONE setTimeZoneValue
: CONTROL_FLOWTIMECONTROL_FLOW CONTROL_FLOWZONECONTROL_FLOW CONTROL_FLOWsetTimeZoneValueCONTROL_FLOW
;

// Original: setTimeZoneValue
CONTROL_FLOWsetTimeZoneValueCONTROL_FLOW
// Original: : timeZoneString
: CONTROL_FLOWtimeZoneStringCONTROL_FLOW
;

// Original: sessionSetParameterClause
CONTROL_FLOWsessionSetParameterClauseCONTROL_FLOW
// Original: : sessionSetGraphParameterClause
: CONTROL_FLOWsessionSetGraphParameterClauseCONTROL_FLOW
// Original: | sessionSetBindingTableParameterClause
| CONTROL_FLOWsessionSetBindingTableParameterClauseCONTROL_FLOW
// Original: | sessionSetValueParameterClause
| CONTROL_FLOWsessionSetValueParameterClauseCONTROL_FLOW
;

// Original: sessionSetGraphParameterClause
CONTROL_FLOWsessionSetGraphParameterClauseCONTROL_FLOW
// Original: : PROPERTY? GRAPH sessionSetParameterName optTypedGraphInitializer
: CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWsessionSetParameterNameCONTROL_FLOW CONTROL_FLOWoptTypedGraphInitializerCONTROL_FLOW
;

// Original: sessionSetBindingTableParameterClause
CONTROL_FLOWsessionSetBindingTableParameterClauseCONTROL_FLOW
// Original: : BINDING? TABLE sessionSetParameterName optTypedBindingTableInitializer
// Original: : KEYWORD? TABLE sessionSetParameterName optTypedBindingTableInitializer
: CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWTABLECONTROL_FLOW CONTROL_FLOWsessionSetParameterNameCONTROL_FLOW CONTROL_FLOWoptTypedBindingTableInitializerCONTROL_FLOW
;

// Original: sessionSetValueParameterClause
CONTROL_FLOWsessionSetValueParameterClauseCONTROL_FLOW
// Original: : VALUE sessionSetParameterName optTypedValueInitializer
: CONTROL_FLOWVALUECONTROL_FLOW CONTROL_FLOWsessionSetParameterNameCONTROL_FLOW CONTROL_FLOWoptTypedValueInitializerCONTROL_FLOW
;

// Original: sessionSetParameterName
CONTROL_FLOWsessionSetParameterNameCONTROL_FLOW
// Original: : (IF NOT EXISTS)? sessionParameterSpecification
: (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? CONTROL_FLOWsessionParameterSpecificationCONTROL_FLOW
;

// 7.2 <session reset command>

// Original: sessionResetCommand
CONTROL_FLOWsessionResetCommandCONTROL_FLOW
// Original: : SESSION RESET sessionResetArguments?
// Original: : KEYWORD RESET sessionResetArguments?
: KEYWORD KEYWORD sessionResetArguments?
;

// Original: sessionResetArguments
CONTROL_FLOWsessionResetArgumentsCONTROL_FLOW
// Original: : ALL? (PARAMETERS | CHARACTERISTICS)
: KEYWORD? (PARAMETERS | CHARACTERISTICS)
// Original: | SCHEMA
| CONTROL_FLOWSCHEMACONTROL_FLOW
// Original: | PROPERTY? GRAPH
| CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW
// Original: | TIME ZONE
| CONTROL_FLOWTIMECONTROL_FLOW CONTROL_FLOWZONECONTROL_FLOW
// Original: | PARAMETER? sessionParameterSpecification
| CONTROL_FLOWPARAMETERCONTROL_FLOW? CONTROL_FLOWsessionParameterSpecificationCONTROL_FLOW
;

// 7.3 <session close command>

// Original: sessionCloseCommand
CONTROL_FLOWsessionCloseCommandCONTROL_FLOW
// Original: : SESSION CLOSE
// Original: : SESSION KEYWORD
: CONTROL_FLOWSESSIONCONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW
;

// 7.4 <session parameter specification>

// Original: sessionParameterSpecification
CONTROL_FLOWsessionParameterSpecificationCONTROL_FLOW
// Original: : GENERAL_PARAMETER_REFERENCE
: CONTROL_FLOWGENERAL_PARAMETER_REFERENCECONTROL_FLOW
;

// 8.1 <start transaction command>

// Original: startTransactionCommand
CONTROL_FLOWstartTransactionCommandCONTROL_FLOW
// Original: : START TRANSACTION transactionCharacteristics?
// Original: : KEYWORD TRANSACTION transactionCharacteristics?
: KEYWORD KEYWORD transactionCharacteristics?
;

// 8.2 <transaction characteristics>

// Original: transactionCharacteristics
CONTROL_FLOWtransactionCharacteristicsCONTROL_FLOW
// Original: : transactionMode (COMMA transactionMode)*
: transactionMode (PUNCTUATION_OPERATOR transactionMode)*
;

// Original: transactionMode
CONTROL_FLOWtransactionModeCONTROL_FLOW
// Original: : transactionAccessMode
: CONTROL_FLOWtransactionAccessModeCONTROL_FLOW
;

// Original: transactionAccessMode
CONTROL_FLOWtransactionAccessModeCONTROL_FLOW
// Original: : READ ONLY
: CONTROL_FLOWREADCONTROL_FLOW CONTROL_FLOWONLYCONTROL_FLOW
// Original: | READ WRITE
| CONTROL_FLOWREADCONTROL_FLOW CONTROL_FLOWWRITECONTROL_FLOW
;

// 8.3 <rollback command>

// Original: rollbackCommand
CONTROL_FLOWrollbackCommandCONTROL_FLOW
// Original: : ROLLBACK
: CONTROL_FLOWROLLBACKCONTROL_FLOW
;

// 8.4 <commit command>

// Original: commitCommand
CONTROL_FLOWcommitCommandCONTROL_FLOW
// Original: : COMMIT
: CONTROL_FLOWCOMMITCONTROL_FLOW
;

// 9.1 <nested procedure specification>

// Original: nestedProcedureSpecification
CONTROL_FLOWnestedProcedureSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE procedureSpecification RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWprocedureSpecificationCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: // <catalog-modifying procedure specification>, <data-modifying procedure specification> and <query specification> are
// <CONTROL_FLOWcatalogCONTROL_FLOW-CONTROL_FLOWmodifyingCONTROL_FLOW CONTROL_FLOWprocedureCONTROL_FLOW CONTROL_FLOWspecificationCONTROL_FLOW>, <CONTROL_FLOWdataCONTROL_FLOW-CONTROL_FLOWmodifyingCONTROL_FLOW CONTROL_FLOWprocedureCONTROL_FLOW CONTROL_FLOWspecificationCONTROL_FLOW> CONTROL_FLOWandCONTROL_FLOW <CONTROL_FLOWqueryCONTROL_FLOW CONTROL_FLOWspecificationCONTROL_FLOW> CONTROL_FLOWareCONTROL_FLOW
// Original: // identical productions. The specification distinguishes them in the BNF, but in the implementation, the distinction
// CONTROL_FLOWidenticalCONTROL_FLOW CONTROL_FLOWproductionsCONTROL_FLOW. CONTROL_FLOWTheCONTROL_FLOW CONTROL_FLOWspecificationCONTROL_FLOW CONTROL_FLOWdistinguishesCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWBNFCONTROL_FLOW, CONTROL_FLOWbutCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWimplementationCONTROL_FLOW, CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWdistinctionCONTROL_FLOW
// has to be made sematically, in code, based on the kind of statements contained in the <procedure specification>.
// Original: procedureSpecification
CONTROL_FLOWprocedureSpecificationCONTROL_FLOW
// Original: : procedureBody
: CONTROL_FLOWprocedureBodyCONTROL_FLOW
// Original: //    : catalogModifyingProcedureSpecification
//    : CONTROL_FLOWcatalogModifyingProcedureSpecificationCONTROL_FLOW
// Original: //    | dataModifyingProcedureSpecification
//    | CONTROL_FLOWdataModifyingProcedureSpecificationCONTROL_FLOW
// Original: //    | querySpecification
//    | CONTROL_FLOWquerySpecificationCONTROL_FLOW
;

// Original: //catalogModifyingProcedureSpecification
//CONTROL_FLOWcatalogModifyingProcedureSpecificationCONTROL_FLOW
// Original: //    : procedureBody
//    : CONTROL_FLOWprocedureBodyCONTROL_FLOW
//    ;

// Original: nestedDataModifyingProcedureSpecification
CONTROL_FLOWnestedDataModifyingProcedureSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE procedureBody RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWprocedureBodyCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: //dataModifyingProcedureSpecification
//CONTROL_FLOWdataModifyingProcedureSpecificationCONTROL_FLOW
// Original: //    : procedureBody
//    : CONTROL_FLOWprocedureBodyCONTROL_FLOW
//    ;

// Original: nestedQuerySpecification
CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
// Original: : LEFT_BRACE procedureBody RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWprocedureBodyCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: //querySpecification
//CONTROL_FLOWquerySpecificationCONTROL_FLOW
// Original: //    : procedureBody
//    : CONTROL_FLOWprocedureBodyCONTROL_FLOW
//    ;

// 9.2 <procedure body>

// Original: procedureBody
CONTROL_FLOWprocedureBodyCONTROL_FLOW
// Original: : atSchemaClause? bindingVariableDefinitionBlock? statementBlock
: CONTROL_FLOWatSchemaClauseCONTROL_FLOW? CONTROL_FLOWbindingVariableDefinitionBlockCONTROL_FLOW? CONTROL_FLOWstatementBlockCONTROL_FLOW
;

// Original: bindingVariableDefinitionBlock
CONTROL_FLOWbindingVariableDefinitionBlockCONTROL_FLOW
: bindingVariableDefinition+
;

// Original: bindingVariableDefinition
CONTROL_FLOWbindingVariableDefinitionCONTROL_FLOW
// Original: : graphVariableDefinition
: CONTROL_FLOWgraphVariableDefinitionCONTROL_FLOW
// Original: | bindingTableVariableDefinition
| CONTROL_FLOWbindingTableVariableDefinitionCONTROL_FLOW
// Original: | valueVariableDefinition
| CONTROL_FLOWvalueVariableDefinitionCONTROL_FLOW
;

// Original: statementBlock
CONTROL_FLOWstatementBlockCONTROL_FLOW
: statement nextStatement*
;

// Original: statement
CONTROL_FLOWstatementCONTROL_FLOW
// Original: : linearCatalogModifyingStatement
: CONTROL_FLOWlinearCatalogModifyingStatementCONTROL_FLOW
// Original: | linearDataModifyingStatement
| CONTROL_FLOWlinearDataModifyingStatementCONTROL_FLOW
// Original: | compositeQueryStatement
| CONTROL_FLOWcompositeQueryStatementCONTROL_FLOW
;

// Original: nextStatement
CONTROL_FLOWnextStatementCONTROL_FLOW
// Original: : NEXT yieldClause? statement
: CONTROL_FLOWNEXTCONTROL_FLOW CONTROL_FLOWyieldClauseCONTROL_FLOW? CONTROL_FLOWstatementCONTROL_FLOW
;

// 10.1 <graph variable definition>

// Original: graphVariableDefinition
CONTROL_FLOWgraphVariableDefinitionCONTROL_FLOW
// Original: : PROPERTY? GRAPH bindingVariable optTypedGraphInitializer
: CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWbindingVariableCONTROL_FLOW CONTROL_FLOWoptTypedGraphInitializerCONTROL_FLOW
;

// Original: optTypedGraphInitializer
CONTROL_FLOWoptTypedGraphInitializerCONTROL_FLOW
// Original: : (typed? graphReferenceValueType)? graphInitializer
: (CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWgraphReferenceValueTypeCONTROL_FLOW)? CONTROL_FLOWgraphInitializerCONTROL_FLOW
;

// Original: graphInitializer
CONTROL_FLOWgraphInitializerCONTROL_FLOW
// Original: : EQUALS_OPERATOR graphExpression
: CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW
;

// 10.2 <binding table variable definition>

// Original: bindingTableVariableDefinition
CONTROL_FLOWbindingTableVariableDefinitionCONTROL_FLOW
// Original: : BINDING? TABLE bindingVariable optTypedBindingTableInitializer
// Original: : KEYWORD? TABLE bindingVariable optTypedBindingTableInitializer
: CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWTABLECONTROL_FLOW CONTROL_FLOWbindingVariableCONTROL_FLOW CONTROL_FLOWoptTypedBindingTableInitializerCONTROL_FLOW
;

// Original: optTypedBindingTableInitializer
CONTROL_FLOWoptTypedBindingTableInitializerCONTROL_FLOW
// Original: : (typed? bindingTableReferenceValueType)? bindingTableInitializer
: (CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWbindingTableReferenceValueTypeCONTROL_FLOW)? CONTROL_FLOWbindingTableInitializerCONTROL_FLOW
;

// Original: bindingTableInitializer
CONTROL_FLOWbindingTableInitializerCONTROL_FLOW
// Original: : EQUALS_OPERATOR bindingTableExpression
: CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWbindingTableExpressionCONTROL_FLOW
;

// 10.3 <value variable definition>

// Original: valueVariableDefinition
CONTROL_FLOWvalueVariableDefinitionCONTROL_FLOW
// Original: : VALUE bindingVariable optTypedValueInitializer
: CONTROL_FLOWVALUECONTROL_FLOW CONTROL_FLOWbindingVariableCONTROL_FLOW CONTROL_FLOWoptTypedValueInitializerCONTROL_FLOW
;

// Original: optTypedValueInitializer
CONTROL_FLOWoptTypedValueInitializerCONTROL_FLOW
// Original: : (typed? valueType)? valueInitializer
: (CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWvalueTypeCONTROL_FLOW)? CONTROL_FLOWvalueInitializerCONTROL_FLOW
;

// Original: valueInitializer
CONTROL_FLOWvalueInitializerCONTROL_FLOW
// Original: : EQUALS_OPERATOR valueExpression
: CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 11.1 <graph expression>

// Original: graphExpression
CONTROL_FLOWgraphExpressionCONTROL_FLOW
// Original: : objectExpressionPrimary
: CONTROL_FLOWobjectExpressionPrimaryCONTROL_FLOW
// Original: | graphReference
| CONTROL_FLOWgraphReferenceCONTROL_FLOW
// Original: | objectNameOrBindingVariable
| CONTROL_FLOWobjectNameOrBindingVariableCONTROL_FLOW
// Original: | currentGraph
| CONTROL_FLOWcurrentGraphCONTROL_FLOW
;

// Original: currentGraph
CONTROL_FLOWcurrentGraphCONTROL_FLOW
// Original: : CURRENT_PROPERTY_GRAPH
// Original: : KEYWORD
: CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | CURRENT_GRAPH
| CONTROL_FLOWCURRENT_GRAPHCONTROL_FLOW
;

// 11.2 <binding table expression>

// Original: bindingTableExpression
CONTROL_FLOWbindingTableExpressionCONTROL_FLOW
// Original: : nestedBindingTableQuerySpecification
: CONTROL_FLOWnestedBindingTableQuerySpecificationCONTROL_FLOW
// Original: | objectExpressionPrimary
| CONTROL_FLOWobjectExpressionPrimaryCONTROL_FLOW
// Original: | bindingTableReference
| CONTROL_FLOWbindingTableReferenceCONTROL_FLOW
// Original: | objectNameOrBindingVariable
| CONTROL_FLOWobjectNameOrBindingVariableCONTROL_FLOW
;

// Original: nestedBindingTableQuerySpecification
CONTROL_FLOWnestedBindingTableQuerySpecificationCONTROL_FLOW
// Original: : nestedQuerySpecification
: CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
;

// 11.3 <object expression primary>

// Original: objectExpressionPrimary
CONTROL_FLOWobjectExpressionPrimaryCONTROL_FLOW
// Original: : VARIABLE valueExpressionPrimary
: CONTROL_FLOWVARIABLECONTROL_FLOW CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW
// Original: | parenthesizedValueExpression
| CONTROL_FLOWparenthesizedValueExpressionCONTROL_FLOW
// Original: | nonParenthesizedValueExpressionPrimarySpecialCase
| CONTROL_FLOWnonParenthesizedValueExpressionPrimarySpecialCaseCONTROL_FLOW
;

// 12.1 <linear catalog-modifying statement>

// Original: linearCatalogModifyingStatement
CONTROL_FLOWlinearCatalogModifyingStatementCONTROL_FLOW
: simpleCatalogModifyingStatement+
;

// Original: simpleCatalogModifyingStatement
CONTROL_FLOWsimpleCatalogModifyingStatementCONTROL_FLOW
// Original: : primitiveCatalogModifyingStatement
: CONTROL_FLOWprimitiveCatalogModifyingStatementCONTROL_FLOW
// Original: | callCatalogModifyingProcedureStatement
| CONTROL_FLOWcallCatalogModifyingProcedureStatementCONTROL_FLOW
;

// Original: primitiveCatalogModifyingStatement
CONTROL_FLOWprimitiveCatalogModifyingStatementCONTROL_FLOW
// Original: : createSchemaStatement
: CONTROL_FLOWcreateSchemaStatementCONTROL_FLOW
// Original: | dropSchemaStatement
| CONTROL_FLOWdropSchemaStatementCONTROL_FLOW
// Original: | createGraphStatement
| CONTROL_FLOWcreateGraphStatementCONTROL_FLOW
// Original: | dropGraphStatement
| CONTROL_FLOWdropGraphStatementCONTROL_FLOW
// Original: | createGraphTypeStatement
| CONTROL_FLOWcreateGraphTypeStatementCONTROL_FLOW
// Original: | dropGraphTypeStatement
| CONTROL_FLOWdropGraphTypeStatementCONTROL_FLOW
;

// 12.2 <insert schema statement>

// Original: createSchemaStatement
CONTROL_FLOWcreateSchemaStatementCONTROL_FLOW
// Original: : CREATE SCHEMA (IF NOT EXISTS)? catalogSchemaParentAndName
// Original: : KEYWORD SCHEMA (IF NOT EXISTS)? catalogSchemaParentAndName
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWSCHEMACONTROL_FLOW (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? CONTROL_FLOWcatalogSchemaParentAndNameCONTROL_FLOW
;

// 12.3 <drop schema statement>

// Original: dropSchemaStatement
CONTROL_FLOWdropSchemaStatementCONTROL_FLOW
// Original: : DROP SCHEMA (IF EXISTS)? catalogSchemaParentAndName
: CONTROL_FLOWDROPCONTROL_FLOW CONTROL_FLOWSCHEMACONTROL_FLOW (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? CONTROL_FLOWcatalogSchemaParentAndNameCONTROL_FLOW
;

// 12.4 <insert graph statement>

// Original: createGraphStatement
CONTROL_FLOWcreateGraphStatementCONTROL_FLOW
// Original: : CREATE (PROPERTY? GRAPH (IF NOT EXISTS)? | OR REPLACE PROPERTY? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (PROPERTY? GRAPH (IF NOT EXISTS)? | OR REPLACE PROPERTY? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (PROPERTY? GRAPH (IF NOT EXISTS)? | OR KEYWORD PROPERTY? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (KEYWORD? GRAPH (IF NOT EXISTS)? | OR KEYWORD KEYWORD? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (KEYWORD? GRAPH (IF KEYWORD EXISTS)? | OR KEYWORD KEYWORD? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (KEYWORD? GRAPH (IF KEYWORD KEYWORD)? | OR KEYWORD KEYWORD? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
// Original: : KEYWORD (KEYWORD? GRAPH (CONTROL_FLOW KEYWORD KEYWORD)? | OR KEYWORD KEYWORD? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
: KEYWORD (KEYWORD? GRAPH (CONTROL_FLOW KEYWORD KEYWORD)? | KEYWORD KEYWORD KEYWORD? GRAPH) catalogGraphParentAndName (openGraphType | ofGraphType) graphSource?
;

// Original: openGraphType
CONTROL_FLOWopenGraphTypeCONTROL_FLOW
// Original: : typed? ANY (PROPERTY? GRAPH)?
// Original: : typed? ANY (KEYWORD? GRAPH)?
: typed? KEYWORD (KEYWORD? GRAPH)?
;

// Original: ofGraphType
CONTROL_FLOWofGraphTypeCONTROL_FLOW
// Original: : graphTypeLikeGraph
: CONTROL_FLOWgraphTypeLikeGraphCONTROL_FLOW
// Original: | typed? graphTypeReference
| CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWgraphTypeReferenceCONTROL_FLOW
// Original: | typed? (PROPERTY? GRAPH)? nestedGraphTypeSpecification
| CONTROL_FLOWtypedCONTROL_FLOW? (CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW)? CONTROL_FLOWnestedGraphTypeSpecificationCONTROL_FLOW
;

// Original: graphTypeLikeGraph
CONTROL_FLOWgraphTypeLikeGraphCONTROL_FLOW
// Original: : LIKE graphExpression
: CONTROL_FLOWLIKECONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW
;

// Original: graphSource
CONTROL_FLOWgraphSourceCONTROL_FLOW
// Original: : AS COPY OF graphExpression
// Original: : KEYWORD COPY OF graphExpression
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWCOPYCONTROL_FLOW CONTROL_FLOWOFCONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW
;

// 12.5 <drop graph statement>

// Original: dropGraphStatement
CONTROL_FLOWdropGraphStatementCONTROL_FLOW
// Original: : DROP PROPERTY? GRAPH (IF EXISTS)? catalogGraphParentAndName
: CONTROL_FLOWDROPCONTROL_FLOW CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? CONTROL_FLOWcatalogGraphParentAndNameCONTROL_FLOW
;

// 12.6 <graph type statement>

// Original: createGraphTypeStatement
CONTROL_FLOWcreateGraphTypeStatementCONTROL_FLOW
// Original: : CREATE (PROPERTY? GRAPH TYPE (IF NOT EXISTS)? | OR REPLACE PROPERTY? GRAPH TYPE) catalogGraphTypeParentAndName graphTypeSource
// Original: : KEYWORD (PROPERTY? GRAPH TYPE (IF NOT EXISTS)? | OR REPLACE PROPERTY? GRAPH TYPE) catalogGraphTypeParentAndName graphTypeSource
: CONTROL_FLOWKEYWORDCONTROL_FLOW (CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWTYPECONTROL_FLOW (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? | CONTROL_FLOWORCONTROL_FLOW CONTROL_FLOWREPLACECONTROL_FLOW CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWTYPECONTROL_FLOW) CONTROL_FLOWcatalogGraphTypeParentAndNameCONTROL_FLOW CONTROL_FLOWgraphTypeSourceCONTROL_FLOW
;

// Original: graphTypeSource
CONTROL_FLOWgraphTypeSourceCONTROL_FLOW
// Original: : AS? copyOfGraphType
// Original: : KEYWORD? copyOfGraphType
: CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWcopyOfGraphTypeCONTROL_FLOW
// Original: | graphTypeLikeGraph
| CONTROL_FLOWgraphTypeLikeGraphCONTROL_FLOW
// Original: | AS? nestedGraphTypeSpecification
// Original: | KEYWORD? nestedGraphTypeSpecification
| CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWnestedGraphTypeSpecificationCONTROL_FLOW
;

// Original: copyOfGraphType
CONTROL_FLOWcopyOfGraphTypeCONTROL_FLOW
// Original: : COPY OF graphTypeReference
: CONTROL_FLOWCOPYCONTROL_FLOW CONTROL_FLOWOFCONTROL_FLOW CONTROL_FLOWgraphTypeReferenceCONTROL_FLOW
;

// 12.7 <drop graph statement>

// Original: dropGraphTypeStatement
CONTROL_FLOWdropGraphTypeStatementCONTROL_FLOW
// Original: : DROP PROPERTY? GRAPH TYPE (IF EXISTS)? catalogGraphTypeParentAndName
: CONTROL_FLOWDROPCONTROL_FLOW CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWTYPECONTROL_FLOW (CONTROL_FLOWIFCONTROL_FLOW CONTROL_FLOWEXISTSCONTROL_FLOW)? CONTROL_FLOWcatalogGraphTypeParentAndNameCONTROL_FLOW
;

// 12.8 <call catalog-modifying statement>

// Original: callCatalogModifyingProcedureStatement
CONTROL_FLOWcallCatalogModifyingProcedureStatementCONTROL_FLOW
// Original: : callProcedureStatement
: CONTROL_FLOWcallProcedureStatementCONTROL_FLOW
;

// 13.1 <linear data-modifying statement>

// Original: linearDataModifyingStatement
CONTROL_FLOWlinearDataModifyingStatementCONTROL_FLOW
// Original: : focusedLinearDataModifyingStatement
: CONTROL_FLOWfocusedLinearDataModifyingStatementCONTROL_FLOW
// Original: | ambientLinearDataModifyingStatement
| CONTROL_FLOWambientLinearDataModifyingStatementCONTROL_FLOW
;

// Original: focusedLinearDataModifyingStatement
CONTROL_FLOWfocusedLinearDataModifyingStatementCONTROL_FLOW
// Original: : focusedLinearDataModifyingStatementBody
: CONTROL_FLOWfocusedLinearDataModifyingStatementBodyCONTROL_FLOW
// Original: | focusedNestedDataModifyingProcedureSpecification
| CONTROL_FLOWfocusedNestedDataModifyingProcedureSpecificationCONTROL_FLOW
;

// Original: focusedLinearDataModifyingStatementBody
CONTROL_FLOWfocusedLinearDataModifyingStatementBodyCONTROL_FLOW
: useGraphClause simpleLinearDataAccessingStatement primitiveResultStatement?
;

// Original: focusedNestedDataModifyingProcedureSpecification
CONTROL_FLOWfocusedNestedDataModifyingProcedureSpecificationCONTROL_FLOW
// Original: : useGraphClause nestedDataModifyingProcedureSpecification
: CONTROL_FLOWuseGraphClauseCONTROL_FLOW CONTROL_FLOWnestedDataModifyingProcedureSpecificationCONTROL_FLOW
;

// Original: ambientLinearDataModifyingStatement
CONTROL_FLOWambientLinearDataModifyingStatementCONTROL_FLOW
// Original: : ambientLinearDataModifyingStatementBody
: CONTROL_FLOWambientLinearDataModifyingStatementBodyCONTROL_FLOW
// Original: | nestedDataModifyingProcedureSpecification
| CONTROL_FLOWnestedDataModifyingProcedureSpecificationCONTROL_FLOW
;

// Original: ambientLinearDataModifyingStatementBody
CONTROL_FLOWambientLinearDataModifyingStatementBodyCONTROL_FLOW
: simpleLinearDataAccessingStatement primitiveResultStatement?
;

// Original: simpleLinearDataAccessingStatement
CONTROL_FLOWsimpleLinearDataAccessingStatementCONTROL_FLOW
: simpleQueryStatement* simpleDataModifyingStatement+
;

// Original: // Subsumed by previous rule to enforce 13.1 SR 5
// CONTROL_FLOWSubsumedCONTROL_FLOW CONTROL_FLOWbyCONTROL_FLOW CONTROL_FLOWpreviousCONTROL_FLOW CONTROL_FLOWruleCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWenforceCONTROL_FLOW CONTROL_FLOW13CONTROL_FLOW.CONTROL_FLOW1CONTROL_FLOW CONTROL_FLOWSRCONTROL_FLOW CONTROL_FLOW5CONTROL_FLOW
// Original: //simpleDataAccessingStatement
//CONTROL_FLOWsimpleDataAccessingStatementCONTROL_FLOW
// Original: //    : simpleQueryStatement
//    : CONTROL_FLOWsimpleQueryStatementCONTROL_FLOW
// Original: //    | simpleDataModifyingStatement
//    | CONTROL_FLOWsimpleDataModifyingStatementCONTROL_FLOW
//    ;

// Original: simpleDataModifyingStatement
CONTROL_FLOWsimpleDataModifyingStatementCONTROL_FLOW
// Original: : primitiveDataModifyingStatement
: CONTROL_FLOWprimitiveDataModifyingStatementCONTROL_FLOW
// Original: | callDataModifyingProcedureStatement
| CONTROL_FLOWcallDataModifyingProcedureStatementCONTROL_FLOW
;

// Original: primitiveDataModifyingStatement
CONTROL_FLOWprimitiveDataModifyingStatementCONTROL_FLOW
// Original: : insertStatement
: CONTROL_FLOWinsertStatementCONTROL_FLOW
// Original: | setStatement
| CONTROL_FLOWsetStatementCONTROL_FLOW
// Original: | removeStatement
| CONTROL_FLOWremoveStatementCONTROL_FLOW
// Original: | deleteStatement
| CONTROL_FLOWdeleteStatementCONTROL_FLOW
;

// 13.2 <insertStatement>

// Original: insertStatement
CONTROL_FLOWinsertStatementCONTROL_FLOW
// Original: : INSERT insertGraphPattern
: CONTROL_FLOWINSERTCONTROL_FLOW CONTROL_FLOWinsertGraphPatternCONTROL_FLOW
;

// 13.3 <set statement>

// Original: setStatement
CONTROL_FLOWsetStatementCONTROL_FLOW
// Original: : SET setItemList
// Original: : KEYWORD setItemList
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsetItemListCONTROL_FLOW
;

// Original: setItemList
CONTROL_FLOWsetItemListCONTROL_FLOW
// Original: : setItem (COMMA setItem)*
: setItem (PUNCTUATION_OPERATOR setItem)*
;

// Original: setItem
CONTROL_FLOWsetItemCONTROL_FLOW
// Original: : setPropertyItem
: CONTROL_FLOWsetPropertyItemCONTROL_FLOW
// Original: | setAllPropertiesItem
| CONTROL_FLOWsetAllPropertiesItemCONTROL_FLOW
// Original: | setLabelItem
| CONTROL_FLOWsetLabelItemCONTROL_FLOW
;

// Original: setPropertyItem
CONTROL_FLOWsetPropertyItemCONTROL_FLOW
// Original: : bindingVariableReference PERIOD propertyName EQUALS_OPERATOR valueExpression
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW CONTROL_FLOWPERIODCONTROL_FLOW CONTROL_FLOWpropertyNameCONTROL_FLOW CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: setAllPropertiesItem
CONTROL_FLOWsetAllPropertiesItemCONTROL_FLOW
// Original: : bindingVariableReference EQUALS_OPERATOR LEFT_BRACE propertyKeyValuePairList? RIGHT_BRACE
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWpropertyKeyValuePairListCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: setLabelItem
CONTROL_FLOWsetLabelItemCONTROL_FLOW
// Original: : bindingVariableReference isOrColon labelName
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW CONTROL_FLOWisOrColonCONTROL_FLOW CONTROL_FLOWlabelNameCONTROL_FLOW
;

// 13.4 <remove statement>

// Original: removeStatement
CONTROL_FLOWremoveStatementCONTROL_FLOW
// Original: : REMOVE removeItemList
: CONTROL_FLOWREMOVECONTROL_FLOW CONTROL_FLOWremoveItemListCONTROL_FLOW
;

// Original: removeItemList
CONTROL_FLOWremoveItemListCONTROL_FLOW
// Original: : removeItem (COMMA removeItem)*
: removeItem (PUNCTUATION_OPERATOR removeItem)*
;

// Original: removeItem
CONTROL_FLOWremoveItemCONTROL_FLOW
// Original: : removePropertyItem
: CONTROL_FLOWremovePropertyItemCONTROL_FLOW
// Original: | removeLabelItem
| CONTROL_FLOWremoveLabelItemCONTROL_FLOW
;

// Original: removePropertyItem
CONTROL_FLOWremovePropertyItemCONTROL_FLOW
// Original: : bindingVariableReference PERIOD propertyName
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW CONTROL_FLOWPERIODCONTROL_FLOW CONTROL_FLOWpropertyNameCONTROL_FLOW
;

// Original: removeLabelItem
CONTROL_FLOWremoveLabelItemCONTROL_FLOW
// Original: : bindingVariableReference isOrColon labelName
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW CONTROL_FLOWisOrColonCONTROL_FLOW CONTROL_FLOWlabelNameCONTROL_FLOW
;

// 13.5 <delete statement>

// Original: deleteStatement
CONTROL_FLOWdeleteStatementCONTROL_FLOW
// Original: : (DETACH | NODETACH)? DELETE deleteItemList
// Original: : (DETACH | NODETACH)? KEYWORD deleteItemList
// Original: : (KEYWORD | NODETACH)? KEYWORD deleteItemList
: (CONTROL_FLOWKEYWORDCONTROL_FLOW | CONTROL_FLOWNODETACHCONTROL_FLOW)? CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWdeleteItemListCONTROL_FLOW
;

// Original: deleteItemList
CONTROL_FLOWdeleteItemListCONTROL_FLOW
// Original: : deleteItem (COMMA deleteItem)*
: deleteItem (PUNCTUATION_OPERATOR deleteItem)*
;

// Original: deleteItem
CONTROL_FLOWdeleteItemCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 13.6 <call data-modifying procedure statement>

// Original: callDataModifyingProcedureStatement
CONTROL_FLOWcallDataModifyingProcedureStatementCONTROL_FLOW
// Original: : callProcedureStatement
: CONTROL_FLOWcallProcedureStatementCONTROL_FLOW
;

// 14.1 <composite query statement>

// Original: compositeQueryStatement
CONTROL_FLOWcompositeQueryStatementCONTROL_FLOW
// Original: : compositeQueryExpression
: CONTROL_FLOWcompositeQueryExpressionCONTROL_FLOW
;

// 14.2 <composite query expression>

// Original: compositeQueryExpression
CONTROL_FLOWcompositeQueryExpressionCONTROL_FLOW
// Original: : compositeQueryExpression queryConjunction compositeQueryPrimary
: CONTROL_FLOWcompositeQueryExpressionCONTROL_FLOW CONTROL_FLOWqueryConjunctionCONTROL_FLOW CONTROL_FLOWcompositeQueryPrimaryCONTROL_FLOW
// Original: | compositeQueryPrimary
| CONTROL_FLOWcompositeQueryPrimaryCONTROL_FLOW
;

// Original: queryConjunction
CONTROL_FLOWqueryConjunctionCONTROL_FLOW
// Original: : setOperator
: CONTROL_FLOWsetOperatorCONTROL_FLOW
// Original: | OTHERWISE
| CONTROL_FLOWOTHERWISECONTROL_FLOW
;

// Original: setOperator
CONTROL_FLOWsetOperatorCONTROL_FLOW
// Original: : UNION setQuantifier?
: KEYWORD setQuantifier?
// Original: | EXCEPT setQuantifier?
| KEYWORD setQuantifier?
// Original: | INTERSECT setQuantifier?
| KEYWORD setQuantifier?
;

// Original: compositeQueryPrimary
CONTROL_FLOWcompositeQueryPrimaryCONTROL_FLOW
// Original: : linearQueryStatement
: CONTROL_FLOWlinearQueryStatementCONTROL_FLOW
;

// 14.3 <linear query statement> and <simple query statement>

// Original: linearQueryStatement
CONTROL_FLOWlinearQueryStatementCONTROL_FLOW
// Original: : focusedLinearQueryStatement
: CONTROL_FLOWfocusedLinearQueryStatementCONTROL_FLOW
// Original: | ambientLinearQueryStatement
| CONTROL_FLOWambientLinearQueryStatementCONTROL_FLOW
;

// Original: focusedLinearQueryStatement
CONTROL_FLOWfocusedLinearQueryStatementCONTROL_FLOW
// Original: : focusedLinearQueryStatementPart* focusedLinearQueryAndPrimitiveResultStatementPart
: CONTROL_FLOWfocusedLinearQueryStatementPartCONTROL_FLOW* CONTROL_FLOWfocusedLinearQueryAndPrimitiveResultStatementPartCONTROL_FLOW
// Original: | focusedPrimitiveResultStatement
| CONTROL_FLOWfocusedPrimitiveResultStatementCONTROL_FLOW
// Original: | focusedNestedQuerySpecification
| CONTROL_FLOWfocusedNestedQuerySpecificationCONTROL_FLOW
// Original: | selectStatement
| CONTROL_FLOWselectStatementCONTROL_FLOW
;

// Original: focusedLinearQueryStatementPart
CONTROL_FLOWfocusedLinearQueryStatementPartCONTROL_FLOW
// Original: : useGraphClause simpleLinearQueryStatement
: CONTROL_FLOWuseGraphClauseCONTROL_FLOW CONTROL_FLOWsimpleLinearQueryStatementCONTROL_FLOW
;

// Original: focusedLinearQueryAndPrimitiveResultStatementPart
CONTROL_FLOWfocusedLinearQueryAndPrimitiveResultStatementPartCONTROL_FLOW
// Original: : useGraphClause simpleLinearQueryStatement primitiveResultStatement
: CONTROL_FLOWuseGraphClauseCONTROL_FLOW CONTROL_FLOWsimpleLinearQueryStatementCONTROL_FLOW CONTROL_FLOWprimitiveResultStatementCONTROL_FLOW
;

// Original: focusedPrimitiveResultStatement
CONTROL_FLOWfocusedPrimitiveResultStatementCONTROL_FLOW
// Original: : useGraphClause primitiveResultStatement
: CONTROL_FLOWuseGraphClauseCONTROL_FLOW CONTROL_FLOWprimitiveResultStatementCONTROL_FLOW
;

// Original: focusedNestedQuerySpecification
CONTROL_FLOWfocusedNestedQuerySpecificationCONTROL_FLOW
// Original: : useGraphClause nestedQuerySpecification
: CONTROL_FLOWuseGraphClauseCONTROL_FLOW CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
;

// Original: ambientLinearQueryStatement
CONTROL_FLOWambientLinearQueryStatementCONTROL_FLOW
// Original: : simpleLinearQueryStatement? primitiveResultStatement
: CONTROL_FLOWsimpleLinearQueryStatementCONTROL_FLOW? CONTROL_FLOWprimitiveResultStatementCONTROL_FLOW
// Original: | nestedQuerySpecification
| CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
;

// Original: simpleLinearQueryStatement
CONTROL_FLOWsimpleLinearQueryStatementCONTROL_FLOW
: simpleQueryStatement+
;

// Original: simpleQueryStatement
CONTROL_FLOWsimpleQueryStatementCONTROL_FLOW
// Original: : primitiveQueryStatement
: CONTROL_FLOWprimitiveQueryStatementCONTROL_FLOW
// Original: | callQueryStatement
| CONTROL_FLOWcallQueryStatementCONTROL_FLOW
;

// Original: primitiveQueryStatement
CONTROL_FLOWprimitiveQueryStatementCONTROL_FLOW
// Original: : matchStatement
: CONTROL_FLOWmatchStatementCONTROL_FLOW
// Original: | letStatement
| CONTROL_FLOWletStatementCONTROL_FLOW
// Original: | forStatement
| CONTROL_FLOWforStatementCONTROL_FLOW
// Original: | filterStatement
| CONTROL_FLOWfilterStatementCONTROL_FLOW
// Original: | orderByAndPageStatement
| CONTROL_FLOWorderByAndPageStatementCONTROL_FLOW
;

// 14.4 <match statement>

// Original: matchStatement
CONTROL_FLOWmatchStatementCONTROL_FLOW
// Original: : simpleMatchStatement
: CONTROL_FLOWsimpleMatchStatementCONTROL_FLOW
// Original: | optionalMatchStatement
| CONTROL_FLOWoptionalMatchStatementCONTROL_FLOW
;

// Original: simpleMatchStatement
CONTROL_FLOWsimpleMatchStatementCONTROL_FLOW
// Original: : MATCH graphPatternBindingTable
: CONTROL_FLOWMATCHCONTROL_FLOW CONTROL_FLOWgraphPatternBindingTableCONTROL_FLOW
;

// Original: optionalMatchStatement
CONTROL_FLOWoptionalMatchStatementCONTROL_FLOW
// Original: : OPTIONAL optionalOperand
: CONTROL_FLOWOPTIONALCONTROL_FLOW CONTROL_FLOWoptionalOperandCONTROL_FLOW
;

// Original: optionalOperand
CONTROL_FLOWoptionalOperandCONTROL_FLOW
// Original: : simpleMatchStatement
: CONTROL_FLOWsimpleMatchStatementCONTROL_FLOW
// Original: | LEFT_BRACE matchStatementBlock RIGHT_BRACE
| CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWmatchStatementBlockCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
// Original: | LEFT_PAREN matchStatementBlock RIGHT_PAREN
// Original: | LEFT_PAREN matchStatementBlock PUNCTUATION_OPERATOR
| CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWmatchStatementBlockCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: matchStatementBlock
CONTROL_FLOWmatchStatementBlockCONTROL_FLOW
: matchStatement+
;

// 14.5 <call query statement>

// Original: callQueryStatement
CONTROL_FLOWcallQueryStatementCONTROL_FLOW
// Original: : callProcedureStatement
: CONTROL_FLOWcallProcedureStatementCONTROL_FLOW
;

// 14.6 <filter statement>

// Original: filterStatement
CONTROL_FLOWfilterStatementCONTROL_FLOW
// Original: : FILTER (whereClause | searchCondition)
: KEYWORD (whereClause | searchCondition)
;

// 14.7 <let statement>

// Original: letStatement
CONTROL_FLOWletStatementCONTROL_FLOW
// Original: : LET letVariableDefinitionList
: CONTROL_FLOWLETCONTROL_FLOW CONTROL_FLOWletVariableDefinitionListCONTROL_FLOW
;

// Original: letVariableDefinitionList
CONTROL_FLOWletVariableDefinitionListCONTROL_FLOW
// Original: : letVariableDefinition (COMMA letVariableDefinition)*
: letVariableDefinition (PUNCTUATION_OPERATOR letVariableDefinition)*
;

// Original: letVariableDefinition
CONTROL_FLOWletVariableDefinitionCONTROL_FLOW
// Original: : valueVariableDefinition
: CONTROL_FLOWvalueVariableDefinitionCONTROL_FLOW
// Original: | bindingVariable EQUALS_OPERATOR valueExpression
| CONTROL_FLOWbindingVariableCONTROL_FLOW CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 14.8 <for statement>

// Original: forStatement
CONTROL_FLOWforStatementCONTROL_FLOW
// Original: : FOR forItem forOrdinalityOrOffset?
: CONTROL_FLOW forItem forOrdinalityOrOffset?
;

// Original: forItem
CONTROL_FLOWforItemCONTROL_FLOW
// Original: : forItemAlias forItemSource
: CONTROL_FLOWforItemAliasCONTROL_FLOW CONTROL_FLOWforItemSourceCONTROL_FLOW
;

// Original: forItemAlias
CONTROL_FLOWforItemAliasCONTROL_FLOW
// Original: : bindingVariable IN
: CONTROL_FLOWbindingVariableCONTROL_FLOW CONTROL_FLOWINCONTROL_FLOW
;

// Original: forItemSource
CONTROL_FLOWforItemSourceCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: forOrdinalityOrOffset
CONTROL_FLOWforOrdinalityOrOffsetCONTROL_FLOW
// Original: : WITH (ORDINALITY | OFFSET) bindingVariable
// Original: : WITH (KEYWORD | OFFSET) bindingVariable
: CONTROL_FLOWWITHCONTROL_FLOW (CONTROL_FLOWKEYWORDCONTROL_FLOW | CONTROL_FLOWOFFSETCONTROL_FLOW) CONTROL_FLOWbindingVariableCONTROL_FLOW
;

// 14.9 <order by and page statement>

// Original: orderByAndPageStatement
CONTROL_FLOWorderByAndPageStatementCONTROL_FLOW
: orderByClause offsetClause? limitClause?
| offsetClause limitClause?
// Original: | limitClause
| CONTROL_FLOWlimitClauseCONTROL_FLOW
;

// 14.10 <primitive result statement>

// Original: primitiveResultStatement
CONTROL_FLOWprimitiveResultStatementCONTROL_FLOW
: returnStatement orderByAndPageStatement?
// Original: | FINISH
| CONTROL_FLOWFINISHCONTROL_FLOW
;

// 14.11 <return statement>

// Original: returnStatement
CONTROL_FLOWreturnStatementCONTROL_FLOW
// Original: : RETURN returnStatementBody
: CONTROL_FLOWRETURNCONTROL_FLOW CONTROL_FLOWreturnStatementBodyCONTROL_FLOW
;

// Original: returnStatementBody
CONTROL_FLOWreturnStatementBodyCONTROL_FLOW
// Original: : setQuantifier? (ASTERISK | returnItemList) groupByClause?
: setQuantifier? (PUNCTUATION_OPERATOR | returnItemList) groupByClause?
// Original: | NO BINDINGS
// Original: | NO KEYWORD
| CONTROL_FLOWNOCONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW
;

// Original: returnItemList
CONTROL_FLOWreturnItemListCONTROL_FLOW
// Original: : returnItem (COMMA returnItem)*
: returnItem (PUNCTUATION_OPERATOR returnItem)*
;

// Original: returnItem
CONTROL_FLOWreturnItemCONTROL_FLOW
: aggregatingValueExpression returnItemAlias?
;

// Original: returnItemAlias
CONTROL_FLOWreturnItemAliasCONTROL_FLOW
// Original: : AS identifier
// Original: : KEYWORD identifier
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWidentifierCONTROL_FLOW
;

// 14.12 <select statement>

// Original: selectStatement
CONTROL_FLOWselectStatementCONTROL_FLOW
// Original: : SELECT setQuantifier? (ASTERISK | selectItemList) (selectStatementBody whereClause? groupByClause? havingClause? orderByClause? offsetClause? limitClause?)?
// Original: : SELECT setQuantifier? (PUNCTUATION_OPERATOR | selectItemList) (selectStatementBody whereClause? groupByClause? havingClause? orderByClause? offsetClause? limitClause?)?
: KEYWORD setQuantifier? (PUNCTUATION_OPERATOR | selectItemList) (selectStatementBody whereClause? groupByClause? havingClause? orderByClause? offsetClause? limitClause?)?
;

// Original: selectItemList
CONTROL_FLOWselectItemListCONTROL_FLOW
// Original: : selectItem (COMMA selectItem)*
: selectItem (PUNCTUATION_OPERATOR selectItem)*
;

// Original: selectItem
CONTROL_FLOWselectItemCONTROL_FLOW
: aggregatingValueExpression selectItemAlias?
;

// Original: selectItemAlias
CONTROL_FLOWselectItemAliasCONTROL_FLOW
// Original: : AS identifier
// Original: : KEYWORD identifier
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: havingClause
CONTROL_FLOWhavingClauseCONTROL_FLOW
// Original: : HAVING searchCondition
: CONTROL_FLOWHAVINGCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW
;

// Original: selectStatementBody
CONTROL_FLOWselectStatementBodyCONTROL_FLOW
// Original: : FROM (selectGraphMatchList | selectQuerySpecification)
: KEYWORD (selectGraphMatchList | selectQuerySpecification)
;

// Original: selectGraphMatchList
CONTROL_FLOWselectGraphMatchListCONTROL_FLOW
// Original: : selectGraphMatch (COMMA selectGraphMatch)*
: selectGraphMatch (PUNCTUATION_OPERATOR selectGraphMatch)*
;

// Original: selectGraphMatch
CONTROL_FLOWselectGraphMatchCONTROL_FLOW
// Original: : graphExpression matchStatement
: CONTROL_FLOWgraphExpressionCONTROL_FLOW CONTROL_FLOWmatchStatementCONTROL_FLOW
;

// Original: selectQuerySpecification
CONTROL_FLOWselectQuerySpecificationCONTROL_FLOW
// Original: : nestedQuerySpecification
: CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
// Original: | graphExpression nestedQuerySpecification
| CONTROL_FLOWgraphExpressionCONTROL_FLOW CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
;

// 15.1 <call procedure statement> and <procedure call>

// Original: callProcedureStatement
CONTROL_FLOWcallProcedureStatementCONTROL_FLOW
// Original: : OPTIONAL? CALL procedureCall
// Original: : OPTIONAL? KEYWORD procedureCall
: CONTROL_FLOWOPTIONALCONTROL_FLOW? CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWprocedureCallCONTROL_FLOW
;

// Original: procedureCall
CONTROL_FLOWprocedureCallCONTROL_FLOW
// Original: : inlineProcedureCall
: CONTROL_FLOWinlineProcedureCallCONTROL_FLOW
// Original: | namedProcedureCall
| CONTROL_FLOWnamedProcedureCallCONTROL_FLOW
;

// 15.2 <inline procedure call>

// Original: inlineProcedureCall
CONTROL_FLOWinlineProcedureCallCONTROL_FLOW
// Original: : variableScopeClause? nestedProcedureSpecification
: CONTROL_FLOWvariableScopeClauseCONTROL_FLOW? CONTROL_FLOWnestedProcedureSpecificationCONTROL_FLOW
;

// Original: variableScopeClause
CONTROL_FLOWvariableScopeClauseCONTROL_FLOW
// Original: : LEFT_PAREN bindingVariableReferenceList? RIGHT_PAREN
// Original: : LEFT_PAREN bindingVariableReferenceList? PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWbindingVariableReferenceListCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: bindingVariableReferenceList
CONTROL_FLOWbindingVariableReferenceListCONTROL_FLOW
// Original: : bindingVariableReference (COMMA bindingVariableReference)*
: bindingVariableReference (PUNCTUATION_OPERATOR bindingVariableReference)*
;

// 15.3 <named procedure call>

// Original: namedProcedureCall
CONTROL_FLOWnamedProcedureCallCONTROL_FLOW
// Original: : procedureReference LEFT_PAREN procedureArgumentList? RIGHT_PAREN yieldClause?
// Original: : procedureReference LEFT_PAREN procedureArgumentList? PUNCTUATION_OPERATOR yieldClause?
: procedureReference PUNCTUATION_OPERATOR procedureArgumentList? PUNCTUATION_OPERATOR yieldClause?
;

// Original: procedureArgumentList
CONTROL_FLOWprocedureArgumentListCONTROL_FLOW
// Original: : procedureArgument (COMMA procedureArgument)*
: procedureArgument (PUNCTUATION_OPERATOR procedureArgument)*
;

// Original: procedureArgument
CONTROL_FLOWprocedureArgumentCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 16.1 <at schema clasue>

// Original: atSchemaClause
CONTROL_FLOWatSchemaClauseCONTROL_FLOW
// Original: : AT schemaReference
// Original: : KEYWORD schemaReference
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWschemaReferenceCONTROL_FLOW
;

// 16.2 <use graph clause>

// Original: useGraphClause
CONTROL_FLOWuseGraphClauseCONTROL_FLOW
// Original: : USE graphExpression
: CONTROL_FLOWUSECONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW
;

// 16.3 <graph pattern binding table>

// Original: graphPatternBindingTable
CONTROL_FLOWgraphPatternBindingTableCONTROL_FLOW
: graphPattern graphPatternYieldClause?
;

// Original: graphPatternYieldClause
CONTROL_FLOWgraphPatternYieldClauseCONTROL_FLOW
// Original: : YIELD graphPatternYieldItemList
// Original: : KEYWORD graphPatternYieldItemList
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWgraphPatternYieldItemListCONTROL_FLOW
;

// Original: graphPatternYieldItemList
CONTROL_FLOWgraphPatternYieldItemListCONTROL_FLOW
// Original: : graphPatternYieldItem (COMMA graphPatternYieldItem)*
: graphPatternYieldItem (PUNCTUATION_OPERATOR graphPatternYieldItem)*
// Original: | NO BINDINGS
// Original: | NO KEYWORD
| CONTROL_FLOWNOCONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW
;

// Original: // <elemement variable reference> and <path variable reference> are identical productions, both consisting
// <CONTROL_FLOWelemementCONTROL_FLOW CONTROL_FLOWvariableCONTROL_FLOW CONTROL_FLOWreferenceCONTROL_FLOW> CONTROL_FLOWandCONTROL_FLOW <CONTROL_FLOWpathCONTROL_FLOW CONTROL_FLOWvariableCONTROL_FLOW CONTROL_FLOWreferenceCONTROL_FLOW> CONTROL_FLOWareCONTROL_FLOW CONTROL_FLOWidenticalCONTROL_FLOW CONTROL_FLOWproductionsCONTROL_FLOW, CONTROL_FLOWbothCONTROL_FLOW CONTROL_FLOWconsistingCONTROL_FLOW
// Original: // of a single non-terminal <binding variable reference>. Thus <graph pattern yield item> is ambiguous
// CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWaCONTROL_FLOW CONTROL_FLOWsingleCONTROL_FLOW CONTROL_FLOWnonCONTROL_FLOW-CONTROL_FLOWterminalCONTROL_FLOW <CONTROL_FLOWbindingCONTROL_FLOW CONTROL_FLOWvariableCONTROL_FLOW CONTROL_FLOWreferenceCONTROL_FLOW>. CONTROL_FLOWThusCONTROL_FLOW <CONTROL_FLOWgraphCONTROL_FLOW CONTROL_FLOWpatternCONTROL_FLOW CONTROL_FLOWyieldCONTROL_FLOW CONTROL_FLOWitemCONTROL_FLOW> CONTROL_FLOWisCONTROL_FLOW CONTROL_FLOWambiguousCONTROL_FLOW
// Original: // from a parsing standpoint. So here we simply use bindingVariableReference. Post parsing code must
// CONTROL_FLOWfromCONTROL_FLOW CONTROL_FLOWaCONTROL_FLOW CONTROL_FLOWparsingCONTROL_FLOW CONTROL_FLOWstandpointCONTROL_FLOW. CONTROL_FLOWSoCONTROL_FLOW CONTROL_FLOWhereCONTROL_FLOW CONTROL_FLOWweCONTROL_FLOW CONTROL_FLOWsimplyCONTROL_FLOW CONTROL_FLOWuseCONTROL_FLOW CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW. CONTROL_FLOWPostCONTROL_FLOW CONTROL_FLOWparsingCONTROL_FLOW CONTROL_FLOWcodeCONTROL_FLOW CONTROL_FLOWmustCONTROL_FLOW
// apply the semantics assocaited with each type of <binding variable reference>.
// Original: graphPatternYieldItem
CONTROL_FLOWgraphPatternYieldItemCONTROL_FLOW
// Original: : bindingVariableReference
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
// Original: //    : elementVariableReference
//    : CONTROL_FLOWelementVariableReferenceCONTROL_FLOW
// Original: //    | pathVariableReference
//    | CONTROL_FLOWpathVariableReferenceCONTROL_FLOW
;

// 16.4 <graph pattern>

// Original: graphPattern
CONTROL_FLOWgraphPatternCONTROL_FLOW
: matchMode? pathPatternList keepClause? graphPatternWhereClause?
;

// Original: matchMode
CONTROL_FLOWmatchModeCONTROL_FLOW
// Original: : repeatableElementsMatchMode
: CONTROL_FLOWrepeatableElementsMatchModeCONTROL_FLOW
// Original: | differentEdgesMatchMode
| CONTROL_FLOWdifferentEdgesMatchModeCONTROL_FLOW
;

// Original: repeatableElementsMatchMode
CONTROL_FLOWrepeatableElementsMatchModeCONTROL_FLOW
// Original: : REPEATABLE elementBindingsOrElements
: CONTROL_FLOWREPEATABLECONTROL_FLOW CONTROL_FLOWelementBindingsOrElementsCONTROL_FLOW
;

// Original: differentEdgesMatchMode
CONTROL_FLOWdifferentEdgesMatchModeCONTROL_FLOW
// Original: : DIFFERENT edgeBindingsOrEdges
: CONTROL_FLOWDIFFERENTCONTROL_FLOW CONTROL_FLOWedgeBindingsOrEdgesCONTROL_FLOW
;

// Original: elementBindingsOrElements
CONTROL_FLOWelementBindingsOrElementsCONTROL_FLOW
// Original: : ELEMENT BINDINGS?
// Original: : ELEMENT KEYWORD?
: DATA_TYPE KEYWORD?
// Original: | ELEMENTS
| CONTROL_FLOWELEMENTSCONTROL_FLOW
;

// Original: edgeBindingsOrEdges
CONTROL_FLOWedgeBindingsOrEdgesCONTROL_FLOW
// Original: : edgeSynonym BINDINGS?
: edgeSynonym KEYWORD?
// Original: | edgesSynonym
| CONTROL_FLOWedgesSynonymCONTROL_FLOW
;

// Original: pathPatternList
CONTROL_FLOWpathPatternListCONTROL_FLOW
// Original: : pathPattern (COMMA pathPattern)*
: pathPattern (PUNCTUATION_OPERATOR pathPattern)*
;

// Original: pathPattern
CONTROL_FLOWpathPatternCONTROL_FLOW
// Original: : pathVariableDeclaration? pathPatternPrefix? pathPatternExpression
: CONTROL_FLOWpathVariableDeclarationCONTROL_FLOW? CONTROL_FLOWpathPatternPrefixCONTROL_FLOW? CONTROL_FLOWpathPatternExpressionCONTROL_FLOW
;

// Original: pathVariableDeclaration
CONTROL_FLOWpathVariableDeclarationCONTROL_FLOW
// Original: : pathVariable EQUALS_OPERATOR
: CONTROL_FLOWpathVariableCONTROL_FLOW CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW
;

// Original: keepClause
CONTROL_FLOWkeepClauseCONTROL_FLOW
// Original: : KEEP pathPatternPrefix
: CONTROL_FLOWKEEPCONTROL_FLOW CONTROL_FLOWpathPatternPrefixCONTROL_FLOW
;

// Original: graphPatternWhereClause
CONTROL_FLOWgraphPatternWhereClauseCONTROL_FLOW
// Original: : WHERE searchCondition
// Original: : KEYWORD searchCondition
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW
;

// 16.5 <insert graph pattern>

// Original: insertGraphPattern
CONTROL_FLOWinsertGraphPatternCONTROL_FLOW
// Original: : insertPathPatternList
: CONTROL_FLOWinsertPathPatternListCONTROL_FLOW
;

// Original: insertPathPatternList
CONTROL_FLOWinsertPathPatternListCONTROL_FLOW
// Original: : insertPathPattern (COMMA insertPathPattern)*
: insertPathPattern (PUNCTUATION_OPERATOR insertPathPattern)*
;

// Original: insertPathPattern
CONTROL_FLOWinsertPathPatternCONTROL_FLOW
: insertNodePattern (insertEdgePattern insertNodePattern)*
;

// Original: insertNodePattern
CONTROL_FLOWinsertNodePatternCONTROL_FLOW
// Original: : LEFT_PAREN insertElementPatternFiller? RIGHT_PAREN
// Original: : LEFT_PAREN insertElementPatternFiller? PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWinsertElementPatternFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: insertEdgePattern
CONTROL_FLOWinsertEdgePatternCONTROL_FLOW
// Original: : insertEdgePointingLeft
: CONTROL_FLOWinsertEdgePointingLeftCONTROL_FLOW
// Original: | insertEdgePointingRight
| CONTROL_FLOWinsertEdgePointingRightCONTROL_FLOW
// Original: | insertEdgeUndirected
| CONTROL_FLOWinsertEdgeUndirectedCONTROL_FLOW
;

// Original: insertEdgePointingLeft
CONTROL_FLOWinsertEdgePointingLeftCONTROL_FLOW
// Original: : LEFT_ARROW_BRACKET insertElementPatternFiller? RIGHT_BRACKET_MINUS
: CONTROL_FLOWLEFT_ARROW_BRACKETCONTROL_FLOW CONTROL_FLOWinsertElementPatternFillerCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACKET_MINUSCONTROL_FLOW
;

// Original: insertEdgePointingRight
CONTROL_FLOWinsertEdgePointingRightCONTROL_FLOW
// Original: : MINUS_LEFT_BRACKET insertElementPatternFiller? BRACKET_RIGHT_ARROW
// Original: : MINUS_LEFT_BRACKET insertElementPatternFiller? PUNCTUATION_OPERATOR
: CONTROL_FLOWMINUS_LEFT_BRACKETCONTROL_FLOW CONTROL_FLOWinsertElementPatternFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: insertEdgeUndirected
CONTROL_FLOWinsertEdgeUndirectedCONTROL_FLOW
// Original: : TILDE_LEFT_BRACKET insertElementPatternFiller? RIGHT_BRACKET_TILDE
// Original: : TILDE_LEFT_BRACKET insertElementPatternFiller? PUNCTUATION_OPERATOR
// Original: : PUNCTUATION_OPERATOR insertElementPatternFiller? PUNCTUATION_OPERATOR
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWinsertElementPatternFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: insertElementPatternFiller
CONTROL_FLOWinsertElementPatternFillerCONTROL_FLOW
: elementVariableDeclaration labelAndPropertySetSpecification?
// Original: | elementVariableDeclaration? labelAndPropertySetSpecification
| CONTROL_FLOWelementVariableDeclarationCONTROL_FLOW? CONTROL_FLOWlabelAndPropertySetSpecificationCONTROL_FLOW
;

// Original: labelAndPropertySetSpecification
CONTROL_FLOWlabelAndPropertySetSpecificationCONTROL_FLOW
: isOrColon labelSetSpecification elementPropertySpecification?
// Original: | (isOrColon labelSetSpecification)? elementPropertySpecification
| (CONTROL_FLOWisOrColonCONTROL_FLOW CONTROL_FLOWlabelSetSpecificationCONTROL_FLOW)? CONTROL_FLOWelementPropertySpecificationCONTROL_FLOW
;

// 16.6 <path pattern prefix>

// Original: pathPatternPrefix
CONTROL_FLOWpathPatternPrefixCONTROL_FLOW
// Original: : pathModePrefix
: CONTROL_FLOWpathModePrefixCONTROL_FLOW
// Original: | pathSearchPrefix
| CONTROL_FLOWpathSearchPrefixCONTROL_FLOW
;

// Original: pathModePrefix
CONTROL_FLOWpathModePrefixCONTROL_FLOW
: pathMode pathOrPaths?
;

// Original: pathMode
CONTROL_FLOWpathModeCONTROL_FLOW
// Original: : WALK
: CONTROL_FLOWWALKCONTROL_FLOW
// Original: | TRAIL
| CONTROL_FLOWTRAILCONTROL_FLOW
// Original: | SIMPLE
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | ACYCLIC
| CONTROL_FLOWACYCLICCONTROL_FLOW
;

// Original: pathSearchPrefix
CONTROL_FLOWpathSearchPrefixCONTROL_FLOW
// Original: : allPathSearch
: CONTROL_FLOWallPathSearchCONTROL_FLOW
// Original: | anyPathSearch
| CONTROL_FLOWanyPathSearchCONTROL_FLOW
// Original: | shortestPathSearch
| CONTROL_FLOWshortestPathSearchCONTROL_FLOW
;

// Original: allPathSearch
CONTROL_FLOWallPathSearchCONTROL_FLOW
// Original: : ALL pathMode? pathOrPaths?
: KEYWORD pathMode? pathOrPaths?
;

// Original: pathOrPaths
CONTROL_FLOWpathOrPathsCONTROL_FLOW
// Original: : PATH
// Original: : KEYWORD
: CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | PATHS
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
;

// Original: anyPathSearch
CONTROL_FLOWanyPathSearchCONTROL_FLOW
// Original: : ANY numberOfPaths? pathMode? pathOrPaths?
: KEYWORD numberOfPaths? pathMode? pathOrPaths?
;

// Original: numberOfPaths
CONTROL_FLOWnumberOfPathsCONTROL_FLOW
// Original: : nonNegativeIntegerSpecification
: CONTROL_FLOWnonNegativeIntegerSpecificationCONTROL_FLOW
;

// Original: shortestPathSearch
CONTROL_FLOWshortestPathSearchCONTROL_FLOW
// Original: : allShortestPathSearch
: CONTROL_FLOWallShortestPathSearchCONTROL_FLOW
// Original: | anyShortestPathSearch
| CONTROL_FLOWanyShortestPathSearchCONTROL_FLOW
// Original: | countedShortestPathSearch
| CONTROL_FLOWcountedShortestPathSearchCONTROL_FLOW
// Original: | countedShortestGroupSearch
| CONTROL_FLOWcountedShortestGroupSearchCONTROL_FLOW
;

// Original: allShortestPathSearch
CONTROL_FLOWallShortestPathSearchCONTROL_FLOW
// Original: : ALL SHORTEST pathMode? pathOrPaths?
// Original: : KEYWORD SHORTEST pathMode? pathOrPaths?
: KEYWORD KEYWORD pathMode? pathOrPaths?
;

// Original: anyShortestPathSearch
CONTROL_FLOWanyShortestPathSearchCONTROL_FLOW
// Original: : ANY SHORTEST pathMode? pathOrPaths?
// Original: : ANY KEYWORD pathMode? pathOrPaths?
: KEYWORD KEYWORD pathMode? pathOrPaths?
;

// Original: countedShortestPathSearch
CONTROL_FLOWcountedShortestPathSearchCONTROL_FLOW
// Original: : SHORTEST numberOfPaths pathMode? pathOrPaths?
: KEYWORD numberOfPaths pathMode? pathOrPaths?
;

// Original: countedShortestGroupSearch
CONTROL_FLOWcountedShortestGroupSearchCONTROL_FLOW
// Original: : SHORTEST numberOfGroups? pathMode? pathOrPaths? (GROUP | GROUPS)
// Original: : SHORTEST numberOfGroups? pathMode? pathOrPaths? (GROUP | KEYWORD)
// Original: : SHORTEST numberOfGroups? pathMode? pathOrPaths? (KEYWORD | KEYWORD)
: KEYWORD numberOfGroups? pathMode? pathOrPaths? (KEYWORD | KEYWORD)
;

// Original: numberOfGroups
CONTROL_FLOWnumberOfGroupsCONTROL_FLOW
// Original: : nonNegativeIntegerSpecification
: CONTROL_FLOWnonNegativeIntegerSpecificationCONTROL_FLOW
;

// 16.7 <path pattern expression>

// Original: pathPatternExpression
CONTROL_FLOWpathPatternExpressionCONTROL_FLOW
// Original: : pathTerm                                              #ppePathTerm
: CONTROL_FLOWpathTermCONTROL_FLOW                                              #CONTROL_FLOWppePathTermCONTROL_FLOW
// Original: | pathTerm (MULTISET_ALTERNATION_OPERATOR pathTerm)+    #ppeMultisetAlternation
| CONTROL_FLOWpathTermCONTROL_FLOW (CONTROL_FLOWMULTISET_ALTERNATION_OPERATORCONTROL_FLOW CONTROL_FLOWpathTermCONTROL_FLOW)+    #CONTROL_FLOWppeMultisetAlternationCONTROL_FLOW
// Original: | pathTerm (VERTICAL_BAR pathTerm)+                     #ppePatternUnion
| CONTROL_FLOWpathTermCONTROL_FLOW (CONTROL_FLOWVERTICAL_BARCONTROL_FLOW CONTROL_FLOWpathTermCONTROL_FLOW)+                     #CONTROL_FLOWppePatternUnionCONTROL_FLOW
;

// Original: pathTerm
CONTROL_FLOWpathTermCONTROL_FLOW
: pathFactor+
;

// Original: pathFactor
CONTROL_FLOWpathFactorCONTROL_FLOW
// Original: : pathPrimary                           #pfPathPrimary
: CONTROL_FLOWpathPrimaryCONTROL_FLOW                           #CONTROL_FLOWpfPathPrimaryCONTROL_FLOW
// Original: | pathPrimary graphPatternQuantifier    #pfQuantifiedPathPrimary
| CONTROL_FLOWpathPrimaryCONTROL_FLOW CONTROL_FLOWgraphPatternQuantifierCONTROL_FLOW    #CONTROL_FLOWpfQuantifiedPathPrimaryCONTROL_FLOW
// Original: | pathPrimary QUESTION_MARK             #pfQuestionedPathPrimary
| CONTROL_FLOWpathPrimaryCONTROL_FLOW CONTROL_FLOWQUESTION_MARKCONTROL_FLOW             #CONTROL_FLOWpfQuestionedPathPrimaryCONTROL_FLOW
;

// Original: pathPrimary
CONTROL_FLOWpathPrimaryCONTROL_FLOW
// Original: : elementPattern                        #ppElementPattern
: CONTROL_FLOWelementPatternCONTROL_FLOW                        #CONTROL_FLOWppElementPatternCONTROL_FLOW
// Original: | parenthesizedPathPatternExpression    #ppParenthesizedPathPatternExpression
| CONTROL_FLOWparenthesizedPathPatternExpressionCONTROL_FLOW    #CONTROL_FLOWppParenthesizedPathPatternExpressionCONTROL_FLOW
// Original: | simplifiedPathPatternExpression       #ppSimplifiedPathPatternExpression
| CONTROL_FLOWsimplifiedPathPatternExpressionCONTROL_FLOW       #CONTROL_FLOWppSimplifiedPathPatternExpressionCONTROL_FLOW
;

// Original: elementPattern
CONTROL_FLOWelementPatternCONTROL_FLOW
// Original: : nodePattern
: CONTROL_FLOWnodePatternCONTROL_FLOW
// Original: | edgePattern
| CONTROL_FLOWedgePatternCONTROL_FLOW
;

// Original: nodePattern
CONTROL_FLOWnodePatternCONTROL_FLOW
// Original: : LEFT_PAREN elementPatternFiller RIGHT_PAREN
// Original: : LEFT_PAREN elementPatternFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: elementPatternFiller
CONTROL_FLOWelementPatternFillerCONTROL_FLOW
: elementVariableDeclaration? isLabelExpression? elementPatternPredicate?
;

// Original: elementVariableDeclaration
CONTROL_FLOWelementVariableDeclarationCONTROL_FLOW
// Original: : TEMP? elementVariable
: CONTROL_FLOWTEMPCONTROL_FLOW? CONTROL_FLOWelementVariableCONTROL_FLOW
;

// Original: isLabelExpression
CONTROL_FLOWisLabelExpressionCONTROL_FLOW
// Original: : isOrColon labelExpression
: CONTROL_FLOWisOrColonCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW
;

// Original: isOrColon
CONTROL_FLOWisOrColonCONTROL_FLOW
// Original: : IS
: CONTROL_FLOWISCONTROL_FLOW
// Original: | COLON
| CONTROL_FLOWCOLONCONTROL_FLOW
;

// Original: elementPatternPredicate
CONTROL_FLOWelementPatternPredicateCONTROL_FLOW
// Original: : elementPatternWhereClause
: CONTROL_FLOWelementPatternWhereClauseCONTROL_FLOW
// Original: | elementPropertySpecification
| CONTROL_FLOWelementPropertySpecificationCONTROL_FLOW
;

// Original: elementPatternWhereClause
CONTROL_FLOWelementPatternWhereClauseCONTROL_FLOW
// Original: : WHERE searchCondition
// Original: : KEYWORD searchCondition
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW
;

// Original: elementPropertySpecification
CONTROL_FLOWelementPropertySpecificationCONTROL_FLOW
// Original: : LEFT_BRACE propertyKeyValuePairList RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWpropertyKeyValuePairListCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: propertyKeyValuePairList
CONTROL_FLOWpropertyKeyValuePairListCONTROL_FLOW
// Original: : propertyKeyValuePair (COMMA propertyKeyValuePair)*
: propertyKeyValuePair (PUNCTUATION_OPERATOR propertyKeyValuePair)*
;

// Original: propertyKeyValuePair
CONTROL_FLOWpropertyKeyValuePairCONTROL_FLOW
// Original: : propertyName COLON valueExpression
: CONTROL_FLOWpropertyNameCONTROL_FLOW CONTROL_FLOWCOLONCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: edgePattern
CONTROL_FLOWedgePatternCONTROL_FLOW
// Original: : fullEdgePattern
: CONTROL_FLOWfullEdgePatternCONTROL_FLOW
// Original: | abbreviatedEdgePattern
| CONTROL_FLOWabbreviatedEdgePatternCONTROL_FLOW
;

// Original: fullEdgePattern
CONTROL_FLOWfullEdgePatternCONTROL_FLOW
// Original: : fullEdgePointingLeft
: CONTROL_FLOWfullEdgePointingLeftCONTROL_FLOW
// Original: | fullEdgeUndirected
| CONTROL_FLOWfullEdgeUndirectedCONTROL_FLOW
// Original: | fullEdgePointingRight
| CONTROL_FLOWfullEdgePointingRightCONTROL_FLOW
// Original: | fullEdgeLeftOrUndirected
| CONTROL_FLOWfullEdgeLeftOrUndirectedCONTROL_FLOW
// Original: | fullEdgeUndirectedOrRight
| CONTROL_FLOWfullEdgeUndirectedOrRightCONTROL_FLOW
// Original: | fullEdgeLeftOrRight
| CONTROL_FLOWfullEdgeLeftOrRightCONTROL_FLOW
// Original: | fullEdgeAnyDirection
| CONTROL_FLOWfullEdgeAnyDirectionCONTROL_FLOW
;

// Original: fullEdgePointingLeft
CONTROL_FLOWfullEdgePointingLeftCONTROL_FLOW
// Original: : LEFT_ARROW_BRACKET elementPatternFiller RIGHT_BRACKET_MINUS
: CONTROL_FLOWLEFT_ARROW_BRACKETCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKET_MINUSCONTROL_FLOW
;

// Original: fullEdgeUndirected
CONTROL_FLOWfullEdgeUndirectedCONTROL_FLOW
// Original: : TILDE_LEFT_BRACKET elementPatternFiller RIGHT_BRACKET_TILDE
// Original: : TILDE_LEFT_BRACKET elementPatternFiller PUNCTUATION_OPERATOR
// Original: : PUNCTUATION_OPERATOR elementPatternFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: fullEdgePointingRight
CONTROL_FLOWfullEdgePointingRightCONTROL_FLOW
// Original: : MINUS_LEFT_BRACKET elementPatternFiller BRACKET_RIGHT_ARROW
// Original: : MINUS_LEFT_BRACKET elementPatternFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWMINUS_LEFT_BRACKETCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: fullEdgeLeftOrUndirected
CONTROL_FLOWfullEdgeLeftOrUndirectedCONTROL_FLOW
// Original: : LEFT_ARROW_TILDE_BRACKET elementPatternFiller RIGHT_BRACKET_TILDE
// Original: : LEFT_ARROW_TILDE_BRACKET elementPatternFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_ARROW_TILDE_BRACKETCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: fullEdgeUndirectedOrRight
CONTROL_FLOWfullEdgeUndirectedOrRightCONTROL_FLOW
// Original: : TILDE_LEFT_BRACKET elementPatternFiller BRACKET_TILDE_RIGHT_ARROW
// Original: : PUNCTUATION_OPERATOR elementPatternFiller BRACKET_TILDE_RIGHT_ARROW
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWBRACKET_TILDE_RIGHT_ARROWCONTROL_FLOW
;

// Original: fullEdgeLeftOrRight
CONTROL_FLOWfullEdgeLeftOrRightCONTROL_FLOW
// Original: : LEFT_ARROW_BRACKET elementPatternFiller BRACKET_RIGHT_ARROW
// Original: : LEFT_ARROW_BRACKET elementPatternFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_ARROW_BRACKETCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: fullEdgeAnyDirection
CONTROL_FLOWfullEdgeAnyDirectionCONTROL_FLOW
// Original: : MINUS_LEFT_BRACKET elementPatternFiller RIGHT_BRACKET_MINUS
: CONTROL_FLOWMINUS_LEFT_BRACKETCONTROL_FLOW CONTROL_FLOWelementPatternFillerCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKET_MINUSCONTROL_FLOW
;

// Original: abbreviatedEdgePattern
CONTROL_FLOWabbreviatedEdgePatternCONTROL_FLOW
// Original: : LEFT_ARROW
: CONTROL_FLOWLEFT_ARROWCONTROL_FLOW
// Original: | TILDE
| CONTROL_FLOWTILDECONTROL_FLOW
// Original: | RIGHT_ARROW
// Original: | PUNCTUATION_OPERATOR
| CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | LEFT_ARROW_TILDE
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | TILDE_RIGHT_ARROW
| CONTROL_FLOWTILDE_RIGHT_ARROWCONTROL_FLOW
// Original: | LEFT_MINUS_RIGHT
| CONTROL_FLOWLEFT_MINUS_RIGHTCONTROL_FLOW
// Original: | MINUS_SIGN
| CONTROL_FLOWMINUS_SIGNCONTROL_FLOW
;

// Original: parenthesizedPathPatternExpression
CONTROL_FLOWparenthesizedPathPatternExpressionCONTROL_FLOW
// Original: : LEFT_PAREN subpathVariableDeclaration? pathModePrefix? pathPatternExpression parenthesizedPathPatternWhereClause? RIGHT_PAREN
// Original: : LEFT_PAREN subpathVariableDeclaration? pathModePrefix? pathPatternExpression parenthesizedPathPatternWhereClause? PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsubpathVariableDeclarationCONTROL_FLOW? CONTROL_FLOWpathModePrefixCONTROL_FLOW? CONTROL_FLOWpathPatternExpressionCONTROL_FLOW CONTROL_FLOWparenthesizedPathPatternWhereClauseCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: subpathVariableDeclaration
CONTROL_FLOWsubpathVariableDeclarationCONTROL_FLOW
// Original: : subpathVariable EQUALS_OPERATOR
: CONTROL_FLOWsubpathVariableCONTROL_FLOW CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW
;

// Original: parenthesizedPathPatternWhereClause
CONTROL_FLOWparenthesizedPathPatternWhereClauseCONTROL_FLOW
// Original: : WHERE searchCondition
// Original: : KEYWORD searchCondition
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW
;

// 16.8 <label expression>

// Original: labelExpression
CONTROL_FLOWlabelExpressionCONTROL_FLOW
// Original: : EXCLAMATION_MARK labelExpression                  #labelExpressionNegation
: CONTROL_FLOWEXCLAMATION_MARKCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW                  #CONTROL_FLOWlabelExpressionNegationCONTROL_FLOW
// Original: | labelExpression AMPERSAND labelExpression         #labelExpressionConjunction
| CONTROL_FLOWlabelExpressionCONTROL_FLOW CONTROL_FLOWAMPERSANDCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW         #CONTROL_FLOWlabelExpressionConjunctionCONTROL_FLOW
// Original: | labelExpression VERTICAL_BAR labelExpression      #labelExpressionDisjunction
| CONTROL_FLOWlabelExpressionCONTROL_FLOW CONTROL_FLOWVERTICAL_BARCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW      #CONTROL_FLOWlabelExpressionDisjunctionCONTROL_FLOW
// Original: | labelName                                         #labelExpressionName
| CONTROL_FLOWlabelNameCONTROL_FLOW                                         #CONTROL_FLOWlabelExpressionNameCONTROL_FLOW
// Original: | PERCENT                                           #labelExpressionWildcard
| CONTROL_FLOWPERCENTCONTROL_FLOW                                           #CONTROL_FLOWlabelExpressionWildcardCONTROL_FLOW
// Original: | LEFT_PAREN labelExpression RIGHT_PAREN            #labelExpressionParenthesized
// Original: | LEFT_PAREN labelExpression PUNCTUATION_OPERATOR            #labelExpressionParenthesized
| CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW            #CONTROL_FLOWlabelExpressionParenthesizedCONTROL_FLOW
;

// 16.9 <path variable reference>

// Original: pathVariableReference
CONTROL_FLOWpathVariableReferenceCONTROL_FLOW
// Original: : bindingVariableReference
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
;

// 16.10 <element variable reference>

// Original: elementVariableReference
CONTROL_FLOWelementVariableReferenceCONTROL_FLOW
// Original: : bindingVariableReference
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
;

// 16.11 <graph pattern quantifier>

// Original: graphPatternQuantifier
CONTROL_FLOWgraphPatternQuantifierCONTROL_FLOW
// Original: : ASTERISK
: CONTROL_FLOWASTERISKCONTROL_FLOW
// Original: | PLUS_SIGN
| CONTROL_FLOWPLUS_SIGNCONTROL_FLOW
// Original: | fixedQuantifier
| CONTROL_FLOWfixedQuantifierCONTROL_FLOW
// Original: | generalQuantifier
| CONTROL_FLOWgeneralQuantifierCONTROL_FLOW
;

// Original: fixedQuantifier
CONTROL_FLOWfixedQuantifierCONTROL_FLOW
// Original: : LEFT_BRACE unsignedInteger RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWunsignedIntegerCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: generalQuantifier
CONTROL_FLOWgeneralQuantifierCONTROL_FLOW
// Original: : LEFT_BRACE lowerBound? COMMA upperBound? RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWlowerBoundCONTROL_FLOW? CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWupperBoundCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: lowerBound
CONTROL_FLOWlowerBoundCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// Original: upperBound
CONTROL_FLOWupperBoundCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// 16.12 <simplified path pattern expression>

// Original: simplifiedPathPatternExpression
CONTROL_FLOWsimplifiedPathPatternExpressionCONTROL_FLOW
// Original: : simplifiedDefaultingLeft
: CONTROL_FLOWsimplifiedDefaultingLeftCONTROL_FLOW
// Original: | simplifiedDefaultingUndirected
| CONTROL_FLOWsimplifiedDefaultingUndirectedCONTROL_FLOW
// Original: | simplifiedDefaultingRight
| CONTROL_FLOWsimplifiedDefaultingRightCONTROL_FLOW
// Original: | simplifiedDefaultingLeftOrUndirected
| CONTROL_FLOWsimplifiedDefaultingLeftOrUndirectedCONTROL_FLOW
// Original: | simplifiedDefaultingUndirectedOrRight
| CONTROL_FLOWsimplifiedDefaultingUndirectedOrRightCONTROL_FLOW
// Original: | simplifiedDefaultingLeftOrRight
| CONTROL_FLOWsimplifiedDefaultingLeftOrRightCONTROL_FLOW
// Original: | simplifiedDefaultingAnyDirection
| CONTROL_FLOWsimplifiedDefaultingAnyDirectionCONTROL_FLOW
;

// Original: simplifiedDefaultingLeft
CONTROL_FLOWsimplifiedDefaultingLeftCONTROL_FLOW
// Original: : LEFT_MINUS_SLASH simplifiedContents SLASH_MINUS
: CONTROL_FLOWLEFT_MINUS_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_MINUSCONTROL_FLOW
;

// Original: simplifiedDefaultingUndirected
CONTROL_FLOWsimplifiedDefaultingUndirectedCONTROL_FLOW
// Original: : TILDE_SLASH simplifiedContents SLASH_TILDE
: CONTROL_FLOWTILDE_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_TILDECONTROL_FLOW
;

// Original: simplifiedDefaultingRight
CONTROL_FLOWsimplifiedDefaultingRightCONTROL_FLOW
// Original: : MINUS_SLASH simplifiedContents SLASH_MINUS_RIGHT
: CONTROL_FLOWMINUS_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_MINUS_RIGHTCONTROL_FLOW
;

// Original: simplifiedDefaultingLeftOrUndirected
CONTROL_FLOWsimplifiedDefaultingLeftOrUndirectedCONTROL_FLOW
// Original: : LEFT_TILDE_SLASH simplifiedContents SLASH_TILDE
: CONTROL_FLOWLEFT_TILDE_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_TILDECONTROL_FLOW
;

// Original: simplifiedDefaultingUndirectedOrRight
CONTROL_FLOWsimplifiedDefaultingUndirectedOrRightCONTROL_FLOW
// Original: : TILDE_SLASH simplifiedContents SLASH_TILDE_RIGHT
: CONTROL_FLOWTILDE_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_TILDE_RIGHTCONTROL_FLOW
;

// Original: simplifiedDefaultingLeftOrRight
CONTROL_FLOWsimplifiedDefaultingLeftOrRightCONTROL_FLOW
// Original: : LEFT_MINUS_SLASH simplifiedContents SLASH_MINUS_RIGHT
: CONTROL_FLOWLEFT_MINUS_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_MINUS_RIGHTCONTROL_FLOW
;

// Original: simplifiedDefaultingAnyDirection
CONTROL_FLOWsimplifiedDefaultingAnyDirectionCONTROL_FLOW
// Original: : MINUS_SLASH simplifiedContents SLASH_MINUS
: CONTROL_FLOWMINUS_SLASHCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWSLASH_MINUSCONTROL_FLOW
;

// Original: simplifiedContents
CONTROL_FLOWsimplifiedContentsCONTROL_FLOW
// Original: : simplifiedTerm
: CONTROL_FLOWsimplifiedTermCONTROL_FLOW
// Original: | simplifiedPathUnion
| CONTROL_FLOWsimplifiedPathUnionCONTROL_FLOW
// Original: | simplifiedMultisetAlternation
| CONTROL_FLOWsimplifiedMultisetAlternationCONTROL_FLOW
;

// Original: simplifiedPathUnion
CONTROL_FLOWsimplifiedPathUnionCONTROL_FLOW
// Original: : simplifiedTerm VERTICAL_BAR simplifiedTerm (VERTICAL_BAR simplifiedTerm)*
: simplifiedTerm PUNCTUATION_OPERATOR simplifiedTerm (PUNCTUATION_OPERATOR simplifiedTerm)*
;

// Original: simplifiedMultisetAlternation
CONTROL_FLOWsimplifiedMultisetAlternationCONTROL_FLOW
: simplifiedTerm MULTISET_ALTERNATION_OPERATOR simplifiedTerm (MULTISET_ALTERNATION_OPERATOR simplifiedTerm)*
;

// Original: simplifiedTerm
CONTROL_FLOWsimplifiedTermCONTROL_FLOW
// Original: : simplifiedFactorLow                        #simplifiedFactorLowLabel
: CONTROL_FLOWsimplifiedFactorLowCONTROL_FLOW                        #CONTROL_FLOWsimplifiedFactorLowLabelCONTROL_FLOW
// Original: | simplifiedTerm simplifiedFactorLow      #simplifiedConcatenationLabel
| CONTROL_FLOWsimplifiedTermCONTROL_FLOW CONTROL_FLOWsimplifiedFactorLowCONTROL_FLOW      #CONTROL_FLOWsimplifiedConcatenationLabelCONTROL_FLOW
;

// Original: simplifiedFactorLow
CONTROL_FLOWsimplifiedFactorLowCONTROL_FLOW
// Original: : simplifiedFactorHigh                                     #simplifiedFactorHighLabel
: CONTROL_FLOWsimplifiedFactorHighCONTROL_FLOW                                     #CONTROL_FLOWsimplifiedFactorHighLabelCONTROL_FLOW
// Original: | simplifiedFactorLow AMPERSAND simplifiedFactorHigh #simplifiedConjunctionLabel
| CONTROL_FLOWsimplifiedFactorLowCONTROL_FLOW CONTROL_FLOWAMPERSANDCONTROL_FLOW CONTROL_FLOWsimplifiedFactorHighCONTROL_FLOW #CONTROL_FLOWsimplifiedConjunctionLabelCONTROL_FLOW
;

// Original: simplifiedFactorHigh
CONTROL_FLOWsimplifiedFactorHighCONTROL_FLOW
// Original: : simplifiedTertiary
: CONTROL_FLOWsimplifiedTertiaryCONTROL_FLOW
// Original: | simplifiedQuantified
| CONTROL_FLOWsimplifiedQuantifiedCONTROL_FLOW
// Original: | simplifiedQuestioned
| CONTROL_FLOWsimplifiedQuestionedCONTROL_FLOW
;

// Original: simplifiedQuantified
CONTROL_FLOWsimplifiedQuantifiedCONTROL_FLOW
// Original: : simplifiedTertiary graphPatternQuantifier
: CONTROL_FLOWsimplifiedTertiaryCONTROL_FLOW CONTROL_FLOWgraphPatternQuantifierCONTROL_FLOW
;

// Original: simplifiedQuestioned
CONTROL_FLOWsimplifiedQuestionedCONTROL_FLOW
// Original: : simplifiedTertiary QUESTION_MARK
: CONTROL_FLOWsimplifiedTertiaryCONTROL_FLOW CONTROL_FLOWQUESTION_MARKCONTROL_FLOW
;

// Original: simplifiedTertiary
CONTROL_FLOWsimplifiedTertiaryCONTROL_FLOW
// Original: : simplifiedDirectionOverride
: CONTROL_FLOWsimplifiedDirectionOverrideCONTROL_FLOW
// Original: | simplifiedSecondary
| CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
;

// Original: simplifiedDirectionOverride
CONTROL_FLOWsimplifiedDirectionOverrideCONTROL_FLOW
// Original: : simplifiedOverrideLeft
: CONTROL_FLOWsimplifiedOverrideLeftCONTROL_FLOW
// Original: | simplifiedOverrideUndirected
| CONTROL_FLOWsimplifiedOverrideUndirectedCONTROL_FLOW
// Original: | simplifiedOverrideRight
| CONTROL_FLOWsimplifiedOverrideRightCONTROL_FLOW
// Original: | simplifiedOverrideLeftOrUndirected
| CONTROL_FLOWsimplifiedOverrideLeftOrUndirectedCONTROL_FLOW
// Original: | simplifiedOverrideUndirectedOrRight
| CONTROL_FLOWsimplifiedOverrideUndirectedOrRightCONTROL_FLOW
// Original: | simplifiedOverrideLeftOrRight
| CONTROL_FLOWsimplifiedOverrideLeftOrRightCONTROL_FLOW
// Original: | simplifiedOverrideAnyDirection
| CONTROL_FLOWsimplifiedOverrideAnyDirectionCONTROL_FLOW
;

// Original: simplifiedOverrideLeft
CONTROL_FLOWsimplifiedOverrideLeftCONTROL_FLOW
// Original: : LEFT_ANGLE_BRACKET simplifiedSecondary
// Original: : PUNCTUATION_OPERATOR simplifiedSecondary
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
;

// Original: simplifiedOverrideUndirected
CONTROL_FLOWsimplifiedOverrideUndirectedCONTROL_FLOW
// Original: : TILDE simplifiedSecondary
: CONTROL_FLOWTILDECONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
;

// Original: simplifiedOverrideRight
CONTROL_FLOWsimplifiedOverrideRightCONTROL_FLOW
// Original: : simplifiedSecondary RIGHT_ANGLE_BRACKET
: CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW
;

// Original: simplifiedOverrideLeftOrUndirected
CONTROL_FLOWsimplifiedOverrideLeftOrUndirectedCONTROL_FLOW
// Original: : LEFT_ARROW_TILDE simplifiedSecondary
// Original: : KEYWORD simplifiedSecondary
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
;

// Original: simplifiedOverrideUndirectedOrRight
CONTROL_FLOWsimplifiedOverrideUndirectedOrRightCONTROL_FLOW
// Original: : TILDE simplifiedSecondary RIGHT_ANGLE_BRACKET
: CONTROL_FLOWTILDECONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW
;

// Original: simplifiedOverrideLeftOrRight
CONTROL_FLOWsimplifiedOverrideLeftOrRightCONTROL_FLOW
// Original: : LEFT_ANGLE_BRACKET simplifiedSecondary RIGHT_ANGLE_BRACKET
// Original: : PUNCTUATION_OPERATOR simplifiedSecondary RIGHT_ANGLE_BRACKET
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW
;

// Original: simplifiedOverrideAnyDirection
CONTROL_FLOWsimplifiedOverrideAnyDirectionCONTROL_FLOW
// Original: : MINUS_SIGN simplifiedSecondary
: CONTROL_FLOWMINUS_SIGNCONTROL_FLOW CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
;

// Original: simplifiedSecondary
CONTROL_FLOWsimplifiedSecondaryCONTROL_FLOW
// Original: : simplifiedPrimary
: CONTROL_FLOWsimplifiedPrimaryCONTROL_FLOW
// Original: | simplifiedNegation
| CONTROL_FLOWsimplifiedNegationCONTROL_FLOW
;

// Original: simplifiedNegation
CONTROL_FLOWsimplifiedNegationCONTROL_FLOW
// Original: : EXCLAMATION_MARK simplifiedPrimary
: CONTROL_FLOWEXCLAMATION_MARKCONTROL_FLOW CONTROL_FLOWsimplifiedPrimaryCONTROL_FLOW
;

// Original: simplifiedPrimary
CONTROL_FLOWsimplifiedPrimaryCONTROL_FLOW
// Original: : labelName
: CONTROL_FLOWlabelNameCONTROL_FLOW
// Original: | LEFT_PAREN simplifiedContents RIGHT_PAREN
// Original: | LEFT_PAREN simplifiedContents PUNCTUATION_OPERATOR
| CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsimplifiedContentsCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 16.13 <where clause>

// Original: whereClause
CONTROL_FLOWwhereClauseCONTROL_FLOW
// Original: : WHERE searchCondition
// Original: : KEYWORD searchCondition
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW
;

// 16.14 <yield clause>

// Original: yieldClause
CONTROL_FLOWyieldClauseCONTROL_FLOW
// Original: : YIELD yieldItemList
// Original: : KEYWORD yieldItemList
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWyieldItemListCONTROL_FLOW
;

// Original: yieldItemList
CONTROL_FLOWyieldItemListCONTROL_FLOW
// Original: : yieldItem (COMMA yieldItem)*
: yieldItem (PUNCTUATION_OPERATOR yieldItem)*
;

// Original: yieldItem
CONTROL_FLOWyieldItemCONTROL_FLOW
: (yieldItemName yieldItemAlias?)
;

// Original: yieldItemName
CONTROL_FLOWyieldItemNameCONTROL_FLOW
// Original: : fieldName
: CONTROL_FLOWfieldNameCONTROL_FLOW
;

// Original: yieldItemAlias
CONTROL_FLOWyieldItemAliasCONTROL_FLOW
// Original: : AS bindingVariable
// Original: : KEYWORD bindingVariable
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWbindingVariableCONTROL_FLOW
;

// 16.15 <group by clasue>

// Original: groupByClause
CONTROL_FLOWgroupByClauseCONTROL_FLOW
// Original: : GROUP BY groupingElementList
// Original: : KEYWORD BY groupingElementList
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWBYCONTROL_FLOW CONTROL_FLOWgroupingElementListCONTROL_FLOW
;

// Original: groupingElementList
CONTROL_FLOWgroupingElementListCONTROL_FLOW
// Original: : groupingElement (COMMA groupingElement)*
: groupingElement (PUNCTUATION_OPERATOR groupingElement)*
// Original: | emptyGroupingSet
| CONTROL_FLOWemptyGroupingSetCONTROL_FLOW
;

// Original: groupingElement
CONTROL_FLOWgroupingElementCONTROL_FLOW
// Original: : bindingVariableReference
: CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
;

// Original: emptyGroupingSet
CONTROL_FLOWemptyGroupingSetCONTROL_FLOW
// Original: : LEFT_PAREN RIGHT_PAREN
// Original: : LEFT_PAREN PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 16.16 <order by clasue>

// Original: orderByClause
CONTROL_FLOWorderByClauseCONTROL_FLOW
// Original: : ORDER BY sortSpecificationList
: CONTROL_FLOWORDERCONTROL_FLOW CONTROL_FLOWBYCONTROL_FLOW CONTROL_FLOWsortSpecificationListCONTROL_FLOW
;

// 16.17 <sort specification list>

// Original: sortSpecificationList
CONTROL_FLOWsortSpecificationListCONTROL_FLOW
// Original: : sortSpecification (COMMA sortSpecification)*
: sortSpecification (PUNCTUATION_OPERATOR sortSpecification)*
;

// Original: sortSpecification
CONTROL_FLOWsortSpecificationCONTROL_FLOW
: sortKey orderingSpecification? nullOrdering?
;

// Original: sortKey
CONTROL_FLOWsortKeyCONTROL_FLOW
// Original: : aggregatingValueExpression
: CONTROL_FLOWaggregatingValueExpressionCONTROL_FLOW
;

// Original: orderingSpecification
CONTROL_FLOWorderingSpecificationCONTROL_FLOW
// Original: : ASC
// Original: : KEYWORD
: CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | ASCENDING
| CONTROL_FLOWASCENDINGCONTROL_FLOW
// Original: | DESC
| CONTROL_FLOWDESCCONTROL_FLOW
// Original: | DESCENDING
| CONTROL_FLOWDESCENDINGCONTROL_FLOW
;

// Original: nullOrdering
CONTROL_FLOWnullOrderingCONTROL_FLOW
// Original: : NULLS FIRST
: CONTROL_FLOWNULLSCONTROL_FLOW CONTROL_FLOWFIRSTCONTROL_FLOW
// Original: | NULLS LAST
| CONTROL_FLOWNULLSCONTROL_FLOW CONTROL_FLOWLASTCONTROL_FLOW
;

// 16.18 <limit clause>

// Original: limitClause
CONTROL_FLOWlimitClauseCONTROL_FLOW
// Original: : LIMIT nonNegativeIntegerSpecification
: CONTROL_FLOWLIMITCONTROL_FLOW CONTROL_FLOWnonNegativeIntegerSpecificationCONTROL_FLOW
;

// 16.19 <offset clause>

// Original: offsetClause
CONTROL_FLOWoffsetClauseCONTROL_FLOW
// Original: : offsetSynonym nonNegativeIntegerSpecification
: CONTROL_FLOWoffsetSynonymCONTROL_FLOW CONTROL_FLOWnonNegativeIntegerSpecificationCONTROL_FLOW
;

// Original: offsetSynonym
CONTROL_FLOWoffsetSynonymCONTROL_FLOW
// Original: : OFFSET
: CONTROL_FLOWOFFSETCONTROL_FLOW
// Original: | SKIP_RESERVED_WORD
| CONTROL_FLOWSKIP_RESERVED_WORDCONTROL_FLOW
;

// 17.1 <schema reference> and <catalog schema parent name>

// Original: schemaReference
CONTROL_FLOWschemaReferenceCONTROL_FLOW
// Original: : absoluteCatalogSchemaReference
: CONTROL_FLOWabsoluteCatalogSchemaReferenceCONTROL_FLOW
// Original: | relativeCatalogSchemaReference
| CONTROL_FLOWrelativeCatalogSchemaReferenceCONTROL_FLOW
// Original: | referenceParameterSpecification
| CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
;

// Original: absoluteCatalogSchemaReference
CONTROL_FLOWabsoluteCatalogSchemaReferenceCONTROL_FLOW
// Original: : SOLIDUS
: CONTROL_FLOWSOLIDUSCONTROL_FLOW
// Original: | absoluteDirectoryPath schemaName
| CONTROL_FLOWabsoluteDirectoryPathCONTROL_FLOW CONTROL_FLOWschemaNameCONTROL_FLOW
;

// Original: catalogSchemaParentAndName
CONTROL_FLOWcatalogSchemaParentAndNameCONTROL_FLOW
// Original: : absoluteDirectoryPath schemaName
: CONTROL_FLOWabsoluteDirectoryPathCONTROL_FLOW CONTROL_FLOWschemaNameCONTROL_FLOW
;

// Original: relativeCatalogSchemaReference
CONTROL_FLOWrelativeCatalogSchemaReferenceCONTROL_FLOW
// Original: : predefinedSchemaReference
: CONTROL_FLOWpredefinedSchemaReferenceCONTROL_FLOW
// Original: | relativeDirectoryPath schemaName
| CONTROL_FLOWrelativeDirectoryPathCONTROL_FLOW CONTROL_FLOWschemaNameCONTROL_FLOW
;

// Original: predefinedSchemaReference
CONTROL_FLOWpredefinedSchemaReferenceCONTROL_FLOW
// Original: : HOME_SCHEMA
: CONTROL_FLOWHOME_SCHEMACONTROL_FLOW
// Original: | CURRENT_SCHEMA
| CONTROL_FLOWCURRENT_SCHEMACONTROL_FLOW
// Original: | PERIOD
| CONTROL_FLOWPERIODCONTROL_FLOW
;

// Original: absoluteDirectoryPath
CONTROL_FLOWabsoluteDirectoryPathCONTROL_FLOW
// Original: : SOLIDUS simpleDirectoryPath?
: PUNCTUATION_OPERATOR simpleDirectoryPath?
;

// Original: relativeDirectoryPath
CONTROL_FLOWrelativeDirectoryPathCONTROL_FLOW
// Original: : DOUBLE_PERIOD (SOLIDUS DOUBLE_PERIOD)* SOLIDUS simpleDirectoryPath?
// Original: : PUNCTUATION_OPERATOR (SOLIDUS PUNCTUATION_OPERATOR)* SOLIDUS simpleDirectoryPath?
: PUNCTUATION_OPERATOR (PUNCTUATION_OPERATOR PUNCTUATION_OPERATOR)* PUNCTUATION_OPERATOR simpleDirectoryPath?
;

// Original: simpleDirectoryPath
CONTROL_FLOWsimpleDirectoryPathCONTROL_FLOW
// Original: : (directoryName SOLIDUS)+
: (directoryName PUNCTUATION_OPERATOR)+
;

// 17.2 <graph reference> and <catalog graph parent and name>

// Original: graphReference
CONTROL_FLOWgraphReferenceCONTROL_FLOW
// Original: : catalogObjectParentReference graphName
: CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW CONTROL_FLOWgraphNameCONTROL_FLOW
// Original: | delimitedGraphName
| CONTROL_FLOWdelimitedGraphNameCONTROL_FLOW
// Original: | homeGraph
| CONTROL_FLOWhomeGraphCONTROL_FLOW
// Original: | referenceParameterSpecification
| CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
;

// Original: catalogGraphParentAndName
CONTROL_FLOWcatalogGraphParentAndNameCONTROL_FLOW
// Original: : catalogObjectParentReference? graphName
: CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW? CONTROL_FLOWgraphNameCONTROL_FLOW
;

// Original: homeGraph
CONTROL_FLOWhomeGraphCONTROL_FLOW
// Original: : HOME_PROPERTY_GRAPH
: CONTROL_FLOWHOME_PROPERTY_GRAPHCONTROL_FLOW
// Original: | HOME_GRAPH
| CONTROL_FLOWHOME_GRAPHCONTROL_FLOW
;

// 17.3 <graph type reference> and <catalog graph type parent and name>

// Original: graphTypeReference
CONTROL_FLOWgraphTypeReferenceCONTROL_FLOW
// Original: : catalogGraphTypeParentAndName
: CONTROL_FLOWcatalogGraphTypeParentAndNameCONTROL_FLOW
// Original: | referenceParameterSpecification
| CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
;

// Original: catalogGraphTypeParentAndName
CONTROL_FLOWcatalogGraphTypeParentAndNameCONTROL_FLOW
// Original: : catalogObjectParentReference? graphTypeName
: CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW? CONTROL_FLOWgraphTypeNameCONTROL_FLOW
;

// 17.4 <binding table reference> and <catalog binding table parent name>

// Original: bindingTableReference
CONTROL_FLOWbindingTableReferenceCONTROL_FLOW
// Original: : catalogObjectParentReference bindingTableName
: CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW CONTROL_FLOWbindingTableNameCONTROL_FLOW
// Original: | delimitedBindingTableName
| CONTROL_FLOWdelimitedBindingTableNameCONTROL_FLOW
// Original: | referenceParameterSpecification
| CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
;

// 17.5 <procedure reference> and <catalog procedure parent and name>

// Original: procedureReference
CONTROL_FLOWprocedureReferenceCONTROL_FLOW
// Original: : catalogProcedureParentAndName
: CONTROL_FLOWcatalogProcedureParentAndNameCONTROL_FLOW
// Original: | referenceParameterSpecification
| CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
;

// Original: catalogProcedureParentAndName
CONTROL_FLOWcatalogProcedureParentAndNameCONTROL_FLOW
// Original: : catalogObjectParentReference? procedureName
: CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW? CONTROL_FLOWprocedureNameCONTROL_FLOW
;

// 17.6 <catalog object parent reference>

// Original: catalogObjectParentReference
CONTROL_FLOWcatalogObjectParentReferenceCONTROL_FLOW
// Original: : schemaReference SOLIDUS? (objectName PERIOD)*
// Original: : schemaReference PUNCTUATION_OPERATOR? (objectName PERIOD)*
: schemaReference PUNCTUATION_OPERATOR? (objectName PUNCTUATION_OPERATOR)*
// Original: |  (objectName PERIOD)+
|  (objectName PUNCTUATION_OPERATOR)+
;

// 17.7 <reference parameter specification>

// Original: referenceParameterSpecification
CONTROL_FLOWreferenceParameterSpecificationCONTROL_FLOW
// Original: : SUBSTITUTED_PARAMETER_REFERENCE
: CONTROL_FLOWSUBSTITUTED_PARAMETER_REFERENCECONTROL_FLOW
;

// 18.1 <nested graph type specification>

// Original: nestedGraphTypeSpecification
CONTROL_FLOWnestedGraphTypeSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE graphTypeSpecificationBody RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWgraphTypeSpecificationBodyCONTROL_FLOW CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: graphTypeSpecificationBody
CONTROL_FLOWgraphTypeSpecificationBodyCONTROL_FLOW
// Original: : elementTypeList
: CONTROL_FLOWelementTypeListCONTROL_FLOW
;

// Original: elementTypeList
CONTROL_FLOWelementTypeListCONTROL_FLOW
// Original: : elementTypeSpecification (COMMA elementTypeSpecification)*
: elementTypeSpecification (PUNCTUATION_OPERATOR elementTypeSpecification)*
;

// Original: elementTypeSpecification
CONTROL_FLOWelementTypeSpecificationCONTROL_FLOW
// Original: : nodeTypeSpecification
: CONTROL_FLOWnodeTypeSpecificationCONTROL_FLOW
// Original: | edgeTypeSpecification
| CONTROL_FLOWedgeTypeSpecificationCONTROL_FLOW
;

// 18.2 <node type specification>

// Original: nodeTypeSpecification
CONTROL_FLOWnodeTypeSpecificationCONTROL_FLOW
// Original: : nodeTypePattern
: CONTROL_FLOWnodeTypePatternCONTROL_FLOW
// Original: | nodeTypePhrase
| CONTROL_FLOWnodeTypePhraseCONTROL_FLOW
;

// Original: nodeTypePattern
CONTROL_FLOWnodeTypePatternCONTROL_FLOW
// Original: : (nodeSynonym TYPE? nodeTypeName)? LEFT_PAREN localNodeTypeAlias? nodeTypeFiller? RIGHT_PAREN
// Original: : (nodeSynonym TYPE? nodeTypeName)? LEFT_PAREN localNodeTypeAlias? nodeTypeFiller? PUNCTUATION_OPERATOR
: (CONTROL_FLOWnodeSynonymCONTROL_FLOW CONTROL_FLOWTYPECONTROL_FLOW? CONTROL_FLOWnodeTypeNameCONTROL_FLOW)? CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWlocalNodeTypeAliasCONTROL_FLOW? CONTROL_FLOWnodeTypeFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: nodeTypePhrase
CONTROL_FLOWnodeTypePhraseCONTROL_FLOW
// Original: : nodeSynonym TYPE? nodeTypePhraseFiller (AS localNodeTypeAlias)?
: nodeSynonym TYPE? nodeTypePhraseFiller (KEYWORD localNodeTypeAlias)?
;

// Original: nodeTypePhraseFiller
CONTROL_FLOWnodeTypePhraseFillerCONTROL_FLOW
: nodeTypeName nodeTypeFiller?
// Original: | nodeTypeFiller
| CONTROL_FLOWnodeTypeFillerCONTROL_FLOW
;

// Original: nodeTypeFiller
CONTROL_FLOWnodeTypeFillerCONTROL_FLOW
: nodeTypeKeyLabelSet nodeTypeImpliedContent?
// Original: | nodeTypeImpliedContent
| CONTROL_FLOWnodeTypeImpliedContentCONTROL_FLOW
;

// Original: localNodeTypeAlias
CONTROL_FLOWlocalNodeTypeAliasCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// Original: nodeTypeImpliedContent
CONTROL_FLOWnodeTypeImpliedContentCONTROL_FLOW
// Original: : nodeTypeLabelSet
: CONTROL_FLOWnodeTypeLabelSetCONTROL_FLOW
// Original: | nodeTypePropertyTypes
| CONTROL_FLOWnodeTypePropertyTypesCONTROL_FLOW
// Original: | nodeTypeLabelSet nodeTypePropertyTypes
| CONTROL_FLOWnodeTypeLabelSetCONTROL_FLOW CONTROL_FLOWnodeTypePropertyTypesCONTROL_FLOW
;

// Original: nodeTypeKeyLabelSet
CONTROL_FLOWnodeTypeKeyLabelSetCONTROL_FLOW
// Original: : labelSetPhrase? IMPLIES
: CONTROL_FLOWlabelSetPhraseCONTROL_FLOW? CONTROL_FLOWIMPLIESCONTROL_FLOW
;

// Original: nodeTypeLabelSet
CONTROL_FLOWnodeTypeLabelSetCONTROL_FLOW
// Original: : labelSetPhrase
: CONTROL_FLOWlabelSetPhraseCONTROL_FLOW
;

// Original: nodeTypePropertyTypes
CONTROL_FLOWnodeTypePropertyTypesCONTROL_FLOW
// Original: : propertyTypesSpecification
: CONTROL_FLOWpropertyTypesSpecificationCONTROL_FLOW
;

// 18.3 <edge type specification>

// Original: edgeTypeSpecification
CONTROL_FLOWedgeTypeSpecificationCONTROL_FLOW
// Original: : edgeTypePattern
: CONTROL_FLOWedgeTypePatternCONTROL_FLOW
// Original: | edgeTypePhrase
| CONTROL_FLOWedgeTypePhraseCONTROL_FLOW
;

// Original: edgeTypePattern
CONTROL_FLOWedgeTypePatternCONTROL_FLOW
: (edgeKind? edgeSynonym TYPE? edgeTypeName)? (edgeTypePatternDirected | edgeTypePatternUndirected)
;

// Original: edgeTypePhrase
CONTROL_FLOWedgeTypePhraseCONTROL_FLOW
// Original: : edgeKind edgeSynonym TYPE? edgeTypePhraseFiller endpointPairPhrase
: CONTROL_FLOWedgeKindCONTROL_FLOW CONTROL_FLOWedgeSynonymCONTROL_FLOW CONTROL_FLOWTYPECONTROL_FLOW? CONTROL_FLOWedgeTypePhraseFillerCONTROL_FLOW CONTROL_FLOWendpointPairPhraseCONTROL_FLOW
;

// Original: edgeTypePhraseFiller
CONTROL_FLOWedgeTypePhraseFillerCONTROL_FLOW
: edgeTypeName edgeTypeFiller?
// Original: | edgeTypeFiller
| CONTROL_FLOWedgeTypeFillerCONTROL_FLOW
;

// Original: edgeTypeFiller
CONTROL_FLOWedgeTypeFillerCONTROL_FLOW
: edgeTypeKeyLabelSet edgeTypeImpliedContent?
// Original: | edgeTypeImpliedContent
| CONTROL_FLOWedgeTypeImpliedContentCONTROL_FLOW
;

// Original: edgeTypeImpliedContent
CONTROL_FLOWedgeTypeImpliedContentCONTROL_FLOW
// Original: : edgeTypeLabelSet
: CONTROL_FLOWedgeTypeLabelSetCONTROL_FLOW
// Original: | edgeTypePropertyTypes
| CONTROL_FLOWedgeTypePropertyTypesCONTROL_FLOW
// Original: | edgeTypeLabelSet edgeTypePropertyTypes
| CONTROL_FLOWedgeTypeLabelSetCONTROL_FLOW CONTROL_FLOWedgeTypePropertyTypesCONTROL_FLOW
;

// Original: edgeTypeKeyLabelSet
CONTROL_FLOWedgeTypeKeyLabelSetCONTROL_FLOW
// Original: : labelSetPhrase? IMPLIES
: CONTROL_FLOWlabelSetPhraseCONTROL_FLOW? CONTROL_FLOWIMPLIESCONTROL_FLOW
;

// Original: edgeTypeLabelSet
CONTROL_FLOWedgeTypeLabelSetCONTROL_FLOW
// Original: : labelSetPhrase
: CONTROL_FLOWlabelSetPhraseCONTROL_FLOW
;

// Original: edgeTypePropertyTypes
CONTROL_FLOWedgeTypePropertyTypesCONTROL_FLOW
// Original: : propertyTypesSpecification
: CONTROL_FLOWpropertyTypesSpecificationCONTROL_FLOW
;

// Original: edgeTypePatternDirected
CONTROL_FLOWedgeTypePatternDirectedCONTROL_FLOW
// Original: : edgeTypePatternPointingRight
: CONTROL_FLOWedgeTypePatternPointingRightCONTROL_FLOW
// Original: | edgeTypePatternPointingLeft
| CONTROL_FLOWedgeTypePatternPointingLeftCONTROL_FLOW
;

// Original: edgeTypePatternPointingRight
CONTROL_FLOWedgeTypePatternPointingRightCONTROL_FLOW
// Original: : sourceNodeTypeReference arcTypePointingRight destinationNodeTypeReference
: CONTROL_FLOWsourceNodeTypeReferenceCONTROL_FLOW CONTROL_FLOWarcTypePointingRightCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeReferenceCONTROL_FLOW
;

// Original: edgeTypePatternPointingLeft
CONTROL_FLOWedgeTypePatternPointingLeftCONTROL_FLOW
// Original: : destinationNodeTypeReference arcTypePointingLeft sourceNodeTypeReference
: CONTROL_FLOWdestinationNodeTypeReferenceCONTROL_FLOW CONTROL_FLOWarcTypePointingLeftCONTROL_FLOW CONTROL_FLOWsourceNodeTypeReferenceCONTROL_FLOW
;

// Original: edgeTypePatternUndirected
CONTROL_FLOWedgeTypePatternUndirectedCONTROL_FLOW
// Original: : sourceNodeTypeReference arcTypeUndirected destinationNodeTypeReference
: CONTROL_FLOWsourceNodeTypeReferenceCONTROL_FLOW CONTROL_FLOWarcTypeUndirectedCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeReferenceCONTROL_FLOW
;

// Original: arcTypePointingRight
CONTROL_FLOWarcTypePointingRightCONTROL_FLOW
// Original: : MINUS_LEFT_BRACKET edgeTypeFiller BRACKET_RIGHT_ARROW
// Original: : MINUS_LEFT_BRACKET edgeTypeFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWMINUS_LEFT_BRACKETCONTROL_FLOW CONTROL_FLOWedgeTypeFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: arcTypePointingLeft
CONTROL_FLOWarcTypePointingLeftCONTROL_FLOW
// Original: : LEFT_ARROW_BRACKET edgeTypeFiller RIGHT_BRACKET_MINUS
: CONTROL_FLOWLEFT_ARROW_BRACKETCONTROL_FLOW CONTROL_FLOWedgeTypeFillerCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKET_MINUSCONTROL_FLOW
;

// Original: arcTypeUndirected
CONTROL_FLOWarcTypeUndirectedCONTROL_FLOW
// Original: : TILDE_LEFT_BRACKET edgeTypeFiller RIGHT_BRACKET_TILDE
// Original: : TILDE_LEFT_BRACKET edgeTypeFiller PUNCTUATION_OPERATOR
// Original: : PUNCTUATION_OPERATOR edgeTypeFiller PUNCTUATION_OPERATOR
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWedgeTypeFillerCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: sourceNodeTypeReference
CONTROL_FLOWsourceNodeTypeReferenceCONTROL_FLOW
// Original: : LEFT_PAREN sourceNodeTypeAlias RIGHT_PAREN
// Original: : LEFT_PAREN sourceNodeTypeAlias PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsourceNodeTypeAliasCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | LEFT_PAREN nodeTypeFiller? RIGHT_PAREN
// Original: | LEFT_PAREN nodeTypeFiller? PUNCTUATION_OPERATOR
| CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnodeTypeFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: destinationNodeTypeReference
CONTROL_FLOWdestinationNodeTypeReferenceCONTROL_FLOW
// Original: : LEFT_PAREN destinationNodeTypeAlias RIGHT_PAREN
// Original: : LEFT_PAREN destinationNodeTypeAlias PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeAliasCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | LEFT_PAREN nodeTypeFiller? RIGHT_PAREN
// Original: | LEFT_PAREN nodeTypeFiller? PUNCTUATION_OPERATOR
| CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnodeTypeFillerCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: edgeKind
CONTROL_FLOWedgeKindCONTROL_FLOW
// Original: : DIRECTED
: CONTROL_FLOWDIRECTEDCONTROL_FLOW
// Original: | UNDIRECTED
| CONTROL_FLOWUNDIRECTEDCONTROL_FLOW
;

// Original: endpointPairPhrase
CONTROL_FLOWendpointPairPhraseCONTROL_FLOW
// Original: : CONNECTING endpointPair
: CONTROL_FLOWCONNECTINGCONTROL_FLOW CONTROL_FLOWendpointPairCONTROL_FLOW
;

// Original: endpointPair
CONTROL_FLOWendpointPairCONTROL_FLOW
// Original: : endpointPairDirected
: CONTROL_FLOWendpointPairDirectedCONTROL_FLOW
// Original: | endpointPairUndirected
| CONTROL_FLOWendpointPairUndirectedCONTROL_FLOW
;

// Original: endpointPairDirected
CONTROL_FLOWendpointPairDirectedCONTROL_FLOW
// Original: : endpointPairPointingRight
: CONTROL_FLOWendpointPairPointingRightCONTROL_FLOW
// Original: | endpointPairPointingLeft
| CONTROL_FLOWendpointPairPointingLeftCONTROL_FLOW
;

// Original: endpointPairPointingRight
CONTROL_FLOWendpointPairPointingRightCONTROL_FLOW
// Original: : LEFT_PAREN sourceNodeTypeAlias connectorPointingRight destinationNodeTypeAlias RIGHT_PAREN
// Original: : LEFT_PAREN sourceNodeTypeAlias connectorPointingRight destinationNodeTypeAlias PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsourceNodeTypeAliasCONTROL_FLOW CONTROL_FLOWconnectorPointingRightCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeAliasCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: endpointPairPointingLeft
CONTROL_FLOWendpointPairPointingLeftCONTROL_FLOW
// Original: : LEFT_PAREN destinationNodeTypeAlias LEFT_ARROW sourceNodeTypeAlias RIGHT_PAREN
// Original: : LEFT_PAREN destinationNodeTypeAlias LEFT_ARROW sourceNodeTypeAlias PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeAliasCONTROL_FLOW CONTROL_FLOWLEFT_ARROWCONTROL_FLOW CONTROL_FLOWsourceNodeTypeAliasCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: endpointPairUndirected
CONTROL_FLOWendpointPairUndirectedCONTROL_FLOW
// Original: : LEFT_PAREN sourceNodeTypeAlias connectorUndirected destinationNodeTypeAlias RIGHT_PAREN
// Original: : LEFT_PAREN sourceNodeTypeAlias connectorUndirected destinationNodeTypeAlias PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsourceNodeTypeAliasCONTROL_FLOW CONTROL_FLOWconnectorUndirectedCONTROL_FLOW CONTROL_FLOWdestinationNodeTypeAliasCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: connectorPointingRight
CONTROL_FLOWconnectorPointingRightCONTROL_FLOW
// Original: : TO
// Original: : KEYWORD
: CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | RIGHT_ARROW
// Original: | PUNCTUATION_OPERATOR
| CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: connectorUndirected
CONTROL_FLOWconnectorUndirectedCONTROL_FLOW
// Original: : TO
// Original: : KEYWORD
: CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | TILDE
| CONTROL_FLOWTILDECONTROL_FLOW
;

// Original: sourceNodeTypeAlias
CONTROL_FLOWsourceNodeTypeAliasCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// Original: destinationNodeTypeAlias
CONTROL_FLOWdestinationNodeTypeAliasCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// 18.4 <label set phrase> and <label set specification>

// Original: labelSetPhrase
CONTROL_FLOWlabelSetPhraseCONTROL_FLOW
// Original: : LABEL labelName
: CONTROL_FLOWLABELCONTROL_FLOW CONTROL_FLOWlabelNameCONTROL_FLOW
// Original: | LABELS labelSetSpecification
| CONTROL_FLOWLABELSCONTROL_FLOW CONTROL_FLOWlabelSetSpecificationCONTROL_FLOW
// Original: | isOrColon labelSetSpecification
| CONTROL_FLOWisOrColonCONTROL_FLOW CONTROL_FLOWlabelSetSpecificationCONTROL_FLOW
;

// Original: labelSetSpecification
CONTROL_FLOWlabelSetSpecificationCONTROL_FLOW
// Original: : labelName (AMPERSAND labelName)*
: labelName (PUNCTUATION_OPERATOR labelName)*
;

// 18.5 <property types specification>

// Original: propertyTypesSpecification
CONTROL_FLOWpropertyTypesSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE propertyTypeList? RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWpropertyTypeListCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: propertyTypeList
CONTROL_FLOWpropertyTypeListCONTROL_FLOW
// Original: : propertyType (COMMA propertyType)*
: propertyType (PUNCTUATION_OPERATOR propertyType)*
;

// 18.6 <property type>

// Original: propertyType
CONTROL_FLOWpropertyTypeCONTROL_FLOW
// Original: : propertyName typed? propertyValueType
: CONTROL_FLOWpropertyNameCONTROL_FLOW CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWpropertyValueTypeCONTROL_FLOW
;

// 18.7 <property value type>

// Original: propertyValueType
CONTROL_FLOWpropertyValueTypeCONTROL_FLOW
// Original: : valueType
: CONTROL_FLOWvalueTypeCONTROL_FLOW
;

// 18.8 <binding table type>

// Original: bindingTableType
CONTROL_FLOWbindingTableTypeCONTROL_FLOW
// Original: : BINDING? TABLE fieldTypesSpecification
// Original: : KEYWORD? TABLE fieldTypesSpecification
: CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWTABLECONTROL_FLOW CONTROL_FLOWfieldTypesSpecificationCONTROL_FLOW
;

// 18.9 <value type>

// Original: valueType
CONTROL_FLOWvalueTypeCONTROL_FLOW
// Original: : predefinedType                                                                                                                              #predefinedTypeLabel
: CONTROL_FLOWpredefinedTypeCONTROL_FLOW                                                                                                                              #CONTROL_FLOWpredefinedTypeLabelCONTROL_FLOW
// <constructed value type>
// Original: | pathValueType                                                                                                                               #pathValueTypeLabel
| CONTROL_FLOWpathValueTypeCONTROL_FLOW                                                                                                                               #CONTROL_FLOWpathValueTypeLabelCONTROL_FLOW
// Original: | listValueTypeName LEFT_ANGLE_BRACKET valueType RIGHT_ANGLE_BRACKET (LEFT_BRACKET maxLength RIGHT_BRACKET)? notNull?     #listValueTypeAlt1
// Original: | listValueTypeName PUNCTUATION_OPERATOR valueType RIGHT_ANGLE_BRACKET (LEFT_BRACKET maxLength RIGHT_BRACKET)? notNull?     #listValueTypeAlt1
// Original: | listValueTypeName PUNCTUATION_OPERATOR valueType RIGHT_ANGLE_BRACKET (PUNCTUATION_OPERATOR maxLength RIGHT_BRACKET)? notNull?     #listValueTypeAlt1
| CONTROL_FLOWlistValueTypeNameCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWvalueTypeCONTROL_FLOW CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW (CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWmaxLengthCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKETCONTROL_FLOW)? CONTROL_FLOWnotNullCONTROL_FLOW?     #CONTROL_FLOWlistValueTypeAlt1CONTROL_FLOW
// Original: | valueType listValueTypeName (LEFT_BRACKET maxLength RIGHT_BRACKET)? notNull?                                                    #listValueTypeAlt2
// Original: | valueType listValueTypeName (PUNCTUATION_OPERATOR maxLength RIGHT_BRACKET)? notNull?                                                    #listValueTypeAlt2
| CONTROL_FLOWvalueTypeCONTROL_FLOW CONTROL_FLOWlistValueTypeNameCONTROL_FLOW (CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWmaxLengthCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKETCONTROL_FLOW)? CONTROL_FLOWnotNullCONTROL_FLOW?                                                    #CONTROL_FLOWlistValueTypeAlt2CONTROL_FLOW
// Original: | listValueTypeName (LEFT_BRACKET maxLength RIGHT_BRACKET)? notNull?                                                                #listValueTypeAlt3
// Original: | listValueTypeName (PUNCTUATION_OPERATOR maxLength RIGHT_BRACKET)? notNull?                                                                #listValueTypeAlt3
| CONTROL_FLOWlistValueTypeNameCONTROL_FLOW (CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWmaxLengthCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKETCONTROL_FLOW)? CONTROL_FLOWnotNullCONTROL_FLOW?                                                                #CONTROL_FLOWlistValueTypeAlt3CONTROL_FLOW
// Original: | recordType                                                                                                                                   #recordTypeLabel
| CONTROL_FLOWrecordTypeCONTROL_FLOW                                                                                                                                   #CONTROL_FLOWrecordTypeLabelCONTROL_FLOW
// <dynamic union type>
// Original: | ANY VALUE? notNull?                                                                                                                        #openDynamicUnionTypeLabel
| CONTROL_FLOWANYCONTROL_FLOW CONTROL_FLOWVALUECONTROL_FLOW? CONTROL_FLOWnotNullCONTROL_FLOW?                                                                                                                        #CONTROL_FLOWopenDynamicUnionTypeLabelCONTROL_FLOW
// Original: | ANY? PROPERTY VALUE notNull?                                                                                                             #dynamicPropertyValueTypeLabel
| CONTROL_FLOWANYCONTROL_FLOW? CONTROL_FLOWPROPERTYCONTROL_FLOW CONTROL_FLOWVALUECONTROL_FLOW CONTROL_FLOWnotNullCONTROL_FLOW?                                                                                                             #CONTROL_FLOWdynamicPropertyValueTypeLabelCONTROL_FLOW
// <closed dynamic union type>
// Original: | ANY VALUE? LEFT_ANGLE_BRACKET valueType (VERTICAL_BAR valueType)* RIGHT_ANGLE_BRACKET                                         #closedDynamicUnionTypeAtl1
// Original: | ANY VALUE? PUNCTUATION_OPERATOR valueType (VERTICAL_BAR valueType)* RIGHT_ANGLE_BRACKET                                         #closedDynamicUnionTypeAtl1
| CONTROL_FLOWANYCONTROL_FLOW CONTROL_FLOWVALUECONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWvalueTypeCONTROL_FLOW (CONTROL_FLOWVERTICAL_BARCONTROL_FLOW CONTROL_FLOWvalueTypeCONTROL_FLOW)* CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW                                         #CONTROL_FLOWclosedDynamicUnionTypeAtl1CONTROL_FLOW
// Original: | valueType VERTICAL_BAR valueType                                                                                                        #closedDynamicUnionTypeAtl2
| CONTROL_FLOWvalueTypeCONTROL_FLOW CONTROL_FLOWVERTICAL_BARCONTROL_FLOW CONTROL_FLOWvalueTypeCONTROL_FLOW                                                                                                        #CONTROL_FLOWclosedDynamicUnionTypeAtl2CONTROL_FLOW
;

// Original: typed
CONTROL_FLOWtypedCONTROL_FLOW
// Original: : DOUBLE_COLON
: CONTROL_FLOWDOUBLE_COLONCONTROL_FLOW
// Original: | TYPED
| CONTROL_FLOWTYPEDCONTROL_FLOW
;

// Original: predefinedType
CONTROL_FLOWpredefinedTypeCONTROL_FLOW
// Original: : booleanType
: CONTROL_FLOWbooleanTypeCONTROL_FLOW
// Original: | characterStringType
| CONTROL_FLOWcharacterStringTypeCONTROL_FLOW
// Original: | byteStringType
| CONTROL_FLOWbyteStringTypeCONTROL_FLOW
// Original: | numericType
| CONTROL_FLOWnumericTypeCONTROL_FLOW
// Original: | temporalType
| CONTROL_FLOWtemporalTypeCONTROL_FLOW
// Original: | referenceValueType
| CONTROL_FLOWreferenceValueTypeCONTROL_FLOW
// Original: | immaterialValueType
| CONTROL_FLOWimmaterialValueTypeCONTROL_FLOW
;

// Original: booleanType
CONTROL_FLOWbooleanTypeCONTROL_FLOW
// Original: : (BOOL | BOOLEAN) notNull?
// Original: : (BOOL | DATA_TYPE) notNull?
: (DATA_TYPE | DATA_TYPE) notNull?
;

// Original: characterStringType
CONTROL_FLOWcharacterStringTypeCONTROL_FLOW
// Original: : STRING (LEFT_PAREN (minLength COMMA)? maxLength RIGHT_PAREN)? notNull?
// Original: : STRING (LEFT_PAREN (minLength COMMA)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: : DATA_TYPE (LEFT_PAREN (minLength COMMA)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: : DATA_TYPE (PUNCTUATION_OPERATOR (minLength COMMA)? maxLength PUNCTUATION_OPERATOR)? notNull?
: DATA_TYPE (PUNCTUATION_OPERATOR (minLength PUNCTUATION_OPERATOR)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: | CHAR (LEFT_PAREN fixedLength RIGHT_PAREN)? notNull?
// Original: | CHAR (LEFT_PAREN fixedLength PUNCTUATION_OPERATOR)? notNull?
// Original: | DATA_TYPE (LEFT_PAREN fixedLength PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR fixedLength PUNCTUATION_OPERATOR)? notNull?
// Original: | VARCHAR (LEFT_PAREN maxLength RIGHT_PAREN)? notNull?
// Original: | DATA_TYPE (LEFT_PAREN maxLength RIGHT_PAREN)? notNull?
// Original: | DATA_TYPE (LEFT_PAREN maxLength PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR maxLength PUNCTUATION_OPERATOR)? notNull?
;

// Original: byteStringType
CONTROL_FLOWbyteStringTypeCONTROL_FLOW
// Original: : BYTES (LEFT_PAREN (minLength COMMA)? maxLength RIGHT_PAREN)? notNull?
// Original: : BYTES (LEFT_PAREN (minLength COMMA)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: : BYTES (PUNCTUATION_OPERATOR (minLength COMMA)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: : BYTES (PUNCTUATION_OPERATOR (minLength PUNCTUATION_OPERATOR)? maxLength PUNCTUATION_OPERATOR)? notNull?
: DATA_TYPE (PUNCTUATION_OPERATOR (minLength PUNCTUATION_OPERATOR)? maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: | BINARY (LEFT_PAREN fixedLength RIGHT_PAREN)? notNull?
// Original: | BINARY (LEFT_PAREN fixedLength PUNCTUATION_OPERATOR)? notNull?
// Original: | KEYWORD (LEFT_PAREN fixedLength PUNCTUATION_OPERATOR)? notNull?
| KEYWORD (PUNCTUATION_OPERATOR fixedLength PUNCTUATION_OPERATOR)? notNull?
// Original: | VARBINARY (LEFT_PAREN maxLength RIGHT_PAREN)? notNull?
// Original: | VARBINARY (LEFT_PAREN maxLength PUNCTUATION_OPERATOR)? notNull?
// Original: | DATA_TYPE (LEFT_PAREN maxLength PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR maxLength PUNCTUATION_OPERATOR)? notNull?
;

// Original: minLength
CONTROL_FLOWminLengthCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// Original: maxLength
CONTROL_FLOWmaxLengthCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// Original: fixedLength
CONTROL_FLOWfixedLengthCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// Original: numericType
CONTROL_FLOWnumericTypeCONTROL_FLOW
// Original: : exactNumericType
: CONTROL_FLOWexactNumericTypeCONTROL_FLOW
// Original: | approximateNumericType
| CONTROL_FLOWapproximateNumericTypeCONTROL_FLOW
;

// Original: exactNumericType
CONTROL_FLOWexactNumericTypeCONTROL_FLOW
// Original: : binaryExactNumericType
: CONTROL_FLOWbinaryExactNumericTypeCONTROL_FLOW
// Original: | decimalExactNumericType
| CONTROL_FLOWdecimalExactNumericTypeCONTROL_FLOW
;

// Original: binaryExactNumericType
CONTROL_FLOWbinaryExactNumericTypeCONTROL_FLOW
// Original: : signedBinaryExactNumericType
: CONTROL_FLOWsignedBinaryExactNumericTypeCONTROL_FLOW
// Original: | unsignedBinaryExactNumericType
| CONTROL_FLOWunsignedBinaryExactNumericTypeCONTROL_FLOW
;

// Original: signedBinaryExactNumericType
CONTROL_FLOWsignedBinaryExactNumericTypeCONTROL_FLOW
// Original: : INT8 notNull?
: DATA_TYPE notNull?
// Original: | INT16 notNull?
| DATA_TYPE notNull?
// Original: | INT32 notNull?
| DATA_TYPE notNull?
// Original: | INT64 notNull?
| DATA_TYPE notNull?
// Original: | INT128 notNull?
| DATA_TYPE notNull?
// Original: | INT256 notNull?
| DATA_TYPE notNull?
// Original: | SMALLINT notNull?
| DATA_TYPE notNull?
// Original: | INT (LEFT_PAREN precision RIGHT_PAREN)? notNull?
// Original: | INT (LEFT_PAREN precision PUNCTUATION_OPERATOR)? notNull?
// Original: | INT (PUNCTUATION_OPERATOR precision PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR precision PUNCTUATION_OPERATOR)? notNull?
// Original: | BIGINT notNull?
| DATA_TYPE notNull?
// Original: | SIGNED? verboseBinaryExactNumericType
| CONTROL_FLOWSIGNEDCONTROL_FLOW? CONTROL_FLOWverboseBinaryExactNumericTypeCONTROL_FLOW
;

// Original: unsignedBinaryExactNumericType
CONTROL_FLOWunsignedBinaryExactNumericTypeCONTROL_FLOW
// Original: : UINT8 notNull?
: DATA_TYPE notNull?
// Original: | UINT16 notNull?
| DATA_TYPE notNull?
// Original: | UINT32 notNull?
| DATA_TYPE notNull?
// Original: | UINT64 notNull?
| DATA_TYPE notNull?
// Original: | UINT128 notNull?
| DATA_TYPE notNull?
// Original: | UINT256 notNull?
| DATA_TYPE notNull?
// Original: | USMALLINT notNull?
| DATA_TYPE notNull?
// Original: | UINT (LEFT_PAREN precision RIGHT_PAREN)? notNull?
// Original: | UINT (LEFT_PAREN precision PUNCTUATION_OPERATOR)? notNull?
// Original: | UINT (PUNCTUATION_OPERATOR precision PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR precision PUNCTUATION_OPERATOR)? notNull?
// Original: | UBIGINT notNull?
| DATA_TYPE notNull?
// Original: | UNSIGNED verboseBinaryExactNumericType
| CONTROL_FLOWUNSIGNEDCONTROL_FLOW CONTROL_FLOWverboseBinaryExactNumericTypeCONTROL_FLOW
;

// Original: verboseBinaryExactNumericType
CONTROL_FLOWverboseBinaryExactNumericTypeCONTROL_FLOW
: INTEGER8 notNull?
| INTEGER16 notNull?
| INTEGER32 notNull?
| INTEGER64 notNull?
| INTEGER128 notNull?
| INTEGER256 notNull?
// Original: | SMALL INTEGER notNull?
| SMALL DATA_TYPE notNull?
// Original: | INTEGER (LEFT_PAREN precision RIGHT_PAREN)? notNull?
// Original: | INTEGER (LEFT_PAREN precision PUNCTUATION_OPERATOR)? notNull?
// Original: | DATA_TYPE (LEFT_PAREN precision PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR precision PUNCTUATION_OPERATOR)? notNull?
// Original: | BIG INTEGER notNull?
// Original: | BIG DATA_TYPE notNull?
| KEYWORD DATA_TYPE notNull?
;

// Original: decimalExactNumericType
CONTROL_FLOWdecimalExactNumericTypeCONTROL_FLOW
// Original: : (DECIMAL | DEC) (LEFT_PAREN precision (COMMA scale)? RIGHT_PAREN notNull?)?
// Original: : (DECIMAL | DEC) (LEFT_PAREN precision (COMMA scale)? PUNCTUATION_OPERATOR notNull?)?
// Original: : (DECIMAL | DEC) (PUNCTUATION_OPERATOR precision (COMMA scale)? PUNCTUATION_OPERATOR notNull?)?
// Original: : (DECIMAL | DEC) (PUNCTUATION_OPERATOR precision (PUNCTUATION_OPERATOR scale)? PUNCTUATION_OPERATOR notNull?)?
// Original: : (DATA_TYPE | DEC) (PUNCTUATION_OPERATOR precision (PUNCTUATION_OPERATOR scale)? PUNCTUATION_OPERATOR notNull?)?
: (DATA_TYPE | DATA_TYPE) (PUNCTUATION_OPERATOR precision (PUNCTUATION_OPERATOR scale)? PUNCTUATION_OPERATOR notNull?)?
;

// Original: precision
CONTROL_FLOWprecisionCONTROL_FLOW
// Original: : unsignedDecimalInteger
: CONTROL_FLOWunsignedDecimalIntegerCONTROL_FLOW
;

// Original: scale
CONTROL_FLOWscaleCONTROL_FLOW
// Original: : unsignedDecimalInteger
: CONTROL_FLOWunsignedDecimalIntegerCONTROL_FLOW
;

// Original: approximateNumericType
CONTROL_FLOWapproximateNumericTypeCONTROL_FLOW
: FLOAT16 notNull?
| FLOAT32 notNull?
| FLOAT64 notNull?
| FLOAT128 notNull?
| FLOAT256 notNull?
// Original: | FLOAT (LEFT_PAREN precision (COMMA scale)? RIGHT_PAREN)? notNull?
// Original: | FLOAT (LEFT_PAREN precision (COMMA scale)? PUNCTUATION_OPERATOR)? notNull?
// Original: | FLOAT (PUNCTUATION_OPERATOR precision (COMMA scale)? PUNCTUATION_OPERATOR)? notNull?
// Original: | FLOAT (PUNCTUATION_OPERATOR precision (PUNCTUATION_OPERATOR scale)? PUNCTUATION_OPERATOR)? notNull?
| DATA_TYPE (PUNCTUATION_OPERATOR precision (PUNCTUATION_OPERATOR scale)? PUNCTUATION_OPERATOR)? notNull?
// Original: | REAL notNull?
| DATA_TYPE notNull?
// Original: | DOUBLE PRECISION? notNull?
// Original: | DOUBLE KEYWORD? notNull?
| DATA_TYPE KEYWORD? notNull?
;

// Original: temporalType
CONTROL_FLOWtemporalTypeCONTROL_FLOW
// Original: : temporalInstantType
: CONTROL_FLOWtemporalInstantTypeCONTROL_FLOW
// Original: | temporalDurationType
| CONTROL_FLOWtemporalDurationTypeCONTROL_FLOW
;

// Original: temporalInstantType
CONTROL_FLOWtemporalInstantTypeCONTROL_FLOW
// Original: : datetimeType
: CONTROL_FLOWdatetimeTypeCONTROL_FLOW
// Original: | localdatetimeType
| CONTROL_FLOWlocaldatetimeTypeCONTROL_FLOW
// Original: | dateType
| CONTROL_FLOWdateTypeCONTROL_FLOW
// Original: | timeType
| CONTROL_FLOWtimeTypeCONTROL_FLOW
// Original: | localtimeType
| CONTROL_FLOWlocaltimeTypeCONTROL_FLOW
;

// Original: datetimeType
CONTROL_FLOWdatetimeTypeCONTROL_FLOW
// Original: : ZONED DATETIME notNull?
// Original: : ZONED DATA_TYPE notNull?
: DATA_TYPE DATA_TYPE notNull?
// Original: | TIMESTAMP WITH TIME ZONE notNull?
// Original: | TIMESTAMP WITH DATA_TYPE ZONE notNull?
// Original: | TIMESTAMP KEYWORD DATA_TYPE ZONE notNull?
// Original: | TIMESTAMP KEYWORD DATA_TYPE KEYWORD notNull?
| DATA_TYPE KEYWORD DATA_TYPE KEYWORD notNull?
;

// Original: localdatetimeType
CONTROL_FLOWlocaldatetimeTypeCONTROL_FLOW
// Original: : LOCAL DATETIME notNull?
: LOCAL DATA_TYPE notNull?
// Original: | TIMESTAMP (WITHOUT TIME ZONE)? notNull?
// Original: | TIMESTAMP (WITHOUT DATA_TYPE ZONE)? notNull?
// Original: | TIMESTAMP (KEYWORD DATA_TYPE ZONE)? notNull?
// Original: | TIMESTAMP (KEYWORD DATA_TYPE KEYWORD)? notNull?
| DATA_TYPE (KEYWORD DATA_TYPE KEYWORD)? notNull?
;

// Original: dateType
CONTROL_FLOWdateTypeCONTROL_FLOW
// Original: : DATE notNull?
: DATA_TYPE notNull?
;

// Original: timeType
CONTROL_FLOWtimeTypeCONTROL_FLOW
// Original: : ZONED TIME notNull?
// Original: : ZONED DATA_TYPE notNull?
: DATA_TYPE DATA_TYPE notNull?
// Original: | TIME WITH TIME ZONE notNull?
// Original: | DATA_TYPE WITH DATA_TYPE ZONE notNull?
// Original: | DATA_TYPE KEYWORD DATA_TYPE ZONE notNull?
| DATA_TYPE KEYWORD DATA_TYPE KEYWORD notNull?
;

// Original: localtimeType
CONTROL_FLOWlocaltimeTypeCONTROL_FLOW
// Original: : LOCAL TIME notNull?
: LOCAL DATA_TYPE notNull?
// Original: | TIME WITHOUT TIME ZONE notNull?
// Original: | DATA_TYPE WITHOUT DATA_TYPE ZONE notNull?
// Original: | DATA_TYPE KEYWORD DATA_TYPE ZONE notNull?
| DATA_TYPE KEYWORD DATA_TYPE KEYWORD notNull?
;

// Original: temporalDurationType
CONTROL_FLOWtemporalDurationTypeCONTROL_FLOW
// Original: : DURATION LEFT_PAREN temporalDurationQualifier RIGHT_PAREN notNull?
// Original: : DURATION LEFT_PAREN temporalDurationQualifier PUNCTUATION_OPERATOR notNull?
// Original: : DATA_TYPE LEFT_PAREN temporalDurationQualifier PUNCTUATION_OPERATOR notNull?
: DATA_TYPE PUNCTUATION_OPERATOR temporalDurationQualifier PUNCTUATION_OPERATOR notNull?
;

// Original: temporalDurationQualifier
CONTROL_FLOWtemporalDurationQualifierCONTROL_FLOW
// Original: : YEAR TO MONTH
// Original: : YEAR TO DATA_TYPE
// Original: : DATA_TYPE TO DATA_TYPE
// Original: : DATA_TYPE KEYWORD DATA_TYPE
: CONTROL_FLOWDATA_TYPECONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWDATA_TYPECONTROL_FLOW
// Original: | DAY TO SECOND
// Original: | DAY KEYWORD SECOND
| CONTROL_FLOWDAYCONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWSECONDCONTROL_FLOW
;

// Original: referenceValueType
CONTROL_FLOWreferenceValueTypeCONTROL_FLOW
// Original: : graphReferenceValueType
: CONTROL_FLOWgraphReferenceValueTypeCONTROL_FLOW
// Original: | bindingTableReferenceValueType
| CONTROL_FLOWbindingTableReferenceValueTypeCONTROL_FLOW
// Original: | nodeReferenceValueType
| CONTROL_FLOWnodeReferenceValueTypeCONTROL_FLOW
// Original: | edgeReferenceValueType
| CONTROL_FLOWedgeReferenceValueTypeCONTROL_FLOW
;

// Original: immaterialValueType
CONTROL_FLOWimmaterialValueTypeCONTROL_FLOW
// Original: : nullType
: CONTROL_FLOWnullTypeCONTROL_FLOW
// Original: | emptyType
| CONTROL_FLOWemptyTypeCONTROL_FLOW
;

// Original: nullType
CONTROL_FLOWnullTypeCONTROL_FLOW
// Original: : NULL
: CONTROL_FLOWNULLCONTROL_FLOW
;

// Original: emptyType
CONTROL_FLOWemptyTypeCONTROL_FLOW
// Original: : NULL notNull
: CONTROL_FLOWNULLCONTROL_FLOW CONTROL_FLOWnotNullCONTROL_FLOW
// Original: | NOTHING
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
;

// Original: graphReferenceValueType
CONTROL_FLOWgraphReferenceValueTypeCONTROL_FLOW
// Original: : openGraphReferenceValueType
: CONTROL_FLOWopenGraphReferenceValueTypeCONTROL_FLOW
// Original: | closedGraphReferenceValueType
| CONTROL_FLOWclosedGraphReferenceValueTypeCONTROL_FLOW
;

// Original: closedGraphReferenceValueType
CONTROL_FLOWclosedGraphReferenceValueTypeCONTROL_FLOW
// Original: : PROPERTY? GRAPH nestedGraphTypeSpecification notNull?
: KEYWORD? GRAPH nestedGraphTypeSpecification notNull?
;

// Original: openGraphReferenceValueType
CONTROL_FLOWopenGraphReferenceValueTypeCONTROL_FLOW
// Original: : ANY PROPERTY? GRAPH notNull?
// Original: : ANY KEYWORD? GRAPH notNull?
: KEYWORD KEYWORD? GRAPH notNull?
;

// Original: bindingTableReferenceValueType
CONTROL_FLOWbindingTableReferenceValueTypeCONTROL_FLOW
: bindingTableType notNull?
;

// Original: nodeReferenceValueType
CONTROL_FLOWnodeReferenceValueTypeCONTROL_FLOW
// Original: : openNodeReferenceValueType
: CONTROL_FLOWopenNodeReferenceValueTypeCONTROL_FLOW
// Original: | closedNodeReferenceValueType
| CONTROL_FLOWclosedNodeReferenceValueTypeCONTROL_FLOW
;

// Original: closedNodeReferenceValueType
CONTROL_FLOWclosedNodeReferenceValueTypeCONTROL_FLOW
: nodeTypeSpecification notNull?
;

// Original: openNodeReferenceValueType
CONTROL_FLOWopenNodeReferenceValueTypeCONTROL_FLOW
// Original: : ANY? nodeSynonym notNull?
: KEYWORD? nodeSynonym notNull?
;

// Original: edgeReferenceValueType
CONTROL_FLOWedgeReferenceValueTypeCONTROL_FLOW
// Original: : openEdgeReferenceValueType
: CONTROL_FLOWopenEdgeReferenceValueTypeCONTROL_FLOW
// Original: | closedEdgeReferenceValueType
| CONTROL_FLOWclosedEdgeReferenceValueTypeCONTROL_FLOW
;

// Original: closedEdgeReferenceValueType
CONTROL_FLOWclosedEdgeReferenceValueTypeCONTROL_FLOW
: edgeTypeSpecification notNull?
;

// Original: openEdgeReferenceValueType
CONTROL_FLOWopenEdgeReferenceValueTypeCONTROL_FLOW
// Original: : ANY? edgeSynonym notNull?
: KEYWORD? edgeSynonym notNull?
;

// Original: pathValueType
CONTROL_FLOWpathValueTypeCONTROL_FLOW
// Original: : PATH notNull?
: KEYWORD notNull?
;

// Original: listValueTypeName
CONTROL_FLOWlistValueTypeNameCONTROL_FLOW
// Original: : GROUP? listValueTypeNameSynonym
// Original: : KEYWORD? listValueTypeNameSynonym
: CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWlistValueTypeNameSynonymCONTROL_FLOW
;

// Original: listValueTypeNameSynonym
CONTROL_FLOWlistValueTypeNameSynonymCONTROL_FLOW
// Original: : LIST
: CONTROL_FLOWLISTCONTROL_FLOW
// Original: | ARRAY
| CONTROL_FLOWARRAYCONTROL_FLOW
;

// Original: recordType
CONTROL_FLOWrecordTypeCONTROL_FLOW
// Original: : ANY? RECORD notNull?
: KEYWORD? RECORD notNull?
| RECORD? fieldTypesSpecification notNull?
;

// Original: fieldTypesSpecification
CONTROL_FLOWfieldTypesSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE fieldTypeList? RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWfieldTypeListCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: fieldTypeList
CONTROL_FLOWfieldTypeListCONTROL_FLOW
// Original: : fieldType (COMMA fieldType)*
: fieldType (PUNCTUATION_OPERATOR fieldType)*
;

// Original: notNull
CONTROL_FLOWnotNullCONTROL_FLOW
// Original: :  NOT NULL
:  CONTROL_FLOWNOTCONTROL_FLOW CONTROL_FLOWNULLCONTROL_FLOW
;

// 18.10 <field type>

// Original: fieldType
CONTROL_FLOWfieldTypeCONTROL_FLOW
// Original: : fieldName typed? valueType
: CONTROL_FLOWfieldNameCONTROL_FLOW CONTROL_FLOWtypedCONTROL_FLOW? CONTROL_FLOWvalueTypeCONTROL_FLOW
;

// 19.1 <search condition>

// Original: searchCondition
CONTROL_FLOWsearchConditionCONTROL_FLOW
// Original: : booleanValueExpression
: CONTROL_FLOWbooleanValueExpressionCONTROL_FLOW
;

// 19.2 <predicate>

// Original: predicate
CONTROL_FLOWpredicateCONTROL_FLOW
// Original: : existsPredicate
: CONTROL_FLOWexistsPredicateCONTROL_FLOW
// Original: | nullPredicate
| CONTROL_FLOWnullPredicateCONTROL_FLOW
// Original: | valueTypePredicate
| CONTROL_FLOWvalueTypePredicateCONTROL_FLOW
// Original: | directedPredicate
| CONTROL_FLOWdirectedPredicateCONTROL_FLOW
// Original: | labeledPredicate
| CONTROL_FLOWlabeledPredicateCONTROL_FLOW
// Original: | sourceDestinationPredicate
| CONTROL_FLOWsourceDestinationPredicateCONTROL_FLOW
// Original: | all_differentPredicate
| CONTROL_FLOWall_differentPredicateCONTROL_FLOW
// Original: | samePredicate
| CONTROL_FLOWsamePredicateCONTROL_FLOW
// Original: | property_existsPredicate
| CONTROL_FLOWproperty_existsPredicateCONTROL_FLOW
;

// 19.3 <comparison predicate>

// Original: // The <comparison predicate> productions moved to valueExpression
// CONTROL_FLOWTheCONTROL_FLOW <CONTROL_FLOWcomparisonCONTROL_FLOW CONTROL_FLOWpredicateCONTROL_FLOW> CONTROL_FLOWproductionsCONTROL_FLOW CONTROL_FLOWmovedCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
// to avoid left mutually recursive productions.

// Original: comparisonPredicatePart2
CONTROL_FLOWcomparisonPredicatePart2CONTROL_FLOW
// Original: : compOp valueExpression
: CONTROL_FLOWcompOpCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: compOp
CONTROL_FLOWcompOpCONTROL_FLOW
// Original: : EQUALS_OPERATOR
: CONTROL_FLOWEQUALS_OPERATORCONTROL_FLOW
// Original: | NOT_EQUALS_OPERATOR
| CONTROL_FLOWNOT_EQUALS_OPERATORCONTROL_FLOW
// Original: | LEFT_ANGLE_BRACKET
// Original: | PUNCTUATION_OPERATOR
| CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | RIGHT_ANGLE_BRACKET
| CONTROL_FLOWRIGHT_ANGLE_BRACKETCONTROL_FLOW
// Original: | LESS_THAN_OR_EQUALS_OPERATOR
| CONTROL_FLOWLESS_THAN_OR_EQUALS_OPERATORCONTROL_FLOW
// Original: | GREATER_THAN_OR_EQUALS_OPERATOR
| CONTROL_FLOWGREATER_THAN_OR_EQUALS_OPERATORCONTROL_FLOW
;

// 19.4 <exists predicate>

// Original: existsPredicate
CONTROL_FLOWexistsPredicateCONTROL_FLOW
// Original: : EXISTS (LEFT_BRACE graphPattern RIGHT_BRACE | LEFT_PAREN graphPattern RIGHT_PAREN | LEFT_BRACE matchStatementBlock RIGHT_BRACE | LEFT_PAREN matchStatementBlock RIGHT_PAREN | nestedQuerySpecification)
// Original: : EXISTS (LEFT_BRACE graphPattern RIGHT_BRACE | LEFT_PAREN graphPattern PUNCTUATION_OPERATOR | LEFT_BRACE matchStatementBlock RIGHT_BRACE | LEFT_PAREN matchStatementBlock PUNCTUATION_OPERATOR | nestedQuerySpecification)
// Original: : EXISTS (PUNCTUATION_OPERATOR graphPattern RIGHT_BRACE | LEFT_PAREN graphPattern PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR matchStatementBlock RIGHT_BRACE | LEFT_PAREN matchStatementBlock PUNCTUATION_OPERATOR | nestedQuerySpecification)
// Original: : KEYWORD (PUNCTUATION_OPERATOR graphPattern RIGHT_BRACE | LEFT_PAREN graphPattern PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR matchStatementBlock RIGHT_BRACE | LEFT_PAREN matchStatementBlock PUNCTUATION_OPERATOR | nestedQuerySpecification)
// Original: : KEYWORD (PUNCTUATION_OPERATOR graphPattern RIGHT_BRACE | PUNCTUATION_OPERATOR graphPattern PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR matchStatementBlock RIGHT_BRACE | PUNCTUATION_OPERATOR matchStatementBlock PUNCTUATION_OPERATOR | nestedQuerySpecification)
: KEYWORD (PUNCTUATION_OPERATOR graphPattern PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR graphPattern PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR matchStatementBlock PUNCTUATION_OPERATOR | PUNCTUATION_OPERATOR matchStatementBlock PUNCTUATION_OPERATOR | nestedQuerySpecification)
;

// 19.5 <null predicate>

// Original: nullPredicate
CONTROL_FLOWnullPredicateCONTROL_FLOW
// Original: : valueExpressionPrimary nullPredicatePart2
: CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW CONTROL_FLOWnullPredicatePart2CONTROL_FLOW
;

// Original: nullPredicatePart2
CONTROL_FLOWnullPredicatePart2CONTROL_FLOW
// Original: : IS NOT? NULL
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWNULLCONTROL_FLOW
;

// 19.6 <value type predicate>

// Original: valueTypePredicate
CONTROL_FLOWvalueTypePredicateCONTROL_FLOW
// Original: : valueExpressionPrimary valueTypePredicatePart2
: CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW CONTROL_FLOWvalueTypePredicatePart2CONTROL_FLOW
;

// Original: valueTypePredicatePart2
CONTROL_FLOWvalueTypePredicatePart2CONTROL_FLOW
// Original: : IS NOT? typed valueType
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWtypedCONTROL_FLOW CONTROL_FLOWvalueTypeCONTROL_FLOW
;

// 19.7 <normalized predicate>

// Original: normalizedPredicatePart2
CONTROL_FLOWnormalizedPredicatePart2CONTROL_FLOW
// Original: : IS NOT? normalForm? NORMALIZED
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWnormalFormCONTROL_FLOW? CONTROL_FLOWNORMALIZEDCONTROL_FLOW
;

// 19.8 <directed predicate>

// Original: directedPredicate
CONTROL_FLOWdirectedPredicateCONTROL_FLOW
// Original: : elementVariableReference directedPredicatePart2
: CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWdirectedPredicatePart2CONTROL_FLOW
;

// Original: directedPredicatePart2
CONTROL_FLOWdirectedPredicatePart2CONTROL_FLOW
// Original: : IS NOT? DIRECTED
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWDIRECTEDCONTROL_FLOW
;

// 19.9 <labled predicate>

// Original: labeledPredicate
CONTROL_FLOWlabeledPredicateCONTROL_FLOW
// Original: : elementVariableReference labeledPredicatePart2
: CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWlabeledPredicatePart2CONTROL_FLOW
;

// Original: labeledPredicatePart2
CONTROL_FLOWlabeledPredicatePart2CONTROL_FLOW
// Original: : isLabeledOrColon labelExpression
: CONTROL_FLOWisLabeledOrColonCONTROL_FLOW CONTROL_FLOWlabelExpressionCONTROL_FLOW
;

// Original: isLabeledOrColon
CONTROL_FLOWisLabeledOrColonCONTROL_FLOW
// Original: : IS NOT? LABELED
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWLABELEDCONTROL_FLOW
// Original: | COLON
| CONTROL_FLOWCOLONCONTROL_FLOW
;

// 19.10 <source/destination predicate>

// Original: sourceDestinationPredicate
CONTROL_FLOWsourceDestinationPredicateCONTROL_FLOW
// Original: : nodeReference sourcePredicatePart2
: CONTROL_FLOWnodeReferenceCONTROL_FLOW CONTROL_FLOWsourcePredicatePart2CONTROL_FLOW
// Original: | nodeReference destinationPredicatePart2
| CONTROL_FLOWnodeReferenceCONTROL_FLOW CONTROL_FLOWdestinationPredicatePart2CONTROL_FLOW
;

// Original: nodeReference
CONTROL_FLOWnodeReferenceCONTROL_FLOW
// Original: : elementVariableReference
: CONTROL_FLOWelementVariableReferenceCONTROL_FLOW
;

// Original: sourcePredicatePart2
CONTROL_FLOWsourcePredicatePart2CONTROL_FLOW
// Original: : IS NOT? SOURCE OF edgeReference
// Original: : IS NOT? KEYWORD OF edgeReference
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWOFCONTROL_FLOW CONTROL_FLOWedgeReferenceCONTROL_FLOW
;

// Original: destinationPredicatePart2
CONTROL_FLOWdestinationPredicatePart2CONTROL_FLOW
// Original: : IS NOT? DESTINATION OF edgeReference
: CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWDESTINATIONCONTROL_FLOW CONTROL_FLOWOFCONTROL_FLOW CONTROL_FLOWedgeReferenceCONTROL_FLOW
;

// Original: edgeReference
CONTROL_FLOWedgeReferenceCONTROL_FLOW
// Original: : elementVariableReference
: CONTROL_FLOWelementVariableReferenceCONTROL_FLOW
;

// 19.11 <all different predicate>

// Original: all_differentPredicate
CONTROL_FLOWall_differentPredicateCONTROL_FLOW
// Original: : ALL_DIFFERENT LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW (CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW)* CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 19.12 <same predicate>

// Original: samePredicate
CONTROL_FLOWsamePredicateCONTROL_FLOW
// Original: : SAME LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* RIGHT_PAREN
// Original: : KEYWORD LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* RIGHT_PAREN
// Original: : KEYWORD LEFT_PAREN elementVariableReference COMMA elementVariableReference (COMMA elementVariableReference)* PUNCTUATION_OPERATOR
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW (CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW)* CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 19.13 <property exists predicate>

// Original: property_existsPredicate
CONTROL_FLOWproperty_existsPredicateCONTROL_FLOW
// Original: : PROPERTY_EXISTS LEFT_PAREN elementVariableReference COMMA propertyName RIGHT_PAREN
// Original: : PROPERTY_EXISTS LEFT_PAREN elementVariableReference COMMA propertyName PUNCTUATION_OPERATOR
: CONTROL_FLOWPROPERTY_EXISTSCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWpropertyNameCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 20.1 <value expression>

// Original: // This version of valueExpression sucks up rules broken out in the standard to a single production. This
// CONTROL_FLOWThisCONTROL_FLOW CONTROL_FLOWversionCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWsucksCONTROL_FLOW CONTROL_FLOWupCONTROL_FLOW CONTROL_FLOWrulesCONTROL_FLOW CONTROL_FLOWbrokenCONTROL_FLOW CONTROL_FLOWoutCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWstandardCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWaCONTROL_FLOW CONTROL_FLOWsingleCONTROL_FLOW CONTROL_FLOWproductionCONTROL_FLOW. CONTROL_FLOWThisCONTROL_FLOW
// eliminates ambiguity in multiple rules specifying valueExpressionPrimary.

// Original: valueExpression
CONTROL_FLOWvalueExpressionCONTROL_FLOW
// Original: // Numeric, datetime and duration types all support roughly the same expressions. So here
// CONTROL_FLOWNumericCONTROL_FLOW, CONTROL_FLOWdatetimeCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWdurationCONTROL_FLOW CONTROL_FLOWtypesCONTROL_FLOW CONTROL_FLOWallCONTROL_FLOW CONTROL_FLOWsupportCONTROL_FLOW CONTROL_FLOWroughlyCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWsameCONTROL_FLOW CONTROL_FLOWexpressionsCONTROL_FLOW. CONTROL_FLOWSoCONTROL_FLOW CONTROL_FLOWhereCONTROL_FLOW
// Original: // we define a rule that deals with all of them. It is up to the implementation to post
// CONTROL_FLOWweCONTROL_FLOW CONTROL_FLOWdefineCONTROL_FLOW CONTROL_FLOWaCONTROL_FLOW CONTROL_FLOWruleCONTROL_FLOW CONTROL_FLOWthatCONTROL_FLOW CONTROL_FLOWdealsCONTROL_FLOW CONTROL_FLOWwithCONTROL_FLOW CONTROL_FLOWallCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW. CONTROL_FLOWItCONTROL_FLOW CONTROL_FLOWisCONTROL_FLOW CONTROL_FLOWupCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWimplementationCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWpostCONTROL_FLOW
// process the sytnax tree and flag invalid type and function combinations.
// Original: : sign = (PLUS_SIGN | MINUS_SIGN) valueExpression                       #signedExprAlt
: CONTROL_FLOWsignCONTROL_FLOW = (CONTROL_FLOWPLUS_SIGNCONTROL_FLOW | CONTROL_FLOWMINUS_SIGNCONTROL_FLOW) CONTROL_FLOWvalueExpressionCONTROL_FLOW                       #CONTROL_FLOWsignedExprAltCONTROL_FLOW
// Original: | valueExpression operator = (ASTERISK | SOLIDUS) valueExpression       #multDivExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWoperatorCONTROL_FLOW = (CONTROL_FLOWASTERISKCONTROL_FLOW | CONTROL_FLOWSOLIDUSCONTROL_FLOW) CONTROL_FLOWvalueExpressionCONTROL_FLOW       #CONTROL_FLOWmultDivExprAltCONTROL_FLOW
// Original: | valueExpression operator = (PLUS_SIGN | MINUS_SIGN) valueExpression   #addSubtractExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWoperatorCONTROL_FLOW = (CONTROL_FLOWPLUS_SIGNCONTROL_FLOW | CONTROL_FLOWMINUS_SIGNCONTROL_FLOW) CONTROL_FLOWvalueExpressionCONTROL_FLOW   #CONTROL_FLOWaddSubtractExprAltCONTROL_FLOW
// Original: // Character strings, byte strings, lists and paths all support the same concatenation
// CONTROL_FLOWCharacterCONTROL_FLOW CONTROL_FLOWstringsCONTROL_FLOW, CONTROL_FLOWbyteCONTROL_FLOW CONTROL_FLOWstringsCONTROL_FLOW, CONTROL_FLOWlistsCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWpathsCONTROL_FLOW CONTROL_FLOWallCONTROL_FLOW CONTROL_FLOWsupportCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWsameCONTROL_FLOW CONTROL_FLOWconcatenationCONTROL_FLOW
// Original: // operator. So here we define a rule that deals with all of them. Of course the types
// CONTROL_FLOWoperatorCONTROL_FLOW. CONTROL_FLOWSoCONTROL_FLOW CONTROL_FLOWhereCONTROL_FLOW CONTROL_FLOWweCONTROL_FLOW CONTROL_FLOWdefineCONTROL_FLOW CONTROL_FLOWaCONTROL_FLOW CONTROL_FLOWruleCONTROL_FLOW CONTROL_FLOWthatCONTROL_FLOW CONTROL_FLOWdealsCONTROL_FLOW CONTROL_FLOWwithCONTROL_FLOW CONTROL_FLOWallCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW. CONTROL_FLOWOfCONTROL_FLOW CONTROL_FLOWcourseCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWtypesCONTROL_FLOW
// Original: // cannot be combined. So it is up to implementation to post process the sytax tree
// CONTROL_FLOWcannotCONTROL_FLOW CONTROL_FLOWbeCONTROL_FLOW CONTROL_FLOWcombinedCONTROL_FLOW. CONTROL_FLOWSoCONTROL_FLOW CONTROL_FLOWitCONTROL_FLOW CONTROL_FLOWisCONTROL_FLOW CONTROL_FLOWupCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWimplementationCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWpostCONTROL_FLOW CONTROL_FLOWprocessCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWsytaxCONTROL_FLOW CONTROL_FLOWtreeCONTROL_FLOW
// and flag invalid type and function combinations.
// Original: | valueExpression CONCATENATION_OPERATOR valueExpression                #concatenationExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWCONCATENATION_OPERATORCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW                #CONTROL_FLOWconcatenationExprAltCONTROL_FLOW
// Boolean value expression included here.
// Original: | NOT valueExpression                                                   #notExprAlt
| CONTROL_FLOWNOTCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW                                                   #CONTROL_FLOWnotExprAltCONTROL_FLOW
// Original: | valueExpression IS NOT? truthValue                                    #isNotExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWISCONTROL_FLOW CONTROL_FLOWNOTCONTROL_FLOW? CONTROL_FLOWtruthValueCONTROL_FLOW                                    #CONTROL_FLOWisNotExprAltCONTROL_FLOW
// Original: | valueExpression AND valueExpression                                   #conjunctiveExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWANDCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW                                   #CONTROL_FLOWconjunctiveExprAltCONTROL_FLOW
// Original: | valueExpression operator = (OR | XOR) valueExpression                 #disjunctiveExprAlt
// Original: | valueExpression operator = (OR | KEYWORD) valueExpression                 #disjunctiveExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWoperatorCONTROL_FLOW = (CONTROL_FLOWORCONTROL_FLOW | CONTROL_FLOWKEYWORDCONTROL_FLOW) CONTROL_FLOWvalueExpressionCONTROL_FLOW                 #CONTROL_FLOWdisjunctiveExprAltCONTROL_FLOW
// The comparisonPredicate productions moved here to eliminate left mutual recursion.
// Original: | valueExpression comparisonPredicatePart2                              #comparisonExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWcomparisonPredicatePart2CONTROL_FLOW                              #CONTROL_FLOWcomparisonExprAltCONTROL_FLOW
// Original: | predicate                                                             #predicateExprAlt
| CONTROL_FLOWpredicateCONTROL_FLOW                                                             #CONTROL_FLOWpredicateExprAltCONTROL_FLOW
// The normalizedPredicate productions moved here to eliminate left mutual recursion.
// Original: | valueExpression normalizedPredicatePart2                              #normalizedPredicateExprAlt
| CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWnormalizedPredicatePart2CONTROL_FLOW                              #CONTROL_FLOWnormalizedPredicateExprAltCONTROL_FLOW
// Original: | PROPERTY? GRAPH graphExpression                                       #propertyGraphExprAlt
| CONTROL_FLOWPROPERTYCONTROL_FLOW? CONTROL_FLOWGRAPHCONTROL_FLOW CONTROL_FLOWgraphExpressionCONTROL_FLOW                                       #CONTROL_FLOWpropertyGraphExprAltCONTROL_FLOW
// Original: | BINDING? TABLE bindingTableExpression                                 #bindingTableExprAlt
// Original: | KEYWORD? TABLE bindingTableExpression                                 #bindingTableExprAlt
| CONTROL_FLOWKEYWORDCONTROL_FLOW? CONTROL_FLOWTABLECONTROL_FLOW CONTROL_FLOWbindingTableExpressionCONTROL_FLOW                                 #CONTROL_FLOWbindingTableExprAltCONTROL_FLOW
// Original: | valueFunction                                                         #valueFunctionExprAlt
| CONTROL_FLOWvalueFunctionCONTROL_FLOW                                                         #CONTROL_FLOWvalueFunctionExprAltCONTROL_FLOW
// Original: | valueExpressionPrimary                                                #primaryExprAlt
| CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW                                                #CONTROL_FLOWprimaryExprAltCONTROL_FLOW
;

// Original: valueFunction
CONTROL_FLOWvalueFunctionCONTROL_FLOW
// Original: : numericValueFunction
: CONTROL_FLOWnumericValueFunctionCONTROL_FLOW
// Original: | datetimeSubtraction
| CONTROL_FLOWdatetimeSubtractionCONTROL_FLOW
// Original: | datetimeValueFunction
| CONTROL_FLOWdatetimeValueFunctionCONTROL_FLOW
// Original: | durationValueFunction
| CONTROL_FLOWdurationValueFunctionCONTROL_FLOW
// Original: | characterOrByteStringFunction
| CONTROL_FLOWcharacterOrByteStringFunctionCONTROL_FLOW
// Original: | listValueFunction
| CONTROL_FLOWlistValueFunctionCONTROL_FLOW
;

// Original: booleanValueExpression
CONTROL_FLOWbooleanValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: characterOrByteStringFunction
CONTROL_FLOWcharacterOrByteStringFunctionCONTROL_FLOW
// Original: : subCharacterOrByteString
: CONTROL_FLOWsubCharacterOrByteStringCONTROL_FLOW
// Original: | trimSingleCharacterOrByteString
| CONTROL_FLOWtrimSingleCharacterOrByteStringCONTROL_FLOW
// Original: | foldCharacterString
| CONTROL_FLOWfoldCharacterStringCONTROL_FLOW
// Original: | trimMultiCharacterCharacterString
| CONTROL_FLOWtrimMultiCharacterCharacterStringCONTROL_FLOW
// Original: | normalizeCharacterString
| CONTROL_FLOWnormalizeCharacterStringCONTROL_FLOW
;

// Original: subCharacterOrByteString
CONTROL_FLOWsubCharacterOrByteStringCONTROL_FLOW
// Original: : (LEFT | RIGHT) LEFT_PAREN valueExpression COMMA stringLength RIGHT_PAREN
// Original: : (KEYWORD | RIGHT) LEFT_PAREN valueExpression COMMA stringLength RIGHT_PAREN
// Original: : (KEYWORD | RIGHT) LEFT_PAREN valueExpression COMMA stringLength PUNCTUATION_OPERATOR
: (CONTROL_FLOWKEYWORDCONTROL_FLOW | CONTROL_FLOWRIGHTCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWstringLengthCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: trimSingleCharacterOrByteString
CONTROL_FLOWtrimSingleCharacterOrByteStringCONTROL_FLOW
// Original: : TRIM LEFT_PAREN trimOperands RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN trimOperands RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN trimOperands PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWtrimOperandsCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: foldCharacterString
CONTROL_FLOWfoldCharacterStringCONTROL_FLOW
// Original: : (UPPER | LOWER) LEFT_PAREN valueExpression RIGHT_PAREN
// Original: : (UPPER | LOWER) LEFT_PAREN valueExpression PUNCTUATION_OPERATOR
// Original: : (FUNCTION | LOWER) LEFT_PAREN valueExpression PUNCTUATION_OPERATOR
: (CONTROL_FLOWFUNCTIONCONTROL_FLOW | CONTROL_FLOWLOWERCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: trimMultiCharacterCharacterString
CONTROL_FLOWtrimMultiCharacterCharacterStringCONTROL_FLOW
// Original: : (BTRIM | LTRIM | RTRIM) LEFT_PAREN valueExpression (COMMA valueExpression)? RIGHT_PAREN
// Original: : (BTRIM | FUNCTION | RTRIM) LEFT_PAREN valueExpression (COMMA valueExpression)? RIGHT_PAREN
// Original: : (BTRIM | FUNCTION | RTRIM) LEFT_PAREN valueExpression (COMMA valueExpression)? PUNCTUATION_OPERATOR
: (CONTROL_FLOWBTRIMCONTROL_FLOW | CONTROL_FLOWFUNCTIONCONTROL_FLOW | CONTROL_FLOWRTRIMCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW (CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW)? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: normalizeCharacterString
CONTROL_FLOWnormalizeCharacterStringCONTROL_FLOW
// Original: : NORMALIZE LEFT_PAREN valueExpression (COMMA normalForm)? RIGHT_PAREN
// Original: : NORMALIZE LEFT_PAREN valueExpression (COMMA normalForm)? PUNCTUATION_OPERATOR
: CONTROL_FLOWNORMALIZECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW (CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWnormalFormCONTROL_FLOW)? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: nodeReferenceValueExpression
CONTROL_FLOWnodeReferenceValueExpressionCONTROL_FLOW
// Original: : valueExpressionPrimary
: CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW
;

// Original: edgeReferenceValueExpression
CONTROL_FLOWedgeReferenceValueExpressionCONTROL_FLOW
// Original: : valueExpressionPrimary
: CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW
;

// Original: aggregatingValueExpression
CONTROL_FLOWaggregatingValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.2 <value expression primary>

// Original: valueExpressionPrimary
CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW
// Original: : parenthesizedValueExpression
: CONTROL_FLOWparenthesizedValueExpressionCONTROL_FLOW
// Original: | aggregateFunction
| CONTROL_FLOWaggregateFunctionCONTROL_FLOW
// Original: | unsignedValueSpecification
| CONTROL_FLOWunsignedValueSpecificationCONTROL_FLOW
// Original: // List and Record literals are reduntantly/abiguously part of the literal production
// CONTROL_FLOWListCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWRecordCONTROL_FLOW CONTROL_FLOWliteralsCONTROL_FLOW CONTROL_FLOWareCONTROL_FLOW CONTROL_FLOWreduntantlyCONTROL_FLOW/CONTROL_FLOWabiguouslyCONTROL_FLOW CONTROL_FLOWpartCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWliteralCONTROL_FLOW CONTROL_FLOWproductionCONTROL_FLOW
// Original: //    | listValueConstructor
//    | CONTROL_FLOWlistValueConstructorCONTROL_FLOW
// Original: //    | recordConstructor
//    | CONTROL_FLOWrecordConstructorCONTROL_FLOW
// Original: | pathValueConstructor
| CONTROL_FLOWpathValueConstructorCONTROL_FLOW
// Original: | valueExpressionPrimary PERIOD propertyName      // <propertyReference
| CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW CONTROL_FLOWPERIODCONTROL_FLOW CONTROL_FLOWpropertyNameCONTROL_FLOW      // <CONTROL_FLOWpropertyReferenceCONTROL_FLOW
// Original: | valueQueryExpression
| CONTROL_FLOWvalueQueryExpressionCONTROL_FLOW
// Original: | caseExpression
| CONTROL_FLOWcaseExpressionCONTROL_FLOW
// Original: | castSpecification
| CONTROL_FLOWcastSpecificationCONTROL_FLOW
// Original: | element_idFunction
| CONTROL_FLOWelement_idFunctionCONTROL_FLOW
// Original: | letValueExpression
| CONTROL_FLOWletValueExpressionCONTROL_FLOW
// Original: | bindingVariableReference
| CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
;

// Original: parenthesizedValueExpression
CONTROL_FLOWparenthesizedValueExpressionCONTROL_FLOW
// Original: : LEFT_PAREN valueExpression RIGHT_PAREN
// Original: : LEFT_PAREN valueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: nonParenthesizedValueExpressionPrimary
CONTROL_FLOWnonParenthesizedValueExpressionPrimaryCONTROL_FLOW
// Original: : nonParenthesizedValueExpressionPrimarySpecialCase
: CONTROL_FLOWnonParenthesizedValueExpressionPrimarySpecialCaseCONTROL_FLOW
// Original: | bindingVariableReference
| CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
;

// Original: nonParenthesizedValueExpressionPrimarySpecialCase
CONTROL_FLOWnonParenthesizedValueExpressionPrimarySpecialCaseCONTROL_FLOW
// Original: : aggregateFunction
: CONTROL_FLOWaggregateFunctionCONTROL_FLOW
// Original: | unsignedValueSpecification
| CONTROL_FLOWunsignedValueSpecificationCONTROL_FLOW
// Original: // List and Record literals are reduntantly/abiguously part of the literal production
// CONTROL_FLOWListCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWRecordCONTROL_FLOW CONTROL_FLOWliteralsCONTROL_FLOW CONTROL_FLOWareCONTROL_FLOW CONTROL_FLOWreduntantlyCONTROL_FLOW/CONTROL_FLOWabiguouslyCONTROL_FLOW CONTROL_FLOWpartCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW CONTROL_FLOWtheCONTROL_FLOW CONTROL_FLOWliteralCONTROL_FLOW CONTROL_FLOWproductionCONTROL_FLOW
// Original: //    | listValueConstructor
//    | CONTROL_FLOWlistValueConstructorCONTROL_FLOW
// Original: //    | recordConstructor
//    | CONTROL_FLOWrecordConstructorCONTROL_FLOW
// Original: | pathValueConstructor
| CONTROL_FLOWpathValueConstructorCONTROL_FLOW
// Original: | valueExpressionPrimary PERIOD propertyName      // <property reference>
| valueExpressionPrimary PUNCTUATION_OPERATOR propertyName      // <property reference>
// Original: | valueQueryExpression
| CONTROL_FLOWvalueQueryExpressionCONTROL_FLOW
// Original: | caseExpression
| CONTROL_FLOWcaseExpressionCONTROL_FLOW
// Original: | castSpecification
| CONTROL_FLOWcastSpecificationCONTROL_FLOW
// Original: | element_idFunction
| CONTROL_FLOWelement_idFunctionCONTROL_FLOW
// Original: | letValueExpression
| CONTROL_FLOWletValueExpressionCONTROL_FLOW
;

// 20.3 <value specification>

// Original: unsignedValueSpecification
CONTROL_FLOWunsignedValueSpecificationCONTROL_FLOW
// Original: : unsignedLiteral
: CONTROL_FLOWunsignedLiteralCONTROL_FLOW
// Original: | generalValueSpecification
| CONTROL_FLOWgeneralValueSpecificationCONTROL_FLOW
;

// Original: nonNegativeIntegerSpecification
CONTROL_FLOWnonNegativeIntegerSpecificationCONTROL_FLOW
// Original: : unsignedInteger
: CONTROL_FLOWunsignedIntegerCONTROL_FLOW
// Original: | dynamicParameterSpecification
| CONTROL_FLOWdynamicParameterSpecificationCONTROL_FLOW
;

// Original: generalValueSpecification
CONTROL_FLOWgeneralValueSpecificationCONTROL_FLOW
// Original: : dynamicParameterSpecification
: CONTROL_FLOWdynamicParameterSpecificationCONTROL_FLOW
// Original: | SESSION_USER
| CONTROL_FLOWSESSION_USERCONTROL_FLOW
;

// 20.4 <dynamic parameter specification>

// Original: dynamicParameterSpecification
CONTROL_FLOWdynamicParameterSpecificationCONTROL_FLOW
// Original: : GENERAL_PARAMETER_REFERENCE
: CONTROL_FLOWGENERAL_PARAMETER_REFERENCECONTROL_FLOW
;

// 20.5 <let value expression>

// Original: letValueExpression
CONTROL_FLOWletValueExpressionCONTROL_FLOW
// Original: : LET letVariableDefinitionList IN valueExpression END
: CONTROL_FLOWLETCONTROL_FLOW CONTROL_FLOWletVariableDefinitionListCONTROL_FLOW CONTROL_FLOWINCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWENDCONTROL_FLOW
;

// 20.6 <value query expression>

// Original: valueQueryExpression
CONTROL_FLOWvalueQueryExpressionCONTROL_FLOW
// Original: : VALUE nestedQuerySpecification
: CONTROL_FLOWVALUECONTROL_FLOW CONTROL_FLOWnestedQuerySpecificationCONTROL_FLOW
;

// 20.7 <case expression>

// Original: caseExpression
CONTROL_FLOWcaseExpressionCONTROL_FLOW
// Original: : caseAbbreviation
: CONTROL_FLOWcaseAbbreviationCONTROL_FLOW
// Original: | caseSpecification
| CONTROL_FLOWcaseSpecificationCONTROL_FLOW
;

// Original: caseAbbreviation
CONTROL_FLOWcaseAbbreviationCONTROL_FLOW
// Original: : NULLIF LEFT_PAREN valueExpression COMMA valueExpression RIGHT_PAREN
// Original: : NULLIF LEFT_PAREN valueExpression COMMA valueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWNULLIFCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | COALESCE LEFT_PAREN valueExpression (COMMA valueExpression)+ RIGHT_PAREN
// Original: | COALESCE LEFT_PAREN valueExpression (COMMA valueExpression)+ PUNCTUATION_OPERATOR
| CONTROL_FLOWCOALESCECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW (CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW)+ CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: caseSpecification
CONTROL_FLOWcaseSpecificationCONTROL_FLOW
// Original: : simpleCase
: CONTROL_FLOWsimpleCaseCONTROL_FLOW
// Original: | searchedCase
| CONTROL_FLOWsearchedCaseCONTROL_FLOW
;

// Original: simpleCase
CONTROL_FLOWsimpleCaseCONTROL_FLOW
// Original: : CASE caseOperand simpleWhenClause+ elseClause? END
: CONTROL_FLOWCASECONTROL_FLOW CONTROL_FLOWcaseOperandCONTROL_FLOW CONTROL_FLOWsimpleWhenClauseCONTROL_FLOW+ CONTROL_FLOWelseClauseCONTROL_FLOW? CONTROL_FLOWENDCONTROL_FLOW
;

// Original: searchedCase
CONTROL_FLOWsearchedCaseCONTROL_FLOW
// Original: : CASE searchedWhenClause+ elseClause? END
: CONTROL_FLOWCASECONTROL_FLOW CONTROL_FLOWsearchedWhenClauseCONTROL_FLOW+ CONTROL_FLOWelseClauseCONTROL_FLOW? CONTROL_FLOWENDCONTROL_FLOW
;

// Original: simpleWhenClause
CONTROL_FLOWsimpleWhenClauseCONTROL_FLOW
// Original: : WHEN whenOperandList THEN result
// Original: : WHEN whenOperandList CONTROL_FLOW result
: CONTROL_FLOWWHENCONTROL_FLOW CONTROL_FLOWwhenOperandListCONTROL_FLOW CONTROL_FLOWCONTROL_FLOWCONTROL_FLOW CONTROL_FLOWresultCONTROL_FLOW
;

// Original: searchedWhenClause
CONTROL_FLOWsearchedWhenClauseCONTROL_FLOW
// Original: : WHEN searchCondition THEN result
// Original: : WHEN searchCondition CONTROL_FLOW result
: CONTROL_FLOWWHENCONTROL_FLOW CONTROL_FLOWsearchConditionCONTROL_FLOW CONTROL_FLOWCONTROL_FLOWCONTROL_FLOW CONTROL_FLOWresultCONTROL_FLOW
;

// Original: elseClause
CONTROL_FLOWelseClauseCONTROL_FLOW
// Original: : ELSE result
: CONTROL_FLOWELSECONTROL_FLOW CONTROL_FLOWresultCONTROL_FLOW
;

// Original: caseOperand
CONTROL_FLOWcaseOperandCONTROL_FLOW
// Original: : nonParenthesizedValueExpressionPrimary
: CONTROL_FLOWnonParenthesizedValueExpressionPrimaryCONTROL_FLOW
// Original: | elementVariableReference
| CONTROL_FLOWelementVariableReferenceCONTROL_FLOW
;

// Original: whenOperandList
CONTROL_FLOWwhenOperandListCONTROL_FLOW
// Original: : whenOperand (COMMA whenOperand)*
: whenOperand (PUNCTUATION_OPERATOR whenOperand)*
;

// Original: whenOperand
CONTROL_FLOWwhenOperandCONTROL_FLOW
// Original: : nonParenthesizedValueExpressionPrimary
: CONTROL_FLOWnonParenthesizedValueExpressionPrimaryCONTROL_FLOW
// Original: | comparisonPredicatePart2
| CONTROL_FLOWcomparisonPredicatePart2CONTROL_FLOW
// Original: | nullPredicatePart2
| CONTROL_FLOWnullPredicatePart2CONTROL_FLOW
// Original: | valueTypePredicatePart2
| CONTROL_FLOWvalueTypePredicatePart2CONTROL_FLOW
// Original: | normalizedPredicatePart2
| CONTROL_FLOWnormalizedPredicatePart2CONTROL_FLOW
// Original: | directedPredicatePart2
| CONTROL_FLOWdirectedPredicatePart2CONTROL_FLOW
// Original: | labeledPredicatePart2
| CONTROL_FLOWlabeledPredicatePart2CONTROL_FLOW
// Original: | sourcePredicatePart2
| CONTROL_FLOWsourcePredicatePart2CONTROL_FLOW
// Original: | destinationPredicatePart2
| CONTROL_FLOWdestinationPredicatePart2CONTROL_FLOW
;

// Original: result
CONTROL_FLOWresultCONTROL_FLOW
// Original: : resultExpression
: CONTROL_FLOWresultExpressionCONTROL_FLOW
// Original: | nullLiteral
| CONTROL_FLOWnullLiteralCONTROL_FLOW
;

// Original: resultExpression
CONTROL_FLOWresultExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.8 <cast specification>

// Original: castSpecification
CONTROL_FLOWcastSpecificationCONTROL_FLOW
// Original: : CAST LEFT_PAREN castOperand AS castTarget RIGHT_PAREN
// Original: : CAST LEFT_PAREN castOperand KEYWORD castTarget RIGHT_PAREN
// Original: : CAST LEFT_PAREN castOperand KEYWORD castTarget PUNCTUATION_OPERATOR
: CONTROL_FLOWCASTCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWcastOperandCONTROL_FLOW CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWcastTargetCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: castOperand
CONTROL_FLOWcastOperandCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
// Original: | nullLiteral
| CONTROL_FLOWnullLiteralCONTROL_FLOW
;

// Original: castTarget
CONTROL_FLOWcastTargetCONTROL_FLOW
// Original: : valueType
: CONTROL_FLOWvalueTypeCONTROL_FLOW
;

// 20.9 <aggregate function>

// Original: aggregateFunction
CONTROL_FLOWaggregateFunctionCONTROL_FLOW
// Original: : COUNT LEFT_PAREN ASTERISK RIGHT_PAREN
// Original: : COUNT LEFT_PAREN ASTERISK PUNCTUATION_OPERATOR
: CONTROL_FLOWCOUNTCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWASTERISKCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | generalSetFunction
| CONTROL_FLOWgeneralSetFunctionCONTROL_FLOW
// Original: | binarySetFunction
| CONTROL_FLOWbinarySetFunctionCONTROL_FLOW
;

// Original: generalSetFunction
CONTROL_FLOWgeneralSetFunctionCONTROL_FLOW
// Original: : generalSetFunctionType LEFT_PAREN setQuantifier? valueExpression RIGHT_PAREN
// Original: : generalSetFunctionType LEFT_PAREN setQuantifier? valueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWgeneralSetFunctionTypeCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWsetQuantifierCONTROL_FLOW? CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: binarySetFunction
CONTROL_FLOWbinarySetFunctionCONTROL_FLOW
// Original: : binarySetFunctionType LEFT_PAREN dependentValueExpression COMMA independentValueExpression RIGHT_PAREN
// Original: : binarySetFunctionType LEFT_PAREN dependentValueExpression COMMA independentValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWbinarySetFunctionTypeCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdependentValueExpressionCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWindependentValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: generalSetFunctionType
CONTROL_FLOWgeneralSetFunctionTypeCONTROL_FLOW
// Original: : AVG
: CONTROL_FLOWAVGCONTROL_FLOW
// Original: | COUNT
| CONTROL_FLOWCOUNTCONTROL_FLOW
// Original: | MAX
| CONTROL_FLOWMAXCONTROL_FLOW
// Original: | MIN
// Original: | DATA_TYPE
| CONTROL_FLOWDATA_TYPECONTROL_FLOW
// Original: | SUM
// Original: | FUNCTION
| CONTROL_FLOWFUNCTIONCONTROL_FLOW
// Original: | COLLECT_LIST
| CONTROL_FLOWCOLLECT_LISTCONTROL_FLOW
// Original: | STDDEV_SAMP
| CONTROL_FLOWSTDDEV_SAMPCONTROL_FLOW
// Original: | STDDEV_POP
// Original: | FUNCTION
| CONTROL_FLOWFUNCTIONCONTROL_FLOW
;

// Original: setQuantifier
CONTROL_FLOWsetQuantifierCONTROL_FLOW
// Original: : DISTINCT
: CONTROL_FLOWDISTINCTCONTROL_FLOW
// Original: | ALL
| CONTROL_FLOWALLCONTROL_FLOW
;

// Original: binarySetFunctionType
CONTROL_FLOWbinarySetFunctionTypeCONTROL_FLOW
// Original: : PERCENTILE_CONT
: CONTROL_FLOWPERCENTILE_CONTCONTROL_FLOW
// Original: | PERCENTILE_DISC
| CONTROL_FLOWPERCENTILE_DISCCONTROL_FLOW
;

// Original: dependentValueExpression
CONTROL_FLOWdependentValueExpressionCONTROL_FLOW
// Original: : setQuantifier? numericValueExpression
: CONTROL_FLOWsetQuantifierCONTROL_FLOW? CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: independentValueExpression
CONTROL_FLOWindependentValueExpressionCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// 20.10 <element_id function>

// Original: element_idFunction
CONTROL_FLOWelement_idFunctionCONTROL_FLOW
// Original: : ELEMENT_ID LEFT_PAREN elementVariableReference RIGHT_PAREN
// Original: : ELEMENT_ID LEFT_PAREN elementVariableReference PUNCTUATION_OPERATOR
// Original: : DATA_TYPE LEFT_PAREN elementVariableReference PUNCTUATION_OPERATOR
: CONTROL_FLOWDATA_TYPECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWelementVariableReferenceCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 20.11 <property reference>

// 20.12 <binding variable reference>

// Original: bindingVariableReference
CONTROL_FLOWbindingVariableReferenceCONTROL_FLOW
// Original: : bindingVariable
: CONTROL_FLOWbindingVariableCONTROL_FLOW
;

// The path value expression was combined with list and string value expressions.
// See listStringOrPathValueExpression.

// Original: pathValueExpression
CONTROL_FLOWpathValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.14 <path value constructor>

// Original: pathValueConstructor
CONTROL_FLOWpathValueConstructorCONTROL_FLOW
// Original: : pathValueConstructorByEnumeration
: CONTROL_FLOWpathValueConstructorByEnumerationCONTROL_FLOW
;

// Original: pathValueConstructorByEnumeration
CONTROL_FLOWpathValueConstructorByEnumerationCONTROL_FLOW
// Original: : PATH LEFT_BRACKET pathElementList RIGHT_BRACKET
// Original: : KEYWORD LEFT_BRACKET pathElementList RIGHT_BRACKET
// Original: : KEYWORD PUNCTUATION_OPERATOR pathElementList RIGHT_BRACKET
: CONTROL_FLOWKEYWORDCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWpathElementListCONTROL_FLOW CONTROL_FLOWRIGHT_BRACKETCONTROL_FLOW
;

// Original: pathElementList
CONTROL_FLOWpathElementListCONTROL_FLOW
: pathElementListStart pathElementListStep*
;

// Original: pathElementListStart
CONTROL_FLOWpathElementListStartCONTROL_FLOW
// Original: : nodeReferenceValueExpression
: CONTROL_FLOWnodeReferenceValueExpressionCONTROL_FLOW
;

// Original: pathElementListStep
CONTROL_FLOWpathElementListStepCONTROL_FLOW
// Original: : COMMA edgeReferenceValueExpression COMMA nodeReferenceValueExpression
: CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWedgeReferenceValueExpressionCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWnodeReferenceValueExpressionCONTROL_FLOW
;

// 20.15 <list value expression>

// The list value expression was combined with path and string value expressions.
// See listStringOrPathValueExpression.

// Original: listValueExpression
CONTROL_FLOWlistValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.16 <list value function>

// Original: // Note: ByteString functions were moved to characterByteStringOrListFunction, some alternatives
// CONTROL_FLOWNoteCONTROL_FLOW: CONTROL_FLOWByteStringCONTROL_FLOW CONTROL_FLOWfunctionsCONTROL_FLOW CONTROL_FLOWwereCONTROL_FLOW CONTROL_FLOWmovedCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterByteStringOrListFunctionCONTROL_FLOW, CONTROL_FLOWsomeCONTROL_FLOW CONTROL_FLOWalternativesCONTROL_FLOW
// Original: // apply to characterString, byteString and list. Breaking them out separately resulted in
// CONTROL_FLOWapplyCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterStringCONTROL_FLOW, CONTROL_FLOWbyteStringCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWlistCONTROL_FLOW. CONTROL_FLOWBreakingCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW CONTROL_FLOWoutCONTROL_FLOW CONTROL_FLOWseparatelyCONTROL_FLOW CONTROL_FLOWresultedCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW
// ambiguity.

// Original: listValueFunction
CONTROL_FLOWlistValueFunctionCONTROL_FLOW
// Original: : trimListFunction
: CONTROL_FLOWtrimListFunctionCONTROL_FLOW
// Original: | elementsFunction
| CONTROL_FLOWelementsFunctionCONTROL_FLOW
;

// Original: trimListFunction
CONTROL_FLOWtrimListFunctionCONTROL_FLOW
// Original: : TRIM LEFT_PAREN listValueExpression COMMA numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN listValueExpression COMMA numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN listValueExpression COMMA numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWlistValueExpressionCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: elementsFunction
CONTROL_FLOWelementsFunctionCONTROL_FLOW
// Original: : ELEMENTS LEFT_PAREN pathValueExpression RIGHT_PAREN
// Original: : ELEMENTS LEFT_PAREN pathValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWELEMENTSCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWpathValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 20.17 <list value constructor>

// Original: listValueConstructor
CONTROL_FLOWlistValueConstructorCONTROL_FLOW
// Original: : listValueConstructorByEnumeration
: CONTROL_FLOWlistValueConstructorByEnumerationCONTROL_FLOW
;

// Original: listValueConstructorByEnumeration
CONTROL_FLOWlistValueConstructorByEnumerationCONTROL_FLOW
// Original: : listValueTypeName? LEFT_BRACKET listElementList? RIGHT_BRACKET
// Original: : listValueTypeName? PUNCTUATION_OPERATOR listElementList? RIGHT_BRACKET
: CONTROL_FLOWlistValueTypeNameCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWlistElementListCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACKETCONTROL_FLOW
;

// Original: listElementList
CONTROL_FLOWlistElementListCONTROL_FLOW
// Original: : listElement (COMMA listElement)*
: listElement (PUNCTUATION_OPERATOR listElement)*
;

// Original: listElement
CONTROL_FLOWlistElementCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.18 <record constructor>

// Original: recordConstructor
CONTROL_FLOWrecordConstructorCONTROL_FLOW
// Original: : RECORD? fieldsSpecification
: CONTROL_FLOWRECORDCONTROL_FLOW? CONTROL_FLOWfieldsSpecificationCONTROL_FLOW
;

// Original: fieldsSpecification
CONTROL_FLOWfieldsSpecificationCONTROL_FLOW
// Original: : LEFT_BRACE fieldList? RIGHT_BRACE
: CONTROL_FLOWLEFT_BRACECONTROL_FLOW CONTROL_FLOWfieldListCONTROL_FLOW? CONTROL_FLOWRIGHT_BRACECONTROL_FLOW
;

// Original: fieldList
CONTROL_FLOWfieldListCONTROL_FLOW
// Original: : field (COMMA field)*
: field (PUNCTUATION_OPERATOR field)*
;

// 20.19 <field>

// Original: field
CONTROL_FLOWfieldCONTROL_FLOW
// Original: : fieldName COLON valueExpression
: CONTROL_FLOWfieldNameCONTROL_FLOW CONTROL_FLOWCOLONCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.20 <boolean value expression>

// Original: // Most of <boolean value expression> is incorporated in valueExpression
// CONTROL_FLOWMostCONTROL_FLOW CONTROL_FLOWofCONTROL_FLOW <CONTROL_FLOWbooleanCONTROL_FLOW CONTROL_FLOWvalueCONTROL_FLOW CONTROL_FLOWexpressionCONTROL_FLOW> CONTROL_FLOWisCONTROL_FLOW CONTROL_FLOWincorporatedCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW

// Original: truthValue
CONTROL_FLOWtruthValueCONTROL_FLOW
// Original: : BOOLEAN_LITERAL
: CONTROL_FLOWBOOLEAN_LITERALCONTROL_FLOW
;

// 20.21 <numeric value expression>

// Original: numericValueExpression
CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
// Original: : sign = (PLUS_SIGN | MINUS_SIGN) numericValueExpression
: CONTROL_FLOWsignCONTROL_FLOW = (CONTROL_FLOWPLUS_SIGNCONTROL_FLOW | CONTROL_FLOWMINUS_SIGNCONTROL_FLOW) CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
// Original: | numericValueExpression operator = (ASTERISK | SOLIDUS) numericValueExpression
| CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWoperatorCONTROL_FLOW = (CONTROL_FLOWASTERISKCONTROL_FLOW | CONTROL_FLOWSOLIDUSCONTROL_FLOW) CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
// Original: | numericValueExpression operator = (PLUS_SIGN | MINUS_SIGN) numericValueExpression
| CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWoperatorCONTROL_FLOW = (CONTROL_FLOWPLUS_SIGNCONTROL_FLOW | CONTROL_FLOWMINUS_SIGNCONTROL_FLOW) CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
// Original: | valueExpressionPrimary
| CONTROL_FLOWvalueExpressionPrimaryCONTROL_FLOW
// Original: | numericValueFunction
| CONTROL_FLOWnumericValueFunctionCONTROL_FLOW
;

// 20.22 <numeric value function>

// Original: numericValueFunction
CONTROL_FLOWnumericValueFunctionCONTROL_FLOW
// Original: : lengthExpression
: CONTROL_FLOWlengthExpressionCONTROL_FLOW
// Original: | cardinalityExpression
| CONTROL_FLOWcardinalityExpressionCONTROL_FLOW
// Original: | absoluteValueExpression
| CONTROL_FLOWabsoluteValueExpressionCONTROL_FLOW
// Original: | modulusExpression
| CONTROL_FLOWmodulusExpressionCONTROL_FLOW
// Original: | trigonometricFunction
| CONTROL_FLOWtrigonometricFunctionCONTROL_FLOW
// Original: | generalLogarithmFunction
| CONTROL_FLOWgeneralLogarithmFunctionCONTROL_FLOW
// Original: | commonLogarithm
| CONTROL_FLOWcommonLogarithmCONTROL_FLOW
// Original: | naturalLogarithm
| CONTROL_FLOWnaturalLogarithmCONTROL_FLOW
// Original: | exponentialFunction
| CONTROL_FLOWexponentialFunctionCONTROL_FLOW
// Original: | powerFunction
| CONTROL_FLOWpowerFunctionCONTROL_FLOW
// Original: | squareRoot
| CONTROL_FLOWsquareRootCONTROL_FLOW
// Original: | floorFunction
| CONTROL_FLOWfloorFunctionCONTROL_FLOW
// Original: | ceilingFunction
| CONTROL_FLOWceilingFunctionCONTROL_FLOW
;

// Original: lengthExpression
CONTROL_FLOWlengthExpressionCONTROL_FLOW
// Original: : charLengthExpression
: CONTROL_FLOWcharLengthExpressionCONTROL_FLOW
// Original: | byteLengthExpression
| CONTROL_FLOWbyteLengthExpressionCONTROL_FLOW
// Original: | pathLengthExpression
| CONTROL_FLOWpathLengthExpressionCONTROL_FLOW
;

// Original: cardinalityExpression
CONTROL_FLOWcardinalityExpressionCONTROL_FLOW
// Original: : CARDINALITY LEFT_PAREN cardinalityExpressionArgument RIGHT_PAREN
// Original: : CARDINALITY LEFT_PAREN cardinalityExpressionArgument PUNCTUATION_OPERATOR
: CONTROL_FLOWCARDINALITYCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWcardinalityExpressionArgumentCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
// Original: | SIZE LEFT_PAREN listValueExpression RIGHT_PAREN
// Original: | DATA_TYPE LEFT_PAREN listValueExpression RIGHT_PAREN
// Original: | DATA_TYPE LEFT_PAREN listValueExpression PUNCTUATION_OPERATOR
| CONTROL_FLOWDATA_TYPECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWlistValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: cardinalityExpressionArgument
CONTROL_FLOWcardinalityExpressionArgumentCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: charLengthExpression
CONTROL_FLOWcharLengthExpressionCONTROL_FLOW
// Original: : (CHAR_LENGTH | CHARACTER_LENGTH) LEFT_PAREN characterStringValueExpression RIGHT_PAREN
// Original: : (CHAR_LENGTH | CHARACTER_LENGTH) LEFT_PAREN characterStringValueExpression PUNCTUATION_OPERATOR
: (CONTROL_FLOWCHAR_LENGTHCONTROL_FLOW | CONTROL_FLOWCHARACTER_LENGTHCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWcharacterStringValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: byteLengthExpression
CONTROL_FLOWbyteLengthExpressionCONTROL_FLOW
// Original: : (BYTE_LENGTH | OCTET_LENGTH) LEFT_PAREN byteStringValueExpression RIGHT_PAREN
// Original: : (DATA_TYPE | OCTET_LENGTH) LEFT_PAREN byteStringValueExpression RIGHT_PAREN
// Original: : (DATA_TYPE | OCTET_LENGTH) LEFT_PAREN byteStringValueExpression PUNCTUATION_OPERATOR
// Original: : (DATA_TYPE | FUNCTION) LEFT_PAREN byteStringValueExpression PUNCTUATION_OPERATOR
: (CONTROL_FLOWDATA_TYPECONTROL_FLOW | CONTROL_FLOWFUNCTIONCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWbyteStringValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: pathLengthExpression
CONTROL_FLOWpathLengthExpressionCONTROL_FLOW
// Original: : PATH_LENGTH LEFT_PAREN pathValueExpression RIGHT_PAREN
// Original: : PATH_LENGTH LEFT_PAREN pathValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWPATH_LENGTHCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWpathValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// absoluteValueExpression applies to both numeric types and duration types. They have the same syntax.
// Original: absoluteValueExpression
CONTROL_FLOWabsoluteValueExpressionCONTROL_FLOW
// Original: : ABS LEFT_PAREN valueExpression RIGHT_PAREN
// Original: : ABS LEFT_PAREN valueExpression PUNCTUATION_OPERATOR
// Original: : FUNCTION LEFT_PAREN valueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWvalueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: modulusExpression
CONTROL_FLOWmodulusExpressionCONTROL_FLOW
// Original: : MOD LEFT_PAREN numericValueExpressionDividend COMMA numericValueExpressionDivisor RIGHT_PAREN
// Original: : MOD LEFT_PAREN numericValueExpressionDividend COMMA numericValueExpressionDivisor PUNCTUATION_OPERATOR
: CONTROL_FLOWMODCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionDividendCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWnumericValueExpressionDivisorCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: numericValueExpressionDividend
CONTROL_FLOWnumericValueExpressionDividendCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: numericValueExpressionDivisor
CONTROL_FLOWnumericValueExpressionDivisorCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: trigonometricFunction
CONTROL_FLOWtrigonometricFunctionCONTROL_FLOW
// Original: : trigonometricFunctionName LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : trigonometricFunctionName LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWtrigonometricFunctionNameCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: trigonometricFunctionName
CONTROL_FLOWtrigonometricFunctionNameCONTROL_FLOW
// Original: : SIN
: CONTROL_FLOWSINCONTROL_FLOW
// Original: | COS
| CONTROL_FLOWCOSCONTROL_FLOW
// Original: | TAN
| CONTROL_FLOWTANCONTROL_FLOW
// Original: | COT
| CONTROL_FLOWCOTCONTROL_FLOW
// Original: | SINH
| CONTROL_FLOWSINHCONTROL_FLOW
// Original: | COSH
| CONTROL_FLOWCOSHCONTROL_FLOW
// Original: | TANH
| CONTROL_FLOWTANHCONTROL_FLOW
// Original: | ASIN
| CONTROL_FLOWASINCONTROL_FLOW
// Original: | ACOS
| CONTROL_FLOWACOSCONTROL_FLOW
// Original: | ATAN
| CONTROL_FLOWATANCONTROL_FLOW
// Original: | DEGREES
| CONTROL_FLOWDEGREESCONTROL_FLOW
// Original: | RADIANS
| CONTROL_FLOWRADIANSCONTROL_FLOW
;

// Original: generalLogarithmFunction
CONTROL_FLOWgeneralLogarithmFunctionCONTROL_FLOW
// Original: : LOG LEFT_PAREN generalLogarithmBase COMMA generalLogarithmArgument RIGHT_PAREN
// Original: : LOG LEFT_PAREN generalLogarithmBase COMMA generalLogarithmArgument PUNCTUATION_OPERATOR
: CONTROL_FLOWLOGCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWgeneralLogarithmBaseCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWgeneralLogarithmArgumentCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: generalLogarithmBase
CONTROL_FLOWgeneralLogarithmBaseCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: generalLogarithmArgument
CONTROL_FLOWgeneralLogarithmArgumentCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: commonLogarithm
CONTROL_FLOWcommonLogarithmCONTROL_FLOW
// Original: : LOG10 LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: naturalLogarithm
CONTROL_FLOWnaturalLogarithmCONTROL_FLOW
// Original: : LN LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : LN LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWLNCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: exponentialFunction
CONTROL_FLOWexponentialFunctionCONTROL_FLOW
// Original: : EXP LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : EXP LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWEXPCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: powerFunction
CONTROL_FLOWpowerFunctionCONTROL_FLOW
// Original: : POWER LEFT_PAREN numericValueExpressionBase COMMA numericValueExpressionExponent RIGHT_PAREN
// Original: : POWER LEFT_PAREN numericValueExpressionBase COMMA numericValueExpressionExponent PUNCTUATION_OPERATOR
// Original: : FUNCTION LEFT_PAREN numericValueExpressionBase COMMA numericValueExpressionExponent PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionBaseCONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWnumericValueExpressionExponentCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: numericValueExpressionBase
CONTROL_FLOWnumericValueExpressionBaseCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: numericValueExpressionExponent
CONTROL_FLOWnumericValueExpressionExponentCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// Original: squareRoot
CONTROL_FLOWsquareRootCONTROL_FLOW
// Original: : SQRT LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : SQRT LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWSQRTCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: floorFunction
CONTROL_FLOWfloorFunctionCONTROL_FLOW
// Original: : FLOOR LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : FUNCTION LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: CONTROL_FLOWFUNCTIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: ceilingFunction
CONTROL_FLOWceilingFunctionCONTROL_FLOW
// Original: : (CEIL | CEILING) LEFT_PAREN numericValueExpression RIGHT_PAREN
// Original: : (CEIL | CEILING) LEFT_PAREN numericValueExpression PUNCTUATION_OPERATOR
: (CONTROL_FLOWCEILCONTROL_FLOW | CONTROL_FLOWCEILINGCONTROL_FLOW) CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWnumericValueExpressionCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// 20.23 <string value expression>

// The string value expressions were combined with list and path value expressions.

// Original: characterStringValueExpression
CONTROL_FLOWcharacterStringValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: byteStringValueExpression
CONTROL_FLOWbyteStringValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.24 <string value function>

// Original: // Note: String functions were moved to characterByteStringOrListFunction, some alternatives
// CONTROL_FLOWNoteCONTROL_FLOW: CONTROL_FLOWStringCONTROL_FLOW CONTROL_FLOWfunctionsCONTROL_FLOW CONTROL_FLOWwereCONTROL_FLOW CONTROL_FLOWmovedCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterByteStringOrListFunctionCONTROL_FLOW, CONTROL_FLOWsomeCONTROL_FLOW CONTROL_FLOWalternativesCONTROL_FLOW
// Original: // apply to characterString, byteString and list. Breaking them out separately resulted in
// CONTROL_FLOWapplyCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterStringCONTROL_FLOW, CONTROL_FLOWbyteStringCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWlistCONTROL_FLOW. CONTROL_FLOWBreakingCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW CONTROL_FLOWoutCONTROL_FLOW CONTROL_FLOWseparatelyCONTROL_FLOW CONTROL_FLOWresultedCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW
// ambiguity.

// Original: trimOperands
CONTROL_FLOWtrimOperandsCONTROL_FLOW
// Original: : (trimSpecification? trimCharacterOrByteString? FROM)? trimCharacterOrByteStringSource
: (CONTROL_FLOWtrimSpecificationCONTROL_FLOW? CONTROL_FLOWtrimCharacterOrByteStringCONTROL_FLOW? CONTROL_FLOWFROMCONTROL_FLOW)? CONTROL_FLOWtrimCharacterOrByteStringSourceCONTROL_FLOW
;

// Original: trimCharacterOrByteStringSource
CONTROL_FLOWtrimCharacterOrByteStringSourceCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: trimSpecification
CONTROL_FLOWtrimSpecificationCONTROL_FLOW
// Original: : LEADING
: CONTROL_FLOWLEADINGCONTROL_FLOW
// Original: | TRAILING
| CONTROL_FLOWTRAILINGCONTROL_FLOW
// Original: | BOTH
| CONTROL_FLOWBOTHCONTROL_FLOW
;

// Original: trimCharacterOrByteString
CONTROL_FLOWtrimCharacterOrByteStringCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: normalForm
CONTROL_FLOWnormalFormCONTROL_FLOW
// Original: : NFC
: CONTROL_FLOWNFCCONTROL_FLOW
// Original: | NFD
| CONTROL_FLOWNFDCONTROL_FLOW
// Original: | NFKC
| CONTROL_FLOWNFKCCONTROL_FLOW
// Original: | NFKD
| CONTROL_FLOWNFKDCONTROL_FLOW
;

// Original: stringLength
CONTROL_FLOWstringLengthCONTROL_FLOW
// Original: : numericValueExpression
: CONTROL_FLOWnumericValueExpressionCONTROL_FLOW
;

// 20.25 <byte string function>

// Original: // Note: ByteString functions were moved to characterByteStringOrListFunction, some alternatives
// CONTROL_FLOWNoteCONTROL_FLOW: CONTROL_FLOWByteStringCONTROL_FLOW CONTROL_FLOWfunctionsCONTROL_FLOW CONTROL_FLOWwereCONTROL_FLOW CONTROL_FLOWmovedCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterByteStringOrListFunctionCONTROL_FLOW, CONTROL_FLOWsomeCONTROL_FLOW CONTROL_FLOWalternativesCONTROL_FLOW
// Original: // apply to characterString, byteString and list. Breaking them out separately resulted in
// CONTROL_FLOWapplyCONTROL_FLOW CONTROL_FLOWtoCONTROL_FLOW CONTROL_FLOWcharacterStringCONTROL_FLOW, CONTROL_FLOWbyteStringCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWlistCONTROL_FLOW. CONTROL_FLOWBreakingCONTROL_FLOW CONTROL_FLOWthemCONTROL_FLOW CONTROL_FLOWoutCONTROL_FLOW CONTROL_FLOWseparatelyCONTROL_FLOW CONTROL_FLOWresultedCONTROL_FLOW CONTROL_FLOWinCONTROL_FLOW
// ambiguity.

// 20.26 <datetime value expression>

// The implementation should enforce that the data type is a datetime value.
// Original: datetimeValueExpression
CONTROL_FLOWdatetimeValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// 20.27 <datetime value function>

// Original: datetimeValueFunction
CONTROL_FLOWdatetimeValueFunctionCONTROL_FLOW
// Original: : dateFunction
: CONTROL_FLOWdateFunctionCONTROL_FLOW
// Original: | timeFunction
| CONTROL_FLOWtimeFunctionCONTROL_FLOW
// Original: | datetimeFunction
| CONTROL_FLOWdatetimeFunctionCONTROL_FLOW
// Original: | localtimeFunction
| CONTROL_FLOWlocaltimeFunctionCONTROL_FLOW
// Original: | localdatetimeFunction
| CONTROL_FLOWlocaldatetimeFunctionCONTROL_FLOW
;

// Original: dateFunction
CONTROL_FLOWdateFunctionCONTROL_FLOW
// Original: : CURRENT_DATE
: CONTROL_FLOWCURRENT_DATECONTROL_FLOW
// Original: | DATE LEFT_PAREN dateFunctionParameters? RIGHT_PAREN
// Original: | DATE LEFT_PAREN dateFunctionParameters? PUNCTUATION_OPERATOR
| CONTROL_FLOWDATECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdateFunctionParametersCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: timeFunction
CONTROL_FLOWtimeFunctionCONTROL_FLOW
// Original: : CURRENT_TIME
: CONTROL_FLOWCURRENT_TIMECONTROL_FLOW
// Original: | ZONED_TIME LEFT_PAREN timeFunctionParameters? RIGHT_PAREN
// Original: | ZONED_TIME LEFT_PAREN timeFunctionParameters? PUNCTUATION_OPERATOR
| CONTROL_FLOWZONED_TIMECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWtimeFunctionParametersCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: localtimeFunction
CONTROL_FLOWlocaltimeFunctionCONTROL_FLOW
// Original: : LOCAL_TIME (LEFT_PAREN timeFunctionParameters? RIGHT_PAREN)?
// Original: : LOCAL_TIME (LEFT_PAREN timeFunctionParameters? PUNCTUATION_OPERATOR)?
: LOCAL_TIME (PUNCTUATION_OPERATOR timeFunctionParameters? PUNCTUATION_OPERATOR)?
;

// Original: datetimeFunction
CONTROL_FLOWdatetimeFunctionCONTROL_FLOW
// Original: : CURRENT_TIMESTAMP
: CONTROL_FLOWCURRENT_TIMESTAMPCONTROL_FLOW
// Original: | ZONED_DATETIME LEFT_PAREN datetimeFunctionParameters? RIGHT_PAREN
// Original: | ZONED_DATETIME LEFT_PAREN datetimeFunctionParameters? PUNCTUATION_OPERATOR
| CONTROL_FLOWZONED_DATETIMECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdatetimeFunctionParametersCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: localdatetimeFunction
CONTROL_FLOWlocaldatetimeFunctionCONTROL_FLOW
// Original: : LOCAL_TIMESTAMP
: CONTROL_FLOWLOCAL_TIMESTAMPCONTROL_FLOW
// Original: | LOCAL_DATETIME LEFT_PAREN datetimeFunctionParameters? RIGHT_PAREN
// Original: | LOCAL_DATETIME LEFT_PAREN datetimeFunctionParameters? PUNCTUATION_OPERATOR
| CONTROL_FLOWLOCAL_DATETIMECONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdatetimeFunctionParametersCONTROL_FLOW? CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: dateFunctionParameters
CONTROL_FLOWdateFunctionParametersCONTROL_FLOW
// Original: : dateString
: CONTROL_FLOWdateStringCONTROL_FLOW
// Original: | recordConstructor
| CONTROL_FLOWrecordConstructorCONTROL_FLOW
;

// Original: timeFunctionParameters
CONTROL_FLOWtimeFunctionParametersCONTROL_FLOW
// Original: : timeString
: CONTROL_FLOWtimeStringCONTROL_FLOW
// Original: | recordConstructor
| CONTROL_FLOWrecordConstructorCONTROL_FLOW
;

// Original: datetimeFunctionParameters
CONTROL_FLOWdatetimeFunctionParametersCONTROL_FLOW
// Original: : datetimeString
: CONTROL_FLOWdatetimeStringCONTROL_FLOW
// Original: | recordConstructor
| CONTROL_FLOWrecordConstructorCONTROL_FLOW
;

// 20.28 <duration value expression>

// The implemenation should enforce that the data type is a duration value.
// Original: durationValueExpression
CONTROL_FLOWdurationValueExpressionCONTROL_FLOW
// Original: : valueExpression
: CONTROL_FLOWvalueExpressionCONTROL_FLOW
;

// Original: datetimeSubtraction
CONTROL_FLOWdatetimeSubtractionCONTROL_FLOW
// Original: : DURATION_BETWEEN LEFT_PAREN datetimeSubtractionParameters RIGHT_PAREN temporalDurationQualifier?
// Original: : DURATION_BETWEEN LEFT_PAREN datetimeSubtractionParameters PUNCTUATION_OPERATOR temporalDurationQualifier?
// Original: : DATA_TYPE LEFT_PAREN datetimeSubtractionParameters PUNCTUATION_OPERATOR temporalDurationQualifier?
: DATA_TYPE PUNCTUATION_OPERATOR datetimeSubtractionParameters PUNCTUATION_OPERATOR temporalDurationQualifier?
;

// Original: datetimeSubtractionParameters
CONTROL_FLOWdatetimeSubtractionParametersCONTROL_FLOW
// Original: : datetimeValueExpression1 COMMA datetimeValueExpression2
: CONTROL_FLOWdatetimeValueExpression1CONTROL_FLOW CONTROL_FLOWCOMMACONTROL_FLOW CONTROL_FLOWdatetimeValueExpression2CONTROL_FLOW
;

// Original: datetimeValueExpression1
CONTROL_FLOWdatetimeValueExpression1CONTROL_FLOW
// Original: : datetimeValueExpression
: CONTROL_FLOWdatetimeValueExpressionCONTROL_FLOW
;

// Original: datetimeValueExpression2
CONTROL_FLOWdatetimeValueExpression2CONTROL_FLOW
// Original: : datetimeValueExpression
: CONTROL_FLOWdatetimeValueExpressionCONTROL_FLOW
;

// 20.29 <duration value function>

// Original: durationValueFunction
CONTROL_FLOWdurationValueFunctionCONTROL_FLOW
// Original: : durationFunction
: CONTROL_FLOWdurationFunctionCONTROL_FLOW
// Original: | absoluteValueExpression
| CONTROL_FLOWabsoluteValueExpressionCONTROL_FLOW
;

// Original: durationFunction
CONTROL_FLOWdurationFunctionCONTROL_FLOW
// Original: : DURATION LEFT_PAREN durationFunctionParameters RIGHT_PAREN
// Original: : DURATION LEFT_PAREN durationFunctionParameters PUNCTUATION_OPERATOR
: CONTROL_FLOWDURATIONCONTROL_FLOW CONTROL_FLOWLEFT_PARENCONTROL_FLOW CONTROL_FLOWdurationFunctionParametersCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW
;

// Original: durationFunctionParameters
CONTROL_FLOWdurationFunctionParametersCONTROL_FLOW
// Original: : durationString
: CONTROL_FLOWdurationStringCONTROL_FLOW
// Original: | recordConstructor
| CONTROL_FLOWrecordConstructorCONTROL_FLOW
;

// Original: // 21.1 Names and Variables
// CONTROL_FLOW21CONTROL_FLOW.CONTROL_FLOW1CONTROL_FLOW CONTROL_FLOWNamesCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWVariablesCONTROL_FLOW

// Original: objectName
CONTROL_FLOWobjectNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: objectNameOrBindingVariable
CONTROL_FLOWobjectNameOrBindingVariableCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// Original: directoryName
CONTROL_FLOWdirectoryNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: schemaName
CONTROL_FLOWschemaNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: graphName
CONTROL_FLOWgraphNameCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
// Original: | delimitedGraphName
| CONTROL_FLOWdelimitedGraphNameCONTROL_FLOW
;

// Original: delimitedGraphName
CONTROL_FLOWdelimitedGraphNameCONTROL_FLOW
// Original: // DELIMITED_IDENTIFIER
// CONTROL_FLOWDELIMITED_IDENTIFIERCONTROL_FLOW
// Original: : DOUBLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: | ACCENT_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: graphTypeName
CONTROL_FLOWgraphTypeNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: nodeTypeName
CONTROL_FLOWnodeTypeNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: edgeTypeName
CONTROL_FLOWedgeTypeNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: bindingTableName
CONTROL_FLOWbindingTableNameCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
// Original: | delimitedBindingTableName
| CONTROL_FLOWdelimitedBindingTableNameCONTROL_FLOW
;

// Original: delimitedBindingTableName
CONTROL_FLOWdelimitedBindingTableNameCONTROL_FLOW
// Original: // DELIMITED_IDENTIFIER
// CONTROL_FLOWDELIMITED_IDENTIFIERCONTROL_FLOW
// Original: : DOUBLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: | ACCENT_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: procedureName
CONTROL_FLOWprocedureNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: labelName
CONTROL_FLOWlabelNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: propertyName
CONTROL_FLOWpropertyNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: fieldName
CONTROL_FLOWfieldNameCONTROL_FLOW
// Original: : identifier
: CONTROL_FLOWidentifierCONTROL_FLOW
;

// Original: elementVariable
CONTROL_FLOWelementVariableCONTROL_FLOW
// Original: : bindingVariable
: CONTROL_FLOWbindingVariableCONTROL_FLOW
;

// Original: pathVariable
CONTROL_FLOWpathVariableCONTROL_FLOW
// Original: : bindingVariable
: CONTROL_FLOWbindingVariableCONTROL_FLOW
;

// Original: subpathVariable
CONTROL_FLOWsubpathVariableCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// Original: bindingVariable
CONTROL_FLOWbindingVariableCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
;

// 21.2 <literal>

// Original: unsignedLiteral
CONTROL_FLOWunsignedLiteralCONTROL_FLOW
// Original: : unsignedNumericLiteral
: CONTROL_FLOWunsignedNumericLiteralCONTROL_FLOW
// Original: | generalLiteral
| CONTROL_FLOWgeneralLiteralCONTROL_FLOW
;

// Original: generalLiteral
CONTROL_FLOWgeneralLiteralCONTROL_FLOW
// Original: : BOOLEAN_LITERAL
: CONTROL_FLOWBOOLEAN_LITERALCONTROL_FLOW
// Original: | characterStringLiteral
| CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
// Original: | BYTE_STRING_LITERAL
| CONTROL_FLOWBYTE_STRING_LITERALCONTROL_FLOW
// Original: | temporalLiteral
| CONTROL_FLOWtemporalLiteralCONTROL_FLOW
// Original: | durationLiteral
| CONTROL_FLOWdurationLiteralCONTROL_FLOW
// Original: | nullLiteral
| CONTROL_FLOWnullLiteralCONTROL_FLOW
// Original: | listLiteral
| CONTROL_FLOWlistLiteralCONTROL_FLOW
// Original: | recordLiteral
| CONTROL_FLOWrecordLiteralCONTROL_FLOW
;

// Original: temporalLiteral
CONTROL_FLOWtemporalLiteralCONTROL_FLOW
// Original: : dateLiteral
: CONTROL_FLOWdateLiteralCONTROL_FLOW
// Original: | timeLiteral
| CONTROL_FLOWtimeLiteralCONTROL_FLOW
// Original: | datetimeLiteral
| CONTROL_FLOWdatetimeLiteralCONTROL_FLOW
// Original: //    | sqlDatetimeLiteral
//    | CONTROL_FLOWsqlDatetimeLiteralCONTROL_FLOW
;

// Original: dateLiteral
CONTROL_FLOWdateLiteralCONTROL_FLOW
// Original: : DATE dateString
: CONTROL_FLOWDATECONTROL_FLOW CONTROL_FLOWdateStringCONTROL_FLOW
;

// Original: timeLiteral
CONTROL_FLOWtimeLiteralCONTROL_FLOW
// Original: : TIME timeString
: CONTROL_FLOWTIMECONTROL_FLOW CONTROL_FLOWtimeStringCONTROL_FLOW
;

// Original: datetimeLiteral
CONTROL_FLOWdatetimeLiteralCONTROL_FLOW
// Original: : (DATETIME | TIMESTAMP) datetimeString
: (CONTROL_FLOWDATETIMECONTROL_FLOW | CONTROL_FLOWTIMESTAMPCONTROL_FLOW) CONTROL_FLOWdatetimeStringCONTROL_FLOW
;

// Original: listLiteral
CONTROL_FLOWlistLiteralCONTROL_FLOW
// Original: : listValueConstructorByEnumeration
: CONTROL_FLOWlistValueConstructorByEnumerationCONTROL_FLOW
;

// Original: recordLiteral
CONTROL_FLOWrecordLiteralCONTROL_FLOW
// Original: : recordConstructor
: CONTROL_FLOWrecordConstructorCONTROL_FLOW
;

// Original: identifier
CONTROL_FLOWidentifierCONTROL_FLOW
// Original: : regularIdentifier
: CONTROL_FLOWregularIdentifierCONTROL_FLOW
// Original: // DELIMITED_IDENTIFIER
// CONTROL_FLOWDELIMITED_IDENTIFIERCONTROL_FLOW
// Original: | DOUBLE_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: | ACCENT_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: regularIdentifier
CONTROL_FLOWregularIdentifierCONTROL_FLOW
// Original: : REGULAR_IDENTIFIER
: CONTROL_FLOWREGULAR_IDENTIFIERCONTROL_FLOW
// Original: | nonReservedWords
| CONTROL_FLOWnonReservedWordsCONTROL_FLOW
;

// Original: timeZoneString
CONTROL_FLOWtimeZoneStringCONTROL_FLOW
// Original: : characterStringLiteral
: CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
;

// Original: characterStringLiteral
CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
// Original: : SINGLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWSINGLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: | DOUBLE_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: unsignedNumericLiteral
CONTROL_FLOWunsignedNumericLiteralCONTROL_FLOW
// Original: : exactNumericLiteral
: CONTROL_FLOWexactNumericLiteralCONTROL_FLOW
// Original: | approximateNumericLiteral
| CONTROL_FLOWapproximateNumericLiteralCONTROL_FLOW
;

// Original: exactNumericLiteral
CONTROL_FLOWexactNumericLiteralCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_EXACT_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_EXACT_NUMBER_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITHOUT_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITHOUT_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_INTEGER_WITH_EXACT_NUMBER_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_INTEGER_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: | unsignedInteger
| CONTROL_FLOWunsignedIntegerCONTROL_FLOW
;

// Original: approximateNumericLiteral
CONTROL_FLOWapproximateNumericLiteralCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITHOUT_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITHOUT_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_INTEGER_WITH_APPROXIMATE_NUMBER_SUFFIX
| CONTROL_FLOWUNSIGNED_DECIMAL_INTEGER_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: unsignedInteger
CONTROL_FLOWunsignedIntegerCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_INTEGER
// Original: : DATA_TYPE
: CONTROL_FLOWDATA_TYPECONTROL_FLOW
// Original: | UNSIGNED_HEXADECIMAL_INTEGER
| CONTROL_FLOWUNSIGNED_HEXADECIMAL_INTEGERCONTROL_FLOW
// Original: | UNSIGNED_OCTAL_INTEGER
// Original: | DATA_TYPE
| CONTROL_FLOWDATA_TYPECONTROL_FLOW
// Original: | UNSIGNED_BINARY_INTEGER
| CONTROL_FLOWUNSIGNED_BINARY_INTEGERCONTROL_FLOW
;

// Original: unsignedDecimalInteger
CONTROL_FLOWunsignedDecimalIntegerCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_INTEGER
// Original: : DATA_TYPE
: CONTROL_FLOWDATA_TYPECONTROL_FLOW
;

// Original: nullLiteral
CONTROL_FLOWnullLiteralCONTROL_FLOW
// Original: : NULL
: CONTROL_FLOWNULLCONTROL_FLOW
;

// Original: dateString
CONTROL_FLOWdateStringCONTROL_FLOW
// Original: : characterStringLiteral
: CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
;

// Original: timeString
CONTROL_FLOWtimeStringCONTROL_FLOW
// Original: : characterStringLiteral
: CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
;

// Original: datetimeString
CONTROL_FLOWdatetimeStringCONTROL_FLOW
// Original: : characterStringLiteral
: CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
;

// Original: durationLiteral
CONTROL_FLOWdurationLiteralCONTROL_FLOW
// Original: : DURATION durationString
: CONTROL_FLOWDURATIONCONTROL_FLOW CONTROL_FLOWdurationStringCONTROL_FLOW
// Original: //    | sqlIntervalLiteral
//    | CONTROL_FLOWsqlIntervalLiteralCONTROL_FLOW
;

// Original: durationString
CONTROL_FLOWdurationStringCONTROL_FLOW
// Original: : characterStringLiteral
: CONTROL_FLOWcharacterStringLiteralCONTROL_FLOW
;

// Original: nodeSynonym
CONTROL_FLOWnodeSynonymCONTROL_FLOW
// Original: : NODE
: CONTROL_FLOWNODECONTROL_FLOW
// Original: | VERTEX
| CONTROL_FLOWVERTEXCONTROL_FLOW
;

// Original: edgesSynonym
CONTROL_FLOWedgesSynonymCONTROL_FLOW
// Original: : EDGES
: CONTROL_FLOWEDGESCONTROL_FLOW
// Original: | RELATIONSHIPS
| CONTROL_FLOWRELATIONSHIPSCONTROL_FLOW
;

// Original: edgeSynonym
CONTROL_FLOWedgeSynonymCONTROL_FLOW
// Original: : EDGE
: CONTROL_FLOWEDGECONTROL_FLOW
// Original: | RELATIONSHIP
| CONTROL_FLOWRELATIONSHIPCONTROL_FLOW
;

// Original: // 21.1 Names and Variables
// CONTROL_FLOW21CONTROL_FLOW.CONTROL_FLOW1CONTROL_FLOW CONTROL_FLOWNamesCONTROL_FLOW CONTROL_FLOWandCONTROL_FLOW CONTROL_FLOWVariablesCONTROL_FLOW

// Original: IMPLIES
CONTROL_FLOWIMPLIESCONTROL_FLOW
// Original: : RIGHT_DOUBLE_ARROW
: CONTROL_FLOWRIGHT_DOUBLE_ARROWCONTROL_FLOW
// Original: | 'IMPLIES'
| 'CONTROL_FLOW'
;

// Original: fragment PARAMETER_NAME
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWPARAMETER_NAMECONTROL_FLOW
// Original: : SEPARATED_IDENTIFIER
: CONTROL_FLOWSEPARATED_IDENTIFIERCONTROL_FLOW
;

// 21.2 <literal>

// Original: nonReservedWords
CONTROL_FLOWnonReservedWordsCONTROL_FLOW
// Original: : ACYCLIC
: CONTROL_FLOWACYCLICCONTROL_FLOW
// Original: | BINDING
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | BINDINGS
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | CONNECTING
| CONTROL_FLOWCONNECTINGCONTROL_FLOW
// Original: | DESTINATION
| CONTROL_FLOWDESTINATIONCONTROL_FLOW
// Original: | DIFFERENT
| CONTROL_FLOWDIFFERENTCONTROL_FLOW
// Original: | DIRECTED
| CONTROL_FLOWDIRECTEDCONTROL_FLOW
// Original: | EDGE
| CONTROL_FLOWEDGECONTROL_FLOW
// Original: | EDGES
| CONTROL_FLOWEDGESCONTROL_FLOW
// Original: | ELEMENT
| CONTROL_FLOWELEMENTCONTROL_FLOW
// Original: | ELEMENTS
| CONTROL_FLOWELEMENTSCONTROL_FLOW
// Original: | FIRST
| CONTROL_FLOWFIRSTCONTROL_FLOW
// Original: | GRAPH
| CONTROL_FLOWGRAPHCONTROL_FLOW
// Original: | GROUPS
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | KEEP
| CONTROL_FLOWKEEPCONTROL_FLOW
// Original: | LABEL
| CONTROL_FLOWLABELCONTROL_FLOW
// Original: | LABELED
| CONTROL_FLOWLABELEDCONTROL_FLOW
// Original: | LABELS
| CONTROL_FLOWLABELSCONTROL_FLOW
// Original: | LAST
| CONTROL_FLOWLASTCONTROL_FLOW
// Original: | NFC
| CONTROL_FLOWNFCCONTROL_FLOW
// Original: | NFD
| CONTROL_FLOWNFDCONTROL_FLOW
// Original: | NFKC
| CONTROL_FLOWNFKCCONTROL_FLOW
// Original: | NFKD
| CONTROL_FLOWNFKDCONTROL_FLOW
// Original: | NO
| CONTROL_FLOWNOCONTROL_FLOW
// Original: | NODE
| CONTROL_FLOWNODECONTROL_FLOW
// Original: | NORMALIZED
| CONTROL_FLOWNORMALIZEDCONTROL_FLOW
// Original: | ONLY
| CONTROL_FLOWONLYCONTROL_FLOW
// Original: | ORDINALITY
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | PROPERTY
| CONTROL_FLOWPROPERTYCONTROL_FLOW
// Original: | READ
| CONTROL_FLOWREADCONTROL_FLOW
// Original: | RELATIONSHIP
| CONTROL_FLOWRELATIONSHIPCONTROL_FLOW
// Original: | RELATIONSHIPS
| CONTROL_FLOWRELATIONSHIPSCONTROL_FLOW
// Original: | REPEATABLE
| CONTROL_FLOWREPEATABLECONTROL_FLOW
// Original: | SHORTEST
| CONTROL_FLOWSHORTESTCONTROL_FLOW
// Original: | SIMPLE
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | SOURCE
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | TABLE
| CONTROL_FLOWTABLECONTROL_FLOW
// Original: | TEMP
| CONTROL_FLOWTEMPCONTROL_FLOW
// Original: | TO
// Original: | KEYWORD
| CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: | TRAIL
| CONTROL_FLOWTRAILCONTROL_FLOW
// Original: | TRANSACTION
| CONTROL_FLOWTRANSACTIONCONTROL_FLOW
// Original: | TYPE
| CONTROL_FLOWTYPECONTROL_FLOW
// Original: | UNDIRECTED
| CONTROL_FLOWUNDIRECTEDCONTROL_FLOW
// Original: | VERTEX
| CONTROL_FLOWVERTEXCONTROL_FLOW
// Original: | WALK
| CONTROL_FLOWWALKCONTROL_FLOW
// Original: | WITHOUT
| CONTROL_FLOWWITHOUTCONTROL_FLOW
// Original: | WRITE
| CONTROL_FLOWWRITECONTROL_FLOW
// Original: | ZONE
| CONTROL_FLOWZONECONTROL_FLOW
;

// Original: BOOLEAN_LITERAL
CONTROL_FLOWBOOLEAN_LITERALCONTROL_FLOW
// Original: : 'TRUE'
: 'LITERAL'
// Original: | 'FALSE'
| 'LITERAL'
| 'UNKNOWN'
;

// Original: SINGLE_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWSINGLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: : NO_ESCAPE? UNBROKEN_SINGLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWNO_ESCAPECONTROL_FLOW? CONTROL_FLOWUNBROKEN_SINGLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: DOUBLE_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: : NO_ESCAPE? UNBROKEN_DOUBLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWNO_ESCAPECONTROL_FLOW? CONTROL_FLOWUNBROKEN_DOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: ACCENT_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: :NO_ESCAPE? UNBROKEN_ACCENT_QUOTED_CHARACTER_SEQUENCE
:CONTROL_FLOWNO_ESCAPECONTROL_FLOW? CONTROL_FLOWUNBROKEN_ACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: NO_ESCAPE
CONTROL_FLOWNO_ESCAPECONTROL_FLOW
// Original: : COMMERCIAL_AT
: CONTROL_FLOWCOMMERCIAL_ATCONTROL_FLOW
;

// Original: fragment UNBROKEN_SINGLE_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUNBROKEN_SINGLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: : QUOTE SINGLE_QUOTED_CHARACTER_REPRESENTATION* QUOTE
: CONTROL_FLOWQUOTECONTROL_FLOW CONTROL_FLOWSINGLE_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW* CONTROL_FLOWQUOTECONTROL_FLOW
;

// Original: fragment UNBROKEN_DOUBLE_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUNBROKEN_DOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: : DOUBLE_QUOTE DOUBLE_QUOTED_CHARACTER_REPRESENTATION* DOUBLE_QUOTE
: CONTROL_FLOWDOUBLE_QUOTECONTROL_FLOW CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW* CONTROL_FLOWDOUBLE_QUOTECONTROL_FLOW
;

// Original: fragment UNBROKEN_ACCENT_QUOTED_CHARACTER_SEQUENCE
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUNBROKEN_ACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: : GRAVE_ACCENT ACCENT_QUOTED_CHARACTER_REPRESENTATION* GRAVE_ACCENT
: CONTROL_FLOWGRAVE_ACCENTCONTROL_FLOW CONTROL_FLOWACCENT_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW* CONTROL_FLOWGRAVE_ACCENTCONTROL_FLOW
;

// Original: fragment SINGLE_QUOTED_CHARACTER_REPRESENTATION:
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWSINGLE_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW:
(ESCAPED_CHARACTER | ~['\\\r\n])+
;

// Original: fragment DOUBLE_QUOTED_CHARACTER_REPRESENTATION:
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW:
(ESCAPED_CHARACTER | ~["\\\r\n])+
;

// Original: fragment ACCENT_QUOTED_CHARACTER_REPRESENTATION:
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWACCENT_QUOTED_CHARACTER_REPRESENTATIONCONTROL_FLOW:
(ESCAPED_CHARACTER | ~[`\\\r\n])+
;

// Original: fragment ESCAPED_CHARACTER
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_CHARACTERCONTROL_FLOW
// Original: : ESCAPED_REVERSE_SOLIDUS
: CONTROL_FLOWESCAPED_REVERSE_SOLIDUSCONTROL_FLOW
// Original: | ESCAPED_QUOTE
| CONTROL_FLOWESCAPED_QUOTECONTROL_FLOW
// Original: | ESCAPED_DOUBLE_QUOTE
| CONTROL_FLOWESCAPED_DOUBLE_QUOTECONTROL_FLOW
// Original: | ESCAPED_GRAVE_ACCENT
| CONTROL_FLOWESCAPED_GRAVE_ACCENTCONTROL_FLOW
// Original: | ESCAPED_TAB
| CONTROL_FLOWESCAPED_TABCONTROL_FLOW
// Original: | ESCAPED_BACKSPACE
| CONTROL_FLOWESCAPED_BACKSPACECONTROL_FLOW
// Original: | ESCAPED_NEW_LINE
| CONTROL_FLOWESCAPED_NEW_LINECONTROL_FLOW
// Original: | ESCAPED_CARRIAGE_RETURN
| CONTROL_FLOWESCAPED_CARRIAGE_RETURNCONTROL_FLOW
// Original: | ESCAPED_FORM_FEED
| CONTROL_FLOWESCAPED_FORM_FEEDCONTROL_FLOW
// Original: | ESCAPED_UNICODE4_DIGIT_VALUE
| CONTROL_FLOWESCAPED_UNICODE4_DIGIT_VALUECONTROL_FLOW
// Original: | ESCAPED_UNICODE6_DIGIT_VALUE
| CONTROL_FLOWESCAPED_UNICODE6_DIGIT_VALUECONTROL_FLOW
;

// Original: fragment ESCAPED_REVERSE_SOLIDUS: REVERSE_SOLIDUS REVERSE_SOLIDUS;
// Original: fragment ESCAPED_REVERSE_SOLIDUS: PUNCTUATION_OPERATOR PUNCTUATION_OPERATOR;
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_REVERSE_SOLIDUSCONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW;
// Original: fragment ESCAPED_QUOTE: REVERSE_SOLIDUS QUOTE;
// Original: fragment ESCAPED_QUOTE: PUNCTUATION_OPERATOR QUOTE;
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_QUOTECONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWQUOTECONTROL_FLOW;
// Original: fragment ESCAPED_DOUBLE_QUOTE: REVERSE_SOLIDUS DOUBLE_QUOTE;
// Original: fragment ESCAPED_DOUBLE_QUOTE: PUNCTUATION_OPERATOR DOUBLE_QUOTE;
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_DOUBLE_QUOTECONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWDOUBLE_QUOTECONTROL_FLOW;
// Original: fragment ESCAPED_GRAVE_ACCENT: REVERSE_SOLIDUS GRAVE_ACCENT;
// Original: fragment ESCAPED_GRAVE_ACCENT: PUNCTUATION_OPERATOR GRAVE_ACCENT;
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_GRAVE_ACCENTCONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWGRAVE_ACCENTCONTROL_FLOW;
// Original: fragment ESCAPED_TAB: REVERSE_SOLIDUS 't';
// Original: fragment ESCAPED_TAB: PUNCTUATION_OPERATOR 't';
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_TABCONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWtCONTROL_FLOW';
// Original: fragment ESCAPED_BACKSPACE: REVERSE_SOLIDUS 'b';
// Original: fragment ESCAPED_BACKSPACE: PUNCTUATION_OPERATOR 'b';
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_BACKSPACECONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWbCONTROL_FLOW';
// Original: fragment ESCAPED_NEW_LINE: REVERSE_SOLIDUS 'n';
// Original: fragment ESCAPED_NEW_LINE: PUNCTUATION_OPERATOR 'n';
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_NEW_LINECONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWnCONTROL_FLOW';
// Original: fragment ESCAPED_CARRIAGE_RETURN: REVERSE_SOLIDUS 'r';
// Original: fragment ESCAPED_CARRIAGE_RETURN: PUNCTUATION_OPERATOR 'r';
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_CARRIAGE_RETURNCONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWrCONTROL_FLOW';
// Original: fragment ESCAPED_FORM_FEED: REVERSE_SOLIDUS 'f';
// Original: fragment ESCAPED_FORM_FEED: PUNCTUATION_OPERATOR 'f';
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_FORM_FEEDCONTROL_FLOW: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWfCONTROL_FLOW';
// Original: fragment ESCAPED_UNICODE4_DIGIT_VALUE:
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_UNICODE4_DIGIT_VALUECONTROL_FLOW:
// Original: REVERSE_SOLIDUS 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
// Original: PUNCTUATION_OPERATOR 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWuCONTROL_FLOW' CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW;
// Original: fragment ESCAPED_UNICODE6_DIGIT_VALUE:
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWESCAPED_UNICODE6_DIGIT_VALUECONTROL_FLOW:
// Original: REVERSE_SOLIDUS 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
// Original: PUNCTUATION_OPERATOR 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW 'CONTROL_FLOWuCONTROL_FLOW' CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW;

// Todo: Finish this. It is tricky how it interacts with <separator>
// Original: BYTE_STRING_LITERAL
CONTROL_FLOWBYTE_STRING_LITERALCONTROL_FLOW
// Original: : 'X' QUOTE SPACE* (HEX_DIGIT SPACE* HEX_DIGIT SPACE*)* QUOTE
: 'CONTROL_FLOWXCONTROL_FLOW' CONTROL_FLOWQUOTECONTROL_FLOW CONTROL_FLOWSPACECONTROL_FLOW* (CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWSPACECONTROL_FLOW* CONTROL_FLOWHEX_DIGITCONTROL_FLOW CONTROL_FLOWSPACECONTROL_FLOW*)* CONTROL_FLOWQUOTECONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_EXACT_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION EXACT_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATIONCONTROL_FLOW CONTROL_FLOWEXACT_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITHOUT_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITHOUT_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATIONCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION APPROXIMATE_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATIONCONTROL_FLOW CONTROL_FLOWAPPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_EXACT_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_COMMON_NOTATION EXACT_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATIONCONTROL_FLOW CONTROL_FLOWEXACT_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITHOUT_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITHOUT_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_COMMON_NOTATION
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATIONCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATION_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_COMMON_NOTATION APPROXIMATE_NUMBER_SUFFIX
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATIONCONTROL_FLOW CONTROL_FLOWAPPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_INTEGER_WITH_EXACT_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_INTEGER_WITH_EXACT_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_INTEGER EXACT_NUMBER_SUFFIX
// Original: : DATA_TYPE EXACT_NUMBER_SUFFIX
: CONTROL_FLOWDATA_TYPECONTROL_FLOW CONTROL_FLOWEXACT_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_INTEGER_WITH_APPROXIMATE_NUMBER_SUFFIX
CONTROL_FLOWUNSIGNED_DECIMAL_INTEGER_WITH_APPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_INTEGER APPROXIMATE_NUMBER_SUFFIX
// Original: : DATA_TYPE APPROXIMATE_NUMBER_SUFFIX
: CONTROL_FLOWDATA_TYPECONTROL_FLOW CONTROL_FLOWAPPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
;

// Original: UNSIGNED_DECIMAL_INTEGER
// Original: DATA_TYPE
CONTROL_FLOWDATA_TYPECONTROL_FLOW
// Original: : DIGIT (UNDERSCORE? DIGIT)*
: DIGIT (PUNCTUATION_OPERATOR? DIGIT)*
;

// Original: fragment EXACT_NUMBER_SUFFIX
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWEXACT_NUMBER_SUFFIXCONTROL_FLOW
: 'M'
;

// Original: fragment UNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATION
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUNSIGNED_DECIMAL_IN_SCIENTIFIC_NOTATIONCONTROL_FLOW
// Original: : MANTISSA 'E' EXPONENT
: CONTROL_FLOWMANTISSACONTROL_FLOW 'CONTROL_FLOWECONTROL_FLOW' CONTROL_FLOWEXPONENTCONTROL_FLOW
;

// Original: fragment MANTISSA
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWMANTISSACONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_IN_COMMON_NOTATION
: CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATIONCONTROL_FLOW
// Original: | UNSIGNED_DECIMAL_INTEGER
// Original: | DATA_TYPE
| CONTROL_FLOWDATA_TYPECONTROL_FLOW
;

// Original: fragment EXPONENT
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWEXPONENTCONTROL_FLOW
// Original: : SIGNED_DECIMAL_INTEGER
: CONTROL_FLOWSIGNED_DECIMAL_INTEGERCONTROL_FLOW
;

// Original: fragment UNSIGNED_DECIMAL_IN_COMMON_NOTATION
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUNSIGNED_DECIMAL_IN_COMMON_NOTATIONCONTROL_FLOW
// Original: : UNSIGNED_DECIMAL_INTEGER (PERIOD UNSIGNED_DECIMAL_INTEGER?)
// Original: : DATA_TYPE (PERIOD DATA_TYPE?)
: DATA_TYPE (PUNCTUATION_OPERATOR DATA_TYPE?)
// Original: | PERIOD UNSIGNED_DECIMAL_INTEGER
// Original: | PERIOD DATA_TYPE
| CONTROL_FLOWPERIODCONTROL_FLOW CONTROL_FLOWDATA_TYPECONTROL_FLOW
;

// Original: fragment SIGNED_DECIMAL_INTEGER
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWSIGNED_DECIMAL_INTEGERCONTROL_FLOW
// Original: : (PLUS_SIGN | MINUS_SIGN)? UNSIGNED_DECIMAL_INTEGER
// Original: : (PLUS_SIGN | MINUS_SIGN)? DATA_TYPE
: (CONTROL_FLOWPLUS_SIGNCONTROL_FLOW | CONTROL_FLOWMINUS_SIGNCONTROL_FLOW)? CONTROL_FLOWDATA_TYPECONTROL_FLOW
;

// Original: UNSIGNED_HEXADECIMAL_INTEGER
CONTROL_FLOWUNSIGNED_HEXADECIMAL_INTEGERCONTROL_FLOW
: '0x' ('_'? HEX_DIGIT)+
;

// Original: UNSIGNED_OCTAL_INTEGER
// Original: DATA_TYPE
CONTROL_FLOWDATA_TYPECONTROL_FLOW
: '0o' ('_'? OCTAL_DIGIT)+
;

// Original: UNSIGNED_BINARY_INTEGER
CONTROL_FLOWUNSIGNED_BINARY_INTEGERCONTROL_FLOW
: '0b' ('_'? BINARY_DIGIT)+
;

// Original: fragment APPROXIMATE_NUMBER_SUFFIX
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWAPPROXIMATE_NUMBER_SUFFIXCONTROL_FLOW
: 'F'
| 'D'
;

// 21.3 <token>, <separator>, and <identifier>

// Original: // Reserved words
// CONTROL_FLOWReservedCONTROL_FLOW CONTROL_FLOWwordsCONTROL_FLOW
ABS: 'ABS';
ACOS: 'ACOS';
ALL: 'ALL';
ALL_DIFFERENT: 'ALL_DIFFERENT';
AND: 'AND';
ANY: 'ANY';
ARRAY: 'ARRAY';
AS: 'AS';
ASC: 'ASC';
ASCENDING: 'ASCENDING';
ASIN: 'ASIN';
AT: 'AT';
ATAN: 'ATAN';
AVG: 'AVG';
BIG: 'BIG';
BIGINT: 'BIGINT';
BINARY: 'BINARY';
BOOL: 'BOOL';
BOOLEAN: 'BOOLEAN';
BOTH: 'BOTH';
BTRIM: 'BTRIM';
BY: 'BY';
BYTE_LENGTH: 'BYTE_LENGTH';
BYTES: 'BYTES';
CALL: 'CALL';
CARDINALITY: 'CARDINALITY';
CASE: 'CASE';
CAST: 'CAST';
CEIL: 'CEIL';
CEILING: 'CEILING';
CHAR: 'CHAR';
CHAR_LENGTH: 'CHAR_LENGTH';
CHARACTER_LENGTH: 'CHARACTER_LENGTH';
CHARACTERISTICS: 'CHARACTERISTICS';
CLOSE: 'CLOSE';
COALESCE: 'COALESCE';
COLLECT_LIST: 'COLLECT_LIST';
COMMIT: 'COMMIT';
COPY: 'COPY';
COS: 'COS';
COSH: 'COSH';
COT: 'COT';
COUNT: 'COUNT';
CREATE: 'CREATE';
CURRENT_DATE: 'CURRENT_DATE';
CURRENT_GRAPH: 'CURRENT_GRAPH';
CURRENT_PROPERTY_GRAPH: 'CURRENT_PROPERTY_GRAPH';
CURRENT_SCHEMA: 'CURRENT_SCHEMA';
CURRENT_TIME: 'CURRENT_TIME';
CURRENT_TIMESTAMP: 'CURRENT_TIMESTAMP';
DATE: 'DATE';
DATETIME: 'DATETIME';
DAY: 'DAY';
DEC: 'DEC';
DECIMAL: 'DECIMAL';
DEGREES: 'DEGREES';
DELETE: 'DELETE';
DESC: 'DESC';
DESCENDING: 'DESCENDING';
DETACH: 'DETACH';
DISTINCT: 'DISTINCT';
DOUBLE: 'DOUBLE';
DROP: 'DROP';
DURATION: 'DURATION';
DURATION_BETWEEN: 'DURATION_BETWEEN';
ELEMENT_ID: 'ELEMENT_ID';
ELSE: 'ELSE';
END: 'END';
EXCEPT: 'EXCEPT';
EXISTS: 'EXISTS';
EXP: 'EXP';
FILTER: 'FILTER';
FINISH: 'FINISH';
FLOAT: 'FLOAT';
FLOAT16: 'FLOAT16';
FLOAT32: 'FLOAT32';
FLOAT64: 'FLOAT64';
FLOAT128: 'FLOAT128';
FLOAT256: 'FLOAT256';
FLOOR: 'FLOOR';
FOR: 'FOR';
FROM: 'FROM';
GROUP: 'GROUP';
HAVING: 'HAVING';
HOME_GRAPH: 'HOME_GRAPH';
HOME_PROPERTY_GRAPH: 'HOME_PROPERTY_GRAPH';
HOME_SCHEMA: 'HOME_SCHEMA';
HOUR: 'HOUR';
IF: 'IF';
IN: 'IN';
INSERT: 'INSERT';
INT: 'INT';
INTEGER: 'INTEGER';
INT8: 'INT8';
INTEGER8: 'INTEGER8';
INT16: 'INT16';
INTEGER16: 'INTEGER16';
INT32: 'INT32';
INTEGER32: 'INTEGER32';
INT64: 'INT64';
INTEGER64: 'INTEGER64';
INT128: 'INT128';
INTEGER128: 'INTEGER128';
INT256: 'INT256';
INTEGER256: 'INTEGER256';
INTERSECT: 'INTERSECT';
INTERVAL: 'INTERVAL';
IS: 'IS';
LEADING: 'LEADING';
LEFT: 'LEFT';
LET: 'LET';
LIKE: 'LIKE';
LIMIT: 'LIMIT';
LIST: 'LIST';
LN: 'LN';
LOCAL: 'LOCAL';
LOCAL_DATETIME: 'LOCAL_DATETIME';
LOCAL_TIME: 'LOCAL_TIME';
LOCAL_TIMESTAMP: 'LOCAL_TIMESTAMP';
LOG: 'LOG';
LOG10: 'LOG10';
LOWER: 'LOWER';
LTRIM: 'LTRIM';
MATCH: 'MATCH';
MAX: 'MAX';
MIN: 'MIN';
MINUTE: 'MINUTE';
MOD: 'MOD';
MONTH: 'MONTH';
NEXT: 'NEXT';
NODETACH: 'NODETACH';
NORMALIZE: 'NORMALIZE';
NOT: 'NOT';
NOTHING: 'NOTHING';
NULL: 'NULL';
NULLS: 'NULLS';
NULLIF: 'NULLIF';
OCTET_LENGTH: 'OCTET_LENGTH';
OF: 'OF';
OFFSET: 'OFFSET';
OPTIONAL: 'OPTIONAL';
OR: 'OR';
ORDER: 'ORDER';
OTHERWISE: 'OTHERWISE';
PARAMETER: 'PARAMETER';
PARAMETERS: 'PARAMETERS';
PATH: 'PATH';
PATH_LENGTH: 'PATH_LENGTH';
PATHS: 'PATHS';
PERCENTILE_CONT: 'PERCENTILE_CONT';
PERCENTILE_DISC: 'PERCENTILE_DISC';
POWER: 'POWER';
PRECISION: 'PRECISION';
PROPERTY_EXISTS: 'PROPERTY_EXISTS';
RADIANS: 'RADIANS';
REAL: 'REAL';
RECORD: 'RECORD';
REMOVE: 'REMOVE';
REPLACE: 'REPLACE';
RESET: 'RESET';
RETURN: 'RETURN';
RIGHT: 'RIGHT';
ROLLBACK: 'ROLLBACK';
RTRIM: 'RTRIM';
SAME: 'SAME';
SCHEMA: 'SCHEMA';
SECOND: 'SECOND';
SELECT: 'SELECT';
SESSION: 'SESSION';
SESSION_USER: 'SESSION_USER';
SET: 'SET';
SIGNED: 'SIGNED';
SIN: 'SIN';
SINH: 'SINH';
SIZE: 'SIZE';
SKIP_RESERVED_WORD: 'SKIP';
SMALL: 'SMALL';
SMALLINT: 'SMALLINT';
SQRT: 'SQRT';
START: 'START';
STDDEV_POP: 'STDDEV_POP';
STDDEV_SAMP: 'STDDEV_SAMP';
STRING: 'STRING';
SUM: 'SUM';
TAN: 'TAN';
TANH: 'TANH';
THEN: 'THEN';
TIME: 'TIME';
TIMESTAMP: 'TIMESTAMP';
TRAILING: 'TRAILING';
TRIM: 'TRIM';
TYPED: 'TYPED';
UBIGINT: 'UBIGINT';
UINT: 'UINT';
UINT8: 'UINT8';
UINT16: 'UINT16';
UINT32: 'UINT32';
UINT64: 'UINT64';
UINT128: 'UINT128';
UINT256: 'UINT256';
UNION: 'UNION';
UNSIGNED: 'UNSIGNED';
UPPER: 'UPPER';
USE: 'USE';
USMALLINT: 'USMALLINT';
VALUE: 'VALUE';
VARBINARY: 'VARBINARY';
VARCHAR: 'VARCHAR';
VARIABLE: 'VARIABLE';
WHEN: 'WHEN';
WHERE: 'WHERE';
WITH: 'WITH';
XOR: 'XOR';
YEAR: 'YEAR';
YIELD: 'YIELD';
ZONED: 'ZONED';
ZONED_DATETIME: 'ZONED_DATETIME';
ZONED_TIME: 'ZONED_TIME';

// Original: // Prereserved words
// CONTROL_FLOWPrereservedCONTROL_FLOW CONTROL_FLOWwordsCONTROL_FLOW
ABSTRACT: 'ABSTRACT';
AGGREGATE: 'AGGREGATE';
AGGREGATES: 'AGGREGATES';
ALTER: 'ALTER';
CATALOG: 'CATALOG';
CLEAR: 'CLEAR';
CLONE: 'CLONE';
CONSTRAINT: 'CONSTRAINT';
CURRENT_ROLE: 'CURRENT_ROLE';
CURRENT_USER: 'CURRENT_USER';
DATA: 'DATA';
DIRECTORY: 'DIRECTORY';
DRYRUN: 'DRYRUN';
EXACT: 'EXACT';
EXISTING: 'EXISTING';
FUNCTION: 'FUNCTION';
GQLSTATUS: 'GQLSTATUS';
GRANT: 'GRANT';
INSTANT: 'INSTANT';
INFINITY: 'INFINITY';
NUMBER: 'NUMBER';
NUMERIC: 'NUMERIC';
ON: 'ON';
OPEN: 'OPEN';
PARTITION: 'PARTITION';
PROCEDURE: 'PROCEDURE';
PRODUCT: 'PRODUCT';
PROJECT: 'PROJECT';
QUERY: 'QUERY';
RECORDS: 'RECORDS';
REFERENCE: 'REFERENCE';
RENAME: 'RENAME';
REVOKE: 'REVOKE';
SUBSTRING: 'SUBSTRING';
SYSTEM_USER: 'SYSTEM_USER';
TEMPORAL: 'TEMPORAL';
UNIQUE: 'UNIQUE';
UNIT: 'UNIT';
VALUES: 'VALUES';

// Original: // Nonreserved words
// CONTROL_FLOWNonreservedCONTROL_FLOW CONTROL_FLOWwordsCONTROL_FLOW
ACYCLIC: 'ACYCLIC';
BINDING: 'BINDING';
BINDINGS: 'BINDINGS';
CONNECTING: 'CONNECTING';
DESTINATION: 'DESTINATION';
DIFFERENT: 'DIFFERENT';
DIRECTED: 'DIRECTED';
EDGE: 'EDGE';
EDGES: 'EDGES';
ELEMENT: 'ELEMENT';
ELEMENTS: 'ELEMENTS';
FIRST: 'FIRST';
GRAPH: 'GRAPH';
GROUPS: 'GROUPS';
KEEP: 'KEEP';
LABEL: 'LABEL';
LABELED: 'LABELED';
LABELS: 'LABELS';
LAST: 'LAST';
NFC: 'NFC';
NFD: 'NFD';
NFKC: 'NFKC';
NFKD: 'NFKD';
NO: 'NO';
NODE: 'NODE';
NORMALIZED: 'NORMALIZED';
ONLY: 'ONLY';
ORDINALITY: 'ORDINALITY';
PROPERTY: 'PROPERTY';
READ: 'READ';
RELATIONSHIP: 'RELATIONSHIP';
RELATIONSHIPS: 'RELATIONSHIPS';
REPEATABLE: 'REPEATABLE';
SHORTEST: 'SHORTEST';
SIMPLE: 'SIMPLE';
SOURCE: 'SOURCE';
TABLE: 'TABLE';
TEMP: 'TEMP';
TO: 'TO';
TRAIL: 'TRAIL';
TRANSACTION: 'TRANSACTION';
TYPE: 'TYPE';
UNDIRECTED: 'UNDIRECTED';
VERTEX: 'VERTEX';
WALK: 'WALK';
WITHOUT: 'WITHOUT';
WRITE: 'WRITE';
ZONE: 'ZONE';

// Original: fragment SEPARATED_IDENTIFIER
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWSEPARATED_IDENTIFIERCONTROL_FLOW
// Original: : DELIMITED_IDENTIFIER
: CONTROL_FLOWDELIMITED_IDENTIFIERCONTROL_FLOW
// Original: | EXTENDED_IDENTIFIER
| CONTROL_FLOWEXTENDED_IDENTIFIERCONTROL_FLOW
;

// Original: REGULAR_IDENTIFIER
CONTROL_FLOWREGULAR_IDENTIFIERCONTROL_FLOW
: IDENTIFIER_START IDENTIFIER_EXTEND*
;

// Original: fragment EXTENDED_IDENTIFIER
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWEXTENDED_IDENTIFIERCONTROL_FLOW
: IDENTIFIER_EXTEND+
;

// Original: fragment DELIMITED_IDENTIFIER
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWDELIMITED_IDENTIFIERCONTROL_FLOW
// Original: : DOUBLE_QUOTED_CHARACTER_SEQUENCE
: CONTROL_FLOWDOUBLE_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
// Original: | ACCENT_QUOTED_CHARACTER_SEQUENCE
| CONTROL_FLOWACCENT_QUOTED_CHARACTER_SEQUENCECONTROL_FLOW
;

// Original: SUBSTITUTED_PARAMETER_REFERENCE
CONTROL_FLOWSUBSTITUTED_PARAMETER_REFERENCECONTROL_FLOW
// Original: : DOUBLE_DOLLAR_SIGN PARAMETER_NAME
// Original: : PUNCTUATION_OPERATOR PARAMETER_NAME
: CONTROL_FLOWPUNCTUATION_OPERATORCONTROL_FLOW CONTROL_FLOWPARAMETER_NAMECONTROL_FLOW
;

// Original: GENERAL_PARAMETER_REFERENCE
CONTROL_FLOWGENERAL_PARAMETER_REFERENCECONTROL_FLOW
// Original: : DOLLAR_SIGN PARAMETER_NAME
: CONTROL_FLOWDOLLAR_SIGNCONTROL_FLOW CONTROL_FLOWPARAMETER_NAMECONTROL_FLOW
;

// Original: fragment IDENTIFIER_START
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWIDENTIFIER_STARTCONTROL_FLOW
// Original: : ID_Start
: CONTROL_FLOWID_StartCONTROL_FLOW
// Original: | Pc
| CONTROL_FLOWPcCONTROL_FLOW
;

// Original: fragment IDENTIFIER_EXTEND
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWIDENTIFIER_EXTENDCONTROL_FLOW
// Original: : ID_Continue
: CONTROL_FLOWID_ContinueCONTROL_FLOW
;

// Original: fragment ID_Start
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWID_StartCONTROL_FLOW
: [\p{ID_Start}]
;

// Original: fragment ID_Continue
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWID_ContinueCONTROL_FLOW
: [\p{ID_Continue}]
;

MULTISET_ALTERNATION_OPERATOR: '|+|';

BRACKET_RIGHT_ARROW: ']->';
BRACKET_TILDE_RIGHT_ARROW: ']~>';
CONCATENATION_OPERATOR: '||';
DOUBLE_COLON: '::';
DOUBLE_DOLLAR_SIGN: '$$';
DOUBLE_PERIOD: '..';
GREATER_THAN_OR_EQUALS_OPERATOR: '>=';
LEFT_ARROW: '<-';
LEFT_ARROW_TILDE: '<~';
LEFT_ARROW_BRACKET: '<-[';
LEFT_ARROW_TILDE_BRACKET: '<~[';
LEFT_MINUS_RIGHT: '<->';
LEFT_MINUS_SLASH: '<-/';
LEFT_TILDE_SLASH: '<~/';
LESS_THAN_OR_EQUALS_OPERATOR: '<=';
MINUS_LEFT_BRACKET: '-[';
MINUS_SLASH: '-/';
NOT_EQUALS_OPERATOR: '<>';
RIGHT_ARROW: '->';
RIGHT_BRACKET_MINUS: ']-';
RIGHT_BRACKET_TILDE: ']~';
RIGHT_DOUBLE_ARROW: '=>';
SLASH_MINUS: '/-';
SLASH_MINUS_RIGHT: '/->';
SLASH_TILDE: '/~';
SLASH_TILDE_RIGHT: '/~>';
TILDE_LEFT_BRACKET: '~[';
TILDE_RIGHT_ARROW: '~>';
TILDE_SLASH: '~/';

// Original: // 21.4 GQL terminal characters
// CONTROL_FLOW21CONTROL_FLOW.CONTROL_FLOW4CONTROL_FLOW CONTROL_FLOWGQLCONTROL_FLOW CONTROL_FLOWterminalCONTROL_FLOW CONTROL_FLOWcharactersCONTROL_FLOW

AMPERSAND: '&';
ASTERISK: '*';
COLON: ':';
COMMA: ',';
COMMERCIAL_AT: '@';
DOLLAR_SIGN: '$';
DOUBLE_QUOTE: '"';
EQUALS_OPERATOR: '=';
EXCLAMATION_MARK: '!';
RIGHT_ANGLE_BRACKET: '>';
GRAVE_ACCENT: '`';
LEFT_BRACE: '{';
LEFT_BRACKET: '[';
LEFT_PAREN: '(';
LEFT_ANGLE_BRACKET: '<';
MINUS_SIGN: '-';
PERCENT: '%';
PERIOD: '.';
PLUS_SIGN: '+';
QUESTION_MARK: '?';
QUOTE: '\'';
REVERSE_SOLIDUS: '\\';
RIGHT_BRACE: '}';
RIGHT_BRACKET: ']';
RIGHT_PAREN: ')';
SOLIDUS: '/';
TILDE: '~';
UNDERSCORE: '_';
VERTICAL_BAR: '|';

// Original: fragment HEX_DIGIT
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWHEX_DIGITCONTROL_FLOW
: [0-9a-f]
;

// Original: fragment DIGIT
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWDIGITCONTROL_FLOW
: [0-9]
;

// Original: fragment OCTAL_DIGIT
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWOCTAL_DIGITCONTROL_FLOW
: [0-7]
;

// Original: fragment BINARY_DIGIT
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWBINARY_DIGITCONTROL_FLOW
: [0-1]
;

// Original: SP
// Original: KEYWORD
CONTROL_FLOWKEYWORDCONTROL_FLOW
// Original: : (WHITESPACE)+
: (KEYWORD)+
-> channel(HIDDEN)
;

// Original: WHITESPACE
CONTROL_FLOWWHITESPACECONTROL_FLOW
// Original: : SPACE
: CONTROL_FLOWSPACECONTROL_FLOW
// Original: | TAB
| CONTROL_FLOWTABCONTROL_FLOW
// Original: | LF
| CONTROL_FLOWLFCONTROL_FLOW
// Original: | VT
| CONTROL_FLOWVTCONTROL_FLOW
// Original: | FF
| CONTROL_FLOWFFCONTROL_FLOW
// Original: | CR
| CONTROL_FLOWCRCONTROL_FLOW
// Original: | FS
| CONTROL_FLOWFSCONTROL_FLOW
// Original: | GS
| CONTROL_FLOWGSCONTROL_FLOW
// Original: | RS
| CONTROL_FLOWRSCONTROL_FLOW
// Original: | US
| CONTROL_FLOWUSCONTROL_FLOW
| '\u1680'
| '\u180e'
| '\u2000'
| '\u2001'
| '\u2002'
| '\u2003'
| '\u2004'
| '\u2005'
| '\u2006'
| '\u2008'
| '\u2009'
| '\u200a'
| '\u2028'
| '\u2029'
| '\u205f'
| '\u3000'
| '\u00a0'
| '\u2007'
| '\u202f'
;

BRACKETED_COMMENT: '/*' .*? '*/' -> channel(HIDDEN);

SIMPLE_COMMENT_SOLIDUS: '//' ~[\r\n]* -> channel(HIDDEN);

SIMPLE_COMMENT_MINUS: '--' ~[\r\n]* -> channel(HIDDEN);

// Original: fragment GS : [\u001D];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWGSCONTROL_FLOW : [\CONTROL_FLOWu001DCONTROL_FLOW];

// Original: fragment FS : [\u001C];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWFSCONTROL_FLOW : [\CONTROL_FLOWu001CCONTROL_FLOW];

// Original: fragment CR : [\r];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWCRCONTROL_FLOW : [\CONTROL_FLOWrCONTROL_FLOW];

// Original: fragment Sc : [\p{Sc}];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWScCONTROL_FLOW : [\CONTROL_FLOWpCONTROL_FLOW{CONTROL_FLOWScCONTROL_FLOW}];

// Original: fragment SPACE : [ ];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWSPACECONTROL_FLOW : [ ];

// Original: fragment Pc : [\p{Pc}];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWPcCONTROL_FLOW : [\CONTROL_FLOWpCONTROL_FLOW{CONTROL_FLOWPcCONTROL_FLOW}];

// Original: fragment TAB : [\t];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWTABCONTROL_FLOW : [\CONTROL_FLOWtCONTROL_FLOW];

// Original: fragment LF : [\n];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWLFCONTROL_FLOW : [\CONTROL_FLOWnCONTROL_FLOW];

// Original: fragment VT : [\u000B];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWVTCONTROL_FLOW : [\CONTROL_FLOWu000BCONTROL_FLOW];

// Original: fragment US : [\u001F];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWUSCONTROL_FLOW : [\CONTROL_FLOWu001FCONTROL_FLOW];

// Original: fragment FF: [\f];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWFFCONTROL_FLOW: [\CONTROL_FLOWfCONTROL_FLOW];

// Original: fragment RS: [\u001E];
CONTROL_FLOWfragmentCONTROL_FLOW CONTROL_FLOWRSCONTROL_FLOW: [\CONTROL_FLOWu001ECONTROL_FLOW];
