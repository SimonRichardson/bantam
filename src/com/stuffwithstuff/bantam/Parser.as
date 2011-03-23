package com.stuffwithstuff.bantam
{
	import com.stuffwithstuff.bantam.expressions.Expression;
	import com.stuffwithstuff.bantam.parselets.InfixParselet;
	import com.stuffwithstuff.bantam.parselets.PrefixParselet;

	import flash.utils.Dictionary;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class Parser
	{

		private var _tokens : Iterator;

		private const _read : Vector.<Token> = new Vector.<Token>();

		private const _prefixParselets : Dictionary = new Dictionary();

		private const _infixParselets : Dictionary = new Dictionary();

		public function Parser(tokens : Iterator)
		{
			_tokens = tokens;
		}

		public function registerPrefix(token : TokenType, parselet : PrefixParselet) : void
		{
			_prefixParselets[token] = parselet;
		}

		public function registerInfix(token : TokenType, parselet : InfixParselet) : void
		{
			_infixParselets[token] = parselet;
		}

		public function parseExpressionBy(precedence : int) : Expression
		{
			var token : Token = consume();
			const prefix : PrefixParselet = _prefixParselets[token.type];

			if (prefix == null) throw new ParseException("Could not parse \"" + token.text + "\".");

			var left : Expression = prefix.parse(this, token);
			
			while (precedence < this.precedence)
			{
				token = consume();

				const infix : InfixParselet = _infixParselets[token.type];
				left = infix.parse(this, left, token);
			}

			return left;
		}

		public function parseExpression() : Expression
		{
			return parseExpressionBy(0);
		}

		public function match(expected : TokenType) : Boolean
		{
			const token : Token = lookAhead(0);
			if (token.type != expected)
			{
				return false;
			}

			consume();
			return true;
		}

		public function consumeToken(expected : TokenType) : Token
		{
			const token : Token = lookAhead(0);
			if (token.type != expected)
			{
				throw new ParseException("Expected token " + expected + " and found " + token.type);
			}

			return consume();
		}

		public function consume() : Token
		{
			// Make sure we've read the token.
			lookAhead(0);
			
			return _read.shift();
		}

		internal function lookAhead(distance : int) : Token
		{
			// Read in as many as needed.
			while (distance >= _read.length)
			{
				_read.push(_tokens.next);
			}
			
			// Get the queued token.
			return _read[distance];
		}

		internal function get precedence() : int
		{
			const parser : InfixParselet = _infixParselets[lookAhead(0).type];
			if (parser != null) 
				return parser.precedence;

			return 0;
		}
	}
}
