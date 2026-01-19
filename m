Return-Path: <linux-kbuild+bounces-10665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC83D39F09
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F7BB302D91C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58787283FE3;
	Mon, 19 Jan 2026 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="MdEdt/82"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF3287505;
	Mon, 19 Jan 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805355; cv=none; b=r0JbP7JjhIL3mvcFR8hQPeI0supoKCgDrCEpbHW1kBq/6hTk602RohI175fU7zcEdM4X1785Ul1E3kdPzI9ZOyp53RcXtUeG7d9mQY66EfeZXimaHlXMB3lWS3/lYri7YuPjxtaw9AjUWX1bDg9EniQLoZRVN2W01OzPNCZ4hTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805355; c=relaxed/simple;
	bh=ez5a+WumvQIjjvbD49Yq5HT9OYm6szJpON+MBC+8YLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pfhuG12KZnwk7i+3mn9SXCWi+qfYRmhAK14YxH7i0IgnuKUZzdSOZFErXBaq+Xm/sp9NmVlyF1exalsZEdRPN+ib7RNCoO3+kCfEG3EBZ1u4qL1hXiy0iqQMe+7r5c0OU34NWei30307kodoJ5zkIFeq5nfzC0bkTqHQPyV81MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=MdEdt/82; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 98EB4200C4;
	Mon, 19 Jan 2026 07:49:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 037A11FA56A;
	Mon, 19 Jan 2026 07:49:01 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id KhnVjV6quD2d; Mon, 19 Jan 2026 07:49:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2CB9A1FA64F;
	Mon, 19 Jan 2026 07:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 2CB9A1FA64F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805340;
	bh=OKnOaZsE9vekhUBB87ltMNVf9erg123+/4oORO4xPkw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=MdEdt/82LrhfFgi2vPN1mzd0FGw08R3L9DiXSh92ZFQdqWA/77J6sf/yd4V8iHWyX
	 izQs6tqi1Bc2r6poi+5wm67LHPWjZC6E6h6mUAbNuP8JUlFgDCWlesdLFpfcvM3X5I
	 h2vRbfDicdCll7RpNyNZ2Nklsn4LgSJPO6Gp+g+pn1JVqjTlAWATPBFaraJGlKlIGP
	 FobGR9Ry0Yw3R1F4CwqiUFWAKPr7kATjzff/+Oyws4b7c0KATrlljjt71YU7De0yBH
	 ENWYjPAfyKfVP6pq91S61ppI0zggrYuEhM9axQLOxZMwKeT4TYlKbEb7ShltY0vwwh
	 uuDRkasu22Rgg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3BGoVrna-qEp; Mon, 19 Jan 2026 07:49:00 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C79041FA56A;
	Mon, 19 Jan 2026 07:48:59 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 09/14] tools/sbom: collect file metadata
Date: Mon, 19 Jan 2026 07:47:26 +0100
Message-Id: <20260119064731.23879-10-luis.augenstein@tngtech.com>
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

Implement the kernel_file module that collects file metadata,
including license identifier for source files, SHA-256 hash,
Git blob object ID, an estimation of the file type, and
whether files belong to the source, build, or output SBOM.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |   2 +
 tools/sbom/sbom/spdx_graph/kernel_file.py     | 310 ++++++++++++++++++
 2 files changed, 312 insertions(+)
 create mode 100644 tools/sbom/sbom/spdx_graph/kernel_file.py

diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index 9c47258a3..0f95f99d5 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -7,6 +7,7 @@ from typing import Protocol
 from sbom.config import KernelSpdxDocumentKind
 from sbom.cmd_graph import CmdGraph
 from sbom.path_utils import PathStr
+from sbom.spdx_graph.kernel_file import KernelFileCollection
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
 from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
