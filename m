Return-Path: <linux-kbuild+bounces-3722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E1984CD2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 894CCB22FA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7591AF4EC;
	Tue, 24 Sep 2024 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJIRtx4o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A80146D55
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212878; cv=none; b=eVQ83fTqrtUgIXSDs9oT6EjmKqliv6Bo6SQdVGY7kK+NaleihzhtH8M9JXA1SvPYM8ljplE326p0/guEMZYKeZbTxnZcVMARcobJ/EuxoGBASmRskIELiLC3N2BlQT7nSwOrLt9oJRdIX2rT5f9apHjZhlR53CLjMru1nX6kqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212878; c=relaxed/simple;
	bh=HByXTJfGaacs4MV7ivXCvJq3lGnRepYcPD/jPTnE9OU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rRBSpGIwZxKRNEb/ZxmJtFei77cjdpptjFz5WzJ9WlWdpkIcuGyhtG+vxPxKSC829R+vYp4PYBfa78LOlJemfSzGk+1QrMSHhpG6LTVJz/eCCril2Uz20VMuc2UCci+pi62hpMSCAhr/jZ//a9+yF1wgwnudGNB2RcVlwqvRPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJIRtx4o; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e1fbe2a9a2so41654767b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212876; x=1727817676; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=oJIRtx4os6rPSBwICFzoC3Fj5od1KG+aCFhFpETl2njLS+z+lTeZnQCiAUKCoJcSdE
         NjIKxXN6us74Axp9w0kkWOZ2g9gUHOcW7Oxqujp60Nveu9d4fk+uv22FRwrBc9VvKPts
         JFptWKRx4fWE0dxbAuYF8JFb+fStTDnV6O02TZKjVZssinMQdLAD5ThWDyiWUG4bGJ9S
         FJfZ0NwMr0XaXGisHbvk7LKa7U5aIZirmACT7qJHMEEjz6pBNRiJs4I48oMLZx7g0Y+G
         cMNXvJMD9ez2OePDWtBDO5A53N9qJm2G9KliZSVxJjAYkCdKMoZkZbJtrCBGpuAsx1G9
         v5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212876; x=1727817676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=fQfloDuXLaR06d/cb9Ee9kZzoEdw9QQ4NMk8UXRPJgjMOk5zasovvbuSUuREucRt2m
         sbWPKPy52tcOER9a3X6ZfR3yGx2wYwPbwSaB6+leIyUPN1q3O8sxQB3EUESNYN3Yfy4L
         Lx3HOTkY26PAyL8Mtp/lTvQhoLYUOq18ozMb15YFWzoDGM+peaUN2DXCdkkpuAJ4N78d
         73gBlBSbGxz3gcvfeg9mZ5LMaAlqYlg2U90C4Mjr41GYeT0cXOZqc6imV3qZem0CtWfp
         KOqC1nXUxy+84uAY8I9RlpzbDKnTaZCrSG+Tvo1GKfwu/lmlOganEebNJZNiZ5IfeTpn
         tFRg==
X-Forwarded-Encrypted: i=1; AJvYcCX09kbrig9ADl2bNO0uI6OwFQG3naUzBqqdNRV4XJpg0E0+JkFWdwcuclyeNtGeWlye8dTyUcfgSVbh4c4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Ak2cHFV/sQUj7vLgnD1+qPHbnsN3TyKXGf/ZdSDtDcXnxAiT
	rncLb48qBx0ecyFQC4Ma7HHCc8lk7jfjOBe9epjeBLYodDx3rAV5mHQ0ZuosQS0kUvcalLbXzy+
	l885vaQ==
X-Google-Smtp-Source: AGHT+IFFP5DGiuK9d2HIotMaqmgWna4m+vnyCwqT1jRKadMrQxmzwDlp32Uot3cmdJtoti5KKpM/kNWsOgbg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4339276.1.1727212875760; Tue, 24 Sep 2024
 14:21:15 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:57 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-16-mmaurer@google.com>
Subject: [PATCH v4 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost.

We no longer generate an error on long symbols in modpost, as they can
now be appropriately encoded in the extended section. These symbols will
be skipped in the previous encoding.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/mod/modpost.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..f8b7b793d2a2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1840,15 +1840,48 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			/* this symbol will only be in the extended info */
+			continue;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.46.1.824.gd892dcdcdd-goog


