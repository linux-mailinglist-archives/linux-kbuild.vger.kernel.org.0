Return-Path: <linux-kbuild+bounces-6948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC8AA9E11
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 23:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936A95A2B6C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 21:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E252B2750E4;
	Mon,  5 May 2025 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AN0PjznP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A022749D0
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480253; cv=none; b=cOUCSR1ULXGkxBI0Uwq+UfMnD2l2lGMF32cSyjl6u7FifkkYzJTXs0iP8UlbImvUwyHyPqg1m+dTyJMQHmIev+W2P/416oheoFSIAtPkU6x8bdVbPJBNhtZZYld8sTi++NxOs7KlGSR76GAaYsw7ioii0a+Kv9KXDuiL8U6kj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480253; c=relaxed/simple;
	bh=YRTSlFbj0SA7Uc/V+ldiVlMORzMW2TIQ4ahhg0ZRikw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mCiIXBMegk5HdnDEIbdQDWRD/DWojDURhZfoFA8FQtkzjwb/XTIpiZ2Oqy4whZ6zVvcdxxGZl9PbYBGkWvNyCury7ELlt7Uwxr5hsCEhHfhu4byO+SkQL0DBFZyuE9WK95zjCTfo+PlFunvalcRYPXLKi0FQIz/cVgIHxEXIq7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AN0PjznP; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73e0094706bso6789287b3a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746480251; x=1747085051; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8m8K3D0qpU4xkcJLM2+2ewnAqTFJC+MNnS9adtsrEgw=;
        b=AN0PjznPC49pAWTHDl4mfJXSWMj7Lo8lizSNvkKS12zYD4OmFHxF0pBt6Dm6qRHvl7
         VeIBviMqnRt8qTc72j+9BZZ/cgfGM/ERZnOZ5zLaanzrnriJ4IzJpW7a/XST1iMFIZrE
         2vwndwpHtvpWpxvRCs5sN0XXSFYcssYDmU/lxmXmn3FumxrS4xTdjiRMMGDrjl759Dub
         yHm/siVxmti873UjT7gumWjDN0j0bXBSRbrZGavrtgWDr/hDfqRamWgfnNeYoON+vpp2
         aOxvslTUUEOvzACpQBuLYfe94cbfiXhJTMcRUigFCvcl98BxoYSn4pYsvU0OFyJ/XDFV
         vl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480251; x=1747085051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8m8K3D0qpU4xkcJLM2+2ewnAqTFJC+MNnS9adtsrEgw=;
        b=ey76bbFfi6pnv3jYpYtcGsEF+JOJb5j03cPtgqLHqJpSF38fPlRoazvlLqKSIODHgi
         5qpg0o0uOKCmLdKGqaAqT329Mx9tYsGmMWqyyz8Kv/iT/o6WGagfME/fMEyfxHukE9yI
         O8NRGOvLFV4qq1grlvy3Er4FQ1biENsQ3O/Hrdjo47NioAT+DtE84+igbU/iGW7Ntls3
         NGAq5uhudse6mdt1MGt1slYEikexQQm55wZPGcV2yCfBmXNoV8AnFN6b6NbyyOD6f9hA
         hlBx0WtwE3LwsvsNVAlQGSJtFkrg8gnLRSHSJv/FLer9weiKQeA1u6XxB+0GK5AdH2OH
         pTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzhi90xn6J7zI0L3lRFqTezHeQH52gpd8hM8sqqZbdiWHMSPTNg8SPTE9nJxbqF1cXHkkZPUDDRkG6uWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKy0g+Vp/QhJrQv06CKaO4FZEdSeoCW+zRSnIiO1fmdViKn4P
	YaKlf55ui4l78tpFBntgRDRPgpSRTBR6WZDMEd20c/i7ETZjeHdUnbwvM5qA4NmWnlxMCXu98Up
	vYQWZDp5Sy9fsobYCHM/vP1v4Xw==
X-Google-Smtp-Source: AGHT+IFtwnNPyyRDavv9A81ORaoVn1hNWIxzJAnipv72HVlSx0/n2aFPN1kTi5T34UWsoDG7poB4cCrYHshTXDMz8bU=
X-Received: from pfud17.prod.google.com ([2002:a05:6a00:10d1:b0:739:56be:f58c])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8d86:b0:73e:598:b2a1 with SMTP id d2e1a72fcca58-7406f0932aemr11741436b3a.1.1746480250728;
 Mon, 05 May 2025 14:24:10 -0700 (PDT)
