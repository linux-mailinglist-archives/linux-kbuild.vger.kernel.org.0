Return-Path: <linux-kbuild+bounces-5197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A669F8684
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70ABF16BE8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9481D7E26;
	Thu, 19 Dec 2024 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JeRuArBE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64351C5F2F
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642478; cv=none; b=LnF9vbJpX4QBR7X3LjHsQJ8JHExAa6X9mCwKP2A0KRvj0fbYM1KiHxTBPaItVNZswtFBBW1+zjrd2n0do/Rbu714rvZkpdOON2ffVTNzyaSZYTZYu4F4526ztLyZYNUCXuz3QPdUjj1SxNw6l2Sc/ENGYg9WcMlvts9UcJc5+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642478; c=relaxed/simple;
	bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TeKcuJ2XXSGBXhhn4p1DZV6SkTMv59R7bYXZNd8ve9QVauWNYHFfSk8kX5FaCVmOvEJmRHfqFIY4O1yrMdeNNNCy5yhTIp3dihx5w2SR4cRyvpaO0lZisSwu9JuZBYSRn+ODyfcHswn7i3c/ATpkbeiolh7Jt/0+Cngfu4kW6zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JeRuArBE; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso1150264a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642476; x=1735247276; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=JeRuArBEogAyU34vC9HtTHwrJHx5u1RL7XqRP4DzNZDKbpLa6jWNZ1zw7KwqLDA23O
         LVhS5GMWzOvavLmBuzo/zYYLyy+zNoja3X8ZuekN1kHC6YRycDphvJvAzsFFuR0vPENq
         JuNVAZwMPGudJ9cn+0Jtoe64ozMruOXhuREywnoAAO3y3bpdLXZA6VdVqUlYg8Xma9cq
         Nc6UNWa71BtZJSgLe+o34V5pRGRX/tCsNvTslIgL2J10MXNlzW2lO4YzzUhJ9759VP2C
         iHrdb9Kt0XRhZgmCcuDiLzm0a972hxcQ8NmRVH115qRwbaAXq3pmyJzbox/n2vTgvWBg
         z7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642476; x=1735247276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqmGG67x42YJFJgNp9m9MGLgkL+XEQeNfXKJAnh+SAA=;
        b=udN2/uUVWYhemsme+Gkj1k+rL9+l4rN+jHWFomkofJehbYawBvikUdFNfqrbz0J5t8
         aKB7/hovbXCAaXCroNenD6H8T24GCb1TqxsjJQ+gNLuRKzy9BIyFywTdzWpoxVOj2boO
         yQNyIRZTjsdtvsaRgPdJ1qB1rILRbJTe+D61HL/B1twXOrsDYrDpQ30QaFsxyZqNtvz6
         5gnpvaHNioPSW2nKV3cjOCngGn1Kw8tcLk/u4jkjRg0FdjiYF/VbKzlHy6arEvfbXVRj
         uCgQPqVLb6RzaWUUsWLfsQb3o5g+1PRe0vqzyHt60ktAW3We8snHoIl12vZQrG7w5c6/
         wCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0GFdVQGphMVg6leZgehzidYMeMj1dRzEkLprni4dTvkEHv/QdSXA5HM9fP82EO2nDYUzdvP3ODhDPhCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRypu+zTyE+Y+p/W5ilfwm5NROV0bYe+MUc0HCWOrOnl/7WlU
	yPfDYDybtAbpb2HrUbDlwok5Bsv+IcayVSC64ZAsgQzS1zFlOTjstBRHwuh80LKYkzq3Um89Uul
	NhEvNy6NUIOEIdlJachYcp0si+Q==
X-Google-Smtp-Source: AGHT+IE+QiqHOl9N3U1IZLotZi74BCW+jOyId5tadxS/AlzJ429isHN0f1j0ynJltMkWByvG7g6oYhH80nrxkRm4n7Y=
X-Received: from pjyd8.prod.google.com ([2002:a17:90a:dfc8:b0:2ea:7d73:294e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr608686a91.28.1734642476006;
 Thu, 19 Dec 2024 13:07:56 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:40 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5405; i=samitolvanen@google.com;
 h=from:subject; bh=bbCvhhmVnhtTYpDrJYZHLEm7Ii+2fqEhxzWaIoSVp4g=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3VKTOfLeOSXc/yAtcG3KRvG375YYlxx89vqYa396Q
 3azF9fhjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjAR72OMDCvE51ZIaKnWdc3W
 qMs7KDKrcTPrj5Wt3ofNrzw82bQ6wZCR4bZbsZexvmW7rsxemRXuNjP/7+A9I/8tPm+zPnNBgcc XVgA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-23-samitolvanen@google.com>
Subject: [PATCH v7 03/18] gendwarfksyms: Expand base_type
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
 scripts/gendwarfksyms/dwarf.c | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 81df3e2ad3ae..74e75b8ec891 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -3,8 +3,21 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <inttypes.h>
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
@@ -67,6 +80,109 @@ static void process(const char *s)
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
@@ -93,6 +209,49 @@ int process_die_container(struct state *state, Dwarf_Die *die,
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
@@ -119,6 +278,7 @@ static void process_subprogram(struct state *state, Dwarf_Die *die)
 static int __process_variable(struct state *state, Dwarf_Die *die)
 {
 	process("variable ");
+	process_type_attr(state, die);
 	return 0;
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog


