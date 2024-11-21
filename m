Return-Path: <linux-kbuild+bounces-4769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729089D5418
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 334D0283AAC
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77CC1DBB36;
	Thu, 21 Nov 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2q9I/cjj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE831D9A50
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221763; cv=none; b=UUe69688gnp+gAnqsRXzZT0/QN2Q1jAW7MhcLM9NJixNKyvGpD89UqidLUcyo1IbGRM/Zr1d97qYMk8/dx1fnNE3wYQH0NtrabkgvbMnK8NIbgJRlae9lwPpVV1b8bqvF6boESdG5WF4oP9KujUmoH9WcKZwCjMXV/o4TiaqWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221763; c=relaxed/simple;
	bh=YLJdfdCFIGfBHV32JhYUDE8cBaZqbdrie/OHz/meoLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JOldTHcAq6SDxzJehHpJG1Um2qGACah+cVhEGkahzeVAbVC2L2Exr+xBPaGtBIMYR+kPelo860LA7o9rL73B7dUazCoNxRZJo5Y7bqSctQohXZh1OpAdtgx2Cfu4bVV700gUCc1T88PzZdIVgq0tFbKfhp+I7dfhWFJ+kUdLVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2q9I/cjj; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6eeb8aa2280so22308627b3.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221761; x=1732826561; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1SGd7zuO0/DZ7HGvsMr06GJxdYWCHn3MBdi/eJHnfA=;
        b=2q9I/cjjqTzC8shB8ULaB6YlFqAUfjal22nVx8XjdKSV8D4abY77gGTM/yMlHCjKHF
         CV1GmQpb7yvbEiu5q9biuOQ+U1FRTWaE36aWEI1Rm3TJedpy/PRmXhZoYF7GvCsj1uc6
         UGYeMDAArWEF5KUwDU/N0jegSqKjkuxgpqmFZzgVwhYhPsWsWyjyjadpIJiUVybDOVtD
         Xgkg3DT86XvS9jKL2/CIYYGJXELdsE8BUhQ/1kQMzFIwZoVpB0Bembq/2mUpZce7eW/L
         6H4RAt3ck/mKicNufCpfJlL7sMsWe333XiPYAS2fABke6uLx4M7V5jo5F9Ha/To7qNIh
         foww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221761; x=1732826561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1SGd7zuO0/DZ7HGvsMr06GJxdYWCHn3MBdi/eJHnfA=;
        b=hCV4Y1MxfzOBNuBX4C8xvHFxBPug0E5pPLM3mdW3aAsZzSp1/zmY+2Su4W9vTVBTO7
         vMMViDsq3AgQo9MaUkQewx9d+6HeWYLy5eR9ohBvN9hEPCxrxgHc1nvggh7YDYPHZutz
         oCoZ7ylCboM31JxO+jdAi6OEzhfdzVLf+dkff/vs/3iu0p49U+fubbLU5vRlU62onoMl
         eXyNWWrjYtIbRW4EJ3WmUExfKSUQ1NBzdESK3+1HbIgBa/Ux1HuQy4oZpZd9fQ2uGtLd
         9239FcZOnaA8zi9x94DFJtj+uD+WGOVcK/i1h7a/Q/KpW3Kyt+dkwB7ZYLBoVTwy1uGy
         e/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWBPkgEYEbu+5ukDeeGfa5/ZNFp1kBK9JRtSjBLdxYLd99JxOdfMJLjKBuD7Q65zC1iUfyYlzp/eVhh9iA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTJx9BLXAvl6K3urvCkG5RBuILOb48iHRf4Ev6S/PakC+iSAJ
	rzrFdXmARz/4o22e5D8r56f0VOVZDn9vuEH6cHZ5Oq0WGLswlEpDyXF9pN8K2/thYIzIMbx8Mxw
	jQquPdWwWKNt1l6VIaQHwujxdHA==
X-Google-Smtp-Source: AGHT+IH4Q1/bX4EFh9SebSmqU9mdVJG1sem5OGMVNVYHf6JS02iswSSOxbwRKS0FKpeZfWZXlxIAPRNpJS49psl1FKc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:accf:0:b0:e38:efbd:21af with SMTP
 id 3f1490d57ef6-e38f887d422mr160276.0.1732221761078; Thu, 21 Nov 2024
 12:42:41 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:24 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5381; i=samitolvanen@google.com;
 h=from:subject; bh=YLJdfdCFIGfBHV32JhYUDE8cBaZqbdrie/OHz/meoLY=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s/VO3bH7VOG0oDed5+li3m1TOkqPcTC2cnvwGPHMz
 ZHOmHOio5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEyky4nhv1PDxZWq+cE3F66u
 kd/INDHLS0fPZa/4dO2GfKnnxSpM3xkZHr2d6hjnN23qpivGN+2L5UTvyzR+kynk0Z2+xzf6hks QAwA=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-23-samitolvanen@google.com>
