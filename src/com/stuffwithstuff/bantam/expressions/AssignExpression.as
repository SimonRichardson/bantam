package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class AssignExpression implements Expression
	{

		private var _name : String;

		private var _right : Expression;

		public function AssignExpression(name : String, right : Expression)
		{
			_name = name;
			_right = right;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append("(").append(_name).append(" = ");
			_right.print(builder);
			builder.append(")");
		}
	}
}
