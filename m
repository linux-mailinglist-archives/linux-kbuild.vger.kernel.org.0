Return-Path: <linux-kbuild+bounces-11103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKaIMd2bi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11103-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:58:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576711F30B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B89A308F601
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA973382E5;
	Tue, 10 Feb 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="fbmLrs9+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0FD336EEB;
	Tue, 10 Feb 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756916; cv=none; b=AGiCnZt9eozpHoYyKQ36xlJUXsWY8XOjrdt8IamSYYy6kqiBiMJn7XZDVoKcAEZhmtW4ZZvIeNA888aS5FVFyRgwQ1OqQ1F5C+79zLdXd6XGRFWcJhNQDilPmgWcj2jHOI49YHCykG/8UXyq714oQ8vsL1Qw5mCn1Af93VmloKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756916; c=relaxed/simple;
	bh=lJK1wq5XaAcSH+NUG8vmQMcxlUAztEftr4qAmPiRleI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QnIYM/UKSg0Tfn6v6IDiJA0zH2GUKtEH8kKSo1n3LK6xJt/m7TlX4DVt+Q6rxK0l4kDtvEP98QvP5fbTqreQ+dpUndHojpl6PLxoTdMbtgxDJ/Qxm6tAfG8UBsDnrI/rcMPdts5RpfKkxTwqd3zCf3Ysevn7UDjoFCSlifE3as4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=fbmLrs9+; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 5F9543FAF1;
	Tue, 10 Feb 2026 21:55:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id F2B431FA999;
	Tue, 10 Feb 2026 21:55:06 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id FqBMxCPMSo-o; Tue, 10 Feb 2026 21:55:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5FBD91FA952;
	Tue, 10 Feb 2026 21:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 5FBD91FA952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756906;
	bh=b7sPD0C7eiJnru6iQdD9xAaEij0bin6ziU3pjs4ZE0s=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=fbmLrs9+wus5I8iQHIK0Ii3TtpzQuWSNEWJ7KThUy1F4vspWBX7efwwayJEI/dKEq
	 Uo3AdB8qWdWgVXBc7MbDfXOgdzY6l+mcQqMmiJPcuvS1XOxF0fGONx3G41maqCtgS9
	 qPaXIkNWyvrIZf15gmSI+9WYX4tzTToaG59DgSG+RTJkacxRRefSB0bSy1dlFrM15m
	 380WWASqnh8VAGRvBRgRxSgZG3Jg1steqQJspyOBPzSFnUmlniYX+BaDBWB6/O2O1X
	 jq5wNpZaRnx475EXcY0fetdWmg7CtNEzGrmhnq9ZYN2G/1WDYt/WhFKzo9C5Wgve/F
	 X+Ducbmgi6HxA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gYWt_Tbf-9Ix; Tue, 10 Feb 2026 21:55:06 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 0DCA01FA8CD;
	Tue, 10 Feb 2026 21:55:06 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 02/15] scripts/sbom: integrate script in make process
Date: Tue, 10 Feb 2026 21:54:11 +0100
Message-Id: <20260210205424.11195-3-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210205424.11195-1-luis.augenstein@tngtech.com>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11103-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,o.map:url,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,sancloud.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[tngtech.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2576711F30B
X-Rspamd-Action: no action

integrate SBOM script into the kernel build process.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .gitignore            |  1 +
 MAINTAINERS           |  6 ++++++
 Makefile              | 11 +++++++++--
 scripts/sbom/Makefile | 33 +++++++++++++++++++++++++++++++++
 scripts/sbom/sbom.py  | 16 ++++++++++++++++
 5 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 scripts/sbom/Makefile
 create mode 100644 scripts/sbom/sbom.py

diff --git a/.gitignore b/.gitignore
index 3a7241c941f5..f3372f15eb1b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,6 +48,7 @@
 *.s
 *.so
 *.so.dbg
+*.spdx.json
 *.su
 *.symtypes
 *.tab.[ch]
diff --git a/MAINTAINERS b/MAINTAINERS
index f1b020588597..decbab52cef1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23365,6 +23365,12 @@ R:	Marc Murphy <marc.murphy@sancloud.com>
 S:	Supported
 F:	arch/arm/boot/dts/ti/omap/am335x-sancloud*
=20
+SBOM
+M:	Luis Augenstein <luis.augenstein@tngtech.com>
+M:	Maximilian Huber <maximilian.huber@tngtech.com>
+S:	Maintained
+F:	scripts/sbom/
+
 SC1200 WDT DRIVER
 M:	Zwane Mwaikambo <zwanem@gmail.com>
 S:	Maintained
diff --git a/Makefile b/Makefile
index 9d38125263fb..46d4be490d7f 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
=20
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKEC=
MDGOALS)),)
+ifneq ($(filter all modules nsdeps compile_commands.json clang-% sbom,$(=
MAKECMDGOALS)),)
   KBUILD_MODULES :=3D y
 endif
