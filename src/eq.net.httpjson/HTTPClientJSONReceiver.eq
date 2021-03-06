
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

public class HTTPClientJSONReceiver : HTTPClientStringReceiver
{
	public virtual void on_json_response(Object data, HTTPClientStringResponse resp) {
	}

	public void on_string_response(HTTPClientStringResponse resp) {
		var ct = resp.get_mime_type();
		if(ct == null) {
			on_json_response(null, resp);
			return;
		}
		var sp = ct.split((int)';', 2);
		if(sp == null) {
			on_json_response(null, resp);
			return;
		}
		var cts = String.as_string(sp.next());
		if("application/json".equals(cts) == false || String.is_empty(resp.get_data())) {
			on_json_response(null, resp);
			return;
		}
		on_json_response(JSONParser.parse_string(resp.get_data()), resp);
	}
}
