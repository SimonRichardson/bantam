package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class PrefixExpression implements Expression
	{

		private var _operator : TokenType;

		private var _right : Expression;

		public function PrefixExpression(operator : TokenType, right : Expression)
		{
			_operator = operator;
			_right = right;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append("(").append(_operator.punctuator);
			_right.print(builder);
			builder.append(")");
		}
	}
}
