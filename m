Return-Path: <linux-kbuild+bounces-4720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D49D1C4B
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BDD5B22B40
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14016D27E;
	Tue, 19 Nov 2024 00:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkPRP41c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0853538FA6;
	Tue, 19 Nov 2024 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975839; cv=none; b=akVeHGpBiWJ1WEN1fONlFmUMLG1KBE06H3EtTdh7aSNAxoiz+zA/kKcH8SiEw/4dt9wTtxK+exfqluKrYH5Ew/TRA9/WaSX5mwcTi2OxLjtcdOSDcHRQaNsAIfzMvWIw3M9gaF66Ki4NnSMYg+VY9cx/zkpATzG2I0qwrlJJgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975839; c=relaxed/simple;
	bh=ZGgbafPWUd6headPhObraj3egyD3mkI/e0q1O2vE/0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdZS2FKX7b65H2yENBYMDXHzClrIkrZDBI8nHjpmqar+2PZhpD1sqrCt6cbLRW6V6koo62KqYwUBFp4D5u7qQwojgETajiPeksgQksXKT4WjG8yy/z9kxv3Y73zsVftIN8DmAar9YtoCjDSkC4hGHUNpOBdPpWTHyj2NCG7UAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkPRP41c; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975832; x=1763511832;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZGgbafPWUd6headPhObraj3egyD3mkI/e0q1O2vE/0s=;
  b=YkPRP41c1eDBr/9ZPhBW2/p/U+hRt3qjEhMpLeioKaKhsfEkcND+Odss
   88PZvyAqm6gcUNHNGV3mHniiGYoD2Z1Myh6jqGuewYwrNopnW9gIIvNvJ
   z/q4RMqKXpQ7zeDk5QU0WcOfVIQlIoFIOPIpjx2JpyFNsbJ2XiibEypB7
   CowVwyK6yYSFS+gmcMhdA23auURzTCZFxp06XaKmPst3/9GWrzhY0SUdx
   ZwNG8eT+k7Ycvua+FcA+FM1XLpNgxQRD2i2klGHza3/4Kxnpe1Ina1s58
   LJyqs2Zo1myabZH3Gh6MTvDaD00QXNnSdjY/IzQf9+vhvgYFpt8f35T5r
   Q==;
X-CSE-ConnectionGUID: UUzA7MvxQHaKnBviQOPT9g==
X-CSE-MsgGUID: YlTFFA81Qh2iwyXVORqyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31892444"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31892444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:46 -0800
X-CSE-ConnectionGUID: 3u92MDmURomLYpR+Qt9o3g==
X-CSE-MsgGUID: D8qLmzJXS6iYqinjdWUi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89162722"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:46 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 18 Nov 2024 16:23:40 -0800
Subject: [PATCH net-next RFC v6 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-packing-pack-fields-and-ice-implementation-v6-3-6af8b658a6c3@intel.com>
References: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
In-Reply-To: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.14.1

From: Vladimir Oltean <vladimir.oltean@nxp.com>

This is new API which caters to the following requirements:

- Pack or unpack a large number of fields to/from a buffer with a small
  code footprint. The current alternative is to open-code a large number
  of calls to pack() and unpack(), or to use packing() to reduce that
  number to half. But packing() is not const-correct.

- Use unpacked numbers stored in variables smaller than u64. This
  reduces the rodata footprint of the stored field arrays.

- Perform error checking at compile time, rather than runtime, and return
  void from the API functions. Because the C preprocessor can't generate
  variable length code (loops), this is a bit tricky to do with macros.

  To handle this, implement macros which sanity check the packed field
  definitions based on their size. Finally, a single macro with a chain of
  __builtin_choose_expr() is used to select the appropriate macros. We
  enforce the use of ascending or descending order to avoid O(N^2) scaling
  when checking for overlap. Note that the macros are written with care to
  ensure that the compilers can correctly evaluate the resulting code at
  compile time. In particular, the expressions for the pbuflen and the
  ordering check are passed all the way down via macros. Earlier versions
  attempted to use statement expressions with local variables, but not all
  compilers were able to fully analyze these at compile time, resulting in
  BUILD_BUG_ON failures.

  The overlap macro is passed a condition determining whether the fields
  are expected to be in ascending or descending order based on the relative
  ordering of the first two fields. This allows users to keep the fields in
  whichever order is most natural for their hardware, while still keeping
  the overlap checks scaling to O(N).

  This method also enables calling CHECK_PACKED_FIELDS directly from within
  the pack_fields and unpack_fields macros, ensuring all drivers using this
  API will receive type checking, without needing to remember to call the
  CHECK_PACKED_FIELDS macro themselves.

- Reduced rodata footprint for the storage of the packed field arrays.
  To that end, we have struct packed_field_s (small) and packed_field_m
  (medium). More can be added as needed (unlikely for now). On these
  types, the same generic pack_fields() and unpack_fields() API can be
  used, thanks to the new C11 _Generic() selection feature, which can
  call pack_fields_s() or pack_fields_m(), depending on the type of the
  "fields" array - a simplistic form of polymorphism. It is evaluated at
  compile time which function will actually be called.

Over time, packing() is expected to be completely replaced either with
pack() or with pack_fields().

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Co-developed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 Makefile                           |    4 +
 include/linux/packing.h            |   37 +
 include/linux/packing_types.h      | 2831 ++++++++++++++++++++++++++++++++++++
 lib/packing.c                      |  145 ++
 lib/packing_test.c                 |   61 +
 scripts/gen_packed_field_checks.c  |   38 +
 Documentation/core-api/packing.rst |   58 +
 MAINTAINERS                        |    2 +
 scripts/Makefile                   |    2 +-
 9 files changed, 3177 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 79192a3024bf..f04f3b33f797 100644
--- a/Makefile
+++ b/Makefile
@@ -1307,6 +1307,10 @@ PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
 
+PHONY += scripts_gen_packed_field_checks
+scripts_gen_packed_field_checks: scripts_basic
+	$(Q)$(MAKE) $(build)=scripts scripts/gen_packed_field_checks
+
 # ---------------------------------------------------------------------------
 # Install
 
diff --git a/include/linux/packing.h b/include/linux/packing.h
index 5d36dcd06f60..f9bfb2006030 100644
--- a/include/linux/packing.h
+++ b/include/linux/packing.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/packing_types.h>
 
 #define QUIRK_MSB_ON_THE_RIGHT	BIT(0)
 #define QUIRK_LITTLE_ENDIAN	BIT(1)
@@ -26,4 +27,40 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
 int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
 	   size_t pbuflen, u8 quirks);
 
