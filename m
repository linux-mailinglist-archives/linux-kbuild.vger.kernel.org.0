Return-Path: <linux-kbuild+bounces-12820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OSLIJzO4mm6+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12820-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2F41F595
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 283F9301FDD1
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E20B1A08AF;
	Sat, 18 Apr 2026 00:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gFGic+mA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800402BD11;
	Sat, 18 Apr 2026 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471685; cv=none; b=ZjjGDVC+Js8j9GK1MnkKwobX+lr2PleyfXzN2wMzolBlmb5bK+PP1rpgKLa1k8JT0s4PYaQ+/l/kAkR/+Hphkb3UvXDk4PIaIxMmvdIFNqVeOhBYgNuG0hiJ95fpB46IA3r+DhThIex0Ds9lys8DB8MnbA3bZwCwELNLh5n851c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471685; c=relaxed/simple;
	bh=a68j4Z0sCXCR2LC2g+qqAXnmrh2VdldaQPhx1rzCvGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCdLN4PZ/rz/NrgvGDPqZko0RFiOeEMRf8cfTpc0zazKgsItNxv4mvC2JAZXTMcuRl1l98m0lC7mEvmLWp680K4iIxBlnaWtlh2RoVaItPyn9RIicETMoee7seiBDD5moYdYQEeKRnEoQtB7C/FZjDC1ekVntwo02MfraoVvhkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gFGic+mA; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471683; x=1808007683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GPvZYLHi+SzWU+lMBIEDfCNCTqBfFFd6++SRfnwBTDY=;
  b=gFGic+mAuogNJNynlL7LK0YasnvE23zKSikUg4koZY5ADOurH/H5qY5w
   p7v0FwtBvcp6hc5XCm1x+2I6qyk+GT4TGavigpf+b/orP33NB0PcrV2sI
   6Vyfcu4Qb4hKdm4CEMwuexeI7bPIoN5hS/G94DXDdo3QPNG2gJ5UrLURy
   NmKtuXnFcg/jUoNoN9799bcq1u4N//iQn1LHxLR9Nlt/UwWGBh4Ak84vm
   EHaknUad/RVHo3iQsrLJdjrIihxOO8v7FSRpk5QYwBrMDYb4J9ozi2PDW
   1kYI5F2QrHwcWFQaJVN9Cu9OZcAxus83CfeTOIcD5K/s9Wv/IFpwEvMHz
   Q==;
X-CSE-ConnectionGUID: aTyE9ZjhQaiOA9PkYNQb+Q==
X-CSE-MsgGUID: JIerLxjWQnaSNpLkMVknfQ==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17593190"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:23 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:3498]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.208:2525] with esmtp (Farcaster)
 id 27e9d03d-b66e-49c6-929e-b5f39c343429; Sat, 18 Apr 2026 00:21:22 +0000 (UTC)
X-Farcaster-Flow-ID: 27e9d03d-b66e-49c6-929e-b5f39c343429
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:20 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:19 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 03/19] build: special compilation rule for building the standalone crypto module
Date: Sat, 18 Apr 2026 00:20:11 +0000
Message-ID: <20260418002032.2877-4-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D036UWC004.ant.amazon.com (10.13.139.205) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12820-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FD2F41F595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add special build rules to redirect builtin crypto algorithms into a
standalone module `fips140.ko` instead of the main kernel, by introducing
a new crypto-objs-y compilation rule that collects crypto objects to
fips140.ko when CONFIG_CRYPTO_FIPS140_EXTMOD is enabled. Details as below:

Originally, builtin crypto (i.e., which specified by
CONFIG_CRYPTO_{NAME}=y) are compiled into main kernel by default. On the
contrary, this standalone crypto module feature requires compiling builtin
crypto into modules while ensuring such cryptos are not included into main
kernel anymore.

