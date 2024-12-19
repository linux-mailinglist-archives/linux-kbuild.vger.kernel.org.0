Return-Path: <linux-kbuild+bounces-5208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BD9F86A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65395165726
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2511FF7D8;
	Thu, 19 Dec 2024 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmdSrL6e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653641FECBE
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642497; cv=none; b=aX63n3yM2pPuLu6/MTWozUvIbUghX7plyzUJFij9MoI77By4FGb7C6+wF0VAaQ9gz0IdSsfR2VDqwTFgbGNxOHH92lzxzt9jnM3iTdvE3y3MFQG2DVLFO0lq5tAvxGFMQ0na8T5zgYoXKKgeYhblM8Hs9ToKw43957Usw20nCFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642497; c=relaxed/simple;
	bh=7W2aGp05kJKnJUD6bZE4MziFgiLMkwgrNufoHK2Xnt0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owP1tkgIe/Wp6TyNzEb23AVzIL15BxUj63DAQ+NrNFJVCasLR/G/HGPOh/kxIn/zJJdgmg8yhRxVWKLSgjZbSvlSmXPXg04eYtXHae9WPzgau0dJLNeZMddy/ylvS/5MP/0yR6CMcZt1nZ2V4w6v7qT3e6ouKQ5m/Pbs/yCWw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmdSrL6e; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so1136871a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642493; x=1735247293; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUuRzCa6rGp0zLolmMgSi+Fq+2YRWA9tSP3uXfn3qjQ=;
        b=RmdSrL6eLsy5LvE2UwXJPdQ2wyGx40Pf3am6HX8bk33cpB4p/rWRhDl9QWBDEffCpk
         50b0u1FOHgO9DubwHhVL/NP4PxdTC8utsrn9mNnEpiMB2yQJEb98RDTw9VLXD2vB3M6m
         KZbPsz+wd71jy61Q64CG7Z+99Iu4V/Y4c2qm4SIjSK2IHpcfDK25A9Xow4PJ8rSJcR7+
         S88zvUJODWjWCWHp3W6K7w+oc1QF74wLw0/oSaBqsepusKDkiJATWpsrrPzxS5qXiDrf
         F0efk3fQARkaUsj8jaX/exJVJqrE8mvsp3fy9jmt3pWFkpFVbOZty7URoZOK+I3zsnB8
         YVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642493; x=1735247293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUuRzCa6rGp0zLolmMgSi+Fq+2YRWA9tSP3uXfn3qjQ=;
        b=pCl2ib1l8JT/qtoWWE8z8zmkwKXh/sj+qNui9O52WaP34VbfFNbXoM1dHVkCmUknm3
         6AqyWcomWxLpLCwIBLVTos6sAusATqk452O7hNZ40+jiAWXY+sU9HYqAi4+AgqnBOIWj
         ulv9upeIKAqAmAuaiWpwesTRX/H0UwpcKArUu3X2nEU7WyC4L4gGjt+l1zOT+aWc8IvS
         6X93PLPu3NiFYiULE6SO9b4NW7lXsYEDEZDKGLF30VcLyiFg+tHo+iX9qku7XDovUvDR
         MR24L4KOfpn20K4g+EoO1v2FsLmw0kTGw2GovDrYmM8ydG/f7C1cSV1jNLgkyKC4DSni
         WYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUhS6aPOgT45oEnfpVye81KLd7O6d0HrcieqamZYiXAxs6Ve4NFrGg3i1i0VvjW3YZSCnZFR7ZTAxwhFDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66fWGde8ot5Kj/FCovk2xqBQh22xdwGMXgVOzPLrGYxTL+XfK
	8u4xYcOBOj8Sl+wyG6jdeuvtEYTJVXFKxKB9+8dakgJlGmALEY1phGzUH9CSzCFiWKqrRVzFzZE
	1Tg3lQHNgAhEzHqN5Yo/berEyrA==
