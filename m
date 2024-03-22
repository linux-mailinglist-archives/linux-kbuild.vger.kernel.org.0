Return-Path: <linux-kbuild+bounces-1286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49242887513
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 23:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F4228284C6C
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Mar 2024 22:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9A082897;
	Fri, 22 Mar 2024 22:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os3CTRsR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A940682C6B
	for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 22:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148233; cv=none; b=r09ug3rhaPVlSdYStl2Rg+D8RWAtsyxEORtSCa0v0o5GnNUrLd1JvJkMj+Cq5UJmKwcRNsyH48GKSkoVF+1HsvDY+gShgjDCL3Mzm4T9jg9me0EmeEx+fXVat/wrv6UfLAQnQfaR5TYZDYFh34xHqMIMOrCySpqFALUiR+iLXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148233; c=relaxed/simple;
	bh=MqGmHfRvxOcm5AllqPVB6zTLyPckgwOLzXiHikLPLY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aK0amFpJro0dWv9A5iQuZMTOnzaGou1qspUDgk9Vop+XYMqP7JxKdqR5FhF0ha6X76OTTX49H5LXUmONrwSRNL3ol3lzrs1/mWj96UkZeNPhUnPfh7Onr6O5WlOuszH8jNH6QbEdy5f8UzRAakguz5p3IrVdk1av3L9plXYcXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Os3CTRsR; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d4559fb4so3338361e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2024 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148227; x=1711753027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1fOaJ01/94vfknpeVN1EFsXns8eebup1cm0DE9pW74=;
        b=Os3CTRsRjSujCjlvJ6xBUl8IxO9kTZIkhpO0MVw0Eeve6PWmw6eH9SplNddnMVYsxY
         xbhNWB/kWSLP/nQojuTDnLEUxgbn08EKnktVZBxp/lvE7u0011e+7FppzPv8h3DSr2Mw
         RDMAtpGF8vJJZEgO7eoSKqsuq5a6QH4yAjiYhXLTpFkqUI7wZI7rkAhiE6qUI2WyaBuc
         GQoJQuespt681wINXUL9EvzjT5584pPMZXhONofMatZGryKemeQ6uEOD/DTnpEZOJ82K
         5yOtt4QQELGIvEkysyWzPMGW4ObFEc4tUjFGSsLCLuFq9/ggHxcdHbGmjv9ohciC03HU
         N8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148227; x=1711753027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1fOaJ01/94vfknpeVN1EFsXns8eebup1cm0DE9pW74=;
        b=JOq8T4uHEumTtbKBSDkdGShrfycs/2raYGTtrMfyEeiT4kr4yLQ9vdIca5VWz9E8Hj
         +S0DXYyxQCfXYGnNmFa1GMea5C0p3qdeCyFn0A3LkNfr6O8PbiTQMdbvz7KNbjzEr2de
         QdbIQl2xny37QosFb3Q5CXnFvEDiTxDmJjcfJ217y9SNRZeSkwGc293YYfy+JRRdyo2N
         hFqVuizZRuiLxi3OLbip/UewJk7Ho+JSxjA5AJBmZ7N3Ny/8bCudQ15uHwfF1qd4IKb1
         Ojfivrvl9ZOYNw3A1gdwCxaR102o81cIRfW4sfIQcHv77ihU/I0iBmBgPP0z2U19TCjh
         iBVw==
X-Gm-Message-State: AOJu0Yy5JXCuz59zTXqVuHdrcV96iq6pP4W2Kd+S1F6EeIvEp6QX114C
	1tRY1EZjOT/3XX6v/D2R68HXuCQgYTVB2KGHL1TouEtO+5IDquMUk+YtfZn3M/0=
X-Google-Smtp-Source: AGHT+IEpFVJ6+5OuEjexLNXdgi1b9l0yD8qGubvzo2Iu6IvXtOSAXYBOWMT8ky9CeoESBI/JyJ6p8A==
X-Received: by 2002:a19:e055:0:b0:513:952d:ac62 with SMTP id g21-20020a19e055000000b00513952dac62mr564945lfj.52.1711148226787;
        Fri, 22 Mar 2024 15:57:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:57:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:57:01 +0200
