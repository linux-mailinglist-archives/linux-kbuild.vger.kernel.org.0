Return-Path: <linux-kbuild+bounces-11110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG5fDW2bi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11110-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C317B11F27F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8588A301B02C
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266CA3382D6;
	Tue, 10 Feb 2026 20:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="R+ssG9st"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE1339872;
	Tue, 10 Feb 2026 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756934; cv=none; b=cHEslDavZGzb17CAENlkddZzZdMjFKsSQ4xWmDMVO8HWNbTHWaek1vMnELbJxVCzsMa0Ico1/j22nSWVJkQxwEMdWioQMo0DKEJ25JSw+zKVRr8J9b5CnUToTQFtdhCYDXIRGcTky0loeXTT7PsNCB8zIYA4lKGA3Mtzfi8As1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756934; c=relaxed/simple;
	bh=NVFEppxPkhiqljKb0h/iL9OjKEpPjSrM42oIJUWlWHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ICDGwEr6f91ZO//njvX+exkFN/F3XzoN4BM4lzdq2vV49vS8IZPfk30Cn6Nxd2AItq+8X5LxNxWzEM4EAVz2KSiEhvpdIlDZLqPIJrjeigHwNHIwAyOqC581yigaChw3We+xTyccKfnj9ZFAmbUgtrkWctgDkLtGq7iNiLUy7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=R+ssG9st; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 347FE3FAF2;
	Tue, 10 Feb 2026 21:55:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id F414E1FA925;
	Tue, 10 Feb 2026 21:55:20 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id hKp7Srd9BjyO; Tue, 10 Feb 2026 21:55:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E0B511FA8D7;
	Tue, 10 Feb 2026 21:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz E0B511FA8D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756919;
	bh=ebtQak1RGLtG8yRDP06jqZxNAa9SNySNGRGvqF1MAvA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=R+ssG9stxk2r8ww8ur30jVX+9nmNkbJWSdwOM/5O/F0waIaiFst6mGG0v/Ts2fw7U
	 roC7us9lSfxkOmVlXN5nqIoelM9l5PB1GPegKehPRpdqMss7aV0LcJCS0m0hlxe83N
	 MtN4VL1nCGDVjx4ZoEv4EINtvWbBSWyjZbOz2uvlt6M0UooE3CF5GoYu3Py2hwwwog
	 zJlLwdqHz5xsVHUjudEASi2LytyfADWRSQ0JK2p9wAIbnHhUlB4NEEHGCQCISA6Jvy
	 LGTIt2+NOrbZWtzJUDCGvYJZWrSNWG/I//wxJUuxYmn2CQdMZzkK3nUAFJCB/IiIKr
	 eHcRubxGgxfFQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TFV8qaogZxiy; Tue, 10 Feb 2026 21:55:19 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 83BBF1FA952;
	Tue, 10 Feb 2026 21:55:19 +0100 (CET)
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
Subject: [PATCH 11/15] scripts/sbom: add SPDX output graph
Date: Tue, 10 Feb 2026 21:54:20 +0100
Message-Id: <20260210205424.11195-12-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11110-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,spdx.software:url,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,spdx_id_generators.base:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C317B11F27F
X-Rspamd-Action: no action

Implement the SPDX output graph which contains the distributable
build outputs and high level metadata about the build.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/Makefile                         |   4 +-
 scripts/sbom/sbom/config.py                   |  64 ++++++
 scripts/sbom/sbom/environment.py              | 154 ++++++++++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  18 +-
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 188 ++++++++++++++++++
 5 files changed, 426 insertions(+), 2 deletions(-)
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_output_graph.py

diff --git a/scripts/sbom/Makefile b/scripts/sbom/Makefile
index 74b638d91776..f14176ea6b55 100644
--- a/scripts/sbom/Makefile
+++ b/scripts/sbom/Makefile
@@ -31,7 +31,9 @@ $(SBOM_TARGETS) &: $(SBOM_DEPS)
 		--obj-tree $(abspath $(objtree)) \
 		--roots-file $(SBOM_ROOTS_FILE) \
 		--output-directory $(abspath $(objtree)) \
-		--generate-spdx
+		--generate-spdx \
+		--package-license "GPL-2.0 WITH Linux-syscall-note" \
+		--package-version "$(KERNELVERSION)"
=20
 	$(Q)rm $(SBOM_ROOTS_FILE)
=20
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 9278e2be7cb2..de57d9d94edb 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -59,6 +59,21 @@ class KernelSbomConfig:
     spdxId_prefix: str
     """Prefix to use for all SPDX element IDs."""
