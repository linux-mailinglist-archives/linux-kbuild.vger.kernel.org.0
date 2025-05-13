Return-Path: <linux-kbuild+bounces-7093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E130AB52A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 12:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D8A1B66F62
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71274253933;
	Tue, 13 May 2025 10:14:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B46125393D;
	Tue, 13 May 2025 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131272; cv=none; b=Ie3TDpRoLqAlCxxIsKpDWWQ8vwAvIdYLg1n3JhFR9oV5pb2XoWhKhZNKMkB91V6EePFORfoDHIGc7g0pIyg5ba1UFKGXMIm98QDF6oY3fjLBXCa6FZLfCoIKwKkSbl6s3o7PLWK+Tn2vQMRfa9FYHRpW5RCWfU+iJzdlE1KlUQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131272; c=relaxed/simple;
	bh=OJ5FIOcpAaEVIMWQCdFSHi7h7oeCiUO0xWA9T+9LplE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RE48ZNof8otdqo5FSTcl+iMTkbvEopVshFr/3sOWTbTu48msIMrskW0uJtzRNH/wXflFIwJiUdtygo5OwUY7VG9i73Hzvbx8dSgfQYY2c4xtREJ8vWCMsxqGmSSI+tqsLThfnoMOqbFMFWBgSmVnE9poG6B7l6YYEDjggZekQ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
X-QQ-mid: zesmtpsz3t1747131226td9801c64
X-QQ-Originating-IP: jCZAM53cAG3vpG/2hV17YiSk1mUo2IDzWNaEy81zy9Q=
Received: from localhost.localdomain ( [114.212.81.69])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 18:13:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10312789656265926078
EX-QQ-RecipientCnt: 17
From: Xizhe Yin <xizheyin@smail.nju.edu.cn>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	xizheyin <xizheyin@smail.nju.edu.cn>
Subject: [PATCH] rust: rename expanded Rust file extension from .rsi to .expanded.rs
Date: Tue, 13 May 2025 18:11:06 +0800
Message-ID: <9AE2FD1B8A570866+20250513101106.28584-1-xizheyin@smail.nju.edu.cn>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OccmtviHNKX2I3Js/cjybR17nTMAqvWiuY3pXrUbNdi9gb79GaHieZt6
	AZoLRKgYHcru6S/4/Ghr+I1/oXU16568Zjl8WSeUwaQRU3lnOeT6J3FGXNxctu7/vRapQC4
	V4aiOV9obIEs4FCkI4pxLVq0i9mAraeoNO/YS/huD+JvdRCobYbCjVjxyDqKKBMz4ldHsCs
	fA5dAr7xud2FsaFmOMVAq2sFFYcGeQP5osUi2YnfoNfNy5giwUYsy86c2WM6fjC018UVStc
	Luw0o4radhiFK3XbOtbYaeln2cHvi+aVr32MVRfKLBZZO1bZ5Pkmylj5L6ucNMOwNDfNGeD
	eHoBZM7XkEPb2ku5XW+2l3gncqiMMtjU/IB81E9SvdoKEQZAfKba707Sj+I1gObzUWlSHtM
	mW+0NccANLbHSO9g8793z+kIrMxKfQoWNMjusW82mWJ5c5szSobfwoqJlWJBZc4mPfmZ+vk
	WAf3Qd5dOj8naSyp8Rk/aUtja1ETH0adR5UAJ2xN9mZ3gKDQC2Nn/AtrTExFBc42RrgUHL6
	MOCUy0To2+ftuiSAsT7LhuAYK3lx0xz6lyUP8WAs3JRYfzNQcURcIp0jxCLSB96g4krSzcJ
	KdNhqvSMD64zzHoowjItpGPTGnHad8A1t4UyfIuOslX4W6r8rOH7aBAXWsJsHURiwvoTDEK
	9LOor3rRjqeVUFq5T+ni0Wf+iUuQPhxuAAe6VP4CBwPZ4H7EI1whXFXbzt7es/W87geapW/
	OMntahrKkcHCztKjjVgNonvuhlXO884SRgsK5RQB2RflBXA2b6FwvInkPp1toXSR3QZE5YA
	S4hBnjjqI3Lw8tjviGLE3cdabsjtmejDnwknyhfG9fx8svGLadebya2tYFfRPHzdBl5XmA+
	xGe4sWCbR8vxJpO0SrdUWyGq0OqfvrYlfIVr3O+SPurKrSDrMykXUrj8inK3GOzJB132X5F
	ISXHqGPjH/OgJjFYMk5t57F3WOGdrbsI11Z6pWyO7hQt8JIwBugzMBwa/
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: xizheyin <xizheyin@smail.nju.edu.cn>

