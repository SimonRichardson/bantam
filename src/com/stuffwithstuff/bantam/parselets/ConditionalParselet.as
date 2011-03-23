package com.stuffwithstuff.bantam.parselets
{
	import com.stuffwithstuff.bantam.Parser;
	import com.stuffwithstuff.bantam.Precedence;
	import com.stuffwithstuff.bantam.Token;
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.expressions.ConditionalExpression;
	import com.stuffwithstuff.bantam.expressions.Expression;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class ConditionalParselet implements InfixParselet
	{

		public function parse(parser : Parser, left : Expression, token : Token) : Expression
		{
			const thenArm : Expression = parser.parseExpression();
			parser.consumeToken(TokenType.COLON);
			const elseArm : Expression = parser.parseExpressionBy(Precedence.CONDITIONAL - 1);

			return new ConditionalExpression(left, thenArm, elseArm);
		}

		public function get precedence() : int
		{
			return Precedence.CONDITIONAL;
		}
	}
}