+void pack_fields_s(void *pbuf, size_t pbuflen, const void *ustruct,
+		   const struct packed_field_s *fields, size_t num_fields,
+		   u8 quirks);
+
+void pack_fields_m(void *pbuf, size_t pbuflen, const void *ustruct,
+		   const struct packed_field_m *fields, size_t num_fields,
+		   u8 quirks);
+
+void unpack_fields_s(const void *pbuf, size_t pbuflen, void *ustruct,
+		     const struct packed_field_s *fields, size_t num_fields,
+		     u8 quirks);
+
+void unpack_fields_m(const void *pbuf, size_t pbuflen, void *ustruct,
+		     const struct packed_field_m *fields, size_t num_fields,
+		     u8 quirks);
+
+#define pack_fields(pbuf, pbuflen, ustruct, fields, quirks) \
+	({ \
+		CHECK_PACKED_FIELDS(fields); \
+		CHECK_PACKED_FIELDS_SIZE((fields), (pbuflen)); \
+		_Generic((fields), \
+			 const struct packed_field_s * : pack_fields_s, \
+			 const struct packed_field_m * : pack_fields_m \
+			)((pbuf), (pbuflen), (ustruct), (fields), ARRAY_SIZE(fields), (quirks)); \
+	})
+
+#define unpack_fields(pbuf, pbuflen, ustruct, fields, quirks) \
+	({ \
+		CHECK_PACKED_FIELDS(fields); \
+		CHECK_PACKED_FIELDS_SIZE((fields), (pbuflen)); \
+		_Generic((fields), \
+			 const struct packed_field_s * : unpack_fields_s, \
+			 const struct packed_field_m * : unpack_fields_m \
+			)((pbuf), (pbuflen), (ustruct), (fields), ARRAY_SIZE(fields), (quirks)); \
+	})
+
 #endif