A naive way is to have a separate makefile containing all compilation
rules for all cryptos for such standalone module, but such makefile could
be too large to be scalable to arbitrary CONFIG_CRYPTO_{NAME}
configuration, plus, this method cannot ensure the builtin crypto is
completely removed from main kernel either.

To tackle this challenge, this patch automates object linking redirection by
introducing special build logic for kernel crypto subsystem. Specifically:

First, to automatically collect crypto objects file while preserving the
original compilation setting (such as flags, headers, path etc), it
introduces a specific compilation rule `crypto-objs-y += *.o` that replaces
the original rule `obj-y += *.o` in the crypto subsystem Makefile. As a
result, when the standalone crypto module feature is turned on, for any
crypto chosen to be builtin (e.g., crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2)
+= *.o where CONFIG_CRYPTO_SKCIPHER2=y), it will be automatically collected
and linked into a final object binary: `fips140.o`, with special
compilation flag (-DFIPS_MODULE=1) to tell each individual obj files
compiled in a specific way (will be used in later patches for generating
pluggable interface on main kernel side and module side respectively from
same source code). The implementation details are: it refers to the
methodology of how obj-y collecting method of vmlinux.o, it places the
`crypto-objs-y` rule in scripts/Makefile.build that will be run in each
directory Makefile, and create crypto-module.a that comprises all captured
`crypto-objs-y += *.o` under same folders. In its parent folders, such
crypto-module.a will be included into parents' crypto-module.a recursively
and eventually used to generate final fips140.o.

Second, to generate the final kernel module fips140.ko with the above
fips140.o, A naïve approach would be to directly inject the fips140.ko
module build into the existing modules generation pipeline (i.e., `make
modules`) by providing our pre-generated fips140.o. However, we choose
not to do this because it would create a circular make rule dependency
(which is invalid in Makefiles and causes build failures), resulting in
mutual dependencies between the modules and vmlinux targets (i.e.,
`modules:vmlinux` and `vmlinux:modules` at the same time).
This happens for the following reasons:

1. Since we will later embed fips140.ko into the final kernel image (as
   described in the later patch), we must make vmlinux depend on
   fips140.ko. In other words: vmlinux: fips140.ko.
2. When the kernel is built with CONFIG_DEBUG_INFO_BTF_MODULES=y, it
   requires: `modules: vmlinux`. This is because
   `CONFIG_DEBUG_INFO_BTF_MODULES=y` will take vmlinux as input to
   generate a `BTF` info for the module, and insert such info into the
   `.ko` module by default.
3. If we choose to inject fips140.ko into make modules, this would
   create a make rule dependency: `fips140.ko: modules`. Combined with
   items 1 and 2, this eventually creates an invalid circular dependency
   between vmlinux and modules.

Due to these reasons, the design choice is to use a separate make
pipeline (defined as `fips140-ready` in the Makefile). This new
pipeline reuses the same module generation scripts used by make
modules but adds additional logic in
scripts/Makefile.{modfinal|modinst|modpost} and scripts/mod/modpost.c
to handle module symbol generation and verification correctly. In such
pipeline, to eliminate the make rule dependency of
`fips140.ko:vmlinux` which imposed by `CONFIG_DEBUG_INFO_BTF_MODULES=y`,
we temporarily not generating BTF info for fips140.ko in this patch,
where the BTF info for fips140.ko will be generated in later patch in
a special manner.

Finally, with these special build rules, crypto/fips140/fips140.ko is generated.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                  |  34 +++++++++++-
 crypto/fips140/Makefile   |   4 +-
 scripts/Makefile.build    | 109 +++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.modfinal |  22 ++++++++
 scripts/Makefile.modinst  |  13 ++++-
 scripts/Makefile.modpost  |  25 +++++++++
 scripts/mod/modpost.c     |  24 +++++++--
 7 files changed, 223 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 54e1ae6020001..45218f2b7f51f 100644
--- a/Makefile
+++ b/Makefile
@@ -1329,6 +1329,38 @@ PHONY += vmlinux
 #  vmlinux: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+vmlinux: fips140-ready
