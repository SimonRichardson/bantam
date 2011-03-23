package com.stuffwithstuff.bantam.parselets
{
	import com.stuffwithstuff.bantam.Parser;
	import com.stuffwithstuff.bantam.Token;
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.expressions.Expression;
	import com.stuffwithstuff.bantam.expressions.OperatorExpression;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class BinaryOperatorParselet implements InfixParselet
	{

		private var  _operator : TokenType;

		private var  _precedence : int;

		private var  _isRight : Boolean;

		public function BinaryOperatorParselet(operator : TokenType, precedence : int, isRight : Boolean)
		{
			_operator = operator;
			_precedence = precedence;
			_isRight = isRight;
		}

		public function parse(parser : Parser, left : Expression, token : Token) : Expression
		{
			// To handle right-associative operators like "^", we allow a slightly
			// lower precedence when parsing the right-hand side. This will let a
			// parselet with the same precedence appear on the right, which will then
			// take *this* parselet's result as its left-hand argument.
			const right : Expression = parser.parseExpressionBy(_precedence - (_isRight ? 1 : 0));

			return new OperatorExpression(left, _operator, right);
		}

		public function get precedence() : int
		{
			return _precedence;
		}
	}
}
