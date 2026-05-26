Return-Path: <linux-kbuild+bounces-13342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI/QKbLZFWpYdAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13342-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:34:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F65DABD7
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 19:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5386B3024A18
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 17:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E99140B6EE;
	Tue, 26 May 2026 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OKJKYxFB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE66409129
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816574; cv=none; b=sq0iht7Wi6yDYyoPej1PQ/wcCvo9O2YdSiof1LkNqhNdysRW7KOvj8741L9jaSY81xAqWWUrCgvi2PPoGEXTgd354ONTxdJGU/egiXe5MJKkcKMfHlMI4oQWAC0dkCUvf4kZ2KvT91ThJdJ0V3VoUT/a80xVwRmyHpr6eFuALmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816574; c=relaxed/simple;
	bh=TZMl/vbynpYCMuoy+zlBxwb8SZbk6c3T9r8Vgf0xHtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SYkhcG8eWuA5ro6T9b0JZefMg/Pk35cOiJL8WjI1YyerLwl3z6zBEyYw37yKAYFHvDkNe7RMUFACAVm9FFU/Ugumc4cUyAUa/hKyBz7Y/CsJ17wLGS///iI8KCrPxX4UL3VaF8d2m0jaTIBtS/uop0lLkh6JL+aTeO5wu5qXxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OKJKYxFB; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1329791f18fso17112213c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816571; x=1780421371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEM96aKYd3kcaWuwa98b5ndrq8URQSfe6VJqlTBd7w=;
        b=OKJKYxFBzAlo000iuEre/Ld23uqw83BemvSLStf2ZkNb22LKGotJIgUVaklKQ12q4G
         s8tcEnHQMc1VCwtz7dMGYQfQD4HAAJOF3uGk7ERDuRBNYGLgVz/BAp0bYllnGXgewLql
         IlvmnDuCiQpy+L9IBNmYNf8GL8/QnNCHiI/X4SH87CDfgN6RpsayvVe8JB0/sYoghY1f
         svaD6up61u/VhupVZZ8UMRosa3tA7i91923K0ofGqSop6ZjeS55EguhHPhn2E3ep8uAu
         7yiqTyZrrryO+gmn7GmdYAJFSWQ502kYN9H3E7Nqm4Fy7b2+8RHzd5Ou5XaUx3hO1EJ7
         lf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816571; x=1780421371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEM96aKYd3kcaWuwa98b5ndrq8URQSfe6VJqlTBd7w=;
        b=mKirShgJpN87Fo9pZywB3Yvl/7GW9njVgBH1GYHHdraDXQBEJSZYXqA+A3i64vTYIs
         HJ5lYKdH8zFYEsLFrnG/eAqdN09ETcIpaC+R+yzvOTvkOrDI6APneuhNeVnxmUPKQYbj
         VQyfXfT0NForB6ie+i4FpzfoocqEEwHXzwB6f3mB7x5H+58QCIgHpk5gkqf3u1UIHy+/
         jEkOJRn7R5eAgMG7duYowfkLhoZ1TycR3ed423dv8EpMnMe7m4VDFudb1WHcfNqnd0qK
         HdMoqsIL+lCxcecdn9+WRHK8S77k4cYO/4P+6/U+LVipkt2OSPPujOXiQE4euVHdbJ6Y
         Dn/g==
X-Forwarded-Encrypted: i=1; AFNElJ/V0fdvJ2ws6Ml42g5hHt0cbzYnK86IWRJgYtMgCJMahhVZM99Xp3I4EXcMAT849uOrDmsV97+gLAvcLQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BZxWi3ANkJWCzqWj3J5Y4fvYfxzEfGPULm1xez57jBUJ8s9J
	kdfNt0EQ3oW9eN1e/0WTQSIO0Seqfht9WJ4ppP4a6tHgcCrKUF4ABNcJ4pVRukyTLXvghA==
X-Received: from dlzz41.prod.google.com ([2002:a05:7022:4a9:b0:135:e6d6:d140])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:689d:b0:127:5cd6:fa45
 with SMTP id a92af1059eb24-1365f818ee5mr8035316c88.14.1779816571294; Tue, 26
 May 2026 10:29:31 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:24 -0700
In-Reply-To: <20260526172926.2717929-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-2-xur@google.com>
Subject: [PATCH v10 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13342-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.618];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cachyos.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 647F65DABD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

From: Masahiro Yamada <masahiroy@kernel.org>

Move the build rule for vmlinux.a to a separate file in preparation
for supporting distributed builds with Clang ThinLTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Rong Xu <xur@google.com>
Tested-by: Piotr Gorski <piotrgorski@cachyos.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index e27c91ea56fc..0fce9557a115 100644
--- a/Makefile
+++ b/Makefile
@@ -1291,7 +1291,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1300,16 +1300,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := y
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
-quiet_cmd_ar_vmlinux.a = AR      $@
-      cmd_ar_vmlinux.a = \
-	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+PHONY += vmlinux_a
+vmlinux_a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_a
 
-targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-	$(call if_changed,ar_vmlinux.a)
+vmlinux.a: vmlinux_a
+	@:
 
 PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
new file mode 100644
index 000000000000..9774f02b43b2
--- /dev/null
+++ b/scripts/Makefile.vmlinux_a
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.a
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+# Link of built-in-fixup.a
+# ---------------------------------------------------------------------------
+
+# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+targets += built-in-fixup.a
+built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(call if_changed,ar_builtin_fixup)
+
+# vmlinux.a
+# ---------------------------------------------------------------------------
+
+targets += vmlinux.a
+vmlinux.a: built-in-fixup.a FORCE
+	$(call if_changed,copy)
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
-- 
2.54.0.746.g67dd491aae-goog