=20
+    build_type: str
+    """SPDX buildType property to use for all Build elements."""
+
+    build_id: str | None
+    """SPDX buildId property to use for all Build elements."""
+
+    package_license: str
+    """License expression applied to all SPDX Packages."""
+
+    package_version: str | None
+    """Version string applied to all SPDX Packages."""
+
+    package_copyright_text: str | None
+    """Copyright text applied to all SPDX Packages."""
+
     prettify_json: bool
     """Whether to pretty-print generated SPDX JSON documents."""
=20
@@ -169,6 +184,40 @@ def _parse_cli_arguments() -> dict[str, Any]:
         default=3D"urn:spdx.dev:",
         help=3D"The prefix to use for all spdxId properties. (default: u=
rn:spdx.dev:)",
     )
+    spdx_group.add_argument(
+        "--build-type",
+        default=3D"urn:spdx.dev:Kbuild",
+        help=3D"The SPDX buildType property to use for all Build element=
s. (default: urn:spdx.dev:Kbuild)",
+    )
+    spdx_group.add_argument(
+        "--build-id",
+        default=3DNone,
+        help=3D"The SPDX buildId property to use for all Build elements.=
\n"
+        "If not provided the spdxId of the high level Build element is u=
sed as the buildId. (default: None)",
+    )
+    spdx_group.add_argument(
+        "--package-license",
+        default=3D"NOASSERTION",
+        help=3D(
+            "The SPDX licenseExpression property to use for the LicenseE=
xpression "
+            "linked to all SPDX Package elements. (default: NOASSERTION)=
"
+        ),
+    )
+    spdx_group.add_argument(
+        "--package-version",
+        default=3DNone,
+        help=3D"The SPDX packageVersion property to use for all SPDX Pac=
kage elements. (default: None)",
+    )
+    spdx_group.add_argument(
+        "--package-copyright-text",
+        default=3DNone,
+        help=3D(
+            "The SPDX copyrightText property to use for all SPDX Package=
 elements.\n"
+            "If not specified, and if a COPYING file exists in the sourc=
e tree,\n"
+            "the package-copyright-text is set to the content of this fi=
le. "
+            "(default: None)"
+        ),
+    )
     spdx_group.add_argument(
         "--prettify-json",
         action=3D"store_true",
@@ -220,6 +269,16 @@ def get_config() -> KernelSbomConfig:
                 "Expected ISO format (YYYY-MM-DD [HH:MM:SS])."
             )
     spdxId_prefix =3D args["spdxId_prefix"]
