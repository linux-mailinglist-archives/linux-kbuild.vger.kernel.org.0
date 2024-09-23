Return-Path: <linux-kbuild+bounces-3678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A097F06D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61445B2212C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D8F1A38DF;
	Mon, 23 Sep 2024 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXb/X0L5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CA81A3046
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115567; cv=none; b=ta8cCDiHiSNqUoBrkCBDMyYCetFqXER76gBWWgkCbUi7XfBDZZBmaSrIADRgfhFcVRRHX+HsTf6+/RW0k0k1RS31KE55IWbY+0s+6/I5VGP1wawSxZvHLoT99hE+XI8m8O4s8YSVIvowsg9TSlUdMfUMhRk0aWE43/4CCDiTPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115567; c=relaxed/simple;
	bh=MygsVSBJnEKAJTK82XRxogqINneL66eGErhMp0pu+UM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NqpOoy3pvq9YFBaRF3DDcYs2aRSNQdKOuNUz/HEibR0f2qYarHifzQO2dSIv8d4CQuhUXbEDMVHFu/cD6yV0iiMiJveQ6P5EPmzaEGXOYWX7fhkAIPE3FdGoMkWORnnWjXtqZJjJ4rfMV3aYwEQL+PB/WuKeOfcHGn7Te88M/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXb/X0L5; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e201a37e5a4so7466547276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115564; x=1727720364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANlveXiwDoWkXc0H/Y/2WzrB6GWz44bcvCNk+rFBd0Q=;
        b=ZXb/X0L5uPHlGu/bttGdGVWZgQQ4C6D0HPOrniwHTTaICw7MtvO/RsPvVfoaYYtNrs
         I8cbxvMMa7SQv8sLYDC4nHHZWOVmn5ZUeait1WNQXREHPrdT+g8r/bsN3Nvoo9xjPyCE
         ODZ/v7dWsh+/76RSjSG/Heh+ivuyIHoxs2GbVeF3RdclWS2PQTtRc/CRjHAGyjuPw+8M
         2AwPXLtrZF32Dkb713KcaqsCjcxs+fB1LyrLK63x8455OXoLJ8hG2ftcrtf6s2L5X5xi
         gMkN4KqqDz+240i5Fz34PiodAgGvX+Hbz9E4fKK2o3DF1n3QP/kKKEYxIyi/72UQbzm+
         o61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115564; x=1727720364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANlveXiwDoWkXc0H/Y/2WzrB6GWz44bcvCNk+rFBd0Q=;
        b=v5YWJGF2TYPmFDRRnZsDOduIQXlu6mRD9o2bKj9pVctFmmJU4ADA8cWLq4KtDRVPjg
         SoS8Xiy4i7Di1NxNpxmOhyH/RXcNQ6Dz/0IQGP2uQ6QIfoLX8hmahEa7xBY7cgzHOO78
         +K6mbkyW5gk1ZCb+pwLY15g9Mye4viOOtA0v8hArqOBYWoTOhCXiSIVlSCxTvKkM5tJD
         zeWbQir4s6oRL2I9dLrzOlUMrWTRChYTpytrCibyTUHsT4aUO60xsnYRcXhx/3o2Oyhh
         NXzmiYkxn32JRH+bEYD9uf5BKNuqK1a9Yoy1hrvCQ/Ha5u50KaVeFTBSuNHt2T/wwbOs
         D3xg==
X-Forwarded-Encrypted: i=1; AJvYcCXFZYfX+i5UzJdoVBRlE8bJ8KvftS1qZNNgzyt7tYieWhyABGbJYchNJNLppTTvn9Pf5b1LIwBc1bEtt84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRcemKXEnz7gTkBOicZ7l3wk4OaaN2xDeNmwucziL+HuH14l/
	Gxt7UzO/0myGcNaVQSaC67VtXf73VsKuvD6M8Oi7Sa/GUjIjTsygsqSKAtAcewGNNyBdv5OjA80
	jD3ciMmbK9GFwO8uKL9d5MCp9sw==