diff --git a/include/linux/packing_types.h b/include/linux/packing_types.h
new file mode 100644
index 000000000000..3bcc46850a59
--- /dev/null
+++ b/include/linux/packing_types.h
@@ -0,0 +1,2831 @@
+/* SPDX-License-Identifier: BSD-3-Clause
+ * Copyright (c) 2024, Intel Corporation
+ * Copyright (c) 2024, Vladimir Oltean <olteanv@gmail.com>
+ */
+#ifndef _LINUX_PACKING_TYPES_H
+#define _LINUX_PACKING_TYPES_H
+
+#include <linux/types.h>
+
+/* If you add another packed field type, please update
+ * scripts/mod/packed_fields.c to enable compile time sanity checks.
+ */
+
+#define GEN_PACKED_FIELD_MEMBERS(__type) \
+	__type startbit; \
+	__type endbit; \
+	__type offset; \
+	__type size
+
+/* Small packed field. Use with bit offsets < 256, buffers < 32B and
+ * unpacked structures < 256B.
+ */
+struct packed_field_s {
+	GEN_PACKED_FIELD_MEMBERS(u8);
+};
+
+/* Medium packed field. Use with bit offsets < 65536, buffers < 8KB and
+ * unpacked structures < 64KB.
+ */
+struct packed_field_m {
+	GEN_PACKED_FIELD_MEMBERS(u16);
+};
+
+#define PACKED_FIELD(start, end, struct_name, struct_field) \
+{ \
+	(start), \
+	(end), \
+	offsetof(struct_name, struct_field), \
+	sizeof_field(struct_name, struct_field), \
+}
+
+#define CHECK_PACKED_FIELD(field) ({ \
+	typeof(field) __f = (field); \
+	BUILD_BUG_ON(__f.startbit < __f.endbit); \
+	BUILD_BUG_ON(__f.startbit - __f.endbit >= BITS_PER_BYTE * __f.size); \
+	BUILD_BUG_ON(__f.size != 1 && __f.size != 2 && \
+		     __f.size != 4 && __f.size != 8); \
+})
+
+
+#define CHECK_PACKED_FIELD_OVERLAP(ascending, field1, field2) ({ \
+	typeof(field1) _f1 = (field1); typeof(field2) _f2 = (field2); \
+	const bool _a = (ascending); \
+	BUILD_BUG_ON(_a && _f1.startbit >= _f2.startbit); \
+	BUILD_BUG_ON(!_a && _f1.startbit <= _f2.startbit); \
+	BUILD_BUG_ON(max(_f1.endbit, _f2.endbit) <= \
+		     min(_f1.startbit, _f2.startbit)); \
+})
+
+#define CHECK_PACKED_FIELDS_SIZE(fields, pbuflen) ({ \
+	typeof(&(fields)[0]) _f = (fields); \
+	typeof(pbuflen) _len = (pbuflen); \
+	const size_t num_fields = ARRAY_SIZE(fields); \
+	BUILD_BUG_ON(!__builtin_constant_p(_len)); \
+	BUILD_BUG_ON(_f[0].startbit >= BITS_PER_BYTE * _len); \
+	BUILD_BUG_ON(_f[num_fields - 1].startbit >= BITS_PER_BYTE * _len); \
+})
+
+/* Do not hand-edit the following packed field check macros!
+ *
+ * They are generated using scripts/gen_packed_field_checks.c, which may be
+ * built via "make scripts_gen_packed_field_checks". If larger macro sizes are
+ * needed in the future, please use this program to re-generate the macros and
+ * insert them here.
+ */
+
+#define CHECK_PACKED_FIELDS_1(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 1); \
+	 CHECK_PACKED_FIELD(_f[0]); })
+
+#define CHECK_PACKED_FIELDS_2(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 2); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); })
+
+#define CHECK_PACKED_FIELDS_3(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 3); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); })
+
+#define CHECK_PACKED_FIELDS_4(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 4); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); })
+
+#define CHECK_PACKED_FIELDS_5(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 5); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); })
+
+#define CHECK_PACKED_FIELDS_6(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 6); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); })
+
+#define CHECK_PACKED_FIELDS_7(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 7); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); })
+
+#define CHECK_PACKED_FIELDS_8(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 8); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); })
+
+#define CHECK_PACKED_FIELDS_9(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 9); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); })
+
+#define CHECK_PACKED_FIELDS_10(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 10); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); })
+
+#define CHECK_PACKED_FIELDS_11(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 11); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); })
+
+#define CHECK_PACKED_FIELDS_12(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 12); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); })
+
+#define CHECK_PACKED_FIELDS_13(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 13); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); })
+
+#define CHECK_PACKED_FIELDS_14(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 14); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); })
+
+#define CHECK_PACKED_FIELDS_15(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 15); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); })
+
+#define CHECK_PACKED_FIELDS_16(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 16); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); })
+
+#define CHECK_PACKED_FIELDS_17(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 17); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); })
+
+#define CHECK_PACKED_FIELDS_18(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 18); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); })
+
+#define CHECK_PACKED_FIELDS_19(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 19); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); })
+
+#define CHECK_PACKED_FIELDS_20(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 20); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); })
+
+#define CHECK_PACKED_FIELDS_21(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 21); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); })
+
+#define CHECK_PACKED_FIELDS_22(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 22); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); })
+
+#define CHECK_PACKED_FIELDS_23(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 23); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); })
+
+#define CHECK_PACKED_FIELDS_24(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 24); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); })
+
+#define CHECK_PACKED_FIELDS_25(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 25); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); })
+
+#define CHECK_PACKED_FIELDS_26(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 26); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); })
+
+#define CHECK_PACKED_FIELDS_27(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 27); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); })
+
+#define CHECK_PACKED_FIELDS_28(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 28); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); })
+
+#define CHECK_PACKED_FIELDS_29(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 29); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); })
+
+#define CHECK_PACKED_FIELDS_30(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 30); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); })
+
+#define CHECK_PACKED_FIELDS_31(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 31); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); })
+
+#define CHECK_PACKED_FIELDS_32(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 32); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); })
+
+#define CHECK_PACKED_FIELDS_33(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 33); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); })
+
+#define CHECK_PACKED_FIELDS_34(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 34); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); })
+
+#define CHECK_PACKED_FIELDS_35(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 35); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); })
+
+#define CHECK_PACKED_FIELDS_36(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 36); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); })
+
+#define CHECK_PACKED_FIELDS_37(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 37); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); })
+
+#define CHECK_PACKED_FIELDS_38(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 38); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); })
+
+#define CHECK_PACKED_FIELDS_39(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 39); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); })
+
+#define CHECK_PACKED_FIELDS_40(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 40); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); })
+
+#define CHECK_PACKED_FIELDS_41(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 41); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); })
+
+#define CHECK_PACKED_FIELDS_42(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 42); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); })
+
+#define CHECK_PACKED_FIELDS_43(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 43); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); })
+
+#define CHECK_PACKED_FIELDS_44(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 44); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); })
+
+#define CHECK_PACKED_FIELDS_45(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 45); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); })
+
+#define CHECK_PACKED_FIELDS_46(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 46); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD(_f[45]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[44], _f[45]); })
+
+#define CHECK_PACKED_FIELDS_47(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 47); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD(_f[45]); \
+	 CHECK_PACKED_FIELD(_f[46]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[44], _f[45]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[45], _f[46]); })
+
+#define CHECK_PACKED_FIELDS_48(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 48); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD(_f[45]); \
+	 CHECK_PACKED_FIELD(_f[46]); \
+	 CHECK_PACKED_FIELD(_f[47]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[44], _f[45]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[45], _f[46]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[46], _f[47]); })
+
+#define CHECK_PACKED_FIELDS_49(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 49); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD(_f[45]); \
+	 CHECK_PACKED_FIELD(_f[46]); \
+	 CHECK_PACKED_FIELD(_f[47]); \
+	 CHECK_PACKED_FIELD(_f[48]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[44], _f[45]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[45], _f[46]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[46], _f[47]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[47], _f[48]); })
+
+#define CHECK_PACKED_FIELDS_50(fields) \
+	({ typeof(&(fields)[0]) _f = (fields); \
+	 BUILD_BUG_ON(ARRAY_SIZE(fields) != 50); \
+	 CHECK_PACKED_FIELD(_f[0]); \
+	 CHECK_PACKED_FIELD(_f[1]); \
+	 CHECK_PACKED_FIELD(_f[2]); \
+	 CHECK_PACKED_FIELD(_f[3]); \
+	 CHECK_PACKED_FIELD(_f[4]); \
+	 CHECK_PACKED_FIELD(_f[5]); \
+	 CHECK_PACKED_FIELD(_f[6]); \
+	 CHECK_PACKED_FIELD(_f[7]); \
+	 CHECK_PACKED_FIELD(_f[8]); \
+	 CHECK_PACKED_FIELD(_f[9]); \
+	 CHECK_PACKED_FIELD(_f[10]); \
+	 CHECK_PACKED_FIELD(_f[11]); \
+	 CHECK_PACKED_FIELD(_f[12]); \
+	 CHECK_PACKED_FIELD(_f[13]); \
+	 CHECK_PACKED_FIELD(_f[14]); \
+	 CHECK_PACKED_FIELD(_f[15]); \
+	 CHECK_PACKED_FIELD(_f[16]); \
+	 CHECK_PACKED_FIELD(_f[17]); \
+	 CHECK_PACKED_FIELD(_f[18]); \
+	 CHECK_PACKED_FIELD(_f[19]); \
+	 CHECK_PACKED_FIELD(_f[20]); \
+	 CHECK_PACKED_FIELD(_f[21]); \
+	 CHECK_PACKED_FIELD(_f[22]); \
+	 CHECK_PACKED_FIELD(_f[23]); \
+	 CHECK_PACKED_FIELD(_f[24]); \
+	 CHECK_PACKED_FIELD(_f[25]); \
+	 CHECK_PACKED_FIELD(_f[26]); \
+	 CHECK_PACKED_FIELD(_f[27]); \
+	 CHECK_PACKED_FIELD(_f[28]); \
+	 CHECK_PACKED_FIELD(_f[29]); \
+	 CHECK_PACKED_FIELD(_f[30]); \
+	 CHECK_PACKED_FIELD(_f[31]); \
+	 CHECK_PACKED_FIELD(_f[32]); \
+	 CHECK_PACKED_FIELD(_f[33]); \
+	 CHECK_PACKED_FIELD(_f[34]); \
+	 CHECK_PACKED_FIELD(_f[35]); \
+	 CHECK_PACKED_FIELD(_f[36]); \
+	 CHECK_PACKED_FIELD(_f[37]); \
+	 CHECK_PACKED_FIELD(_f[38]); \
+	 CHECK_PACKED_FIELD(_f[39]); \
+	 CHECK_PACKED_FIELD(_f[40]); \
+	 CHECK_PACKED_FIELD(_f[41]); \
+	 CHECK_PACKED_FIELD(_f[42]); \
+	 CHECK_PACKED_FIELD(_f[43]); \
+	 CHECK_PACKED_FIELD(_f[44]); \
+	 CHECK_PACKED_FIELD(_f[45]); \
+	 CHECK_PACKED_FIELD(_f[46]); \
+	 CHECK_PACKED_FIELD(_f[47]); \
+	 CHECK_PACKED_FIELD(_f[48]); \
+	 CHECK_PACKED_FIELD(_f[49]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[0], _f[1]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[1], _f[2]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[2], _f[3]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[3], _f[4]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[4], _f[5]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[5], _f[6]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[6], _f[7]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[7], _f[8]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[8], _f[9]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[9], _f[10]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[10], _f[11]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[11], _f[12]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[12], _f[13]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[13], _f[14]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[14], _f[15]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[15], _f[16]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[16], _f[17]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[17], _f[18]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[18], _f[19]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[19], _f[20]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[20], _f[21]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[21], _f[22]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[22], _f[23]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[23], _f[24]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[24], _f[25]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[25], _f[26]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[26], _f[27]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[27], _f[28]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[28], _f[29]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[29], _f[30]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[30], _f[31]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[31], _f[32]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[32], _f[33]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[33], _f[34]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[34], _f[35]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[35], _f[36]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[36], _f[37]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[37], _f[38]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[38], _f[39]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[39], _f[40]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[40], _f[41]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[41], _f[42]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[42], _f[43]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[43], _f[44]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[44], _f[45]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[45], _f[46]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[46], _f[47]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[47], _f[48]); \
+	 CHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[48], _f[49]); })
+
+#define CHECK_PACKED_FIELDS(fields) \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 1, CHECK_PACKED_FIELDS_1(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 2, CHECK_PACKED_FIELDS_2(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 3, CHECK_PACKED_FIELDS_3(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 4, CHECK_PACKED_FIELDS_4(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 5, CHECK_PACKED_FIELDS_5(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 6, CHECK_PACKED_FIELDS_6(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 7, CHECK_PACKED_FIELDS_7(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 8, CHECK_PACKED_FIELDS_8(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 9, CHECK_PACKED_FIELDS_9(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 10, CHECK_PACKED_FIELDS_10(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 11, CHECK_PACKED_FIELDS_11(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 12, CHECK_PACKED_FIELDS_12(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 13, CHECK_PACKED_FIELDS_13(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 14, CHECK_PACKED_FIELDS_14(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 15, CHECK_PACKED_FIELDS_15(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 16, CHECK_PACKED_FIELDS_16(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 17, CHECK_PACKED_FIELDS_17(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 18, CHECK_PACKED_FIELDS_18(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 19, CHECK_PACKED_FIELDS_19(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 20, CHECK_PACKED_FIELDS_20(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 21, CHECK_PACKED_FIELDS_21(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 22, CHECK_PACKED_FIELDS_22(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 23, CHECK_PACKED_FIELDS_23(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 24, CHECK_PACKED_FIELDS_24(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 25, CHECK_PACKED_FIELDS_25(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 26, CHECK_PACKED_FIELDS_26(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 27, CHECK_PACKED_FIELDS_27(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 28, CHECK_PACKED_FIELDS_28(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 29, CHECK_PACKED_FIELDS_29(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 30, CHECK_PACKED_FIELDS_30(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 31, CHECK_PACKED_FIELDS_31(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 32, CHECK_PACKED_FIELDS_32(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 33, CHECK_PACKED_FIELDS_33(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 34, CHECK_PACKED_FIELDS_34(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 35, CHECK_PACKED_FIELDS_35(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 36, CHECK_PACKED_FIELDS_36(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 37, CHECK_PACKED_FIELDS_37(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 38, CHECK_PACKED_FIELDS_38(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 39, CHECK_PACKED_FIELDS_39(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 40, CHECK_PACKED_FIELDS_40(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 41, CHECK_PACKED_FIELDS_41(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 42, CHECK_PACKED_FIELDS_42(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 43, CHECK_PACKED_FIELDS_43(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 44, CHECK_PACKED_FIELDS_44(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 45, CHECK_PACKED_FIELDS_45(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 46, CHECK_PACKED_FIELDS_46(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 47, CHECK_PACKED_FIELDS_47(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 48, CHECK_PACKED_FIELDS_48(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 49, CHECK_PACKED_FIELDS_49(fields), \
+	__builtin_choose_expr(ARRAY_SIZE(fields) == 50, CHECK_PACKED_FIELDS_50(fields), \
+	({ BUILD_BUG_ON_MSG(1, "CHECK_PACKED_FIELDS() must be regenerated to support array sizes larger than 50."); }) \
+	))))))))))))))))))))))))))))))))))))))))))))))))))
+
+#endif
diff --git a/lib/packing.c b/lib/packing.c
index 09a2d195b943..45164f73fe5b 100644
--- a/lib/packing.c
+++ b/lib/packing.c
@@ -5,10 +5,37 @@
 #include <linux/packing.h>
 #include <linux/module.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/bitrev.h>
 
