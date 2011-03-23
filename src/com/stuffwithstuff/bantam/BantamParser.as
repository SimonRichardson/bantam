package com.stuffwithstuff.bantam
{
	import com.stuffwithstuff.bantam.parselets.AssignParselet;
	import com.stuffwithstuff.bantam.parselets.BinaryOperatorParselet;
	import com.stuffwithstuff.bantam.parselets.CallParselet;
	import com.stuffwithstuff.bantam.parselets.ConditionalParselet;
	import com.stuffwithstuff.bantam.parselets.GroupParselet;
	import com.stuffwithstuff.bantam.parselets.NameParselet;
	import com.stuffwithstuff.bantam.parselets.PostfixOperatorParselet;
	import com.stuffwithstuff.bantam.parselets.PrefixOperatorParselet;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class BantamParser extends Parser
	{

		public function BantamParser(lexer : Lexer)
		{
			super(lexer);

			// Register all of the parselets for the grammar.

			// Register the ones that need special parselets.
			registerPrefix(TokenType.NAME, new NameParselet());
			registerInfix(TokenType.ASSIGN, new AssignParselet());
			registerInfix(TokenType.QUESTION, new ConditionalParselet());
			registerPrefix(TokenType.LEFT_PAREN, new GroupParselet());
			registerInfix(TokenType.LEFT_PAREN, new CallParselet());

			// Register the simple operator parselets.
			prefix(TokenType.PLUS, Precedence.PREFIX);
			prefix(TokenType.MINUS, Precedence.PREFIX);
			prefix(TokenType.TILDE, Precedence.PREFIX);
			prefix(TokenType.BANG, Precedence.PREFIX);

			// For kicks, we'll make "!" both prefix and postfix, kind of like ++.
			postfix(TokenType.BANG, Precedence.POSTFIX);

			infixLeft(TokenType.PLUS, Precedence.SUM);
			infixLeft(TokenType.MINUS, Precedence.SUM);
			infixLeft(TokenType.ASTERISK, Precedence.PRODUCT);
			infixLeft(TokenType.SLASH, Precedence.PRODUCT);
			infixRight(TokenType.CARET, Precedence.EXPONENT);
		}

		/**
		 * Registers a postfix unary operator parselet for the given token and
		 * precedence.
		 */
		public function postfix(token : TokenType, precedence : int) : void
		{
			registerInfix(token, new PostfixOperatorParselet(token, precedence));
		}

		/**
		 * Registers a prefix unary operator parselet for the given token and
		 * precedence.
		 */
		public function prefix(token : TokenType, precedence : int) : void
		{
			registerPrefix(token, new PrefixOperatorParselet(token, precedence));
		}

		/**
		 * Registers a left-associative binary operator parselet for the given token
		 * and precedence.
		 */
		public function infixLeft(token : TokenType, precedence : int) : void
		{
			registerInfix(token, new BinaryOperatorParselet(token, precedence, false));
		}

		/**
		 * Registers a right-associative binary operator parselet for the given token
		 * and precedence.
		 */
		public function infixRight(token : TokenType, precedence : int) : void
		{
			registerInfix(token, new BinaryOperatorParselet(token, precedence, true));
		}
	}
}
