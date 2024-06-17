Return-Path: <linux-kbuild+bounces-2166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1C90B8BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFB72830DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA71991CA;
	Mon, 17 Jun 2024 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aSSIq/Vg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6C1991A5
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647122; cv=none; b=Vt4/LWKM/LenpltrRlY+gOQjx3QfKJO8CRbB759uRLtj73KXSJQpNxBoPbE2Nr/6ZnlF0JPE5Zr5yYF0iJi0SlkfLN/29T4kSIwLLhO3D4IJo6uqsryM1pV282syRonyJxyy+yENE5Herhgx/EzFVZu+rXBqvj7dFhI6aCMk5FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647122; c=relaxed/simple;
	bh=sgkmHHFnIgB0fgQ5FEpkS1fH49CWjOzk+cSBmlZvE+g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YhC+zb9dxQbVm+E3HdWLAPfcTAcBT0cN+toryRN/hROGTDUleKhBTLQNcXh1uQlBuYTYEYJ3T56ASOsKpHQHaAWy1dDboy5+CWBwV5Db8LnjiEkOwPpwdSNaa2sQ5g9v4yUD1VdXIn78dNGv7FvtwtRA7epF0BzJSQ9qp+Uq/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aSSIq/Vg; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfb0e59ac7cso9231806276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647120; x=1719251920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qMAR1cIo1JflM9ePFvjznKTtOdomJ8KqqAZoYV6fqok=;
        b=aSSIq/Vg0mEUxZbfyuoJDSjPXY5kdFgnqOK0BxqpVe6hLG7xUpmerxv7f/HWqUSU4E
         +ut4Cx7ryL8R7NqNdXQBBhnjcdJDE8wTGPKhsjv+VFykeMoOEFSXh1pv5vzSYxIgBf+3
         B/BVj0jRzvUj/2SN8a2eQ7hbNvdzUQWXT2dv86A9ZIv8NNvKWKvbrw9qncHzN8UHZamV
         LDTCE/nMsznV9CTkwBsEea+Al5SGZfC9qTeXf5XcFi62oZTw9p4YnzhmbF2HVYAEU/Ce
         +/94/6V+NaSo1r7JVFcleDGCpZvUDTrluosC1TYsQY7PMk8t/2Ml3j1oiCSDdOrmBJWc
         l43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647120; x=1719251920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMAR1cIo1JflM9ePFvjznKTtOdomJ8KqqAZoYV6fqok=;
        b=tx992K72WtkxHEcY2QPOxwSIYwsG/6DlUx8KvZupoNBpcxN0m0JExZM45tsEjY3n1U
         vVsO8+qHAtEVdNy8KBh2GtxPXtq1I8vqcOae3Knwbvzm8qIAy24ELMZRlE9ZrcGVKoRK
         OpQsAtY0jBJXIKgM4CDV0OhQYED4+sL7Zi2CE3i20ikhcxXsAF8GkBLjUUVvkatjzHyb
         Sctosn4SOcop6MauvC3emJzwzybasuxJbYeW9tmc3m5lHW7CnyXqt0UDYzMiQDg3B+wm
         6NDuiWmVqgy6U9RkOzlvQZN+Qp/K0SPj1zirEHqbu0TtpXNkIiDRExIjxSEjeRHrZi3g
         uprQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+JOPnCYHjys/nnJ0roGnftzXvujP93RhqfRTeYIddRzq6cI3EaMN9iElVFCbhinXpqvJWRV1Wa7hmfZHBCgmx87J4pionVu8S6BuO
X-Gm-Message-State: AOJu0YzNS5HGU/n/oN0uNJbjsQGx846es1jZqrnth+u0oCoWj6p6sEF0
	Zi9YW0VX3zDXtD/S6Ju/aLpcnp/MMXXpvg2YIuFH+z1PnT32neNDzU6ErI1md/dNpyPfp7NmGPH
	ILH8mWgLePkMnbWxMeZcm7G2fLA==
