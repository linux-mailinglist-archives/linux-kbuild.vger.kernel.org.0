Return-Path: <linux-kbuild+bounces-3014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77790953931
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 19:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D581C25308
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3381BCA09;
	Thu, 15 Aug 2024 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVEqopoJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B31BC070
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743572; cv=none; b=Rv+7eQGCAexdojOTpuAYRmE1ORR/cwKRQFPEdanap1F+2Kb4a+hDmuFj/7BojCVzlw9WydWp2tdrPUytQxd6tjOT6HrXbaejWFcv+inOLNTlZOubX+c9O0UitUNfwYusCMu5yjpMUsyq5XYmUgGG70PR5y1TjwYRslhCuCf9kQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743572; c=relaxed/simple;
	bh=nTcTMkHUN/UCMnmRiFJQDXB1TxZAvoJP5PqJx/o9EQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qi8HJtPkbGe9eHU9lEI+k6cYhMUY1JEkJ9ZJW4dAxtWSv+1eLeEz54Ov7glXnO6Ujni8YS8gsMaJA24eRzvTCF1xVfTRCdmmTq2IEPu/JPHNizC2iCpv43KRRYNAWHaVu9EjfBnVV7GQKVkl9gr3KHU3agJBOizLlaK/dv8CEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVEqopoJ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-672bea19c63so19852827b3.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743569; x=1724348369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oQTVjPACp33eNMD9tpytKg6MWS9lRG5M8diY/YwwjwU=;
        b=YVEqopoJuKNqM9+3+scgzHZxH4H0bXe7DRFOrqMJy8CmMuUzHwuc9DKbX+XuaCSJo6
         DJaTHjRh5AuNVmGiu7iATig2CVUhP5yNYv5QPiiRyBrOXIwZosI8MveqmLR0fz/FhBK6
         oV0wETohq49mPv+trOtiuTQlWehCgSpb4SjudOom+DwGDP7ftsbUEfxYkeD79dfUoHJH
         58L3DT28eWgAl02EsYCLrGV1Uj4ejYD1IurF8p97NbiPFXe+e4qstB/AbMbqiMOY+HuB
         BevFJNn7lGKKRf3441YiQJ2li+MKzneTXxyyGSAjF9fIQgCjh0w/1Mb1v6UYQfm21dc7
         G3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743569; x=1724348369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQTVjPACp33eNMD9tpytKg6MWS9lRG5M8diY/YwwjwU=;
        b=VrgICjP0kEhgVLOumr9n0kj3PUI6u3Atsj/1eSqtiHzlA7FBA7+cLAUgzeCQxSI6YA
         svi/m1hz/pm1rLdDENlbLyxbHINiWisVSxQsY02aoyVoz652hrdnAJz6c92MDyZlHjJw
         5ZPijp3zsHwpYd0ss4E4Z8q+XjUgSzT8cG8HCWA2Sfz5/N1phH3i0MPa5ImoWbCy6QJ8
         gZ+E8YkXsFkLo4RFiMqUaMxfGeZaXEQfWHJyVL9Y7wz5LKMrYrivDtaI9NU5eELWLkL2
         j91yHNYjxX5neRhEwzCuzQB692lVc+yTpbTBIow8EaiFCPAz/bpm4j8Nw4IldfOr2Zxn
         L/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4R2NNpGIVimSloRd/XSPOQb1E29Xn2UB8YiDVJFnUimuH6QNApXFXRfprPXCffgMHZZ2QKxfngB2im6QJyaxiUaX0gg1jVS+Zy3S4
X-Gm-Message-State: AOJu0Yw8lb3v6RjBp62LPx9OZYYP74iz+DTMwQvYOHmdaxGwx+DqOibs
	67CTjT7A7HtSzWkjPurAyrgb056j18y4MHRxc3GWJGm6qtsgZERmFJbEk7yyychsaaa9P0rJfUb
	bt0OdTy22Cu7Fw9YkmQwdBUW1UA==
