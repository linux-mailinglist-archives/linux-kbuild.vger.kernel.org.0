Return-Path: <linux-kbuild+bounces-4422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C69B6A74
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 305D9B20D0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59F521B44D;
	Wed, 30 Oct 2024 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eyBs5z9D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C321747B
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307715; cv=none; b=mibs/501S/uY8YyMtx19ZCsc+SQqqkaRhRG4JTk93kjPNmzANe7HPBJaDTQTrsokbAINF/i6QZkYco4Zq9I+G85MEp3061xduiI6sAdCG9SWXGpKL7aOjaJd0Vkj0VJOW8Zf8ZuPtJLs5HuoVa2mfZIMjXLW5fz5khrwDANRj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307715; c=relaxed/simple;
	bh=KamtrXm/1P3b//ApGmdVsmPueDb78udoQ8kedUO9TH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bhTrmnAlmZxylcEwMVkncwF8KX644yeb3pmlocBSAo9A7TwZFDcofcWs8uG2MaduFV0svizlEgMOGdB2NOzKQ4TyBRlAcTwqjwOvYNMmBGzl4k4gCBN7tmTMEJqSOBJRhRqBcuk8htLR7Xgbibuurhr7GaHA0oorWQ64FhOajKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eyBs5z9D; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71e6241c002so50188b3a.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307708; x=1730912508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7S4Uk+KDhNf2Tmq30KUuI3SmrCbtRmg9wCJd7dpZtcA=;
        b=eyBs5z9DSnmVsnCYLgeFNyYDKg8b+Kl5yeFDuaNze3QSWK5qs+WlEacEkSXAlt0SGo
         8+zHgPZgsgLc6n1pVWfY/T/AI+clQnGJ6m5vFZ0R4T2jpTljnHki28G69MhZRHquDzxH
         xIJd4UaBrdVdkV79caNFrfdnMrQI44+CKYIejkYw0p81QVnqDPBvixVSCToDo8+LGG6E
         webHKTujzwm1FNGl4aHQLYkStvuHruS84hapVM216hxWR/Q42FrOYMvNc6Lsl4ngUq0l
         l7AhpTXwGtoBZViCA+2z06brxi2jwT4YfFW+1jGKc88lz4gsB+j1qwYl6VnzGMrrTTp7
         p3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307708; x=1730912508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7S4Uk+KDhNf2Tmq30KUuI3SmrCbtRmg9wCJd7dpZtcA=;
        b=txtGpeGTCBqeK+kh/SMNcFaM9yUtZ7k8IuaUIGvvct2RaaMQmSjZ1WElhmxx5JDBAQ
         V6+OoTl2IkG4PkeZk9pqE7xZUK3REmNORtHUl+1jMehywAl/MDTF6QncouyA/RULalc8
         NHwEl1iT3pU8V5r7cxjtjRR03sj0zzQWcxUR95A+KvWzWh7olr/qO0U5ePOp87VX+rFK
         j6LK7kJ8s2AbYh1cFz50J5uTwtykJ55VbuDFDdY4HHlBQpqbnll9mUcxYfW8cB9/AZcN
         s2jTMq4UAdlvooiBQX+sk8BYT75mLp2TqX3gbkd1Inl8juvM5JEWa471MhpG3xpoRSMG
         UDjA==
X-Forwarded-Encrypted: i=1; AJvYcCUPzwb3YJsMr7aom01DM01NnABVyaAgLq2fdwALgF4HOSOZLTiXrz4CQLCOQ7lf9YYDcfwFc+ojwh8osDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmeGbNY94HXoR1mKv4KAvwUx5jsGxv/jqp4TyVXjTunT0LM9Y
	krUyXeJ+LU5tw/qbkJsfXAfq8aGoWEUjzl0oTdz8YNUebMvdg4HAexp72a66hY5rsDtv4gMXM19
	eBcXw4zr4ZbRG7Nw79nwFdqxYxg==
