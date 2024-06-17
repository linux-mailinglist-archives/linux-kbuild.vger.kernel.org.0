Return-Path: <linux-kbuild+bounces-2168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E318390B8C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E85D51C23715
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE67D1993B6;
	Mon, 17 Jun 2024 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLN0bOPB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF419923A
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647127; cv=none; b=AQ3Z9184An1rAvMZzO2L3MTXFqHt2gYAz0Jd5Ko7AK0usrnM+Uv5S+ax3Q0X3J17jMDSi/p7XfjrNlXSRr/E0Fa0qZAGjNdaSS0iNEJe4Kr0UxttvBFVUDE3E1VjKS/FAsB0qYB8ZMCWCWc6A44MUEJ1TemiD2YU1h8d/hPV6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647127; c=relaxed/simple;
	bh=XIDm/IOcnmSGRDZykPA9liAdqCFSsAd2g1mmllF3ZO0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lTJIlxFoZCv9HNHl6A81aBCcBn2sl+saZ9PFAamuujH6pd0FOwTqDcaupwtAAhCnEuyWte8ftNiY68rnQtrPJ55LAXQ4yqLNZwSq5dKb6cNYABO7pBwg2n5I7goYZa3sZKSLpeE8qs7PeL4ivcAq5chRJ8PPKe7HK8i8tzyuhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLN0bOPB; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfe9ef3a637so8714096276.3
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647123; x=1719251923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nN9pDjuFWWDWuPZRfZeW6v4V3iAJfj5C43zqnVRqXos=;
        b=NLN0bOPBeo6G5KJa8PwuJ1FOr9ZLKMsBX3nyIVPNzDaD1D4o0l36UAKloQUTw+5Z/U
         tWWB2qaNp7jzXQm05UHkkRnV1kIaIVi9znylAcnOTWh72zQil+Lv1wLUKqUZBX8AqZ6u
         0Y8RTvsDb4rSzV2ieD15abKYe1dRfLdfIlazN+hRZZGhobUiMGsscArhWXRDVl8soAJs
         sH7lqMepSY/DOye527dfvSZitVzS8XHp2K/DH59gCZEfAvtdVTl5qtkkElgzHI9ijsMw
         2BTuuV8Mt4ZT48npbldl8dxmIuj1xzbnSXesweFqhKdpr7Jk2PMF8QUd/NXC6P3Tt+v4
         1brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647123; x=1719251923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nN9pDjuFWWDWuPZRfZeW6v4V3iAJfj5C43zqnVRqXos=;
        b=d0pjnQBt58S0SuiEw5cTRS7ip3/7JUcXvaOQcsSWtV+OYzPYJPW0+tNt/7m8834jXQ
         NncY1060DFMXOQl59Gsha4/SdWTpWYD72o8mwFqPtOk/V+WQ+U3TQlKRPY1PdSsSwjiK
         J0wRHaqle/JvGw8HlM+IoxBvdLkrvDQIlhwRGVABSout/UALRzM7ryVtA2hBBo/3Q259
         raxaXcZeu1OQwJlS0hMAfjsW6PFzNffz/iJhvUL5EYZW0NatfT+G3Jys1aUWM4UMnoke
         Zx+qXRmN6Qgdb53VSVxXF8BJek/IAyoRv3QD28ntGapv/tn+AFa3yY+Q23VxDLyn23+1
         IYTw==
X-Forwarded-Encrypted: i=1; AJvYcCWt2hEbnGs+dvR+/Leeb10Z7hrUO9xZGqDrL/eiaEQMws6WLHap7kIkN3Im+UKErJtS7NxctewfXvpT9dcMlYHX97xD0of2ThFuNwhV
X-Gm-Message-State: AOJu0YyDmcUY0G+V0lISjFfDnBAGCO7pboYCT22D3f12WXG8q9zfnn5Q
	ZVXH8VCPcH74jP+7obRcruZ/vcfsZ+PB80uIOtK69jGwfNrkSspPCY4o3yaCf4aYQ2YcailkAgR
	0zX20Y8EYIpZEPXg9Yl4IgN0rHQ==