Date: Mon,  5 May 2025 21:24:05 +0000
In-Reply-To: <20250505212401.3379699-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505212401.3379699-6-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=16692; i=samitolvanen@google.com;
 h=from:subject; bh=YRTSlFbj0SA7Uc/V+ldiVlMORzMW2TIQ4ahhg0ZRikw=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSOkVHVbIKuB4e+bt4msmmBYf/ZV9tzVxnKL22JDAyb
 HbHd1+ZjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRxsOMDPseHM7+vd+y9dKP
 A9IiV+zmuuRvEPnrWrNUk/1v6M1jG+8x/BX0VHmbccCrN8KqrV87wO3Xz+6CJVWfve+cDflS5DE 1nB8A
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505212401.3379699-9-samitolvanen@google.com>
Subject: [PATCH v2 3/4] gendwarfksyms: Add a kABI rule to override type strings
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

In rare situations where distributions must make significant
changes to otherwise opaque data structures that have
inadvertently been included in the published ABI, keeping
symbol versions stable using the existing kABI macros can
become tedious.

For example, Android decided to switch to a newer io_uring
implementation in the 5.10 GKI kernel "to resolve a huge number
of potential, and known, problems with the codebase," requiring
"horrible hacks" with genksyms:

  "A number of the io_uring structures get used in other core
  kernel structures, only as "opaque" pointers, so there is
  not any real ABI breakage.  But, due to the visibility of
  the structures going away, the CRC values of many scheduler
  variables and functions were changed."
    -- https://r.android.com/2425293

While these specific changes probably could have been hidden
from gendwarfksyms using the existing kABI macros, this may not
always be the case.

Add a last resort kABI rule that allows distribution
maintainers to fully override a type string for a symbol or a
type. Also add a more informative error message in case we find
a non-existent type references when calculating versions.

Suggested-by: Giuliano Procida <gprocida@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/examples/kabi.h    |  14 ++-
 scripts/gendwarfksyms/examples/kabi_ex.c |   5 +
 scripts/gendwarfksyms/examples/kabi_ex.h |  79 ++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h    |   1 +
 scripts/gendwarfksyms/kabi.c             |  25 ++++
 scripts/gendwarfksyms/types.c            | 140 ++++++++++++++++++++---
 6 files changed, 246 insertions(+), 18 deletions(-)

diff --git a/scripts/gendwarfksyms/examples/kabi.h b/scripts/gendwarfksyms/examples/kabi.h
index 86f4428e0479..170733a3fba4 100644
--- a/scripts/gendwarfksyms/examples/kabi.h
+++ b/scripts/gendwarfksyms/examples/kabi.h
@@ -37,11 +37,14 @@
 #define __stringify(x...) __stringify_1(x)
 #endif
 
-#define __KABI_RULE(hint, target, value)                             \
+#define ___KABI_RULE(hint, target, value)                            \
 	static const char __PASTE(__gendwarfksyms_rule_,             \
 				  __COUNTER__)[] __used __aligned(1) \
 		__section(".discard.gendwarfksyms.kabi_rules") =     \
