Return-Path: <linux-kbuild+bounces-3958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F09639956D1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721F81F210E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BEB215032;
	Tue,  8 Oct 2024 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXWk762Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6F213EF4
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412727; cv=none; b=SmpzDU+suN611TufTBq97WfE2wCFGzM8pR67D1hpKQXfTRSygs/W3RMXXq9KNYgR3y8b/muEPsBMkMXhCgyd6VBqjY6c48Ai8ZfaDpUkSpQ11zsa89wd6O0tQomCFGmWJEGRO3YIYQIdZsHKRcA14prDm3lQem+PBq1LIwvBY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412727; c=relaxed/simple;
	bh=L8gZOiNafqMVcV01G0lHB854teeObYaONcRZ1bZVn3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pLa8tcpjbz+FcZATcff+RhO5Cbs4vQIIhW+aqoq57DaxvIWqCIoHp+xOXB4/sIxFgLwQf0FNsSsz0q+jh1xW+/atBHnAK2PEdwkFUOQUO2ROPrt+Ov1Cg2qUK7KDSN3DCB1cFxyNu7n+v0SIMlp7TW+JKghDxx6RG1eIDbEdWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXWk762Y; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea0d46d1f0so3196138a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412724; x=1729017524; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MkH5Ih0xNj3RgiCeSysh2t3eMUNLsppdxz7owK02bHI=;
        b=uXWk762YSg4lcvdVkuzlgrGPC5GlWv8rBj4h77aGjQ0q+v+Q3Xnhu6aSQu5P5covQ9
         Gs7aBvo42FE5AdlzwfahL+SKvNhy4iKccBdDpq8K8Uos5DqbytuGc9SGSXHgvIgfmJzf
         M5520n1VR28Q9amiMPEV+JyadIDuqmjoXbEi3SqmjgNr7cnpP/IgkY0V4kNMFXlbITRR
         HQvG3+E6mZlrPR5NbKih6aEDcz/eT2zrNOa1zYSlOFOuV4VKwzu0Fg8ymOO7QAORX/vw
         LNKu4lo2pNW0KHLkM8gY+CRMa/BIq1rQKq94eFPQHiprNd8GTpz6xjT3GhZ1LkX+aVzE
         +tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412724; x=1729017524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkH5Ih0xNj3RgiCeSysh2t3eMUNLsppdxz7owK02bHI=;
        b=mH3kpaXhJfWcB2/Z4rfgfd+bGCrnvBnvp0jvJip/uIeKfIWTB6hr2n+QwrOb5RN6Qf
         VIqpbYGSU/JPSwFlxFBOXT6WKDHuvGFlYpPrqZYVU2q/pxFw4qALLTnIYDGB6Gq3+0L/
         YLiXrXTL2OjD5+g3DTotyEtgH4gfKEeeOme/mQcBaqFN0bKQns3geSQQW+jzyZA2frnH
         Q7y3YhL0Koi7NULOcV4+wi/eHr00UYEqhcovrO8BEIom0BrlzGfshPiXfXaEep/RYE+r
         X+xD5tEi7YTbJLDioP78DaK2bMDHEiU1KN3JX5XUNiRGLNFEJfZ118cAJCClYcPcNmnp
         BuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ksJU0g50cjalKtH9R6QDvX1/Xup0FQjPdEibaa1gzllXRWchfuoD3FFi/sQVRxooS716VnWxOJ8JCw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbauFnqHZr2jatmw5MbNwp4FbmennPAf4LHXPrrWHu5VCc9Ii7
	i7nN+EFS4EoPIOmZ8aPZECN8BlTZQtxCgg98YbRDNtgdjW/xuTFisYIUWnwY0KffqaTeFBRSqhY
	0YCp6t4SE6fhW3H0E1UBTUkxhlw==
X-Google-Smtp-Source: AGHT+IFmEULt/jO3vqjILkmVX45b4prHh+Y47lGGy6+F3tp14h2lmNPgyIt35LgeXNCkncMExOSiIlEpJkHiZLFfzWc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:c404:b0:20b:b7b2:b6ef with
 SMTP id d9443c01a7336-20bfe0628c0mr4719855ad.4.1728412724086; Tue, 08 Oct
 2024 11:38:44 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:28 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5424; i=samitolvanen@google.com;
 h=from:subject; bh=L8gZOiNafqMVcV01G0lHB854teeObYaONcRZ1bZVn3Y=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNUprA7ZfPDfpwdpNx/Mfb/FK6tu1cJ+r7LQ5lt2HY
 h/fO1ad21HKwiDGwSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAm0vOO4Z/x1+Z1mozzFI9G
 c/IVlXFm31H9zN7MPeNG+q3H5pn7Fm1kZLj64GhzhfvR7mQFIxbuoL/6Hh+3VfxN/XJh88WuZ3P tmVkA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-25-samitolvanen@google.com>
Subject: [PATCH v4 04/19] gendwarfksyms: Expand base_type
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
2.47.0.rc0.187.ge670bccf7e-goog