+#define __pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks)	\
+	({									\
+		for (size_t i = 0; i < (num_fields); i++) {			\
+			typeof(&(fields)[0]) field = &(fields)[i];		\
+			u64 uval;						\
+										\
+			uval = ustruct_field_to_u64(ustruct, field->offset, field->size); \
+										\
+			__pack(pbuf, uval, field->startbit, field->endbit,	\
+			       pbuflen, quirks);				\
+		}								\
+	})
+
+#define __unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks)	\
+	({									\
+		for (size_t i = 0; i < (num_fields); i++) {			\
+			typeof(&(fields)[0]) field = &fields[i];		\
+			u64 uval;						\
+										\
+			__unpack(pbuf, &uval, field->startbit, field->endbit,	\
+				 pbuflen, quirks);				\
+										\
+			u64_to_ustruct_field(ustruct, field->offset, field->size, uval); \
+		}								\
+	})
+
 /**
  * calculate_box_addr - Determine physical location of byte in buffer
  * @box: Index of byte within buffer seen as a logical big-endian big number
@@ -322,4 +349,122 @@ int packing(void *pbuf, u64 *uval, int startbit, int endbit, size_t pbuflen,
 }
 EXPORT_SYMBOL(packing);
 
+static u64 ustruct_field_to_u64(const void *ustruct, size_t field_offset,
+				size_t field_size)
+{
+	switch (field_size) {
+	case 1:
+		return *((u8 *)(ustruct + field_offset));
+	case 2:
+		return *((u16 *)(ustruct + field_offset));
+	case 4:
+		return *((u32 *)(ustruct + field_offset));
+	default:
+		return *((u64 *)(ustruct + field_offset));
+	}
+}
+
+static void u64_to_ustruct_field(void *ustruct, size_t field_offset,
+				 size_t field_size, u64 uval)
+{
+	switch (field_size) {
+	case 1:
+		*((u8 *)(ustruct + field_offset)) = uval;
+		break;
+	case 2:
+		*((u16 *)(ustruct + field_offset)) = uval;
+		break;
+	case 4:
+		*((u32 *)(ustruct + field_offset)) = uval;
+		break;
+	default:
+		*((u64 *)(ustruct + field_offset)) = uval;
+		break;
+	}
+}
+
+/**
+ * pack_fields_s - Pack array of small fields
+ *
+ * @pbuf: Pointer to a buffer holding the packed value.
+ * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
+ * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
+ *	     It is expected (but not checked) that this has the same data type
+ *	     as all struct packed_field_s definitions.
+ * @fields: Array of small packed fields definition. They must not overlap.
+ * @num_fields: Length of @fields array.
+ * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
+ *	    QUIRK_MSB_ON_THE_RIGHT.
+ */
+void pack_fields_s(void *pbuf, size_t pbuflen, const void *ustruct,
+		   const struct packed_field_s *fields, size_t num_fields,
+		   u8 quirks)
+{
+	__pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
+}
+EXPORT_SYMBOL(pack_fields_s);
+
+/**
+ * pack_fields_m - Pack array of medium fields
+ *
+ * @pbuf: Pointer to a buffer holding the packed value.
+ * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
+ * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
+ *	     It is expected (but not checked) that this has the same data type
+ *	     as all struct packed_field_s definitions.
+ * @fields: Array of medium packed fields definition. They must not overlap.
+ * @num_fields: Length of @fields array.
+ * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
+ *	    QUIRK_MSB_ON_THE_RIGHT.
+ */
+void pack_fields_m(void *pbuf, size_t pbuflen, const void *ustruct,
+		   const struct packed_field_m *fields, size_t num_fields,
+		   u8 quirks)
+{
+	__pack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
+}
+EXPORT_SYMBOL(pack_fields_m);
+
+/**
+ * unpack_fields_s - Unpack array of small fields
+ *
+ * @pbuf: Pointer to a buffer holding the packed value.
+ * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
+ * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
+ *	     It is expected (but not checked) that this has the same data type
+ *	     as all struct packed_field_s definitions.
+ * @fields: Array of small packed fields definition. They must not overlap.
+ * @num_fields: Length of @fields array.
+ * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
+ *	    QUIRK_MSB_ON_THE_RIGHT.
+ */
+void unpack_fields_s(const void *pbuf, size_t pbuflen, void *ustruct,
+		     const struct packed_field_s *fields, size_t num_fields,
+		     u8 quirks)
+{
+	__unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
+}
+EXPORT_SYMBOL(unpack_fields_s);
+
+/**
+ * unpack_fields_m - Unpack array of medium fields
+ *
+ * @pbuf: Pointer to a buffer holding the packed value.
+ * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
+ * @ustruct: Pointer to CPU-readable structure holding the unpacked value.
+ *	     It is expected (but not checked) that this has the same data type
+ *	     as all struct packed_field_s definitions.
+ * @fields: Array of medium packed fields definition. They must not overlap.
+ * @num_fields: Length of @fields array.
+ * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
+ *	    QUIRK_MSB_ON_THE_RIGHT.
+ */
+void unpack_fields_m(const void *pbuf, size_t pbuflen, void *ustruct,
+		     const struct packed_field_m *fields, size_t num_fields,
+		     u8 quirks)
+{
+	__unpack_fields(pbuf, pbuflen, ustruct, fields, num_fields, quirks);
+}
+EXPORT_SYMBOL(unpack_fields_m);
+
 MODULE_DESCRIPTION("Generic bitfield packing and unpacking");
