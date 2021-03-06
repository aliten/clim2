/*
 * copyright (c) 1992-2002 Franz Inc, Berkeley, CA  All rights reserved.
 * copyright (c) 2002-2007 Franz Inc, Oakland, CA - All rights reserved.
 *
 * The software, data and information contained herein are proprietary
 * to, and comprise valuable trade secrets of, Franz, Inc.  They are
 * given in confidence by Franz, Inc. pursuant to a written license
 * agreement, and may be stored and used only in accordance with the terms
 * of such license.
 *
 * Restricted Rights Legend
 * ------------------------
 * Use, duplication, and disclosure of the software, data and information
 * contained herein by any agency, department or entity of the U.S.
 * Government are subject to restrictions of Restricted Rights for
 * Commercial Software developed at private expense as specified in 
 * DOD FAR Supplement 52.227-7013 (c) (1) (ii), as applicable.
 *
 * $Id: xlibsupport.c,v 2.6 2007/04/17 21:45:54 layer Exp $
 */

/************************************************************************/
/* Support code for Xlib interface                                      */
/************************************************************************/

#include <X11/Xlib.h>

lisp_XDrawString(dpy, d, gc, x, y, string, start, end)
    register Display *dpy;
    Drawable d;
    GC gc;
    int x, y;
    register char *string;
    register int start, end;
{
    XDrawString(dpy, d, gc, x, y, &string[start], end - start);
}

lisp_XDrawString16(dpy, d, gc, x, y, string, start, end)
    register Display *dpy;
    Drawable d;
    GC gc;
    int x, y;
    register XChar2b *string;
    register int start, end;
{
    XDrawString16(dpy, d, gc, x, y, &string[start], end - start);
}