X-Google-Smtp-Source: AGHT+IEWDv3pOYrvwbQFA5o/sBoe7ILYQ2yVz2C/LfsP6Bia4brXc9ssd1tO4cjztWz1j+qnoWZQNdQ26oJrCU6dyp8=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:e89:b0:dff:9dc:7e41 with
 SMTP id 3f1490d57ef6-dff154ac5fcmr600120276.11.1718647123620; Mon, 17 Jun
 2024 10:58:43 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:29 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8085; i=samitolvanen@google.com;
 h=from:subject; bh=XIDm/IOcnmSGRDZykPA9liAdqCFSsAd2g1mmllF3ZO0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk7VJhBxdyaGyeP6CZ35BcX4LCuWEkv2ceAu
 8w6TTBno9SJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OwAKCRBMtfaEi7xW
 7kV5C/9/t2WEwxaXp5A7X/Jzwwu4eUlRlOgiGERWkwIO8MrLCCDZVVuQSj5AgtNeQfcYAFid6Fx
 IQg4gJHfWPrd2nVn9zu615wnWkIkLFZGxvZySBRpdkKkxSXxTDC7y2C7WWCVCb+aSIOcWpOBeWQ
 xJ0LXft6UQ1fogWs/K3cMV5A6xQI3sOP7fdXgGDeKpx5Ckll6DZUzILUfurEU2SB6etbr89QXxI
 N4RSfm77evwX+3g2Bv2yAxoDLd3dbi0COgeGRm8Pg6OCyZ2Eadz4mLNSG5/cAlmNsge0t0+voRu
 M6khFzFyXj9mro68k5AhZftRwEvUnze5TjUtqtrZJ2ZIATcv0tgPxOlcPXzzTmvSpX0Aoa5FeIL
 LoPBuL2+BKVLWrt+ij1Bvh8tiZdwB9A71gT7JQ99oGzJEDZ2jVIvfvncC1ru31d/m3NmghKZCJv DWIFMzuIOAHIt0BUGrKfAn6VLtlirM7GOJ7Qvj765vF4JSZdGmIZ+spdu3x3JWmbn+JX4=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-27-samitolvanen@google.com>
Subject: [PATCH 10/15] gendwarfksyms: Expand structure types
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Recursively expand DWARF structure types, e.g. structs, unions, and
enums. Type strings also encode structure member layout, which allows
us to determine ABI breakages if the compiler decides to reorder
members or otherwise change the layout.

Example output with --debug:

  subprogram(
    formal_parameter pointer_type *mut &str {
      structure_type &str {
        member pointer_type <unnamed> {
          base_type u8 byte_size(1)
        } data_member_location(0),
        member base_type usize byte_size(8) data_member_location(8),
      } byte_size(16) alignment(8)
    },
  )
  -> base_type void;

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/gendwarfksyms.h |   5 ++
 tools/gendwarfksyms/types.c         | 127 +++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index 03d8a4a039c3..4646eaf5c85e 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -52,8 +52,13 @@ extern bool no_pretty_print;
 	})
 
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
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index b1b82d166eb8..fa74e6fc26e3 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -166,8 +166,10 @@ static int process_fqn(struct state *state, struct cached_die *cache,
 		return 0;                                                      \
 	}
 
+DEFINE_PROCESS_UDATA_ATTRIBUTE(accessibility)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(data_member_location)
 
 /* Match functions -- die_match_callback_t */
 #define DEFINE_MATCH(type)                                     \
@@ -176,8 +178,11 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 		return dwarf_tag(die) == DW_TAG_##type##_type; \
 	}
 
+DEFINE_MATCH(enumerator)
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(member)
 DEFINE_MATCH(subrange)