X-Google-Smtp-Source: AGHT+IE3j8e3jXaBGeJhRI75gJXd4IGAjcxId0osToHNQi+/xv6gI6zHeuvMD11Z6mGijxPTOEdYL9CnbjAsjLkZUkw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:c74b:0:b0:e16:69e2:2028 with SMTP
 id 3f1490d57ef6-e2250c33deemr10274276.3.1727115564207; Mon, 23 Sep 2024
 11:19:24 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:56 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8385; i=samitolvanen@google.com;
 h=from:subject; bh=MygsVSBJnEKAJTK82XRxogqINneL66eGErhMp0pu+UM=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3KvnxEocy9tm+P+5buXxe2caJB3K1nl0UfHnfd3c
 mh0LhBj6yhlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATmbOC4X+m6bLNNyTMinLv
 Llh2+cphqwdr95bOWXL4R4NrSNDm2R+eMDJsVnfgMllQe1pmzvruj99lTr3cU/Hs35zyqbb2O77 3cP9mAQA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-32-samitolvanen@google.com>
Subject: [PATCH v3 10/20] gendwarfksyms: Expand structure types
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Recursively expand DWARF structure types, i.e. structs, unions, and
enums. Also include relevant DWARF attributes in type strings to
encode structure layout, for example.

Example output with --dump-dies:

  subprogram (
    formal_parameter structure_type &str {
      member pointer_type {
        base_type u8 byte_size(1) encoding(7)
      } data_ptr data_member_location(0) ,
      member base_type usize byte_size(8) encoding(7) length data_member_location(8)
    } byte_size(16) alignment(8) msg
  )
  -> base_type void

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 137 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |   5 +
 2 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index caf25da0a9b9..b7f1dc29cb9c 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -205,9 +205,13 @@ static void process_fqn(struct die *cache, Dwarf_Die *die)
 				    value);                                \
 	}
 
+DEFINE_PROCESS_UDATA_ATTRIBUTE(accessibility)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(bit_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_bit_offset)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_member_location)
 
 /* Match functions -- die_match_callback_t */
 #define DEFINE_MATCH(type)                                     \
@@ -216,8 +220,11 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 		return dwarf_tag(die) == DW_TAG_##type##_type; \
 	}
 
+DEFINE_MATCH(enumerator)
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(member)
 DEFINE_MATCH(subrange)
+DEFINE_MATCH(variant)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -295,6 +302,10 @@ static void __process_list_type(struct state *state, struct die *cache,
 		process(cache, " ");
 		process(cache, name);
 	}
+	process_accessibility_attr(cache, die);
+	process_bit_size_attr(cache, die);
+	process_data_bit_offset_attr(cache, die);
+	process_data_member_location_attr(cache, die);
 }
 
 #define DEFINE_PROCESS_LIST_TYPE(type)                                       \
@@ -305,6 +316,7 @@ static void __process_list_type(struct state *state, struct die *cache,
 	}
 
 DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+DEFINE_PROCESS_LIST_TYPE(member)
 
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
@@ -337,6 +349,7 @@ DEFINE_PROCESS_TYPE(reference)
 DEFINE_PROCESS_TYPE(restrict)
 DEFINE_PROCESS_TYPE(rvalue_reference)
 DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(template_type_parameter)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
@@ -390,6 +403,106 @@ static void process_subroutine_type(struct state *state, struct die *cache,
 	__process_subroutine_type(state, cache, die, "subroutine_type");
 }
 
