package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.TokenType;
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class OperatorExpression implements Expression
	{

		private var _left : Expression;

		private var _operator : TokenType;

		private var _right : Expression;

		public function OperatorExpression(left : Expression, operator : TokenType, right : Expression)
		{
			_left = left;
			_operator = operator;
			_right = right;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append("(");
			_left.print(builder);
			builder.append(" ").append(_operator.punctuator).append(" ");
			_right.print(builder);
			builder.append(")");
		}
	}
}