+    build_type =3D args["build_type"]
+    build_id =3D args["build_id"]
+    package_license =3D args["package_license"]
+    package_version =3D args["package_version"] if args["package_version=
"] is not None else None
+    package_copyright_text: str | None =3D None
+    if args["package_copyright_text"] is not None:
+        package_copyright_text =3D args["package_copyright_text"]
+    elif os.path.isfile(copying_path :=3D os.path.join(src_tree, "COPYIN=
G")):
+        with open(copying_path, "r") as f:
+            package_copyright_text =3D f.read()
     prettify_json =3D args["prettify_json"]
=20
     # Hardcoded config
@@ -244,6 +303,11 @@ def get_config() -> KernelSbomConfig:
         write_output_on_error=3Dwrite_output_on_error,
         created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
+        build_type=3Dbuild_type,
+        build_id=3Dbuild_id,
+        package_license=3Dpackage_license,
+        package_version=3Dpackage_version,
+        package_copyright_text=3Dpackage_copyright_text,
         prettify_json=3Dprettify_json,
     )
=20
diff --git a/scripts/sbom/sbom/environment.py b/scripts/sbom/sbom/environ=
ment.py
index b3fb2f0ba61d..57d81214e476 100644
--- a/scripts/sbom/sbom/environment.py
+++ b/scripts/sbom/sbom/environment.py
@@ -3,12 +3,166 @@
=20
 import os
=20
+KERNEL_BUILD_VARIABLES_ALLOWLIST =3D [
+    "AFLAGS_KERNEL",
+    "AFLAGS_MODULE",
+    "AR",
+    "ARCH",
+    "ARCH_CORE",
+    "ARCH_DRIVERS",
+    "ARCH_LIB",
+    "AWK",
+    "BASH",
+    "BINDGEN",
+    "BITS",
+    "CC",
+    "CC_FLAGS_FPU",
+    "CC_FLAGS_NO_FPU",
+    "CFLAGS_GCOV",
+    "CFLAGS_KERNEL",
+    "CFLAGS_MODULE",
+    "CHECK",
+    "CHECKFLAGS",
+    "CLIPPY_CONF_DIR",
+    "CONFIG_SHELL",
+    "CPP",
+    "CROSS_COMPILE",
+    "CURDIR",
+    "GNUMAKEFLAGS",
+    "HOSTCC",
+    "HOSTCXX",
+    "HOSTPKG_CONFIG",
+    "HOSTRUSTC",
+    "INSTALLKERNEL",
+    "INSTALL_DTBS_PATH",
+    "INSTALL_HDR_PATH",
+    "INSTALL_PATH",
+    "KBUILD_AFLAGS",
+    "KBUILD_AFLAGS_KERNEL",
+    "KBUILD_AFLAGS_MODULE",
+    "KBUILD_BUILTIN",
+    "KBUILD_CFLAGS",
+    "KBUILD_CFLAGS_KERNEL",
+    "KBUILD_CFLAGS_MODULE",
+    "KBUILD_CHECKSRC",
+    "KBUILD_CLIPPY",
+    "KBUILD_CPPFLAGS",
+    "KBUILD_EXTMOD",
+    "KBUILD_EXTRA_WARN",
+    "KBUILD_HOSTCFLAGS",
+    "KBUILD_HOSTCXXFLAGS",
+    "KBUILD_HOSTLDFLAGS",
+    "KBUILD_HOSTLDLIBS",
+    "KBUILD_HOSTRUSTFLAGS",
+    "KBUILD_IMAGE",
+    "KBUILD_LDFLAGS",
+    "KBUILD_LDFLAGS_MODULE",
+    "KBUILD_LDS",
+    "KBUILD_MODULES",
+    "KBUILD_PROCMACROLDFLAGS",
+    "KBUILD_RUSTFLAGS",
+    "KBUILD_RUSTFLAGS_KERNEL",
+    "KBUILD_RUSTFLAGS_MODULE",
+    "KBUILD_USERCFLAGS",
+    "KBUILD_USERLDFLAGS",
+    "KBUILD_VERBOSE",
+    "KBUILD_VMLINUX_LIBS",
+    "KBZIP2",
+    "KCONFIG_CONFIG",
+    "KERNELDOC",
+    "KERNELRELEASE",
+    "KERNELVERSION",
+    "KGZIP",
+    "KLZOP",
+    "LC_COLLATE",
+    "LC_NUMERIC",
+    "LD",
+    "LDFLAGS_MODULE",
+    "LEX",
+    "LINUXINCLUDE",
+    "LZ4",
+    "LZMA",
+    "MAKE",
+    "MAKEFILES",
+    "MAKEFILE_LIST",
+    "MAKEFLAGS",
+    "MAKELEVEL",
+    "MAKEOVERRIDES",
+    "MAKE_COMMAND",
+    "MAKE_HOST",
+    "MAKE_TERMERR",
+    "MAKE_TERMOUT",
+    "MAKE_VERSION",
+    "MFLAGS",
+    "MODLIB",
+    "NM",
+    "NOSTDINC_FLAGS",
+    "O",
+    "OBJCOPY",
+    "OBJCOPYFLAGS",
+    "OBJDUMP",
+    "PAHOLE",
+    "PATCHLEVEL",
+    "PERL",
+    "PYTHON3",
+    "Q",
+    "RCS_FIND_IGNORE",
+    "READELF",
+    "REALMODE_CFLAGS",
+    "RESOLVE_BTFIDS",
+    "RETHUNK_CFLAGS",
+    "RETHUNK_RUSTFLAGS",
+    "RETPOLINE_CFLAGS",
+    "RETPOLINE_RUSTFLAGS",
+    "RETPOLINE_VDSO_CFLAGS",
+    "RUSTC",
+    "RUSTC_BOOTSTRAP",
+    "RUSTC_OR_CLIPPY",
+    "RUSTC_OR_CLIPPY_QUIET",
+    "RUSTDOC",
+    "RUSTFLAGS_KERNEL",
+    "RUSTFLAGS_MODULE",
+    "RUSTFMT",
+    "SRCARCH",
+    "STRIP",
+    "SUBLEVEL",
+    "SUFFIXES",
+    "TAR",
+    "UTS_MACHINE",
+    "VERSION",
+    "VPATH",
+    "XZ",
+    "YACC",
+    "ZSTD",
+    "building_out_of_srctree",
+    "cross_compiling",
+    "objtree",
+    "quiet",
+    "rust_common_flags",
+    "srcroot",
+    "srctree",
+    "sub_make_done",
+    "subdir",
+]
+
=20
 class Environment:
     """
     Read-only accessor for kernel build environment variables.
     """
=20
+    @classmethod
+    def KERNEL_BUILD_VARIABLES(cls) -> dict[str, str]:
+        return {
+            name: value.strip()
+            for name in KERNEL_BUILD_VARIABLES_ALLOWLIST
+            if (value :=3D os.getenv(name)) is not None and value.strip(=
)
+        }
+
+    @classmethod
+    def ARCH(cls) -> str | None:
+        return os.getenv("ARCH")
+
     @classmethod
     def SRCARCH(cls) -> str | None:
         return os.getenv("SRCARCH")
diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index 0f95f99d560a..2af0fbe6cdbe 100644
--- a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -10,12 +10,18 @@ from sbom.path_utils import PathStr
 from sbom.spdx_graph.kernel_file import KernelFileCollection
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
 from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_output_graph import SpdxOutputGraph
=20
=20
 class SpdxGraphConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
     created: datetime
+    build_type: str
+    build_id: str | None
+    package_license: str
+    package_version: str | None
+    package_copyright_text: str | None
=20
=20
 def build_spdx_graphs(
@@ -38,4 +44,14 @@ def build_spdx_graphs(
     """
     shared_elements =3D SharedSpdxElements.create(spdx_id_generators.bas=
e, config.created)
     kernel_files =3D KernelFileCollection.create(cmd_graph, config.obj_t=
ree, config.src_tree, spdx_id_generators)
-    return {}
+    output_graph =3D SpdxOutputGraph.create(
+        root_files=3Dlist(kernel_files.output.values()),
+        shared_elements=3Dshared_elements,
+        spdx_id_generators=3Dspdx_id_generators,
+        config=3Dconfig,
+    )
+    spdx_graphs: dict[KernelSpdxDocumentKind, SpdxGraph] =3D {
+        KernelSpdxDocumentKind.OUTPUT: output_graph,
+    }
+
+    return spdx_graphs
diff --git a/scripts/sbom/sbom/spdx_graph/spdx_output_graph.py b/scripts/=
sbom/sbom/spdx_graph/spdx_output_graph.py
new file mode 100644
index 000000000000..1ae0f935e0b9
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/spdx_output_graph.py
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+import os
+from typing import Protocol
+from sbom.environment import Environment
+from sbom.path_utils import PathStr
+from sbom.spdx.build import Build
+from sbom.spdx.core import DictionaryEntry, NamespaceMap, Relationship, =
SpdxDocument
+from sbom.spdx.simplelicensing import LicenseExpression
+from sbom.spdx.software import File, Package, Sbom
+from sbom.spdx.spdxId import SpdxIdGenerator
+from sbom.spdx_graph.kernel_file import KernelFile
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+
+
+class SpdxOutputGraphConfig(Protocol):
+    obj_tree: PathStr
+    src_tree: PathStr
+    build_type: str
+    build_id: str | None
+    package_license: str
+    package_version: str | None
+    package_copyright_text: str | None
+
+
+@dataclass
+class SpdxOutputGraph(SpdxGraph):
+    """SPDX graph representing distributable output files"""
+
+    high_level_build_element: Build
+
+    @classmethod
+    def create(
+        cls,
+        root_files: list[KernelFile],
+        shared_elements: SharedSpdxElements,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+        config: SpdxOutputGraphConfig,
+    ) -> "SpdxOutputGraph":
+        """
+        Args:
+            root_files: List of distributable output files which act as =
roots
+                of the dependency graph.
+            shared_elements: Shared SPDX elements used across multiple d=
ocuments.
+            spdx_id_generators: Collection of SPDX ID generators.
+            config: Configuration options.
+
+        Returns:
+            SpdxOutputGraph: The SPDX output graph.
+        """
+        # SpdxDocument
+        spdx_document =3D SpdxDocument(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            profileConformance=3D["core", "software", "build", "simpleLi=
censing"],
+            namespaceMap=3D[
+                NamespaceMap(prefix=3Dgenerator.prefix, namespace=3Dgene=
rator.namespace)
+                for generator in [spdx_id_generators.output, spdx_id_gen=
erators.base]
+                if generator.prefix is not None
+            ],
+        )
+
+        # Sbom
+        sbom =3D Sbom(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            software_sbomType=3D["build"],
+        )
+
+        # High-level Build elements
+        config_source_element =3D KernelFile.create(
+            absolute_path=3Dos.path.join(config.obj_tree, ".config"),
+            obj_tree=3Dconfig.obj_tree,
+            src_tree=3Dconfig.src_tree,
+            spdx_id_generators=3Dspdx_id_generators,
+            is_output=3DTrue,
+        ).spdx_file_element
+        high_level_build_element, high_level_build_element_hasOutput_rel=
ationship =3D _high_level_build_elements(
+            config.build_type,
+            config.build_id,
+            config_source_element,
+            spdx_id_generators.output,
+        )
+
+        # Root file elements
+        root_file_elements: list[File] =3D [file.spdx_file_element for f=
ile in root_files]
+
+        # Package elements
+        package_elements =3D [
+            Package(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                name=3D_get_package_name(file.name),
+                software_packageVersion=3Dconfig.package_version,
+                software_copyrightText=3Dconfig.package_copyright_text,
+                originatedBy=3D[shared_elements.agent],
+                comment=3Df"Architecture=3D{arch}" if (arch :=3D Environ=
ment.ARCH() or Environment.SRCARCH()) else None,
+                software_primaryPurpose=3Dfile.software_primaryPurpose,
+            )
+            for file in root_file_elements
+        ]
+        package_hasDistributionArtifact_file_relationships =3D [
+            Relationship(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                relationshipType=3D"hasDistributionArtifact",
+                from_=3Dpackage,
+                to=3D[file],
+            )
+            for package, file in zip(package_elements, root_file_element=
s)
+        ]
+        package_license_expression =3D LicenseExpression(
+            spdxId=3Dspdx_id_generators.output.generate(),
+            simplelicensing_licenseExpression=3Dconfig.package_license,
+        )
+        package_hasDeclaredLicense_relationships =3D [
+            Relationship(
+                spdxId=3Dspdx_id_generators.output.generate(),
+                relationshipType=3D"hasDeclaredLicense",
+                from_=3Dpackage,
+                to=3D[package_license_expression],
+            )
+            for package in package_elements
+        ]
+
+        # Update relationships
+        spdx_document.rootElement =3D [sbom]
+
+        sbom.rootElement =3D [*package_elements]
+        sbom.element =3D [
+            config_source_element,
+            high_level_build_element,
+            high_level_build_element_hasOutput_relationship,
+            *root_file_elements,
+            *package_elements,
+            *package_hasDistributionArtifact_file_relationships,
+            package_license_expression,
+            *package_hasDeclaredLicense_relationships,
+        ]
+
+        high_level_build_element_hasOutput_relationship.to =3D [*root_fi=
le_elements]
+
+        output_graph =3D SpdxOutputGraph(
+            spdx_document,
+            shared_elements.agent,
+            shared_elements.creation_info,
+            sbom,
+            high_level_build_element,
+        )
+        return output_graph
+
+
+def _get_package_name(filename: str) -> str:
+    """
+    Generates a SPDX package name from a filename.
+    Kernel images (bzImage, Image) get a descriptive name, others use th=
e basename of the file.
+    """
+    KERNEL_FILENAMES =3D ["bzImage", "Image"]
+    basename =3D os.path.basename(filename)
+    return f"Linux Kernel ({basename})" if basename in KERNEL_FILENAMES =
else basename
+
+
+def _high_level_build_elements(
+    build_type: str,
+    build_id: str | None,
+    config_source_element: File,
+    spdx_id_generator: SpdxIdGenerator,
+) -> tuple[Build, Relationship]:
+    build_spdxId =3D spdx_id_generator.generate()
+    high_level_build_element =3D Build(
+        spdxId=3Dbuild_spdxId,
+        build_buildType=3Dbuild_type,
+        build_buildId=3Dbuild_id if build_id is not None else build_spdx=
Id,
+        build_environment=3D[
+            DictionaryEntry(key=3Dkey, value=3Dvalue)
+            for key, value in Environment.KERNEL_BUILD_VARIABLES().items=
()
+            if value
+        ],
+        build_configSourceUri=3D[config_source_element.spdxId],
+        build_configSourceDigest=3Dconfig_source_element.verifiedUsing,
+    )
+
+    high_level_build_element_hasOutput_relationship =3D Relationship(
+        spdxId=3Dspdx_id_generator.generate(),
+        relationshipType=3D"hasOutput",
+        from_=3Dhigh_level_build_element,
+        to=3D[],
+    )
+    return high_level_build_element, high_level_build_element_hasOutput_=
relationship
--=20
2.34.1


