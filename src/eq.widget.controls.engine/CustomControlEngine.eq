
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

public class CustomControlEngine : ControlEngine
{
	ControlEngine default_engine;

	public CustomControlEngine() {
		default_engine = DefaultControlEngine.instance();
	}

	public NumberSelectorControl create_number_selector_control() {
		return(default_engine.create_number_selector_control());
	}

	public TabbedViewControl create_tabbed_view_control() {
		return(default_engine.create_tabbed_view_control());
	}

	public ButtonControl create_button_control() {
		return(default_engine.create_button_control());
	}

	public LabelControl create_label_control() {
		return(default_engine.create_label_control());
	}

	public SolidColorControl create_solid_color_control() {
		return(default_engine.create_solid_color_control());
	}

	public TextInputControl create_text_input_control() {
		return(default_engine.create_text_input_control());
	}

	public TextAreaControl create_text_area_control() {
		return(default_engine.create_text_area_control());
	}

	public ScrollerControl create_horizontal_scroller_control(Widget widget) {
		return(default_engine.create_horizontal_scroller_control(widget));
	}

	public ScrollerControl create_vertical_scroller_control(Widget widget) {
		return(default_engine.create_vertical_scroller_control(widget));
	}

	public ScrollerControl create_horizontal_vertical_scroller_control(Widget widget) {
		return(default_engine.create_horizontal_vertical_scroller_control(widget));
	}
}
