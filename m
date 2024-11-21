Return-Path: <linux-kbuild+bounces-4771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B279D541C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B74BB2361F
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65251DE2A4;
	Thu, 21 Nov 2024 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UGmYKELq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B371DDA3E
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221767; cv=none; b=XmIqT7xFOTJbHX7vZZfAocN8yFFcGINIdhnrN4hO5o9CfgtKyAvuSUqOBnDu87ciUYlFuhwsbiuhWC00nEwMZem3WKS2eTNiBgBsBunhKtlWNAnNEgnPBGNhaxn0ksLZ6/9yhK3fp7VragD/H5mXkhE94IotXltxEvsaLjoogoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221767; c=relaxed/simple;
	bh=rLGOZcCiqj2V3Mb8xMD1NQdUVcgO11MXqSLXG9dDXtw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r3FzSwl9wKmNjz1YP+8u/AivCBtL3Q0cxaC0PC2mFCbvWB4F+xkwl6uLW41hJCXLRS8A3EOhcmhVqiqoq7sLAhTdXrNX4ENeDaHSirgliwnqzEwy7qJuA74MtVKB9UD55rQPNt+u6eyaZFpdxZcWNl7oWM2DRjLvGI2Zk2YvbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UGmYKELq; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6eedce8447eso6895837b3.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221765; x=1732826565; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXC/lLCMpqr61ebokAMnr0ouaH8AUtLBWDJT+cQ9yus=;
        b=UGmYKELqk61m6YFlNQ6rtyrObdQzOE4logY5rEsnomfxdpYv/WIkCHSsool4rygxqJ
         quauoS3mqwuB+h+tx4E1mUyToOCS8+8jw4DZmjExF3kYZGuRviJqhmtxxCpgnAkDiw3n
         zdogu7LspTUpI3Ao/r5Xa+B851D96nKc+uXuc51c193UzCaNdg+MROfmYSO5F6um5FHq
         qEQeiLp0y9Ni1kcl+VgkVP2nd02LwsXXEnp2ueIy7Ko0OEXkE/YD48CSxIt+eOIZlkOl
         kbs3Dis2Ez59KY0iZ1rJhlf77IjKra2D0v8SWAQMproF0uaLGqG3bu7v2E88fur/Dsj5
         cIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221765; x=1732826565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXC/lLCMpqr61ebokAMnr0ouaH8AUtLBWDJT+cQ9yus=;
        b=b9GJ1gJg2LC8tEBO9liqmpdLjqyVDTpxP9tK3ssuOISPaeFu+Dc/9NTJ3aK28o+hTQ
         QranGa8JNWjfyTQEWd+2THWHi2/714SdUMzflJN2ydcU3QXUJZ3mXXP/r/bqtX/uuiTZ
         kddnj7PhZFpn6seHdClsfDRWxDjjhgeqwblSyiHfViGUKMWq8Q7vCdPnxMiDkhBVGjsy
         P5upTuUsjpQhB5E9JdSJOcIYUW9PZkjvUnsBq1mUkdi/lIFJ6fZKZKdQZKV+VZ3n9xff
         H8sRna8g84IW0u72gQeu4LNixCdS3yUtydD7RX0c5qYuOuH5AT3DSgSJ53k0I6rUACi/
         pMeA==
X-Forwarded-Encrypted: i=1; AJvYcCXQyxyOM6zPUev3yqhRfajZ3wcUd5JUA/ik+/T3PwA8mwCXVgP9jRYowUQiH5JhFab5n5dNcd62BQyULu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BmLghZFvbN3nEOGDODPQjkgw1izm2+Zrnxtof8eQjqeij90m
	1wb9bAUdL999CVPbcQw4Agh0duWNaYkd1YPlSb0T5BwciUWqMzwiDxSszTQu3Np/Po9FMyunAr/
	wjkt7WgUKopUgmbuLJfVwnfDy7w==
X-Google-Smtp-Source: AGHT+IEkojIJInD/1rIHSjDlLsk5eEDcRjgdNOo3km0wIkB8Z2dVerWqP3VHxREIu+UWKvbzRGycxhqM7QHRBwikOgk=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:dc3:b0:6ec:b74d:9c59 with
 SMTP id 00721157ae682-6eee0875aa0mr120007b3.2.1732221765025; Thu, 21 Nov 2024
 12:42:45 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:26 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425; i=samitolvanen@google.com;
 h=from:subject; bh=rLGOZcCiqj2V3Mb8xMD1NQdUVcgO11MXqSLXG9dDXtw=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s/Xn3wtb+l2KIfUP+zbO7+Y65ovsry8tmym0jP/4p
 0vJM3kPdpSyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJTDrK8D+WZ+GB2S5XLoYU
 sPoeNoosd7V5eyzlW+NHv31qGz0nMdgw/PermfeMR+RRzLzzGWu7S01UOe11BAoOTzRzKtfPup+ 6mxMA
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-25-samitolvanen@google.com>
Subject: [PATCH v6 05/18] gendwarfksyms: Expand type modifiers and typedefs
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
index 3b42616ae9b5..a6b9a697bb17 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -64,6 +64,9 @@ extern int dump_dies;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0)
 
+/* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_typedef_type DW_TAG_typedef
+
 /*
  * symbols.c
  */
@@ -105,6 +108,7 @@ enum die_state {
 enum die_fragment_type {
 	FRAGMENT_EMPTY,
 	FRAGMENT_STRING,
+	FRAGMENT_LINEBREAK,
 	FRAGMENT_DIE
 };
 
@@ -112,6 +116,7 @@ struct die_fragment {
 	enum die_fragment_type type;
 	union {
 		char *str;
+		int linebreak;
 		uintptr_t addr;
 	} data;
 	struct list_head list;
-- 
2.47.0.371.ga323438b13-goog


