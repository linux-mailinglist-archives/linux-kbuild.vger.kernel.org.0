Return-Path: <linux-kbuild+bounces-12812-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MI9AihS4Wl5rwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12812-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 23:18:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C44414DB3
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 23:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EACC3060216
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 21:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2860373C04;
	Thu, 16 Apr 2026 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="lZ7H2sQL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster4-host6-snip4-3.eps.apple.com [57.103.69.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418EB374721
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2026 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374307; cv=none; b=toowAxAYPs+FW5prKqCKHF/fvMMU0K7kyfu9AKZ/4nW2jbjQ5UJYHVlGF22WYqUOHyniXVKf6idkmHm0t8WRO1K5GnJMHDWhd9oqFAmlex+5MGL/1ovqrkg7RmjCzKucROqoLkFDMaPdgb5Lc1gxW83Y2G6fCWZ3MiVM0tRoZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374307; c=relaxed/simple;
	bh=zLT/cawkB3LRbgDbAr5fFVr3XdZneDxmOytjqFDzISo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxzVzjU5QAvDmvRn6HII2Rn4sL01g7NlOBKRNgngeYWel/qLISGic/nwRqI2WPTMV4mSo6lYGXDP9f07X0ljk/pEnXMz1JFE5OXipZ16pIu1Gj+Sjx/J8Kdv/H7zD7d/9BlpcmeEt7P29KidDPfo2tTNuIoUay8ZvMRhrbF3S7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=lZ7H2sQL; arc=none smtp.client-ip=57.103.69.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id CBFA918002B1;
	Thu, 16 Apr 2026 21:18:24 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1776374305; x=1778966305; bh=PmFOCuv7cR9iLJalLRCwncxDgyKdNHV9Nx+iACCmLWo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=lZ7H2sQLCN2h7jgLlE2MlfD1WQfjRcjffoUd7nuMlgoLZQeWbtsmkLGuCy/jf2g+zItVTio7WLL+bbgLCRAq5ab+xJZcJkWxYVR7ydhiiQ4Ypt8rmbdpZdB1ZOGqQBD4BowCPPoQbFZmFoefh4NmR+GIvCcDqlDm4vY+yb+K9cZqCphUbPCzvc3o0gc7i4+Q1285TA+6igLk4yk1cvhrRwRnmIj5PBFUZEOvLkFCAXr3P7LHO0r8SPFgntJa19npgeOBrKhhn561mhOrNi8+6gilaMXqduI5U1Fh+FhndH45rtQYH3HOCMJrvDzOp0h6OhuBaQy48Xtomk5N/z4N3A==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id C903F180015F;
	Thu, 16 Apr 2026 21:18:20 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
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
Cc: Mohamad Alsadhan <mo@sdhn.cc>,
	Yoann Congal <yoann.congal@smile.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v7] kbuild: host: use single executable for rustc -C linker
Date: Fri, 17 Apr 2026 00:15:23 +0300
Message-ID: <20260416211525.13847-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=e8cLiKp/ c=1 sm=1 tr=0 ts=69e15221
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=xMo8nGc7Ss9mT_xvbEoA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDIwMSBTYWx0ZWRfXxy4SYvRLoPiu
 EOZ+zFMyxWWKqMhFUfr/yc282RvGmsuLhaGD2CNRk8HL1iPRh5OxfMeyh7ZVPnTep2KmOWyX6nD
 VWOMCM7I+fuhESd2IsAGEGvxFoCmo76tDuboaMlt3GON4Fdc2CFbScal5wlVzCwDK212SVhLAYt
 Kp1Bm99r0AoHHB2dh27BK6qpu+Nj0dzUcoonoE7npbE9SGBDp26aaFbkSMNkJcJarEks0xcetLG
 JEMHVOEdgCvADmpvo+3spgbmLYm/Ds2aUJ4WYHb8L1JX9xZLZrO388nkaYwOM1HApAZ6LyNQaa5
 9mU9dyeDf6mCR69Z/XCSw5pcs7DbysWYedpp5t5WrxCga1IgYqFdIawmDCE2+U=
