Return-Path: <linux-kbuild+bounces-4772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2319D5423
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55EA2B217F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C57A1D0400;
	Thu, 21 Nov 2024 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o94OEAQV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8041DDC30
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221770; cv=none; b=bJ0zT/aRSerEXZySPEdHm2G9NtU/XpIsdLyeG1JkoldTzxvjXMzqPv4mRXfPkjLVVnCLTD0CwXdzXNFa6zE9lrsSi0zo66q+cf3DHIWPzNBXnZQaOelXq/vS4G83s4KmjqJ5fZrDgQwCXoqCkf2xLRBkh/xTqNkEF6bMOrBQ3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221770; c=relaxed/simple;
	bh=K2ie+K5BAHLttox7QOvj2Jlq5yVsu82vs8hCoTiovzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u1naNYWOmGo50znb6TQoj7D2Jsa7eFVATFpiARni4AnrjlDMqyGkcCCjW3OTkApJkbWwdG/MIa2RxF7TF20fko35IWtCzrZtj1P7rmMAg+2uYk5P1r2lktstCfr3wa7Eq9nvtgJYnObJh805SAA3J0lVpxUwlRuLHixHEx6gRuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o94OEAQV; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7eb07db7812so1069447a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221766; x=1732826566; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PScQuWHy6DjhROn8PczIndaWix8yzkVmRsn1uGhjo=;
        b=o94OEAQVDVbMV/K8Emp3pz5YzZ37kl/48tHM9WAZF2YKeO+npPgdrI9KRLlBiLXTPC
         Yr9Jpud/mlAPrrDrpc3RzB1aH5CPJAedxEK4GOcLJP3jsDT3k3hE7sBRM9dTy+Sm0EYc
         kINl50XoJd4eI7FBN99adPHokhw5nnkXvrbgIgb1M79hrfLcKWbAAkiFjElV9i9VGWft
         T8NxYDgBr63wIB7OcJQvQ4P0CG7EBt+S+DEpC8LXbQy2zC4bc7zJ/f4ZZQ27clKzHaC2
         C1u/Z+MsiBdD0OLqh2Xl5N8qrFPDPv7t+2Lz1rWR2xh8DKOq2RpVPOX21A+iHVtFtAUD
         RzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221766; x=1732826566;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PScQuWHy6DjhROn8PczIndaWix8yzkVmRsn1uGhjo=;
        b=gHRo/WA+nRO8IWDsur/HCG2YdsPpwP3qBQFDRrc+OPrafSx1PEDuD3xEQpdxOP8inY
         LDCsa8/3qUUnwwTNw4K+OauezWLQ1B/jSh++9Ya9HlLp/U52FizR3jY/ND0sdUnh1vE7
         0XSJsV3eW6oAbmxiRHini2/dW3lRbUNTAiZEDr+s9Pz+At8zOtNkmFrtHQzzR7v+0X8q
         O2efRPNQvAHD6uZp9NBVNMgQpE5bPDh9RTY0Iiwr8+0S/Zjcuuop7bS1Huqkr7KBzHcu
         mbP3bBMfGnKpQ8qMPB+/VFnvEBqdbQNEtdmKUAyz+UTV4RYhPzsEypwPpKPZxlPk9q03
         VhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdxSGUDTC++dX12Y9CClZCjcuxtGupv/3rIQUiZlOhwshwLUygTWkiFxS0Z3lyuRJNQdKWRCkHoGgqsH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZeFIjrD2itvdLidmGBjtJKUY8JJe98t4T0gK5Soovk54ND1Wk
	E9dhUtqMWxJb7EqKj0TlOqtURsL/0SXEIFnXuufnJ8IyLvzm+y2ZHomibcU329O4bzIaQ10d4Jr
	h4mw0Kr5k5wZXcfpadFn2FmByrw==
X-Google-Smtp-Source: AGHT+IF3193DVDNoTowEC34YpIeXHuT6+LHh9FOvMUqYp9Gv+NbxW05RZWgElbfmVyDREsBBIVfSTX89nLZeLEUq1k0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5921:0:b0:7ea:68e2:176b with SMTP
 id 41be03b00d2f7-7fbb44ac1d9mr2886a12.1.1732221766514; Thu, 21 Nov 2024
 12:42:46 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:27 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5759; i=samitolvanen@google.com;
 h=from:subject; bh=K2ie+K5BAHLttox7QOvj2Jlq5yVsu82vs8hCoTiovzM=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s/UrKq3LtlTGmF/emH9nRrDQ6s2nEss3Na59sfTFl
 F/rT70x7ShlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQA3mYPhf4iKpIT7us+O4txT
 RX13HsrRvr5+Z+1uZ5u7088WqdyM/8XIsO2zf07YmwCeio5fnzMlOA/fMo78MuWWk1ylzZkeqXv JPAA=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-26-samitolvanen@google.com>
Subject: [PATCH v6 06/18] gendwarfksyms: Expand subroutine_type
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

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 1d67ee18a388..7e6b477d7c12 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -211,6 +211,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -223,19 +232,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -255,6 +273,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -289,6 +341,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -359,8 +434,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -390,7 +468,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index a6b9a697bb17..39bdc9e121b5 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -65,6 +65,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -159,6 +160,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.371.ga323438b13-goog


