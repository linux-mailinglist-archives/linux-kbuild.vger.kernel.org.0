Return-Path: <linux-kbuild+bounces-10895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKOqISfHeGmltAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10895-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 15:09:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C95955EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 15:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 394E6300D245
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 13:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3421335B655;
	Tue, 27 Jan 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir1msOoy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EB35B653;
	Tue, 27 Jan 2026 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522159; cv=none; b=Ea189r3ieEsBoU5/Yr5e3tHQ+rXUzWirvRV7gV2HnK31rXkTCe0obdXHq6cDFDNPEf4+8O9+JRTdjs96snTpOURASnOvb/6C4ZcLLkpNPfDU5FNzB8m13dDzstpyfD2aXb+YLKVOc4NBPJ8nl5MVpYbHmesOecCScVDujqDITgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522159; c=relaxed/simple;
	bh=8TzTu9mmFQ4jg+51JjtdxRMXvVNt8G/iW3LP00dYge0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2Gw7rIAzxxjpLeDhqKPLAU9M2mXxPgH8Cl1IDTLo/BB8pA+Mwe1sipfoF8ZyFXqE7Lo4nlqlXfIiSGjuUV/iDu1uJVn/BPakXXy63iMQR1WDA/qV++p2ZjBhnfVFYH1GVWfixCjCcszYh/rVWKViGQZtJ0+7HaUZsIS8vMUA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir1msOoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36E7C19422;
	Tue, 27 Jan 2026 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769522158;
	bh=8TzTu9mmFQ4jg+51JjtdxRMXvVNt8G/iW3LP00dYge0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ir1msOoyXL1PuoC6L3u+zkM0JYzup3vqj75SN8giwg8ti93RRQcEx/FYtPaA3qUvg
	 YDupIun6aVb606/CpWijril3jBDkjimxeFY/q10BWBk9XrXhvV51fB6HahcmmwUvYR
	 FnxdxCNRgNYSmNF+wY90JgoessyJvaiFk+Uf3v+j8LR3R4ob/ZZ8nzFJpYLKH55bd1
	 3VmGEZ5mAxkZmR3utuUOliEq2RwXfefpSzQBnCMHJpOtLJLoVHT23ewZ/36NFprP9c
	 bvjEP+ZnfKZ5VrA7pDgEuXvuev3tOk0Ni6wRB+jazZzUp+jZk8OEKKoTXQVNBzy4Gj
	 G1+x7j3t66Omw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:55:50 -0500
Subject: [PATCH v3 1/2] rust: kbuild: extract configs for reuse
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org>
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769522154; l=3718;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=8TzTu9mmFQ4jg+51JjtdxRMXvVNt8G/iW3LP00dYge0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEttgRf9ZbPuQOM1mzP0CanmFa0tQltsDX0TUgyy0WKFrTLHCtqkUi6kHs1LiGIKmZCkZiXjbOz
 4j+0rpmSBqAg=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10895-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8C95955EE
X-Rspamd-Action: no action

Extract `pin_init{,_internal}-{cfgs,flags}` to reduce duplication.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/Makefile | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..280a18617627 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -210,16 +210,30 @@ rustdoc-ffi: private is-kernel-object := y
 rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
+pin_init_internal-cfgs := \
+    kernel
+
+pin_init_internal-flags := \
+    $(call cfgs-to-flags,$(pin_init_internal-cfgs))
+
 rustdoc-pin_init_internal: private rustdoc_host = yes
-rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
+rustdoc-pin_init_internal: private rustc_target_flags = $(pin_init_internal-flags) \
     --extern proc_macro --crate-type proc-macro
 rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
     rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
+pin_init-cfgs := \
+    kernel
+
+pin_init-flags := \
+    --extern pin_init_internal \
+    --extern macros \
+    $(call cfgs-to-flags,$(pin_init-cfgs))
+
 rustdoc-pin_init: private rustdoc_host = yes
-rustdoc-pin_init: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --extern alloc --cfg kernel --cfg feature=\"alloc\"
+rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+    --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
 	+$(call if_changed,rustdoc)
@@ -272,14 +286,13 @@ rusttestlib-macros: $(src)/macros/lib.rs \
     rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
+rusttestlib-pin_init_internal: private rustc_target_flags = $(pin_init_internal-flags) \
     --extern proc_macro
 rusttestlib-pin_init_internal: private rustc_test_library_proc = yes
 rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-pin_init: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --cfg kernel
+rusttestlib-pin_init: private rustc_target_flags = $(pin_init-flags)
 rusttestlib-pin_init: $(src)/pin-init/src/lib.rs rusttestlib-macros \
     rusttestlib-pin_init_internal $(obj)/$(libpin_init_internal_name) FORCE
 	+$(call if_changed,rustc_test_library)
@@ -547,7 +560,7 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
-$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
+$(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
@@ -642,8 +655,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1
-$(obj)/pin_init.o: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --cfg kernel
+$(obj)/pin_init.o: private rustc_target_flags = $(pin_init-flags)
 $(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
     $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
 	+$(call if_changed_rule,rustc_library)

-- 
2.52.0