+static void process_variant_type(struct state *state, struct die *cache,
+				 Dwarf_Die *die)
+{
+	process_list_comma(state, cache);
+	process(cache, "variant {");
+	process_linebreak(cache, 1);
+	check(process_die_container(state, cache, die, process_type,
+				    match_member_type));
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
+static void process_variant_part_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die)
+{
+	process_list_comma(state, cache);
+	process(cache, "variant_part {");
+	process_linebreak(cache, 1);
+	check(process_die_container(state, cache, die, process_type,
+				    match_variant_type));
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
+static int ___process_structure_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	switch (dwarf_tag(die)) {
+	case DW_TAG_member:
+	case DW_TAG_variant_part:
+		return check(process_type(state, cache, die));
+	case DW_TAG_class_type:
+	case DW_TAG_enumeration_type:
+	case DW_TAG_structure_type:
+	case DW_TAG_template_type_parameter:
+	case DW_TAG_union_type:
+	case DW_TAG_subprogram:
+		/* Skip non-member types, including member functions */
+		return 0;
+	default:
+		error("unexpected structure_type child: %x", dwarf_tag(die));
+	}
+}
+
+static void __process_structure_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die, const char *type,
+				     die_callback_t process_func,
+				     die_match_callback_t match_func)
+{
+	process(cache, type);
+	process_fqn(cache, die);
+	process(cache, " {");
+	process_linebreak(cache, 1);
+
+	check(process_die_container(state, cache, die, process_func,
+				    match_func));
+
+	process_linebreak(cache, -1);
+	process(cache, "}");
+
+	process_byte_size_attr(cache, die);
+	process_alignment_attr(cache, die);
+}
+
+#define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
+	static void process_##structure##_type(                         \
+		struct state *state, struct die *cache, Dwarf_Die *die) \
+	{                                                               \
+		__process_structure_type(state, cache, die,             \
+					 #structure "_type",            \
+					 ___process_structure_type,     \
+					 match_all);                    \
+	}
+
+DEFINE_PROCESS_STRUCTURE_TYPE(class)
+DEFINE_PROCESS_STRUCTURE_TYPE(structure)
+DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static void process_enumerator_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	Dwarf_Word value;
+
+	process_list_comma(state, cache);
+	process(cache, "enumerator");
+	process_fqn(cache, die);
+
+	if (get_udata_attr(die, DW_AT_const_value, &value)) {
+		process(cache, " = ");
+		process_fmt(cache, "%" PRIu64, value);
+	}
+}
+
+static void process_enumeration_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	__process_structure_type(state, cache, die, "enumeration_type",
+				 process_type, match_enumerator_type);
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -400,6 +513,16 @@ static void process_base_type(struct state *state, struct die *cache,
 	process_alignment_attr(cache, die);
 }
 
+static void process_unspecified_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
+{
+	/*
+	 * These can be emitted for stand-elone assembly code, which means we
+	 * might run into them in vmlinux.o.
+	 */
+	process(cache, "unspecified_type");
+}
+
 static void process_cached(struct state *state, struct die *cache,
 			   Dwarf_Die *die)
 {
@@ -460,17 +583,27 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Container types */
+	PROCESS_TYPE(class)
+	PROCESS_TYPE(structure)
+	PROCESS_TYPE(union)
+	PROCESS_TYPE(enumeration)
 	/* Subtypes */
+	PROCESS_TYPE(enumerator)
 	PROCESS_TYPE(formal_parameter)
+	PROCESS_TYPE(member)
 	PROCESS_TYPE(subrange)
+	PROCESS_TYPE(template_type_parameter)
+	PROCESS_TYPE(variant)
+	PROCESS_TYPE(variant_part)
 	/* Other types */
 	PROCESS_TYPE(array)
 	PROCESS_TYPE(base)
 	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
+	PROCESS_TYPE(unspecified)
 	default:
-		debug("unimplemented type: %x", tag);
-		break;
+		error("unexpected type: %x", tag);
 	}
 
 	/* Update cache state and append to the parent (if any) */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index d5186472f705..ad50e35e3351 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,8 +63,13 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_enumerator_type DW_TAG_enumerator
 #define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
+#define DW_TAG_member_type DW_TAG_member
+#define DW_TAG_template_type_parameter_type DW_TAG_template_type_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
+#define DW_TAG_variant_part_type DW_TAG_variant_part
+#define DW_TAG_variant_type DW_TAG_variant
 
 /*
  * symbols.c
-- 
2.46.0.792.g87dc391469-goog