diff --git a/lib/packing_test.c b/lib/packing_test.c
index b38ea43c03fd..3b4167ce56bf 100644
--- a/lib/packing_test.c
+++ b/lib/packing_test.c
@@ -396,9 +396,70 @@ static void packing_test_unpack(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, uval, params->uval);
 }
 
+#define PACKED_BUF_SIZE 8
+
+typedef struct __packed { u8 buf[PACKED_BUF_SIZE]; } packed_buf_t;
+
+struct test_data {
+	u32 field3;
+	u16 field2;
+	u16 field4;
+	u16 field6;
+	u8 field1;
+	u8 field5;
+};
+
+static const struct packed_field_s test_fields[] = {
+	PACKED_FIELD(63, 61, struct test_data, field1),
+	PACKED_FIELD(60, 52, struct test_data, field2),
+	PACKED_FIELD(51, 28, struct test_data, field3),
+	PACKED_FIELD(27, 14, struct test_data, field4),
+	PACKED_FIELD(13, 9, struct test_data, field5),
+	PACKED_FIELD(8, 0, struct test_data, field6),
+};
+
+static void packing_test_pack_fields(struct kunit *test)
+{
+	const struct test_data data = {
+		.field1 = 0x2,
+		.field2 = 0x100,
+		.field3 = 0xF00050,
+		.field4 = 0x7D3,
+		.field5 = 0x9,
+		.field6 = 0x10B,
+	};
+	packed_buf_t expect = {
+		.buf = { 0x50, 0x0F, 0x00, 0x05, 0x01, 0xF4, 0xD3, 0x0B },
+	};
+	packed_buf_t buf = {};
+
+	pack_fields(&buf, sizeof(buf), &data, test_fields, 0);
+
+	KUNIT_EXPECT_MEMEQ(test, &expect, &buf, sizeof(buf));
+}
+
+static void packing_test_unpack_fields(struct kunit *test)
+{
+	const packed_buf_t buf = {
+		.buf = { 0x17, 0x28, 0x10, 0x19, 0x3D, 0xA9, 0x07, 0x9C },
+	};
+	struct test_data data = {};
+
+	unpack_fields(&buf, sizeof(buf), &data, test_fields, 0);
+
+	KUNIT_EXPECT_EQ(test, 0, data.field1);
+	KUNIT_EXPECT_EQ(test, 0x172, data.field2);
+	KUNIT_EXPECT_EQ(test, 0x810193, data.field3);
+	KUNIT_EXPECT_EQ(test, 0x36A4, data.field4);
+	KUNIT_EXPECT_EQ(test, 0x3, data.field5);
+	KUNIT_EXPECT_EQ(test, 0x19C, data.field6);
+}
+
 static struct kunit_case packing_test_cases[] = {
 	KUNIT_CASE_PARAM(packing_test_pack, packing_gen_params),
 	KUNIT_CASE_PARAM(packing_test_unpack, packing_gen_params),
+	KUNIT_CASE(packing_test_pack_fields),
+	KUNIT_CASE(packing_test_unpack_fields),
 	{},
 };
 
