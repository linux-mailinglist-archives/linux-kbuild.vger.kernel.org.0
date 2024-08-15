Return-Path: <linux-kbuild+bounces-3015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF1953933
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78EFC1C24014
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A61D1BD03C;
	Thu, 15 Aug 2024 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bqHfhE/9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479371BC9EE
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743574; cv=none; b=fIoOunA0j4mXO4DpXaNgOyTyMU7GUY5IojsDRqkKBbE/PGdDYZtIuWxjlB+x0NEDHoxNojrpIlEtuQWJhNCrtVNHPV/OYuzvqkWvaSlaU2EXX5EERMmgMy7LyOgPvD6UGZD8GkE+1hWKk+jx2AHjHnqeMloZP7ljHLsavuPqGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743574; c=relaxed/simple;
	bh=seTjzndQnpborzCoviHr6CbsMyWBJvxYdHHqERTVcCw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LeOxJZqHhOFTNB9VnrbAESQYrOazTTBfbCRfwIgx/QmtfSfrq+qKzDA7bP6B/SccXx6PyriUgmeepdYHz4fECzlLSnKYHbKbAdT4pRDNpN0X2eXIBP0exUlr/xGRZGhAru7tIwwK1wQ3pE6THA4sYcuAhr83ePVxuNeZ7jeOhhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bqHfhE/9; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64c3f08ca52so18169267b3.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743571; x=1724348371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFwCK9X2QLe1/DNg8JobTxi3rYfg72O97+Gvq68riBQ=;
        b=bqHfhE/9QRsI5hQDqp3tdVS970gAut+katuwK1SDW6rEWaItmZg7uUmdLkMyusOImo
         qVFlJaDp2Ms2tRaa7yO6W4/sJosYHkXq4WHUkN9o0J2A9bX8H5aLximciX7G3WI5teRA
         /EqbkGN6D79qC1KxVP3AZRQQND0y3KeIg8mUDxykfFOA52Ewl2vdXBcsaSlb7v0jxsoO
         0tkxZWGQ/C5jotXXQgvIR2DGtaOXBAKubdqGfi/1esACUSbZxyQcc7LIAs54gD88/Dum
         O4YOqtGNThBcDQN18pnl69ZQcF4oHtsslzeRlEs9KE/O8BFPmOxoDVPLno1PsLHnj3Za
         N/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743571; x=1724348371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFwCK9X2QLe1/DNg8JobTxi3rYfg72O97+Gvq68riBQ=;
        b=ESCUVvFJH+vWYhGKBUXSBUIjVbQdy3nEf3QOWYTK/5E6RKxInG6enGVmqVs/ndD6q3
         1u5sPOlsCQmPLTkzXcirS5U5SsKujeZXYLajYwI9Csxbb770GrVF3LydPhtvFr+DsJEW
         5BH7X7C4GdmAOAEBh2ETuK9dzMmFYEVJmN/c9olRlguCdDjcdPTF1KuAEG+vXDBbtwiz
         2HPeTWnKMgmJqia1e4mnoQXHIKxdfEPnJM2xyxC/LAMuUJh6G2+VBGJCwahDZYvr1zyh
         yKRhfYXM6uncRPvkq28s6tvmCjtOCTKXYeyI1bMFzu4Yf5w5YfRROkXiSArQvabYkx4u
         ZtJg==
X-Forwarded-Encrypted: i=1; AJvYcCXTDgV7nX/vBz0lHb6R2VVufNA8uj83DrsbdJVGEZ8lpfJvDOY5FWevwUYAhZYm2hiATeP14lOEQfY+YHu9hRThAlLk/Zb2NfZ+FA6j
X-Gm-Message-State: AOJu0YxTuqE6oCsncHFL4v+PDXxrcoNEFkSgQ+551/bNfMG4nPAThUjS
	hq9pvKkF8bkrqdhMSXnSvNLO4oaPHy16RgARq1b0sDZ+wsQkLBXa56RIBAmPhx5MZ46+YL779dv
	0qOsnim3cQz+qT7sHYhJY16oPGg==
