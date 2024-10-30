Return-Path: <linux-kbuild+bounces-4415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5949B6A5F
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8A61C218F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C31228B67;
	Wed, 30 Oct 2024 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xspS63on"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2683D228021
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307701; cv=none; b=mnoQ0xqcZmdEfyBRznBxb4GfKpgOkNkfcS65XXu4vgjLA1K63z4tpRz1fZL1pzijaA9r6BlXwf0W+wlZIoRqZU8eJD0O5+JGkEAm3x3gTuZ/DT4t/tUS0D6epkTpelrRc2VxRx1l5yXzxS/N1Pkqqwwqm96GJMyr97ktjQLCJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307701; c=relaxed/simple;
	bh=xIC33Ds3wrL8SIvJ8KBatwbWfEydHQpWtWqC0C2qx6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eQeWMBV7fSEvA9rBWWKrHp7FeM3N5FJfeObCQLVYW141R8Rb2xagH7jlGKoDAUc112L5nkIAtJVdLxMMWlc/rl1CbJOMRnbXAcbEAt3j2XAO3jxMIog2BZmVGGhsqop+cDHwOrz1VFaoryddfDIjZtqMDQUDpqk5rM22dDk89RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xspS63on; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e293150c2c6so24698276.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307695; x=1730912495; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YBwsUDgAdTeQCLcgQc+Qk068GyPLXcdvsLeO9HYQh0=;
        b=xspS63ont+lXKHZkvoQfHIhM17gBNlww9prmKUrrDOWtDzQom2P7EOHswPDc/K05PD
         +5liyxpp3k1BsAFEIpFFHJj54WnSZ4+8cCeaH+mUkc6zbD0rIS9TlsIGVu5S/VHyRwaV
         UhG7LJslNjvgiNpoAjgIrmR9sK1fcnCKPnJAShTmY/DWRMP25MZu55b7uVdufJRZFxIE
         b4Zcbqoeb1KG+xdUeKXe+PvpzkWFrEVQKoCHChdNhzkWA2Jr11rAk3BmQKxmR8r3sbUb
         0AgLNC+iudYzR+mmOeRANNSWnqwgEiiphodbIJUD8O76ilT+VJblAVVJu55uIPI1UyA7
         XaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307695; x=1730912495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YBwsUDgAdTeQCLcgQc+Qk068GyPLXcdvsLeO9HYQh0=;
        b=sJsF2mWfKOIvSu2Rp1BTD7JTR2ItvAicniZ5Jjvu3q2wsEEsyW5Wj3NP55VZEveUsn
         6nGCiQ61Jc0qqcYLHWwqjN6NQpWwugTM5oVaxhxeT2kJrZk2nxDBiv1/GvaAoC0X9oT6
         aiusxqmRNHJFiZZ3XJz/iPd8OblecH17P5h5YbEbMOxvy/CMF+Wc2YHLy1CfWW7Ar6nB
         xhMOwlAeGuWQ1AWNt/gWe5ttXUaxG/Gv/7DD9+n0X06eULPuud8jZF+0J+qg8KGJcQl0
         Ic4qsRcq2NLLcUTIbzoYTTH15QT8EcVxvwu2mbxzTH8I1pGASRt7M3XVdy2jZm09vZub
         jWTw==
X-Forwarded-Encrypted: i=1; AJvYcCVuFs5Ml+VT7GuJVHaIZEIB4yILaywtefbRbinQn/eQ52o8+eDZ7SYP6JOxJ2HiZmYlsocn/RRfvVndXRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69YaAH0Ror+MKJggoxLIj/7uZDa8cHgnrr6Ov6Evr/s97w0PW
	SBk5C9ASpqn5FZALle2VXjjy3KOfxFnpymGdlQN9olnke7YcYTaFcXEBF3CHe6SITozjbtupyO9
	wCMLfdIu799inc/ssn8S6znsjzQ==
X-Google-Smtp-Source: AGHT+IE5N4F+yBKgAiGWwpIZX+v9/JaGuSiuwDTn5vO4PPtFOZwMpFGYjEvGwDPhlJdza5xz+VoXNAcDPdUeiIdM2wo=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ab43:0:b0:e28:fc1b:66bb with SMTP
 id 3f1490d57ef6-e30e5b33241mr64276.6.1730307695222; Wed, 30 Oct 2024 10:01:35
 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:14 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5798; i=samitolvanen@google.com;
 h=from:subject; bh=xIC33Ds3wrL8SIvJ8KBatwbWfEydHQpWtWqC0C2qx6s=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaWH33//oqv/7Ra7uz4kFO377/7IqSVBQnqG2VeKnU
 tr/fxrHOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBETNkYGSbMZY9K9pnCfHvp
 1hZ7/qIl/SvPlTqXGHe5Frz0FihfxM7IcOPgZ8nTt4I69zdeKd72da20umP4Q1XBrQcke+bJ+dV xMgEA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-28-samitolvanen@google.com>
Subject: [PATCH v5 07/19] gendwarfksyms: Expand subroutine_type
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
index 206ba8e3f1a8..d01fc1488f76 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,6 +63,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -157,6 +158,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.163.g1226f6d8fa-goog