+DEFINE_MATCH(variant)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -222,6 +227,8 @@ static int __process_list_type(struct state *state, struct cached_die *cache,
 {
 	check(process(state, cache, type));
 	check(process_type_attr(state, cache, die));
+	check(process_accessibility_attr(state, cache, die));
+	check(process_data_member_location_attr(state, cache, die));
 	check(process(state, cache, ","));
 	return check(process_linebreak(cache, 0));
 }
@@ -234,6 +241,7 @@ static int __process_list_type(struct state *state, struct cached_die *cache,
 	}
 
 DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+DEFINE_PROCESS_LIST_TYPE(member)
 
 /* Container types with DW_AT_type */
 static int __process_type(struct state *state, struct cached_die *cache,
@@ -266,6 +274,7 @@ DEFINE_PROCESS_TYPE(reference)
 DEFINE_PROCESS_TYPE(restrict)
 DEFINE_PROCESS_TYPE(rvalue_reference)
 DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(template_type_parameter)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
@@ -318,6 +327,110 @@ static int process_subroutine_type(struct state *state,
 	return check(__process_subroutine_type(state, cache, die,
 					       "subroutine_type"));
 }
+
+static int process_variant_type(struct state *state, struct cached_die *cache,
+				Dwarf_Die *die)
+{
+	return check(process_die_container(state, cache, die, process_type,
+					   match_member_type));
+}
+
+static int process_variant_part_type(struct state *state,
+				     struct cached_die *cache, Dwarf_Die *die)
+{
+	check(process(state, cache, "variant_part {"));
+	check(process_linebreak(cache, 1));
+	check(process_die_container(state, cache, die, process_type,
+				    match_variant_type));
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, "},"));
+	return check(process_linebreak(cache, 0));
+}
+
+static int ___process_structure_type(struct state *state,
+				     struct cached_die *cache, Dwarf_Die *die)
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
+		check(process_type(state, cache, die));
+		check(process(state, cache, ","));
+		return check(process_linebreak(cache, 0));
+	case DW_TAG_subprogram:
+		return 0; /* Skip member functions */
+	default:
+		error("unexpected structure_type child: %x", dwarf_tag(die));
+		return -1;
+	}
+}
+
+static int __process_structure_type(struct state *state,
+				    struct cached_die *cache, Dwarf_Die *die,
+				    const char *type,
+				    die_callback_t process_func,
+				    die_match_callback_t match_func)
+{
+	check(process(state, cache, type));
+	check(process_fqn(state, cache, die));
+	check(process(state, cache, " {"));
+	check(process_linebreak(cache, 1));
+
+	check(process_die_container(state, cache, die, process_func,
+				    match_func));
+
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, "}"));
+
+	check(process_byte_size_attr(state, cache, die));
+	check(process_alignment_attr(state, cache, die));
+
+	return 0;
+}
+
+#define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                               \
+	static int process_##structure##_type(                                 \
+		struct state *state, struct cached_die *cache, Dwarf_Die *die) \
+	{                                                                      \
+		return check(__process_structure_type(                         \
+			state, cache, die, #structure "_type ",                \
+			___process_structure_type, match_all));                \
+	}
+
+DEFINE_PROCESS_STRUCTURE_TYPE(class)
+DEFINE_PROCESS_STRUCTURE_TYPE(structure)
+DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static int process_enumerator_type(struct state *state,
+				   struct cached_die *cache, Dwarf_Die *die)
+{
+	Dwarf_Word value;
+
+	check(process(state, cache, "enumerator "));
+	check(process_fqn(state, cache, die));
+
+	if (get_udata_attr(die, DW_AT_const_value, &value)) {
+		check(process(state, cache, " = "));
+		check(process_fmt(state, cache, "%" PRIu64, value));
+	}
+
+	check(process(state, cache, ","));
+	return check(process_linebreak(cache, 0));
+}
+
+static int process_enumeration_type(struct state *state,
+				    struct cached_die *cache, Dwarf_Die *die)
+{
+	return check(__process_structure_type(state, cache, die,
+					      "enumeration_type ", process_type,
+					      match_enumerator_type));
+}
+
 static int process_base_type(struct state *state, struct cached_die *cache,
 			     Dwarf_Die *die)
 {
@@ -402,17 +515,27 @@ static int process_type(struct state *state, struct cached_die *parent,
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
 	default:
-		debug("unimplemented type: %x", tag);
-		break;
+		error("unexpected type: %x", tag);
+		return -1;
 	}
 
 	if (!no_cache) {
-- 
2.45.2.627.g7a2c4fd464-goog


