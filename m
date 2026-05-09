Return-Path: <linux-kbuild+bounces-13088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PhCIJEK/2mv1QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13088-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 12:21:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B64774FF339
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 12:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9972D300822E
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8B03A1E6D;
	Sat,  9 May 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="WTbERN1k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.ci.icloud.com (ci-2004b-snip4-5.eps.apple.com [57.103.89.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A2F39EF2A
	for <linux-kbuild@vger.kernel.org>; Sat,  9 May 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.89.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778322010; cv=none; b=E/lw2v8yOOiLM8He+Pb4vMVY07CTDGHdum/voosfaLesky0r+K/KWyEwnFTZwNx5ojzNc+RgpcIr23gwgjy4SarMmVJP+fuY53L502zsIHIB7oBEYy0PQ3uUBWsrs7Tfw8jUvgvh4QLCAt2PLTlQezwreuBAmiAyFuR0GanBOGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778322010; c=relaxed/simple;
	bh=uk3s002/1K1wJYh7ZJIzI8VExOWLljf1T+TyXBpNl2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9utAfHa4wvLcPRYl8UBA3DM+YcjzvHmgHkjEGvrm1qhrLLfck/G8uC1kIv/uRdg+Pz+GgMH1FCyExJxUghCgu/wW6NayOkx7f6XIyxDDMawTAx6GWI9AWv3l0RWe3b3kDbp0JyVwztKjFxukS30Z3bfXujDotcWlWLTjTnXKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=WTbERN1k; arc=none smtp.client-ip=57.103.89.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPS id 55435180015C;
	Sat, 09 May 2026 10:20:04 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQxWAlsERQNGDFYBXwFLVxQEFVwtRA9aHhcbUE1RDw8dVjhACV8FHBNaWEEOCloEUFEdXwIKBEcEWxdGA1NFURkXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PA10QXUNUCBIdUBwOUQVbAEYJTQNUBlsDSQpBHV8AWgJIFEkeAFgrQRRRFh0OVFUSBEAIVlBUHkEEVhVsCVgGUxlX
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1778322006; x=1780914006; bh=3V+dOFMNHDrP5sSJPIAA4ogofE60wjD2rXaubVj2dFM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=WTbERN1khi5TSfSHb9m/vEYMCZxHEQLe0kIhaDx/WLHaWOUgJfqqYwHhPByvShRCm825mgeOP/239vjin/Sb1o8RCBhTuyrFaLHwhm3SQNeOz+Xk7YMCa9wQqU2kVo1ZPPN+3T46Ikx5WuNoAWPtqSPPdwJOTIHnBe8wOwUruZ0ace0FWAuYqRGXS/9D++wuc1KHzFr+gqQ7yDi+WgsOBjQXQNcBNJeQEMOdefgQ+QdM/ENBdPCj4ruKVG/+m4I+BbXR+ksQ0szuBMSdXaxEEORie262e1hbp9cetuAkRhVVprd92Q52EQu8N3mBzL3ggyKio2MAUPUvEUSaA/83ow==
mail-alias-created-date: 1772007648188
Received: from localhost.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPSA id 7A36C1800155;
	Sat, 09 May 2026 10:20:00 +0000 (UTC)
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
Subject: [PATCH v8] kbuild: host: use single executable for rustc -C linker
Date: Sat,  9 May 2026 13:19:38 +0300
Message-ID: <20260509101939.27108-1-mo@sdhn.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDExMCBTYWx0ZWRfX9161O25DtvVl
 eVrZoBdNnPOE4Sxw2v+aP2T7/KGAPiVsZ2QzHGwq//L89MU0K4zBzaoS1yUzd40lBBCOXXh8J6d
 /hc+DwwwaZbQEXzChD9S2QmY6fkE8stDRu3Cnk6xiPgVKGqteh8jTZnaOYqIYjYJSAvB6aGATSK
 yMNYW4hJNdCtktD3jouh5JMVH2w0TtTntQ7E4ColDGyixycnyBOCPYQloG5hi+OIgqUyxW0jdwv
 YlZlpmTI8IyMFimrKCAJgqdWeknVr7ykPAHhFzIhRD5sLgphboHgMg+VWoAR7AVypPc/cAmtkDe
 9JRfiMcAYaXr8RZpDyXUZquZvQEhu5XBad8OA7R8NH+4BG4IE6j4Hkx3kGQaY8=
