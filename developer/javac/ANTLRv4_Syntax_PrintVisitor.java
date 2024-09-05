

import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

public class ANTLRv4_Syntax_PrintVisitor extends ANTLRv4BaseVisitor<String>{

  private final String[] rule_names;
  private final boolean pretty_print;

  public ANTLRv4_Syntax_PrintVisitor(
String[] rule_names, boolean pretty_print)
{

  this.rule_names = rule_names;
  this.pretty_print = pretty_print;
  }


  private String indent(
int level)
{

  return "  ".repeat(
level)
;
  }


  @Override
  public Void visitgrammarSpec
  (
ANTLRv4Parser.grammarSpec
   Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("grammarSpec
             ");
             return visitChildren(ctx);
             }}
  @Override
    public Void visitgrammarDecl
    (ANTLRv4Parser.grammarDecl
     Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"grammarDecl
               ")
;
               return visitChildren(
ctx)
;
               }
}

    @Override
    public Void visitgrammarType
    (
ANTLRv4Parser.grammarType
     Context ctx)
 {
{

      // Logic to print the current rule's name
      System.out.println("grammarType
               ");
               return visitChildren(ctx);
               }}
    @Override
      public Void visitprequelConstruct
      (ANTLRv4Parser.prequelConstruct
       Context ctx) {{
      // Logic to print the current rule's name
      System.out.println(
"prequelConstruct
                 ")
;
                 return visitChildren(
ctx)
;
                 }
}

      @Override
      public Void visitoptionsSpec
      (
ANTLRv4Parser.optionsSpec
       Context ctx)
 {
{

        // Logic to print the current rule's name
        System.out.println("optionsSpec
                 ");
                 return visitChildren(ctx);
                 }}
      @Override
        public Void visitoption
        (ANTLRv4Parser.option
         Context ctx) {{
        // Logic to print the current rule's name
        System.out.println(
"option
                   ")
;
                   return visitChildren(
ctx)
;
                   }
}

        @Override
        public Void visitoptionValue
        (
ANTLRv4Parser.optionValue
         Context ctx)
 {
{

          // Logic to print the current rule's name
          System.out.println("optionValue
                   ");
                   return visitChildren(ctx);
                   }}
        @Override
          public Void visitdelegateGrammars
          (ANTLRv4Parser.delegateGrammars
           Context ctx) {{
          // Logic to print the current rule's name
          System.out.println(
"delegateGrammars
                     ")
;
                     return visitChildren(
ctx)
;
                     }
}

          @Override
          public Void visitdelegateGrammar
          (
ANTLRv4Parser.delegateGrammar
           Context ctx)
 {
{

            // Logic to print the current rule's name
            System.out.println("delegateGrammar
                     ");
                     return visitChildren(ctx);
                     }}
          @Override
            public Void visittokensSpec
            (ANTLRv4Parser.tokensSpec
             Context ctx) {{
            // Logic to print the current rule's name
            System.out.println(
"tokensSpec
                       ")
;
                       return visitChildren(
ctx)
;
                       }
}

            @Override
            public Void visitchannelsSpec
            (
ANTLRv4Parser.channelsSpec
             Context ctx)
 {
{

              // Logic to print the current rule's name
              System.out.println("channelsSpec
                       ");
                       return visitChildren(ctx);
                       }}
            @Override
              public Void visitidList
              (ANTLRv4Parser.idList
               Context ctx) {{
              // Logic to print the current rule's name
              System.out.println(
"idList
                         ")
;
                         return visitChildren(
ctx)
;
                         }
}

              @Override
              public Void visitaction_
              (
ANTLRv4Parser.action_
               Context ctx)
 {
{

                // Logic to print the current rule's name
                System.out.println("action_
                         ");
                         return visitChildren(ctx);
                         }}
              @Override
                public Void visitactionScopeName
                (ANTLRv4Parser.actionScopeName
                 Context ctx) {{
                // Logic to print the current rule's name
                System.out.println(
"actionScopeName
                           ")
;
                           return visitChildren(
ctx)
;
                           }
}

                @Override
                public Void visitactionBlock
                (
ANTLRv4Parser.actionBlock
                 Context ctx)
 {
{

                  // Logic to print the current rule's name
                  System.out.println("actionBlock
                           ");
                           return visitChildren(ctx);
                           }}
                @Override
                  public Void visitargActionBlock
                  (ANTLRv4Parser.argActionBlock
                   Context ctx) {{
                  // Logic to print the current rule's name
                  System.out.println(
"argActionBlock
                             ")
;
                             return visitChildren(
ctx)
;
                             }
}

                  @Override
                  public Void visitmodeSpec
                  (
ANTLRv4Parser.modeSpec
                   Context ctx)
 {
{

                    // Logic to print the current rule's name
                    System.out.println("modeSpec
                             ");
                             return visitChildren(ctx);
                             }}
                  @Override
                    public Void visitrules
                    (ANTLRv4Parser.rules
                     Context ctx) {{
                    // Logic to print the current rule's name
                    System.out.println(
"rules
                               ")
;
                               return visitChildren(
ctx)
;
                               }
}

                    @Override
                    public Void visitruleSpec
                    (
ANTLRv4Parser.ruleSpec
                     Context ctx)
 {
{

                      // Logic to print the current rule's name
                      System.out.println("ruleSpec
                               ");
                               return visitChildren(ctx);
                               }}
                    @Override
                      public Void visitparserRuleSpec
                      (ANTLRv4Parser.parserRuleSpec
                       Context ctx) {{
                      // Logic to print the current rule's name
                      System.out.println(
"parserRuleSpec
                                 ")
;
                                 return visitChildren(
ctx)
;
                                 }
}

                      @Override
                      public Void visitexceptionGroup
                      (
ANTLRv4Parser.exceptionGroup
                       Context ctx)
 {
{

                        // Logic to print the current rule's name
                        System.out.println("exceptionGroup
                                 ");
                                 return visitChildren(ctx);
                                 }}
                      @Override
                        public Void visitexceptionHandler
                        (ANTLRv4Parser.exceptionHandler
                         Context ctx) {{
                        // Logic to print the current rule's name
                        System.out.println(
"exceptionHandler
                                   ")
;
                                   return visitChildren(
ctx)
;
                                   }
}

                        @Override
                        public Void visitfinallyClause
                        (
ANTLRv4Parser.finallyClause
                         Context ctx)
 {
{

                          // Logic to print the current rule's name
                          System.out.println("finallyClause
                                   ");
                                   return visitChildren(ctx);
                                   }}
                        @Override
                          public Void visitrulePrequel
                          (ANTLRv4Parser.rulePrequel
                           Context ctx) {{
                          // Logic to print the current rule's name
                          System.out.println(
"rulePrequel
                                     ")
;
                                     return visitChildren(
ctx)
;
                                     }
}

                          @Override
                          public Void visitruleReturns
                          (
ANTLRv4Parser.ruleReturns
                           Context ctx)
 {
{

                            // Logic to print the current rule's name
                            System.out.println("ruleReturns
                                     ");
                                     return visitChildren(ctx);
                                     }}
                          @Override
                            public Void visitthrowsSpec
                            (ANTLRv4Parser.throwsSpec
                             Context ctx) {{
                            // Logic to print the current rule's name
                            System.out.println(
"throwsSpec
                                       ")
;
                                       return visitChildren(
ctx)
;
                                       }
}

                            @Override
                            public Void visitlocalsSpec
                            (
ANTLRv4Parser.localsSpec
                             Context ctx)
 {
{

                              // Logic to print the current rule's name
                              System.out.println("localsSpec
                                       ");
                                       return visitChildren(ctx);
                                       }}
                            @Override
                              public Void visitruleAction
                              (ANTLRv4Parser.ruleAction
                               Context ctx) {{
                              // Logic to print the current rule's name
                              System.out.println(
"ruleAction
                                         ")
;
                                         return visitChildren(
ctx)
;
                                         }
}

                              @Override
                              public Void visitruleModifiers
                              (
ANTLRv4Parser.ruleModifiers
                               Context ctx)
 {
{

                                // Logic to print the current rule's name
                                System.out.println("ruleModifiers
                                         ");
                                         return visitChildren(ctx);
                                         }}
                              @Override
                                public Void visitruleModifier
                                (ANTLRv4Parser.ruleModifier
                                 Context ctx) {{
                                // Logic to print the current rule's name
                                System.out.println(
"ruleModifier
                                           ")
;
                                           return visitChildren(
ctx)
;
                                           }
}

                                @Override
                                public Void visitruleBlock
                                (
ANTLRv4Parser.ruleBlock
                                 Context ctx)
 {
{

                                  // Logic to print the current rule's name
                                  System.out.println("ruleBlock
                                           ");
                                           return visitChildren(ctx);
                                           }}
                                @Override
                                  public Void visitruleAltList
                                  (ANTLRv4Parser.ruleAltList
                                   Context ctx) {{
                                  // Logic to print the current rule's name
                                  System.out.println(
"ruleAltList
                                             ")
;
                                             return visitChildren(
ctx)
;
                                             }
}

                                  @Override
                                  public Void visitlabeledAlt
                                  (
ANTLRv4Parser.labeledAlt
                                   Context ctx)
 {
{

                                    // Logic to print the current rule's name
                                    System.out.println("labeledAlt
                                             ");
                                             return visitChildren(ctx);
                                             }}
                                  @Override
                                    public Void visitlexerRuleSpec
                                    (ANTLRv4Parser.lexerRuleSpec
                                     Context ctx) {{
                                    // Logic to print the current rule's name
                                    System.out.println(
"lexerRuleSpec
                                               ")
;
                                               return visitChildren(
ctx)
;
                                               }
}

                                    @Override
                                    public Void visitlexerRuleBlock
                                    (
ANTLRv4Parser.lexerRuleBlock
                                     Context ctx)
 {
{

                                      // Logic to print the current rule's name
                                      System.out.println("lexerRuleBlock
                                               ");
                                               return visitChildren(ctx);
                                               }}
                                    @Override
                                      public Void visitlexerAltList
                                      (ANTLRv4Parser.lexerAltList
                                       Context ctx) {{
                                      // Logic to print the current rule's name
                                      System.out.println(
"lexerAltList
                                                 ")
;
                                                 return visitChildren(
ctx)
;
                                                 }
}

                                      @Override
                                      public Void visitlexerAlt
                                      (
ANTLRv4Parser.lexerAlt
                                       Context ctx)
 {
{

                                        // Logic to print the current rule's name
                                        System.out.println("lexerAlt
                                                 ");
                                                 return visitChildren(ctx);
                                                 }}
                                      @Override
                                        public Void visitlexerElements
                                        (ANTLRv4Parser.lexerElements
                                         Context ctx) {{
                                        // Logic to print the current rule's name
                                        System.out.println(
"lexerElements
                                                   ")
;
                                                   return visitChildren(
ctx)
;
                                                   }
}

                                        @Override
                                        public Void visitlexerElement
                                        (
ANTLRv4Parser.lexerElement
                                         Context ctx)
 {
{

                                          // Logic to print the current rule's name
                                          System.out.println("lexerElement
                                                   ");
                                                   return visitChildren(ctx);
                                                   }}
                                        @Override
                                          public Void visitlexerBlock
                                          (ANTLRv4Parser.lexerBlock
                                           Context ctx) {{
                                          // Logic to print the current rule's name
                                          System.out.println(
"lexerBlock
                                                     ")
;
                                                     return visitChildren(
ctx)
;
                                                     }
}

                                          @Override
                                          public Void visitlexerCommands
                                          (
ANTLRv4Parser.lexerCommands
                                           Context ctx)
 {
{

                                            // Logic to print the current rule's name
                                            System.out.println("lexerCommands
                                                     ");
                                                     return visitChildren(ctx);
                                                     }}
                                          @Override
                                            public Void visitlexerCommand
                                            (ANTLRv4Parser.lexerCommand
                                             Context ctx) {{
                                            // Logic to print the current rule's name
                                            System.out.println(
"lexerCommand
                                                       ")
;
                                                       return visitChildren(
ctx)
;
                                                       }
}

                                            @Override
                                            public Void visitlexerCommandName
                                            (
ANTLRv4Parser.lexerCommandName
                                             Context ctx)
 {
{

                                              // Logic to print the current rule's name
                                              System.out.println("lexerCommandName
                                                       ");
                                                       return visitChildren(ctx);
                                                       }}
                                            @Override
                                              public Void visitlexerCommandExpr
                                              (ANTLRv4Parser.lexerCommandExpr
                                               Context ctx) {{
                                              // Logic to print the current rule's name
                                              System.out.println(
"lexerCommandExpr
                                                         ")
;
                                                         return visitChildren(
ctx)
;
                                                         }
}

                                              @Override
                                              public Void visitaltList
                                              (
ANTLRv4Parser.altList
                                               Context ctx)
 {
{

                                                // Logic to print the current rule's name
                                                System.out.println("altList
                                                         ");
                                                         return visitChildren(ctx);
                                                         }}
                                              @Override
                                                public Void visitalternative
                                                (ANTLRv4Parser.alternative
                                                 Context ctx) {{
                                                // Logic to print the current rule's name
                                                System.out.println(
"alternative
                                                           ")
;
                                                           return visitChildren(
ctx)
;
                                                           }
}

                                                @Override
                                                public Void visitelement
                                                (
ANTLRv4Parser.element
                                                 Context ctx)
 {
{

                                                  // Logic to print the current rule's name
                                                  System.out.println("element
                                                           ");
                                                           return visitChildren(ctx);
                                                           }}
                                                @Override
                                                  public Void visitpredicateOptions
                                                  (ANTLRv4Parser.predicateOptions
                                                   Context ctx) {{
                                                  // Logic to print the current rule's name
                                                  System.out.println(
"predicateOptions
                                                             ")
;
                                                             return visitChildren(
ctx)
;
                                                             }
}

                                                  @Override
                                                  public Void visitpredicateOption
                                                  (
ANTLRv4Parser.predicateOption
                                                   Context ctx)
 {
{

                                                    // Logic to print the current rule's name
                                                    System.out.println("predicateOption
                                                             ");
                                                             return visitChildren(ctx);
                                                             }}
                                                  @Override
                                                    public Void visitlabeledElement
                                                    (ANTLRv4Parser.labeledElement
                                                     Context ctx) {{
                                                    // Logic to print the current rule's name
                                                    System.out.println(
"labeledElement
                                                               ")
;
                                                               return visitChildren(
ctx)
;
                                                               }
}

                                                    @Override
                                                    public Void visitebnf
                                                    (
ANTLRv4Parser.ebnf
                                                     Context ctx)
 {
{

                                                      // Logic to print the current rule's name
                                                      System.out.println("ebnf
                                                               ");
                                                               return visitChildren(ctx);
                                                               }}
  @Override
  public Void visitblockSuffix
  (ANTLRv4Parser.blockSuffix
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"blockSuffix
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitebnfSuffix
  (
ANTLRv4Parser.ebnfSuffix
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("ebnfSuffix
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitlexerAtom
  (ANTLRv4Parser.lexerAtom
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"lexerAtom
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitatom
  (
ANTLRv4Parser.atom
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("atom
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitnotSet
  (ANTLRv4Parser.notSet
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"notSet
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitblockSet
  (
ANTLRv4Parser.blockSet
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("blockSet
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitsetElement
  (ANTLRv4Parser.setElement
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"setElement
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitblock
  (
ANTLRv4Parser.block
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("block
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitruleref
  (ANTLRv4Parser.ruleref
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"ruleref
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitcharacterRange
  (
ANTLRv4Parser.characterRange
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("characterRange
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitterminalDef
  (ANTLRv4Parser.terminalDef
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"terminalDef
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitelementOptions
  (
ANTLRv4Parser.elementOptions
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("elementOptions
  ");
    return visitChildren(ctx);
  }}
  @Override
  public Void visitelementOption
  (ANTLRv4Parser.elementOption
  Context ctx) {{
    // Logic to print the current rule's name
    System.out.println(
"elementOption
  ")
;
    return visitChildren(
ctx)
;
  }
}

  @Override
  public Void visitidentifier
  (
ANTLRv4Parser.identifier
  Context ctx)
 {
{

    // Logic to print the current rule's name
    System.out.println("identifier
  ");
    return visitChildren(ctx);
  }}

}
