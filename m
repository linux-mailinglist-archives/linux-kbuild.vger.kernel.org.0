Return-Path: <linux-kbuild+bounces-3962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DE9956DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91243B2701D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F35218582;
	Tue,  8 Oct 2024 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEISiiuW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8FA217338
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412733; cv=none; b=sgq6DOVGjawDWLQHwEGMRZf9rLGJZBtjcq5R3h5wy47vmP0B0t/yPJdLHxNL5L2GFivQPdoWZRoE39SLMw9yg3lKfUdDqD5r19OeqCg3LGC6ji1/C1GSnm81VzyiE/2TVLWZvKQ6weXeAvjdOqd6vA+Uf0Gzmr/dF+uwess5H30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412733; c=relaxed/simple;
	bh=mITPyravUpQ/bJzC6y0bi7OfUc6olmVCmSnsnJKAM7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K5DFmy64DUe8AxmMBFBdQywl4QxUvfkJvDfXDoj9EYlqd3iuZn4uMWvX633zdjL+shg6GI/nfLU2okKkY6eLzQ6/H0KGDcvrv3gffGN2xxRlOF0SLk1Udpfy9K1fI6duWgIuZVMUq4tiwd62Cwl1TJwuO+jifR/yZKNrARDccjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEISiiuW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so3589449a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412732; x=1729017532; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5IN83f2AWDRsPM4oFeAVwXzABTM6F2NmuC5qwi5gGYs=;
        b=tEISiiuWIUNOtRULQhl0rjZEdoDCXhCf5jCLqDmupCoaKupmgyG3dOyqH4mZAI+RE3
         +baTtLHU+0gYSg/frMz+Vs/ahssg3NsGvgc/j2V5lJY4AwrArckK+y4dEqJfF4H7uuXx
         apGh0MTIcfJBJ3+6PLJ/eEue7zNrBfQo94aGqgi3rVLhvXphvFSoVbcyVcHo3OEHOXZY
         NF/dsrLW1iVjd0bm1txpCla6oitZOCzHzn3lslFfDiWaB0zW2HWLvzxLF0LsML8vuEm6
         cij2s74ILpPYnmO3U22c7q4y8Zi5yGtTAwckE7nWVye2XOaqxNCM9+ENwtFyI2+Y1WlZ
         eHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412732; x=1729017532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IN83f2AWDRsPM4oFeAVwXzABTM6F2NmuC5qwi5gGYs=;
        b=BP95z0N1IHk4HzV5kglL2rg2VbuyUgsvsPVuKb5XvvQPq4GSqMkK6Up2vUrWmopYl1
         Ak2Pxy+rwEU5rnQFhX4EYfOB7uKB69+Y7zBC0/cKQP9fQH1y2tdmvHF++80/DFuTLM42
         /QY2tbGJZD+MACFZNkdAsCM82VE7HomxCVH0vexdMNnO+uRMAEBTnHZVxnUyran3dmLT
         FpTaj7ILibHvPzwgnxpGIfGEYkGqDX8/eSCeoNJSs6ixsZ8xH8k+4kVow0N6AoxSbmP/
         VgfPiFnvKBei22EPLUqWbSn6C8c7oehAlbMS4BZ7iCq9O9FGBOHglPv2pg6iS+gGr0dW
         T4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7HsnaOo6TEkV7KpmqNzYe9qkPly33OWYM+2WyiWs+j8nYJgXttwmcJyFpuXvONvh+3rjbn76t1E0pYU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+4Do5IcAMDuowekMOB8Tlvvn82lp85uMlHbAmftFbEEb7b1J
	/y10Rl22HQAxImK8TWjrbTOrdCg+3ZOw6OxUQdmbLAzfvnOEkl90+H4438oABqseUbQdHd7mR3g
	KMSG+LDYia0mfbDNeBogX1UXMBQ==
X-Google-Smtp-Source: AGHT+IFTrAucXWOZ9cZin4iLnAuYNLU0EypeB1Z89LIS9DMR6Ty9nh8TVw3+ALRwnadMOVxAECwEdv5BsoMa/bUsExI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:6247:0:b0:7d5:e48:4286 with SMTP
 id 41be03b00d2f7-7ea320e1a64mr17a12.7.1728412731505; Tue, 08 Oct 2024
 11:38:51 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:32 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=samitolvanen@google.com;
 h=from:subject; bh=mITPyravUpQ/bJzC6y0bi7OfUc6olmVCmSnsnJKAM7Q=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNSotQRLVu8W36TyxnBn03Kh8W8wLl9zpO/6c+5uir
 zeHSyygo5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAExk5xJGhgW6sTfmOap9F+2d
 dj/kZfa9k0X8vx0SbpTtlLaVf3TpRTsjw0IVqdWfXtzz9zknuvFfs55LlIl/QB73x//S4bUObNb L+QA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-29-samitolvanen@google.com>
Subject: [PATCH v4 08/19] gendwarfksyms: Expand array_type
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

Add support for expanding DW_TAG_array_type, and the subrange type
indicating array size.

Example source code:

  const char *s[34];

Output with --dump-dies:

  variable array_type[34] {
    pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    } byte_size(8)
  }

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 7e6b477d7c12..ade9b3b7b119 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -219,6 +219,7 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 	}
 
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -341,6 +342,33 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void process_subrange_type(struct state *state, struct die *cache,
+				  Dwarf_Die *die)
+{
+	Dwarf_Word count = 0;
+
+	if (get_udata_attr(die, DW_AT_count, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count);
+	else if (get_udata_attr(die, DW_AT_upper_bound, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count + 1);
+	else
+		process(cache, "[]");
+}
+
+static void process_array_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die)
+{
+	process(cache, "array_type");
+	/* Array size */
+	check(process_die_container(state, cache, die, process_type,
+				    match_subrange_type));
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
 static void __process_subroutine_type(struct state *state, struct die *cache,
 				      Dwarf_Die *die, const char *type)
 {
@@ -436,7 +464,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(volatile)
 	/* Subtypes */
 	PROCESS_TYPE(formal_parameter)
+	PROCESS_TYPE(subrange)
 	/* Other types */
+	PROCESS_TYPE(array)
 	PROCESS_TYPE(base)
 	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
-- 
2.47.0.rc0.187.ge670bccf7e-goog


