Return-Path: <linux-kbuild+bounces-9455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA7C42725
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 05:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C60E74E40A5
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 04:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A0F1E47A3;
	Sat,  8 Nov 2025 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnkH17XT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370F262FC7
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762576935; cv=none; b=qP++vDRCVMLAUFci1rzTvaTNc0xszb7goVwc9joXYCkX97oLZmlpgWqaT9+XAO5eOgJxjpfI0d4SQ3kN0Qe2WoSas+vCLkM2aO1JONss/K6ekx2gZ1VQfWZdRchFXkteY/hlzWBSDorwipPd/rje20sVECHoHqaKvLhOU4rwPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762576935; c=relaxed/simple;
	bh=o3wOfF27ur4z3h/xReeEQrFXq2cfuiSwFtis1gOMNJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYm7AXngNBeHoDGRtmLYclpCRmIrRsr02Vtb3WQvGFrSt5hwUu6BgWJHH/P/UPCzgVQGLZ3Xfn76q9wewwZYbsYZiYFkzzfepkqsoZ3T+OxxAe6W2EQ6e/GVCUadmTCK9vvJM7frhwNiAOBf+JP/Ne1LkBR24XLSlizRKnfv/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnkH17XT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2959197b68eso60595ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 20:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762576933; x=1763181733; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azDN9d+mBYpQ3GzwIMlTNX5zY817O0f+omqPNR3WIz4=;
        b=TnkH17XTuXWDKxaPPZ5RDrmdx4by4lL12aqG8DZtjxYJhcCbInZsMDql2isdC0waC8
         LnKief2xLsATX4ewMXyE4eS1Q9+GdmDlCA9u/tJ4Kngz6OqLPeibT/LDWIuqjr43MLQH
         uqu1cp7aSWQ7dfOs46bVVCxceazu9ERmoicQuvDtbSEFQVA/cvjSU/joijOMIC4z1N+r
         oBkZmKIvt27AQyQKJnYxZ3j3i+bJ2N4nwLU8bDsfTF94AkfNz0bnG3+itNxYXW4wx+fJ
         VKIqHc2pPWFPJh5SGnUt5Q5mikEzTnnkcmMO1qK5FcF573fjXmUnRwvC8pbjG0HTOpZH
         /WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762576933; x=1763181733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azDN9d+mBYpQ3GzwIMlTNX5zY817O0f+omqPNR3WIz4=;
        b=XAB1nVle8o+5tLCq7Y2M7jc9GO/QFccneQsNgthYhG7GksK6iYG+1218DHnFGSTfTb
         Dlnl095grZOcXWvw4/4J3Tfeon14tOeM8tu6upMGlBfWbC1v2qwtlo1NOSiPCZcVm6G1
         FRcRE1jn2YjcMVV8cuwhgn4aYseEGH/g4V8NhKwJDsILozIVl7CcHHV+au0sjOukTxXE
         eVZOV8wfoWZL0WxArI0MCP/JIGEjA4rUPATokPCiGcZ/p7oSbgegyki4TWvdtPrgWgWF
         4SuN7OFwVS8djiJFqfA8xRkPKe9ko7I9Xyg5BZW1Nk7V6L42RpjU71YwYl8rvUqW4+Fr
         Dg5A==
X-Forwarded-Encrypted: i=1; AJvYcCVH7uNLX6ktSUnbaL9jKYq+lTYNJZHdDK3y0SEwRjYOMQ9yd9W3XJRjIGsuJGdRxApEjawVoIadkzzcMrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAx+xniXbneSlwU9LscvLuP4pC1PspUxtMAsK4D9E2ysTDTCm
	A6bH3SEE2qweN8f27yzR9AtjU7co0ajIqZIj6usvi13X/VW8zeTVCvIHeD3EGahKPg==
