@isTest
private class FluentHTMLTest {
    
    private static testMethod void render_empty(){
        string output = new FluentHTML()
                            .render();
                            
        System.assertEquals('', output.trim());
    }
    
    private static testMethod void img(){
    	string output = new FluentHTML()
	              .img('img1', 'http://someurl', null)
	              .render();
	              
		System.assertEquals('<img id="img1" src="http://someurl" />', output);
    }

    private static testMethod void br(){
    	string output = new FluentHTML()
	              .br()
	              .render();
	              
		System.assertEquals('<br />', output);
    }
    
    private static testMethod void ul(){
    	string output = new FluentHTML()
	              .ul( 'list1', new FluentHTML.LIFactory()
	                    .li('item 1')
	                    .li('item 2') ) 
	              .render();
	              
		System.assertEquals('<ul id="list1"><li>item 1</li><li>item 2</li></ul>', output);
    }

    private static testMethod void ol(){
    	string output = new FluentHTML()
	              .ol( 'list1', new FluentHTML.LIFactory()
	                    .li('item 1')
	                    .li('item 2') ) 
	              .render();
	              
		System.assertEquals('<ol id="list1"><li>item 1</li><li>item 2</li></ol>', output);
    }

    private static testMethod void input(){
    	string output = new FluentHTML()
	              .input('id','button','hello')
	              .render();
	              
		System.assertEquals('<input id="id" type="button" value="hello" />', output);
    }

    private static testMethod void span(){
    	string output = new FluentHTML()
	              .span('id1','text') 
	              .span('id2', 'text', null)
	              .render();
	              
		System.assertEquals('<span id="id1">text</span><span id="id2">text</span>', output);
    }

    private static testMethod void div(){
    	string output = new FluentHTML()
	              .div('id1','text') 
	              .div('id2', 'text', null)
	              .render();
	              
		System.assertEquals('<div id="id1">text</div><div id="id2">text</div>', output);
    }                       

    private static testMethod void p(){
    	string output = new FluentHTML()
	              .p('id1','text') 
	              .p('id2', 'text', null)
	              .render();
	              
		System.assertEquals('<p id="id1">text</p><p id="id2">text</p>', output);
    } 

    private static testMethod void a(){
    	string output = new FluentHTML()
	              .a('id', 'href', 'hello')
	              .render();
	              
		System.assertEquals('<a id="id" href="href">hello</a>', output);
    } 
                                       
    private static testMethod void generic(){
    	string output = new FluentHTML()
	              .generic('tag','test', new Map<string,string>{'id'=>'111'})
	              .render();
	              
		System.assertEquals('<tag id="111">test</tag>', output);
    } 

    private static testMethod void table(){
    	string output = new FluentHTML()
	              .table('id', new Map<string,string>{'attr'=>'111'}, new FluentHTML.TRFactory()
	              				.tr( new Map<string,string>{'rowid'=>'r1'}, new FluentHTML.TDFactory()
	              					.td('test', new Map<string,string>{'colid'=>'c1'}, null ) ) )
	              .render();
	              
		System.assertEquals('<table id="id" attr="111"><tr rowid="r1"><td colid="c1">test</td></tr></table>', output);
    } 

	private static testMethod void abbr(){
		string output = new FluentHTML()
							.abbr('id1', 'the title', 'some text', null)
							.render();
							
		system.assertEquals('<abbr id="id1" title="the title">some text</abbr>', output);
	}                                
                                
	private static testMethod void address(){
		string output = new FluentHTML()
							.address('id1', 'some inner text')
							.render();
							
		system.assertEquals('<address id="id1">some inner text</address>', output);
	}
	
	private static testMethod void address_withinner(){
		string output = new FluentHTML()
							.address('id1', null, 
								new FluentHTML().br())
							.render();
							
		system.assertEquals('<address id="id1"><br /></address>', output);
	}                                                  
    
    private static testMethod void article(){
    	string output = new FluentHTML()
    						.article('id1', 'some text')
    						.render();
    						
    	system.assertEquals('<article id="id1">some text</article>', output);
    } 

    private static testMethod void article_withinner(){
    	string output = new FluentHTML()
    						.article('id1', null,
    							new FluentHTML().br())
    						.render();
    						
    	system.assertEquals('<article id="id1"><br /></article>', output);
    } 
    
    private static testMethod void aside(){
    	string output = new FluentHTML()
    						.aside('id1', 'some text')
    						.render();
    						
    	system.assertEquals('<aside id="id1">some text</aside>', output);
    } 
    
    private static testMethod void aside_withinner(){
    	string output = new FluentHTML()
    						.aside('id1', null,
    							new FluentHTML().br())
    						.render();
    						
    	system.assertEquals('<aside id="id1"><br /></aside>', output);
    } 
    
    private static testMethod void audio(){
    	string output = new FluentHTML()
    						.audio('id1', null, 'some text', 
    							new FluentHTML.sourceFactory().source(new Map<string,string>{'src'=>'yyy'}))
    						.render();
    	
    	system.assertEquals('<audio id="id1">some text<source src="yyy"></source></audio>', output);
    } 
    
    private static testMethod void b_plain(){
    	string output = new FluentHTML()
    						.b('some text')
    						.render();
    	
    	system.assertEquals('<b>some text</b>', output);
    } 
  
    private static testMethod void b_attrs(){
    	string output = new FluentHTML()
    						.b('id1', 'some text', null)
    						.render();
    	
    	system.assertEquals('<b id="id1">some text</b>', output);
    } 
  
    private static testMethod void bdo(){
    	string output = new FluentHTML()
    						.bdo('id1', 'some text', null)
    						.render();
    	
    	system.assertEquals('<bdo id="id1">some text</bdo>', output);
    }    

    private static testMethod void blockquote(){
    	string output = new FluentHTML()
    						.blockquote('id1', 'some text')
    						.render();
    						
    	system.assertEquals('<blockquote id="id1">some text</blockquote>', output);
    } 
    
    private static testMethod void blockquote_withinner(){
    	string output = new FluentHTML()
    						.blockquote('id1', null,
    							new FluentHTML().br())
    						.render();
    						
    	system.assertEquals('<blockquote id="id1"><br /></blockquote>', output);
    }     
  
    private static testMethod void br_attrs(){
    	string output = new FluentHTML()
    						.br('id1', null)
    						.render();
    	
    	system.assertEquals('<br id="id1" />', output);
    }
    
}