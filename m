Return-Path: <linux-kbuild+bounces-4622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D77119C3973
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970052823CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93871662F6;
	Mon, 11 Nov 2024 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpVTOG3Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87315C158;
	Mon, 11 Nov 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312538; cv=none; b=rQdVDLXN+W3hqdjXVvP+EjstmEKXa8Szsz/qfuR0SjEMdZCprGmXU4GPJtswOJ/E6QI+XA3bDyCQ3RXUS2aGfBXrRd2J+sw+5ejo3tVAu/AWSPceyirWiXcA9zpqtW1zDXy0dyR71drQefTy8cWOXpkyINjwLsUssC2JLB06YE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312538; c=relaxed/simple;
	bh=s10/ea9WOrr2cC/sloh74zCNPQqfIzA9AgM7R8AlSVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi0NeOWKyg3vMsYst3Jsbk5GxpwfAZMeYKdZDkw5TynUjXNtTsyq/9OgsK5QUiwwD3aQid+Y3eWLm4hGophsHQInkReF3SnIUyaMprYfU07Smv3/fvCXOGdjysI25Rjv7U86KxWQL2lDRDKmtA3CHYcAdtUbZf/qxJrXhl0zjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpVTOG3Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312536; x=1762848536;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=s10/ea9WOrr2cC/sloh74zCNPQqfIzA9AgM7R8AlSVs=;
  b=RpVTOG3Qk5usI2BrVjSzB1jjlIw2EV+NfD2AlfbtG6bDd1Po47X1+869
   8H4U9BjLb9C2PKxebhsjV8hFKmYOw3KcLgE4c97CB4COouOVUEMALFucg
   9YniAvms9hfBm0ZDJGW9BFAALetoNoAHwI5zH1sjCaOuiVadvYAcKRMEq
   RtRaO8NAbd4NGnnBiFqvkYw74hua7z4ppNs+wNeIJjNoZAIt81D0x9Izs
   ZPwyVNNOmNbDMgM1/SE1xpSOSdJ6v1Ke8s91/v4beIVcTP4ookbmLbruZ
   y1OCDyGxZtsN5iPuRwqnr3h64SIkzvFCPnvwPv9S7rEw2+mXEyhdOpeyW
   g==;
X-CSE-ConnectionGUID: 76cIJiXpR6uxPQJv9YV8dg==
X-CSE-MsgGUID: RdA9G34IStaH5jaRSRJg3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723221"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:54 -0800
X-CSE-ConnectionGUID: gZtjahz5TrqB+fgXfyNGNw==
X-CSE-MsgGUID: cQfXaF4tTPm0Y0qCgUAnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323651"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:44 -0800
Subject: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
In-Reply-To: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
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
  overlap checks at compile time.

  Instead, check for field ordering and overlap in modpost. This allows
  writing C code to validate the data. Enable this by marking the packed
  field arrays in a special data section via use of __section() as part of
  DECLARE_PACKED_FIELD_S and DECLARE_PACKED_FIELD_M macros.

  While modpost can easily check ordering of the packed fields and ensure
  no fields overlap, it is tricky to check that the fields all fit within
  the intended buffer. This is instead handled by BUILD_BUG_ON in the
  pack_fields and unpack_fields() macros. To enable this, the macros
  require that the buffers be represented by a type which has a size. Users
  of the API will need to ensure their buffers are represented by pointers
  to a type of the appropriate size, such as with a struct typedef.

  The use of modpost keeps the logic for size checking contained to one
  place, without requiring drivers to invoke a separate macro like the
  previous C pre-processor solution. It also avoids the need for thousands
  of generated lines of macro.

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
 include/linux/packing.h            |  43 ++++++++
 include/linux/packing_types.h      |  48 +++++++++
 scripts/mod/modpost.h              |   5 +
 lib/packing.c                      | 145 +++++++++++++++++++++++++++
 lib/packing_test.c                 |  61 ++++++++++++
 scripts/mod/modpost.c              |   3 +-
 scripts/mod/packed_fields.c        | 199 +++++++++++++++++++++++++++++++++++++
 Documentation/core-api/packing.rst |  59 +++++++++++
 MAINTAINERS                        |   2 +
 scripts/mod/Makefile               |   4 +-
 10 files changed, 566 insertions(+), 3 deletions(-)

diff --git a/include/linux/packing.h b/include/linux/packing.h
index 5d36dcd06f60..18e59102ef47 100644
--- a/include/linux/packing.h
+++ b/include/linux/packing.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/packing_types.h>
 
 #define QUIRK_MSB_ON_THE_RIGHT	BIT(0)
 #define QUIRK_LITTLE_ENDIAN	BIT(1)