X-Google-Smtp-Source: AGHT+IF5CO+eSdgk4A1o3bwcX4SrUit3pZq5QnY92bhAjwQwlxVmeRJpF4eb4vxYwPpGR9RAkAYB0eRSdszPeH2WSe4=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:4084:b0:667:8a45:d0f9 with
 SMTP id 00721157ae682-6b1b1e5d0dcmr159547b3.0.1723743569512; Thu, 15 Aug 2024
 10:39:29 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:13 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=samitolvanen@google.com;
 h=from:subject; bh=nTcTMkHUN/UCMnmRiFJQDXB1TxZAvoJP5PqJx/o9EQA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04gVH5i1wio3ZaU6SzQ4CTy530kpMAP58VQ
 UhjMnOXvnaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7v2aC/9n9aNbg61o1QfjFxg33M09DzU+aiKnoMY1BZQpsmArZ07gstbc5sJ4RGtOy+Aee7yr2WN
 jqsWFwV3sUG9t3i6SGUMaGVu2mxTapdoeWboqRb3doOR6k5+DfqUPzJ0i8HgVXZXUUu6OXRO0Ec
 QpDy4+/THzSyrmvDOv9/Z2XcU6dEUoxCVtlkluQNKLuTO32SS52vpmchi+nHsM6ZDm2gcEhLy38
 IIF4iyRWYNh3HDacVGmENL0cW5A52SYlkjTT7w6t4gIQ/WRfZqKIbXi5C11t66jrieHzzTShCFj
 4mo68AFpqeOhauFRqus/fNT5aSkxtpXlFRCw6pXI1CKq9YGxSnBcOJHW0KtXbjMBJnIr2mJcuxU
 iLH5DMEuVxf97wyRRgszQDbNpY/MLLZdQjsm+vGSymrh9bGrbaMTXOr7xYTr8H6s90/es9bbjHx 4/9EH6V8K+B7SZ+VqSbXe5msNpzTwsBAFZjrp66RMnldstPBfaMJyyg3GG+LgndBNoYgw=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-30-samitolvanen@google.com>
Subject: [PATCH v2 09/19] gendwarfksyms: Expand array_type
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for expanding DW_TAG_array_type, and the subrange type
indicating array size.

Example source code:

  const char *s[34];

Output with --debug:

  variable array_type [34] {
    pointer_type <unnamed> {
      const_type <unnamed> {
        base_type char byte_size(1) encoding(6)
      }
    } byte_size(8)
  };

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index c81652426be8..4ec69fce95f3 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -218,6 +218,7 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 	}
 
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -309,6 +310,34 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static int process_subrange_type(struct state *state, struct die *cache,
+				 Dwarf_Die *die)
+{
+	Dwarf_Word count = 0;
+
+	if (get_udata_attr(die, DW_AT_count, &count))
+		return check(process_fmt(state, cache, "[%" PRIu64 "]", count));
+	if (get_udata_attr(die, DW_AT_upper_bound, &count))
+		return check(
+			process_fmt(state, cache, "[%" PRIu64 "]", count + 1));
+
+	return check(process(state, cache, "[]"));
+}
+
+static int process_array_type(struct state *state, struct die *cache,
+			      Dwarf_Die *die)
+{
+	check(process(state, cache, "array_type "));
+	/* Array size */
+	check(process_die_container(state, cache, die, process_type,
+				    match_subrange_type));
+	check(process(state, cache, " {"));
+	check(process_linebreak(cache, 1));
+	check(process_type_attr(state, cache, die));
+	check(process_linebreak(cache, -1));
+	return check(process(state, cache, "}"));
+}
+
 static int __process_subroutine_type(struct state *state, struct die *cache,
 				     Dwarf_Die *die, const char *type)
 {
@@ -411,7 +440,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
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
2.46.0.184.g6999bdac58-goog


