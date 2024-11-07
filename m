Return-Path: <linux-kbuild+bounces-4564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21B9C0F64
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1DC72848B9
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1541218585;
	Thu,  7 Nov 2024 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFJHnAPF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069F21858D;
	Thu,  7 Nov 2024 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009051; cv=none; b=WAq+pkxvHa1Xvuzq166+b8ZdtfYOxrsJPjNS61OaJmEWlD4HuShWjoZDJIbqmJWl7xNZeMZNzFFIL3rlHGh2W4WByWRwqrw7ess1SxnX4bs7pxdLTbT0xZS5z6S1RkU95Xh29SZw7NE1Tk9o8KZzs9mm61g8EjPHMB9fRkytP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009051; c=relaxed/simple;
	bh=tJA8x5TJCFN3Xd6q8lV2m20LYDoATeTeBH6wSs/rERg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mY8ze6/xF+M6BF5lTVB91tFRna46LXx+Q05QAzQNQn4GAGAJ8fi8HKHAF/pO9mLIgGvp9Z/MpnEh5fZpQAGnEIC3qUa8K9E6ZHz2bZW/c1SwzX0fdm4sMlQDsfF757kqhjas3lV4mzw7HCw8jTg3/7zSd0w5zCWWcvMokGoFcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFJHnAPF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009049; x=1762545049;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tJA8x5TJCFN3Xd6q8lV2m20LYDoATeTeBH6wSs/rERg=;
  b=hFJHnAPFdUi/2/AUzLqWI290BQLeZFuQFpFQZZc3uLoOdFqLeL5Ln7za
   E70lvE78sEPGlWdH325jwFcNNng6AQlUpLIvr1OyogqxGmVSCIH6xa3BY
   i3JcM7eaqCtjR2lKaVviu6+UXY0tLfF7n2ywXkUQtTfbRwaDcFzC3b4pp
   Q+MlC0sVlN5EGhCPqaISC1B2BMEPXIeRqRH+qffi/JN+orFsza+5LF4T1
   Ts/oJtj8kP1/ek16M0A0caN+DvbNX6413Z2rOFL4+ge+Mu96ATwbsPgW6
   prjL+aAOZNTr85Vdssej5YzHBQLUYxhNinJcnVMrcCv/F2W4bb8ZCZ13G
   A==;
