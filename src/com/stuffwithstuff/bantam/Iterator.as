package com.stuffwithstuff.bantam
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface Iterator
	{

		function hasNext() : Boolean;

		function get next() : Token;
	}
}