+# Ensure fips140.ko is built before embedding
+fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fips140/fips140.mod vmlinux.o | modules_prepare
+	$(Q)$(MAKE) KBUILD_MODULES= -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(MAKE) KBUILD_MODULES=y crypto-module-gen=1 -f $(srctree)/scripts/Makefile.modpost
+ifneq ($(KBUILD_MODPOST_NOFINAL),1)
+	$(Q)$(MAKE) KBUILD_MODULES=y crypto-module-gen=1 -f $(srctree)/scripts/Makefile.modfinal
+endif
+	@:
+
+# Generate fips140.o from crypto-module.a files
+crypto/fips140/fips140.o: crypto-module.a FORCE
+	$(call if_changed,ld_fips140)
+crypto/fips140/.fips140.order: crypto/fips140/fips140.o
+	echo "crypto/fips140/fips140.o" > $@
+crypto/fips140/fips140.mod: crypto-module.a FORCE
+	$(call if_changed,fips140_mod)
+crypto/fips140/.fips140.symvers: fips140-ready
+	@:
+modpost: crypto/fips140/.fips140.symvers
+quiet_cmd_ld_fips140 = LD [M]  $@
+      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none --whole-archive $< --no-whole-archive -o $@
+
+cmd_fips140_mod = ar -t $< > $@
+
+# Add to targets so .cmd file is included
+targets += crypto/fips140/fips140.o crypto/fips140/fips140.mod
+
+# Bridge rule: crypto-module.a depends on directory build (like built-in.a)
+crypto-module.a: . ;
+endif
 vmlinux: vmlinux.o $(KBUILD_LDS) modpost
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux
 
@@ -2136,7 +2168,7 @@ prepare: outputmakefile
 # Error messages still appears in the original language
 PHONY += $(build-dir)
 $(build-dir): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 need-crypto=1 $(single-goals)
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
 PHONY += $(clean-dirs) clean
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index 364ef52c190fb..3b4a74ccf41ec 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -1,3 +1,5 @@
 
+crypto-objs-y += \
+	fips140-module.o 
 
-	
\ No newline at end of file
+clean-files:= .fips140.order .fips140.symvers
\ No newline at end of file
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3498d25b15e85..cf021ad77e153 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -29,6 +29,22 @@ ldflags-y  :=
 subdir-asflags-y :=
 subdir-ccflags-y :=
 
+crypto-objs-flags-y := -DFIPS_MODULE=1
+crypto-objs-y :=
+crypto-module-folders := crypto arch/$(ARCH)/crypto lib/crypto certs
+# Global crypto directory checking logic
+# Use relative paths so this works with both in-tree and O= out-of-tree builds
+define is-crypto-related-dir
+$(eval _obj-rel := $(patsubst ./%,%,$(obj)/$(1)))
+$(eval _obj-rel := $(patsubst %/,%,$(_obj-rel)))
+$(eval check-exact := $(filter $(crypto-module-folders),$(_obj-rel)))
+$(eval check-subdir := $(foreach dir,$(crypto-module-folders),$(filter $(dir)/%,$(_obj-rel))))
+$(eval check-ancestor := $(foreach dir,$(crypto-module-folders),$(if $(filter $(_obj-rel)/%,$(dir)),$(_obj-rel))))
+$(eval result := $(strip $(check-exact) $(check-subdir) $(check-ancestor)))
+$(result)
+endef
+is-crypto-related := $(call is-crypto-related-dir, ./)
+
 # Read auto.conf if it exists, otherwise ignore
 -include $(objtree)/include/config/auto.conf
 
@@ -45,6 +61,16 @@ KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
 # Figure out what we need to build from the various variables
 # ===========================================================================
 
