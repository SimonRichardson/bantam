package com.stuffwithstuff.bantam.expressions
{
	import com.stuffwithstuff.bantam.utils.StringBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface Expression
	{
		function print(builder : StringBuilder) : void;
	}
}