X-Google-Smtp-Source: AGHT+IFdexRvcSmQr5+Zf9A7PFK5DHMt79Lyecr2ImLo5Up/lK98Mnn5Aubagnf5Di1TNyTy2AK06begshnaJ81l7cw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:1208:b0:dff:36b3:5c27 with
 SMTP id 3f1490d57ef6-dff36b35ee5mr1965483276.3.1718647119989; Mon, 17 Jun
 2024 10:58:39 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:27 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4730; i=samitolvanen@google.com;
 h=from:subject; bh=sgkmHHFnIgB0fgQ5FEpkS1fH49CWjOzk+cSBmlZvE+g=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk7mdNJ1Hcm9wwik+5zWJw3o6X1Gdefgl2+Q
 212qRIsZb2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OwAKCRBMtfaEi7xW
 7u1+C/448XY4cuyoh1o5pdIihgCKSCltPVNd1wZ0KxjivdxeLSElMgUYpOOKSWRqveG6eWW6YWL
 moinHkzp12eaFM7TMYWlrc6MuwUnPTXr/a92JXCZGjdoBDNvCFL4zlFZwIo4QDkx52YgoB9IBjH
 ne0fHUFVbO2/fWoXh8yM6/fxCu8Nr0NG5Qka5f/j7OwtSCzEcUmA2QOItuijUVbbx9xW2znfEt4
 zkFmJKpj4Nf5u6/cvKWiUjOHUHZacSjC/V8+R3zitfULsqcEA5pxY/KI4P1FuR88QrbFrnl0KSH
 FwrC+UU6CAhl+JoO/k3tvRda9irsOkzJWemxL85Skxu9HwhWeh1oN0yNY4WtgiRixmxzrxXRZ6/
 /lF3ARzZiC8YyVmJRMaj+qB496LY2oM4HHV1z4ZR9cnwFUYF2mWBTCw0nGHHZ84zNmrW270qb+H D8AnS29U4Osgb5RKQHt3idrpyGaJ2bSAne288Wet5YeVgXh1yE1s8OgJ9J05En5KT77iE=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-25-samitolvanen@google.com>
Subject: [PATCH 08/15] gendwarfksyms: Expand subroutine_type
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use also to expand subprograms.

Example output with --debug:

  subprogram(
    formal_parameter base_type usize byte_size(8),
    formal_parameter base_type usize byte_size(8),
  )
  -> base_type void;

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/gendwarfksyms.h |  1 +
 tools/gendwarfksyms/types.c         | 58 ++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index 43eff91e2f2f..03d8a4a039c3 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -52,6 +52,7 @@ extern bool no_pretty_print;
 	})
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index 74b3755c3e16..a56aeaa4f3a1 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -169,6 +169,15 @@ static int process_fqn(struct state *state, struct cached_die *cache,
 DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 
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
@@ -206,6 +215,25 @@ static int process_type_attr(struct state *state, struct cached_die *cache,
 	return check(process(state, cache, "base_type void"));
 }
 
+/* Comma-separated with DW_AT_type */
+static int __process_list_type(struct state *state, struct cached_die *cache,
+			       Dwarf_Die *die, const char *type)
+{
+	check(process(state, cache, type));
+	check(process_type_attr(state, cache, die));
+	check(process(state, cache, ","));
+	return check(process_linebreak(cache, 0));
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                         \
+	static int process_##type##_type(                                      \
+		struct state *state, struct cached_die *cache, Dwarf_Die *die) \
+	{                                                                      \
+		return __process_list_type(state, cache, die, #type " ");      \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static int __process_type(struct state *state, struct cached_die *cache,
 			  Dwarf_Die *die, const char *type)
@@ -240,6 +268,30 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static int __process_subroutine_type(struct state *state,
+				     struct cached_die *cache, Dwarf_Die *die,
+				     const char *type)
+{
+	check(process(state, cache, type));
+	check(process(state, cache, "("));
+	check(process_linebreak(cache, 1));
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	check(process_linebreak(cache, -1));
+	check(process(state, cache, ")"));
+	process_linebreak(cache, 0);
+	/* Return type */
+	check(process(state, cache, "-> "));
+	return check(process_type_attr(state, cache, die));
+}
+
+static int process_subroutine_type(struct state *state,
+				   struct cached_die *cache, Dwarf_Die *die)
+{
+	return check(__process_subroutine_type(state, cache, die,
+					       "subroutine_type"));
+}
 static int process_base_type(struct state *state, struct cached_die *cache,
 			     Dwarf_Die *die)
 {
@@ -324,8 +376,11 @@ static int process_type(struct state *state, struct cached_die *parent,
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
@@ -346,7 +401,8 @@ static int process_type(struct state *state, struct cached_die *parent,
  */
 static int process_subprogram(struct state *state, Dwarf_Die *die)
 {
-	return check(process(state, NULL, "subprogram;\n"));
+	check(__process_subroutine_type(state, NULL, die, "subprogram"));
+	return check(process(state, NULL, ";\n"));
 }
 
 static int process_variable(struct state *state, Dwarf_Die *die)
-- 
2.45.2.627.g7a2c4fd464-goog


