package com.stuffwithstuff.bantam.parselets
{
	import com.stuffwithstuff.bantam.Parser;
	import com.stuffwithstuff.bantam.Token;
	import com.stuffwithstuff.bantam.expressions.Expression;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface PrefixParselet
	{
		function parse(parser : Parser, token : Token) : Expression;
	}
}