+
+# Add crypto-objs-m to obj-m unconditionally
+obj-m += $(crypto-objs-m)
+
+# When CRYPTO_FIPS140_EXTMOD is not defined, add crypto-objs-y to obj-y and clear crypto-objs-y
+ifndef CONFIG_CRYPTO_FIPS140_EXTMOD
+obj-y += $(crypto-objs-y)
+crypto-objs-y :=
+endif
+
 # When an object is listed to be built compiled-in and modular,
 # only build the compiled-in version
 obj-m := $(filter-out $(obj-y),$(obj-m))
@@ -71,12 +97,27 @@ else
 obj-m := $(filter-out %/, $(obj-m))
 endif
 
+# Capture obj-y directories before conversion
+obj-y-dirs := $(filter %/, $(obj-y))
+
 ifdef need-builtin
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+# Add obj-y directories to crypto-objs-y only if they are crypto-related
+crypto-objs-y	+= $(strip $(foreach dir,$(obj-y-dirs),$(if $(strip $(call is-crypto-related-dir,$(patsubst %/,%,$(dir)))),$(dir))))
+
+ifdef need-crypto
+crypto-objs-y	:= $(patsubst %/, %/crypto-module.a, $(crypto-objs-y))
+else
+crypto-objs-y	:= $(filter-out %/, $(crypto-objs-y))
+endif
+endif
+
+
 # Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
 suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
 # List composite targets that are constructed by combining other targets
@@ -88,11 +129,17 @@ real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call
 multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
 multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+multi-crypto-objs-y := $(call multi-search, $(crypto-objs-y), .o, -objs -y)
+endif
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
 real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
 real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+real-crypto-objs-y := $(strip $(call real-search, $(crypto-objs-y), .o, -objs -y))
+endif
 
 always-y += $(always-m)
 
@@ -117,8 +164,14 @@ obj-m		:= $(addprefix $(obj)/, $(obj-m))
 lib-y		:= $(addprefix $(obj)/, $(lib-y))
 real-obj-y	:= $(addprefix $(obj)/, $(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/, $(real-obj-m))
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+real-crypto-objs-y := $(addprefix $(obj)/, $(real-crypto-objs-y))
+endif
 multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+multi-crypto-objs-y := $(addprefix $(obj)/, $(multi-crypto-objs-y))
+endif
 endif
 
 ifndef obj
@@ -137,7 +190,9 @@ endif
 # subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(obj-m)))
-
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+subdir-crypto := $(sort $(filter %/crypto-module.a, $(real-crypto-objs-y)))
+endif
 targets-for-builtin := $(extra-y)
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
@@ -148,6 +203,16 @@ ifdef need-builtin
 targets-for-builtin += $(obj)/built-in.a
 endif
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+targets-for-crypto :=
+ifneq ($(is-crypto-related),)
+ifdef need-crypto
+targets-for-crypto += $(obj)/crypto-module.a
+endif
+targets += $(obj)/crypto-module.a
+endif
+endif
+
 targets-for-modules := $(foreach x, o mod, \
 				$(patsubst %.o, %.$x, $(filter %.o, $(obj-m))))
 
@@ -222,6 +287,12 @@ $(obj)/%.ll: $(obj)/%.c FORCE
 
 is-single-obj-m = $(and $(part-of-module),$(filter $@, $(obj-m)),y)
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+is-single-crypto-obj-y = $(and $(part-of-module),$(filter $@, $(real-crypto-objs-y)),y)
+else
+is-single-crypto-obj-y =
+endif
+
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
 # o compile a <file>.o from <file>.c
@@ -277,7 +348,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
 ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(or $(is-single-obj-m),$(is-single-crypto-obj-y)),y))
 endif
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
@@ -435,6 +506,9 @@ $(obj)/%.o: $(obj)/%.S FORCE
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
 targets += $(filter-out $(subdir-modorder), $(real-obj-m))
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+targets += $(filter-out $(subdir-crypto), $(real-crypto-objs-y))
+endif
 targets += $(lib-y) $(always-y)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
