Return-Path: <linux-kbuild+bounces-4329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDBA9B150E
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 07:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E4E1F21DDD
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 05:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166DE17BB07;
	Sat, 26 Oct 2024 05:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tV8Tmlu+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230B17D8BF
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Oct 2024 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919666; cv=none; b=AJCwHxWKcrgKl0wsHesMIMnoIbr2siGS+KNczjiyn9Zo2QjnWY6+DKABdA0wERdhXS2fZDXb+LUtYTaf6vSoTRl7YtLDFSeg2o+uWfeg0dYAgZNj3y/AP16/Lq9XGOpd92FNlOQour2RfOQbgC/2LkMdaqxx0FVyvO4Y6FhaxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919666; c=relaxed/simple;
	bh=tzMXMzN/wgMUOmEGyjDqmLEvBh2AhaCjj6RzEgw1Vr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bOi50Mb5YGGLbipM82JXAQaKooKPESYT7CWVtbpgTdRS44FaAudVpRqJljp+N3aOjolLhveEqO+VcQ4K0KZPDn8RUjTUICuSkBl8rndrhbz/T+VZQ3ZFjyHJ2Zi9NI8SkCX3Zai87u+IO9qXpgQuvxrktBsa3P4GtLozIiwgFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tV8Tmlu+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e59dc7df64so33519447b3.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919661; x=1730524461; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u2CNgeIiMQMsQ3BQwy/JhDpCL0QGG7OlUJ2Ao2DLrpQ=;
        b=tV8Tmlu++RiNzMQDeOZFi1Hl/KAkGycV8oaWMAKribDkXYXF95YLFFjmvCRxxYj0c7
         /AfBeD8rL3Ka125fCGaVFI+RTc1hJ6tqpWtNtk4tnPZogwtnRqch9cIc8x3UORE+gxS8
         ceki0B53vmE6b3wDv7GklO3oRM/UlN3xdpXwfm9xAEIUikhnsCoud9CYM1tk4pTrcdgU
         tO8luHCp+D0+8OfaQWGzgs4YZOvN58C+YDbBpSdwE9w4XvJ+CrD6wRdfk4SJ3TnHP0MH
         U23T80G1BzFimn8qyVP6K7JrJUH2lV1OZtVyiDtkZbxepI6RvliFsOBsZ5BhaUX7OjyM
         BAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919661; x=1730524461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2CNgeIiMQMsQ3BQwy/JhDpCL0QGG7OlUJ2Ao2DLrpQ=;
        b=KY5YkyIAORz+q13VzwlYJcwm3w6xg0DWVfS1fi1U3SZp5GAWQ5Ns8p62s7h1jAixLJ
         zYDSMVcGgsHg0ncIL8w8ShMroTkJcfagXTRgvzk+Y7gq9qvRtz4IaXxn+B+6gkrP9sr8
         ErMtaU5+DnDLu7e9XD1c+ays5DMpO70IBuX+c9FZ73z1L3D9HSONY+bNlBjvBgDjl0NN
         byWCQwvR+8DF8s1SfR1xXFktKabbnlRie8/U/oKJ4j0beccc4Ii4TVAG+9q2WT57pE9i
         eViAdGGQPCpHluXQyRHFlM+mVb8Ymi+yh48NhKHPNgen5qtOiyj4lMbxorLJUk7wXbxO
         dB/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJCO0jPh2ZjJ8ZYBmZnEEQsuvTsN7/TFCfbfZ0qnK0YUbIirLT+E8wTsNnhef6CL4Xc78K9ia0faqQzQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YywSgONxLdT5sQVx8FRnPFYB3w0wy4az3tAFVhgqfYefIszJLAC
	mdUxCw+tBCcThKBHf2Ng5CN+ZSB5OXkTZE5httPagJJNIMGyDsaxXD236W8utKb0Jw==
X-Google-Smtp-Source: AGHT+IG4wzkxOGVXqJpc/NqCJl7J1Bo+g7i9iACOlnzSbC72EPPc9/I9m6FoCmV9xT7sOQL/GxBtQGI=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:82c:b0:620:32ea:e1d4 with SMTP id
 00721157ae682-6e9d870c0e4mr333647b3.0.1729919661525; Fri, 25 Oct 2024
 22:14:21 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:06 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-5-xur@google.com>
Subject: [PATCH v6 4/7] Add markers for text_unlikely and text_hot sections
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
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add markers like __hot_text_start, __hot_text_end, __unlikely_text_start,
and __unlikely_text_end which will be included in System.map. These markers
indicate how the compiler groups functions, providing valuable information
to developers about the layout and optimization of the code.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: Ie7688587adf89a14661ceca108680903b546d5d9
---
 include/asm-generic/vmlinux.lds.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index fd901951549c0..e02973f3b4189 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -549,6 +549,16 @@
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#define TEXT_UNLIKELY							\
+		__unlikely_text_start = .;				\
+		*(.text.unlikely .text.unlikely.*)			\
+		__unlikely_text_end = .;
+
+#define TEXT_HOT							\
+		__hot_text_start = .;					\
+		*(.text.hot .text.hot.*)				\
+		__hot_text_end = .;
+
 /*
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
@@ -565,9 +575,9 @@
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
-		*(.text.unlikely .text.unlikely.*)			\
+		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
-		*(.text.hot .text.hot.*)				\
+		TEXT_HOT						\
 		*(TEXT_MAIN .text.fixup)				\
 		NOINSTR_TEXT						\
 		*(.ref.text)
-- 
2.47.0.163.g1226f6d8fa-goog


