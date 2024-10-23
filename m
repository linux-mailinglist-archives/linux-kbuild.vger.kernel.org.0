Return-Path: <linux-kbuild+bounces-4303-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E19AD7FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 00:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 909F6B2193E
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 22:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EFB1FF60C;
	Wed, 23 Oct 2024 22:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KLUhPZN6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F92200106
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723476; cv=none; b=ErG3/lhhkZPCbdWQFnP0y/uIo+pkJlE8OKGzoI4S61uDhgGCqindR2aIox7YrrJBPb4DAf/3XanhxRuc7dVgthiAoL6+DCVhFv0l0/eed6FaplfOWEaBlOIW2rdCHJvmBoHF/uFZ6HPKE9UxB/LqhagDDpf1vrBgGb2ztB+6dMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723476; c=relaxed/simple;
	bh=3Jbi42B7MMxAUyKySYJN1PoZK89JNHXGH1zqEMYynH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X4kMjnrDPD3dOWXgzJBJJZVbagXLgUIdw7xM4nSg0aBUMNNGCXMl4GUQXKA4r5xoRfCsBL9qYclxqo/sR6hITCqwopU2kb4zjIFObvTqkA1XjtMKJz1VGMFAxVveoRZ9deUdqClAmEyteAtfXf+GwaLQ+6cKNDXJpI6x7icwBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KLUhPZN6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02b5792baaso657628276.2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723473; x=1730328273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIBp2l/GHqrPAEiRmUPoNj56KvivSq7/gCNmPiHnCkQ=;
        b=KLUhPZN6DV9Hd9UqMa1zDYB9gkvHDkhkFHJanhWde2Zgn8NB/Z62e+tJBn7H6OmZY2
         /Ozku0bl10cRLzBclPUQ725CW/xdhykoDl+xRbI9DJzKwexOjjDId79+PUABo8LdGgSQ
         tNdps3fuS1Ucj7Gm+kj7/r31NYCxL3wW25XhgyFZEyseB1lGL5Eq6YR4p4nrWNYItB8n
         Ye+v2Zy22CQuAPc7YbSa74MJiQgAnoYI6akKX32JHd5dQhqVoRHfnvd4SdAqXT2dOSlh
         1NmDNpjVPbR2QbdSeG2pF6MzhMGrnugTxeOP6LPt4OmZV8D6VYjZB/ywfM0pOGIQOJpP
         K/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723473; x=1730328273;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LIBp2l/GHqrPAEiRmUPoNj56KvivSq7/gCNmPiHnCkQ=;
        b=Emh/IWpUGPeBXhcp0K20kIEq885PvEu4kRbkmpDNh1EhJcRT7EBahn8eHrOBSyAzHh
         hLnSs95GiCblTynf8ITLJ2hHUhzpnDRTlI/i+44NpPm0877on/Jv+UTcYz1o5bT4cLO5
         Z0nEQgx01swryeTA04QDNo7BgJV8hYfRTr5XvHKxwxrIKx3md9zx7YKcGSAWaui0NMfF
         FA2GA5U/ubjjC77nEK9aecsyK+KsTkDxhtj4YldPoe0RyrlSfhQ4SPG9omkPEE9/S7uU
         erZqgZdQ5KOCvEH3d0jvegbvgolUCRBI3D+eDy3TvvT/3wsOKkfhepnYPADT3GefdjED
         DLtw==
X-Forwarded-Encrypted: i=1; AJvYcCVeYHqk2de7Td4qwiabZIk2MJGCWBuq3BvGOPe23jLjaemetPxeypNHOCFH8FEg7K3LXVE1mviNzWPo59o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjG8uL1+I3o4rMJPoND5iKAicHi9XiAN8r0EY6o7k0sk8Sn9ky
	CbwVXVoxvIWsCtB9PghTmUceFs8QBNq73T/GO9xwXekRObEGv2QVyAeH9sON5QJu9Q==
X-Google-Smtp-Source: AGHT+IED6bhx75V0sSfMV/OQ93Tz4In7ZYA9aOg954NRkaZQI1kaQhNFY4eirsaXsu6I63QGL5SLgN8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:26d0:0:b0:e28:f231:1aa8 with SMTP id
 3f1490d57ef6-e2e3a60a6f9mr6900276.2.1729723472853; Wed, 23 Oct 2024 15:44:32
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:02 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-4-xur@google.com>
Subject: [PATCH v5 3/7] Change the symbols order when --ffunction-sections is enabled
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
Content-Transfer-Encoding: quoted-printable

When the -ffunction-sections compiler option is enabled, each function
is placed in a separate section named .text.function_name rather than
putting all functions in a single .text section.

However, using -function-sections can cause problems with the
linker script. The comments included in include/asm-generic/vmlinux.lds.h
note these issues.:
  =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if dead
   code elimination is enabled, so these sections should be converted
   to use ".." first.=E2=80=9D

It is unclear whether there is a straightforward method for converting
a suffix to "..".

This patch modifies the order of subsections within the text output
section. Specifically, it repositions sections with certain fixed patterns
(for example .text.unlikely) before TEXT_MAIN, ensuring that they are
grouped and matched together. It also places .text.hot section at the
beginning of a page to help the TLB performance.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
---
 include/asm-generic/vmlinux.lds.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88..fd901951549c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -553,19 +553,24 @@
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
  *
- * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * TEXT_MAIN here will match symbols with a fixed pattern (for example,
+ * .text.hot or .text.unlikely) if dead code elimination or
+ * function-section is enabled. Match these symbols first before
+ * TEXT_MAIN to ensure they are grouped together.
+ *
+ * Also placing .text.hot section at the beginning of a page, this
+ * would help the TLB performance.
  */
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
 		*(.text.hot .text.hot.*)				\
 		*(TEXT_MAIN .text.fixup)				\
-		*(.text.unlikely .text.unlikely.*)			\
-		*(.text.unknown .text.unknown.*)			\
 		NOINSTR_TEXT						\
-		*(.ref.text)						\
-		*(.text.asan.* .text.tsan.*)
+		*(.ref.text)
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.47.0.105.g07ac214952-goog