The build system currently uses .rsi as the extension for expanded
Rust files. This extension comes from the C/assembly world and is not
recognized as a Rust file, making it both unintuitive and hard to
remember.

Rename the extension to .expanded.rs, which clearly indicates the file
contains expanded Rust code. Use source file basename for --crate-name
to prevent rustc from treating .expanded as part of the crate name.

Link: https://github.com/Rust-for-Linux/linux/issues/1158
Closes: https://github.com/Rust-for-Linux/linux/issues/1158
Suggested-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: xizheyin <xizheyin@smail.nju.edu.cn>
---
 .gitignore             |  2 +-
 Makefile               |  6 +++---
 scripts/Makefile.build | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/.gitignore b/.gitignore
index f2f63e47fb88..c6786f5d5d24 100644
--- a/.gitignore
+++ b/.gitignore
@@ -42,7 +42,7 @@
 *.patch
 *.rmeta
 *.rpm
-*.rsi
+*.expanded.rs
 *.s
 *.so
 *.so.dbg
diff --git a/Makefile b/Makefile
index 64c514f4bc19..443719123eb5 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 outputmakefile rustavailable rustfmt rustfmtcheck
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.expanded.rs %.s %/
 
 config-build	:=
 mixed-build	:=
@@ -1714,7 +1714,7 @@ help:
 	@echo  '  rust-analyzer	  - Generate rust-project.json rust-analyzer support file'
 	@echo  '		    (requires kernel .config)'
 	@echo  '  dir/file.[os]   - Build specified target only'
-	@echo  '  dir/file.rsi    - Build macro expanded source, similar to C preprocessing.'
+	@echo  '  dir/file.expanded.rs    - Build macro expanded source, similar to C preprocessing.'
 	@echo  '                    Run with RUSTFMT=n to skip reformatting if needed.'
 	@echo  '                    The output is not intended to be compilable.'
 	@echo  '  dir/file.ll     - Build the LLVM assembly file'
@@ -2011,7 +2011,7 @@ $(clean-dirs):
 clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
-		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
+		\( -name '*.[aios]' -o -name '*.expanded.rs' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
 		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index da2d720c964a..77b4a54ae2eb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -244,7 +244,7 @@ rust_common_cmd = \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
-	--crate-name $(basename $(notdir $@)) \
+	--crate-name $(basename $(notdir $<)) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
@@ -267,13 +267,13 @@ endef
 $(obj)/%.o: $(obj)/%.rs FORCE
 	+$(call if_changed_rule,rustc_o_rs)
 
-quiet_cmd_rustc_rsi_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_rsi_rs = \
+quiet_cmd_rustc_expanded_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_expanded_rs = \
 	$(rust_common_cmd) -Zunpretty=expanded $< >$@; \
 	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@
 
-$(obj)/%.rsi: $(obj)/%.rs FORCE
-	+$(call if_changed_dep,rustc_rsi_rs)
+$(obj)/%.expanded.rs: $(obj)/%.rs FORCE
+	+$(call if_changed_dep,rustc_expanded_rs)
 
 quiet_cmd_rustc_s_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_s_rs = $(rust_common_cmd) --emit=asm=$@ $<
-- 
2.49.0


