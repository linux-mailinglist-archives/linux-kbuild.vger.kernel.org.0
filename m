Return-Path: <linux-kbuild+bounces-11980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CfKFYp2uGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11980-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:30:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603C2A0FC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5FF8304A574
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605D83644BD;
	Mon, 16 Mar 2026 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EO/RiJtr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF48364E81
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696588; cv=none; b=TYxtcQeB7+3cXQbgDEXMaiYAkY4B/OQSsuu6SnPkgl54qSed6cn3/AMq2MDhFXm8ec7Wbi41zXaJsau9aMBWly8WQiGDKxz6USorhqqp/UWfmXOwqehw/61mW1SnpcGxtMKSs0na6fvpAHSNyoIEk3YjAuJ/FQyzcZF8QujTy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696588; c=relaxed/simple;
	bh=tGb1M0tRkfKEH3KWUQR/MxlPIzxmfHf/7F+6VNuez4Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T8XrZt9W5mNJEKTHVHWu4w3juhvdrHTHFWPmQD/m1Cq0eCjc+5ktO9Zm+4NCnPFd+M4BgfQnA6/rRcXGpSClP12dMz51zIRYoycxVbJl4r+awm5WZFCz2fEL5tfQx+qNb4kmlzqo59V6lAmIwBACxaNGpkcBnhw6mQtqcd9z0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EO/RiJtr; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-127337c8e52so96099458c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696585; x=1774301385; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mA9wHqPkq9Vq1JF9PRYSj3uN1F4IR3mUOXVfm9WMuek=;
        b=EO/RiJtrfqe3T9pO2d1mshHlDE+MKv6Y8RglrX3ERWWfi01DaKgPotPQPa7S2okGzT
         R/XtxyxFNEULg6cDh3QdzC6f9TQaeN3CnIauUATM1KX5EBbXv6LBoTJ7uign2Oj1Kxq6
         PnKefC1I2rXKvWPESkrIz2nrYBuZ4aQgWR0kZWsFEdIc/ft+IodOOq0a2vTCTqnXhAS3
         VR+Lg8wcys7g6F830ocIJx8iQThasokMIaB/WKkjsiOo3a3KL6mlHTNu/tE6+mywqUFF
         NxkR6s2MgbrNfTKG5qSiRpsV8pWYVZGTzhYY6Qec2hPm2FDXPMECXbYZudTUduWK4aDs
         xobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696585; x=1774301385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA9wHqPkq9Vq1JF9PRYSj3uN1F4IR3mUOXVfm9WMuek=;
        b=Zhv3wA+23R5Qa+GLiHVJYBQ5MoJ8rIEViqokiUXFtYS1hWGkriCMyQ9Gx1CVz4qM2L
         TSspKlizu+hyHSRDrHKOFRnuuemQMqqC4lHTSDIc2Z1lvq++eAzgwfyIPa3R6RQDXk4v
         WOduuIdXiqOB0PwRLArxNOi8RZfeDTfH5fqH9ruHWhDqe8EWVonKW+7gKd7ywEH55SiP
         0go4HLzYIFZ2b3V8S38B18vdw2mbEF8dyGPZomdHElg6pdWqj8J3xrt04opqJ8Xe7jBJ
         am1Aqq7TveAGOfVi8GpcONBFx7hW9kUb2UTRXdiSYhpG7LeRnpMHRU20+nEUnP0KMCdI
         vVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JLaXbkvJiWUUKudnBSCF6h/kaJsXNysyX48Aci8o00FxzmedTE3qcJE3gh5jRyMV+OhdX8wZkMPL968=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzRg9F0GWtcKDRXVHQG4+0T0H827ks2SQeUsCCwf5SCEFnI67
	APL0pJOALVWpxjGajgsZ5ReBgNHW7jiwrmzMsIyJFYpBAPi4aWSWJWYLmmiQEihr30Wugg==
X-Received: from dleb10-n2.prod.google.com ([2002:a05:701b:424a:20b0:128:ee08:8c14])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618f:b0:11b:f056:a1b3
 with SMTP id a92af1059eb24-128f3d3f175mr8012386c88.11.1773696584848; Mon, 16
 Mar 2026 14:29:44 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:29:29 +0000
In-Reply-To: <20260316212930.120438-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316212930.120438-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316212930.120438-2-xur@google.com>
Subject: [PATCH v6 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11980-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1603C2A0FC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

From: Masahiro Yamada <masahiroy@kernel.org>

Move the build rule for vmlinux.a to a separate file in preparation
for supporting distributed builds with Clang ThinLTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Rong Xu <xur@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Tested-by: Piotr Gorski <piotrgorski@cachyos.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index c9b7bee102e8..ba5eee68d5d2 100644
--- a/Makefile
+++ b/Makefile
@@ -1255,7 +1255,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1264,16 +1264,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
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
index 000000000000..650d44330d1f
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
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
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
2.53.0.851.ga537e3e6e9-goog


