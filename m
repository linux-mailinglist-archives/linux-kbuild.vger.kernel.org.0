Return-Path: <linux-kbuild+bounces-4302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F69AD7F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 00:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766822828C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 22:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD662003CB;
	Wed, 23 Oct 2024 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y15+4WaL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B991FF7C6
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723476; cv=none; b=C5n14/JTZVfdiw4f9O1E/qbKCWvn/qEzVWmweC/3YrTv/4l2AsP+GolOHjrmV62c02HuXTYeJmlJ3/avXGtZrnEFqdO/j+W4+pXU3Beu/JvenkIS3WimeKU5TIKn3R/JjJJ2js67Nm6uR58WKtZY1lhn83A5JURKpXPaw1n22GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723476; c=relaxed/simple;
	bh=XCT6aaTLHKjPcWknzKtL2kN2dgyL7VsWQXuDCGu+eS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gn+KQg53yBLD13+iVl6CndZCYhtC8hBhv2PNkl6nbqzMb3TJoPlEg3tk/4Orlhkz9Z91moFGISFbzaeTSlAC+tXq7t8snOtfoDWcY6lM4hV1vaHbf/q2qbDhcpSjuvwmKAg2EgJpVmYY8OpJzJPVu59QlUejzp3AwSm0BWoASRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y15+4WaL; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc60660dso571207276.0
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723471; x=1730328271; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=Y15+4WaL9f2YwCx9FobQYnPOV/9bX7RSrqLtTofv9PGFGi24GFoq3ey7XRRqj+wrT/
         VHJ/mZLyQpSqk3CdTq1b3GQ2B0QIi0zNrIo+sFgIQpY0HeKFFWBpRqVECPw8swWyN1jP
         nz6ZWttz80n6Y3ZohdQwd2FaIm4LS181iuxT00r85dECNRHU0b8ydyaHkLOG3EomeON6
         h3fKLlahVk1lO0lRDw/GHUUmIGOyMa3AlxRqy09Z8/TpLZeFVApCdJET6ye68oQZXin4
         PjKSnQiTh4nqB7utMMlbRUD3LJftCOx5FLnCvmHfF52rvF43A8OC3lb6n89iUEAwsqYV
         qsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723471; x=1730328271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=QJisZ9j+/KeDyxYaNmZGrV5Z5ExaPA1widhkPhy7XdXCuv9E1iplR+EJFXiZ0QX3OZ
         cVuUhmDrRtNGNywwx0iZ5ZqipQwf4ZuPBdDVGUuYF687HarakrMKBgtPM7xqwV6062J5
         zzo5xno+yItR8+5+t76AiyLe56pbxbI3tHXwz7ZUDK7pjMY10V0VwxbivnsngpX89222
         C8Xf1P3dTEvc2ABUHIArnCA2tuuFhiK46gx0Nm3+ycEZvf2mjci6m0RTMeF8uq/oFEVG
         ghO2DSfKWeLW/LEyh81GYQR8JBlCV6+IJZSFUh/4juCRjWXz+Md7lFUjv1YnFJeis5W7
         EaEw==
X-Forwarded-Encrypted: i=1; AJvYcCX5f2VXLc78dPYonoAmLIaWYkIvDttccD53X9ucKyNWm1QtHaYzG/Iw1PHLnyAmXdUs0UR1fpjUMl6ysM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTipg4MhJEofx12OeyNy8spSYAcWzsLrn+QGNfB9ajpiEwPlq
	wKLuYT1jkJTRTqcAEBxwBxsG1oZseQ54um8DKtWhTDJwnsSmRIB+/CwZvf8/sluYFw==
X-Google-Smtp-Source: AGHT+IFVfeyPxqRI2j0ASqUhKvoQx2zCQAV5DC4JpUQnoNgn6IsLNLrBhRCJGUXKM0TlEVsIqSS9Uj8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:b307:0:b0:e25:6701:410b with SMTP id
 3f1490d57ef6-e2e3a652cf0mr7023276.5.1729723471236; Wed, 23 Oct 2024 15:44:31
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:01 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-3-xur@google.com>
Subject: [PATCH v5 2/7] objtool: Fix unreachable instruction warnings for weak functions
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

In the presence of both weak and strong function definitions, the
linker drops the weak symbol in favor of a strong symbol, but
leaves the code in place. Code in ignore_unreachable_insn() has
some heuristics to suppress the warning, but it does not work when
-ffunction-sections is enabled.

Suppose function foo has both strong and weak definitions.
Case 1: The strong definition has an annotated section name,
like .init.text. Only the weak definition will be placed into
.text.foo. But since the section has no symbols, there will be no
"hole" in the section.

Case 2: Both sections are without an annotated section name.
Both will be placed into .text.foo section, but there will be only one
symbol (the strong one). If the weak code is before the strong code,
there is no "hole" as it fails to find the right-most symbol before
the offset.

The fix is to use the first node to compute the hole if hole.sym
is empty. If there is no symbol in the section, the first node
will be NULL, in which case, -1 is returned to skip the whole
section.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..6f64d611faea 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,17 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * When hole.sym is empty, use the first node to compute the hole.
+	 * If there is no symbol in the section, the first node will be NULL,
+	 * in which case, -1 is returned to skip the whole section.
+	 */
+	if (hole.sym)
+		n = rb_next(&hole.sym->node);
+	else
+		n = rb_first_cached(&sec->symbol_tree);
 
-	/* @offset >= sym->offset + sym->len, find symbol after it */
-	n = rb_next(&hole.sym->node);
 	if (!n)
 		return -1; /* until end of address space */
 
-- 
2.47.0.105.g07ac214952-goog