diff --git a/scripts/gen_packed_field_checks.c b/scripts/gen_packed_field_checks.c
new file mode 100644
index 000000000000..09a21afd640b
--- /dev/null
+++ b/scripts/gen_packed_field_checks.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2024, Intel Corporation
+#include <stdbool.h>
+#include <stdio.h>
+
+#define MAX_PACKED_FIELD_SIZE 50
+
+int main(int argc, char **argv)
+{
+	for (int i = 1; i <= MAX_PACKED_FIELD_SIZE; i++) {
+		printf("#define CHECK_PACKED_FIELDS_%d(fields) ({ \\\n", i);
+		printf("\ttypeof(&(fields)[0]) _f = (fields); \\\n");
+		printf("\tBUILD_BUG_ON(ARRAY_SIZE(fields) != %d); \\\n", i);
+
+		for (int j = 0; j < i; j++)
+			printf("\tCHECK_PACKED_FIELD(_f[%d]); \\\n", j);
+
+		for (int j = 1; j < i; j++)
+			printf("\tCHECK_PACKED_FIELD_OVERLAP(_f[0].startbit < _f[1].startbit, _f[%d], _f[%d]); \\\n",
+			       j - 1, j);
+
+		printf("})\n\n");
+	}
+
+	printf("#define CHECK_PACKED_FIELDS(fields) \\\n");
+
+	for (int i = 1; i <= MAX_PACKED_FIELD_SIZE; i++)
+		printf("\t__builtin_choose_expr(ARRAY_SIZE(fields) == %d, CHECK_PACKED_FIELDS_%d(fields), \\\n",
+		       i, i);
+
+	printf("\t({ BUILD_BUG_ON_MSG(1, \"CHECK_PACKED_FIELDS() must be regenerated to support array sizes larger than %d.\"); }) \\\n",
+	       MAX_PACKED_FIELD_SIZE);
+
+	for (int i = 1; i <= MAX_PACKED_FIELD_SIZE; i++)
+		printf(")");
+
+	printf("\n");
+}
diff --git a/Documentation/core-api/packing.rst b/Documentation/core-api/packing.rst
index 821691f23c54..5f729a9d4e87 100644
--- a/Documentation/core-api/packing.rst
+++ b/Documentation/core-api/packing.rst
@@ -235,3 +235,61 @@ programmer against incorrect API use.  The errors are not expected to occur
 during runtime, therefore it is reasonable for xxx_packing() to return void
 and simply swallow those errors. Optionally it can dump stack or print the
 error description.
