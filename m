Return-Path: <linux-kbuild+bounces-3963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E49956E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 644DA289C2A
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2CA218D6F;
	Tue,  8 Oct 2024 18:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AQF1f6N5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0898217918
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412737; cv=none; b=bhrlzTaLU0VeYeYaOWC6tL0ABIwnJlAl7CbGCk8Z8W/gLRRktC6EDlNzW4pux+ZhI4yH49BqiGf1UGClImRH29vSzdWfsYj03bNJWjowD6/wGUDQq02y9ejoe/q9JfdARmF21CygqKHoTTJ0V25YFPnQ8T6xcMqvSnCluGfoquk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412737; c=relaxed/simple;
	bh=nsMG8BmDS1pPJGvMwlDq7GSzLM5mFSBmZQGjooaZEi4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pRh7ZqQfs4Ih5+1/I3Gg4GvIXG8yLQTJOT6VZopSNo53RgTyTmK9iemOPDKgr5UpKmbvC8WUZVkGCMOgEMoWWTLaTj1lB1l/FJcBasJet4Iadu9EstJvGNStLTt36GbBmqzh97taJ+LY5Bayye1/ErrsGAdhuiWT9S8sgsmHZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AQF1f6N5; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71dfa361499so2972813b3a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412733; x=1729017533; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MFnwrF1jxR+zPWj5478XfhkmmcZPfEIKtDxJzvFfWw=;
        b=AQF1f6N51hyyD2yZOflFQQQKlILAfF2mcAFnnR5q+blSvC+CtLB4jLHQezmEHQvw2p
         /NuyEhcQwY+2O3KX3O6mMF558kjdNQ/QJw7sv90UP4FLKKEdq9ASqgamz4/BYdacgNSz
         Gf59KALc6ffYt+X7s/hyocRzFlcn5zHiRSv1F+CT0PyPcTQdzIzRa11sl2NXOpG6Ev8X
         ghHmYi1BWY1fBXONqyD80GZsiLELPtcZD6Z3pDNSQw+F3uJEF6OU79lBaKAsr2f79cJo
         HJn3uV+EYUldPfTdYiD5hucbg9gx/LPXe+/XtjXRbQjdYx/J1LcuI84wYxeDZLVBXXHt
         Kggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412733; x=1729017533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MFnwrF1jxR+zPWj5478XfhkmmcZPfEIKtDxJzvFfWw=;
        b=XK/7vR6PmY68aJy8Rv4618Ahki4ME9vG8/7KDqUAvTbRBpeiJ6Rb399tChshMHtrxW
         vgIxvM//QfswXbf1mG841zm5PsLj+WEHct4BoUee9uTcQXLY/r3prkFFpq0qRUWIk5ca
         4S2sWtvWF8SLZV2sqWLlnHgvTva6WxO/CEDEDAvEIj880IPAdfupeUQjWKTHas14os/0
         w2Ko1Nvl7ZYxj7pVew7Q9uMBgWYc/lgu4Oet9RpnjCIgXkGXE4PGZHsqly3rEiqwpfKm
         vjLSKqYoqsKaLOcS4VN7VQMPV4yyRO1mRXh2MJlfVgw3nxEDGCZv/NAHCRVMb49gMFpM
         n93A==
X-Forwarded-Encrypted: i=1; AJvYcCUEUb2PFtqE2eyN7ptebFRR4krTz0e+vTlBuJGywcjLVNKn4Dx3sIEstOk8tX5n4caXna/jJGPaRMJIEHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFCerX5VxZrNKbQHeSMaIad/bHKMRBD0a67Q+FV8/baposqhT
	5vloG5Y9PgUa/SRrpZ71e2yw1W2amrTUM6V3SOj72oBeIUwYYRwzsEQvLP80mydkkSkFxOedueI
	ykTzujgPECOjqw7plZOBWpvaOdw==
X-Google-Smtp-Source: AGHT+IHJsowxjbX+q1XfBlv8DyC6GRIA7D0odEsehk64lT4TxW8E1rLvEKkG9Ou4X9QXrXLXjNVPLkveiP2yBFqXmBI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:6518:b0:71d:ff10:7c4 with
 SMTP id d2e1a72fcca58-71dff100856mr14799b3a.4.1728412733086; Tue, 08 Oct 2024
 11:38:53 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:33 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8477; i=samitolvanen@google.com;
 h=from:subject; bh=nsMG8BmDS1pPJGvMwlDq7GSzLM5mFSBmZQGjooaZEi4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNSp3d55mXv3+uoLTLy2PafNtt909/PLvzGn6C5f86
 RaVk/ll3lHKwiDGwSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmcrmMkeHL9BmRuwSF3Hnk
 zms1ueUenGQR+kJtqvDzR/ZO8xbErtnK8L9+vh2Li63m6qBzod66G6OT1okxunU9dMvSMHd+Kj/ pGR8A
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-30-samitolvanen@google.com>
Subject: [PATCH v4 09/19] gendwarfksyms: Expand structure types
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
Acked-by: Neal Gompa <neal@gompa.dev>
---
 scripts/gendwarfksyms/dwarf.c         | 138 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |   5 +
 2 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index ade9b3b7b119..f5cebbdcc212 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -207,9 +207,14 @@ static void process_fqn(struct die *cache, Dwarf_Die *die)
 				    value);                                \
 	}
 
+DEFINE_PROCESS_UDATA_ATTRIBUTE(accessibility)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(bit_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_bit_offset)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_member_location)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(discr_value)
 
 /* Match functions -- die_match_callback_t */
 #define DEFINE_MATCH(type)                                     \
@@ -218,7 +223,9 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 		return dwarf_tag(die) == DW_TAG_##type##_type; \
 	}
 
+DEFINE_MATCH(enumerator)
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(member)
 DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
@@ -297,6 +304,10 @@ static void __process_list_type(struct state *state, struct die *cache,
 		process(cache, " ");
 		process(cache, name);
 	}
+	process_accessibility_attr(cache, die);
+	process_bit_size_attr(cache, die);
+	process_data_bit_offset_attr(cache, die);
+	process_data_member_location_attr(cache, die);
 }
 
 #define DEFINE_PROCESS_LIST_TYPE(type)                                       \
@@ -307,6 +318,7 @@ static void __process_list_type(struct state *state, struct die *cache,
 	}
 
 DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+DEFINE_PROCESS_LIST_TYPE(member)
 
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
@@ -339,6 +351,7 @@ DEFINE_PROCESS_TYPE(reference)
 DEFINE_PROCESS_TYPE(restrict)
 DEFINE_PROCESS_TYPE(rvalue_reference)
 DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(template_type_parameter)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
@@ -392,6 +405,107 @@ static void process_subroutine_type(struct state *state, struct die *cache,
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
+	process_discr_value_attr(cache, die);
+}
+
+static void process_variant_part_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die)
+{
+	process_list_comma(state, cache);
+	process(cache, "variant_part {");
+	process_linebreak(cache, 1);
+	check(process_die_container(state, cache, die, process_type,
+				    match_all));
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
@@ -402,6 +516,16 @@ static void process_base_type(struct state *state, struct die *cache,
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
@@ -462,17 +586,27 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
index f31bfcb0dfe7..f317de5b0653 100644
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
2.47.0.rc0.187.ge670bccf7e-goog


