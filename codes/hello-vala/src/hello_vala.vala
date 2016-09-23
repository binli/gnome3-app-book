/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * main.c
 * Copyright (C) 2014 Bin Li <binli@gnome.org>
 * 
 */

using GLib;

public class Main : Object 
{
	public Main ()
	{
		var book = new Book("1234", "A new book");
		book.printISBN ();
	}

	static int main (string[] args) 
	{
		stdout.printf ("Hello, world\n");
		var main = new Main();
		return 0;
	}
}

