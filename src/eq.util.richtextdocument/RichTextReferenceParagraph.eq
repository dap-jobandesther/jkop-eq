
/*
 * This file is part of Jkop
 * Copyright (c) 2016 Job and Esther Technologies, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

public class RichTextReferenceParagraph : RichTextParagraph
{
	property String reference;
	property String text;

	public override String to_markup() {
		var sb = StringBuffer.create();
		sb.append("@reference ");
		sb.append(reference);
		if(String.is_empty(text) == false) {
			sb.append_c((int)' ');
			sb.append_c((int)'"');
			sb.append(text);
			sb.append_c((int)'"');
		}
		return(sb.to_string());
	}

	public override String to_text() {
		var v = text;
		if(String.is_empty(text)) {
			v = reference;
		}
		return(v);
	}

	public override HashTable to_json() {
		return(HashTable.create()
			.set("type", "reference")
			.set("reference", reference)
			.set("text", text));
	}

	public override String to_html(RichTextDocumentReferenceResolver refs, String xclass) {
		String reftitle, href;
		if(String.is_empty(text) == false) {
			reftitle = text;
		}
		if(String.is_empty(reftitle)) {
			if(refs != null) {
				reftitle = refs.get_reference_title(reference);
			}
			else {
				reftitle = reference;
			}
		}
		if(refs != null) {
			href = refs.get_reference_href(reference);
		}
		else {
			href = reference;
		}
		if(String.is_empty(href)) {
			return("");
		}
		if(String.is_empty(reftitle)) {
			reftitle = href;
		}
		var xclassh = "";
		if(String.is_empty(xclass) == false) {
			xclassh = " ".append(HTMLString.sanitize(xclass));
		}
		return("<p class=\"_rtd_reference%s\"><a href=\"%s\">%s</a></p>\n".printf().add(xclassh).add(HTMLString.sanitize(href)).add(HTMLString.sanitize(reftitle)).to_string());
	}
}
