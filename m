Return-Path: <linux-kbuild+bounces-4780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DD9D543A
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF051F216A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF881DF964;
	Thu, 21 Nov 2024 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UYw4ZPDy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F891DE4D3
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221784; cv=none; b=u1XmhvImOc9LkMvPeGF/xW3t+j1wxERF9ywWzZNS4vOHcfxu0q0l8Mi0SQHGnNM693tW7/FjrJaGpqNSLeK2JWSQHK+RLtF+VkmpWHoK9cFmRrUIVnVniu0tVBsQy9H1y9QU2DABmYXe487a/fkm40abUFmz+dS1tq9+DqeyVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221784; c=relaxed/simple;
	bh=FVlQiHUbBFyuMGSOxTxhhsP7LYDK1cTgwW8tGYBcRKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c9Q9/C8Cp4WWm9l2V6VWXpk3d0ExZvHs5JuLtYP83uET2XfhvJgRXFrLfCltETymhhhrGhz3CkN73F0goGa1d64SG5bqbulkUxm8Dik12UjDNccV+kU53aNuafShYdSJWsIv82vBeJdqSxfVfAon61qg5xZ6lENLcN/sJggj6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UYw4ZPDy; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3859de1c11so2420898276.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221780; x=1732826580; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJaJGkeMdABjwuKeOzQhmMOjSV1XWy7sgNfEDvwgqM8=;
        b=UYw4ZPDyvD5yGO0B559ihYkvYI25swUPHLa0LX8mi8O/urNhy+LcbbWdG18SNH5uiv
         99vRdB7hw1o0jPYRUMPWSCCqOfCGUmDy2Qz1pqkYSI/fr1E1MoUxlE37vDjwWipFF+6W
         OSCrfrP0VKg+yeeJmyxnWJxBjsnnzWtXjpDXGTTxLLedj1MZir/nej98GpD3YG8jeNSy
         gSJyJw21G/k5+e7NyRpxbDoVsr+UzTE8FLn7MfDYRF9wK0QsMZt2LS4CaA53nx+Pwnby
         n8zYRSCwb6Jnsvd2eAoYSmBXByAlI2S1j6EvIwmLNZAIDOhX3oYncIdUFaY60J1ZzdZ+
         2MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221780; x=1732826580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJaJGkeMdABjwuKeOzQhmMOjSV1XWy7sgNfEDvwgqM8=;
        b=plMyjsff9YGqle5ZexVxHFUoAKwLY3bwQZjEXjI15MszLfjg00sYrHqVcMHn+rVQVO
         LEG8dBghxxMfeJIDBCaYLbj7krwvw3afLHZzVEi/sZ4LYEOf41QB9M5/RB4G64rlqXtC
         ArIFG2duYGlps63EOuzsX1nsmm7aHVrJEgoMlP+6Ozpv7nfo0LAYRTfnRM6jrq74aagm
         5jGhoJ9Wm1Qe1KcT14U+rP2EXztmRj98Qxi7qspT2bWUuMZzSox3wp+oJ1AtaTpip+2s
         ozM6pxVi+QlEQdhW6832s6sufH1Igy7+Ptr5o/hkUNlbfBg8jagniimjbX+DrzGKRnED
         s9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXBW96DOJ4nDkt5AYOaydJ0hkvkuG1k2gBZ5/MH1XCuqg3WipkhSKrrIsxpq9rqjVxyeuJXNjWZbZ4gRKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGR6UFb8jCzY896FLjPk36pjLMwVfP+ruNL5fro347ajurM4jy
	O+OWdQ5IcHnccAEcQU8WN5z5GcJxRr9otjTFueqYzYf80BGrp7/lxJzcgP3CUhEwiO7I85rMY0Q
	wIh/FZhi7rNux45O4yDsRVxJ02g==
X-Google-Smtp-Source: AGHT+IFnbYLBVuzU3ihe5ilQNw2joANYeugd/YNo64eIhN9YVipykDtcy6kQLBpHiGdARI8kCadwqtJwgl9oBn7J3Rw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:c7:b0:e28:f2a5:f1d with SMTP
 id 3f1490d57ef6-e38f8b13cd6mr153276.4.1732221780048; Thu, 21 Nov 2024
 12:43:00 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:35 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=22866; i=samitolvanen@google.com;
 h=from:subject; bh=FVlQiHUbBFyuMGSOxTxhhsP7LYDK1cTgwW8tGYBcRKg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s00S1U86PDy7rPlG8PdZEyPj77yf67RSWLKn7aBu8
 TJOx3DfjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRDeqMDNvqn732KXgSrLxP
 X/X4PlPr3o7DAtxZyjvKzj+SXKrRzM/I8G6GhH6KWalHw6otPq4PTSccOpO5LTwuOsvz6if7qZ3 MvAA=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-34-samitolvanen@google.com>
Subject: [PATCH v6 14/18] gendwarfksyms: Add support for reserved and ignored fields
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
index 04b38caa846f..2c96caf8d6e2 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,9 +3,32 @@
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
 
@@ -352,13 +375,23 @@ static void __process_list_type(struct state *state, struct die *cache,
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
@@ -485,11 +518,208 @@ static void process_variant_part_type(struct state *state, struct die *cache,
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
@@ -546,7 +776,23 @@ static void __process_structure_type(struct state *state, struct die *cache,
 
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
index 7185d8ffb18e..5fd743108b6f 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -241,6 +241,12 @@ struct expansion_state {
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
@@ -251,6 +257,9 @@ struct state {
 	/* Structure expansion */
 	struct expansion_state expand;
 	struct cache expansion_cache;
+
+	/* Reserved or ignored members */
+	struct kabi_state kabi;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.371.ga323438b13-goog