=20
@@ -36,4 +37,5 @@ def build_spdx_graphs(
         Dictionary of SPDX graphs
     """
     shared_elements =3D SharedSpdxElements.create(spdx_id_generators.bas=
e, config.created)
+    kernel_files =3D KernelFileCollection.create(cmd_graph, config.obj_t=
ree, config.src_tree, spdx_id_generators)
     return {}
diff --git a/tools/sbom/sbom/spdx_graph/kernel_file.py b/tools/sbom/sbom/=
spdx_graph/kernel_file.py
new file mode 100644
index 000000000..84582567b
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/kernel_file.py
@@ -0,0 +1,310 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from enum import Enum
+import hashlib
+import os
+import re
+from sbom.cmd_graph import CmdGraph
+from sbom.path_utils import PathStr, is_relative_to
+from sbom.spdx import SpdxId, SpdxIdGenerator
+from sbom.spdx.core import Hash
+from sbom.spdx.software import ContentIdentifier, File, SoftwarePurpose
+import sbom.sbom_logging as sbom_logging
+from sbom.spdx_graph.spdx_graph_model import SpdxIdGeneratorCollection
+
+
+class KernelFileLocation(Enum):
+    """Represents the location of a file relative to the source/object t=
rees."""
+
+    SOURCE_TREE =3D "source_tree"
+    """File is located in the source tree."""
+    OBJ_TREE =3D "obj_tree"
+    """File is located in the object tree."""
+    EXTERNAL =3D "external"
+    """File is located outside both source and object trees."""
+    BOTH =3D "both"
+    """File is located in a folder that is both source and object tree."=
""
+
+
+@dataclass
+class KernelFile:
+    """kernel-specific metadata used to generate an SPDX File element.""=
"
+
+    absolute_path: PathStr
+    """Absolute path of the file."""
+    file_location: KernelFileLocation
+    """Location of the file relative to the source/object trees."""
+    name: str
+    """Name of the file element. Should be relative to the source tree i=
f
+    file_location equals SOURCE_TREE and relative to the object tree if
+    file_location equals OBJ_TREE. If file_location equals EXTERNAL, the
+    absolute path is used."""
+    license_identifier: str | None
+    """SPDX license ID if file_location equals SOURCE_TREE or BOTH; othe=
rwise None."""
+    spdx_id_generator: SpdxIdGenerator
+    """Generator for the SPDX ID of the file element."""
+
+    _spdx_file_element: File | None =3D None
+
+    @classmethod
+    def create(
+        cls,
+        absolute_path: PathStr,
+        obj_tree: PathStr,
+        src_tree: PathStr,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+        is_output: bool,
+    ) -> "KernelFile":
+        is_in_obj_tree =3D is_relative_to(absolute_path, obj_tree)
+        is_in_src_tree =3D is_relative_to(absolute_path, src_tree)
+
+        # file element name should be relative to output or src tree if =
possible
+        if not is_in_src_tree and not is_in_obj_tree:
+            file_element_name =3D str(absolute_path)
+            file_location =3D KernelFileLocation.EXTERNAL
+            spdx_id_generator =3D spdx_id_generators.build
+        elif is_in_src_tree and src_tree =3D=3D obj_tree:
+            file_element_name =3D os.path.relpath(absolute_path, obj_tre=
e)
+            file_location =3D KernelFileLocation.BOTH
+            spdx_id_generator =3D spdx_id_generators.output if is_output=
 else spdx_id_generators.build
+        elif is_in_obj_tree:
+            file_element_name =3D os.path.relpath(absolute_path, obj_tre=
e)
+            file_location =3D KernelFileLocation.OBJ_TREE
+            spdx_id_generator =3D spdx_id_generators.output if is_output=
 else spdx_id_generators.build
+        else:
+            file_element_name =3D os.path.relpath(absolute_path, src_tre=
e)
+            file_location =3D KernelFileLocation.SOURCE_TREE
+            spdx_id_generator =3D spdx_id_generators.source
+
+        # parse spdx license identifier
+        license_identifier =3D (
+            _parse_spdx_license_identifier(absolute_path)
+            if file_location =3D=3D KernelFileLocation.SOURCE_TREE or fi=
le_location =3D=3D KernelFileLocation.BOTH
+            else None
+        )
+
+        return KernelFile(
+            absolute_path,
+            file_location,
+            file_element_name,
+            license_identifier,
+            spdx_id_generator,
+        )
+
+    @property
+    def spdx_file_element(self) -> File:
+        if self._spdx_file_element is None:
+            self._spdx_file_element =3D _build_file_element(
+                self.absolute_path,
+                self.name,
+                self.spdx_id_generator.generate(),
+                self.file_location,
+            )
+        return self._spdx_file_element
+
+
+@dataclass
+class KernelFileCollection:
+    """Collection of kernel files."""
+
+    source: dict[PathStr, KernelFile]
+    build: dict[PathStr, KernelFile]
+    output: dict[PathStr, KernelFile]
+
+    @classmethod
+    def create(
+        cls,
+        cmd_graph: CmdGraph,
+        obj_tree: PathStr,
+        src_tree: PathStr,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+    ) -> "KernelFileCollection":
+        source: dict[PathStr, KernelFile] =3D {}
+        build: dict[PathStr, KernelFile] =3D {}
+        output: dict[PathStr, KernelFile] =3D {}
+        root_node_paths =3D {node.absolute_path for node in cmd_graph.ro=
ots}
+        for node in cmd_graph:
+            is_root =3D node.absolute_path in root_node_paths
+            kernel_file =3D KernelFile.create(
+                node.absolute_path,
+                obj_tree,
+                src_tree,
+                spdx_id_generators,
+                is_root,
+            )
+            if is_root:
+                output[kernel_file.absolute_path] =3D kernel_file
+            elif kernel_file.file_location =3D=3D KernelFileLocation.SOU=
RCE_TREE:
+                source[kernel_file.absolute_path] =3D kernel_file
+            else:
+                build[kernel_file.absolute_path] =3D kernel_file
+
+        return KernelFileCollection(source, build, output)
+
+    def to_dict(self) -> dict[PathStr, KernelFile]:
+        return {**self.source, **self.build, **self.output}
+
+
+def _build_file_element(absolute_path: PathStr, name: str, spdx_id: Spdx=
Id, file_location: KernelFileLocation) -> File:
+    verifiedUsing: list[Hash] =3D []
+    content_identifier: list[ContentIdentifier] =3D []
+    if os.path.exists(absolute_path):
+        verifiedUsing =3D [Hash(algorithm=3D"sha256", hashValue=3D_sha25=
6(absolute_path))]
+        content_identifier =3D [
+            ContentIdentifier(
+                software_contentIdentifierType=3D"gitoid",
+                software_contentIdentifierValue=3D_git_blob_oid(absolute=
_path),
+            )
+        ]
+    elif file_location =3D=3D KernelFileLocation.EXTERNAL:
+        sbom_logging.warning(
+            "Cannot compute hash for {absolute_path} because file does n=
ot exist.",
+            absolute_path=3Dabsolute_path,
+        )
+    else:
+        sbom_logging.error(
+            "Cannot compute hash for {absolute_path} because file does n=
ot exist.",
+            absolute_path=3Dabsolute_path,
+        )
+
+    # primary purpose
+    primary_purpose =3D _get_primary_purpose(absolute_path)
+
+    return File(
+        spdxId=3Dspdx_id,
+        name=3Dname,
+        verifiedUsing=3DverifiedUsing,
+        software_primaryPurpose=3Dprimary_purpose,
+        software_contentIdentifier=3Dcontent_identifier,
+    )
+
+
+def _sha256(path: PathStr) -> str:
+    """Compute the SHA-256 hash of a file."""
+    with open(path, "rb") as f:
+        data =3D f.read()
+    return hashlib.sha256(data).hexdigest()
+
+
+def _git_blob_oid(file_path: str) -> str:
+    """
+    Compute the Git blob object ID (SHA-1) for a file, like `git hash-ob=
ject`.
+
+    Args:
+        file_path: Path to the file.
+
+    Returns:
+        SHA-1 hash (hex) of the Git blob object.
+    """
+    with open(file_path, "rb") as f:
+        content =3D f.read()
+    header =3D f"blob {len(content)}\0".encode()
+    store =3D header + content
+    sha1_hash =3D hashlib.sha1(store).hexdigest()
+    return sha1_hash
+
+
+# REUSE-IgnoreStart
+SPDX_LICENSE_IDENTIFIER_PATTERN =3D re.compile(r"SPDX-License-Identifier=
:\s*(?P<id>.*?)(?:\s*(\*/|$))")
+# REUSE-IgnoreEnd
+
+
+def _parse_spdx_license_identifier(absolute_path: str, max_lines: int =3D=
 5) -> str | None:
+    """
+    Extracts the SPDX-License-Identifier from the first few lines of a s=
ource file.
+
+    Args:
+        absolute_path: Path to the source file.
+        max_lines: Number of lines to scan from the top (default: 5).
+
+    Returns:
+        The license identifier string (e.g., 'GPL-2.0-only') if found, o=
therwise None.
+    """
+    try:
+        with open(absolute_path, "r") as f:
+            for _ in range(max_lines):
+                match =3D SPDX_LICENSE_IDENTIFIER_PATTERN.search(f.readl=
ine())
+                if match:
+                    return match.group("id")
+    except (UnicodeDecodeError, OSError):
+        return None
+    return None
+
+
+def _get_primary_purpose(absolute_path: PathStr) -> SoftwarePurpose | No=
ne:
+    def ends_with(suffixes: list[str]) -> bool:
+        return any(absolute_path.endswith(suffix) for suffix in suffixes=
)
+
+    def includes_path_segments(path_segments: list[str]) -> bool:
+        return any(segment in absolute_path for segment in path_segments=
)
+
+    # Source code
+    if ends_with([".c", ".h", ".S", ".s", ".rs", ".pl"]):
+        return "source"
+
+    # Libraries
+    if ends_with([".a", ".so", ".rlib"]):
+        return "library"
+
+    # Archives
+    if ends_with([".xz", ".cpio", ".gz", ".tar", ".zip"]):
+        return "archive"
+
+    # Applications
+    if ends_with(["bzImage", "Image"]):
+        return "application"
+
+    # Executables / machine code
+    if ends_with([".bin", ".elf", "vmlinux", "vmlinux.unstripped", "bpfi=
lter_umh"]):
+        return "executable"
+
+    # Kernel modules
+    if ends_with([".ko"]):
+        return "module"
+
+    # Data files
+    if ends_with(
+        [
+            ".tbl",
+            ".relocs",
+            ".rmeta",
+            ".in",
+            ".dbg",
+            ".x509",
+            ".pbm",
+            ".ppm",
+            ".dtb",
+            ".uc",
+            ".inc",
+            ".dts",
+            ".dtsi",
+            ".dtbo",
+            ".xml",
+            ".ro",
+            "initramfs_inc_data",
+            "default_cpio_list",
+            "x509_certificate_list",
+            "utf8data.c_shipped",
+            "blacklist_hash_list",
+            "x509_revocation_list",
+            "cpucaps",
+            "sysreg",
+        ]
+    ) or includes_path_segments(["drivers/gpu/drm/radeon/reg_srcs/"]):
+        return "data"
+
+    # Configuration files
+    if ends_with([".pem", ".key", ".conf", ".config", ".cfg", ".bconf"])=
:
+        return "configuration"
+
+    # Documentation
+    if ends_with([".md"]):
+        return "documentation"
+
+    # Other / miscellaneous
+    if ends_with([".o", ".tmp"]):
+        return "other"
+
+    sbom_logging.warning("Could not infer primary purpose for {absolute_=
path}", absolute_path=3Dabsolute_path)
--=20
2.34.1