X-Google-Smtp-Source: AGHT+IFpDiu75N2mANtuo7v4YJMU2ippJB5ROuq6c/iYPG7F5aVX3ZilvaGAZuCVdos8P47ImkL+SqtNGTBwKkGZyaM=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:83d0:0:b0:e11:584f:c2ca with SMTP
 id 3f1490d57ef6-e1180e8eb8emr17972276.6.1723743571365; Thu, 15 Aug 2024
 10:39:31 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:14 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=8281; i=samitolvanen@google.com;
 h=from:subject; bh=seTjzndQnpborzCoviHr6CbsMyWBJvxYdHHqERTVcCw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj0538CHXm4iu8vyUzVodDzA+TFKe40vk7Xbk
 VkSEjAFJLWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OQAKCRBMtfaEi7xW
 7pEVC/9i6tqmTNz0zbieOL75N1vV2Nnd1mHzQqaT48B8+NCvNgaDNkPuFp8Z8wAHc5M5uyCEDTC
 GojTEMtseuO7exYf2efh5bAUu4D+M490awuJX8ORnX6D8iFr1EUiBC70La83m4CzZuC5isF7h02
 fWE6iNLUDDBcNBRu8v+ACj9pFOoC3T6LhvpC1Tq1L2W9+2x5xZkk1GAfv72p2q8ytGVKe7ybVQE
 w2fZTAMaa7neJpMi4441GzoWvCx9FImmOhkQOlepo8mh+ApdvUD34tswj0gVt+ltl4Xe23bMVYM
 loz8EY37GPSjntf9a5MVcYMBKB81CJ01EKQswuecTckA3bTd6aAgfFJmK8FMscwcC/lFEp4K62/
 KsX0ZOZQrl0+Lrqpx8FGvACY5v0dIeNtv97pJkApX6vBcSSceAU6/CCSjOOmXTG2tRH1TNAe9+E BOm/zHZ05DkegFlucoBm+FTm7udVomn7th9ksLWe66z29iEzPQ89BC4R1QZ/X91nqV/k0=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-31-samitolvanen@google.com>
Subject: [PATCH v2 10/19] gendwarfksyms: Expand structure types
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Recursively expand DWARF structure types, i.e. structs, unions, and
enums. Also include relevant DWARF attributes in type strings to
encode structure layout, for example.

Example output with --debug:

  subprogram(
    formal_parameter pointer_type *mut &str {
      structure_type &str {
        member pointer_type <unnamed> {
          base_type u8 byte_size(1) encoding(7)
        } data_member_location(0),
        member base_type usize byte_size(8) encoding(7) data_member_location(8),
      } byte_size(16) alignment(8)
    },
  )
  -> base_type void;

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c         | 129 +++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |   5 +
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 4ec69fce95f3..92b6ca4c5c91 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -206,9 +206,13 @@ static int process_fqn(struct state *state, struct die *cache, Dwarf_Die *die)
 		return 0;                                                 \
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
@@ -217,8 +221,11 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 		return dwarf_tag(die) == DW_TAG_##type##_type; \
 	}
 
+DEFINE_MATCH(enumerator)
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(member)
 DEFINE_MATCH(subrange)
+DEFINE_MATCH(variant)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -263,6 +270,10 @@ static int __process_list_type(struct state *state, struct die *cache,
 {
 	check(process(state, cache, type));
 	check(process_type_attr(state, cache, die));
+	check(process_accessibility_attr(state, cache, die));
+	check(process_bit_size_attr(state, cache, die));
+	check(process_data_bit_offset_attr(state, cache, die));
+	check(process_data_member_location_attr(state, cache, die));
 	check(process(state, cache, ","));
 	return check(process_linebreak(cache, 0));
 }
@@ -275,6 +286,7 @@ static int __process_list_type(struct state *state, struct die *cache,
 	}
 
 DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+DEFINE_PROCESS_LIST_TYPE(member)
 
 /* Container types with DW_AT_type */
 static int __process_type(struct state *state, struct die *cache,
@@ -307,6 +319,7 @@ DEFINE_PROCESS_TYPE(reference)
 DEFINE_PROCESS_TYPE(restrict)
 DEFINE_PROCESS_TYPE(rvalue_reference)
 DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(template_type_parameter)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
@@ -361,6 +374,108 @@ static int process_subroutine_type(struct state *state, struct die *cache,
 	return check(__process_subroutine_type(state, cache, die,
 					       "subroutine_type"));
 }
+static int process_variant_type(struct state *state, struct die *cache,
+				Dwarf_Die *die)
+{
+	return check(process_die_container(state, cache, die, process_type,
+					   match_member_type));
+}
+
+static int process_variant_part_type(struct state *state, struct die *cache,
+				     Dwarf_Die *die)
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
+static int __process_structure_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die, const char *type,
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
+#define DEFINE_PROCESS_STRUCTURE_TYPE(structure)                        \
+	static int process_##structure##_type(                          \
+		struct state *state, struct die *cache, Dwarf_Die *die) \
+	{                                                               \
+		return check(__process_structure_type(                  \
+			state, cache, die, #structure "_type ",         \
+			___process_structure_type, match_all));         \
+	}
+
+DEFINE_PROCESS_STRUCTURE_TYPE(class)
+DEFINE_PROCESS_STRUCTURE_TYPE(structure)
+DEFINE_PROCESS_STRUCTURE_TYPE(union)
+
+static int process_enumerator_type(struct state *state, struct die *cache,
+				   Dwarf_Die *die)
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
+static int process_enumeration_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	return check(__process_structure_type(state, cache, die,
+					      "enumeration_type ", process_type,
+					      match_enumerator_type));
+}
+
 static int process_base_type(struct state *state, struct die *cache,
 			     Dwarf_Die *die)
 {
@@ -438,17 +553,27 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
 
 	/* Update cache state and append to the parent (if any) */
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 25f87485eb69..7d32ccd590f8 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -59,8 +59,13 @@ extern bool debug;
 #define checkp(expr) __check(expr, __res < 0, __res)
 
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
2.46.0.184.g6999bdac58-goog