X-Authority-Info-Out: v=2.4 cv=Sbb6t/Ru c=1 sm=1 tr=0 ts=69ff0a55
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=iP0ByUfl6XJ-bg_O_J4A:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: yduHqetNeq02n1T4FFKcZDnNs-BsBd88
X-Proofpoint-ORIG-GUID: yduHqetNeq02n1T4FFKcZDnNs-BsBd88
X-Rspamd-Queue-Id: B64774FF339
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	URIBL_RED(0.50)[sdhn.cc:email,sdhn.cc:mid,sdhn.cc:dkim];
	MAILLIST(-0.15)[generic];
	HAS_ANON_DOMAIN(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-13088-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	R_DKIM_ALLOW(0.00)[sdhn.cc:s=sig1];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	NEURAL_SPAM(0.00)[0.521];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

rustc's -C linker= option expects a single executable path. When
HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
`-Clinker=$(HOSTCC)` results in the shell splitting the value into
multiple words, and rustc interprets the additional word as an
input filename:

  error: multiple input filenames provided ...

Generate a small wrapper script and pass it to -Clinker e.g.

  ```
  #!/bin/sh
  ccache gcc "$@"
  ```

Note that the wrapper intentionally avoids a leading `exec` to
naturally support leading environment assignments such as:
`VAR=VAL ccache gcc`.

This fix should be general enough to address most if not all cases
(incl. wrappers or subcommands) and avoids surprises of simpler fixes
like just defaulting to gcc.

This avoids passing the user command as an environment variable as
that would be more challenging to trace and debug shell expansions.

Link: https://github.com/Rust-for-Linux/linux/issues/1224
Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
v7 -> v8:
  - Unify into a single global `scripts/rustc-wrapper`, instead of
    generating per-directory wrappers.
  - Use `$(objtree)/scripts/rustc-wrapper` when passing the wrapper to
    `rustc` for clarity.
  - Keep make dependencies on `scripts/rustc-wrapper`, since the rule
    is defined for that target name.
  - Drop the sample-local clean/ignore handling that was only needed
    for per-directory wrappers.

v6 -> v7:
  - Always generate `scripts/rustc-wrapper` when `CONFIG_RUST=y`,
    including cases with no Rust host programs in `scripts/`.
  - Use `$(obj)/rustc-wrapper` for host Rust programs, fixing builds
    outside `scripts/`, e.g. `samples/rust/hostprogs/`.
  - Remove leading exec (again) to allow leading env vars e.g.
    HOSTRUSTC_LD="VAR=VAL ccache gcc".
  - Track, clean and ignore generated wrapper as needed.

v5 -> v6:
  - Add fix to `rust/Makefile` as well
  - Include script to `.gitignore` and make clean
  - Add back the outer `exec` to the command

v4 -> v5:
  - Fix word splitting issues
  - Remove unnecessary `exec sh -c` and simplify generated script

v3 -> v4:
  - Use filechk instead of if_changed macro to regenerate script
  - Remove trailing space at EOL

v2 -> v3:
  - Scrap previous hacky approaches (e.g. using lastword) and go with
    a proper fix which turned out not that complex to implement.

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
v7: https://lore.kernel.org/all/20260416211525.13847-1-mo@sdhn.cc/
---
 Makefile              |  3 ++-
 rust/Makefile         |  8 +++++---
 scripts/.gitignore    |  1 +
 scripts/Makefile      |  3 +++
 scripts/Makefile.host | 23 +++++++++++++++++++++--
 5 files changed, 32 insertions(+), 6 deletions(-)

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
index 5eca6a817..620d397db 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -565,7 +565,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
-		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clinker-flavor=gcc -Clinker=$(objtree)/scripts/rustc-wrapper \
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
index c1dedf646..ab810e42b 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -87,11 +87,30 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
                  $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
+# rustc's `-Clinker=` expects a single executable path, not a command line.
+# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"), which
+# would otherwise be split by the shell and mis-parsed by rustc.
+# To work around this, we generate a script that invokes `HOSTRUSTC_LD` with the
+# linker arguments appended so such commands can be used safely.
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
+scripts/rustc-wrapper: FORCE
+	$(call filechk,rustc-wrapper)
+	$(Q)chmod +x $@
+
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc -Clinker=$(objtree)/scripts/rustc-wrapper \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
@@ -153,7 +172,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs scripts/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
-- 
2.54.0