X-Google-Smtp-Source: AGHT+IE2fhrtt79thMb1vL08eWfwNpNMt0TyMwXbZKH8l0+d4VQODMdXV7LsdsyMG3Bk4FCHvZOBKWKl2M1ReUHFKxY=
X-Received: from pjbsk3.prod.google.com ([2002:a17:90b:2dc3:b0:2ea:5084:5297])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d88c:b0:2ee:94d1:7a9d with SMTP id 98e67ed59e1d1-2f452eed6cemr613447a91.32.1734642492871;
 Thu, 19 Dec 2024 13:08:12 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:51 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=22891; i=samitolvanen@google.com;
 h=from:subject; bh=7W2aGp05kJKnJUD6bZE4MziFgiLMkwgrNufoHK2Xnt0=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3QqhRbKzbJLnduzYorlGb+Imtqfz3V+FLqsyeKzWo
 xE6SflrRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZhIzUGG/0H5Cr12Al/iDdbF
 MR2rKPfYPu8XS9jp5Xfm7GcpFmjhcGBk2N6RMYHbf9beiFwFG9Zv1dME5rRFrL19Li30cAaj5I1 TjAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-34-samitolvanen@google.com>
Subject: [PATCH v7 14/18] gendwarfksyms: Add support for reserved and ignored fields
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c            | 248 ++++++++++++++++++++++-
 scripts/gendwarfksyms/examples/kabi.h    |  87 ++++++++
 scripts/gendwarfksyms/examples/kabi_ex.c |  16 ++
 scripts/gendwarfksyms/examples/kabi_ex.h | 199 ++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h    |   9 +
 5 files changed, 558 insertions(+), 1 deletion(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 17f7e6b9a7ff..746a89d9e3d4 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,10 +3,33 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <assert.h>
 #include <inttypes.h>
 #include <stdarg.h>
 #include "gendwarfksyms.h"
 
+/* See get_union_kabi_status */
+#define KABI_PREFIX "__kabi_"
+#define KABI_PREFIX_LEN (sizeof(KABI_PREFIX) - 1)
+#define KABI_RESERVED_PREFIX "reserved"
+#define KABI_RESERVED_PREFIX_LEN (sizeof(KABI_RESERVED_PREFIX) - 1)
+#define KABI_RENAMED_PREFIX "renamed"
+#define KABI_RENAMED_PREFIX_LEN (sizeof(KABI_RENAMED_PREFIX) - 1)
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
 
@@ -353,13 +376,23 @@ static void __process_list_type(struct state *state, struct die *cache,
 {
 	const char *name = get_name_attr(die);
 
+	if (stable) {
+		if (is_kabi_prefix(name))
+			name = NULL;
+		state->kabi.orig_name = NULL;
+	}
+
 	process_list_comma(state, cache);
 	process(cache, type);
 	process_type_attr(state, cache, die);
+
+	if (stable && state->kabi.orig_name)
+		name = state->kabi.orig_name;
 	if (name) {
 		process(cache, " ");
 		process(cache, name);
 	}
+
 	process_accessibility_attr(cache, die);
 	process_bit_size_attr(cache, die);
 	process_data_bit_offset_attr(cache, die);
@@ -486,11 +519,208 @@ static void process_variant_part_type(struct state *state, struct die *cache,
 	process(cache, "}");
 }
 
+static int get_kabi_status(Dwarf_Die *die, const char **suffix)
+{
+	const char *name = get_name_attr(die);
+
+	if (suffix)
+		*suffix = NULL;
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
+
+		if (!strncmp(name, KABI_RENAMED_PREFIX,
+			     KABI_RENAMED_PREFIX_LEN)) {
+			if (suffix) {
+				name += KABI_RENAMED_PREFIX_LEN;
+				*suffix = name;
+			}
+			return KABI_RESERVED;
+		}
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
+	res = get_kabi_status(die, &state->kabi.orig_name);
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
+	res = get_kabi_status(die, &state->kabi.orig_name);
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
+static int get_union_kabi_status(Dwarf_Die *die, Dwarf_Die *placeholder,
+				 const char **orig_name)
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
+	memset(&state.kabi, 0, sizeof(struct kabi_state));
+
+	res = checkp(process_die_container(&state, NULL, die,
+					   check_union_member_kabi_status,
+					   match_member_type));
+
+	if (res == KABI_RESERVED) {
+		if (placeholder)
+			*placeholder = state.kabi.placeholder;
+		if (orig_name)
+			*orig_name = state.kabi.orig_name;
+	}
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
+	       checkp(get_union_kabi_status(&type, NULL, NULL)) == KABI_IGNORED;
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
@@ -547,7 +777,23 @@ static void __process_structure_type(struct state *state, struct die *cache,
 
 DEFINE_PROCESS_STRUCTURE_TYPE(class)
 DEFINE_PROCESS_STRUCTURE_TYPE(structure)
-DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static void process_union_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die)
+{
+	Dwarf_Die placeholder;
+
+	int res = checkp(get_union_kabi_status(die, &placeholder,
+					       &state->kabi.orig_name));
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
index fcd0300e5b58..97a5669b083d 100644
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
  * KABI_DECLONLY(fqn)
  *   Treat the struct/union/enum fqn as a declaration, i.e. even if
@@ -67,4 +89,69 @@
 #define KABI_ENUMERATOR_VALUE(fqn, field, value) \
 	__KABI_RULE(enumerator_value, fqn field, value)
 
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
+ * KABI_REPLACE
+ *   Replace a field with a compatible new field.
+ */
+#define KABI_REPLACE(_oldtype, _oldname, _new) \
+	__KABI_REPLACE(_oldtype __kabi_renamed##_oldname, struct { _new; })
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
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.c b/scripts/gendwarfksyms/examples/kabi_ex.c
index 799552ea6679..0b7ffd830541 100644
--- a/scripts/gendwarfksyms/examples/kabi_ex.c
+++ b/scripts/gendwarfksyms/examples/kabi_ex.c
@@ -12,3 +12,19 @@
 
 struct s e0;
 enum e e1;
+
+struct ex0a ex0a;
+struct ex0b ex0b;
+struct ex0c ex0c;
+
+struct ex1a ex1a;
+struct ex1b ex1b;
+struct ex1c ex1c;
+
+struct ex2a ex2a;
+struct ex2b ex2b;
+struct ex2c ex2c;
+
+struct ex3a ex3a;
+struct ex3b ex3b;
+struct ex3c ex3c;
diff --git a/scripts/gendwarfksyms/examples/kabi_ex.h b/scripts/gendwarfksyms/examples/kabi_ex.h
index fca1e07c78e2..1736e0f65208 100644
--- a/scripts/gendwarfksyms/examples/kabi_ex.h
+++ b/scripts/gendwarfksyms/examples/kabi_ex.h
@@ -59,6 +59,205 @@ KABI_ENUMERATOR_VALUE(e, D, 123456789);
  * STABLE-NEXT:   enumerator A = 0 ,
  * STABLE-NEXT:   enumerator D = 123456789
  * STABLE-NEXT: } byte_size(4)
+*/
+
+/*
+ * Example: Reserved fields
+ */
+struct ex0a {
+	int a;
+	KABI_RESERVE(0);
+	KABI_RESERVE(1);
+};
+
+/*
+ * STABLE:      variable structure_type ex0a {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ * STABLE-NEXT: } byte_size(24)
+ */
+
+struct ex0b {
+	int a;
+	KABI_RESERVE(0);
+	KABI_USE2(1, int b, int c);
+};
+
+/*
+ * STABLE:      variable structure_type ex0b {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ * STABLE-NEXT: } byte_size(24)
+ */
+
+struct ex0c {
+	int a;
+	KABI_USE(0, void *p);
+	KABI_USE2(1, int b, int c);
+};
+
+/*
+ * STABLE:      variable structure_type ex0c {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(8) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) data_member_location(16)
+ * STABLE-NEXT: } byte_size(24)
+ */
+
+/*
+ * Example: A reserved array
+ */
+
+struct ex1a {
+	unsigned int a;
+	KABI_RESERVE_ARRAY(0, 64);
+};
+
+/*
+ * STABLE:      variable structure_type ex1a {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ */
+
+struct ex1b {
+	unsigned int a;
+	KABI_USE_ARRAY(
+		0, 64, struct {
+			void *p;
+			KABI_RESERVE_ARRAY(1, 56);
+		});
+};
+
+/*
+ * STABLE:      variable structure_type ex1b {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ */
+
+struct ex1c {
+	unsigned int a;
+	KABI_USE_ARRAY(0, 64, void *p[8]);
+};
+
+/*
+ * STABLE:      variable structure_type ex1c {
+ * STABLE-NEXT:   member base_type unsigned int byte_size(4) encoding(7) a data_member_location(0) ,
+ * STABLE-NEXT:   member array_type[64] {
+ * STABLE-NEXT:     base_type unsigned char byte_size(1) encoding(8)
+ * STABLE-NEXT:   } data_member_location(8)
+ * STABLE-NEXT: } byte_size(72)
+ */
+
+/*
+ * Example: An ignored field added to an alignment hole
+ */
+
+struct ex2a {
+	int a;
+	unsigned long b;
+	int c;
+	unsigned long d;
+};
+
+/*
+ * STABLE:      variable structure_type ex2a {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ */
+
+struct ex2b {
+	int a;
+	KABI_IGNORE(0, unsigned int n);
+	unsigned long b;
+	int c;
+	unsigned long d;
+};
+
+_Static_assert(sizeof(struct ex2a) == sizeof(struct ex2b), "ex2a size doesn't match ex2b");
+
+/*
+ * STABLE:      variable structure_type ex2b {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ */
+
+struct ex2c {
+	int a;
+	KABI_IGNORE(0, unsigned int n);
+	unsigned long b;
+	int c;
+	KABI_IGNORE(1, unsigned int m);
+	unsigned long d;
+};
+
+_Static_assert(sizeof(struct ex2a) == sizeof(struct ex2c), "ex2a size doesn't match ex2c");
+
+/*
+ * STABLE:      variable structure_type ex2c {
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) a data_member_location(0) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) b data_member_location(8)
+ * STABLE-NEXT:   member base_type int byte_size(4) encoding(5) c data_member_location(16) ,
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) d data_member_location(24)
+ * STABLE-NEXT: } byte_size(32)
+ */
+
+
+/*
+ * Example: A replaced field
+ */
+
+struct ex3a {
+	unsigned long a;
+	unsigned long unused;
+};
+
+/*
+ * STABLE:      variable structure_type ex3a {
+ * STABLE-NEXT:   member base_type [[ULONG:long unsigned int|unsigned long]] byte_size(8) encoding(7) a data_member_location(0)
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) unused data_member_location(8)
+ * STABLE-NEXT: } byte_size(16)
+ */
+
+struct ex3b {
+	unsigned long a;
+	KABI_REPLACE(unsigned long, unused, unsigned long renamed);
+};
+
+_Static_assert(sizeof(struct ex3a) == sizeof(struct ex3b), "ex3a size doesn't match ex3b");
+
+/*
+ * STABLE:      variable structure_type ex3b {
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) a data_member_location(0)
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) unused data_member_location(8)
+ * STABLE-NEXT: } byte_size(16)
+ */
+
+struct ex3c {
+	unsigned long a;
+	KABI_REPLACE(unsigned long, unused, long replaced);
+};
+
+_Static_assert(sizeof(struct ex3a) == sizeof(struct ex3c), "ex3a size doesn't match ex3c");
+
+/*
+ * STABLE:      variable structure_type ex3c {
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) a data_member_location(0)
+ * STABLE-NEXT:   member base_type [[ULONG]] byte_size(8) encoding(7) unused data_member_location(8)
+ * STABLE-NEXT: } byte_size(16)
  */
 
 #endif /* __KABI_EX_H__ */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index c0207ca10e19..fe49730fe623 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -236,6 +236,12 @@ struct expansion_state {
 	const char *current_fqn;
 };
 
+struct kabi_state {
+	int members;
+	Dwarf_Die placeholder;
+	const char *orig_name;
+};
+
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
@@ -246,6 +252,9 @@ struct state {
 	/* Structure expansion */
 	struct expansion_state expand;
 	struct cache expansion_cache;
+
+	/* Reserved or ignored members */
+	struct kabi_state kabi;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.1.613.gc27f4b7a9f-goog


