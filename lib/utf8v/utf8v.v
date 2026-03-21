module libutf8v

@[export: 'utf8v_version']
pub fn utf8v_version() &u8 {
	return unsafe { "0.0.0".str }
}


@[export: 'utf8v_strlen']
pub fn vstrlen(str &u8) int {
	vstr := unsafe { cstring_to_vstring(str) }

	return vstr.len_utf8()
}

@[export: 'utf8v_streq']
pub fn vstreq(str1 &u8, str2 &u8) bool {
	vstr1 := unsafe { cstring_to_vstring(str1) }
	vstr2 := unsafe { cstring_to_vstring(str2) }
	res := vstr1.compare(vstr2)

	return res == 0
}

@[export: 'utf8v_parseint']
pub fn vparseint(str &u8, base int, size int, out &i64) i64 {
	vstr := unsafe { cstring_to_vstring(str) }
	val := vstr.parse_int(base, size) or { 
		unsafe {
			out[0] = 0
		}
		-1
	}

	return val
}

@[export: 'utf8v_parseuint']
pub fn vparseuint(str &u8, base int, size int, out &u64) u64 {
	vstr := unsafe { cstring_to_vstring(str) }
	val := vstr.parse_uint(base, size) or { 
		unsafe {
			out[0] = 0
		}
		0xffffffffffffffff
	}

	return val
}

@[export: 'utf8v_toupper']
pub fn vtoupper(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	upper := vstr.to_upper()

	return upper.str
}

@[export: 'utf8v_trim']
pub fn vtrim(str &u8, cutset &u8) &u8 {
	vstr := unsafe { tos2(str) }
	cutsetStr := unsafe { tos2(cutset) }
	trimmed := vstr.trim(cutsetStr)

	return trimmed.str
}

@[export: 'utf8v_trimLeft']
pub fn vtrimLeft(str &u8, cutset &u8) &u8 {
	vstr := unsafe { tos2(str) }
	cutsetStr := unsafe { tos2(cutset) }
	trimmed := vstr.trim_left(cutsetStr)

	return trimmed.str
}

@[export: 'utf8v_trimRight']
pub fn vtrimRight(str &u8, cutset &u8) &u8 {
	vstr := unsafe { tos2(str) }
	cutsetStr := unsafe { tos2(cutset) }
	trimmed := vstr.trim_right(cutsetStr)

	return trimmed.str
}

@[export: 'utf8v_trimSpace']
pub fn vtrimSpace(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	trimmed := vstr.trim_space()

	return trimmed.str
}

@[export: 'utf8v_trimSpaceLeft']
pub fn vtrimSpaceLeft(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	trimmed := vstr.trim_space_left()

	return trimmed.str
}

@[export: 'utf8v_trimSpaceRight']
pub fn vtrimSpaceRight(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	trimmed := vstr.trim_space_right()

	return trimmed.str
}

@[export: 'utf8v_trimStringLeft']
pub fn vtrimStringLeft(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	trimmed := vstr.trim_string_left(vstr)

	return trimmed.str
}

@[export: 'utf8v_trimStringRight']
pub fn vtrimStringRight(str &u8) &u8 {
	vstr := unsafe { tos2(str) }
	trimmed := vstr.trim_string_right(vstr)

	return trimmed.str
}