=20
@@ -1612,7 +1612,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+	       .builtin-dtbs-list .builtin-dtb.S sbom-*.spdx.json
=20
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES +=3D include/config include/generated          \
@@ -1728,6 +1728,7 @@ help:
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependenc=
ies'
+	@echo  '  sbom            - Generate Software Bill of Materials'
 	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest         - Build and run kernel selftest'
@@ -2108,6 +2109,12 @@ nsdeps: export KBUILD_NSDEPS=3D1
 nsdeps: modules
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
=20
+# Script to generate .spdx.json SBOM documents describing the build
+# ----------------------------------------------------------------------=
-----
+PHONY +=3D sbom
+sbom: all
+	$(Q)$(MAKE) $(build)=3Dscripts/sbom
+
 # Clang Tooling
 # ----------------------------------------------------------------------=
-----
=20
diff --git a/scripts/sbom/Makefile b/scripts/sbom/Makefile
new file mode 100644
index 000000000000..6c8ec7356293
--- /dev/null
+++ b/scripts/sbom/Makefile
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+SBOM_SOURCE_FILE :=3D $(objtree)/sbom-source.spdx.json
+SBOM_BUILD_FILE :=3D $(objtree)/sbom-build.spdx.json
+SBOM_OUTPUT_FILE :=3D $(objtree)/sbom-output.spdx.json
+SBOM_ROOTS_FILE :=3D $(objtree)/sbom-roots.txt
+
+
+ifeq ($(srctree),$(objtree))
+    SBOM_TARGETS :=3D $(SBOM_BUILD_FILE) $(SBOM_OUTPUT_FILE)
+else
+    SBOM_TARGETS :=3D $(SBOM_SOURCE_FILE) $(SBOM_BUILD_FILE) $(SBOM_OUTP=
UT_FILE)
+endif
+
+SBOM_DEPS :=3D $(objtree)/$(KBUILD_IMAGE) $(objtree)/include/generated/a=
utoconf.h
+ifdef CONFIG_MODULES
+    SBOM_DEPS +=3D $(objtree)/modules.order
+endif
+
+$(SBOM_TARGETS) &: $(SBOM_DEPS)
+	$(Q)echo "  GEN     $(notdir $(SBOM_TARGETS))"
+
+	$(Q)printf "%s\n" "$(KBUILD_IMAGE)" > $(SBOM_ROOTS_FILE)
+	$(Q)if [ "$(CONFIG_MODULES)" =3D "y" ]; then \
+		sed 's/\.o$$/.ko/' $(objtree)/modules.order >> $(SBOM_ROOTS_FILE); \
+	fi
+
+	$(Q)$(PYTHON3) $(srctree)/scripts/sbom/sbom.py
+
+	$(Q)rm $(SBOM_ROOTS_FILE)
+
+$(obj)/: $(SBOM_TARGETS)
diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
new file mode 100644
index 000000000000..9c2e4c7f17ce
--- /dev/null
+++ b/scripts/sbom/sbom.py
@@ -0,0 +1,16 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+"""
+Compute software bill of materials in SPDX format describing a kernel bu=
ild.
+"""
+
+
+def main():
+    pass
+
+
+# Call main method
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.34.1


