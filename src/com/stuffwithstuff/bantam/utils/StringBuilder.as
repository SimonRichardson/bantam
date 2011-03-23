package com.stuffwithstuff.bantam.utils
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class StringBuilder
	{

		private var _string : String;

		public function StringBuilder(string : String = "") : void
		{
			_string = string;
		}

		public function append(string : String) : StringBuilder
		{
			_string += string;
			return this;
		}

		public function toString() : String
		{
			return _string;
		}
	}
}