@@ -26,4 +27,46 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
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
+#define pack_fields(pbuf, ustruct, fields, quirks) \
+	({ \
+		typeof(fields[0]) *__f = fields; \
+		size_t pbuflen = sizeof(*pbuf); \
+		size_t num_fields = ARRAY_SIZE(fields); \
+		BUILD_BUG_ON(__f[0].startbit >= BITS_PER_BYTE * pbuflen); \
+		BUILD_BUG_ON(__f[num_fields - 1].startbit >= BITS_PER_BYTE * pbuflen); \
+		_Generic((fields), \
+			 const struct packed_field_s * : pack_fields_s, \
+			 const struct packed_field_m * : pack_fields_m \
+			)(pbuf, pbuflen, ustruct, __f, num_fields, quirks); \
+	})
+
+#define unpack_fields(pbuf, ustruct, fields, quirks) \
+	({ \
+		typeof(fields[0]) *__f = fields; \
+		size_t pbuflen = sizeof(*pbuf); \
+		size_t num_fields = ARRAY_SIZE(fields); \
+		BUILD_BUG_ON(__f[0].startbit >= BITS_PER_BYTE * pbuflen); \
+		BUILD_BUG_ON(__f[num_fields - 1].startbit >= BITS_PER_BYTE * pbuflen); \
+		_Generic((fields), \
+			 const struct packed_field_s * : unpack_fields_s, \
+			 const struct packed_field_m * : unpack_fields_m \
+			)(pbuf, pbuflen, ustruct, __f, num_fields, quirks); \
+	})
+
 #endif
diff --git a/include/linux/packing_types.h b/include/linux/packing_types.h
new file mode 100644
index 000000000000..e0fa5d38ca48
--- /dev/null
+++ b/include/linux/packing_types.h
@@ -0,0 +1,48 @@
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
+#define DECLARE_PACKED_FIELDS_S(name) \
+	const struct packed_field_s name[] __section(".rodata.packed_fields_s")
+
+/* Medium packed field. Use with bit offsets < 65536, buffers < 8KB and
+ * unpacked structures < 64KB.
+ */
+struct packed_field_m {
+	GEN_PACKED_FIELD_MEMBERS(u16);
+};
+
+#define DECLARE_PACKED_FIELDS_M(name) \
+	const struct packed_field_m name[] __section(".rodata.packed_fields_m")
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
index ada3a36cc4bc..01e678626531 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -175,12 +175,17 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 /* sumversion.c */
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
+/* packed_fields.c */
+void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
+				Elf_Sym *sym, const char *symname);
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
index b38ea43c03fd..d8693e797d9b 100644
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
+static DECLARE_PACKED_FIELDS_S(test_fields) = {
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
+	pack_fields(&buf, &data, test_fields, 0);
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
+	unpack_fields(&buf, &data, test_fields, 0);
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
index 107393a8c48a..5425a2afc2d8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -327,7 +327,7 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
 				      sechdr->sh_name);
 }
 