+
+The pack_fields() and unpack_fields() macros automatically select the
+appropriate function at compile time based on the type of the fields array
+passed in.
+
+Packed Fields
+-------------
+
+Drivers are encouraged to use the ``pack_fields()`` and ``unpack_fields()``
+APIs over using ``pack()``, ``unpack()``, or ``packing()``.
+
+These APIs use field definitions in arrays of ``struct packed_field_s`` or
+``struct packed_field_m`` stored as ``.rodata``. This significantly reduces
+the code footprint required to pack or unpack many fields. In addition,
+sanity checks on the field definitions are handled at compile time with
+``BUILD_BUG_ON`` rather than only when the offending code is executed.
+
+It is recommended, but not required, that you wrap your packed buffer into a
+structured type with a fixed size. This generally makes it easier for the
+compiler to  enforce that the correct size buffer is used.
+
+Here is an example of how to use the fields APIs:
+
+.. code-block:: c
+
+   struct data {
+        u64 field3;
+        u32 field4;
+        u16 field1;
+        u8 field2;
+   };
+
+   #define SIZE 13
+
+   typdef struct __packed { u8 buf[SIZE]; } packed_buf_t;
+
+   static const struct packed_field_s fields[] = {
+           PACKED_FIELD(100, 90, struct data, field1),
+           PACKED_FIELD(90, 87, struct data, field2),
+           PACKED_FIELD(86, 30, struct data, field3),
+           PACKED_FIELD(29, 0, struct data, field4),
+   };
+
+   void unpack_your_data(const packed_buf_t *buf, struct data *unpacked)
+   {
+           BUILD_BUG_ON(sizeof(*buf) != SIZE;
+
+           unpack_fields(buf, sizeof(*buf), unpacked, fields,
+                         QUIRK_LITTLE_ENDIAN);
+   }
+
+   void pack_your_data(const struct data *unpacked, packed_buf_t *buf)
+   {
+           BUILD_BUG_ON(sizeof(*buf) != SIZE;
+
+           pack_fields(buf, sizeof(*buf), unpacked, fields,
+                       QUIRK_LITTLE_ENDIAN);
+   }
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b9344c3524..45a3c1dca084 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17448,8 +17448,10 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	Documentation/core-api/packing.rst
 F:	include/linux/packing.h
+F:	include/linux/packing_types.h
 F:	lib/packing.c
 F:	lib/packing_test.c
+F:	scripts/gen_packed_field_checks.c
 
 PADATA PARALLEL EXECUTION MECHANISM
 M:	Steffen Klassert <steffen.klassert@secunet.com>
diff --git a/scripts/Makefile b/scripts/Makefile
index 6bcda4b9d054..546e8175e1c4 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -47,7 +47,7 @@ HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
 
 # The following programs are only built on demand
-hostprogs += unifdef
+hostprogs += unifdef gen_packed_field_checks
 
 # The module linker script is preprocessed on demand
 targets += module.lds

-- 
2.47.0.265.g4ca455297942


