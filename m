Return-Path: <linux-kbuild+bounces-13180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOA8HrLnCGp4+gMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13180-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6955DF8F
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7811A30226AF
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 21:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C783859FA;
	Sat, 16 May 2026 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEmOFGIy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487A385D62
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968449; cv=none; b=CJha1HfZY5pbvXUs95o+SuQCxfagOCtxzYNlTRyPY5rDIdC3EcwJwyekw9SO22m/y+sfCm/H9ghuFewI5cPLdxn6fXeRhIbt+4MZKzeXG88ap2Prcnavm34+PbGhgbIBodZTBYQuyzb7SwtceoRgxunqV9KGn7yM95kr9ZgUb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968449; c=relaxed/simple;
	bh=4vFG7wSzURj3z+ZwzMZFivtg1MXtx2E3JNCXm9FZpCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3Qp6pVeRkACS1HNHTO0HS6goML6Rv4yNiS+m7ActYvK7tD1ONY4RbDjoFpP3JCfB8rF/NOgDDL9+AARVgC/DbROq5Dzkz941XEREnxSb7OwM8nRv/P30zREPd10MOgsbWYhNG02G5OCJtS5HKGwSjUVDE84CXuZEgHeakUmXBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEmOFGIy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so11192175e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968442; x=1779573242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+yolIm7RX9E2opLcdPDNyFMzlkMNsEakK2aSVc4NP8=;
        b=PEmOFGIytf2sAo8DCoSUzZ7eQR/pgrQQktxLpheLyGeOkDdKs0K7u2ss3QQMkWi5Jo
         /xx1g1k9+cZka0scmUTD9vKUjx50BvlGmCGppQNpgNUAZy0ALml6csfD3oF2erO3C1/1
         8DhekZksJweC348pnMbXZyR4ArFn6nubgHM4OljUZCesnPR1szBo+FXHRI5WtiDmXgzE
         ZN8aGETERB1i55TnIsRdk9cdowiOhWGqCQvK+xR8QIiVqlx8IsDZO7rzmBgvvzPuPTng
         q3KHg1hNhC1xRTJIa7cfkWr5ZlvNUO7WTuVyESJ8TYOLbdtnT6q4NtXRE89ASnidomx4
         /z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968442; x=1779573242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+yolIm7RX9E2opLcdPDNyFMzlkMNsEakK2aSVc4NP8=;
        b=kEFzN6cDkXW+WHQMS+BJv0IXhx720Lh+6X4VM8yCFnqyEeEZw8hhoKkjB7h+8i05Qj
         yifsTciYzVktc4RlxyxdTJFSuIhU15oz5Su1wo4J3poVPtWiwUsiaiA05npfKq36UjiV
         P0d6yiWqRf5TDyundQRtsf306uqSJmFtyqL6DzzVtGbS3YqESNApKMCZVPib+enWEYz3
         bBx3dZw4cd4cebPo7MQf2s358RV09/L2MH2H2ALiMNyoBPTdZi1gqvmcHnz1JRXpgWXz
         ZaTHw+xWd9SF7Je9oDtNOITnNYIljrimC0quecJ29mzfRR4QgcHhstaOZG0ctQ1gKTRY
         snDg==
X-Forwarded-Encrypted: i=1; AFNElJ8u0SEUvVOrnRz956kNPr0+Dwej7QToGHGug31Rg9qxgjN4RpnILkss6Inoi52Ani5FZpH5eMWuMi3dBmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3DYiAlkj7azfS2wXytyGAYUYKPlHoDTfXiSnEsJMNK2JER4f
	5Qg8+wtMMA1f0ARBob1vk5PGuo3gx8gg2qvGLhZNqqSaj6+ACo+0p7TC
X-Gm-Gg: Acq92OEvbS6JVNbNCvm+Nl6NxDa/bJyz+wWwaSvs1ceyskSZdjVux8MrsdVeWQdQxrz
	Iypg+OrRX7jdzJNR8QFrCBiegB3ekCKR7Tfr4/0/3RnOfoEY37d3hkSrNui2l1J+s3/CcLsB2Yi
	hHXOrF5z7GI3YKWJYAoZ5AaAqP73ipvnd/HrW5c4QouH4UlmRLLOFC2DxQMx9+ZnYj0tU3yNapO
	9zxDk8mZgbbMwiavkIkCBotI/WTFt3hQvwr9jkeTurzyY8s+xEqbD2662YfBnT+gKBX6ub8SSQn
	Fgj1xQ2XAzLvuWAzrfO/lWHUCQfBofg6ehXGLkZMoYDFwdooGnpbDuVGr2y2XT5hBHO7KSy3v7S
	3QyZpeVI12svZC1ECFGjKGFQr0un/6JSDy0DW284HYRt7TKLfGTNDA+AaHkiZ0PhE9zJYPuz+os
	2C05XTwhRkGgx+D+SoEJJJAcFAlmPZ66NOxkORw3cm1PrVbJKp4aC2ycg=
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48fe5cb36aamr105981905e9.0.1778968441130;
        Sat, 16 May 2026 14:54:01 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:54:00 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v3 1/3] scripts: add kconfirm
Date: Sat, 16 May 2026 22:53:52 +0100
Message-ID: <20260516215354.449807-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 81B6955DF8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13180-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vmlinux-gdb.py:url,crates.io:url]
X-Rspamd-Action: no action

Add kconfirm into scripts/

kconfirm is a static analysis tool with various checks for Kconfig, and
intended to have zero false alarms by default. These default checks
currently include dead code, constant conditions, and invalid (reverse)
ranges.

There are also optional checks for dead links in the help texts, and for
config options that select visible config options.

Checks are performed on the same architecture as the kernel build, using
a single thread. More architectures can be enabled by passing
`--enable-arch`. Alarms are tagged using the architectures' config options,
like so: [X86] if specific to x86, or [X86, ARM] if the alarm appears for
both x86 and arm.

Each alarm gets a single line (deduplicated across architectures) and is
formatted like this:
[<SEVERITY>] [<ARCH_1>, <ARCH_2>] config <OPTION_NAME>: <alarm message>

The tool source contains two Rust packages: kconfirm-lib and
kconfirm-linux.

kconfirm-lib is the underlying library that analyzes Kconfig code, and
formats alarms for usability. It analyzes the entire Linux Kconfig spec,
including all architectures. This package exposes the symbol table that it
constructs so that other tools can import this library, and make use of it
for their own Kconfig analyses.

kconfirm-linux imports kconfirm-lib, and provides the CLI, which is
intended for either manual usage, or integration with the Linux build
system so that users can simply run `make kconfirm` from the root.
kconfirm-linux also handles some of the specificities of how Kconfig is
used in the Linux tree, in contrast to other open source software. E.g.
the way that each architecture has its own Kconfig and Kconfig.debug
files.

The tool's dependencies need to be downloaded from crates.io by running
`cargo vendor` in scripts/kconfirm/ before building and running the tool.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Makefile                                      |  15 +-
 scripts/Makefile                              |   2 +-
 scripts/kconfirm/.gitignore                   |   3 +
 scripts/kconfirm/Cargo.lock                   |  60 ++
 scripts/kconfirm/Cargo.toml                   |  12 +
 scripts/kconfirm/Makefile                     |  14 +
 scripts/kconfirm/kconfirm-lib/Cargo.toml      |  12 +
 scripts/kconfirm/kconfirm-lib/src/analyze.rs  | 643 ++++++++++++++++
 scripts/kconfirm/kconfirm-lib/src/checks.rs   | 701 ++++++++++++++++++
 scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs | 182 +++++
 .../kconfirm/kconfirm-lib/src/dead_links.rs   | 138 ++++
 scripts/kconfirm/kconfirm-lib/src/lib.rs      |  62 ++
 scripts/kconfirm/kconfirm-lib/src/output.rs   | 111 +++
 .../kconfirm/kconfirm-lib/src/symbol_table.rs | 223 ++++++
 scripts/kconfirm/kconfirm-linux/Cargo.toml    |  10 +
 .../kconfirm/kconfirm-linux/src/getopt_ffi.rs |  99 +++
 scripts/kconfirm/kconfirm-linux/src/lib.rs    |  78 ++
 scripts/kconfirm/kconfirm-linux/src/main.rs   | 192 +++++
 18 files changed, 2552 insertions(+), 5 deletions(-)
 create mode 100644 scripts/kconfirm/.gitignore
 create mode 100644 scripts/kconfirm/Cargo.lock
 create mode 100644 scripts/kconfirm/Cargo.toml
 create mode 100644 scripts/kconfirm/Makefile
 create mode 100644 scripts/kconfirm/kconfirm-lib/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/analyze.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/checks.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/dead_links.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/output.rs
 create mode 100644 scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/Cargo.toml
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/lib.rs
 create mode 100644 scripts/kconfirm/kconfirm-linux/src/main.rs

diff --git a/Makefile b/Makefile
index b7b80e84e1eb..99aaed5bdbc5 100644
--- a/Makefile
+++ b/Makefile
@@ -296,7 +296,7 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 run-command
+			 run-command kconfirm
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
@@ -536,6 +536,7 @@ OBJDUMP		= $(CROSS_COMPILE)objdump
 READELF		= $(CROSS_COMPILE)readelf
 STRIP		= $(CROSS_COMPILE)strip
 endif
+CARGO		= cargo
 RUSTC		= rustc
 RUSTDOC		= rustdoc
 RUSTFMT		= rustfmt
@@ -633,7 +634,7 @@ export RUSTC_BOOTSTRAP := 1
 export CLIPPY_CONF_DIR := $(srctree)
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK
+export CARGO RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
@@ -1705,7 +1706,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  vmlinux-gdb.py \
 		  rpmbuild \
 		  rust/libmacros.so rust/libmacros.dylib \
-		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib
+		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib \
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -2227,7 +2228,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck
+PHONY += includecheck versioncheck coccicheck kconfirm
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2242,6 +2243,12 @@ versioncheck:
 coccicheck:
 	$(Q)$(BASH) $(srctree)/scripts/$@
 
