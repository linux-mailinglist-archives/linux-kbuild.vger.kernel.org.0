Return-Path: <linux-kbuild+bounces-4412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C79B6A53
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59941B21042
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EBB22803A;
	Wed, 30 Oct 2024 17:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rafoWRx2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A89226B7C
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307696; cv=none; b=KHKOwMF3Hf/63jzBNL+iNJDWNnMkmI5qmgB0OikOBDCS0xyx6dCg9Y0xuJFHryimNXYNcMQyRAAEoMEWsh5F/FQbc0lwTQcKVKFdvCYjbmgjk7Uu10ez6gIG4WvqJ+T5vujTzfLWTmYlusAxXTdoMO0jAaD8dsgIQA1r7hN3rNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307696; c=relaxed/simple;
	bh=/9QW+6ubB5oMOGqpfqS8FoRAO8E4pATVUiq4Fo+yD0E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MFx0Q5te7e4U4p1UYAc4mBjPcYaKPGg86lB21/ngp3C+fPY+9piXLXv4i42zPM5w1pMTOGcfLMKgOGdfhrmirU2tg5qp+VZrKUyIV0bKz/U+f72JVIMWEC7/aRE7dA7ImxT7oFJ1IvD4d6yKzmcM++1odduXiRy0uacQ+dykBwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rafoWRx2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7edb8c3e743so69329a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307693; x=1730912493; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7A7peeHcI7pPhcZgm5r86ihT4lAJF2Ux10Jbmwi6wQ=;
        b=rafoWRx2zgZEpkuvYLFcDIE9UrPCTpoeE6br6COK9VsmAtJMhXwiY4W3NWm00ytWOE
         wLoa40etqcQdArdIVyct2tW14SLnZPptkt/k4rfICrqN93lnkN3NwlNDW/rpts1pKAe+
         qjMqBUp8/PZ8VcDLI4zJhRWuMdJ3MczzPL0+0142TtQWPTryXeiQyDgcx0N3AwpdWIuh
         O35trOIlCRandEfmdCgZA9NnMq087DZmxgvO2bV9+dmJBcsWTVPa4yyxjD9ulMT5yYFr
         3MyyVQiJCvPGleJWBVEFaXWaDpLiPDKEn0hPtuw9NMhz2Pg/RKDLVBs1mB9msnOnC54H
         joiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307693; x=1730912493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7A7peeHcI7pPhcZgm5r86ihT4lAJF2Ux10Jbmwi6wQ=;
        b=dsWhT1jzMP32BHvf5PHbWSa3m+/f7Kw0oTGww7K8mj/ToYPM19sJNKzI4HyAhbyyCu
         59RoUHartUDWNZINeC2qp37HkkNbnzBi2xp5r+k2VBFJCXsWEMybN/LST2YeihxN2/iO
         wSUmnP8T+JWxMB8UG1Xcd+0+XRe8TQnxfXrUxQZs4bMO8Xa+o0ayrZvNkO6ccv7fVtML
         19SPELftmcVNQRpvQAdlkeU0DZ/bu2hjLjsjBAkZ/FJSJTayl66XkDo5bQaVzQHUegtj
         5vosxlxr7vPVJWLS0HQ7SjnuUheUtnu3Nz8IvjZVfHWE2kNQs3wMblpGcl5nJen/xXjG
         eQyw==
X-Forwarded-Encrypted: i=1; AJvYcCXqt39KISKMGEIOMIcONbEMgMOfyTCL64MNWh+ag+eg1+/7MLzYq2Mtacsr/1WodJucEuc7vVPzueNI9F8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywutr8KdMiASzHfdmyGsD5J9lpx6nUOv+F2dVt8kDouNYvXMnTS
	EG6Itu5+r0Q5HcPubGA6HCQYpXRBFAeqYOtiYRK44q1MIgh3w5Ux8qfLXi8TBE07VuXqHWbUgYw
	CP7y0wnADdljnLpikJBK+ljU0nA==
X-Google-Smtp-Source: AGHT+IFt6z+hfL4l3Eu8VZhZfSgRHPSlCRSFAieUo+UmrnIYj+3IiyosifH7nLTRkZzbVvdgDG5VDkDa2Y0lQEFnFfg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:f153:0:b0:7ea:6d39:3192 with SMTP
 id 41be03b00d2f7-7ee28fefcf8mr4818a12.1.1730307692743; Wed, 30 Oct 2024
 10:01:32 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:13 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5464; i=samitolvanen@google.com;
 h=from:subject; bh=/9QW+6ubB5oMOGqpfqS8FoRAO8E4pATVUiq4Fo+yD0E=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaaFBv1wO1yzf9nljofHrXvY/5xdd5zEPCmxnWTo7x
 XrOhepdHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiq9Yw/A+3Wp06z0Rm4v3d
 poqCJuGP397f+U1Q5E6hWVmE6aToRGmG/4npm3Wqu9/PzDXm8mZcHxng47FfwJz1K0N/sNeX77d jmQA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-27-samitolvanen@google.com>
Subject: [PATCH v5 06/19] gendwarfksyms: Expand type modifiers and typedefs
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
index b2aded992d42..206ba8e3f1a8 100644
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
@@ -103,6 +106,7 @@ enum die_state {
 enum die_fragment_type {
 	FRAGMENT_EMPTY,
 	FRAGMENT_STRING,
+	FRAGMENT_LINEBREAK,
 	FRAGMENT_DIE
 };
 
@@ -110,6 +114,7 @@ struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct list_head list;
-- 
2.47.0.163.g1226f6d8fa-goog


