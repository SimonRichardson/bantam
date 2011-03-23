package com.stuffwithstuff.bantam
{
	import com.stuffwithstuff.bantam.expressions.Expression;
	import com.stuffwithstuff.bantam.utils.StringBuilder;

	import flash.display.Sprite;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class Main extends Sprite
	{

		private var sPassed : int = 0;

		private var sFailed : int = 0;

		public function Main()
		{
			init();
		}

		public function init() : void
		{
			test("a()", "a()");			
			test("a(b)", "a(b)");
			test("a(b, c)", "a(b, c)");
			test("a(b)(c)", "a(b)(c)");
			test("a(b) + c(d)", "(a(b) + c(d))");
			test("a(b ? c : d, e + f)", "a((b ? c : d), (e + f))");

			// Unary precedence.
			test("~!-+a", "(~(!(-(+a))))");
			test("a!!!", "(((a!)!)!)");

			// Unary and binary predecence.
			test("-a * b", "((-a) * b)");
			test("!a + b", "((!a) + b)");
			test("~a ^ b", "((~a) ^ b)");
			test("-a!", "(-(a!))");
			test("!a!", "(!(a!))");

			// Binary precedence.
			test("a = b + c * d ^ e - f / g", "(a = ((b + (c * (d ^ e))) - (f / g)))");

			// Binary associativity.
			test("a = b = c", "(a = (b = c))");
			test("a + b - c", "((a + b) - c)");
			test("a * b / c", "((a * b) / c)");
			test("a ^ b ^ c", "(a ^ (b ^ c))");

			// Conditional operator.
			test("a ? b : c ? d : e", "(a ? b : (c ? d : e))");
			test("a ? b ? c : d : e", "(a ? (b ? c : d) : e)");
			test("a + b ? c * d : e / f", "((a + b) ? (c * d) : (e / f))");

			// Grouping.
			test("a + (b + c) + d", "((a + (b + c)) + d)");
			test("a ^ (b + c)", "(a ^ (b + c))");
			test("(!a)!", "((!a)!)");

			if (sFailed == 0)
			{
				trace("Passed all " + sPassed + " tests.");
			}
			else
			{
				trace("----");
				trace("Failed " + sFailed + " out of " + (sFailed + sPassed) + " tests.");
			}
		}

		public function test(source : String, expected : String) : void
		{
			const lexer : Lexer = new Lexer(source);
			const parser : Parser = new BantamParser(lexer);

			try
			{
				const result : Expression = parser.parseExpression();
				const builder : StringBuilder = new StringBuilder();
				result.print(builder);
				const actual : String = builder.toString();

				if (expected == actual)
				{
					sPassed++;
				}
				else
				{
					sFailed++;
					trace("[FAIL] Expected: " + expected);
					trace("         Actual: " + actual);
				}
			}
			catch(ex : ParseException)
			{
				sFailed++;
				trace("[FAIL] Expected: " + expected);
				trace("          Error: " + ex.message);
			}
		}
	}
}
