Return-Path: <linux-kbuild+bounces-3960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238509956D7
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A118E1F22EAC
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B6B136982;
	Tue,  8 Oct 2024 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="16uoj4yf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23B215F55
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412730; cv=none; b=eW9IKPJHVtT48Au2xpSqd7A4APyhDGjKmy+flB+xAz5CV6ffpFSJpDuaVzd4SBoscL9JF+TQum7PrsyXGAiYmeNSAo13i1Ww5bYl8cb67aWbsb2sm8tiF4cRMLsQOkuxrmoNPFTkyfnOQ6yxzGQz5BlzxeSXSetGqeKFECQuYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412730; c=relaxed/simple;
	bh=xDuML6o4fEs5aHjVcwYcLw3N1kJ6VZ4/BAbuR+YQWeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bbuXejCjfzOXVFshSs5FzQHyfvJ+4a9J2nZx5mc8c6qpIrxqm2EX3cO6Lam1bV4kfm7BXRDyKUvqGni+sAsuMpRWFE8KnZermlqLlxQM9AWd1HBfgbfPTtCacgJTa+APBS35XVWQpbSg0fjNaOhX0Ee2ypvRW8jzxf1bA2e1UJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=16uoj4yf; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e294f38bddso92869157b3.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412727; x=1729017527; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGsxbbl6RhT99UW/xnh7OxspW7cFwqbMTXbe6iYf0Zo=;
        b=16uoj4yfiL15ocaro/cowrQDye58eBwfLAeIeXIyo5vLXLn4gMNo+4qsU4lo+cMgRa
         fWlyeJrr642xUu4yM+Dea9Nvm0bEyX5b8M9GhP75UZwoHEwc2MhBQZ1cZ91yqxN7Qk8G
         DDG8739lajB7c2MiDIprKC3Ror45Xq93Jry4NeOO18nf6910ps6t3uHj8phSbmuyz5O4
         5FTl8Z7bZk14TexrVssJFqHa5dB6jdJ8UWEDPslLMJyTtheGklHIV896Au3Cx0fdq8QV
         vYSTWsx9JT2c+OlQ5tmn7HGvQILz87iqXXcOIy9IpPMhqwoTcWP6TwsPWyGF87Mufqtt
         Wpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412727; x=1729017527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGsxbbl6RhT99UW/xnh7OxspW7cFwqbMTXbe6iYf0Zo=;
        b=KMriyaTVkSSnAdFv22cdpDKRdQncIj2lMj03481GlacBfEAanCMDDACKOYqgEjcQem
         WEKMw76lHxSBZhHMFDsPjMqYL6V/taxnoeoUmGtE3Kj4iElFScd6dA7UWF5xzFpmtelH
         iSlB7yxg/AqyHqBEOmhjGJPusYIk/HWFGmzu1FzdcBWLNck6AKH2xOk310tUZd/W1BXc
         D3FCW/vH6OLifpAia4sFnGCJou1B6oLCpvSKhe1HUqp+oLrHvNmrwQzBZ2xZJZktoqft
         pOqxSjZV9565VW4JVulLPxKpFnFILTFFT7gZg+xEDEnZAZFAJ3mLtkHCFoA3u4V14Ehc
         2nQw==
X-Forwarded-Encrypted: i=1; AJvYcCVPib1l3RbtFvwDkjAFqG1heJF4vkJJX/AjCgbqMzIPNjhQVw0pyucznf7QXlqbUix0taWw9FVZVvuULrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfbBv7mcKjvLEOfVuen8aiCsAaXIXvhOoviHqWOtYe7HCWESDz
	+vblqcwdtHNIuht+6Ya7pvo5x5uwaW+hD0R55tXlreNG2Vmxdh0VY27MmKameR4S6EVZcv7GRr8
	iHR5nWM2B4jHVgLzN15/nf6JOTQ==
X-Google-Smtp-Source: AGHT+IEMOzIMrtBNEu9h0hc2HfglEyPOd+SSxvH4vUcRXywwLVPqQRBVQ6gzWW7firXx8TmjMsnjwFcjuXMhNaoHU8w=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:4b08:b0:6e3:189a:ad65 with
 SMTP id 00721157ae682-6e3224c577cmr29017b3.5.1728412727295; Tue, 08 Oct 2024
 11:38:47 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:30 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5468; i=samitolvanen@google.com;
 h=from:subject; bh=xDuML6o4fEs5aHjVcwYcLw3N1kJ6VZ4/BAbuR+YQWeY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNcoqp6Jc/7xKmOi01IPncq4k13zG840t8k8ajl5IT
 rV9KMPUUcrCIMbBICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTAG7yZ4a/Ih8FNKJkNrluvTip
 I5PXYulkBWs+tfWu5W1zLhofMkkVY2R4oyfc0L9nY7C99uQbN1Iqtt9X2FpbMDeSOaJ/Ub9ocCI LAA==
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-27-samitolvanen@google.com>
Subject: [PATCH v4 06/19] gendwarfksyms: Expand type modifiers and typedefs
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

