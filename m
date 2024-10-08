Return-Path: <linux-kbuild+bounces-3969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E19956F2
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9921C24729
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A7621A6E6;
	Tue,  8 Oct 2024 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lL3kOrhC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420372185A1
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412747; cv=none; b=gNB/ayfdD207J0JneiqSdy1z0KOkG+NQwJ5s4Oqu6YhOllqLVPSIE7jDDgoByXgUzR9tEwKUMTTVe1e6wZf8Ob18yYCLYU1tvkY1k/WcoN+h7bm9kPpJ6mYVNXUPBe1l4O6bwlR7s2jnmUVo/wS3w1WwAFpta6H5qjopotv/V8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412747; c=relaxed/simple;
	bh=7iEYxuvKURfMToy43kzDsHMlqvEBi9vmALynl4jTXAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvKMzbqpmsumhTD1lsmgmiag8rvnfZzLI6zh3S68C4YdQUp1kVUg476CskKZ+IY/p7gwbAFjkPb306A3j2BsRUwI6w9vSQ9AyFb4Vr6/RbeWgAbNol9cUvcWf9BylLQAJA59w/SuQzy2urMJKYp2p1CuaX8Lxw6o+h09/dSZ9Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lL3kOrhC; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-778702b9f8fso72517a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412743; x=1729017543; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+iE7he/HA4afHI612c8+0S81xp1mlY4zazLunRi9hUU=;
        b=lL3kOrhCw5EeUZi421L+9ZuilG4tEz7A0aKRq0axFbMDJQu/uMUuBKcnoeKCHdiTk9
         V2I6pCzeTmyfpVC9KwFqLt4nGU4Um5/+zefhJSlmNrKshSIDkMmfxw3BBidFBRqGP1Jx
         OkZgjJmcCUZrPACSW6SLFPHVQU86PAV5PFSXVfIuAW0uFblszzQ547uJoRE9waZ6qq69
         qGkiTRktaI5eoRA6RUEIyDoxZYHAWh2m2/0GTzzEMdCubzDXPzTHIUCZ/pvgX6tiOON7
         W577MVgCvl7U7rc4H9UuNClq9ZmBBYopoXzauAoxGNA5Wu1NRNK6EF5JD3x6kLIOWgau
         pB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412743; x=1729017543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iE7he/HA4afHI612c8+0S81xp1mlY4zazLunRi9hUU=;
        b=SaCDRLSlL7oVHESC1nr58dBRKHuGb5ujZNf6i98giI5YUvES4rpioJ/nD++PNnYWCc
         lQhEwW1yeogBlERgeOVs3r3Wl2CMh/Yq96wT+ARogHyNxgaR2ZXH6UkR1dqMk/n0vEyj
         CZJq7LNo23VvszF0Rn0GRDZUbxYFZ0iV3uRgNr1jZ41/2vi0YF0hV9bDmQzfFZxr5QuS
         zXzd5plMUB4wHOmPBfI5Hln/ocIBVa1L8X4RVGzC6aXB52yCkzru183qM5N3h6AxigMD
         iTm0LvF/OHSJySSYMHGknI2BB1/aY4zx11bm12OIvB1mfPjjAkPY4lLSlnmI5hLDCvFe
         0SRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+5/Xfg3X0Vy2C5LYPHMwQx0GP8aTzAhiJGF0bPkiHNnEwSMHeVlRGOv/e5Ep6HKkv4EptR1RqZ48SHMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZ2342EidIC93jc2FHRSdsPOh9yHkeEPn1DC/nK241mJycy2e
	tSYNmAW7niLXTOKvBiT6PLvXDbb4dlik0fFrrBEo8DqZuja3PZXD2YIvUexbnIM+eZz6QmZxEJu
	u6LpHGNPMQ0mqhodthQv71x7puA==
