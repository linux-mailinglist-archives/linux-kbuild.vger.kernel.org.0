Return-Path: <linux-kbuild+bounces-3675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C700497F064
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 20:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9DF11C2196B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECC71A2C06;
	Mon, 23 Sep 2024 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHUwiCD7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866F1A2645
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115561; cv=none; b=t8suptoN2bfnWbyr3dGWpv5tMgoh6IhpO5QTf+i3qmIqvQw7/ARC3SMWP0PlNCkI6QJsM0iOCKRNFelfW0puApMtwzvISRcHF0ZbrdTuCRMUJL90Em1Tic82CesV0d2ZDWbmdYQ/GlITytKKDt9zX7AfcXyLi/TodjEBxKZ77D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115561; c=relaxed/simple;
	bh=ymRviO+a5cEV3+mp0Yi0XXSwQOhrRgtOy5SB1olfBDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RPBbaz30dsUiJmvE7gqHVTtk8EL/aNkAH89tUFiO2BgSKW7ubohT6La42puKQ0fregOwJKQ1Ni1RF4g8EqWxhGT842RoApLUczJH3v8mvVrJVH4U56oXBNqKiLPQS16wfSozx+JxQIujAVxiAxuJcg/FV0NQKPi/tELOgltkVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHUwiCD7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ddbcc96984so72918057b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2024 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727115559; x=1727720359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx1zf/KMHWOofjasnauK3EaDfAHFjR3zRo1FGvEVy2g=;
        b=tHUwiCD7xkxmNWqmgwZfzAY5cBaOsRgxASBDefcrjBHFNKiAZWuinqTkSSdkcqFZZS
         Q0PdVF6byByl3XHfK7L/3ZITUUcrlfcfLtvPbJ+QcqpGnyp0oTpSaTQa3PvKj/zlN9bE
         njtr/0SB330F4ZFr1k5xU/+SxcRZTulPPAhUo8AI8DllKcZeKfdFnFd7XJYtUh2/1Jmu
         Gug+I9SNW0KyfHtVBaLDJFm8Dt2LUWgQuIAVihvJ1//ZCaz1o31NG146Z5u//31rNiZ8
         U91zXfQ95RgszL17HF9w+VGKwvnxBfZywLZiQFuLONGXDzG5Jv3lTkWEbXWp3HYtaFCR
         BrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115559; x=1727720359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx1zf/KMHWOofjasnauK3EaDfAHFjR3zRo1FGvEVy2g=;
        b=DJv7rEi68AX17Cb6+EH2vmzRbmsdMTwM6vDrvvQVM/FB/K7Poz+Hh1oSAskhF7RZ4G
         0565lHMRgGhxwocpiW9gx4Nfp0NysRoWCDmjuclTuyvnPEGMg39kU5IECYMVQ+4D5juh
         jzXZM70853KqDftga016hyPjpDY6Dzh4fOrhfLx/SC/opW89RUF3FvjX0WSDEbEJj/Tr
         NFo23jRY7MSTKbEZbT3tYmhg3QlzmSKqD7gOiOH/Uk7jkCaqvBeVwzd4vQVdoK7WJHoJ
         dqFgDgJlnDr5VtLXwErsT8JNR8P+EHdhVjrCJ7cNT089UkK+ei8qoVhJgm1YhBPF/6A3
         C2/g==
X-Forwarded-Encrypted: i=1; AJvYcCXKLIF2V5Cauh87KurPgZIObDzakdPDceDQ/YtzYCRRdaWJcVaw60ZtpXnEPB8G/h2QYWOcnqzp4r01Lkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWzaIM8P5aY9Zcdu+bpomCZPHL+KQZiwddf1iSOSFsvDG4GB/
	tKVrdWY6pc6y3JphQZNEiH4E3SDY8oEDZ8kndTeEI93CUI+sMgNbztCNcH+0x3sYBYo6LRtF4xD
	Dd1tFPGu7OmWtVaQmNPcF+/SbbA==
X-Google-Smtp-Source: AGHT+IHIiX0oEVv8/+fATBQ7LD6NBHYzwVtHhVQ0EnnibVqWRuZ/lhL988HpQao5hS9ju6/+Oj1BAws9oo3moFSvy2g=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:8751:0:b0:e1a:9ed2:67f4 with SMTP
 id 3f1490d57ef6-e2250c24608mr11792276.2.1727115558693; Mon, 23 Sep 2024
 11:19:18 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:18:53 +0000
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5378; i=samitolvanen@google.com;
 h=from:subject; bh=ymRviO+a5cEV3+mp0Yi0XXSwQOhrRgtOy5SB1olfBDk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDGkfN3KWySrN/VU7q2rOIjXj7Oglc7pCZk/zeRy/PyuQd
 aJd5xb9jlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRS4qMDJuXfn3a9lyv8tyO
 F2syzn/t/leU3GiRriDUXj+H+RCXbT8jw5eunhVXuc68t3im9O2d8YfpHO79rwy3ys/Y1XPotYH FLQ4A
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923181846.549877-29-samitolvanen@google.com>
Subject: [PATCH v3 07/20] gendwarfksyms: Expand type modifiers and typedefs
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

Add support for expanding DWARF type modifiers, such as pointers,
const values etc., and typedefs. These types all have DW_AT_type
attribute pointing to the underlying type, and thus produce similar
output.

Also add linebreaks and indentation to debugging output to make it
more readable.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
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
index f0c881bef026..50ef58591c83 100644
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
 
@@ -236,6 +253,40 @@ static void process_type_attr(struct state *state, struct die *cache,
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
@@ -257,6 +308,9 @@ static void process_cached(struct state *state, struct die *cache,
 		case FRAGMENT_STRING:
 			process(NULL, df->data.str);
 			break;
+		case FRAGMENT_LINEBREAK:
+			process_linebreak(NULL, df->data.linebreak);
+			break;
 		case FRAGMENT_DIE:
 			if (!dwarf_die_addr_die(dwarf_cu_getdwarf(die->cu),
 						(void *)df->data.addr, &child))
@@ -292,7 +346,20 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
index 7df270429c21..81b8989efa22 100644
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
2.46.0.792.g87dc391469-goog


