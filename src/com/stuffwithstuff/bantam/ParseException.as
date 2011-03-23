package com.stuffwithstuff.bantam
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class ParseException
	{

		private var _message : String;

		public function ParseException(message : String)
		{
			_message = message;
		}

		public function get message() : String
		{
			return _message;
		}

		public function toString() : String
		{
			return "[ParseException (message: " + _message + ")]";
		}
	}
}
