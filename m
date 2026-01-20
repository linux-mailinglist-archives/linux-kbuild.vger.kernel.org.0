Return-Path: <linux-kbuild+bounces-10743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNGZHs2wb2nMKgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10743-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:43:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46247D95
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D991696BFEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 16:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7F6450904;
	Tue, 20 Jan 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="delh9usl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A4244E047;
	Tue, 20 Jan 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925423; cv=none; b=DFxnm0A0ev6mTIwjmYoQ4N8a8xxMIB7Z1f3j2t8lT17JUDsvS7vs+5mHeMsCA7e7mVDwc+u7Z/mcX31AfWW/PjIcWYVd4xCzwOA9R+F8SuTv5o3AgoVJX30wEl642fKAArhhUO8frNx14DwJy1NcC/Z0bwuYY5+XQ4GTHn0GX0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925423; c=relaxed/simple;
	bh=btEO9RulEhSLDMJRVOeryO18ZSTkaALOm5HN7iiO/TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPf6I8gSNKi3MUg8C/XQzFFddAPI2l0aMC0SiuBMfxHn8F70SACQ1YVHjny75R2um+YQ3UObOr+kAeKpS5VH7/dBv6Bb+kTeI/VHhbauYNCKLoE6YhS2nuZH+hxcqo9z/bGxLrg0SCFZv9Q+NZJo5VviRMOG2MxScutPZEub/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=delh9usl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6925C19425;
	Tue, 20 Jan 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925423;
	bh=btEO9RulEhSLDMJRVOeryO18ZSTkaALOm5HN7iiO/TY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=delh9uslGRnvyRTZCfJl6RdMaeaS0HQsAxTDuqhR2U1nATJQB3+M54LB9GYtAVzAK
	 MJALN6sfuhSvn4UynSMu1DZOHXlMuWck2+L5Nzs9+Q6N91uNUc5CPyqXaS/VE9Qdo0
	 /daRqR78yw7GZ2M76H/Vok/0SoImLFvNLY+rFn0LvSFLyWAHdC3pwFgxjEkJeJEDnC
	 fZjIHoadRcIQ4yrdXUHLgMa7vojAuWe7SkgeU3QRm//HNyqGHHS3IxcHjptfuF59Xy
	 do+qF9a0i38CBJ4q1VLNmZoTy25G+CjFUmaRct7AKRZ3QZ5ZqmTr/4sYuYMpd9VE/A
	 17qPhsRKUckHA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 11:10:10 -0500
Subject: [PATCH v2 1/2] rust: kbuild: extract configs for reuse
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-rust-analyzer-pin-init-duplication-v2-1-a1c76f0d3bef@kernel.org>
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1768925419; l=4142;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=btEO9RulEhSLDMJRVOeryO18ZSTkaALOm5HN7iiO/TY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCB5yIFEVNs1A0lIlWjcpYldVdxmD/+Bm7vNJIJw9cNNaYeYik2kxFgiVkKtBzzBMmWd04XALmV
 6vKlYKC9/8wU=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10743-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1F46247D95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce `pin_init{,_internal}-{cfgs,flags}` and pass these new cfgs to
`generate_rust_analyzer.py` to reduce duplicate information.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/Makefile | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2461c5835a7e 100644
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
 
@@ -570,6 +583,8 @@ rust-analyzer:
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
+		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
+		--cfgs='pin_init=$(pin_init-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
@@ -642,8 +657,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
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