X-Google-Smtp-Source: AGHT+IHwGeXoJD1mx9Vh0FV73kalHfWeTum5WmVbipykukNbrjgsnIwkT3YHMOQ9wV9o6FLYvp4WNl8Zvn3W1VZOieQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:3e89:0:b0:7db:54a0:cf3b with SMTP
 id 41be03b00d2f7-7ea1f6aaafcmr11321a12.0.1728412743392; Tue, 08 Oct 2024
 11:39:03 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:39 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=23511; i=samitolvanen@google.com;
 h=from:subject; bh=7iEYxuvKURfMToy43kzDsHMlqvEBi9vmALynl4jTXAQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNeps1a0/zk/e8Hdp2eFNfEtnKr6rtv37Itdb5y670
 atXLfM/dpSyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJqG1g+J/vqjKlgOXC/p8X
 Gs9y7Tq7blNSh7rtIe2d53lehq1fHfyQ4X98UPqk/5r3m8/vMFBR/rnP3WmbEOcWx507n4Ryr3T /o8UHAA==
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-36-samitolvanen@google.com>
Subject: [PATCH v4 15/19] gendwarfksyms: Add support for reserved and ignored fields
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
---
 scripts/gendwarfksyms/dwarf.c             | 202 +++++++++++++++++++++-
 scripts/gendwarfksyms/examples/kabi.h     |  80 +++++++++
 scripts/gendwarfksyms/examples/kabi_ex0.c |  86 +++++++++
 scripts/gendwarfksyms/examples/kabi_ex1.c |  89 ++++++++++
 scripts/gendwarfksyms/examples/kabi_ex2.c |  98 +++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h     |  29 ++++
 6 files changed, 583 insertions(+), 1 deletion(-)
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex0.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex1.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex2.c

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index b15f1a5db452..72e24140b6e3 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -308,6 +308,9 @@ static void __process_list_type(struct state *state, struct die *cache,
 {
 	const char *name = get_name_attr(die);
 
+	if (stable && is_kabi_prefix(name))
+		name = NULL;
+
 	process_list_comma(state, cache);
 	process(cache, type);
 	process_type_attr(state, cache, die);
@@ -441,11 +444,193 @@ static void process_variant_part_type(struct state *state, struct die *cache,
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
+	if (dwarf_tag(die) != DW_TAG_member_type)
+		error("expected a member");
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
+	if (dwarf_tag(die) != DW_TAG_member_type)
+		error("expected a member");
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
@@ -503,7 +688,22 @@ static void __process_structure_type(struct state *state, struct die *cache,
 
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
index c53e8d4a7d2e..ec99c2fb9e96 100644
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
  * KABI_USE_ARRAY(fqn)
  *   Treat the struct fqn as a declaration, i.e. even if a definition
@@ -58,4 +80,62 @@
 #define KABI_ENUMERATOR_IGNORE(fqn, field) \
 	__KABI_RULE(enumerator_ignore, fqn, field)
 
+/*
+ * KABI_RESERVE
+ *   Reserve some "padding" in a structure for use by LTS backports.
+ *   This normally placed at the end of a structure.
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
index f32ad4389b58..1cff868bacdb 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -222,6 +222,20 @@ void cache_clear_expanded(struct expansion_cache *ec);
 /*
  * dwarf.c
  */
+
+/* See dwarf.c:get_union_kabi_status */
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
 struct expansion_state {
 	bool expand;
 	unsigned int ptr_depth;
@@ -229,6 +243,18 @@ struct expansion_state {
 	const char *current_fqn;
 };
 
+enum kabi_status {
+	/* >0 to stop DIE processing */
+	KABI_NORMAL = 1,
+	KABI_RESERVED,
+	KABI_IGNORED,
+};
+
+struct kabi_state {
+	int members;
+	Dwarf_Die placeholder;
+};
+
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
@@ -239,6 +265,9 @@ struct state {
 	/* Structure expansion */
 	struct expansion_state expand;
 	struct expansion_cache expansion_cache;
+
+	/* Reserved or ignored members */
+	struct kabi_state kabi;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.rc0.187.ge670bccf7e-goog