X-Google-Smtp-Source: AGHT+IEAeBWrZWANrMlbmh5Vgsh/DLX20jU4U1sFcVJl0szzynh823/tjFDbEQ/I04DyIIV6dTPHwmRddomY2iMkiyE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:aa7:91da:0:b0:71e:6b3b:9f2d with SMTP
 id d2e1a72fcca58-72096b5931amr20594b3a.1.1730307708447; Wed, 30 Oct 2024
 10:01:48 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:22 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=23693; i=samitolvanen@google.com;
 h=from:subject; bh=KamtrXm/1P3b//ApGmdVsmPueDb78udoQ8kedUO9TH0=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaVFs91vXrwpm+DzpHafmr62S1o7PXr3aYqFcEDnDN
 6bPV4C3o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEzkZBwjw+N5uz5f7jl6Q3L+
 +mnrT93/Kip9ufpT7Q3JNUZ8rzPllSUZ/vvvt1d+wNfxX/px5e8971/KzztUzH5un8c+zcxil7N 9abwA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-36-samitolvanen@google.com>
Subject: [PATCH v5 15/19] gendwarfksyms: Add support for reserved and ignored fields
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Distributions that want to maintain a stable kABI need the ability
to make ABI compatible changes to kernel data structures without
affecting symbol versions, either because of LTS updates or backports.

With genksyms, developers would typically hide these changes from
version calculation with #ifndef __GENKSYMS__, which would result
in the symbol version not changing even though the actual type has
changed.  When we process precompiled object files, this isn't an
option.

Change union processing to recognize field name prefixes that allow
the user to ignore the union completely during symbol versioning with
a __kabi_ignored prefix in a field name, or to replace the type of a
placeholder field using a __kabi_reserved field name prefix.

For example, assume we want to add a new field to an existing
alignment hole in a data structure, and ignore the new field when
calculating symbol versions:

  struct struct1 {
    int a;
    /* a 4-byte alignment hole */
    unsigned long b;
  };

To add `int n` to the alignment hole, we can add a union that includes
a __kabi_ignored field that causes gendwarfksyms to ignore the entire
union:

  struct struct1 {
    int a;
    union {
      char __kabi_ignored_0;
      int n;
    };
    unsigned long b;
  };

With --stable, both structs produce the same symbol version.

Alternatively, when a distribution expects future modification to a
data structure, they can explicitly add reserved fields:

  struct struct2 {
    long a;
    long __kabi_reserved_0; /* reserved for future use */
  };