Subject: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MqGmHfRvxOcm5AllqPVB6zTLyPckgwOLzXiHikLPLY8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy3rpkkk2po9+Bo28Vccqy4QfhQVyQP/Iw69
 lt9urT98ACJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtwAKCRCLPIo+Aiko
 1ca1CACnkyPjsq0EDsthacB68c+QuDa33kFvECCN04oL8mDNqBGJmfR1Ha0TKD1oYIMQSEnpcch
 EyPaXO5khNh4U10DI/ymAZqH3xPApzHEd+k8oWnWu8umBltU7EzvuFmyDnQb9BzKra2gI0sH+Yx
 V3+HELfBCxhViyjF5WeLM+JLCv6pKnwo4vUzOgNZA4FzeIolKOCUKaSi55sBeuSdrBf1HvCNf/J
 w8lxm4a763IRdbs4UyyihcN2yurpVuhls1c22ToaDG6HzCmpWklYbLAPeZReZ0JdGnA/8898NdJ
 jbI3ydnXORn4yH9F9PmopqzyqVIL31iYlN/YZ7Ek/b+alYu+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Import the gen_headers.py script from Mesa, commit FIXME. This script
will be used to generate MSM register files on the fly during
compilation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
 1 file changed, 957 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
new file mode 100644
index 000000000000..ae39b7e6cde8
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -0,0 +1,957 @@
+#!/usr/bin/python3
+
+import xml.parsers.expat
+import sys
+import os
+import collections
+import argparse
+import time
+import datetime
+
+class Error(Exception):
+	def __init__(self, message):
+		self.message = message
+
+class Enum(object):
+	def __init__(self, name):
+		self.name = name
+		self.values = []
+
+	def has_name(self, name):
+		for (n, value) in self.values:
+			if n == name:
+				return True
+		return False
+
+	def names(self):
+		return [n for (n, value) in self.values]
+
+	def dump(self):
+		use_hex = False
+		for (name, value) in self.values:
+			if value > 0x1000:
+				use_hex = True
+
+		print("enum %s {" % self.name)
+		for (name, value) in self.values:
+			if use_hex:
+				print("\t%s = 0x%08x," % (name, value))
+			else:
+				print("\t%s = %d," % (name, value))
+		print("};\n")
+
+	def dump_pack_struct(self):
+		pass
+
+class Field(object):
+	def __init__(self, name, low, high, shr, type, parser):
+		self.name = name
+		self.low = low
+		self.high = high
+		self.shr = shr
+		self.type = type
+
+		builtin_types = [ None, "a3xx_regid", "boolean", "uint", "hex", "int", "fixed", "ufixed", "float", "address", "waddress" ]
+
+		maxpos = parser.current_bitsize - 1
+
+		if low < 0 or low > maxpos:
+			raise parser.error("low attribute out of range: %d" % low)
+		if high < 0 or high > maxpos:
+			raise parser.error("high attribute out of range: %d" % high)
+		if high < low:
+			raise parser.error("low is greater than high: low=%d, high=%d" % (low, high))
+		if self.type == "boolean" and not low == high:
+			raise parser.error("booleans should be 1 bit fields")
+		elif self.type == "float" and not (high - low == 31 or high - low == 15):
+			raise parser.error("floats should be 16 or 32 bit fields")
+		elif not self.type in builtin_types and not self.type in parser.enums:
+			raise parser.error("unknown type '%s'" % self.type)
+
+	def ctype(self, var_name):
+		if self.type == None:
+			type = "uint32_t"
+			val = var_name
+		elif self.type == "boolean":
+			type = "bool"
+			val = var_name
+		elif self.type == "uint" or self.type == "hex" or self.type == "a3xx_regid":
+			type = "uint32_t"
+			val = var_name
+		elif self.type == "int":
+			type = "int32_t"
+			val = var_name
+		elif self.type == "fixed":
+			type = "float"
+			val = "((int32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
+		elif self.type == "ufixed":
+			type = "float"
+			val = "((uint32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
+		elif self.type == "float" and self.high - self.low == 31:
+			type = "float"
+			val = "fui(%s)" % var_name
+		elif self.type == "float" and self.high - self.low == 15:
+			type = "float"
+			val = "_mesa_float_to_half(%s)" % var_name
+		elif self.type in [ "address", "waddress" ]:
+			type = "uint64_t"
+			val = var_name
+		else:
+			type = "enum %s" % self.type
+			val = var_name
+
+		if self.shr > 0:
+			val = "(%s >> %d)" % (val, self.shr)
+
+		return (type, val)
+
+def tab_to(name, value):
+	tab_count = (68 - (len(name) & ~7)) // 8
+	if tab_count <= 0:
+		tab_count = 1
+	print(name + ('\t' * tab_count) + value)
+
+def mask(low, high):
+	return ((0xffffffffffffffff >> (64 - (high + 1 - low))) << low)
+
+def field_name(reg, f):
+	if f.name:
+		name = f.name.lower()
+	else:
+		# We hit this path when a reg is defined with no bitset fields, ie.
+		# 	<reg32 offset="0x88db" name="RB_BLIT_DST_ARRAY_PITCH" low="0" high="28" shr="6" type="uint"/>
+		name = reg.name.lower()
+
+	if (name in [ "double", "float", "int" ]) or not (name[0].isalpha()):
+			name = "_" + name
+
+	return name
+
+# indices - array of (ctype, stride, __offsets_NAME)
+def indices_varlist(indices):
+	return ", ".join(["i%d" % i for i in range(len(indices))])
+
+def indices_prototype(indices):
+	return ", ".join(["%s i%d" % (ctype, idx)
+			for (idx, (ctype, stride, offset)) in  enumerate(indices)])
+
+def indices_strides(indices):
+	return " + ".join(["0x%x*i%d" % (stride, idx)
+					if stride else
+					"%s(i%d)" % (offset, idx)
+			for (idx, (ctype, stride, offset)) in  enumerate(indices)])
+
+class Bitset(object):
+	def __init__(self, name, template):
+		self.name = name
+		self.inline = False
+		if template:
+			self.fields = template.fields[:]
+		else:
+			self.fields = []
+
+	# Get address field if there is one in the bitset, else return None:
+	def get_address_field(self):
+		for f in self.fields:
+			if f.type in [ "address", "waddress" ]:
+				return f
+		return None
+
+	def dump_regpair_builder(self, reg):
+		print("#ifndef NDEBUG")
+		known_mask = 0
+		for f in self.fields:
+			known_mask |= mask(f.low, f.high)
+			if f.type in [ "boolean", "address", "waddress" ]:
+				continue
+			type, val = f.ctype("fields.%s" % field_name(reg, f))
+			print("    assert((%-40s & 0x%08x) == 0);" % (val, 0xffffffff ^ mask(0 , f.high - f.low)))
+		print("    assert((%-40s & 0x%08x) == 0);" % ("fields.unknown", known_mask))
+		print("#endif\n")
+
+		print("    return (struct fd_reg_pair) {")
+		if reg.array:
+			print("        .reg = REG_%s(__i)," % reg.full_name)
+		else:
+			print("        .reg = REG_%s," % reg.full_name)
+
+		print("        .value =")
+		for f in self.fields:
+			if f.type in [ "address", "waddress" ]:
+				continue
+			else:
+				type, val = f.ctype("fields.%s" % field_name(reg, f))
+				print("            (%-40s << %2d) |" % (val, f.low))
+		value_name = "dword"
+		if reg.bit_size == 64:
+			value_name = "qword"
+		print("            fields.unknown | fields.%s," % (value_name,))
+
+		address = self.get_address_field()
+		if address:
+			print("        .bo = fields.bo,")
+			print("        .is_address = true,")
+			if f.type == "waddress":
+				print("        .bo_write = true,")
+			print("        .bo_offset = fields.bo_offset,")
+			print("        .bo_shift = %d," % address.shr)
+			print("        .bo_low = %d," % address.low)
+
+		print("    };")
+
+	def dump_pack_struct(self, reg=None):
+		if not reg:
+			return
+
+		prefix = reg.full_name
+
+		print("struct %s {" % prefix)
+		for f in self.fields:
+			if f.type in [ "address", "waddress" ]:
+				tab_to("    __bo_type", "bo;")
+				tab_to("    uint32_t", "bo_offset;")
+				continue
+			name = field_name(reg, f)
+
+			type, val = f.ctype("var")
+
+			tab_to("    %s" % type, "%s;" % name)
+		if reg.bit_size == 64:
+			tab_to("    uint64_t", "unknown;")
+			tab_to("    uint64_t", "qword;")
+		else:
+			tab_to("    uint32_t", "unknown;")
+			tab_to("    uint32_t", "dword;")
+		print("};\n")
+
+		if reg.array:
+			print("static inline struct fd_reg_pair\npack_%s(uint32_t __i, struct %s fields)\n{" %
+				  (prefix, prefix))
+		else:
+			print("static inline struct fd_reg_pair\npack_%s(struct %s fields)\n{" %
+				  (prefix, prefix))
+
+		self.dump_regpair_builder(reg)
+
+		print("\n}\n")
+
+		if self.get_address_field():
+			skip = ", { .reg = 0 }"
+		else:
+			skip = ""
+
+		if reg.array:
+			print("#define %s(__i, ...) pack_%s(__i, __struct_cast(%s) { __VA_ARGS__ })%s\n" %
+				  (prefix, prefix, prefix, skip))
+		else:
+			print("#define %s(...) pack_%s(__struct_cast(%s) { __VA_ARGS__ })%s\n" %
+				  (prefix, prefix, prefix, skip))
+
+
+	def dump(self, prefix=None):
+		if prefix == None:
+			prefix = self.name
+		for f in self.fields:
+			if f.name:
+				name = prefix + "_" + f.name
+			else:
+				name = prefix
+
+			if not f.name and f.low == 0 and f.shr == 0 and not f.type in ["float", "fixed", "ufixed"]:
+				pass
+			elif f.type == "boolean" or (f.type == None and f.low == f.high):
+				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
+			else:
+				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
+				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
+				type, val = f.ctype("val")
+
+				print("static inline uint32_t %s(%s val)\n{" % (name, type))
+				if f.shr > 0:
+					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
+				print("\treturn ((%s) << %s__SHIFT) & %s__MASK;\n}" % (val, name, name))
+		print()
+
+class Array(object):
+	def __init__(self, attrs, domain, variant, parent, index_type):
+		if "name" in attrs:
+			self.local_name = attrs["name"]
+		else:
+			self.local_name = ""
+		self.domain = domain
+		self.variant = variant
+		self.parent = parent
+		if self.parent:
+			self.name = self.parent.name + "_" + self.local_name
+		else:
+			self.name = self.local_name
+		if "offsets" in attrs:
+			self.offsets = map(lambda i: "0x%08x" % int(i, 0), attrs["offsets"].split(","))
+			self.fixed_offsets = True
+		elif "doffsets" in attrs:
+			self.offsets = map(lambda s: "(%s)" % s , attrs["doffsets"].split(","))
+			self.fixed_offsets = True
+		else:
+			self.offset = int(attrs["offset"], 0)
+			self.stride = int(attrs["stride"], 0)
+			self.fixed_offsets = False
+		if "index" in attrs:
+			self.index_type = index_type
+		else:
+			self.index_type = None
+		self.length = int(attrs["length"], 0)
+		if "usage" in attrs:
+			self.usages = attrs["usage"].split(',')
+		else:
+			self.usages = None
+
+	def index_ctype(self):
+		if not self.index_type:
+			return "uint32_t"
+		else:
+			return "enum %s" % self.index_type.name
+
+	# Generate array of (ctype, stride, __offsets_NAME)
+	def indices(self):
+		if self.parent:
+			indices = self.parent.indices()
+		else:
+			indices = []
+		if self.length != 1:
+			if self.fixed_offsets:
+				indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
+			else:
+				indices.append((self.index_ctype(), self.stride, None))
+		return indices
+
+	def total_offset(self):
+		offset = 0
+		if not self.fixed_offsets:
+			offset += self.offset
+		if self.parent:
+			offset += self.parent.total_offset()
+		return offset
+
+	def dump(self):
+		proto = indices_varlist(self.indices())
+		strides = indices_strides(self.indices())
+		array_offset = self.total_offset()
+		if self.fixed_offsets:
+			print("static inline uint32_t __offset_%s(%s idx)" % (self.local_name, self.index_ctype()))
+			print("{\n\tswitch (idx) {")
+			if self.index_type:
+				for val, offset in zip(self.index_type.names(), self.offsets):
+					print("\t\tcase %s: return %s;" % (val, offset))
+			else:
+				for idx, offset in enumerate(self.offsets):
+					print("\t\tcase %d: return %s;" % (idx, offset))
+			print("\t\tdefault: return INVALID_IDX(idx);")
+			print("\t}\n}")
+		if proto == '':
+			tab_to("#define REG_%s_%s" % (self.domain, self.name), "0x%08x\n" % array_offset)
+		else:
+			tab_to("#define REG_%s_%s(%s)" % (self.domain, self.name, proto), "(0x%08x + %s )\n" % (array_offset, strides))
+
+	def dump_pack_struct(self):
+		pass
+
+	def dump_regpair_builder(self):
+		pass
+
+class Reg(object):
+	def __init__(self, attrs, domain, array, bit_size):
+		self.name = attrs["name"]
+		self.domain = domain
+		self.array = array
+		self.offset = int(attrs["offset"], 0)
+		self.type = None
+		self.bit_size = bit_size
+		if array:
+			self.name = array.name + "_" + self.name
+		self.full_name = self.domain + "_" + self.name
+		if "stride" in attrs:
+			self.stride = int(attrs["stride"], 0)
+			self.length = int(attrs["length"], 0)
+		else:
+			self.stride = None
+			self.length = None
+
+	# Generate array of (ctype, stride, __offsets_NAME)
+	def indices(self):
+		if self.array:
+			indices = self.array.indices()
+		else:
+			indices = []
+		if self.stride:
+			indices.append(("uint32_t", self.stride, None))
+		return indices
+
+	def total_offset(self):
+		if self.array:
+			return self.array.total_offset() + self.offset
+		else:
+			return self.offset
+
+	def dump(self):
+		proto = indices_prototype(self.indices())
+		strides = indices_strides(self.indices())
+		offset = self.total_offset()
+		if proto == '':
+			tab_to("#define REG_%s" % self.full_name, "0x%08x" % offset)
+		else:
+			print("static inline uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (self.full_name, proto, offset, strides))
+
+		if self.bitset.inline:
+			self.bitset.dump(self.full_name)
+
+	def dump_pack_struct(self):
+		if self.bitset.inline:
+			self.bitset.dump_pack_struct(self)
+
+	def dump_regpair_builder(self):
+		if self.bitset.inline:
+			self.bitset.dump_regpair_builder(self)
+
+	def dump_py(self):
+		print("\tREG_%s = 0x%08x" % (self.full_name, self.offset))
+
+
+class Parser(object):
+	def __init__(self):
+		self.current_array = None
+		self.current_domain = None
+		self.current_prefix = None
+		self.current_prefix_type = None
+		self.current_stripe = None
+		self.current_bitset = None
+		self.current_bitsize = 32
+		# The varset attribute on the domain specifies the enum which
+		# specifies all possible hw variants:
+		self.current_varset = None
+		# Regs that have multiple variants.. we only generated the C++
+		# template based struct-packers for these
+		self.variant_regs = {}
+		# Information in which contexts regs are used, to be used in
+		# debug options
+		self.usage_regs = collections.defaultdict(list)
+		self.bitsets = {}
+		self.enums = {}
+		self.variants = set()
+		self.file = []
+		self.xml_files = []
+		self.copyright_year = None
+		self.authors = []
+		self.license = None
+
+	def error(self, message):
+		parser, filename = self.stack[-1]
+		return Error("%s:%d:%d: %s" % (filename, parser.CurrentLineNumber, parser.CurrentColumnNumber, message))
+
+	def prefix(self, variant=None):
+		if self.current_prefix_type == "variant" and variant:
+			return variant
+		elif self.current_stripe:
+			return self.current_stripe + "_" + self.current_domain
+		elif self.current_prefix:
+			return self.current_prefix + "_" + self.current_domain
+		else:
+			return self.current_domain
+
+	def parse_field(self, name, attrs):
+		try:
+			if "pos" in attrs:
+				high = low = int(attrs["pos"], 0)
+			elif "high" in attrs and "low" in attrs:
+				high = int(attrs["high"], 0)
+				low = int(attrs["low"], 0)
+			else:
+				low = 0
+				high = self.current_bitsize - 1
+
+			if "type" in attrs:
+				type = attrs["type"]
+			else:
+				type = None
+
+			if "shr" in attrs:
+				shr = int(attrs["shr"], 0)
+			else:
+				shr = 0
+
+			b = Field(name, low, high, shr, type, self)
+
+			if type == "fixed" or type == "ufixed":
+				b.radix = int(attrs["radix"], 0)
+
+			self.current_bitset.fields.append(b)
+		except ValueError as e:
+			raise self.error(e)
+
+	def parse_varset(self, attrs):
+		# Inherit the varset from the enclosing domain if not overriden:
+		varset = self.current_varset
+		if "varset" in attrs:
+			varset = self.enums[attrs["varset"]]
+		return varset
+
+	def parse_variants(self, attrs):
+		if not "variants" in attrs:
+				return None
+		variant = attrs["variants"].split(",")[0]
+		if "-" in variant:
+			variant = variant[:variant.index("-")]
+
+		varset = self.parse_varset(attrs)
+
+		assert varset.has_name(variant)
+
+		return variant
+
+	def add_all_variants(self, reg, attrs, parent_variant):
+		# TODO this should really handle *all* variants, including dealing
+		# with open ended ranges (ie. "A2XX,A4XX-") (we have the varset
+		# enum now to make that possible)
+		variant = self.parse_variants(attrs)
+		if not variant:
+			variant = parent_variant
+
+		if reg.name not in self.variant_regs:
+			self.variant_regs[reg.name] = {}
+		else:
+			# All variants must be same size:
+			v = next(iter(self.variant_regs[reg.name]))
+			assert self.variant_regs[reg.name][v].bit_size == reg.bit_size
+
+		self.variant_regs[reg.name][variant] = reg
+
+	def add_all_usages(self, reg, usages):
+		if not usages:
+			return
+
+		for usage in usages:
+			self.usage_regs[usage].append(reg)
+
+		self.variants.add(reg.domain)
+
+	def do_validate(self, schemafile):
+		try:
+			from lxml import etree
+
+			parser, filename = self.stack[-1]
+			dirname = os.path.dirname(filename)
+
+			# we expect this to look like <namespace url> schema.xsd.. I think
+			# technically it is supposed to be just a URL, but that doesn't
+			# quite match up to what we do.. Just skip over everything up to
+			# and including the first whitespace character:
+			schemafile = schemafile[schemafile.rindex(" ")+1:]
+
+			# this is a bit cheezy, but the xml file to validate could be
+			# in a child director, ie. we don't really know where the schema
+			# file is, the way the rnn C code does.  So if it doesn't exist
+			# just look one level up
+			if not os.path.exists(dirname + "/" + schemafile):
+				schemafile = "../" + schemafile
+
+			if not os.path.exists(dirname + "/" + schemafile):
+				raise self.error("Cannot find schema for: " + filename)
+
+			xmlschema_doc = etree.parse(dirname + "/" + schemafile)
+			xmlschema = etree.XMLSchema(xmlschema_doc)
+
+			xml_doc = etree.parse(filename)
+			if not xmlschema.validate(xml_doc):
+				error_str = str(xmlschema.error_log.filter_from_errors()[0])
+				raise self.error("Schema validation failed for: " + filename + "\n" + error_str)
+		except ImportError:
+			print("lxml not found, skipping validation", file=sys.stderr)
+
+	def do_parse(self, filename):
+		filepath = os.path.abspath(filename)
+		if filepath in self.xml_files:
+			return
+		self.xml_files.append(filepath)
+		file = open(filename, "rb")
+		parser = xml.parsers.expat.ParserCreate()
+		self.stack.append((parser, filename))
+		parser.StartElementHandler = self.start_element
+		parser.EndElementHandler = self.end_element
+		parser.CharacterDataHandler = self.character_data
+		parser.buffer_text = True
+		parser.ParseFile(file)
+		self.stack.pop()
+		file.close()
+
+	def parse(self, rnn_path, filename):
+		self.path = rnn_path
+		self.stack = []
+		self.do_parse(filename)
+
+	def parse_reg(self, attrs, bit_size):
+		self.current_bitsize = bit_size
+		if "type" in attrs and attrs["type"] in self.bitsets:
+			bitset = self.bitsets[attrs["type"]]
+			if bitset.inline:
+				self.current_bitset = Bitset(attrs["name"], bitset)
+				self.current_bitset.inline = True
+			else:
+				self.current_bitset = bitset
+		else:
+			self.current_bitset = Bitset(attrs["name"], None)
+			self.current_bitset.inline = True
+			if "type" in attrs:
+				self.parse_field(None, attrs)
+
+		variant = self.parse_variants(attrs)
+		if not variant and self.current_array:
+			variant = self.current_array.variant
+
+		self.current_reg = Reg(attrs, self.prefix(variant), self.current_array, bit_size)
+		self.current_reg.bitset = self.current_bitset
+
+		if len(self.stack) == 1:
+			self.file.append(self.current_reg)
+
+		if variant is not None:
+			self.add_all_variants(self.current_reg, attrs, variant)
+
+		usages = None
+		if "usage" in attrs:
+			usages = attrs["usage"].split(',')
+		elif self.current_array:
+			usages = self.current_array.usages
+
+		self.add_all_usages(self.current_reg, usages)
+
+	def start_element(self, name, attrs):
+		self.cdata = ""
+		if name == "import":
+			filename = attrs["file"]
+			self.do_parse(os.path.join(self.path, filename))
+		elif name == "domain":
+			self.current_domain = attrs["name"]
+			if "prefix" in attrs:
+				self.current_prefix = self.parse_variants(attrs)
+				self.current_prefix_type = attrs["prefix"]
+			else:
+				self.current_prefix = None
+				self.current_prefix_type = None
+			if "varset" in attrs:
+				self.current_varset = self.enums[attrs["varset"]]
+		elif name == "stripe":
+			self.current_stripe = self.parse_variants(attrs)
+		elif name == "enum":
+			self.current_enum_value = 0
+			self.current_enum = Enum(attrs["name"])
+			self.enums[attrs["name"]] = self.current_enum
+			if len(self.stack) == 1:
+				self.file.append(self.current_enum)
+		elif name == "value":
+			if "value" in attrs:
+				value = int(attrs["value"], 0)
+			else:
+				value = self.current_enum_value
+			self.current_enum.values.append((attrs["name"], value))
+		elif name == "reg32":
+			self.parse_reg(attrs, 32)
+		elif name == "reg64":
+			self.parse_reg(attrs, 64)
+		elif name == "array":
+			self.current_bitsize = 32
+			variant = self.parse_variants(attrs)
+			index_type = self.enums[attrs["index"]] if "index" in attrs else None
+			self.current_array = Array(attrs, self.prefix(variant), variant, self.current_array, index_type)
+			if len(self.stack) == 1:
+				self.file.append(self.current_array)
+		elif name == "bitset":
+			self.current_bitset = Bitset(attrs["name"], None)
+			if "inline" in attrs and attrs["inline"] == "yes":
+				self.current_bitset.inline = True
+			self.bitsets[self.current_bitset.name] = self.current_bitset
+			if len(self.stack) == 1 and not self.current_bitset.inline:
+				self.file.append(self.current_bitset)
+		elif name == "bitfield" and self.current_bitset:
+			self.parse_field(attrs["name"], attrs)
+		elif name == "database":
+			self.do_validate(attrs["xsi:schemaLocation"])
+		elif name == "copyright":
+			self.copyright_year = attrs["year"]
+		elif name == "author":
+			self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
+
+	def end_element(self, name):
+		if name == "domain":
+			self.current_domain = None
+			self.current_prefix = None
+			self.current_prefix_type = None
+		elif name == "stripe":
+			self.current_stripe = None
+		elif name == "bitset":
+			self.current_bitset = None
+		elif name == "reg32":
+			self.current_reg = None
+		elif name == "array":
+			self.current_array = self.current_array.parent
+		elif name == "enum":
+			self.current_enum = None
+		elif name == "license":
+			self.license = self.cdata
+
+	def character_data(self, data):
+		self.cdata += data
+
+	def dump_reg_usages(self):
+		d = collections.defaultdict(list)
+		for usage, regs in self.usage_regs.items():
+			for reg in regs:
+				variants = self.variant_regs.get(reg.name)
+				if variants:
+					for variant, vreg in variants.items():
+						if reg == vreg:
+							d[(usage, variant)].append(reg)
+				else:
+					for variant in self.variants:
+						d[(usage, variant)].append(reg)
+
+		print("#ifdef __cplusplus")
+
+		for usage, regs in self.usage_regs.items():
+			print("template<chip CHIP> constexpr inline uint16_t %s_REGS[] = {};" % (usage.upper()))
+
+		for (usage, variant), regs in d.items():
+			offsets = []
+
+			for reg in regs:
+				if reg.array:
+					for i in range(reg.array.length):
+						offsets.append(reg.array.offset + reg.offset + i * reg.array.stride)
+						if reg.bit_size == 64:
+							offsets.append(offsets[-1] + 1)
+				else:
+					offsets.append(reg.offset)
+					if reg.bit_size == 64:
+						offsets.append(offsets[-1] + 1)
+
+			offsets.sort()
+
+			print("template<> constexpr inline uint16_t %s_REGS<%s>[] = {" % (usage.upper(), variant))
+			for offset in offsets:
+				print("\t%s," % hex(offset))
+			print("};")
+
+		print("#endif")
+
+	def dump(self):
+		enums = []
+		bitsets = []
+		regs = []
+		for e in self.file:
+			if isinstance(e, Enum):
+				enums.append(e)
+			elif isinstance(e, Bitset):
+				bitsets.append(e)
+			else:
+				regs.append(e)
+
+		for e in enums + bitsets + regs:
+			e.dump()
+
+		self.dump_reg_usages()
+
+
+	def dump_regs_py(self):
+		regs = []
+		for e in self.file:
+			if isinstance(e, Reg):
+				regs.append(e)
+
+		for e in regs:
+			e.dump_py()
+
+
+	def dump_reg_variants(self, regname, variants):
+		# Don't bother for things that only have a single variant:
+		if len(variants) == 1:
+			return
+		print("#ifdef __cplusplus")
+		print("struct __%s {" % regname)
+		# TODO be more clever.. we should probably figure out which
+		# fields have the same type in all variants (in which they
+		# appear) and stuff everything else in a variant specific
+		# sub-structure.
+		seen_fields = []
+		bit_size = 32
+		array = False
+		address = None
+		for variant in variants.keys():
+			print("    /* %s fields: */" % variant)
+			reg = variants[variant]
+			bit_size = reg.bit_size
+			array = reg.array
+			for f in reg.bitset.fields:
+				fld_name = field_name(reg, f)
+				if fld_name in seen_fields:
+					continue
+				seen_fields.append(fld_name)
+				name = fld_name.lower()
+				if f.type in [ "address", "waddress" ]:
+					if address:
+						continue
+					address = f
+					tab_to("    __bo_type", "bo;")
+					tab_to("    uint32_t", "bo_offset;")
+					continue
+				type, val = f.ctype("var")
+				tab_to("    %s" %type, "%s;" %name)
+		print("    /* fallback fields: */")
+		if bit_size == 64:
+			tab_to("    uint64_t", "unknown;")
+			tab_to("    uint64_t", "qword;")
+		else:
+			tab_to("    uint32_t", "unknown;")
+			tab_to("    uint32_t", "dword;")
+		print("};")
+		# TODO don't hardcode the varset enum name
+		varenum = "chip"
+		print("template <%s %s>" % (varenum, varenum.upper()))
+		print("static inline struct fd_reg_pair")
+		xtra = ""
+		xtravar = ""
+		if array:
+			xtra = "int __i, "
+			xtravar = "__i, "
+		print("__%s(%sstruct __%s fields) {" % (regname, xtra, regname))
+		for variant in variants.keys():
+			print("  if (%s == %s) {" % (varenum.upper(), variant))
+			reg = variants[variant]
+			reg.dump_regpair_builder()
+			print("  } else")
+		print("    assert(!\"invalid variant\");")
+		print("}")
+
+		if bit_size == 64:
+			skip = ", { .reg = 0 }"
+		else:
+			skip = ""
+
+		print("#define %s(VARIANT, %s...) __%s<VARIANT>(%s{__VA_ARGS__})%s" % (regname, xtravar, regname, xtravar, skip))
+		print("#endif /* __cplusplus */")
+
+	def dump_structs(self):
+		for e in self.file:
+			e.dump_pack_struct()
+
+		for regname in self.variant_regs:
+			self.dump_reg_variants(regname, self.variant_regs[regname])
+
+
+def dump_c(args, guard, func):
+	p = Parser()
+
+	try:
+		p.parse(args.rnn, args.xml)
+	except Error as e:
+		print(e, file=sys.stderr)
+		exit(1)
+
+	print("#ifndef %s\n#define %s\n" % (guard, guard))
+
+	print("""/* Autogenerated file, DO NOT EDIT manually!
+
+This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+http://gitlab.freedesktop.org/mesa/mesa/
+git clone https://gitlab.freedesktop.org/mesa/mesa.git
+
+The rules-ng-ng source files this header was generated from are:
+""")
+	maxlen = 0
+	for filepath in p.xml_files:
+		maxlen = max(maxlen, len(filepath))
+	for filepath in p.xml_files:
+		pad = " " * (maxlen - len(filepath))
+		filesize = str(os.path.getsize(filepath))
+		filesize = " " * (7 - len(filesize)) + filesize
+		filetime = time.ctime(os.path.getmtime(filepath))
+		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+	if p.copyright_year:
+		current_year = str(datetime.date.today().year)
+		print()
+		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
+		for author in p.authors:
+			print("- " + author)
+	if p.license:
+		print(p.license)
+	print("*/")
+
+	print()
+	print("#ifdef __KERNEL__")
+	print("#include <linux/bug.h>")
+	print("#define assert(x) BUG_ON(!(x))")
+	print("#else")
+	print("#include <assert.h>")
+	print("#endif")
+	print()
+
+	print("#ifdef __cplusplus")
+	print("#define __struct_cast(X)")
+	print("#else")
+	print("#define __struct_cast(X) (struct X)")
+	print("#endif")
+	print()
+
+	func(p)
+
+	print("\n#endif /* %s */" % guard)
+
+
+def dump_c_defines(args):
+	guard = str.replace(os.path.basename(args.xml), '.', '_').upper()
+	dump_c(args, guard, lambda p: p.dump())
+
+
+def dump_c_pack_structs(args):
+	guard = str.replace(os.path.basename(args.xml), '.', '_').upper() + '_STRUCTS'
+	dump_c(args, guard, lambda p: p.dump_structs())
+
+
+def dump_py_defines(args):
+	p = Parser()
+
+	try:
+		p.parse(args.rnn, args.xml)
+	except Error as e:
+		print(e, file=sys.stderr)
+		exit(1)
+
+	file_name = os.path.splitext(os.path.basename(args.xml))[0]
+
+	print("from enum import IntEnum")
+	print("class %sRegs(IntEnum):" % file_name.upper())
+
+	os.path.basename(args.xml)
+
+	p.dump_regs_py()
+
+
+def main():
+	parser = argparse.ArgumentParser()
+	parser.add_argument('--rnn', type=str, required=True)
+	parser.add_argument('--xml', type=str, required=True)
+
+	subparsers = parser.add_subparsers(required=True)
+
+	parser_c_defines = subparsers.add_parser('c-defines')
+	parser_c_defines.set_defaults(func=dump_c_defines)
+
+	parser_c_pack_structs = subparsers.add_parser('c-pack-structs')
+	parser_c_pack_structs.set_defaults(func=dump_c_pack_structs)
+
+	parser_py_defines = subparsers.add_parser('py-defines')
+	parser_py_defines.set_defaults(func=dump_py_defines)
+
+	args = parser.parse_args()
+	args.func(args)
+
+
+if __name__ == '__main__':
+	main()

-- 
2.39.2


