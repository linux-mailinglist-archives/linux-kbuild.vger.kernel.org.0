Return-Path: <linux-kbuild+bounces-12370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KPdMcoQy2lCDgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12370-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:09:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B3362936
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C3A300E3BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 00:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F23149C7B;
	Tue, 31 Mar 2026 00:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="OfH9/Eml"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.ms.icloud.com (p-west3-cluster3-host11-snip4-7.eps.apple.com [57.103.72.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010040DFA6
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 00:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915753; cv=none; b=oUFNvtF+RDPHLMBlrpvyWzX8WI2wG3r9Miu5YYj9Xn5jqErJSRF3uJ7MrvMqsF8IgFIua/aknMmf42sBGwbHyp2qS1tIvumQGeU5/6Gzpbwri6iFZg7qJFRmNlfQmUIEonJv5126S3JA72cpkZYDKGyqnLUg5CVflwGaTqjaRqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915753; c=relaxed/simple;
	bh=dnnbJV0sTXh2CPBUsaI+ZkS6JT3vt2EoY+zkLPsiGYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRr85j+f4WDx5Yk3P5zgH72jUuZ5agdezyRTG75xOZSjVBmkgyNQyx3Vwlc6VDs8U1fuRG8Yi60Je2QcocM+M6Bw1WA3EaAFJcJ5fEM3EckfjJym8DFPB0tNWbLKDapv9xUqJFTqDHkxN7dLg1I1ia9tRPSbgvT5ihifQc9KKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=OfH9/Eml; arc=none smtp.client-ip=57.103.72.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-9 (Postfix) with ESMTPS id 5487D18000AC;
	Tue, 31 Mar 2026 00:09:08 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1774915750; x=1777507750; bh=Smne3kvEeW3OhPwYneVv7rprnRqi1ClwLKoCrpKcW6E=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=OfH9/EmldTD+p2bHHOgkNDKHiczX3APswqEe6M6BK/D5TIqUF6ljT92NYDayWtwg8J0BuSOfziW2a6vjbPevUyGOSrYbN0t9/XhG26iKZ2y7lJsmwU+DAawBu+9DW5bAoL9HEg20kd7UwjJ9nVhncCeYkbHgCniL7imT0ZYv8akDVJ831Be4K7bxzmEpc9lz41XoCeHXFhhLzdiOlHvHfODBp6uC4brGmbyCTubeMHjO/3Ax5SEoBgBO4kb+Oi1l5oVJWJvBZRPCxSS1SLxPQRqSuGYXvzjeYD6Iz3QO4VW2ArHvCjoHoojf+9+mLEO8k9qGopNqKxClqwd30GKPDg==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-9 (Postfix) with ESMTPSA id B2224180013D;
	Tue, 31 Mar 2026 00:09:03 +0000 (UTC)
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
Subject: [PATCH v6] kbuild: host: use single executable for rustc -C linker
Date: Tue, 31 Mar 2026 03:08:01 +0300
Message-ID: <20260331000802.380-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: seOAf2rxlFGUM32eJhcnyXWZcOsUjtRx
X-Authority-Info-Out: v=2.4 cv=W4E1lBWk c=1 sm=1 tr=0 ts=69cb10a5
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=1jKZnVWUeMPpqZDTVXkA:9
X-Proofpoint-GUID: seOAf2rxlFGUM32eJhcnyXWZcOsUjtRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMCBTYWx0ZWRfXyS9yr4hSqkMV
 8iLsV3EeAVX+6Gb/ySDchja6l+HFsQhmbwpEWuowA3peZWsoEu8zD4FUaes+R5vOqOqOZKMnFn5
 dEM1BlEaIEatcC2wAwBTjJ22WiG4BnVezNP8/l+cKFZH4M2NUL2rsZoshi21Yd6i2dGhoueKdrl
 0JRyQVhqQrnFjJuVYcmFyDmxozzx+bKuazMixLulLIfHigBJCgrBGi4eUUippQlOkudXU9Yi+EH
 eUGtb7Z5LDThniEuHngy2y+vpOUGAyTTz6CeQapLfvYtNsadXum5idV4i53A5TsZXm9vCeOXS28
 pSOTZoo6bz67ou3AbV74nsSxtRdD7VMX/DxpfMy+GCGMbF+o4t/gAj8/I/BL9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 clxscore=1030 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603310000
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12370-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,o.map:url]
X-Rspamd-Queue-Id: E35B3362936
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
---
 Makefile              |  3 ++-
 rust/Makefile         |  8 +++++---
 scripts/.gitignore    |  1 +
 scripts/Makefile.host | 23 +++++++++++++++++++++--
 4 files changed, 29 insertions(+), 6 deletions(-)

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
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646..77a76c1d1 100644
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
+		'exec $(call escsq,$(HOSTRUSTC_LD)) "$$@"'
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
+		 -Clinker-flavor=gcc -Clinker=scripts/rustc-wrapper \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
@@ -153,7 +172,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
-- 
2.52.0