X-Proofpoint-ORIG-GUID: AKXlCD36pzN21CCiVp5EwkCThIRrF9su
X-Proofpoint-GUID: AKXlCD36pzN21CCiVp5EwkCThIRrF9su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 clxscore=1030 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604160201
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	TAGGED_FROM(0.00)[bounces-12812-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 46C44414DB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rustc's -C linker= option expects a single executable path. When
HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
`-Clinker=$(HOSTCC)` results in the shell splitting the value into
multiple words, and rustc interprets the additional word as an
input filename:

  error: multiple input filenames provided ...

Generate a small wrapper script and pass it to -Clinker e.g.

  ```
  #!/bin/sh
  exec ccache gcc "$@"
  ```

This fix should be general enough to address most if not all cases
(incl. wrappers or subcommands) and avoids surprises of simpler fixes
like just defaulting to gcc.

This avoids passing the user command as an environment variable as
that would be more challenging to trace and debug shell expansions.

Link: https://github.com/Rust-for-Linux/linux/issues/1224
Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
v6 -> v7:
  - Always generate `scripts/rustc-wrapper` when `CONFIG_RUST=y`,
    including cases with no Rust host programs in `scripts/`.
  - Use `$(obj)/rustc-wrapper` for host Rust programs, fixing builds
    outside `scripts/`, e.g. `samples/rust/hostprogs/`.
  - remove leading exec (again) to allow leading env vars e.g.
    HOSTRUSTC_LD="VAR=VAL ccache gcc".
  - Track, clean and ignore generated wrapper as needed.

v5 -> v6:
  - Add fix to `rust/Makefile` as well (Yoann)
  - Include script to `.gitignore` and make clean (Nicolas)
  - Add back the outer `exec` to the command

v4 -> v5:
  - Fix word splitting issues
  - Remove unnecessary `exec sh -c` and simplify generated script

v3 -> v4:
  - Use filechk instead of if_changed macro to regenerate script
  - Remove trailing space at EOL

v2 -> v3:
  - Scrap previous hacky approaches (e.g. using lastword) and go with
    a proper fix (Gary) which turned out not that complex to
    implement.

v1 -> v2:
  - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
  - Introduce explicit HOSTRUSTC_LD override
  - Warn when falling back due to multi-argument HOSTCC
  - Error out if a user-specified HOSTRUSTC_LD is not an executable

v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
v4: https://lore.kernel.org/all/20260317112021.14353-1-mo@sdhn.cc/
v5: https://lore.kernel.org/all/20260321150034.9915-1-mo@sdhn.cc/
v6: https://lore.kernel.org/all/20260331000802.380-1-mo@sdhn.cc/
---
 Makefile                          |  3 ++-
 rust/Makefile                     |  8 +++++---
 samples/rust/hostprogs/.gitignore |  1 +
 samples/rust/hostprogs/Makefile   |  2 ++
 scripts/.gitignore                |  1 +
 scripts/Makefile                  |  3 +++
 scripts/Makefile.host             | 26 +++++++++++++++++++++++---
 7 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 1a219bf1c..5ebeef67f 100644
--- a/Makefile
+++ b/Makefile
@@ -1651,7 +1651,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+               .builtin-dtbs-list .builtin-dtb.S \
+	       scripts/rustc-wrapper
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
diff --git a/rust/Makefile b/rust/Makefile
index 5eca6a817..6bc761a31 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -565,7 +565,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
-		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clinker-flavor=gcc -Clinker=scripts/rustc-wrapper \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
@@ -576,12 +576,14 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 $(obj)/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/libquote.rlib $(obj)/libsyn.rlib \
+    scripts/rustc-wrapper FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
-    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib \
+    scripts/rustc-wrapper FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 # `rustc` requires `-Zunstable-options` to use custom target specifications
diff --git a/samples/rust/hostprogs/.gitignore b/samples/rust/hostprogs/.gitignore
index a6c173da5..d88a75790 100644
--- a/samples/rust/hostprogs/.gitignore
+++ b/samples/rust/hostprogs/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 single
+rustc-wrapper
diff --git a/samples/rust/hostprogs/Makefile b/samples/rust/hostprogs/Makefile
index 8ddcbd741..9c9663a77 100644
--- a/samples/rust/hostprogs/Makefile
+++ b/samples/rust/hostprogs/Makefile
@@ -3,3 +3,5 @@
 hostprogs-always-y := single
 
 single-rust := y
+
+clean-files += rustc-wrapper
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4215c2208..b3948b148 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,6 +6,7 @@
 /kallsyms
 /module.lds
 /recordmcount
+/rustc-wrapper
 /rustdoc_test_builder
 /rustdoc_test_gen
 /sign-file
diff --git a/scripts/Makefile b/scripts/Makefile
index 0941e5ce7..287421322 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -29,6 +29,9 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
+always-$(CONFIG_RUST) += rustc-wrapper
+clean-files += rustc-wrapper
+
 HOSTCFLAGS_tracepoint-update.o = -I$(srctree)/tools/include
 HOSTCFLAGS_elf-parse.o = -I$(srctree)/tools/include
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..84fd87a53 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,30 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
                  $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
+# rustc's `-Clinker=` expects a single executable path, not a command line.
+# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"), which
+# would otherwise be split by the shell and mis-parsed by rustc.
+# To work around this, we generate a wrapper script that forwards arguments to
+# `HOSTRUSTC_LD` so that such commands can be used safely.
+#
+# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
+HOSTRUSTC_LD ?= $(HOSTCC)
+
+define filechk_rustc-wrapper
+	printf "%s\n" \
+		'#!/bin/sh' \
+		'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
+endef
+
+$(obj)/rustc-wrapper: FORCE
+	$(call filechk,rustc-wrapper)
+	$(Q)chmod +x $@
+
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc -Clinker=$(obj)/rustc-wrapper \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
@@ -153,10 +172,11 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
-targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
+targets += $(obj)/rustc-wrapper \
+	   $(host-csingle) $(host-cmulti) $(host-cobjs) \
 	   $(host-cxxmulti) $(host-cxxobjs) $(host-rust)
 
 # %.lex.o <- %.lex.c <- %.l
-- 
2.53.0