X-CSE-ConnectionGUID: 5wCkcD+RSe2/xbLDGVatMg==
X-CSE-MsgGUID: 25I9DsYKQlu4qJs3d5kLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647734"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30647734"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:43 -0800
X-CSE-ConnectionGUID: mrRijqxuT5W/SwRv2ngT2Q==
X-CSE-MsgGUID: ZDii9nMmTtaXa7MUjsKYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="86009620"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 07 Nov 2024 11:50:34 -0800
Subject: [PATCH net-next v3 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
In-Reply-To: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
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
  void from the API functions. Because the C preprocessor can't generat
  variable length code (loops), we can't easily use macros to implement the
  compile time checks.

  Instead, checks are implemented in modpost. This allows writing C code to
  validate the expected data. The symbols for the packed field arrays are
  placed into special sections of the binary, via the __section()
  attribute. The maximum size of the buffer is also placed as a constant to
  allow extracting it from the module in modpost, ensuring we can validate
  the packed fields fit into the relevant packed buffer.

  While the use of modpost is somewhat ugly, it is entirely contained and
  drivers simply declare their packed field arrays with
  DECLARE_PACKED_FIELDS_S or DECLARE_PACKED_FIELDS_M as appropriate. This
  reduces the burden on driver authors and keeps the checks contained.
  Additionally, use of modpost enables dynamically enforcing all the fields
  be in ascending or descending order.

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

Co-developed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 include/linux/packing.h            |  29 ++++
 include/linux/packing_types.h      |  54 +++++++
 scripts/mod/modpost.h              |  19 +++
 lib/packing.c                      | 149 ++++++++++++++++++-
 lib/packing_test.c                 |  61 ++++++++
 scripts/mod/modpost.c              |  18 +--
 scripts/mod/packed_fields.c        | 294 +++++++++++++++++++++++++++++++++++++
 Documentation/core-api/packing.rst |  55 +++++++
 MAINTAINERS                        |   2 +
 scripts/mod/Makefile               |   4 +-
 10 files changed, 667 insertions(+), 18 deletions(-)

diff --git a/include/linux/packing.h b/include/linux/packing.h
index 5d36dcd06f60..12218a82d956 100644
--- a/include/linux/packing.h
+++ b/include/linux/packing.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/packing_types.h>
 
 #define QUIRK_MSB_ON_THE_RIGHT	BIT(0)
 #define QUIRK_LITTLE_ENDIAN	BIT(1)
@@ -26,4 +27,32 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
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
+	_Generic((fields), \
+		 const struct packed_field_s * : pack_fields_s, \
+		 const struct packed_field_m * : pack_fields_m \
+		)(pbuf, pbuflen, ustruct, fields, ARRAY_SIZE(fields), quirks)
+
+#define unpack_fields(pbuf, pbuflen, ustruct, fields, quirks) \
+	_Generic((fields), \
+		 const struct packed_field_s * : unpack_fields_s, \
+		 const struct packed_field_m * : unpack_fields_m \
+		)(pbuf, pbuflen, ustruct, fields, ARRAY_SIZE(fields), quirks)
+
 #endif
diff --git a/include/linux/packing_types.h b/include/linux/packing_types.h
new file mode 100644
index 000000000000..49ae4329a494
--- /dev/null
+++ b/include/linux/packing_types.h
@@ -0,0 +1,54 @@
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
+	__type size;
+
+/* Small packed field. Use with bit offsets < 256, buffers < 32B and
+ * unpacked structures < 256B.
+ */
+struct packed_field_s {
+	GEN_PACKED_FIELD_MEMBERS(u8);
+};
+
+#define __pf_section_s __section(".rodata.packed_fields_s")
+
+#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
+	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
+	const struct packed_field_s name[] __pf_section_s
+
+/* Medium packed field. Use with bit offsets < 65536, buffers < 8KB and
+ * unpacked structures < 64KB.
+ */
+struct packed_field_m {
+	GEN_PACKED_FIELD_MEMBERS(u16);
+};
+
+#define __pf_section_m __section(".rodata.packed_fields_m")
+
+#define DECLARE_PACKED_FIELDS_M(name, buffer_sz) \
+	const size_t __ ## name ## _buffer_sz __pf_section_m = buffer_sz; \
+	const struct packed_field_m name[] __pf_section_m
+
+#define PACKED_FIELD(start, end, struct_name, struct_field) \
+{ \
+	(start), \
+	(end), \
+	offsetof(struct_name, struct_field), \
+	sizeof_field(struct_name, struct_field), \
+}
+
+#endif
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ada3a36cc4bc..013bf4be2642 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -160,6 +160,19 @@ static inline bool is_valid_name(struct elf_info *elf, Elf_Sym *sym)
 	return !is_mapping_symbol(name);
 }
 
+/* This is based on the hash algorithm from gdbm, via tdb */
+static inline unsigned int tdb_hash(const char *name)
+{
+	unsigned value;	/* Used to compute the hash value.  */
+	unsigned   i;	/* Used to cycle through random values. */
+
+	/* Set the initial value from the key size. */
+	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
+		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
+
+	return (1103515243 * value + 12345);
+}
+
 /* symsearch.c */
 void symsearch_init(struct elf_info *elf);
 void symsearch_finish(struct elf_info *elf);
@@ -175,12 +188,18 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 /* sumversion.c */
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
+/* packed_fields.c */
+void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
+				Elf_Sym *sym, const char *symname);
+void check_packed_field_symbols(void);
+
 /* from modpost.c */
 extern bool target_is_big_endian;
 extern bool host_is_big_endian;
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
+const char *sec_name(const struct elf_info *info, unsigned int secindex);
 
 void __attribute__((format(printf, 2, 3)))
 modpost_log(bool is_error, const char *fmt, ...);
diff --git a/lib/packing.c b/lib/packing.c
index 2bf81951dfc8..45164f73fe5b 100644
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
@@ -168,8 +195,8 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
 }
 EXPORT_SYMBOL(pack);
 
