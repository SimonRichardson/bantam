package com.stuffwithstuff.bantam
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class Precedence
	{

		// Ordered in increasing precedence.
		public static const ASSIGNMENT : int = 1;

		public static const CONDITIONAL : int = 2;

		public static const SUM : int = 3;

		public static const PRODUCT : int = 4;

		public static const EXPONENT : int = 5;

		public static const PREFIX : int = 6;

		public static const POSTFIX : int = 7;

		public static const CALL : int = 8;
	}
}
