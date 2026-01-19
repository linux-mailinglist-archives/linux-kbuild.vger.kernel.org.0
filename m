Return-Path: <linux-kbuild+bounces-10667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84187D39F0E
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A2730FDF7D
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F57289367;
	Mon, 19 Jan 2026 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="HNurf8c2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C99283CA3;
	Mon, 19 Jan 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805357; cv=none; b=Vs9d6+sdiUUFYSgHJX5LtkJyP87gGZkRW2ss2rS/++e9S0sFL3eYSYDNk+DWDAQ+4qK+RFLCjh++Dj036sd+SdaH11rRF21aqSM+0so1LuJSF+xodBPF3pphqayqe2xVoHEKABIjC5fbULdHfgKHkmx4IwU0CF5vaR9FGTsssEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805357; c=relaxed/simple;
	bh=1HHMc+OAbZNg/G3xM/4V0PJHfllQQW4Srh3Z+nrRPT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P/OgzR9MAyFGOjHYWKD5nS/GPkk7gEuDBTA/8LDS5sYjkGe7u9MpFKc/iAv/0EIdeOw0JAS4mp1KRiXxcpZ0v4K1C/tfrh7aCEAvDCKJYh1k0csz+JxzvVC1nnSGW+LchH11DNxTxwm5L8JA1J0xMHrkJv71U3d5rbuic75kXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=HNurf8c2; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 256AE200C8;
	Mon, 19 Jan 2026 07:49:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D56ED1FA64F;
	Mon, 19 Jan 2026 07:49:02 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id lCOowmO7zrey; Mon, 19 Jan 2026 07:49:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D2F6B1FA802;
	Mon, 19 Jan 2026 07:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz D2F6B1FA802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805341;
	bh=uzn6DqHNDVPibDanBrzh7e7MmXjDHoA7j5bmL04FMK0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HNurf8c2OjhlgOl0j4CFyxaYR1rBhmpzlXfN2eBm0GLXxnXs9D3GS85kSVtk3D8+n
	 s+YyVeI7mjZSX+R412+dubTdd+o5md5rCUJRriQkaH2xSgh9bVNdN1lqKAs75ZB6SJ
	 R7U8JbO6MNuAKDDfGb+fmyIfCldgvARKn5WDKqWieqOUYTopPuyWldTfjtRSXC59u6
	 poJj7CsOkyVB+J8EAFr3AR7yCWXPSB0atevOz2+EvXZT1phEVGIxVDlypVeeRZ3TVZ
	 WOTHXTR1W392dw8ryotD/JraSilzTW/gybtpU8wIFpibmYaj6L3N1gd9KdQRLsPwr/
	 XuFZeZMnkPR8g==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id NX0M22qDqe-6; Mon, 19 Jan 2026 07:49:01 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 734071FA64F;
	Mon, 19 Jan 2026 07:49:01 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 10/14] tools/sbom: add SPDX output graph
Date: Mon, 19 Jan 2026 07:47:27 +0100
Message-Id: <20260119064731.23879-11-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064731.23879-1-luis.augenstein@tngtech.com>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implement the SPDX output graph which contains the distributable
build outputs and high level metadata about the build.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/Makefile                           |   4 +-
 tools/sbom/sbom/config.py                     |  64 ++++++
 tools/sbom/sbom/environment.py                | 150 ++++++++++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  18 +-
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 188 ++++++++++++++++++
 5 files changed, 422 insertions(+), 2 deletions(-)
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_output_graph.py

diff --git a/tools/sbom/Makefile b/tools/sbom/Makefile
index 1d1388851..9ed6067e9 100644
--- a/tools/sbom/Makefile
+++ b/tools/sbom/Makefile
@@ -30,7 +30,9 @@ $(SBOM_TARGETS) &:
       --obj-tree $(objtree) \
       --roots-file $(SBOM_ROOTS_FILE) \
       --output-directory $(objtree) \
-      --generate-spdx
+      --generate-spdx \
+      --package-license "GPL-2.0 WITH Linux-syscall-note" \
+      --package-version "$(KERNELVERSION)"
=20
 	@rm $(SBOM_ROOTS_FILE)
=20
diff --git a/tools/sbom/sbom/config.py b/tools/sbom/sbom/config.py
index 9278e2be7..de57d9d94 100644
--- a/tools/sbom/sbom/config.py
+++ b/tools/sbom/sbom/config.py
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
diff --git a/tools/sbom/sbom/environment.py b/tools/sbom/sbom/environment=
.py
index b3fb2f0ba..f3a54bd61 100644
--- a/tools/sbom/sbom/environment.py
+++ b/tools/sbom/sbom/environment.py
@@ -3,12 +3,162 @@
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
+    def KERNEL_BUILD_VARIABLES(cls) -> dict[str, str | None]:
+        return {name: os.getenv(name) for name in KERNEL_BUILD_VARIABLES=
_ALLOWLIST}
+
+    @classmethod
+    def ARCH(cls) -> str | None:
+        return os.getenv("ARCH")
+
     @classmethod
     def SRCARCH(cls) -> str | None:
         return os.getenv("SRCARCH")
diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index 0f95f99d5..2af0fbe6c 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
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
diff --git a/tools/sbom/sbom/spdx_graph/spdx_output_graph.py b/tools/sbom=
/sbom/spdx_graph/spdx_output_graph.py
new file mode 100644
index 000000000..1ae0f935e
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/spdx_output_graph.py
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