-			"1\0" #hint "\0" #target "\0" #value
+			"1\0" #hint "\0" target "\0" value
+
+#define __KABI_RULE(hint, target, value) \
+	___KABI_RULE(hint, #target, #value)
 
 #define __KABI_NORMAL_SIZE_ALIGN(_orig, _new)                                             \
 	union {                                                                           \
@@ -96,6 +99,13 @@
  */
 #define KABI_BYTE_SIZE(fqn, value) __KABI_RULE(byte_size, fqn, value)
 
+/*
+ * KABI_TYPE_STRING(type, str)
+ *   For the given type, override the type string used in symtypes
+ *   output and version calculation with str.
+ */
+#define KABI_TYPE_STRING(type, str) ___KABI_RULE(type_string, type, str)
+
 /*
  * KABI_RESERVE
  *   Reserve some "padding" in a structure for use by LTS backports.
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.c b/scripts/gendwarfksyms/examples/kabi_ex.c
index b73ee5399a59..1f799eb7c756 100644
--- a/scripts/gendwarfksyms/examples/kabi_ex.c
+++ b/scripts/gendwarfksyms/examples/kabi_ex.c
@@ -30,3 +30,8 @@ struct ex3b ex3b;
 struct ex3c ex3c;
 
 struct ex4a ex4a;
+
+struct ex5a ex5a;
+struct ex5b ex5b;
+
+int ex6a;
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.h b/scripts/gendwarfksyms/examples/kabi_ex.h
index 092c8cb7bcd7..785b211d9c58 100644
--- a/scripts/gendwarfksyms/examples/kabi_ex.h
+++ b/scripts/gendwarfksyms/examples/kabi_ex.h
@@ -21,6 +21,12 @@
  * 	./gendwarfksyms --stable --dump-dies \
  * 		examples/kabi_ex.o 2>&1 >/dev/null | \
  * 	FileCheck examples/kabi_ex.h --check-prefix=STABLE
+
+ * $ nm examples/kabi_ex.o | awk '{ print $NF }' | \
+ * 	./gendwarfksyms --stable --dump-versions \
+ * 		examples/kabi_ex.o 2>&1 >/dev/null | \
+ * 	sort | \
+ * 	FileCheck examples/kabi_ex.h --check-prefix=VERSIONS
  */
 
 #ifndef __KABI_EX_H__
@@ -170,7 +176,7 @@ struct ex2a {
 /*
  * STABLE:      variable structure_type ex2a {
  * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
- * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) b data_member_location(8)
  * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
  * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
  * STABLE-NEXT: } byte_size(32)
@@ -227,7 +233,7 @@ struct ex3a {
 
 /*
  * STABLE:      variable structure_type ex3a {
- * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) a data_member_location(0)
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) a data_member_location(0)
  * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) unused data_member_location(8)
  * STABLE-NEXT: } byte_size(16)
  */
@@ -282,4 +288,73 @@ KABI_BYTE_SIZE(ex4a, 8);
  * STABLE-NEXT: } byte_size(8)
  */
 
+/*
+ * Example: A type string override.
+ */
+
+struct ex5a {
+	unsigned long a;
+};
+
+/*
+ * This may be safe if the structure is fully opaque to modules, even though
+ * its definition has inadvertently become part of the ABI.
+ */
+KABI_TYPE_STRING(
+	"s#ex5a",
+	"structure_type ex5a { member pointer_type { s#ex4a } byte_size(8) p data_member_location(0) } byte_size(8)");
+
+/*
+ * Make sure the fully expanded type string includes ex4a.
+ *
+ * VERSIONS:      ex5a variable structure_type ex5a {
+ * VERSIONS-SAME:   member pointer_type {
+ * VERSIONS-SAME:     structure_type ex4a {
+ * VERSIONS-SAME:       member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) a data_member_location(0)
+ * VERSIONS-SAME:     } byte_size(8)
+ * VERSIONS-SAME:   } byte_size(8) p data_member_location(0)
+ * VERSIONS-SAME: } byte_size(8)
+ */
+
+/*
+ * Example: A type string definition for a non-existent type.
+ */
+
+struct ex5b {
+	unsigned long a;
+};
+
+/* Replace the type string for struct ex5b */
+KABI_TYPE_STRING(
+	"s#ex5b",
+	"structure_type ex5b { member pointer_type { s#ex5c } byte_size(8) p data_member_location(0) } byte_size(8)");
+
+/* Define a type string for a non-existent struct ex5c */
+KABI_TYPE_STRING(
+	"s#ex5c",
+	"structure_type ex5c { member base_type int byte_size(4) encoding(5) n data_member_location(0) } byte_size(8)");
+
+/*
+ * Make sure the fully expanded type string includes the definition for ex5c.
+ *
+ * VERSIONS:      ex5b variable structure_type ex5b {
+ * VERSIONS-SAME:   member pointer_type {
+ * VERSIONS-SAME:     structure_type ex5c {
+ * VERSIONS-SAME:       member base_type int byte_size(4) encoding(5) n data_member_location(0)
+ * VERSIONS-SAME:     } byte_size(8)
+ * VERSIONS-SAME:   } byte_size(8) p data_member_location(0)
+ * VERSIONS-SAME: } byte_size(8)
+ */
+
+/*
+ * Example: A type string override for a symbol.
+ */
+
+KABI_TYPE_STRING("ex6a", "variable s#ex5c");
+
+/*
+ * VERSIONS:      ex6a variable structure_type ex5c {
+ * VERSIONS-SAME:   member base_type int byte_size(4) encoding(5) n data_member_location(0)
+ * VERSIONS-SAME: } byte_size(8)
+ */
 #endif /* __KABI_EX_H__ */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 2db49c2ad50e..7dd03ffe0c5c 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -292,6 +292,7 @@ bool kabi_is_enumerator_ignored(const char *fqn, const char *field);
 bool kabi_get_enumerator_value(const char *fqn, const char *field,
 			       unsigned long *value);
 bool kabi_is_declonly(const char *fqn);
+bool kabi_get_type_string(const char *type, const char **str);
 
 void kabi_read_rules(int fd);
 void kabi_free(void);
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index 61620ff647bd..b3ade713778f 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -61,12 +61,20 @@
  */
 #define KABI_RULE_TAG_BYTE_SIZE "byte_size"
 
+/*
+ * Rule: type_string
+ * - For the type reference in the fqn field, use the type string
+ *   in the value field.
+ */
+#define KABI_RULE_TAG_TYPE_STRING "type_string"
+
 enum kabi_rule_type {
 	KABI_RULE_TYPE_UNKNOWN,
 	KABI_RULE_TYPE_DECLONLY,
 	KABI_RULE_TYPE_ENUMERATOR_IGNORE,
 	KABI_RULE_TYPE_ENUMERATOR_VALUE,
 	KABI_RULE_TYPE_BYTE_SIZE,
+	KABI_RULE_TYPE_TYPE_STRING,
 };
 
 #define RULE_HASH_BITS 7
@@ -139,6 +147,10 @@ void kabi_read_rules(int fd)
 			.type = KABI_RULE_TYPE_BYTE_SIZE,
 			.tag = KABI_RULE_TAG_BYTE_SIZE,
 		},
+		{
+			.type = KABI_RULE_TYPE_TYPE_STRING,
+			.tag = KABI_RULE_TAG_TYPE_STRING,
+		},
 	};
 
 	if (!stable)
