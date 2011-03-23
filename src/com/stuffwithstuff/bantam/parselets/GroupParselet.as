package com.stuffwithstuff.bantam.parselets
{
	import com.stuffwithstuff.bantam.Parser;
	import com.stuffwithstuff.bantam.Token;
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.expressions.Expression;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class GroupParselet implements PrefixParselet
	{

		public function parse(parser : Parser, token : Token) : Expression
		{
			const expression : Expression = parser.parseExpression();
			parser.consumeToken(TokenType.RIGHT_PAREN);
			return expression;
		}
	}
}