Subject: [PATCH v6 03/18] gendwarfksyms: Expand base_type
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

Start making gendwarfksyms more useful by adding support for
expanding DW_TAG_base_type types and basic DWARF attributes.

Example:

  $ echo loops_per_jiffy | \
      scripts/gendwarfksyms/gendwarfksyms \
        --debug --dump-dies vmlinux.o
  ...
  gendwarfksyms: process_symbol: loops_per_jiffy
  variable base_type unsigned long byte_size(8) encoding(7)
  ...

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 159 ++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 81df3e2ad3ae..35fd1dfeeadc 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,8 +3,20 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <stdarg.h>
 #include "gendwarfksyms.h"
 
+#define DEFINE_GET_ATTR(attr, type)                                    \
+	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
+				      type *value)                     \
+	{                                                              \
+		Dwarf_Attribute da;                                    \
+		return dwarf_attr(die, id, &da) &&                     \
+		       !dwarf_form##attr(&da, value);                  \
+	}
+
+DEFINE_GET_ATTR(udata, Dwarf_Word)
+
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
 {
 	Dwarf_Attribute da;
@@ -67,6 +79,109 @@ static void process(const char *s)
 		fputs(s, stderr);
 }
 
+#define MAX_FMT_BUFFER_SIZE 128
+
+static void process_fmt(const char *fmt, ...)
+{
+	char buf[MAX_FMT_BUFFER_SIZE];
+	va_list args;
+
+	va_start(args, fmt);
+
+	if (checkp(vsnprintf(buf, sizeof(buf), fmt, args)) >= sizeof(buf))
+		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
+
+	process(buf);
+	va_end(args);
+}
+
+#define MAX_FQN_SIZE 64
+
+/* Get a fully qualified name from DWARF scopes */
+static char *get_fqn(Dwarf_Die *die)
+{
+	const char *list[MAX_FQN_SIZE];
+	Dwarf_Die *scopes = NULL;
+	bool has_name = false;
+	char *fqn = NULL;
+	char *p;
+	int count = 0;
+	int len = 0;
+	int res;
+	int i;
+
+	res = checkp(dwarf_getscopes_die(die, &scopes));
+	if (!res) {
+		list[count] = get_name_attr(die);
+
+		if (!list[count])
+			return NULL;
+
+		len += strlen(list[count]);
+		count++;
+
+		goto done;
+	}
+
+	for (i = res - 1; i >= 0 && count < MAX_FQN_SIZE; i--) {
+		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
+			continue;
+
+		list[count] = get_name_attr(&scopes[i]);
+
+		if (list[count]) {
+			has_name = true;
+		} else {
+			list[count] = "<anonymous>";
+			has_name = false;
+		}
+
+		len += strlen(list[count]);
+		count++;
+
+		if (i > 0) {
+			list[count++] = "::";
+			len += 2;
+		}
+	}
+
+	free(scopes);
+
+	if (count == MAX_FQN_SIZE)
+		warn("increase MAX_FQN_SIZE: reached the maximum");
+
+	/* Consider the DIE unnamed if the last scope doesn't have a name */
+	if (!has_name)
+		return NULL;
+done:
+	fqn = xmalloc(len + 1);
+	*fqn = '\0';
+
+	p = fqn;
+	for (i = 0; i < count; i++)
+		p = stpcpy(p, list[i]);
+
+	return fqn;
+}
+
+static void process_fqn(Dwarf_Die *die)
+{
+	process(" ");
+	process(get_fqn(die) ?: "");
+}
+
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                           \
+	static void process_##attribute##_attr(Dwarf_Die *die)              \
+	{                                                                   \
+		Dwarf_Word value;                                           \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))         \
+			process_fmt(" " #attribute "(%" PRIu64 ")", value); \
+	}
+
+DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -93,6 +208,49 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
+static int process_type(struct state *state, Dwarf_Die *die);
+
+static void process_type_attr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die type;
+
+	if (get_ref_die_attr(die, DW_AT_type, &type)) {
+		check(process_type(state, &type));
+		return;
+	}
+
+	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
+	process("base_type void");
+}
+
+static void process_base_type(struct state *state, Dwarf_Die *die)
+{
+	process("base_type");
+	process_fqn(die);
+	process_byte_size_attr(die);
+	process_encoding_attr(die);
+	process_alignment_attr(die);
+}
+
+#define PROCESS_TYPE(type)                         \
+	case DW_TAG_##type##_type:                 \
+		process_##type##_type(state, die); \
+		break;
+
+static int process_type(struct state *state, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	PROCESS_TYPE(base)
+	default:
+		debug("unimplemented type: %x", tag);
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Exported symbol processing
  */
@@ -119,6 +277,7 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 static int __process_variable(struct state *state, Dwarf_Die *die)
 {
 	process("variable ");
+	process_type_attr(state, die);
 	return 0;
 }
 
-- 
2.47.0.371.ga323438b13-goog