@@ -461,6 +535,9 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # To build objects in subdirs, we need to descend into the directories
 $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+$(subdir-crypto): $(obj)/%/crypto-module.a: $(obj)/% ;
+endif
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -476,6 +553,32 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifneq ($(is-crypto-related),)
+$(obj)/crypto-module.a: $(real-crypto-objs-y) FORCE
+	$(call if_changed,ar_builtin)
+
+# Set module flags for crypto objects when building crypto-module.a
+ifdef need-crypto
+$(real-crypto-objs-y): private part-of-module := y
+$(real-crypto-objs-y): private modname := fips140
+$(real-crypto-objs-y): private KBUILD_CFLAGS += $(crypto-objs-flags-y)
+
+# Also set flags for individual objects that make up composite crypto objects
+$(foreach obj,$(multi-crypto-objs-y),$($(obj:.o=-y))): private part-of-module := y
+$(foreach obj,$(multi-crypto-objs-y),$($(obj:.o=-y))): private modname := fips140
+$(foreach obj,$(multi-crypto-objs-y),$($(obj:.o=-y))): private KBUILD_CFLAGS += $(crypto-objs-flags-y)
+
+# Multi-part crypto objects
+$(multi-crypto-objs-y): private part-of-module := y
+$(multi-crypto-objs-y): private modname := fips140
+$(multi-crypto-objs-y): private KBUILD_CFLAGS += $(crypto-objs-flags-y)
+$(multi-crypto-objs-y): %.o: %.mod FORCE
+	$(call if_changed_rule,ld_multi_m)
+$(call multi_depend, $(multi-crypto-objs-y), .o, -objs -y -m)
+endif
+endif
+endif
 # This is a list of build artifacts from the current Makefile and its
 # sub-directories. The timestamp should be updated when any of the member files.
 
@@ -548,6 +651,7 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
+	need-crypto=$(if $(and $(CONFIG_CRYPTO_FIPS140_EXTMOD), $(filter $@/crypto-module.a, $(subdir-crypto))),1) \
 	$(filter $@/%, $(single-subdir-goals))
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
@@ -571,6 +675,7 @@ endif
 
 $(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
 	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
+	 $(targets-for-crypto) \
 	 $(subdir-ym) $(always-y)
 	@:
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index adcbcde16a071..2e087355988ba 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -11,7 +11,15 @@ include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifeq ($(crypto-module-gen),1)
+modules := $(call read-file, crypto/fips140/.fips140.order)
+else
 modules := $(call read-file, modules.order)
+endif
+else
+modules := $(call read-file, modules.order)
+endif
 
 __modfinal: $(modules:%.o=%.ko)
 	@:
@@ -55,12 +63,26 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifeq ($(crypto-module-gen),1)
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds FORCE
+	+$(call if_changed,ld_ko_o)
+else
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 	+$(call cmd,check_tracepoint)
+endif
+else
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	+$(if $(newer-prereqs),$(call cmd,btf_ko))
+endif
+	+$(call cmd,check_tracepoint)
+endif
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
 
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 9ba45e5b32b18..32b6d0986922a 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -28,7 +28,12 @@ $(MODLIB)/modules.order: modules.order FORCE
 	$(call cmd,install_modorder)
 
 quiet_cmd_install_modorder = INSTALL $@
-      cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
+      cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@; \
+	$(if $(CONFIG_CRYPTO_FIPS140_EXTMOD), \
+		if [ -f crypto/fips140/.fips140.order ]; then \
+			sed 's:^\(.*\)\.o$$:kernel/\1.ko:' crypto/fips140/.fips140.order >> $@; \
+		fi \
+	)
 
 # Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
 install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
@@ -42,6 +47,12 @@ endif
 
 modules := $(call read-file, modules.order)
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifneq ($(wildcard crypto/fips140/.fips140.order),)
+modules += $(call read-file, crypto/fips140/.fips140.order)
+endif
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
 dst := $(MODLIB)/kernel
 else
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index d7d45067d08b9..18b5a5de74d93 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -51,6 +51,7 @@ modpost-args =										\
 	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)					\
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)	\
 	$(if $(findstring 1, $(KBUILD_EXTRA_WARN)),-W)					\
