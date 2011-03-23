package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class ConditionalExpression implements Expression
	{

		private var _condition : Expression;

		private var _thenArm : Expression;

		private var _elseArm : Expression;

		public function ConditionalExpression(condition : Expression, thenArm : Expression, elseArm : Expression)
		{
			_condition = condition;
			_thenArm = thenArm;
			_elseArm = elseArm;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append("(");
			_condition.print(builder);
			builder.append(" ? ");
			_thenArm.print(builder);
			builder.append(" : ");
			_elseArm.print(builder);
			builder.append(")");
		}
	}
}