+
+kconfirm:
+	$(Q)$(MAKE) -C $(srctree)/scripts/kconfirm srctree=$(abs_srctree) SRCARCH=$(SRCARCH) || \
+		(printf "\n  kconfirm failed to compile and run. Have you set up its dependencies yet?\n  See Documentation/dev-tools/kconfirm.rst\n\n" && false)
+clean-dirs += scripts/kconfirm
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/Makefile b/scripts/Makefile
index 3434a82a119f..460655bd2de1 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -66,4 +66,4 @@ subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
 
 # Let clean descend into subdirs
-subdir-	+= basic dtc gdb kconfig mod
+subdir-	+= basic dtc gdb kconfig kconfirm mod
diff --git a/scripts/kconfirm/.gitignore b/scripts/kconfirm/.gitignore
new file mode 100644
index 000000000000..f63ee0251591
--- /dev/null
+++ b/scripts/kconfirm/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/target
+/vendor
diff --git a/scripts/kconfirm/Cargo.lock b/scripts/kconfirm/Cargo.lock
new file mode 100644
index 000000000000..d90bc7d2e2a3
--- /dev/null
+++ b/scripts/kconfirm/Cargo.lock
@@ -0,0 +1,60 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 4
+
+[[package]]
+name = "bytecount"
+version = "0.6.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
+
+[[package]]
+name = "kconfirm-lib"
+version = "0.10.0"
+dependencies = [
+ "nom-kconfig",
+]
+
+[[package]]
+name = "kconfirm-linux"
+version = "0.10.0"
+dependencies = [
+ "kconfirm-lib",
+ "nom-kconfig",
+]
+
+[[package]]
+name = "memchr"
+version = "2.8.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
+
+[[package]]
+name = "nom"
+version = "8.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "nom-kconfig"
+version = "0.11.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5a0220bb2c8e5ad29b06fe0f75a276affeb10c9504726bf46d81fef78d69b1e3"
+dependencies = [
+ "nom",
+ "nom_locate",
+]
+
+[[package]]
+name = "nom_locate"
+version = "5.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0b577e2d69827c4740cba2b52efaad1c4cc7c73042860b199710b3575c68438d"
+dependencies = [
+ "bytecount",
+ "memchr",
+ "nom",
+]
diff --git a/scripts/kconfirm/Cargo.toml b/scripts/kconfirm/Cargo.toml
new file mode 100644
index 000000000000..5880b06c4116
--- /dev/null
+++ b/scripts/kconfirm/Cargo.toml
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+[workspace]
+members = ["kconfirm-lib", "kconfirm-linux"]
+resolver = "3"
+
+[workspace.package]
+rust-version = "1.85.0"
+
+[workspace.dependencies]
+nom-kconfig = { version = "0.11", default-features = false, features = [
+    "display",
+] }
diff --git a/scripts/kconfirm/Makefile b/scripts/kconfirm/Makefile
new file mode 100644
index 000000000000..6a0b7389103e
--- /dev/null
+++ b/scripts/kconfirm/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+# kconfirm makefile
+
+TARGET := kconfirm
+
+# Extra arguments forwarded to kconfirm.
+# Example: make kconfirm KCONFIRM_ARGS="--enable-check dead_links"
+KCONFIRM_ARGS ?=
+
+$(TARGET):
+	$(CARGO) run --release --offline -p kconfirm-linux -- --linux-path $(srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)
+
+
+clean-files += target vendor
diff --git a/scripts/kconfirm/kconfirm-lib/Cargo.toml b/scripts/kconfirm/kconfirm-lib/Cargo.toml
new file mode 100644
index 000000000000..dd3d7cb1aa1d
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/Cargo.toml
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+[package]
+name = "kconfirm-lib"
+version = "0.10.0"
+edition = "2024"
+rust-version.workspace = true
+
+[dependencies]
+nom-kconfig = { workspace = true }
+
+[features]
+default = []
diff --git a/scripts/kconfirm/kconfirm-lib/src/analyze.rs b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
new file mode 100644
index 000000000000..24798581dc3d
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/analyze.rs
@@ -0,0 +1,643 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::AnalysisArgs;
+use crate::Check;
+use crate::SymbolTable;
+use crate::dead_links;
+use crate::dead_links::LinkStatus;
+use crate::dead_links::check_link;
+use crate::output::Finding;
+use crate::output::Severity;
+use crate::symbol_table::ChoiceData;
+use nom_kconfig::Attribute::*;
+use nom_kconfig::Entry;
+use nom_kconfig::attribute::DefaultAttribute;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::Imply;
+use nom_kconfig::attribute::Select;
+use nom_kconfig::attribute::r#type::Type;
+use nom_kconfig::entry::Choice;
+use nom_kconfig::entry::Config;
+use nom_kconfig::entry::If;
+use nom_kconfig::entry::Menu;
+use nom_kconfig::entry::Source;
+use std::collections::HashSet;
+use std::option::Option;
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+enum FunctionalAttributes {
+    // only tracking the attributes that affect the semantics, e.g. not help texts
+    Dependencies,
+    Selects,
+    Implies,
+    Ranges,
+    Defaults,
+}
+
+struct AttributeGroupingChecker {
+    current_group: Option<FunctionalAttributes>,
+    finished_groups: HashSet<FunctionalAttributes>,
+}
+
+impl AttributeGroupingChecker {
+    fn new() -> Self {
+        Self {
+            current_group: None,
+            finished_groups: HashSet::new(),
+        }
+    }
+
+    // doesn't modify `findings` if the style check is disabled
+    fn check(
+        &mut self,
+        group: FunctionalAttributes,
+        args: &AnalysisArgs,
+        findings: &mut Vec<Finding>,
+        symbol: &str,
+        arch: &String,
+        message: String,
+    ) {
+        if !args.is_enabled(Check::UngroupedAttribute) {
+            return;
+        }
+
+        match self.current_group {
+            // still contiguous
+            Some(current) if current == group => {}
+
+            // start of group
+            None => {
+                self.current_group = Some(group);
+            }
+
+            Some(current) => {
+                // the previous group finished
+                self.finished_groups.insert(current);
+
+                // we've already finished this group, it's ungrouped
+                if self.finished_groups.contains(&group) {
+                    findings.push(Finding {
+                        severity: Severity::Style,
+                        check: Check::UngroupedAttribute,
+                        symbol: Some(symbol.to_string()),
+                        message,
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // switch to the new group
+                self.current_group = Some(group);
+            }
+        }
+    }
+}
+
+struct DeadLinkChecker {
+    visited_links: HashSet<String>,
+}
+
+impl DeadLinkChecker {
+    fn new() -> Self {
+        Self {
+            visited_links: HashSet::new(),
+        }
+    }
+
+    fn check_text(
+        &mut self,
+        text: &str,
+        args: &AnalysisArgs,
+        findings: &mut Vec<Finding>,
+        symbol: Option<&str>,
+        arch: &String,
+        context: &str,
+    ) {
+        if !args.is_enabled(Check::DeadLink) {
+            return;
+        }
+
+        let links = dead_links::find_links(text);
+
+        if links.is_empty() {
+            return;
+        }
+
+        for link in links {
+            // avoid rechecking identical links
+            if !self.visited_links.insert(link.clone()) {
+                continue;
+            }
+
+            let status = check_link(&link);
+            if status != LinkStatus::Ok && status != LinkStatus::ProbablyBlocked {
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::DeadLink,
+                    symbol: symbol.map(|s| s.to_string()),
+                    message: format!(
+                        "{} contains link {} with status {:?}",
+                        context, link, status
+                    ),
+                    arch: arch.to_owned(),
+                });
+            }
+        }
+    }
+}
+
+#[derive(Clone)]
+pub struct Context {
+    pub arch: String,
+    pub definition_condition: Vec<Expression>,
+    pub visibility: Vec<Option<Expression>>,
+    pub dependencies: Vec<Expression>,
+    pub in_choice: bool,
+}
+
+impl Context {
+    fn with_arch(arch: String) -> Context {
+        Context {
+            arch,
+            definition_condition: vec![],
+            visibility: vec![],
+            dependencies: vec![],
+            in_choice: false,
+        }
+    }
+
+    fn child(&self) -> Self {
+        self.clone()
+    }
+
+    fn with_dep(mut self, dep: Expression) -> Self {
+        self.dependencies.push(dep);
+        self
+    }
+
+    fn with_visibility(mut self, cond: Option<Expression>) -> Self {
+        self.visibility.push(cond);
+        self
+    }
+
+    fn with_definition(mut self, cond: Expression) -> Self {
+        self.definition_condition.push(cond);
+        self
+    }
+
+    fn in_choice(mut self) -> Self {
+        self.in_choice = true;
+        self
+    }
+}
+
+fn recurse_entries(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entries: Vec<Entry>,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    for entry in entries {
+        process_entry(args, symtab, entry, ctx.clone(), findings);
+    }
+}
+
+pub fn analyze(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    arch: String,
+    entries: Vec<Entry>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    let ctx = Context::with_arch(arch);
+
+    recurse_entries(args, symtab, entries, ctx, &mut findings);
+
+    findings
+}
+
+fn handle_config(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Config,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let config_symbol = entry.symbol;
+
+    let mut child_ctx = ctx.child();
+
+    let mut config_type = None;
+    let mut kconfig_dependencies = Vec::new();
+    let mut kconfig_selects: Vec<Select> = Vec::new();
+    let mut kconfig_implies: Vec<Imply> = Vec::new();
+    let mut kconfig_ranges = Vec::new();
+    let mut kconfig_defaults = Vec::new();
+    let mut found_prompt = false;
+
+    /*
+     * style check: ungrouped attributes
+     * - need to check that dependencies, selects, ranges, and defaults are each kept together.
+     */
+    let mut attribute_grouping_checker = AttributeGroupingChecker::new();
+    let mut dead_link_checker = DeadLinkChecker::new();
+    for attribute in entry.attributes {
+        match attribute {
+            Type(kconfig_type) => match kconfig_type.r#type.clone() {
+                // hybrid type definition and default
+                Type::DefBool(db) => {
+                    let default_attribute: DefaultAttribute = DefaultAttribute {
+                        expression: db.clone(),
+                        r#if: kconfig_type.clone().r#if,
+                    };
+
+                    kconfig_defaults.push(default_attribute);
+                    config_type = Some(kconfig_type);
+
+                    // NOTE: as a style, we prefer to keep the hybrid default-typedef with the standalone defaults
+                    attribute_grouping_checker.check(
+                        FunctionalAttributes::Defaults,
+                        args,
+                        findings,
+                        &config_symbol,
+                        &ctx.arch,
+                        format!("ungrouped default {}", db),
+                    );
+                }
+                Type::Bool(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+                    config_type = Some(kconfig_type);
+                }
+
+                // hybrid type definition and default
+                Type::DefTristate(dt) => {
+                    // NOTE: as a style, we prefer to keep the hybrid default-typedef with the standalone defaults
+                    attribute_grouping_checker.check(
+                        FunctionalAttributes::Defaults,
+                        args,
+                        findings,
+                        &config_symbol,
+                        &ctx.arch,
+                        format!("ungrouped default {}", &dt),
+                    );
+
+                    let default_attribute: DefaultAttribute = DefaultAttribute {
+                        expression: dt,
+                        r#if: kconfig_type.clone().r#if,
+                    };
+
+                    kconfig_defaults.push(default_attribute);
+                    config_type = Some(kconfig_type);
+                }
+                Type::Tristate(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+
+                    config_type = Some(kconfig_type.clone())
+                }
+                Type::Hex(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+
+                    config_type = Some(kconfig_type);
+                }
+                Type::Int(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+                    config_type = Some(kconfig_type);
+                }
+                Type::String(unconditional_prompt) => {
+                    if unconditional_prompt.is_some() {
+                        found_prompt = true;
+                    }
+                    config_type = Some(kconfig_type);
+                }
+            },
+            Default(default) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Defaults,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped default {}", &default),
+                );
+
+                kconfig_defaults.push(default);
+            }
+
+            DependsOn(depends_on) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Dependencies,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped dependency {}", &depends_on),
+                );
+
+                kconfig_dependencies.push(depends_on);
+            }
+            Select(select) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Selects,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped select {}", &select),
+                );
+
+                kconfig_selects.push(select);
+            }
+            Imply(imply) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Implies,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped imply {}", imply),
+                );
+
+                kconfig_implies.push(imply);
+
+                // TODO: may be relevant for nonvisible config options when building an SMT model...
+            }
+            // NOTE: range bounds are inclusive
+            Range(r) => {
+                attribute_grouping_checker.check(
+                    FunctionalAttributes::Ranges,
+                    args,
+                    findings,
+                    &config_symbol,
+                    &ctx.arch,
+                    format!("ungrouped range {}", r),
+                );
+
+                kconfig_ranges.push(r);
+            }
+            Help(h) => {
+                // doing nothing for menu help right now
+
+                dead_link_checker.check_text(
+                    &h,
+                    args,
+                    findings,
+                    Some(&config_symbol),
+                    &ctx.arch,
+                    "help text",
+                );
+            }
+
+            Modules => {
+                // the modules attribute designates this config option as the one that determines if the `m` state is available for tristates options.
+
+                // just making a special note of this in the symtab for now...
+                symtab.modules_option = Some(config_symbol.clone());
+            }
+
+            // the prompt's option `if` determines "visibility"
+            Prompt(prompt) => {
+                // TODO: once we have SMT solving, we can also check if the prompt condition is always true or never true (and therefore, effectively unconditional)
+
+                found_prompt = true;
+                if let Some(c) = prompt.r#if {
+                    child_ctx = child_ctx.with_visibility(Some(c));
+                }
+            }
+            Transitional => {
+                // doing nothing for transitional right now
+            }
+            Optional | Visible(_) | Requires(_) | Option(_) => {
+                eprintln!("Error: unexpected attribute encountered: {:?}", attribute);
+
+                if cfg!(debug_assertions) {
+                    panic!();
+                }
+            }
+        }
+    }
+
+    if !found_prompt {
+        child_ctx = child_ctx.with_visibility(None);
+    }
+
+    // there can be multiple entries that get merged. so we need to do the same for our symtab.
+    let kconfig_type = config_type.clone().map(|c| c.r#type);
+
+    // at the time of writing this, linux's kconfig only uses Bool inside Choice.
+    // however, the kconfig documentation doesn't specify whether or not this is guaranteed to be the case.
+    // we add this check to ensure that we don't cause undefined behavior in future linux versions if something changes...
+    if child_ctx.in_choice {
+        if let Some(kt) = &kconfig_type {
+            match kt {
+                Type::Bool(_) | Type::DefBool(_) => {
+                    // expected in a choice...
+                }
+
+                _ => {
+                    // TODO: old versions of linux (like 5.4.4) have tristates in the choice
+                    //       - u-boot also currently has hex options in the choice!
+                    eprintln!(
+                        "Error: found something unexpected in a choice-statement: {:?}",
+                        kt
+                    );
+                }
+            }
+        }
+    }
+
+    // at the end, add the file's cur_dependencies to this var's invididual dependencies.
+    kconfig_dependencies.extend(child_ctx.dependencies.clone());
+    symtab.merge_insert_new_solved(
+        config_symbol.clone(),
+        kconfig_type,
+        kconfig_dependencies,
+        //z3_dependency,
+        kconfig_ranges,
+        kconfig_defaults,
+        child_ctx.visibility.clone(),
+        child_ctx.arch.clone(),
+        child_ctx.definition_condition.clone(),
+        None,
+        kconfig_selects
+            .clone()
+            .into_iter()
+            .map(|sel| (sel.symbol, sel.r#if))
+            .collect(),
+        kconfig_implies
+            .into_iter()
+            .map(|imply| (imply.symbol.to_string(), imply.r#if))
+            .collect(),
+    );
+    // TODO: file a github issue, imply can never imply a constant (this is technically parsing incorrectly)
+
+    // TODO: when SMT solving, we may need to keep track of the implies the same way we keep track of selects,
+    //       in cases when the implied config option is non-visible
+
+    // need to add the select condition to the definedness condition if it exists
+    for select in kconfig_selects {
+        match select.r#if {
+            None => symtab.merge_insert_new_solved(
+                select.symbol,
+                None,
+                Vec::new(),
+                Vec::new(),
+                Vec::new(),
+                Vec::new(),
+                child_ctx.arch.clone(),
+                child_ctx.definition_condition.clone(),
+                Some((config_symbol.clone(), None)),
+                Vec::new(),
+                Vec::new(),
+            ),
+            Some(select_condition) => {
+                symtab.merge_insert_new_solved(
+                    select.symbol,
+                    None,
+                    Vec::new(),
+                    Vec::new(),
+                    Vec::new(),
+                    Vec::new(),
+                    child_ctx.arch.clone(),
+                    child_ctx.definition_condition.clone(),
+                    Some((config_symbol.clone(), Some(select_condition))),
+                    Vec::new(),
+                    Vec::new(),
+                );
+            }
+        }
+    }
+}
+
+fn handle_menu(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Menu,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    // menus can set the visibility of their menu items
+
+    let mut child_ctx = ctx.child();
+
+    for dep in entry.depends_on {
+        child_ctx = child_ctx.with_dep(dep.clone());
+        child_ctx = child_ctx.with_visibility(Some(dep)); // not a typo, the config options inside of a menu are only visible if the menu's dependencies are satisfied
+    }
+
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), findings);
+}
+
+fn handle_choice(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Choice,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let mut child_ctx = ctx.child();
+    child_ctx = child_ctx.in_choice();
+
+    // we are going to add the dependencies of the choice to the dependencies of the entries.
+    //   we start with the dependencies inherited from the file
+    let mut choice_visibility_condition = None;
+    let mut defaults = Vec::new();
+    for attribute in entry.options {
+        match attribute {
+            DependsOn(depends_on) => {
+                child_ctx = child_ctx.with_dep(depends_on);
+            }
+
+            Default(default) => {
+                defaults.push(default);
+            }
+
+            // the prompt's `if` determines visibility
+            Prompt(prompt) => {
+                choice_visibility_condition = prompt.r#if;
+                if let Some(i) = choice_visibility_condition.clone() {
+                    child_ctx = child_ctx.with_visibility(Some(i));
+                }
+            }
+            _ => {
+                // skip
+            }
+        }
+    }
+
+    // all of the variables in the choice menu
+    //let mut contained_vars = Vec::with_capacity(c.entries.len());
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx.clone(), findings);
+
+    let choice_data = ChoiceData {
+        //inner_vars: contained_vars,
+        arch: child_ctx.arch.clone(),
+        visibility: choice_visibility_condition,
+        dependencies: child_ctx.dependencies,
+        defaults,
+    };
+    symtab.choices.push(choice_data);
+}
+
+fn handle_if(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: If,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let mut child_ctx = ctx.child();
+    child_ctx = child_ctx.with_definition(entry.condition.clone());
+    child_ctx = child_ctx.with_dep(entry.condition);
+    let nested_entries = entry.entries;
+
+    recurse_entries(args, symtab, nested_entries, child_ctx, findings);
+}
+
+fn handle_source(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Source,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+) {
+    let sourced_kconfig = entry.kconfigs;
+
+    for sourced_kconfig in sourced_kconfig {
+        recurse_entries(args, symtab, sourced_kconfig.entries, ctx.clone(), findings);
+    }
+}
+
+pub fn process_entry(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Entry,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    // NOTE: in general, each handler should update the context as it encounters that construct.
+    //       e.g. Context.in_choice() should be called at the start of handle_choice(), not right before call to process_entry() when a choice is found and process_entry is called
+    match entry {
+        Entry::Config(c) | Entry::MenuConfig(c) => {
+            handle_config(args, symtab, c, &ctx, findings);
+        }
+        Entry::Menu(m) => handle_menu(args, symtab, m, &ctx, findings),
+        Entry::Choice(c) => handle_choice(args, symtab, c, &ctx, findings),
+        Entry::If(i) => handle_if(args, symtab, i, &ctx, findings),
+        Entry::Source(s) => handle_source(args, symtab, s, &ctx, findings),
+        Entry::Comment(_) => {}
+        Entry::MainMenu(_) => {}
+        _ => {}
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/checks.rs b/scripts/kconfirm/kconfirm-lib/src/checks.rs
new file mode 100644
index 000000000000..2ad67f4390ea
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/checks.rs
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::output::Finding;
+use crate::output::Severity;
+use crate::symbol_table::AttributeDef;
+use crate::symbol_table::TypeInfo;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::range::RangeBound;
+use std::collections::HashSet;
+use std::num::ParseIntError;
+use std::str::FromStr;
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+pub enum Check {
+    FailedParse,
+    UngroupedAttribute, // check for duplicate default values, and ungrouped attributes
+    DeadLink,           // check for dead links in the help texts
+    SelectVisible,
+    // need SMT solving before we can detect select-undefineds
+    //SelectUndefined,
+    DuplicateDependency,
+    DuplicateRange,
+    DeadRange,
+    DuplicateSelect,
+    DeadSelect,
+    DeadDefault,
+    ConstantCondition,
+    DuplicateDefault,
+    DuplicateDefaultValue,
+    DuplicateImply,
+    DeadImply,
+    ReverseRange,
+}
+
+impl Check {
+    pub fn as_str(self) -> &'static str {
+        match self {
+            Check::FailedParse => "failed_parse",
+            Check::UngroupedAttribute => "ungrouped_attribute",
+            Check::DeadLink => "dead_link",
+            Check::SelectVisible => "select_visible",
+            Check::DuplicateDependency => "duplicate_dependency",
+            Check::DuplicateRange => "duplicate_range",
+            Check::DeadRange => "dead_range",
+            Check::DuplicateSelect => "duplicate_select",
+            Check::DeadSelect => "dead_select",
+            Check::DeadDefault => "dead_default",
+            Check::ConstantCondition => "constant_condition",
+            Check::DuplicateDefault => "duplicate_default",
+            Check::DuplicateDefaultValue => "duplicate_default_value",
+            Check::DuplicateImply => "duplicate_imply",
+            Check::DeadImply => "dead_imply",
+            Check::ReverseRange => "reverse_range",
+        }
+    }
+}
+
+#[derive(Debug)]
+pub struct ParseCheckError {
+    pub input: String,
+}
+
+impl std::fmt::Display for ParseCheckError {
+    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
+        write!(f, "unknown check '{}'", self.input)
+    }
+}
+
+impl std::error::Error for ParseCheckError {}
+
+impl FromStr for Check {
+    type Err = ParseCheckError;
+
+    fn from_str(name: &str) -> Result<Self, Self::Err> {
+        match name {
+            "failed_parse" => Ok(Check::FailedParse),
+            "ungrouped_attribute" => Ok(Check::UngroupedAttribute),
+            "dead_link" => Ok(Check::DeadLink),
+            "select_visible" => Ok(Check::SelectVisible),
+            "duplicate_dependency" => Ok(Check::DuplicateDependency),
+            "duplicate_range" => Ok(Check::DuplicateRange),
+            "dead_range" => Ok(Check::DeadRange),
+            "duplicate_select" => Ok(Check::DuplicateSelect),
+            "dead_select" => Ok(Check::DeadSelect),
+            "dead_default" => Ok(Check::DeadDefault),
+            "constant_condition" => Ok(Check::ConstantCondition),
+            "duplicate_default" => Ok(Check::DuplicateDefault),
+            "duplicate_default_value" => Ok(Check::DuplicateDefaultValue),
+            "duplicate_imply" => Ok(Check::DuplicateImply),
+            "dead_imply" => Ok(Check::DeadImply),
+            "reverse_range" => Ok(Check::ReverseRange),
+            _ => Err(ParseCheckError {
+                input: name.to_string(),
+            }),
+        }
+    }
+}
+
+#[derive(Clone, Debug)]
+pub struct AnalysisArgs {
+    // check for duplicate default values
+    pub enabled_checks: HashSet<Check>,
+}
+
+impl AnalysisArgs {
+    pub fn is_enabled(&self, check: Check) -> bool {
+        self.enabled_checks.contains(&check)
+    }
+}
+
+// returns an Error if a hex range bound cannot be parsed as an u64
+pub fn check_reverse_ranges(arch: &String, var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    for range in &info.kconfig_ranges {
+        // returns an Error if a hex range bound cannot be parsed as an u64
+        fn range_bound_to_int(range_bound: &RangeBound) -> Result<i128, ParseIntError> {
+            match range_bound {
+                RangeBound::Number(b) => {
+                    return Ok(b.to_owned() as i128);
+                }
+                RangeBound::Hex(b_str) => {
+                    let trimmed = b_str.trim_start_matches("0x").trim_start_matches("0X");
+
+                    return i128::from_str_radix(trimmed, 16);
+                }
+                RangeBound::Variable(_) => {
+                    // for now, the caller is expected not to pass these cases.
+                    unreachable!("not handling variable ranges until SMT solving");
+                }
+                RangeBound::Symbol(_) => {
+                    // TODO: need SMT solving for this case
+                    //       for now, the caller is expected not to pass these cases.
+                    unreachable!("not handling CONFIG ranges until SMT solving");
+                }
+            }
+        }
+
+        if matches!(range.lower_bound, RangeBound::Symbol(_))
+            || matches!(range.upper_bound, RangeBound::Symbol(_))
+        {
+            // not handling these cases until SMT solving.
+            // don't return though, because we stil want to check the other ranges.
+            continue;
+        }
+
+        let maybe_lower_bound = range_bound_to_int(&range.lower_bound);
+        let maybe_upper_bound = range_bound_to_int(&range.upper_bound);
+
+        match (maybe_lower_bound, maybe_upper_bound) {
+            (Ok(lower_bound), Ok(upper_bound)) => {
+                if lower_bound > upper_bound {
+                    let message = format!(
+                        "reverse range {} for config option: {}, no value is valid",
+                        range.to_string(),
+                        var_symbol,
+                    );
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::ReverseRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        arch: arch.to_owned(),
+                        message,
+                    });
+                }
+            }
+            (Result::Err(_), _) | (_, Result::Err(_)) => {
+                eprintln!(
+                    "Error: couldn't parse hex range bound as i128 for config option: {}",
+                    var_symbol
+                );
+                // still want to check the other range bounds
+                continue;
+            }
+        }
+    }
+
+    findings
+}
+
+pub fn check_constant_conditions(
+    arch: &String,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let default_conditions: Vec<&Expression> = info
+        .kconfig_defaults
+        .iter()
+        .filter_map(|conditional_default| conditional_default.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        &var_symbol,
+        &info.kconfig_dependencies,
+        default_conditions,
+        "default",
+    );
+
+    let select_conditions: Vec<&Expression> = info
+        .selects
+        .iter()
+        .filter_map(|conditional_select| conditional_select.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        select_conditions,
+        "select",
+    );
+
+    let imply_conditions: Vec<&Expression> = info
+        .implies
+        .iter()
+        .filter_map(|imp| imp.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        imply_conditions,
+        "imply",
+    );
+
+    let range_conditions: Vec<&Expression> = info
+        .kconfig_ranges
+        .iter()
+        .filter_map(|conditional_range| conditional_range.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.kconfig_dependencies,
+        range_conditions,
+        "range",
+    );
+
+    fn check_conditions(
+        arch: &String,
+        findings: &mut Vec<Finding>,
+        symbol: &str,
+        kconfig_dependencies: &[Expression],
+        attribute_conditions: Vec<&Expression>,
+        context: &str,
+    ) {
+        for attribute_condition in attribute_conditions.into_iter() {
+            if kconfig_dependencies.contains(attribute_condition) {
+                let message = format!(
+                    "constant {} condition 'if {}' for config option: {}, this condition is a dependency and will always be true",
+                    context,
+                    attribute_condition.to_string(),
+                    symbol,
+                );
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::ConstantCondition,
+                    symbol: Some(symbol.to_owned()),
+                    arch: arch.to_owned(),
+                    message,
+                });
+            }
+        }
+    }
+    findings
+}
+
+pub fn check_variable_info(
+    args: &AnalysisArgs,
+    var_symbol: &str,
+    arch_specific: &String,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    if args.is_enabled(Check::DuplicateDependency) {
+        findings.extend(check_duplicate_dependencies(
+            arch_specific,
+            var_symbol,
+            info,
+        ));
+    }
+
+    if args.is_enabled(Check::DuplicateImply) {
+        findings.extend(check_duplicate_implies(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateRange) {
+        findings.extend(check_duplicate_ranges(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateSelect) {
+        findings.extend(check_duplicate_selects(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::ConstantCondition) {
+        findings.extend(check_constant_conditions(arch_specific, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DeadDefault)
+        || args.is_enabled(Check::DuplicateDefault)
+        || args.is_enabled(Check::DuplicateDefaultValue)
+    {
+        findings.extend(check_defaults(arch_specific, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::ReverseRange) {
+        findings.extend(check_reverse_ranges(arch_specific, var_symbol, info));
+    }
+
+    findings
+}
+
+// TODO: also check if a config option in one arch unconditionally references a config option that only exists in another arch (need SMT for this first)
+pub fn check_select_visible(var_symbol: &str, info: &TypeInfo) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // only interested in the options that are selected
+    if info.selected_by.is_empty() {
+        return Vec::new();
+    }
+
+    for (selector, select_info) in &info.selected_by {
+        for (arch, _cond) in select_info {
+            // NOTE: we don't care if the select is conditional or unconditional, just the selectee's visibility
+
+            // at this point, we know that `selector` unconditionally selects `var_symbol`
+            // now, we need to check if `var_symbol` is unconditionally visible
+
+            let message = format!(
+                "selects the visible {}; consider using 'depends on' or 'imply' instead",
+                var_symbol
+            );
+
+            // match the architecture that the select happens under with the architecture of the unconditional visibility
+            match info.attribute_defs.get(arch) {
+                None => {
+                    // not selected in this architecture
+                }
+                Some(cur_arch_attribute_def) => {
+                    for (if_conditions, attributes) in cur_arch_attribute_def {
+                        if if_conditions.is_empty() && attributes.visibility.is_empty() {
+                            // empty visiblity means that it is unconditionally visible, within the current arch (assuming arch is not `None`)
+
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::SelectVisible,
+                                symbol: Some(selector.to_owned()),
+                                message: message.clone(),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn is_duplicate<T: Eq + std::hash::Hash>(set: &mut HashSet<T>, key: T) -> bool {
+    !set.insert(key)
+}
+
+fn check_duplicate_dependencies(
+    arch_specific: &String,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen = HashSet::new();
+
+    for dep in &info.kconfig_dependencies {
+        if is_duplicate(&mut seen, dep.to_string()) {
+            let message = format!("duplicate dependency on {}", dep.to_string());
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DuplicateDependency,
+                symbol: Some(var_symbol.to_owned()),
+                message,
+                arch: arch_specific.to_owned(),
+            });
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_implies(arch: &String, var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // symbols implied unconditionally
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (symbol, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for imp in &info.implies {
+        let imply_var = imp.0.clone();
+
+        match &imp.1 {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional imply
+                if !conditional.insert((imply_var.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate imply of {:?} with condition {}",
+                            imp.0, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional imply is dead if unconditional exists
+                if unconditional.contains(&imply_var) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead imply of {:?}", imp),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional imply
+                if !unconditional.insert(imply_var.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate imply of {:?}", imp),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // previous conditionals with same symbol are dead
+                for (sym, _) in &conditional {
+                    if sym == &imply_var {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadImply,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead imply of {:?}", imp),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_ranges(arch: &String, var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // unconditional ranges by bounds
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (bounds, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for range in &info.kconfig_ranges {
+        // uniquely identify the range bounds
+        let range_key = format!("{} {}", range.lower_bound, range.upper_bound);
+
+        match &range.r#if {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional range
+                if !conditional.insert((range_key.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {:?} with condition {}", range, cond_str),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional range is dead if unconditional exists
+                if unconditional.contains(&range_key) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead range of {:?}", range),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional range
+                if !unconditional.insert(range_key.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {:?}", range),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // previous conditionals with same bounds are dead
+                for (bounds, _) in &conditional {
+                    if bounds == &range_key {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadRange,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead range of {:?}", range),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_duplicate_selects(arch: &String, var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // symbols selected unconditionally
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // (symbol, condition)
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for select in &info.selects {
+        let select_var = select.0.clone();
+
+        match &select.1 {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // duplicate conditional select
+                if !conditional.insert((select_var.clone(), cond_str.clone())) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate select of {:?} with condition {}",
+                            select.0, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // conditional is dead if unconditional exists
+                if unconditional.contains(&select_var) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead select of {:?}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // duplicate unconditional select
+                if !unconditional.insert(select_var.clone()) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate select of {:?}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // any previous conditional selects are now dead too
+                for (sym, _) in &conditional {
+                    if sym == &select_var {
+                        findings.push(Finding {
+                            severity: Severity::Warning,
+                            check: Check::DeadSelect,
+                            symbol: Some(var_symbol.to_owned()),
+                            message: format!("dead select of {:?}", select.0),
+                            arch: arch.to_owned(),
+                        });
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+#[allow(clippy::collapsible_if)]
+fn check_defaults(
+    arch: &String,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen_conditions = HashSet::new();
+    let mut seen_values = HashSet::new();
+    let mut already_unconditional = false;
+
+    for default in &info.kconfig_defaults {
+        let val_str = default.expression.to_string();
+
+        let has_real_condition = match &default.r#if {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+                !cond_str.is_empty()
+            }
+            None => false,
+        };
+
+        let is_value_dup = if has_real_condition {
+            is_duplicate(&mut seen_values, val_str.clone())
+        } else {
+            false
+        };
+
+        if already_unconditional && args.is_enabled(Check::DeadDefault) {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DeadDefault,
+                symbol: Some(var_symbol.to_owned()),
+                message: format!("dead default of {}", val_str),
+                arch: arch.to_owned(),
+            });
+        }
+
+        if args.is_enabled(Check::DuplicateDefaultValue) {
+            if default.r#if.is_some() && is_value_dup {
+                findings.push(Finding {
+                    severity: Severity::Style,
+                    check: Check::DuplicateDefaultValue,
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!(
+                        "duplicate default value of {}; consider combining the conditions with a logical-or: ||",
+                        val_str
+                    ),
+                    arch: arch.to_owned(),
+                });
+            }
+        }
+
+        match &default.r#if {
+            Some(cond) => {
+                if is_duplicate(&mut seen_conditions, cond.to_string()) {
+                    if is_value_dup {
+                        if args.is_enabled(Check::DuplicateDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DuplicateDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("duplicate default condition of {:?}", cond),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    } else {
+                        if args.is_enabled(Check::DeadDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DeadDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("dead default of {}", val_str),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+            None => {
+                already_unconditional = true;
+            }
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs b/scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
new file mode 100644
index 000000000000..d458010cc3f1
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/curl_ffi.rs
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use core::ffi::c_void;
+use std::ffi::CStr;
+use std::ffi::CString;
+use std::os::raw::c_char;
+use std::os::raw::c_int;
+use std::os::raw::c_long;
+use std::sync::OnceLock;
+
+static CURL_INIT: OnceLock<()> = OnceLock::new();
+
+#[repr(C)]
+pub struct CURL {
+    _private: [u8; 0],
+}
+
+type CURLcode = c_int;
+type CURLoption = u32;
+type CURLINFO = u32;
+
+const CURLE_OK: CURLcode = 0;
+
+const CURL_GLOBAL_DEFAULT: c_long = 3;
+
+const CURLOPT_URL: CURLoption = 10002;
+const CURLOPT_NOBODY: CURLoption = 44;
+const CURLOPT_TIMEOUT: CURLoption = 13;
+const CURLOPT_FOLLOWLOCATION: CURLoption = 52;
+const CURLOPT_USERAGENT: CURLoption = 10018;
+const CURLOPT_HEADERFUNCTION: CURLoption = 20079;
+const CURLOPT_HEADERDATA: CURLoption = 10029;
+
+const CURLINFO_RESPONSE_CODE: CURLINFO = 0x200002;
+
+#[link(name = "curl")]
+unsafe extern "C" {}
+
+unsafe extern "C" {
+    fn curl_global_init(flags: c_long) -> CURLcode;
+
+    fn curl_easy_init() -> *mut CURL;
+
+    fn curl_easy_cleanup(handle: *mut CURL);
+
+    fn curl_easy_perform(handle: *mut CURL) -> CURLcode;
+
+    fn curl_easy_strerror(code: CURLcode) -> *const c_char;
+
+    fn curl_easy_setopt(handle: *mut CURL, option: CURLoption, ...) -> CURLcode;
+
+    fn curl_easy_getinfo(handle: *mut CURL, info: CURLINFO, ...) -> CURLcode;
+}
+
+fn init_curl() {
+    CURL_INIT.get_or_init(|| unsafe {
+        curl_global_init(CURL_GLOBAL_DEFAULT);
+    });
+}
+
+fn curl_error(code: CURLcode) -> String {
+    unsafe {
+        let ptr = curl_easy_strerror(code);
+
+        if ptr.is_null() {
+            return format!("curl error {}", code);
+        }
+
+        CStr::from_ptr(ptr).to_string_lossy().into_owned()
+    }
+}
+
+struct HeaderCapture {
+    location: Option<String>,
+}
+
+extern "C" fn header_callback(
+    buffer: *mut c_char,
+    size: usize,
+    nitems: usize,
+    userdata: *mut c_void,
+) -> usize {
+    let total = size * nitems;
+
+    unsafe {
+        let bytes = std::slice::from_raw_parts(buffer as *const u8, total);
+
+        if let Ok(header) = std::str::from_utf8(bytes) {
+            let lower = header.to_ascii_lowercase();
+
+            if lower.starts_with("location:") {
+                if let Some((_, value)) = header.split_once(':') {
+                    let capture = &mut *(userdata as *mut HeaderCapture);
+
+                    capture.location = Some(value.trim().to_string());
+                }
+            }
+        }
+    }
+
+    total
+}
+
+#[derive(Debug)]
+pub struct HttpResponse {
+    pub response_code: u16,
+    pub location: Option<String>,
+}
+
+pub fn head_request(url: &str) -> Result<HttpResponse, String> {
+    init_curl();
+
+    unsafe {
+        let curl = curl_easy_init();
+
+        if curl.is_null() {
+            return Err("curl_easy_init failed".into());
+        }
+
+        let url_c = match CString::new(url) {
+            Ok(v) => v,
+            Err(_) => {
+                curl_easy_cleanup(curl);
+
+                return Err("invalid URL".into());
+            }
+        };
+
+        let ua_c = CString::new("link-checker/1.0").unwrap();
+
+        let mut headers = HeaderCapture { location: None };
+
+        macro_rules! setopt {
+            ($opt:expr, $val:expr) => {{
+                let rc = curl_easy_setopt(curl, $opt, $val);
+
+                if rc != CURLE_OK {
+                    curl_easy_cleanup(curl);
+
+                    return Err(curl_error(rc));
+                }
+            }};
+        }
+
+        setopt!(CURLOPT_URL, url_c.as_ptr());
+        setopt!(CURLOPT_NOBODY, 1 as c_long);
+        setopt!(CURLOPT_TIMEOUT, 10 as c_long);
+        setopt!(CURLOPT_FOLLOWLOCATION, 0 as c_long);
+        setopt!(CURLOPT_USERAGENT, ua_c.as_ptr());
+
+        setopt!(
+            CURLOPT_HEADERFUNCTION,
+            header_callback as extern "C" fn(_, _, _, _) -> _
+        );
+
+        setopt!(CURLOPT_HEADERDATA, &mut headers as *mut _ as *mut c_void);
+
+        let rc = curl_easy_perform(curl);
+
+        if rc != CURLE_OK {
+            curl_easy_cleanup(curl);
+
+            return Err(curl_error(rc));
+        }
+
+        let mut response_code: c_long = 0;
+
+        let rc = curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &mut response_code);
+
+        if rc != CURLE_OK {
+            curl_easy_cleanup(curl);
+
+            return Err(curl_error(rc));
+        }
+
+        curl_easy_cleanup(curl);
+
+        Ok(HttpResponse {
+            response_code: response_code as u16,
+            location: headers.location,
+        })
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/dead_links.rs b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
new file mode 100644
index 000000000000..47bbd5c09114
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/dead_links.rs
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::curl_ffi::head_request;
+use std::collections::HashSet;
+
+#[derive(PartialEq, Debug)]
+pub enum LinkStatus {
+    Ok,
+    ProbablyBlocked,
+    Redirected(String),
+    NotFound,
+    ServerError,
+    Unreachable(String),
+    UnsupportedScheme(String),
+}
+
+pub fn check_link(url: &str) -> LinkStatus {
+    if let Some(scheme) = url.split("://").next() {
+        match scheme {
+            "http" | "https" => return check_http(url),
+
+            "git" | "ftp" => {
+                return LinkStatus::UnsupportedScheme(scheme.into());
+            }
+
+            _ => {
+                return LinkStatus::UnsupportedScheme(scheme.into());
+            }
+        }
+    }
+
+    LinkStatus::Unreachable("invalid URL".into())
+}
+
+fn check_http(url: &str) -> LinkStatus {
+    let response = match head_request(url) {
+        Ok(r) => r,
+        Err(e) => return LinkStatus::Unreachable(e),
+    };
+
+    match response.response_code {
+        200..=299 => LinkStatus::Ok,
+
+        301 | 302 => LinkStatus::Redirected(response.location.unwrap_or_else(|| "unknown".into())),
+
+        403 | 429 => LinkStatus::ProbablyBlocked,
+
+        404 => LinkStatus::NotFound,
+
+        500..=599 => LinkStatus::ServerError,
+
+        _ => LinkStatus::ProbablyBlocked,
+    }
+}
+
+pub fn find_links(text: &str) -> Vec<String> {
+    fn is_scheme_char(c: u8) -> bool {
+        c.is_ascii_alphanumeric() || matches!(c, b'+' | b'-' | b'.')
+    }
+
+    fn is_url_terminator(c: u8) -> bool {
+        c.is_ascii_whitespace()
+            || matches!(
+                c,
+                b'"' | b'\'' | b'<' | b'>' | b'(' | b')' | b'[' | b']' | b'{' | b'}'
+            )
+    }
+
+    let bytes = text.as_bytes();
+
+    let mut links = Vec::new();
+    let mut seen = HashSet::new();
+
+    let mut i = 0;
+
+    while i + 3 < bytes.len() {
+        if bytes[i] == b':' && bytes[i + 1] == b'/' && bytes[i + 2] == b'/' {
+            // walk backward to find scheme start
+            let mut start = i;
+
+            while start > 0 && is_scheme_char(bytes[start - 1]) {
+                start -= 1;
+            }
+
+            // require non-empty scheme
+            if start == i {
+                i += 3;
+                continue;
+            }
+
+            // first char must be alphabetic
+            if !bytes[start].is_ascii_alphabetic() {
+                i += 3;
+                continue;
+            }
+
+            // walk forward to url end
+            let mut end = i + 3;
+
+            while end < bytes.len() && !is_url_terminator(bytes[end]) {
+                end += 1;
+            }
+
+            let mut url = &text[start..end];
+
+            // trim trailing punctuation
+            url = url.trim_end_matches(&['.', ',', ';', ':', '!', '?'][..]);
+
+            // trim unmatched markdown
+            while let Some(last) = url.chars().last() {
+                let trim = match last {
+                    ')' => url.matches('(').count() < url.matches(')').count(),
+
+                    ']' => url.matches('[').count() < url.matches(']').count(),
+
+                    '}' => url.matches('{').count() < url.matches('}').count(),
+
+                    _ => false,
+                };
+
+                if trim {
+                    url = &url[..url.len() - last.len_utf8()];
+                } else {
+                    break;
+                }
+            }
+
+            if seen.insert(url) {
+                links.push(url.to_string());
+            }
+
+            i = end;
+        } else {
+            i += 1;
+        }
+    }
+
+    links
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/lib.rs b/scripts/kconfirm/kconfirm-lib/src/lib.rs
new file mode 100644
index 000000000000..6be0199f0785
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/lib.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use analyze::analyze;
+pub use checks::AnalysisArgs;
+pub use checks::Check;
+pub use checks::check_select_visible;
+pub use checks::check_variable_info;
+use nom_kconfig::Entry;
+use nom_kconfig::KconfigInput;
+use nom_kconfig::parse_kconfig;
+use output::*;
+use symbol_table::*;
+mod analyze;
+mod checks;
+mod curl_ffi;
+mod dead_links;
+pub mod output;
+pub mod symbol_table;
+
+pub fn check_kconfig(
+    args: AnalysisArgs,
+    kconfig_files: Vec<(String, KconfigInput)>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut symbol_table = SymbolTable::new();
+
+    for (arch_config_option, kconfig_file) in kconfig_files {
+        match parse_kconfig(kconfig_file) {
+            Ok(parsed) => {
+                let entries: Vec<Entry> = parsed.1.entries;
+                findings.extend(analyze(
+                    &args,
+                    &mut symbol_table,
+                    arch_config_option,
+                    entries,
+                ));
+            }
+            Err(e) => {
+                findings.push(Finding {
+                    severity: Severity::Fatal,
+                    check: Check::FailedParse,
+                    symbol: None,
+                    message: format!("Failed to parse kconfig, error is: {}", e),
+                    arch: arch_config_option,
+                });
+            }
+        }
+    }
+
+    for (var_symbol, type_info) in &symbol_table.raw {
+        for (arch_specific, redefinitions) in &type_info.attribute_defs {
+            for (_definition_condition, info) in redefinitions {
+                findings.extend(check_variable_info(&args, var_symbol, arch_specific, info));
+            }
+        }
+
+        if args.is_enabled(Check::SelectVisible) {
+            findings.extend(check_select_visible(var_symbol, type_info));
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/output.rs b/scripts/kconfirm/kconfirm-lib/src/output.rs
new file mode 100644
index 000000000000..e0d8bf8342d5
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/output.rs
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::Check;
+use std::fmt;
+
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
+pub enum Severity {
+    Fatal,
+    Error, // will be used for known bugs, e.g. unmet dependencies
+    Warning,
+    Style,
+}
+
+#[derive(Debug)]
+pub struct Finding {
+    pub severity: Severity,
+    pub check: Check,
+    pub symbol: Option<String>,
+    pub message: String,
+    pub arch: String,
+}
+
+impl Finding {
+    fn fmt_with_arches(&self, f: &mut fmt::Formatter, arches: &[&str]) -> fmt::Result {
+        let arch_part = if arches.is_empty() {
+            String::new()
+        } else {
+            format!(" [{}]", arches.join(", "))
+        };
+
+        match &self.symbol {
+            Some(s) => write!(
+                f,
+                "{} [{}]{} config {}: {}",
+                self.severity,
+                self.check.as_str(),
+                arch_part,
+                s,
+                self.message
+            ),
+            None => write!(
+                f,
+                "{} [{}]{} {}",
+                self.severity,
+                self.check.as_str(),
+                arch_part,
+                self.message
+            ),
+        }
+    }
+}
+
+impl fmt::Display for Finding {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        self.fmt_with_arches(f, &[])
+    }
+}
+
+pub fn print_findings(mut findings: Vec<Finding>) {
+    findings.sort_by(|a, b| {
+        (
+            &a.severity,
+            a.check.as_str(),
+            &a.symbol,
+            &a.message,
+            &a.arch,
+        )
+            .cmp(&(
+                &b.severity,
+                b.check.as_str(),
+                &b.symbol,
+                &b.message,
+                &b.arch,
+            ))
+    });
+
+    for group in findings.chunk_by(|a, b| {
+        a.severity == b.severity
+            && a.check.as_str() == b.check.as_str()
+            && a.symbol == b.symbol
+            && a.message == b.message
+    }) {
+        let head = &group[0];
+
+        let mut arches: Vec<&str> = Vec::new();
+        for f in group {
+            if arches.last() != Some(&f.arch.as_str()) {
+                arches.push(&f.arch);
+            }
+        }
+
+        // Use a small wrapper so we can call our custom formatter via println!
+        struct Wrap<'a>(&'a Finding, &'a [&'a str]);
+        impl fmt::Display for Wrap<'_> {
+            fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+                self.0.fmt_with_arches(f, self.1)
+            }
+        }
+        println!("{}", Wrap(head, &arches));
+    }
+}
+
+impl fmt::Display for Severity {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        match self {
+            Severity::Fatal => write!(f, "FATAL  "),
+            Severity::Error => write!(f, "ERROR  "),
+            Severity::Warning => write!(f, "WARNING"),
+            Severity::Style => write!(f, "STYLE   "),
+        }
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
new file mode 100644
index 000000000000..48abb46c1945
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-lib/src/symbol_table.rs
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use nom_kconfig::attribute::DefaultAttribute;
+use nom_kconfig::attribute::Expression;
+use nom_kconfig::attribute::OrExpression;
+use nom_kconfig::attribute::Range;
+use nom_kconfig::attribute::r#type::Type;
+use std::collections::HashMap;
+use std::collections::hash_map;
+
+type KconfigSymbol = String;
+type Arch = String;
+type Cond = Option<Expression>;
+
+// NOTE: we cannot add these elements to the solver until we've processed all variables,
+// because we need to know all of the selectors.
+#[derive(Debug, Clone)]
+pub struct TypeInfo {
+    pub kconfig_type: Option<Type>, // 'None' when we don't know the type (e.g. if it's a dangling reference)
+
+    // maps the selector to an (ARCH, select_cond)
+    // - if the ARCH is None, then it's not arch-specific
+    // if the select_cond is None, then it's unconditional
+    pub selected_by: HashMap<KconfigSymbol, Vec<(Arch, Cond)>>, // .0 only selects it when .1 is true.
+
+    // there is one of these per entry (each entry expected to have a different definedness condition)
+    // maps architecture option name (or none if not arch-specific) to:
+    // [([condition], config definition)]
+    // - NOTE: there can be multiple partial definitions under the same condition, or mutually-exclusive conditions, or a subset condition.
+    pub attribute_defs: HashMap<Arch, Vec<(Vec<Expression>, AttributeDef)>>, // the innermost `Vec<Expression>` represents each nested condition that was reached (we will eventually need to AND them all)
+}
+
+// everything is a vector because we may encounter multiple over time,
+//   so we won't know until the end what the condition is.
+#[derive(Debug, Clone)]
+pub struct AttributeDef {
+    pub kconfig_dependencies: Vec<OrExpression>,
+    pub kconfig_ranges: Vec<Range>,
+    pub kconfig_defaults: Vec<DefaultAttribute>,
+    pub visibility: Vec<Option<OrExpression>>,
+    pub selects: Vec<(KconfigSymbol, Cond)>,
+    pub implies: Vec<(KconfigSymbol, Cond)>,
+}
+
+impl TypeInfo {
+    fn new_empty() -> Self {
+        Self {
+            kconfig_type: None,
+            selected_by: HashMap::new(),
+            attribute_defs: HashMap::new(),
+        }
+    }
+
+    // TODO: we should consider having separate functions for:
+    // 1. merge-inserting a redef of attributes (NOTE: the type definition is actually part of the redef, but we aren't handling type-redefinitions for now)
+    // 2. selectors
+    fn insert(
+        &mut self,
+        kconfig_type: Option<Type>,
+        raw_constraints: Vec<OrExpression>,
+        kconfig_ranges: Vec<Range>,
+        kconfig_defaults: Vec<DefaultAttribute>,
+        visibility: Vec<Option<OrExpression>>,
+        arch: String,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+        implies: Vec<(KconfigSymbol, Cond)>,
+    ) {
+        // type merge
+        match (&self.kconfig_type, &kconfig_type) {
+            (None, Some(_)) => self.kconfig_type = kconfig_type.clone(),
+            (Some(_), Some(new)) if Some(new) != self.kconfig_type.as_ref() => {
+                // TODO: not doing anything with redefined types yet.
+                //       later, we will want to consider e.g. bool/def_bool the same type (and possibly int/hex?) but not bool/tristate, so we need to build out typechecking.
+            }
+            _ => {}
+        }
+
+        // selected_by merge
+        if let Some(sb) = selected_by {
+            merge_selected_by(&mut self.selected_by, arch.clone(), sb);
+        }
+
+        // variable_info merge:
+        //   we only want to add an attribute redefinition if the things in the attribute def aren't empty
+        //   (the visibility is just additional info to capture)
+        if (&kconfig_type).is_some() // we need to ensure that we have an empty definition here if the config option had a type definition
+            || !raw_constraints.is_empty()
+            || !kconfig_ranges.is_empty()
+            || !kconfig_defaults.is_empty()
+            || !selects.is_empty()
+            || !implies.is_empty()
+        {
+            insert_variable_info(
+                &mut self.attribute_defs,
+                arch,
+                definition_condition,
+                AttributeDef {
+                    kconfig_dependencies: raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    selects,
+                    implies,
+                },
+            );
+        }
+    }
+}
+
+// the visibility and the dependencies will each need to be AND'd (separately)
+// the defaults should each be handled separately.
+pub struct ChoiceData {
+    //pub inner_vars: Vec<String>,
+    pub arch: Arch,
+    pub visibility: Cond,
+    pub dependencies: Vec<OrExpression>, // this is the menu's dependencies (and inherited dependencies from the file)
+    pub defaults: Vec<DefaultAttribute>, // these are each of the conditional defaults for the choice
+}
+
+// NOTE: it might be better if TypeInfo is an enum with a single value,
+//       e.g. Unsolved(kconfig_raw) and Solved(z3_ast)
+pub struct SymbolTable {
+    pub raw: HashMap<KconfigSymbol, TypeInfo>,
+    pub choices: Vec<ChoiceData>,
+    pub modules_option: Option<KconfigSymbol>, // None until we find the modules attribute in exactly 1 config option
+}
+
+impl SymbolTable {
+    pub fn new() -> Self {
+        SymbolTable {
+            raw: HashMap::new(),
+            choices: Vec::new(),
+            modules_option: None,
+        }
+    }
+
+    pub fn from_parts(
+        raw: HashMap<KconfigSymbol, TypeInfo>,
+        choices: Vec<ChoiceData>,
+        modules_option: Option<KconfigSymbol>,
+    ) -> Self {
+        SymbolTable {
+            raw,
+            choices,
+            modules_option,
+        }
+    }
+
+    pub fn merge_insert_new_solved(
+        &mut self,
+        var: KconfigSymbol,
+        kconfig_type: Option<Type>,
+        raw_constraints: Vec<OrExpression>,
+        kconfig_ranges: Vec<Range>,
+        kconfig_defaults: Vec<DefaultAttribute>,
+        visibility: Vec<Option<OrExpression>>,
+        arch: Arch,
+        definition_condition: Vec<OrExpression>,
+        selected_by: Option<(KconfigSymbol, Cond)>,
+        selects: Vec<(KconfigSymbol, Cond)>,
+        implies: Vec<(KconfigSymbol, Cond)>,
+    ) {
+        let entry = self.raw.entry(var.clone());
+
+        match entry {
+            hash_map::Entry::Vacant(v) => {
+                let mut t = TypeInfo::new_empty();
+                t.insert(
+                    kconfig_type,
+                    raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    arch,
+                    definition_condition,
+                    selected_by,
+                    selects,
+                    implies,
+                );
+                v.insert(t);
+            }
+
+            hash_map::Entry::Occupied(mut o) => {
+                let t = o.get_mut();
+
+                t.insert(
+                    kconfig_type,
+                    raw_constraints,
+                    kconfig_ranges,
+                    kconfig_defaults,
+                    visibility,
+                    arch,
+                    definition_condition,
+                    selected_by,
+                    selects,
+                    implies,
+                );
+            }
+        }
+    }
+}
+
+fn merge_selected_by(
+    map: &mut HashMap<String, Vec<(Arch, Cond)>>,
+    arch: Arch,
+    selected_by: (KconfigSymbol, Cond),
+) {
+    map.entry(selected_by.0)
+        .or_default() // empty vec
+        .push((arch, selected_by.1));
+}
+
+fn insert_variable_info(
+    map: &mut HashMap<Arch, Vec<(Vec<Expression>, AttributeDef)>>,
+    arch: Arch,
+    definition_condition: Vec<Expression>,
+    info: AttributeDef,
+) {
+    map.entry(arch)
+        .or_default() // empty vec
+        .push((definition_condition, info));
+}
diff --git a/scripts/kconfirm/kconfirm-linux/Cargo.toml b/scripts/kconfirm/kconfirm-linux/Cargo.toml
new file mode 100644
index 000000000000..9516399e1dae
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/Cargo.toml
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+[package]
+name = "kconfirm-linux"
+version = "0.10.0"
+edition = "2024"
+rust-version.workspace = true
+
+[dependencies]
+kconfirm-lib = { path = "../kconfirm-lib" }
+nom-kconfig = { workspace = true }
diff --git a/scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs b/scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
new file mode 100644
index 000000000000..227faa17b962
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/getopt_ffi.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use std::env;
+use std::ffi::CStr;
+use std::ffi::CString;
+use std::os::raw::c_char;
+use std::os::raw::c_int;
+use std::ptr;
+
+pub const REQUIRED_ARGUMENT: c_int = 1;
+
+#[repr(C)]
+pub struct option {
+    pub name: *const c_char,
+    pub has_arg: c_int,
+    pub flag: *mut c_int,
+    pub val: c_int,
+}
+
+#[link(name = "c")]
+unsafe extern "C" {
+    fn getopt_long(
+        argc: c_int,
+        argv: *mut *mut c_char,
+        optstring: *const c_char,
+        longopts: *const option,
+        longindex: *mut c_int,
+    ) -> c_int;
+
+    static mut optarg: *mut c_char;
+    static mut optind: c_int;
+}
+
+pub struct Getopt {
+    _cstrings: Vec<CString>,
+    argv: Vec<*mut c_char>,
+    argc: c_int,
+}
+
+impl Getopt {
+    pub fn new() -> Self {
+        let raw_args: Vec<String> = env::args().collect();
+
+        let cstrings: Vec<CString> = raw_args
+            .iter()
+            .map(|s| CString::new(s.as_str()).unwrap())
+            .collect();
+
+        let mut argv: Vec<*mut c_char> =
+            cstrings.iter().map(|s| s.as_ptr() as *mut c_char).collect();
+
+        argv.push(ptr::null_mut());
+
+        let argc = (argv.len() - 1) as c_int;
+
+        Self {
+            _cstrings: cstrings,
+            argv,
+            argc,
+        }
+    }
+
+    pub fn reset(&mut self) {
+        unsafe {
+            optind = 1;
+        }
+    }
+
+    pub fn next(
+        &mut self,
+        optstring: &CStr,
+        longopts: &[option],
+    ) -> Option<Result<(char, Option<String>), String>> {
+        unsafe {
+            let c = getopt_long(
+                self.argc,
+                self.argv.as_mut_ptr(),
+                optstring.as_ptr(),
+                longopts.as_ptr(),
+                ptr::null_mut(),
+            );
+
+            if c == -1 {
+                return None;
+            }
+
+            if c == '?' as c_int {
+                return Some(Err("invalid argument".into()));
+            }
+
+            let arg = if optarg.is_null() {
+                None
+            } else {
+                Some(CStr::from_ptr(optarg).to_string_lossy().into_owned())
+            };
+
+            Some(Ok((c as u8 as char, arg)))
+        }
+    }
+}
diff --git a/scripts/kconfirm/kconfirm-linux/src/lib.rs b/scripts/kconfirm/kconfirm-linux/src/lib.rs
new file mode 100644
index 000000000000..f52399d2c9e5
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/lib.rs
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use nom_kconfig::KconfigFile;
+use std::io;
+use std::path::PathBuf;
+
+pub const ALL_ARCHITECTURES: [&str; 21] = [
+    "arm",
+    "arm64",
+    "x86",
+    "riscv",
+    "mips",
+    "xtensa",
+    "sparc",
+    "alpha",
+    "arc",
+    "csky",
+    "hexagon",
+    "loongarch",
+    "m68k",
+    "microblaze",
+    "nios2",
+    "openrisc",
+    "parisc",
+    "powerpc",
+    "s390",
+    "sh",
+    "um",
+];
+
+// each architecture has its own directory, and config option.
+// most are the same, but powerpc / ppc and um / uml are not.
+// this maps the directory to the config option
+pub fn arch_dir_to_config(arch_dir: &str) -> String {
+    match arch_dir {
+        "powerpc" => String::from("PPC"),
+        "um" => String::from("UML"),
+        _ => String::from(arch_dir).to_uppercase(),
+    }
+}
+
+pub struct LinuxKconfig {
+    pub arch_config_option: String,
+    pub kconfig_file: KconfigFile,
+    pub file_contents: String,
+}
+
+// collects the root kconfig file, and all of the arch-specific kconfig files
+pub fn collect_kconfig_root_files(
+    archs: Vec<String>,
+    linux_source: PathBuf,
+) -> io::Result<Vec<LinuxKconfig>> {
+    let mut all_root_kconfig_files = Vec::new();
+
+    // add the root kconfig file
+    let root_kconfig_path = PathBuf::from("Kconfig"); // doesn't include the arch: arch/x86/Kconfig
+    let root_kconfig_file = KconfigFile::new(linux_source.clone(), root_kconfig_path.clone());
+
+    for arch_dir in archs {
+        let mut cur_root_kconfig_file = root_kconfig_file.clone();
+
+        if arch_dir == "um" {
+            // this is only used by the 'um' architecture to include arch/x86/um/Kconfig
+            cur_root_kconfig_file.add_local_var("HEADER_ARCH", "x86");
+        }
+
+        cur_root_kconfig_file.add_local_var("SRCARCH", &arch_dir);
+
+        let linux_kconfig = LinuxKconfig {
+            arch_config_option: arch_dir_to_config(&arch_dir),
+            file_contents: root_kconfig_file.read_to_string()?,
+            kconfig_file: cur_root_kconfig_file,
+        };
+
+        all_root_kconfig_files.push(linux_kconfig);
+    }
+
+    Ok(all_root_kconfig_files)
+}
diff --git a/scripts/kconfirm/kconfirm-linux/src/main.rs b/scripts/kconfirm/kconfirm-linux/src/main.rs
new file mode 100644
index 000000000000..03554a94f57c
--- /dev/null
+++ b/scripts/kconfirm/kconfirm-linux/src/main.rs
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+use crate::getopt_ffi::Getopt;
+use crate::getopt_ffi::REQUIRED_ARGUMENT;
+use crate::getopt_ffi::option;
+use kconfirm_lib::AnalysisArgs;
+use kconfirm_lib::Check;
+use kconfirm_lib::check_kconfig;
+use kconfirm_lib::output::print_findings;
+use kconfirm_linux::ALL_ARCHITECTURES;
+use kconfirm_linux::collect_kconfig_root_files;
+use nom_kconfig::KconfigInput;
+use std::collections::HashSet;
+use std::io;
+use std::path::PathBuf;
+use std::ptr;
+use std::str::FromStr;
+mod getopt_ffi;
+
+fn split_csv_arg(dst: &mut Vec<String>, value: &str) {
+    dst.extend(
+        value
+            .split(',')
+            .filter(|s| !s.is_empty())
+            .map(|s| s.to_string()),
+    );
+}
+
+#[derive(Debug)]
+pub struct Args {
+    pub linux_path: PathBuf,
+    pub enable_arch: Vec<String>,
+    pub disable_arch: Vec<String>,
+    pub enable_check: Vec<String>,
+    pub disable_check: Vec<String>,
+}
+
+pub fn parse_args() -> Result<Args, String> {
+    let mut linux_path: Option<PathBuf> = None;
+    let mut enable_arch = Vec::new();
+    let mut disable_arch = Vec::new();
+    let mut enable_check = Vec::new();
+    let mut disable_check = Vec::new();
+
+    let long_options = [
+        option {
+            name: c"linux-path".as_ptr(),
+            has_arg: REQUIRED_ARGUMENT,
+            flag: ptr::null_mut(),
+            val: 'l' as _,
+        },
+        option {
+            name: c"enable-arch".as_ptr(),
+            has_arg: REQUIRED_ARGUMENT,
+            flag: ptr::null_mut(),
+            val: 'a' as _,
+        },
+        option {
+            name: c"disable-arch".as_ptr(),
+            has_arg: REQUIRED_ARGUMENT,
+            flag: ptr::null_mut(),
+            val: 'x' as _,
+        },
+        option {
+            name: c"enable-check".as_ptr(),
+            has_arg: REQUIRED_ARGUMENT,
+            flag: ptr::null_mut(),
+            val: 'e' as _,
+        },
+        option {
+            name: c"disable-check".as_ptr(),
+            has_arg: REQUIRED_ARGUMENT,
+            flag: ptr::null_mut(),
+            val: 'd' as _,
+        },
+        option {
+            name: ptr::null(),
+            has_arg: 0,
+            flag: ptr::null_mut(),
+            val: 0,
+        },
+    ];
+
+    let mut getopt = Getopt::new();
+
+    getopt.reset();
+
+    while let Some(result) = getopt.next(c"l:a:x:e:d:", &long_options) {
+        let (opt, arg) = result?;
+
+        match opt {
+            'l' => {
+                linux_path = Some(PathBuf::from(arg.unwrap()));
+            }
+
+            'a' => {
+                split_csv_arg(&mut enable_arch, &arg.unwrap());
+            }
+
+            'x' => {
+                split_csv_arg(&mut disable_arch, &arg.unwrap());
+            }
+
+            'e' => {
+                split_csv_arg(&mut enable_check, &arg.unwrap());
+            }
+
+            'd' => {
+                split_csv_arg(&mut disable_check, &arg.unwrap());
+            }
+
+            _ => {}
+        }
+    }
+
+    let linux_path = linux_path.ok_or("--linux-path is required")?;
+
+    if enable_arch.is_empty() {
+        return Err("--enable-arch is required".into());
+    }
+
+    Ok(Args {
+        linux_path,
+        enable_arch,
+        disable_arch,
+        enable_check,
+        disable_check,
+    })
+}
+
+fn main() -> io::Result<()> {
+    let cli_args = parse_args().unwrap_or_else(|e| {
+        eprintln!("error: {e}");
+        std::process::exit(1);
+    });
+    let mut enabled_checks: HashSet<Check> = [
+        Check::DuplicateDependency,
+        Check::DuplicateRange,
+        Check::DeadRange,
+        Check::DuplicateSelect,
+        Check::DeadDefault,
+        Check::ConstantCondition,
+        Check::DuplicateDefault,
+        Check::DuplicateImply,
+        Check::ReverseRange,
+    ]
+    .into_iter()
+    .collect(); // apply --enable-check
+    for name in &cli_args.enable_check {
+        if let Ok(c) = Check::from_str(name) {
+            enabled_checks.insert(c);
+        } else {
+            eprintln!("Error: check {} does not exist", name);
+            std::process::exit(1);
+        }
+    } // apply --disable-check
+    for name in &cli_args.disable_check {
+        if let Ok(c) = Check::from_str(name) {
+            enabled_checks.remove(&c);
+        } else {
+            eprintln!("Error: check {} does not exist", name);
+            std::process::exit(1);
+        }
+    }
+    let analysis_args = AnalysisArgs { enabled_checks };
+    let mut selected_arches: HashSet<String> = cli_args.enable_arch.iter().cloned().collect(); // apply --disable-arch
+    for arch in &cli_args.disable_arch {
+        selected_arches.remove(arch);
+    }
+    for desired_arch in &selected_arches {
+        if !ALL_ARCHITECTURES.contains(&desired_arch.as_str()) {
+            eprintln!("Error: unexpected architecture, please pass one of the following:");
+            for available_arch in ALL_ARCHITECTURES {
+                eprint!("{} ", available_arch);
+            }
+            eprintln!("");
+            std::process::exit(1);
+        }
+    }
+    let kconfig_files =
+        collect_kconfig_root_files(selected_arches.into_iter().collect(), cli_args.linux_path)?;
+    let kconfig_inputs = kconfig_files
+        .iter()
+        .map(|kconfig| {
+            let kconfig_input =
+                KconfigInput::new_extra(&kconfig.file_contents, kconfig.kconfig_file.clone());
+            (kconfig.arch_config_option.clone(), kconfig_input)
+        })
+        .collect();
+    let findings = check_kconfig(analysis_args, kconfig_inputs);
+    print_findings(findings);
+    Ok(())
+}
-- 
2.53.0