+	$(if $(crypto-module-gen),-c)							\
 	-o $@
 
 modpost-deps := $(MODPOST)
@@ -63,10 +64,22 @@ endif
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 ifdef KBUILD_MODULES
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifeq ($(crypto-module-gen),1)
+# For crypto-module-gen, use .fips140.order instead of modules.order
+modpost-args += -T crypto/fips140/.fips140.order
+modpost-deps += crypto/fips140/.fips140.order
+else
+modpost-args += -T modules.order
+modpost-deps += modules.order
+endif
+else
 modpost-args += -T modules.order
 modpost-deps += modules.order
 endif
 
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
 
 # Generate the list of in-tree objects in vmlinux
@@ -110,6 +123,18 @@ modpost-deps += vmlinux.o
 output-symdump := $(if $(KBUILD_MODULES), Module.symvers, vmlinux.symvers)
 endif
 
+# Include .fips140.symvers for regular module builds if it exists
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+ifeq ($(KBUILD_MODULES),y)
+ifneq ($(crypto-module-gen),1)
+ifneq ($(wildcard crypto/fips140/.fips140.symvers),)
+modpost-args += -i crypto/fips140/.fips140.symvers
+modpost-deps += crypto/fips140/.fips140.symvers
+endif
+endif
+endif
+endif
+
 else
 
 # set src + obj - they may be used in the modules's Makefile
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc13949..74d249d75d6b5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -43,6 +43,8 @@ static bool extended_modversions;
 static bool external_module;
 /* Only warn about unresolved symbols */
 static bool warn_unresolved;
+/* Crypto module generation mode */
+static bool crypto_module_gen;
 
 static int sec_mismatch_count;
 static bool sec_mismatch_warn_only = true;
@@ -1751,6 +1753,9 @@ static void check_exports(struct module *mod)
 		const char *basename;
 		exp = find_symbol(s->name);
 		if (!exp) {
+			/* Skip undefined symbol errors for crypto module generation */
+			if (crypto_module_gen)
+				continue;
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
 				modpost_log(!warn_unresolved,
 					    "\"%s\" [%s.ko] undefined!\n",
@@ -2210,10 +2215,14 @@ static void write_dump(const char *fname)
 	struct buffer buf = { };
 	struct module *mod;
 	struct symbol *sym;
+	bool is_fips_symvers = crypto_module_gen && (strcmp(fname, "crypto/fips140/.fips140.symvers") == 0);
 
 	list_for_each_entry(mod, &modules, list) {
 		if (mod->dump_file)
 			continue;
+		/* Skip vmlinux symbols when writing .fips140.symvers */
+		if (is_fips_symvers && mod->is_vmlinux)
+			continue;
 		list_for_each_entry(sym, &mod->exported_symbols, list) {
 			if (trim_unused_exports && !sym->used)
 				continue;
@@ -2285,7 +2294,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xbc")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2340,6 +2349,9 @@ int main(int argc, char **argv)
 		case 'x':
 			extended_modversions = true;
 			break;
+		case 'c':
+			crypto_module_gen = true;
+			break;
 		default:
 			exit(1);
 		}
@@ -2385,8 +2397,14 @@ int main(int argc, char **argv)
 	if (missing_namespace_deps)
 		write_namespace_deps_files(missing_namespace_deps);
 
-	if (dump_write)
-		write_dump(dump_write);
+	if (dump_write) {
+		if (crypto_module_gen) {
+		 	/* generate .fips140.symvers for FIPS crypto modules */
+			write_dump("crypto/fips140/.fips140.symvers");
+		}else {
+			write_dump(dump_write);
+		}
+	}
 	if (sec_mismatch_count && !sec_mismatch_warn_only)
 		error("Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
-- 
2.47.3