-static void __unpack(const void *pbuf, u64 *uval, size_t startbit,
-		     size_t endbit, size_t pbuflen, u8 quirks)
+static void __unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
+		     size_t pbuflen, u8 quirks)
 {
 	/* Logical byte indices corresponding to the
 	 * start and end of the field.
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
index b38ea43c03fd..ff5be660de01 100644
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
+	u8 field1;
+	u16 field2;
+	u32 field3;
+	u16 field4;
+	u8 field5;
+	u16 field6;
+};
+
+DECLARE_PACKED_FIELDS_S(test_fields, sizeof(packed_buf_t)) = {
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
+	packed_buf_t buf = {};
+	packed_buf_t expect = {
+		.buf = { 0x50, 0x0F, 0x00, 0x05, 0x01, 0xF4, 0xD3, 0x0B },
+	};
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
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..3f707bba18d7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -209,19 +209,6 @@ struct symbol {
 
 static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
 
-/* This is based on the hash algorithm from gdbm, via tdb */
-static inline unsigned int tdb_hash(const char *name)
-{
-	unsigned value;	/* Used to compute the hash value.  */
-	unsigned   i;	/* Used to cycle through random values. */
-
-	/* Set the initial value from the key size. */
-	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
-		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
-
-	return (1103515243 * value + 12345);
-}
-
 /**
  * Allocate a new symbols for use in the hash of exported symbols or
  * the list of unresolved symbols per module
@@ -327,7 +314,7 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
 				      sechdr->sh_name);
 }
 
-static const char *sec_name(const struct elf_info *info, unsigned int secindex)
+const char *sec_name(const struct elf_info *info, unsigned int secindex)
 {
 	/*
 	 * If sym->st_shndx is a special section index, there is no
@@ -1602,6 +1589,7 @@ static void read_symbols(const char *modname)
 
 		handle_symbol(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
+		handle_packed_field_symbol(mod, &info, sym, symname);
 	}
 
 	check_sec_ref(mod, &info);
@@ -2222,6 +2210,8 @@ int main(int argc, char **argv)
 	if (missing_namespace_deps)
 		write_namespace_deps_files(missing_namespace_deps);
 
+	check_packed_field_symbols();
+
 	if (dump_write)
 		write_dump(dump_write);
 	if (sec_mismatch_count && !sec_mismatch_warn_only)
diff --git a/scripts/mod/packed_fields.c b/scripts/mod/packed_fields.c
new file mode 100644
index 000000000000..aa9dbd704e52
--- /dev/null
+++ b/scripts/mod/packed_fields.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024, Intel Corporation. */
+
+/* Code to validate struct packed_field_[sm] data, and perform sanity checks
+ * to ensure the packed field data is laid out correctly and fits into the
+ * relevant buffer size.
+ */
+
+#include <fnmatch.h>
+#include <hashtable.h>
+#include <inttypes.h>
+#include <stdint.h>
+#include <xalloc.h>
+
+#include "modpost.h"
+
+typedef uint16_t	u16;
+typedef uint8_t		u8;
+
+#define BITS_PER_BYTE	8
+
+/* Big exception to the "don't include kernel headers into userspace", which
+ * even potentially has different endianness and word sizes, since we handle
+ * those differences explicitly below
+ */
+#include "../../include/linux/packing_types.h"
+
+struct packed_field_elem {
+	uint64_t startbit;
+	uint64_t endbit;
+	uint64_t offset;
+	uint64_t size;
+};
+
+enum field_type {
+	UNKNOWN_SECTION,
+	PACKED_FIELD_S,
+	PACKED_FIELD_M,
+};
+
+static size_t field_type_to_size(enum field_type type)
+{
+	switch (type) {
+	case PACKED_FIELD_S:
+		return sizeof(struct packed_field_s);
+	case PACKED_FIELD_M:
+		return sizeof(struct packed_field_m);
+	default:
+		error("attempted to get field size for unknown packed field type %u\n",
+		      type);
+		return 0;
+	}
+}
+
+static void get_field_contents(const void *data, enum field_type type,
+			       struct packed_field_elem *elem)
+{
+	switch (type) {
+	case PACKED_FIELD_S: {
+		const struct packed_field_s *data_field = data;
+
+		elem->startbit = TO_NATIVE(data_field->startbit);
+		elem->endbit = TO_NATIVE(data_field->endbit);
+		elem->offset = TO_NATIVE(data_field->offset);
+		elem->size = TO_NATIVE(data_field->size);
+		return;
+	}
+	case PACKED_FIELD_M: {
+		const struct packed_field_m *data_field = data;
+
+		elem->startbit = TO_NATIVE(data_field->startbit);
+		elem->endbit = TO_NATIVE(data_field->endbit);
+		elem->offset = TO_NATIVE(data_field->offset);
+		elem->size = TO_NATIVE(data_field->size);
+		return;
+	}
+	default:
+		error("attempted to get field contents for unknown packed field type %u\n",
+		      type);
+	}
+}
+
+struct field_symbol {
+	struct hlist_node hnode;
+	enum field_type type;
+	size_t buffer_size;
+	size_t data_size;
+	void *data;
+	struct module *mod;
+	char *name;
+};
+
+static HASHTABLE_DEFINE(field_hashtable, 1U << 10);
+
+static struct field_symbol *alloc_field(char *name, struct module *mod)
+{
+	struct field_symbol *f = xmalloc(sizeof(*f));
+
+	memset(f, 0, sizeof(*f));
+	f->mod = mod;
+	f->name = name;
+
+	return f;
+}
+
+static void hash_add_field(struct field_symbol *field)
+{
+	hash_add(field_hashtable, &field->hnode, tdb_hash(field->name));
+}
+
+static struct field_symbol *find_field(const char *name, struct module *mod)
+{
+	struct field_symbol *f;
+
+	hash_for_each_possible(field_hashtable, f, hnode, tdb_hash(name)) {
+		if (strcmp(f->name, name) == 0 && f->mod == mod)
+			return f;
+	}
+	return NULL;
+}
+
+void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
+				Elf_Sym *sym, const char *symname)
+{
+	unsigned int secindex = get_secindex(info, sym);
+	enum field_type type = UNKNOWN_SECTION;
+	bool is_size_symbol = false;
+	struct field_symbol *f;
+	const char *section;
+	char *name;
+
+	/* Skip symbols without a name */
+	if (*symname == '\0')
+		return;
+
+	/* Skip symbols with invalid sections */
+	if (secindex >= info->num_sections)
+		return;
+
+	section = sec_name(info, secindex);
+
+	if (strcmp(section, ".rodata.packed_fields_s") == 0)
+		type = PACKED_FIELD_S;
+	else if (strcmp(section, ".rodata.packed_fields_m") == 0)
+		type = PACKED_FIELD_M;
+
+	/* Other sections don't relate to packed fields */
+	if (type == UNKNOWN_SECTION)
+		return;
+
+	name = xstrdup(symname);
+
+	/* Extract original field name from the size symbol */
+	if (!fnmatch("__*_buffer_sz", name, 0)) {
+		name += strlen("__");
+		name[strlen(name) - strlen("_buffer_sz")] = '\0';
+		is_size_symbol = true;
+	}
+
+	f = find_field(name, mod);
+	if (!f) {
+		f = alloc_field(name, mod);
+		f->type = type;
+		hash_add_field(f);
+	}
+
+	if (f->type != type) {
+		error("%s and %s have mismatched packed field sections\n",
+		      f->name, symname);
+		return;
+	}
+
+	if (is_size_symbol) {
+		size_t *size_data = sym_get_data(info, sym);
+		size_t size = TO_NATIVE(*size_data);
+
+		if (f->buffer_size && f->buffer_size != size) {
+			error("%s has buffer size %zu, but symbol %s says the size should be %zu\n",
+			      f->name, f->buffer_size, symname, size);
+		}
+
+		f->buffer_size = size;
+	} else {
+		if (f->data)
+			error("%s has multiple data symbols???\n",
+			      f->name);
+
+		f->data_size = sym->st_size;
+		f->data = xmalloc(f->data_size);
+		memcpy(f->data, sym_get_data(info, sym), f->data_size);
+	}
+}
+
+enum element_order {
+	FIRST_ELEMENT,
+	SECOND_ELEMENT,
+	ASCENDING_ORDER,
+	DESCENDING_ORDER,
+};
+
+static void check_packed_field_array(const struct field_symbol *f)
+{
+	struct packed_field_elem previous_elem = {};
+	size_t field_size = field_type_to_size(f->type);
+	enum element_order order = FIRST_ELEMENT;
+	void *data_ptr;
+	int count;
+
+	/* check that the data is a multiple of the size */
+	if (f->data_size % field_size != 0) {
+		error("symbol %s of module %s has size %zu which is not a multiple of the field size (%zu)\n",
+		      f->name, f->mod->name, f->data_size, field_size);
+		return;
+	}
+
+	data_ptr = f->data;
+	count = 0;
+
+	while (data_ptr < f->data + f->data_size) {
+		struct packed_field_elem elem = {};
+
+		get_field_contents(data_ptr, f->type, &elem);
+
+		if (elem.startbit < elem.endbit)
+			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") must be larger than endbit (%" PRIu64 ")\n",
+			      f->name, f->mod->name, count, elem.startbit,
+			      elem.endbit);
+
+		if (elem.startbit >= BITS_PER_BYTE * f->buffer_size)
+			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") puts field outsize of the packed buffer size (%" PRIu64 ")\n",
+			      f->name, f->mod->name, count, elem.startbit,
+			      f->buffer_size);
+
+		if (elem.startbit - elem.endbit >= BITS_PER_BYTE * elem.size)
+			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") and endbit (%" PRIu64 ") indicate a field of width (%" PRIu64 ") which does not fit into the field size (%" PRIu64 ")\n",
+			      f->name, f->mod->name, count, elem.startbit,
+			      elem.endbit, elem.startbit - elem.endbit,
+			      elem.size);
+
+		if (elem.size != 1 && elem.size != 2 && elem.size != 4 && elem.size != 8)
+			error("\"%s\" [%s.ko] element %u size (%" PRIu64 ") must be 1, 2, 4, or 8\n",
+			      f->name, f->mod->name, count, elem.size);
+
+		switch (order) {
+		case FIRST_ELEMENT:
+			order = SECOND_ELEMENT;
+			break;
+		case SECOND_ELEMENT:
+			order = previous_elem.startbit < elem.startbit ?
+				ASCENDING_ORDER : DESCENDING_ORDER;
+			break;
+		default:
+			break;
+		}
+
+		switch (order) {
+		case ASCENDING_ORDER:
+			if (previous_elem.startbit >= elem.startbit)
+				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element startbit is %" PRIu64 "\n",
+				      f->name, f->mod->name, count,
+				      elem.startbit, previous_elem.startbit);
+			if (previous_elem.endbit >= elem.endbit)
+				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element endbit is %" PRIu64 "\n",
+				      f->name, f->mod->name, count, elem.endbit,
+				      previous_elem.endbit);
+
+			break;
+		case DESCENDING_ORDER:
+			if (previous_elem.startbit <= elem.startbit)
+				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in descending order, but previous element startbit is %" PRIu64 "\n",
+				      f->name, f->mod->name, count,
+				      elem.startbit, previous_elem.startbit);
+			if (previous_elem.endbit <= elem.endbit)
+				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in descending order, but previous element endbit is %" PRIu64 "\n",
+				      f->name, f->mod->name, count,
+				      elem.endbit, previous_elem.endbit);
+			break;
+		default:
+			break;
+		}
+
+		previous_elem = elem;
+		data_ptr += field_size;
+		count++;
+	}
+}
+
+void check_packed_field_symbols(void)
+{
+	struct field_symbol *f;
+
+	hash_for_each(field_hashtable, f, hnode)
+		check_packed_field_array(f);
+}
diff --git a/Documentation/core-api/packing.rst b/Documentation/core-api/packing.rst
index 821691f23c54..abfdc429fc26 100644
--- a/Documentation/core-api/packing.rst
+++ b/Documentation/core-api/packing.rst
@@ -235,3 +235,58 @@ programmer against incorrect API use.  The errors are not expected to occur
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
+sanity checks on the field definitions are handled at compile time via
+modpost warnings, rather than only when the offending code is executed.
+
+Example
+-------
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
+   DECLARE_PACKED_FIELDS_S(fields, SIZE) = {
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
index c51fd742cbc8..5649263504c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17391,8 +17391,10 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	Documentation/core-api/packing.rst
 F:	include/linux/packing.h
+F:	include/linux/packing_types.h
 F:	lib/packing.c
 F:	lib/packing_test.c
+F:	scripts/mod/packed_fields.c
 
 PADATA PARALLEL EXECUTION MECHANISM
 M:	Steffen Klassert <steffen.klassert@secunet.com>
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index c729bc936bae..aa729b6000b6 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -4,7 +4,7 @@ CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
 
-modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
+modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o packed_fields.o
 
 devicetable-offsets-file := devicetable-offsets.h
 
@@ -15,7 +15,7 @@ targets += $(devicetable-offsets-file) devicetable-offsets.s
 
 # dependencies on generated files need to be listed explicitly
 
-$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o $(obj)/symsearch.o: $(obj)/elfconfig.h
+$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o $(obj)/symsearch.o $(obj)/packed_fields.o: $(obj)/elfconfig.h
 $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)
 
 quiet_cmd_elfconfig = MKELF   $@

-- 
2.47.0.265.g4ca455297942


