Return-Path: <linux-kbuild+bounces-9747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BD5C785F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 11:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 819A54EEE10
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD80531B124;
	Fri, 21 Nov 2025 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCNKWJNW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047B30E823
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719270; cv=none; b=RoP76A2rJEiKIXRnB5ypazJQjqu33KdYxp93Ei0oaSa++7VoMAV0dICC6+e0pZNHg17BoFLr+SZXq/OIx8A6BBsurNRCySfo3I1spznnLvt5zu3FIV8rDydDvNyMuJ4SPnZPs5HvNJSdg16z19YYI9zFGIovy0CmpKnvpFdihgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719270; c=relaxed/simple;
	bh=Cka2pXkveMFbrHgxTTmCWcgccG7G3JtklVVdOgKNGMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LApr5/nQAnqM52g2tJMVzo3bJpR7qogrbllnarpKSiad2mmD0FsxPXEXLqCQIZolFo3JEtfqrQRorSvTRs88xGfAdwR16yDTitmW+AA0NmhUqBPAzn/5NNkO/0yo6egKKhpCBRe/BBeoqNyqOoLGzM5wgGvHgKwlmxbrPROWIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCNKWJNW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xs9hFXjxHYcZUclg4NlpbaDnMsr/N1ltxM2HK/AdDKg=;
	b=cCNKWJNW6odus6hH10/oUoL0yhWKWcePSgpy4nVwWwmutujkxn3ONC6aATZAH73V3kerGq
	0dtgsrNoB1gi3WhoQAuiqxmgnBEomlWo+lM+ybYui4HGXvE/EM/pQkEuz3V/4tlWV/eAUy
	Rhd/RlAIHnf+lajT8nAXA8wdRFJ94oY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-FZzLDDgsNCOYi9GiTjyANw-1; Fri,
 21 Nov 2025 05:01:02 -0500
X-MC-Unique: FZzLDDgsNCOYi9GiTjyANw-1
X-Mimecast-MFC-AGG-ID: FZzLDDgsNCOYi9GiTjyANw_1763719261
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D859B1954B06;
	Fri, 21 Nov 2025 10:01:00 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5758A1955F66;
	Fri, 21 Nov 2025 10:00:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	linux-alpha@vger.kernel.org
Subject: [PATCH v4 1/9] alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers
Date: Fri, 21 Nov 2025 11:00:36 +0100
Message-ID: <20251121100044.282684-2-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
References: <20251121100044.282684-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/alpha/include/asm/console.h     | 4 ++--
 arch/alpha/include/asm/page.h        | 4 ++--
 arch/alpha/include/asm/pal.h         | 4 ++--
 arch/alpha/include/asm/thread_info.h | 8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
index 088b7b9eb15ae..1cabdb6064bbe 100644
--- a/arch/alpha/include/asm/console.h
+++ b/arch/alpha/include/asm/console.h
@@ -4,7 +4,7 @@
 
 #include <uapi/asm/console.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern long callback_puts(long unit, const char *s, long length);
 extern long callback_getc(long unit);
 extern long callback_open_console(void);
@@ -26,5 +26,5 @@ struct crb_struct;
 struct hwrpb_struct;
 extern int callback_init_done;
 extern void * callback_init(void *);
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* __AXP_CONSOLE_H */
diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
index 5ec4c77e432e0..d2c6667d73e9e 100644
--- a/arch/alpha/include/asm/page.h
+++ b/arch/alpha/include/asm/page.h
@@ -6,7 +6,7 @@
 #include <asm/pal.h>
 #include <vdso/page.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define STRICT_MM_TYPECHECKS
 
@@ -74,7 +74,7 @@ typedef struct page *pgtable_t;
 #define PAGE_OFFSET		0xfffffc0000000000
 #endif
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #define __pa(x)			((unsigned long) (x) - PAGE_OFFSET)
 #define __va(x)			((void *)((unsigned long) (x) + PAGE_OFFSET))
diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
index db2b3b18b34c7..799a64c051984 100644
--- a/arch/alpha/include/asm/pal.h
+++ b/arch/alpha/include/asm/pal.h
@@ -4,7 +4,7 @@
 
 #include <uapi/asm/pal.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern void halt(void) __attribute__((noreturn));
 #define __halt() __asm__ __volatile__ ("call_pal %0 #halt" : : "i" (PAL_halt))
@@ -183,5 +183,5 @@ qemu_get_vmtime(void)
 	return v0;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* __ALPHA_PAL_H */
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 4a4d00b37986e..98ccbca64984c 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -4,14 +4,14 @@
 
 #ifdef __KERNEL__
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/processor.h>
 #include <asm/types.h>
 #include <asm/hwrpb.h>
 #include <asm/sysinfo.h>
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct thread_info {
 	struct pcb_struct	pcb;		/* palcode state */
 
@@ -44,7 +44,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 
 register unsigned long *current_stack_pointer __asm__ ("$30");
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* Thread information allocation.  */
 #define THREAD_SIZE_ORDER 1
@@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 	put_user(res, (int __user *)(value));				\
 	})
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern void __save_fpu(void);
 
 static inline void save_fpu(void)
-- 
2.51.1


