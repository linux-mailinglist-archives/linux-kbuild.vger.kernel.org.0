Return-Path: <linux-kbuild+bounces-4416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A459B6A61
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3211C21070
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E12228B6D;
	Wed, 30 Oct 2024 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pScU+KVl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E5D2281D9
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307702; cv=none; b=D7Kryt5enm5W8TbL0C3o6oazQwLYcZeP0PXXR+HRYqLs3FFWoAt8i2FSYQ/xqUnv25iLXP6PAx6Zw0CZYToUDgpqEDKCCEUcyERW9JlPedMa8ne1UreQKlcqRyZ8s7ZhHYy6Yq4/F/gG6owXIOZyPeLmqKrNclE3dfNWLuiIPwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307702; c=relaxed/simple;
	bh=mwWMNU2YcOhr0uFI+51PcwEaKxoErJNFG8RSdI3GyaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iwjMuQKjv++bCBRNqeglMdCM70TDDaTI4vnvlE3DlJMoRfy/rZZ/0F18Dqe1F1vg3xgkSTyrX2Wp8YuoZWvhEK3AYwpPSZ6VeDsI5pgdm0SxrsjNnOGShAnykFBiYTuFr0eCC+L0oBNkMWbd7dOYzyY1/5nFrjci4Q4OAUcpYcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pScU+KVl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-210d5ea3cf5so466615ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307698; x=1730912498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sA10Y5O0VeoF6NX2oUMu+UfElR16HMwN4YXMGfeWCvo=;
        b=pScU+KVlK4TZMBUVAMMKIVMK44aVh6SHr7sm8m/W17DXhyK3qB58KYyuNVb018HtyO
         j8ynhBlrkGHtgRwouAyhEW+F8RhWaqz9IhIJjoiCB4O+AqO+EryfW8SV8SduKIFdSdMD
         hE9ltCDSG4pCwck6z+Kf4z8fOIK77/+DL+G+YLU9F9xyRKc8wOy4Cd7THQp0UPqL0fN7
         oqVj9MWErgDqHke96DX/BkXKAVKugilAsvecOL1wRIcmsqiogMvshazxoX6Vs/hGbstC
         H1WQfe/UrsNoko/NSL0KE5jOXd2GcIVR8+V/DdZkB9Wu1+KVbo9eBTPq00UwtYUuoX+x
         RlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307698; x=1730912498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA10Y5O0VeoF6NX2oUMu+UfElR16HMwN4YXMGfeWCvo=;
        b=tA5zxrU6Sbzgq0neVGmZzjaqKRjiq+DC1CK5AuA/Zgzz3piwvvnncDA7abyET63MDs
         yL2o+LPic1BfB9iV/25F+bJqHZ31TaG5mcb3sZ8zR4b62tnENlKDLshhX7m751RqYMP5
         ShVzJuhliMhjESbSwYbmqIvI8JR+1SPU+EqosonV2xb1FHys58F7qGpVZsU6hfIahROU
         45Kv+eymvThm0bPnOi6/1qEeDGCQHgq1swiTtKa3rTkNewBCH17e94fQNIrTL8erBSZC
         mplfTZ1PgSQnLRQMTwOL1wEDoFORCUbkqVZ925qmGJigrlAd1n8Vigu2DqBSEZVvuzI/
         CzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrGaVTJGGfY4yDAvqhFUg6Be39IBbh9jihTL0DihQCpl9ZBmnEb+ukEu4XNBZ3R8gcfnNkNV2P9ocKaDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLR6kcgiZ8+8pGr5LQQ0GLAYtfkCMxRck4iTdJhffZY7231NiY
	lAYSxpy660yGXiw2rJqUBtzL5XwM38RaJC7r807fD4HwFzvHQcp+I2tIUsxgOMWv/lluMaUE1J7
	9BAnMBmSUxvminGL1gjlcnzhxPw==
X-Google-Smtp-Source: AGHT+IG4JNTCL/rKlMHYwVUsCFpKVEhAyTJnyFjPHQL5iwahzfc1ADuW63mglV/seguu8/QoGZ+s8gv8P546lgZucxc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:f292:b0:1fb:f1f:19ea with
 SMTP id d9443c01a7336-210f8f70c30mr44045ad.1.1730307698500; Wed, 30 Oct 2024
 10:01:38 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:16 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8520; i=samitolvanen@google.com;
 h=from:subject; bh=mwWMNU2YcOhr0uFI+51PcwEaKxoErJNFG8RSdI3GyaI=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaeGvxWzVNzEKZ7GyHjB2WMX/ZM1Pda3521YeSJLxP
 B9wWJWzo5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAExk8nNGhktpgT6qu11Pvi70
 Od33QONdxBl+zpOdjNP6FKMuico5r2P4xTSh40IOx/vqbC7f0jBhhj7BjXlC90xbr1dvYeT17H7 FDQA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-30-samitolvanen@google.com>
Subject: [PATCH v5 09/19] gendwarfksyms: Expand structure types
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 138 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |   5 +
 2 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index ade9b3b7b119..98191ca7cef0 100644
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
+	 * These can be emitted for stand-alone assembly code, which means we
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
index d01fc1488f76..8e087a5d58e2 100644
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
2.47.0.163.g1226f6d8fa-goog


