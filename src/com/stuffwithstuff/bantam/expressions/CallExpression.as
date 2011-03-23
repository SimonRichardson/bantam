package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.utils.StringBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class CallExpression implements Expression
	{

		private var _method : Expression;

		private var _args : Vector.<Expression>;

		public function CallExpression(method : Expression, args : Vector.<Expression>)
		{
			_method = method;
			_args = args;
		}

		public function print(builder : StringBuilder) : void
		{
			_method.print(builder);
			builder.append("(");
			const total : int = _args.length;
			for (var i : int = 0; i < total; i++)
			{
				_args[i].print(builder);
				if (i < total - 1) builder.append(", ");
			}
			builder.append(")");
		}
	}
}
