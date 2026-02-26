Return-Path: <linux-kbuild+bounces-11448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I0FJdJpoGk3jgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11448-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 16:42:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BA1A8F99
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 16:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC4F231519A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 15:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB2237D101;
	Thu, 26 Feb 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ou2f0VIo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A8C2D97AB;
	Thu, 26 Feb 2026 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119303; cv=none; b=nMRuNPHIpEbBLO7jaOTdebiNukGj+76d2PCbdEXzGeodkWZbhYxpMFzlEUe1YvFBEHkQsOBo5Pf/MCWin/Bi85/iDllFKKdfbW/n9dy7aQnT8aUU7sN9Uh4xhGb1656Q6D/vemPLyBAXvKqlbH5Yvvetmu5aVY0k25vy9thfvkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119303; c=relaxed/simple;
	bh=hviR1dAoSAY8ZPtlKH4cV8WO3Hfu3pXsCXDU+8eNRgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QahmLeXddjwHhDac/WG8PVomkZq2pa5no0oW3KjkxYT6Yz6TA12q0hxXvBuL6mA6An/tPG/eqx0sm60DBxrNecK+YkhEny9puynGnmXyyuIFYHxQYPz0FNsQcX94o4MjFxHzFdkXlMdrNCdg1UlwTC//YsJizLJCAiPodSBMHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ou2f0VIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087B3C116C6;
	Thu, 26 Feb 2026 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772119303;
	bh=hviR1dAoSAY8ZPtlKH4cV8WO3Hfu3pXsCXDU+8eNRgo=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=ou2f0VIoFpluvzvVYnA42wUYiv7ZhC58OZQ6LNP5ZCHw1b/WbVfBBQw0mSF6PeSCd
	 SuZOZkIX815KcZxZ2TwVT2XTJoLdPVfbHcRyoqWfuW6J3MisNXdf0Knz78AHGStMtZ
	 7nnl2tYXLdnUhz5HRdKTPNyIJiCNHakFueSOtOdMIDCC/giU8L+yzZk88Y3flhpMHV
	 rWjXemp2xs1JtAVoVGB+mvW1Rr+Y94ZEzDRuT2B80FFsRZ5TAD/1dVU/lkwxz2qPTc
	 T7SyX/vXyb1aiQvWPr6x8bPqUp4TGvvwAyXVXw8zNzt5Trfi71I8XASaji3q1udd3I
	 AjKp1Mj5EbBNQ==
From: Gary Guo <gary@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh=20?= <linux@weissschuh.net>,
	Janne Grunau <j@jannau.net>,
	Asahi Lina <lina+kernel@asahilina.net>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: build: remap path to avoid absolute path
Date: Thu, 26 Feb 2026 15:21:11 +0000
Message-ID: <20260226152112.3222886-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11448-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,garyguo.net:replyto,garyguo.net:email]
X-Rspamd-Queue-Id: 9E0BA1A8F99
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

When building with a out directory (O=), absolute paths can end up in the
file name in `#[track_caller]` or the panic message. This is not desirable
as this leaks the exact path being used to build the kernel and means that
the same location can appear in two forms (relative or absolute).

This is reported by Asahi [1] and is being workaround in [2] previously to
force everything to be absolute path. Using absolute path for everything
sovles the inconsistency, however it does not address the reproducibility
issue. So, fix this by remap all absolute paths to srctree to relative path
instead.

This is previously attemped in commit dbdffaf50ff9 ("kbuild, rust: use
-fremap-path-prefix to make paths relative") but that was reverted as
remapping debug info causes some tool (e.g. objdump) to be unable to find
sources. Therefore, use `--remap-path-scope` to only remap macros but leave
debuginfo untouched. `--remap-path-scope` is only stable in Rust 1.95, so
use `rustc-option` to detect its presence. This feature has been available
as  `-Zremap-path-scope` for all versions that we support; hwoever due to
bugs in the Rust compiler, it does not work reliably until 1.94. I opted to
not enable it for 1.94 as it's just a single version that we missed.

This change can be validated by building a kernel with O=, strip debug info
on vmlinux, and then check if the absolute path exists in `strings
vmlinux`, e.g. `strings vmlinux |grep \/home`.

Reported-by: Janne Grunau <j@jannau.net>
Reported-by: Asahi Lina <lina+kernel@asahilina.net>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Per-call-site.20data.20and.20lock.20class.20keys/near/572466559 [1]
Link: https://github.com/AsahiLinux/linux/commit/54ab88878869036c9d6620101bfe17a81e88c2f9 [2]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes since v1:
- Restrict remap scope to macro only
- Add to RUSTFLAGS instead of adding directly to scripts/Makefile.build
---
 Makefile      | 3 +++
 rust/Makefile | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e944c6e71e81..f6a54bf1db00 100644
--- a/Makefile
+++ b/Makefile
@@ -1113,6 +1113,9 @@ KBUILD_CFLAGS += -fno-builtin-wcslen
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
+ifeq ($(call rustc-option-yn, --remap-path-scope=macro),y)
+KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
+endif
 endif
 
 # include additional Makefiles when needed
diff --git a/rust/Makefile b/rust/Makefile
index 629b3bdd2b20..9a04022643ce 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -148,7 +148,8 @@ doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rust
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
+	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
+			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
@@ -334,7 +335,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) --test $(filter-out --remap-path-prefix=%,$(rust_flags)) \
+	$(RUSTDOC) --test $(filter-out --remap-path-prefix=% --remap-path-scope=%,$(rust_flags)) \
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \

base-commit: 877552aa875839314afad7154b5a561889e87ea9
-- 
2.51.2


