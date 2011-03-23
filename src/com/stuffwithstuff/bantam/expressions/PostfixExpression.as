package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class PostfixExpression implements Expression
	{

		private var _left : Expression;

		private var _operator : TokenType;

		public function PostfixExpression(left : Expression, operator : TokenType)
		{
			_left = left;
			_operator = operator;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append("(");
			_left.print(builder);
			builder.append(_operator.punctuator).append(")");
		}
	}
}
