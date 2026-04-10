Return-Path: <linux-kbuild+bounces-12758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EWBF1Fs2WmKpggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12758-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:32:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370D3DCF03
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 513B8300BE1E
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB133DBD4F;
	Fri, 10 Apr 2026 21:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="VzE4xr7I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42413AE71E;
	Fri, 10 Apr 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856714; cv=none; b=LeuOtZGYMSyXusotFFQvhZ/oN11gwU1OjLGraH6L3V1MQXevz3381xCEOoNIXjKDKSfJ0czkEkF9zSrBySE7KY/WzLhkpesALEm2OP0eVoRQnty+BQ+xdD3GuKyBv93JB69ntZKGYvZQ/o5y7m5Fgkra59jlvRjH22500B+p+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856714; c=relaxed/simple;
	bh=kQsNRrJf28E6KtNRje58wwPGUPof6BJutvNvCihBV60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XN/r3Js/p5QR0TRNove0QVYJwxo68ewBa9+AOFuUBWhGzsANhEDu3tt+3ZBNa03Rsp5DAD4N6K5iM7MH/sF86vK6ZVEU0ADQRn1ephBytUvFlt0zevR93IriAxFikUbTX/y2YD7aBSCQvPovBxF2ckV+K0ZDY5MDdnYV/ameGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=VzE4xr7I; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 6C4C43FAEF;
	Fri, 10 Apr 2026 23:23:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 3D6561FA89E;
	Fri, 10 Apr 2026 23:23:31 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id LIvB0A8LqQXJ; Fri, 10 Apr 2026 23:23:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9F1921FAA6D;
	Fri, 10 Apr 2026 23:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 9F1921FAA6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856210;
	bh=ewTLlgH3wjgbmawmgxSH5jKLCQxtbiTK2yElmdV8jCc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VzE4xr7IOVSuIdih0rrV4BMCUvwb/kfzQAXZR9JApDK3G5BRJvihVRhZtryv6q8GH
	 QjiJuHy7RdRCX7hRcWpT9wJZ4uVzV3si5ZPzrotEx1+1oA1Z+Wgdxi3Krm0oTEMaKa
	 EKns5HiVlMtMUsusDIpO/no4GDNWWgj/l3dHVTH57TtckupGkS0zjzplgva+BUQ0kJ
	 RHIuzxQRDLlonratN+YT6KkB3QRiJSF7nWByh3axFFzJrS5OxqpVA6K5ND3jSxJuB9
	 LPa0/v3OUq9IuS1y1PZ1mmE6lORp3yHb3obsEqEkRAtZcZyQZIjKp271egnP61svzJ
	 D7brMKOP/Z3+g==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OCStKVquEEh7; Fri, 10 Apr 2026 23:23:30 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 49A7F1FA89E;
	Fri, 10 Apr 2026 23:23:30 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v5 02/15] scripts/sbom: integrate script in make process
Date: Fri, 10 Apr 2026 23:22:42 +0200
Message-ID: <20260410212255.9883-3-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212255.9883-1-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12758-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,o.map:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6370D3DCF03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

integrate SBOM script into the kernel build process.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .gitignore           |  1 +
 MAINTAINERS          |  6 ++++++
 Makefile             | 20 ++++++++++++++++++--
 scripts/sbom/sbom.py | 16 ++++++++++++++++
 4 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 scripts/sbom/sbom.py

diff --git a/.gitignore b/.gitignore
index 3a7241c941f..f3372f15eb1 100644
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
index c3fe46d7c4b..419a1f70a3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23657,6 +23657,12 @@ R:	Marc Murphy <marc.murphy@sancloud.com>
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
index 4f54c568563..06d1ccd9b96 100644
--- a/Makefile
+++ b/Makefile
@@ -777,7 +777,7 @@ endif
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
@@ -1654,7 +1654,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtbs.S
+	       .builtin-dtbs-list .builtin-dtbs.S sbom-*.spdx.json
=20
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES +=3D include/config include/generated          \
@@ -1773,6 +1773,7 @@ help:
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependenc=
ies'
+	@echo  '  sbom            - Generate Software Bill of Materials'
 	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest         - Build and run kernel selftest'
@@ -2159,6 +2160,21 @@ nsdeps: export KBUILD_NSDEPS=3D1
 nsdeps: modules
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
=20
+# Script to generate .spdx.json SBOM documents describing the build
+# ----------------------------------------------------------------------=
-----
+
+ifdef building_out_of_srctree
+sbom_targets :=3D sbom-source.spdx.json
+endif
+sbom_targets +=3D sbom-build.spdx.json sbom-output.spdx.json
+quiet_cmd_sbom =3D GEN     $(sbom_targets)
+      cmd_sbom =3D printf "%s\n" "$(KBUILD_IMAGE)" >"$(tmp-target)"; \
+                 $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/' $(objtree)/mo=
dules.order >> "$(tmp-target)";) \
+                 $(PYTHON3) $(srctree)/scripts/sbom/sbom.py;
+PHONY +=3D sbom
+sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if $(CONF=
IG_MODULES),modules modules.order)
+	$(call cmd,sbom)
+
 # Clang Tooling
 # ----------------------------------------------------------------------=
-----
=20
diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
new file mode 100644
index 00000000000..9c2e4c7f17c
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
2.43.0