To take the field into use, we can again replace it with a union, with
one of the fields keeping the __kabi_reserved name prefix to indicate
the original type:

  struct struct2 {
    long a;
    union {
      long __kabi_reserved_0;
      struct {
          int b;
          int v;
      };
    };

Here gendwarfksyms --stable replaces the union with the type of the
placeholder field when calculating versions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c             | 221 +++++++++++++++++++++-
 scripts/gendwarfksyms/examples/kabi.h     |  80 ++++++++
 scripts/gendwarfksyms/examples/kabi_ex0.c |  86 +++++++++
 scripts/gendwarfksyms/examples/kabi_ex1.c |  89 +++++++++
 scripts/gendwarfksyms/examples/kabi_ex2.c |  98 ++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h     |   9 +
 6 files changed, 582 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex0.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex1.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex2.c

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index d634dd79b736..ba0f502ad20c 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,9 +3,30 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <assert.h>
 #include <stdarg.h>
 #include "gendwarfksyms.h"
 
+/* See get_union_kabi_status */
+#define KABI_PREFIX "__kabi_"
+#define KABI_PREFIX_LEN (sizeof(KABI_PREFIX) - 1)
+#define KABI_RESERVED_PREFIX "reserved"
+#define KABI_RESERVED_PREFIX_LEN (sizeof(KABI_RESERVED_PREFIX) - 1)
+#define KABI_IGNORED_PREFIX "ignored"
+#define KABI_IGNORED_PREFIX_LEN (sizeof(KABI_IGNORED_PREFIX) - 1)
+
+static inline bool is_kabi_prefix(const char *name)
+{
+	return name && !strncmp(name, KABI_PREFIX, KABI_PREFIX_LEN);
+}
+
+enum kabi_status {
+	/* >0 to stop DIE processing */
+	KABI_NORMAL = 1,
+	KABI_RESERVED,
+	KABI_IGNORED,
+};
+
 static bool do_linebreak;
 static int indentation_level;
 
@@ -308,6 +329,9 @@ static void __process_list_type(struct state *state, struct die *cache,
 {
 	const char *name = get_name_attr(die);
 
+	if (stable && is_kabi_prefix(name))
+		name = NULL;
+
 	process_list_comma(state, cache);
 	process(cache, type);
 	process_type_attr(state, cache, die);
@@ -441,11 +465,191 @@ static void process_variant_part_type(struct state *state, struct die *cache,
 	process(cache, "}");
 }
 
+static int get_kabi_status(Dwarf_Die *die)
+{
+	const char *name = get_name_attr(die);
+
+	if (is_kabi_prefix(name)) {
+		name += KABI_PREFIX_LEN;
+
+		if (!strncmp(name, KABI_RESERVED_PREFIX,
+			     KABI_RESERVED_PREFIX_LEN))
+			return KABI_RESERVED;
+		if (!strncmp(name, KABI_IGNORED_PREFIX,
+			     KABI_IGNORED_PREFIX_LEN))
+			return KABI_IGNORED;
+	}
+
+	return KABI_NORMAL;
+}
+
+static int check_struct_member_kabi_status(struct state *state,
+					   struct die *__unused, Dwarf_Die *die)
+{
+	int res;
+
+	assert(dwarf_tag(die) == DW_TAG_member_type);
+
+	/*
+	 * If the union member is a struct, expect the __kabi field to
+	 * be the first member of the structure, i.e..:
+	 *
+	 * union {
+	 * 	type new_member;
+	 * 	struct {
+	 * 		type __kabi_field;
+	 * 	}
+	 * };
+	 */
+	res = get_kabi_status(die);
+
+	if (res == KABI_RESERVED &&
+	    !get_ref_die_attr(die, DW_AT_type, &state->kabi.placeholder))
+		error("structure member missing a type?");
+
+	return res;
+}
+
+static int check_union_member_kabi_status(struct state *state,
+					  struct die *__unused, Dwarf_Die *die)
+{
+	Dwarf_Die type;
+	int res;
+
+	assert(dwarf_tag(die) == DW_TAG_member_type);
+
+	if (!get_ref_die_attr(die, DW_AT_type, &type))
+		error("union member missing a type?");
+
+	/*
+	 * We expect a union with two members. Check if either of them
+	 * has a __kabi name prefix, i.e.:
+	 *
+	 * union {
+	 * 	...
+	 * 	type memberN; // <- type, N = {0,1}
+	 *	...
+	 * };
+	 *
+	 * The member can also be a structure type, in which case we'll
+	 * check the first structure member.
+	 *
+	 * In any case, stop processing after we've seen two members.
+	 */
+	res = get_kabi_status(die);
+
+	if (res == KABI_RESERVED)
+		state->kabi.placeholder = type;
+	if (res != KABI_NORMAL)
+		return res;
+
+	if (dwarf_tag(&type) == DW_TAG_structure_type)
+		res = checkp(process_die_container(
+			state, NULL, &type, check_struct_member_kabi_status,
+			match_member_type));
+
+	if (res <= KABI_NORMAL && ++state->kabi.members < 2)
+		return 0; /* Continue */
+
+	return res;
+}
+
+static int get_union_kabi_status(Dwarf_Die *die, Dwarf_Die *placeholder)
+{
+	struct state state;
+	int res;
+
+	if (!stable)
+		return KABI_NORMAL;
+
+	/*
+	 * To maintain a stable kABI, distributions may choose to reserve
+	 * space in structs for later use by adding placeholder members,
+	 * for example:
+	 *
+	 * struct s {
+	 * 	u32 a;
+	 *	// an 8-byte placeholder for future use
+	 * 	u64 __kabi_reserved_0;
+	 * };
+	 *
+	 * When the reserved member is taken into use, the type change
+	 * would normally cause the symbol version to change as well, but
+	 * if the replacement uses the following convention, gendwarfksyms
+	 * continues to use the placeholder type for versioning instead,
+	 * thus maintaining the same symbol version:
+	 *
+	 * struct s {
+	 * 	u32 a;
+	 *	union {
+	 * 		// placeholder replaced with a new member `b`
+	 * 		struct t b;
+	 * 		struct {
+	 * 			// the placeholder type that is still
+	 *			// used for versioning
+	 * 			u64 __kabi_reserved_0;
+	 * 		};
+	 * 	};
+	 * };
+	 *
+	 * I.e., as long as the replaced member is in a union, and the
+	 * placeholder has a __kabi_reserved name prefix, we'll continue
+	 * to use the placeholder type (here u64) for version calculation
+	 * instead of the union type.
+	 *
+	 * It's also possible to ignore new members from versioning if
+	 * they've been added to alignment holes, for example, by
+	 * including them in a union with another member that uses the
+	 * __kabi_ignored name prefix:
+	 *
+	 * struct s {
+	 * 	u32 a;
+	 *	// an alignment hole is used to add `n`
+	 * 	union {
+	 * 		u32 n;
+	 *		// hide the entire union member from versioning
+	 * 		u8 __kabi_ignored_0;
+	 * 	};
+	 * 	u64 b;
+	 * };
+	 *
+	 * Note that the user of this feature is responsible for ensuring
+	 * that the structure actually remains ABI compatible.
+	 */
+	state.kabi.members = 0;
+
+	res = checkp(process_die_container(&state, NULL, die,
+					   check_union_member_kabi_status,
+					   match_member_type));
+
+	if (placeholder && res == KABI_RESERVED)
+		*placeholder = state.kabi.placeholder;
+
+	return res;
+}
+
+static bool is_kabi_ignored(Dwarf_Die *die)
+{
+	Dwarf_Die type;
+
+	if (!stable)
+		return false;
+
+	if (!get_ref_die_attr(die, DW_AT_type, &type))
+		error("member missing a type?");
+
+	return dwarf_tag(&type) == DW_TAG_union_type &&
+	       checkp(get_union_kabi_status(&type, NULL)) == KABI_IGNORED;
+}
+
 static int ___process_structure_type(struct state *state, struct die *cache,
 				     Dwarf_Die *die)
 {
 	switch (dwarf_tag(die)) {
 	case DW_TAG_member:
+		if (is_kabi_ignored(die))
+			return 0;
+		return check(process_type(state, cache, die));
 	case DW_TAG_variant_part:
 		return check(process_type(state, cache, die));
 	case DW_TAG_class_type:
@@ -502,7 +706,22 @@ static void __process_structure_type(struct state *state, struct die *cache,
 
 DEFINE_PROCESS_STRUCTURE_TYPE(class)
 DEFINE_PROCESS_STRUCTURE_TYPE(structure)
-DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static void process_union_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die)
+{
+	Dwarf_Die placeholder;
+
+	int res = checkp(get_union_kabi_status(die, &placeholder));
+
+	if (res == KABI_RESERVED)
+		check(process_type(state, cache, &placeholder));
+	if (res > KABI_NORMAL)
+		return;
+
+	__process_structure_type(state, cache, die, "union_type",
+				 ___process_structure_type, match_all);
+}
 
 static void process_enumerator_type(struct state *state, struct die *cache,
 				    Dwarf_Die *die)
diff --git a/scripts/gendwarfksyms/examples/kabi.h b/scripts/gendwarfksyms/examples/kabi.h
index 95799594c934..796ef9ae1cd6 100644
--- a/scripts/gendwarfksyms/examples/kabi.h
+++ b/scripts/gendwarfksyms/examples/kabi.h
@@ -43,6 +43,28 @@
 		__section(".discard.gendwarfksyms.kabi_rules") =     \
 			"1\0" #hint "\0" #target "\0" #value
 
+#define __KABI_NORMAL_SIZE_ALIGN(_orig, _new)                                             \
+	union {                                                                           \
+		_Static_assert(                                                           \
+			sizeof(struct { _new; }) <= sizeof(struct { _orig; }),            \
+			__FILE__ ":" __stringify(__LINE__) ": " __stringify(              \
+				_new) " is larger than " __stringify(_orig));             \
+		_Static_assert(                                                           \
+			__alignof__(struct { _new; }) <=                                  \
+				__alignof__(struct { _orig; }),                           \
+			__FILE__ ":" __stringify(__LINE__) ": " __stringify(              \
+				_orig) " is not aligned the same as " __stringify(_new)); \
+	}
+
+#define __KABI_REPLACE(_orig, _new)                    \
+	union {                                        \
+		_new;                                  \
+		struct {                               \
+			_orig;                         \
+		};                                     \
+		__KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
+	}
+
 /*
  * KABI_STRUCT_DECLONLY(fqn)
  *   Treat the struct fqn as a declaration, i.e. even if a definition
@@ -58,4 +80,62 @@
 #define KABI_ENUMERATOR_IGNORE(fqn, field) \
 	__KABI_RULE(enumerator_ignore, fqn, field)
 
+/*
+ * KABI_RESERVE
+ *   Reserve some "padding" in a structure for use by LTS backports.
+ *   This is normally placed at the end of a structure.
+ *   number: the "number" of the padding variable in the structure.  Start with
+ *   1 and go up.
+ */
+#define KABI_RESERVE(n) unsigned long __kabi_reserved##n
+
+/*
+ * KABI_RESERVE_ARRAY
+ *   Same as _BACKPORT_RESERVE but allocates an array with the specified
+ *   size in bytes.
+ */
+#define KABI_RESERVE_ARRAY(n, s) \
+	unsigned char __aligned(8) __kabi_reserved##n[s]
+
+/*
+ * KABI_IGNORE
+ *   Add a new field that's ignored in versioning.
+ */
+#define KABI_IGNORE(n, _new)                     \
+	union {                                  \
+		_new;                            \
+		unsigned char __kabi_ignored##n; \
+	}
+
+/*
+ * KABI_USE(number, _new)
+ *   Use a previous padding entry that was defined with KABI_RESERVE
+ *   number: the previous "number" of the padding variable
+ *   _new: the variable to use now instead of the padding variable
+ */
+#define KABI_USE(number, _new) __KABI_REPLACE(KABI_RESERVE(number), _new)
+
+/*
+ * KABI_USE2(number, _new1, _new2)
+ *   Use a previous padding entry that was defined with KABI_RESERVE for
+ *   two new variables that fit into 64 bits.  This is good for when you do not
+ *   want to "burn" a 64bit padding variable for a smaller variable size if not
+ *   needed.
+ */
+#define KABI_USE2(number, _new1, _new2)        \
+	__KABI_REPLACE(                        \
+		KABI_RESERVE(number), struct { \
+			_new1;                 \
+			_new2;                 \
+		})
+/*
+ * KABI_USE_ARRAY(number, bytes, _new)
+ *   Use a previous padding entry that was defined with KABI_RESERVE_ARRAY
+ *   number: the previous "number" of the padding variable
+ *   bytes: the size in bytes reserved for the array
+ *   _new: the variable to use now instead of the padding variable
+ */
+#define KABI_USE_ARRAY(number, bytes, _new) \
+	__KABI_REPLACE(KABI_RESERVE_ARRAY(number, bytes), _new)
+
 #endif /* __KABI_H__ */
diff --git a/scripts/gendwarfksyms/examples/kabi_ex0.c b/scripts/gendwarfksyms/examples/kabi_ex0.c
new file mode 100644
index 000000000000..934324cba837
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_ex0.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kabi_ex0.c
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * Reserved and ignored data structure field examples with --stable.
+ */
+
+/*
+ * The comments below each example contain the expected gendwarfksyms
+ * output, which can be verified using LLVM's FileCheck tool:
+ *
+ * https://llvm.org/docs/CommandGuide/FileCheck.html
+ *
+ * $ gcc -g -c examples/kabi_ex0.c examples/kabi_ex0.o
+ *
+ * Verify --stable output:
+ *
+ * $ echo -e "ex0a\nex0b\nex0c" | \
+ * 	./gendwarfksyms --stable --dump-dies \
+ * 		examples/kabi_ex0.o 2>&1 >/dev/null | \
+ * 	FileCheck examples/kabi_ex0.c --check-prefix=STABLE
+ *
+ * Verify that symbol versions match with --stable:
+ *
+ * $ echo -e "ex0a\nex0b\nex0c" | \
+ * 	./gendwarfksyms --stable examples/kabi_ex0.o | \
+ * 	sort | \
+ * 	FileCheck examples/kabi_ex0.c --check-prefix=VERSION
+ */
+
+#include "kabi.h"
+
+/*
+ * Example 0: Reserved fields.
+ */
+
+struct {
+	int a;
+	KABI_RESERVE(0);
+	KABI_RESERVE(1);
+} ex0a;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ * STABLE-NEXT: } byte_size(24)
+ *
+ * VERSION-DAG: #SYMVER ex0a 0x[[#%.08x,EX0:]]
+ */
+
+struct {
+	int a;
+	KABI_RESERVE(0);
+	KABI_USE2(1, int b, int c);
+} ex0b;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ *
+ * STABLE-NEXT: } byte_size(24)
+ *
+ * VERSION-DAG: #SYMVER ex0b 0x[[#%.08x,EX0]]
+ */
+
+struct {
+	int a;
+	KABI_USE(0, void *p);
+	KABI_USE2(1, int b, int c);
+} ex0c;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ * STABLE-NEXT: } byte_size(24)
+ *
+ * VERSION-DAG: #SYMVER ex0c 0x[[#%.08x,EX0]]
+ */
diff --git a/scripts/gendwarfksyms/examples/kabi_ex1.c b/scripts/gendwarfksyms/examples/kabi_ex1.c
new file mode 100644
index 000000000000..7bc34bc7dec8
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_ex1.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kabi_ex1.c
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * Reserved and ignored data structure field examples with --stable.
+ */
+
+/*
+ * The comments below each example contain the expected gendwarfksyms
+ * output, which can be verified using LLVM's FileCheck tool:
+ *
+ * https://llvm.org/docs/CommandGuide/FileCheck.html
+ *
+ * $ gcc -g -c examples/kabi_ex1.c examples/kabi_ex1.o
+ *
+ * Verify --stable output:
+ *
+ * $ echo -e "ex1a\nex1b\nex1c" | \
+ * 	./gendwarfksyms --stable --dump-dies \
+ * 		examples/kabi_ex1.o 2>&1 >/dev/null | \
+ * 	FileCheck examples/kabi_ex1.c --check-prefix=STABLE
+ *
+ * Verify that symbol versions match with --stable:
+ *
+ * $ echo -e "ex1a\nex1b\nex1c" | \
+ * 	./gendwarfksyms --stable examples/kabi_ex1.o | \
+ * 	sort | \
+ * 	FileCheck examples/kabi_ex1.c --check-prefix=VERSION
+ */
+
+#include "kabi.h"
+
+/*
+ * Example 1: A reserved array.
+ */
+
+struct {
+	unsigned int a;
+	KABI_RESERVE_ARRAY(0, 64);
+} ex1a;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ *
+ * VERSION-DAG: #SYMVER ex1a 0x[[#%.08x,EX1:]]
+ */
+
+struct {
+	unsigned int a;
+	KABI_USE_ARRAY(
+		0, 64, struct {
+			void *p;
+			KABI_RESERVE_ARRAY(1, 56);
+		});
+} ex1b;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ *
+ * VERSION-DAG: #SYMVER ex1b 0x[[#%.08x,EX1]]
+ */
+
+struct {
+	unsigned int a;
+	KABI_USE_ARRAY(0, 64, void *p[8]);
+} ex1c;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ *
+ * VERSION-DAG: #SYMVER ex1c 0x[[#%.08x,EX1]]
+ */
diff --git a/scripts/gendwarfksyms/examples/kabi_ex2.c b/scripts/gendwarfksyms/examples/kabi_ex2.c
new file mode 100644
index 000000000000..947ea5675b4f
--- /dev/null
+++ b/scripts/gendwarfksyms/examples/kabi_ex2.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kabi_ex2.c
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * Reserved and ignored data structure field examples with --stable.
+ */
+
+/*
+ * The comments below each example contain the expected gendwarfksyms
+ * output, which can be verified using LLVM's FileCheck tool:
+ *
+ * https://llvm.org/docs/CommandGuide/FileCheck.html
+ *
+ * $ gcc -g -c examples/kabi_ex2.c examples/kabi_ex2.o
+ *
+ * Verify --stable output:
+ *
+ * $ echo -e "ex2a\nex2b\nex2c" | \
+ * 	./gendwarfksyms --stable --dump-dies \
+ * 		examples/kabi_ex2.o 2>&1 >/dev/null | \
+ * 	FileCheck examples/kabi_ex2.c --check-prefix=STABLE
+ *
+ * Verify that symbol versions match with --stable:
+ *
+ * $ echo -e "ex2a\nex2b\nex2c" | \
+ * 	./gendwarfksyms --stable examples/kabi_ex2.o | \
+ * 	sort | \
+ * 	FileCheck examples/kabi_ex2.c --check-prefix=VERSION
+ */
+
+#include "kabi.h"
+
+/*
+ * Example 2: An ignored field added to an alignment hole.
+ */
+
+struct {
+	int a;
+	unsigned long b;
+	int c;
+	unsigned long d;
+} ex2a;
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ *
+ * VERSION-DAG: #SYMVER ex2a 0x[[#%.08x,EX2:]]
+ */
+
+struct {
+	int a;
+	KABI_IGNORE(0, unsigned int n);
+	unsigned long b;
+	int c;
+	unsigned long d;
+} ex2b;
+
+_Static_assert(sizeof(ex2a) == sizeof(ex2b), "ex2a size doesn't match ex2b");
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ *
+ * VERSION-DAG: #SYMVER ex2b 0x[[#%.08x,EX2]]
+ */
+
+struct {
+	int a;
+	KABI_IGNORE(0, unsigned int n);
+	unsigned long b;
+	int c;
+	KABI_IGNORE(1, unsigned int m);
+	unsigned long d;
+} ex2c;
+
+_Static_assert(sizeof(ex2a) == sizeof(ex2c), "ex2a size doesn't match ex2c");
+
+/*
+ * STABLE:      variable structure_type {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ *
+ * VERSION-DAG: #SYMVER ex2c 0x[[#%.08x,EX2]]
+ */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index d8aa3210b0fe..962c36326ccc 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -223,6 +223,7 @@ void cache_clear_expanded(struct expansion_cache *ec);
 /*
  * dwarf.c
  */
+
 struct expansion_state {
 	bool expand;
 	unsigned int ptr_depth;
@@ -230,6 +231,11 @@ struct expansion_state {
 	const char *current_fqn;
 };
 
+struct kabi_state {
+	int members;
+	Dwarf_Die placeholder;
+};
+
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
@@ -240,6 +246,9 @@ struct state {
 	/* Structure expansion */
 	struct expansion_state expand;
 	struct expansion_cache expansion_cache;
+
+	/* Reserved or ignored members */
+	struct kabi_state kabi;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.163.g1226f6d8fa-goog