-static const char *sec_name(const struct elf_info *info, unsigned int secindex)
+const char *sec_name(const struct elf_info *info, unsigned int secindex)
 {
 	/*
 	 * If sym->st_shndx is a special section index, there is no
@@ -1602,6 +1602,7 @@ static void read_symbols(const char *modname)
 
 		handle_symbol(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
+		handle_packed_field_symbol(mod, &info, sym, symname);
 	}
 
 	check_sec_ref(mod, &info);
diff --git a/scripts/mod/packed_fields.c b/scripts/mod/packed_fields.c
new file mode 100644
index 000000000000..474c8a8122e2
--- /dev/null
+++ b/scripts/mod/packed_fields.c
@@ -0,0 +1,199 @@
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
+#define max(a, b) ({\
+		typeof(a) _a = a;\
+		typeof(b) _b = b;\
+		_a > _b ? _a : _b; })
+
+#define min(a, b) ({\
+		typeof(a) _a = a;\
+		typeof(b) _b = b;\
+		_a < _b ? _a : _b; })
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
+enum element_order {
+	FIRST_ELEMENT,
+	SECOND_ELEMENT,
+	ASCENDING_ORDER,
+	DESCENDING_ORDER,
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
+void handle_packed_field_symbol(struct module *mod, struct elf_info *info,
+				Elf_Sym *sym, const char *symname)
+{
+	unsigned int secindex = get_secindex(info, sym);
+	struct packed_field_elem elem = {}, prev = {};
+	enum element_order order = FIRST_ELEMENT;
+	enum field_type type = UNKNOWN_SECTION;
+	size_t field_size, count;
+	const void *data, *ptr;
+	const char *section;
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
+	field_size = field_type_to_size(type);
+
+	/* check that the data is a multiple of the size */
+	if (sym->st_size % field_size != 0) {
+		error("[%s.ko] \"%s\" has size %u which is not a multiple of the field size (%zu)\n",
+		      mod->name, symname, sym->st_size, field_size);
+		return;
+	}
+
+	data = sym_get_data(info, sym);
+
+	for (ptr = data, count = 0;
+	     ptr < data + sym->st_size;
+	     ptr += field_size, count++, prev = elem) {
+		get_field_contents(ptr, type, &elem);
+
+		if (elem.size != 1 && elem.size != 2 &&
+		    elem.size != 4 && elem.size != 8)
+			error("[%s.ko] \"%s\" field %zu unpacked size (%" PRIu64 ") must be 1, 2, 4, or 8\n",
+			      mod->name, symname, count, elem.size);
+
+		if (elem.startbit < elem.endbit)
+			error("[%s.ko] \"%s\" field %zu (%" PRIu64 "-%" PRIu64 "): start bit must be >= end bit\n",
+			      mod->name, symname, count,
+			      elem.startbit, elem.endbit);
+
+		if (elem.startbit - elem.endbit + 1 > BITS_PER_BYTE * elem.size)
+			error("[%s.ko] \"%s\" field %zu (%" PRIu64 "-%" PRIu64 ") has a width of %" PRIu64 " bits which does not fit into the unpacked structure field (%" PRIu64 " bytes)\n",
+			      mod->name, symname, count,
+			      elem.startbit, elem.endbit,
+			      elem.startbit - elem.endbit + 1,
+			      elem.size);
+
+		if (order != FIRST_ELEMENT &&
+		    max(elem.endbit, prev.endbit) <=
+		    min(elem.startbit, prev.startbit))
+			error("[%s.ko] \"%s\" field %zu (%" PRIu64 "-%" PRIu64 ") overlaps with previous field (%" PRIu64 "-%" PRIu64 ")\n",
+			      mod->name, symname, count,
+			      elem.startbit, elem.endbit,
+			      prev.startbit, prev.endbit);
+
+		switch (order) {
+		case FIRST_ELEMENT:
+			order = SECOND_ELEMENT;
+			break;
+		case SECOND_ELEMENT:
+			order = prev.startbit < elem.startbit ?
+				ASCENDING_ORDER : DESCENDING_ORDER;
+			break;
+		case ASCENDING_ORDER:
+			if (prev.startbit >= elem.startbit ||
+			    prev.endbit >= elem.endbit)
+				error("[%s.ko] \"%s\" field %zu (%" PRIu64 "-%" PRIu64") not in ascending order with previous field (%" PRIu64 "-%" PRIu64 ")\n",
+				      mod->name, symname, count,
+				      elem.startbit, elem.endbit,
+				      prev.startbit, prev.endbit);
+			break;
+		case DESCENDING_ORDER:
+			if (prev.startbit <= elem.startbit ||
+			    prev.endbit <= elem.endbit)
+				error("[%s.ko] \"%s\" field %zu (%" PRIu64 "-%" PRIu64") not in descending order with previous field (%" PRIu64 "-%" PRIu64 ")\n",
+				      mod->name, symname, count,
+				      elem.startbit, elem.endbit,
+				      prev.startbit, prev.endbit);
+			break;
+		default:
+			break;
+		}
+	}
+}
diff --git a/Documentation/core-api/packing.rst b/Documentation/core-api/packing.rst
index 821691f23c54..d4cdc287704d 100644
--- a/Documentation/core-api/packing.rst
+++ b/Documentation/core-api/packing.rst
@@ -235,3 +235,62 @@ programmer against incorrect API use.  The errors are not expected to occur
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
+``modpost`` warnings, rather than only when the offending code is executed.
+
+The ``pack_fields()`` and ``unpack_fields()`` macros determine the size of
+the packed buffer by its type. Thus, you must ensure the buffer is a pointer
+to a type with the desired size. This is typically achieved by creating a
+typedef with a packed structure.
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
index a4855581d62c..daaf4ae5bd9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17445,8 +17445,10 @@ L:	netdev@vger.kernel.org
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