@@ -333,6 +345,19 @@ bool kabi_get_byte_size(const char *fqn, unsigned long *value)
 	return false;
 }
 
+bool kabi_get_type_string(const char *type, const char **str)
+{
+	struct rule *rule;
+
+	rule = find_rule(KABI_RULE_TYPE_TYPE_STRING, type);
+	if (rule) {
+		*str = rule->value;
+		return true;
+	}
+
+	return false;
+}
+
 void kabi_free(void)
 {
 	struct hlist_node *tmp;
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 6f37289104ff..39ce1770e463 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -100,7 +100,7 @@ static void type_expansion_append(struct type_expansion *type, const char *s,
 #define TYPE_HASH_BITS 12
 static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
 
-static int type_map_get(const char *name, struct type_expansion **res)
+static int __type_map_get(const char *name, struct type_expansion **res)
 {
 	struct type_expansion *e;
 
@@ -114,11 +114,12 @@ static int type_map_get(const char *name, struct type_expansion **res)
 	return -1;
 }
 
-static void type_map_add(const char *name, struct type_expansion *type)
+static struct type_expansion *type_map_add(const char *name,
+					   struct type_expansion *type)
 {
 	struct type_expansion *e;
 
-	if (type_map_get(name, &e)) {
+	if (__type_map_get(name, &e)) {
 		e = xmalloc(sizeof(struct type_expansion));
 		type_expansion_init(e);
 		e->name = xstrdup(name);
@@ -130,7 +131,7 @@ static void type_map_add(const char *name, struct type_expansion *type)
 	} else {
 		/* Use the longest available expansion */
 		if (type->len <= e->len)
-			return;
+			return e;
 
 		type_list_free(&e->expanded);
 
@@ -148,6 +149,34 @@ static void type_map_add(const char *name, struct type_expansion *type)
 		type_list_write(&e->expanded, stderr);
 		checkp(fputs("\n", stderr));
 	}
+
+	return e;
+}
+
+static void type_parse(const char *name, const char *str,
+		       struct type_expansion *type);
+
+static int type_map_get(const char *name, struct type_expansion **res)
+{
+	struct type_expansion type;
+	const char *override;
+
+	if (!__type_map_get(name, res))
+		return 0;
+
+	/*
+	 * If die_map didn't contain a type, we might still have
+	 * a type_string kABI rule that defines it.
+	 */
+	if (stable && kabi_get_type_string(name, &override)) {
+		type_expansion_init(&type);
+		type_parse(name, override, &type);
+		*res = type_map_add(name, &type);
+		type_expansion_free(&type);
+		return 0;
+	}
+
+	return -1;
 }
 
 static void type_map_write(FILE *file)
@@ -267,15 +296,18 @@ static char *get_type_name(struct die *cache)
 	return name;
 }
 
-static void __calculate_version(struct version *version, struct list_head *list)
+static void __calculate_version(struct version *version,
+				struct type_expansion *type)
 {
 	struct type_list_entry *entry;
 	struct type_expansion *e;
 
 	/* Calculate a CRC over an expanded type string */
-	list_for_each_entry(entry, list, list) {
+	list_for_each_entry(entry, &type->expanded, list) {
 		if (is_type_prefix(entry->str)) {
-			check(type_map_get(entry->str, &e));
+			if (type_map_get(entry->str, &e))
+				error("unknown type reference to '%s' when expanding '%s'",
+				      entry->str, type->name);
 
 			/*
 			 * It's sufficient to expand each type reference just
@@ -285,7 +317,7 @@ static void __calculate_version(struct version *version, struct list_head *list)
 				version_add(version, entry->str);
 			} else {
 				cache_mark_expanded(&expansion_cache, e);
-				__calculate_version(version, &e->expanded);
+				__calculate_version(version, e);
 			}
 		} else {
 			version_add(version, entry->str);
@@ -293,10 +325,11 @@ static void __calculate_version(struct version *version, struct list_head *list)
 	}
 }
 
-static void calculate_version(struct version *version, struct list_head *list)
+static void calculate_version(struct version *version,
+			      struct type_expansion *type)
 {
 	version_init(version);
-	__calculate_version(version, list);
+	__calculate_version(version, type);
 	cache_free(&expansion_cache);
 }
 
@@ -372,9 +405,80 @@ static void type_expand(struct die *cache, struct type_expansion *type,
 	cache_free(&expansion_cache);
 }
 
+static void type_parse(const char *name, const char *str,
+		       struct type_expansion *type)
+{
+	char *fragment;
+	size_t start = 0;
+	size_t end;
+	size_t pos;
+
+	if (!*str)
+		error("empty type string override for '%s'", name);
+
+	type_expansion_init(type);
+
+	for (pos = 0; str[pos]; ++pos) {
+		bool empty;
+		char marker = ' ';
+
+		if (!is_type_prefix(&str[pos]))
+			continue;
+
+		end = pos + 2;
+
+		/*
+		 * Find the end of the type reference. If the type name contains
+		 * spaces, it must be in single quotes.
+		 */
+		if (str[end] == '\'') {
+			marker = '\'';
+			++end;
+		}
+		while (str[end] && str[end] != marker)
+			++end;
+
+		/* Check that we have a non-empty type name */
+		if (marker == '\'') {
+			if (str[end] != marker)
+				error("incomplete %c# type reference for '%s' (string : '%s')",
+				      str[pos], name, str);
+			empty = end == pos + 3;
+			++end;
+		} else {
+			empty = end == pos + 2;
+		}
+		if (empty)
+			error("empty %c# type name for '%s' (string: '%s')",
+			      str[pos], name, str);
+
+		/* Append the part of the string before the type reference */
+		if (pos > start) {
+			fragment = xstrndup(&str[start], pos - start);
+			type_expansion_append(type, fragment, fragment);
+		}
+
+		/*
+		 * Append the type reference -- note that if the reference
+		 * is invalid, i.e. points to a non-existent type, we will
+		 * print out an error when calculating versions.
+		 */
+		fragment = xstrndup(&str[pos], end - pos);
+		type_expansion_append(type, fragment, fragment);
+
+		start = end;
+		pos = end - 1;
+	}
+
+	/* Append the rest of the type string, if there's any left */
+	if (str[start])
+		type_expansion_append(type, &str[start], NULL);
+}
+
 static void expand_type(struct die *cache, void *arg)
 {
 	struct type_expansion type;
+	const char *override;
 	char *name;
 
 	if (cache->mapped)
@@ -399,9 +503,13 @@ static void expand_type(struct die *cache, void *arg)
 		return;
 
 	debug("%s", name);
-	type_expand(cache, &type, true);
-	type_map_add(name, &type);
 
+	if (stable && kabi_get_type_string(name, &override))
+		type_parse(name, override, &type);
+	else
+		type_expand(cache, &type, true);
+
+	type_map_add(name, &type);
 	type_expansion_free(&type);
 	free(name);
 }
@@ -410,6 +518,7 @@ static void expand_symbol(struct symbol *sym, void *arg)
 {
 	struct type_expansion type;
 	struct version version;
+	const char *override;
 	struct die *cache;
 
 	/*
@@ -423,11 +532,14 @@ static void expand_symbol(struct symbol *sym, void *arg)
 	if (__die_map_get(sym->die_addr, DIE_SYMBOL, &cache))
 		return; /* We'll warn about missing CRCs later. */
 
-	type_expand(cache, &type, false);
+	if (stable && kabi_get_type_string(sym->name, &override))
+		type_parse(sym->name, override, &type);
+	else
+		type_expand(cache, &type, false);
 
 	/* If the symbol already has a version, don't calculate it again. */
 	if (sym->state != SYMBOL_PROCESSED) {
-		calculate_version(&version, &type.expanded);
+		calculate_version(&version, &type);
 		symbol_set_crc(sym, version.crc);
 		debug("%s = %lx", sym->name, version.crc);
 
-- 
2.49.0.967.g6a0df3ecc3-goog


