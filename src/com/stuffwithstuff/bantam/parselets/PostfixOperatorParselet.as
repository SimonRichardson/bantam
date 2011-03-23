package com.stuffwithstuff.bantam.parselets
{
	import com.stuffwithstuff.bantam.Parser;
	import com.stuffwithstuff.bantam.Token;
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.expressions.Expression;
	import com.stuffwithstuff.bantam.expressions.PostfixExpression;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class PostfixOperatorParselet implements InfixParselet
	{

		private var _operator : TokenType;

		private var _precedence : int ;

		public function PostfixOperatorParselet(operator : TokenType, precedence : int)
		{
			_operator = operator;
			_precedence = precedence;
		}

		public function parse(parser : Parser, left : Expression, token : Token) : Expression
		{
			return new PostfixExpression(left, _operator);
		}

		public function get precedence() : int
		{
			return _precedence;
		}
	}
}