Add support for expanding DWARF type modifiers, such as pointers,
const values etc., and typedefs. These types all have DW_AT_type
attribute pointing to the underlying type, and thus produce similar
output.

Also add linebreaks and indentation to debugging output to make it
more readable.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/die.c           | 12 +++++
 scripts/gendwarfksyms/dwarf.c         | 67 +++++++++++++++++++++++++++
 scripts/gendwarfksyms/gendwarfksyms.h |  5 ++
 3 files changed, 84 insertions(+)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 28d89fce89fc..2829387fd815 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -130,6 +130,18 @@ void die_map_add_string(struct die *cd, const char *str)
 	df->type = FRAGMENT_STRING;
 }
 
+void die_map_add_linebreak(struct die *cd, int linebreak)
+{
+	struct die_fragment *df;
+
+	if (!cd)
+		return;
+
+	df = append_item(cd);
+	df->data.linebreak = linebreak;
+	df->type = FRAGMENT_LINEBREAK;
+}
+
 void die_map_add_die(struct die *cd, struct die *child)
 {
 	struct die_fragment *df;
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index c2cd4743515e..1d67ee18a388 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -6,6 +6,17 @@
 #include <stdarg.h>
 #include "gendwarfksyms.h"
 
+static bool do_linebreak;
+static int indentation_level;
+
+/* Line breaks and indentation for pretty-printing */
+static void process_linebreak(struct die *cache, int n)
+{
+	indentation_level += n;
+	do_linebreak = true;
+	die_map_add_linebreak(cache, n);
+}
+
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
 				      type *value)                     \
@@ -75,6 +86,12 @@ static void process(struct die *cache, const char *s)
 {
 	s = s ?: "<null>";
 
+	if (dump_dies && do_linebreak) {
+		fputs("\n", stderr);
+		for (int i = 0; i < indentation_level; i++)
+			fputs("  ", stderr);
+		do_linebreak = false;
+	}
 	if (dump_dies)
 		fputs(s, stderr);
 
@@ -238,6 +255,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+/* Container types with DW_AT_type */
+static void __process_type(struct state *state, struct die *cache,
+			   Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process_fqn(cache, die);
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+	process_byte_size_attr(cache, die);
+	process_alignment_attr(cache, die);
+}
+
+#define DEFINE_PROCESS_TYPE(type)                                            \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_type(state, cache, die, #type "_type");            \
+	}
+
+DEFINE_PROCESS_TYPE(atomic)
+DEFINE_PROCESS_TYPE(const)
+DEFINE_PROCESS_TYPE(immutable)
+DEFINE_PROCESS_TYPE(packed)
+DEFINE_PROCESS_TYPE(pointer)
+DEFINE_PROCESS_TYPE(reference)
+DEFINE_PROCESS_TYPE(restrict)
+DEFINE_PROCESS_TYPE(rvalue_reference)
+DEFINE_PROCESS_TYPE(shared)
+DEFINE_PROCESS_TYPE(volatile)
+DEFINE_PROCESS_TYPE(typedef)
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -259,6 +310,9 @@ static void process_cached(struct state *state, struct die *cache,
 		case FRAGMENT_STRING:
 			process(NULL, df->data.str);
 			break;
+		case FRAGMENT_LINEBREAK:
+			process_linebreak(NULL, df->data.linebreak);
+			break;
 		case FRAGMENT_DIE:
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
@@ -294,7 +348,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	}
 
 	switch (tag) {
+	/* Type modifiers */
+	PROCESS_TYPE(atomic)
+	PROCESS_TYPE(const)
+	PROCESS_TYPE(immutable)
+	PROCESS_TYPE(packed)
+	PROCESS_TYPE(pointer)
+	PROCESS_TYPE(reference)
+	PROCESS_TYPE(restrict)
+	PROCESS_TYPE(rvalue_reference)
+	PROCESS_TYPE(shared)
+	PROCESS_TYPE(volatile)
+	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
 		break;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index da0db7a0c093..f2be353c3b0b 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -62,6 +62,9 @@ extern int dump_dies;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -102,6 +105,7 @@ enum die_state {
 enum die_fragment_type {
 	FRAGMENT_EMPTY,
 	FRAGMENT_STRING,
+	FRAGMENT_LINEBREAK,
 	FRAGMENT_DIE
 };
 
@@ -109,6 +113,7 @@ struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct list_head list;
-- 
2.47.0.rc0.187.ge670bccf7e-goog