X-Gm-Gg: ASbGncvFkRzeEOV6gPOHqR78oJR9/eEu6110KtJqRSuhKW+FBHUxrklPTWlGOSxiGWo
	0vSowR9lSEOWFu/Lnd52fVhPqhgDXclsU2eb/1MhBO4+a6JTXvhcdAUl7RwXsclLPi9r6a9y5Kj
	bxndMhftTQCNpr/aAWbWN+YJvnjSUdndRFvuv1mSUYffUeD7UWFPOuM+RvTcmAOvzqFAw0OBUJY
	8hwxFLY7/zhFc05y5GgWNkcjKI3pCoM05GXEWPjVIb5CFjT76gFMIk19Ky0VoWOM88DODeBrSAC
	3t9Y8QRkE0n1NJ/ZwV6J76k8juvjPQ2ErVvfu/60Ckq2/9lduPpETXkKOkn9FXQUvHEudZNxWD1
	vBSJIamJOzgMOHTRmileycksWY8H/Z7pPboUpg/cbAYYMFose7yWTjicJwaFGtcJGbqsI3mHMKQ
	sX2VABW3QLjl86va1MGX4BjvCnnOZSxoRRNFj1FBZzWWQIkBrKTTpqOQDiqTr1GkfXNJA=
X-Google-Smtp-Source: AGHT+IHXcJAO5bRmh3BWE773IMnp2AnRueynfhX6M2VVx4LYpR4UPWTsbM2ypOtSyIqT3Gyw2lO+AA==
X-Received: by 2002:a17:902:ec90:b0:294:f745:fe7b with SMTP id d9443c01a7336-297e5641a9emr927785ad.6.1762576932420;
        Fri, 07 Nov 2025 20:42:12 -0800 (PST)
Received: from google.com (204.167.125.34.bc.googleusercontent.com. [34.125.167.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccc19asm75661395ad.104.2025.11.07.20.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 20:42:11 -0800 (PST)
Date: Sat, 8 Nov 2025 04:42:06 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
Message-ID: <20251108044206.GA3038215@google.com>
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com>
 <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
 <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
 <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>

On Sat, Nov 08, 2025 at 05:04:06AM +0100, Miguel Ojeda wrote:
> On Sat, Nov 8, 2025 at 4:51 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > What do you mean?
> 
> Do you mean in some cases? i.e. like with `CLIPPY=1`?

Ah, nevermind. I was looking at a stale object file. If there are no
exports, we should obviously skip gendwarfksyms.

For C objects, we use nm to check for __export_symbol_* symbols
before we attempt to generate symbol versions (see gen_symversions
in scripts/Makefile.build). We could do something similar for Rust
objects too, or just bail out early in gendwarfksyms if it's passed an
empty symbol list.

The trivial patch below should fix the issue.

Sami

---

From d1a4096cd328beae3323a1beb207c7cb5e770770 Mon Sep 17 00:00:00 2001
From: Sami Tolvanen <samitolvanen@google.com>
Date: Sat, 8 Nov 2025 04:26:10 +0000
Subject: [PATCH] gendwarfksyms: Skip files with no exports

Don't attempt to process files if we have no symbol versions to
calculate.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/gendwarfksyms.c | 3 ++-
 scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
 scripts/gendwarfksyms/symbols.c       | 4 +++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 08ae61eb327e..f5203d1640ee 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -138,7 +138,8 @@ int main(int argc, char **argv)
 		error("no input files?");
 	}
 
-	symbol_read_exports(stdin);
+	if (!symbol_read_exports(stdin))
+		return 0;
 
 	if (symtypes_file) {
 		symfile = fopen(symtypes_file, "w");
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index d9c06d2cb1df..32cec8f7695a 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -123,7 +123,7 @@ struct symbol {
 typedef void (*symbol_callback_t)(struct symbol *, void *arg);
 
 bool is_symbol_ptr(const char *name);
-void symbol_read_exports(FILE *file);
+int symbol_read_exports(FILE *file);
 void symbol_read_symtab(int fd);
 struct symbol *symbol_get(const char *name);
 void symbol_set_ptr(struct symbol *sym, Dwarf_Die *ptr);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 35ed594f0749..ecddcb5ffcdf 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -128,7 +128,7 @@ static bool is_exported(const char *name)
 	return for_each(name, NULL, NULL) > 0;
 }
 
-void symbol_read_exports(FILE *file)
+int symbol_read_exports(FILE *file)
 {
 	struct symbol *sym;
 	char *line = NULL;
@@ -159,6 +159,8 @@ void symbol_read_exports(FILE *file)
 
 	free(line);
 	debug("%d exported symbols", nsym);
+
+	return nsym;
 }
 
 static void get_symbol(struct symbol *sym, void *arg)
-- 
2.51.2.1041.gc1ab5b90ca-goog


