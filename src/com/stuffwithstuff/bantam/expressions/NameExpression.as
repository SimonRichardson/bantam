package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.utils.StringBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class NameExpression implements Expression
	{

		private var _name : String;

		public function NameExpression(name : String)
		{
			_name = name;
		}

		public function get name() : String
		{
			return _name;
		}

		public function print(builder : StringBuilder) : void
		{
			builder.append(_name);
		}
	}
}
