package com.stuffwithstuff.bantam
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Token
	{

		private var _type : TokenType;

		private var _text : String;

		public function Token(type : TokenType, text : String)
		{
			_type = type;
			_text = text;
		}

		public function get type() : TokenType
		{
			return _type;
		}

		public function get text() : String
		{
			return _text;
		}

		public function toString() : String
		{
			return "[Token (text: " + _text + ")]";
		}
	}
}
