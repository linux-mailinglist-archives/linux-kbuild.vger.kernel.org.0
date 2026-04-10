Return-Path: <linux-kbuild+bounces-12752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO1ZHolq2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12752-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E33DCDF7
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF90B303A3E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D963D6462;
	Fri, 10 Apr 2026 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="JZEQQAwH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB8D3B27DE;
	Fri, 10 Apr 2026 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856229; cv=none; b=b0HdcYIncNYxKXcG4GNCV1w4qzsnBlFWw/BobGsbUOzUebS1hdcjZE94p29mMDbSyMCDvpMwh9gYwbeKHs0YJeiQ/qi/N7ib4RzIepKGLYsCXoMtZ0vP3PnOjbZOf9udn1Q88MMVHuShJc2dz//x8NzZTWGBK1WvSe7aYTxxfO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856229; c=relaxed/simple;
	bh=NZfRy0MnacdpZz0yTzk+6KNjnpZMnJ+k9Tn73vLy5I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDT1f1Q91X3+nVWuv2ylQFuL6oZ6ACjmWuOo0JSpDWSNgu8j78w4IQ+dYvJ17bhE4aCf20HaxcJSOb/5AqOTDV95JX0jBQtkqs5zNS/vx/Ge0ZIsfZvE67fDGEgDIq5dH8GS1x3lOMMq6rK12Dab3Q3yl51y9+E6+Q6b2/o9COM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=JZEQQAwH; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id A97A43FAF6;
	Fri, 10 Apr 2026 23:23:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 908311FADEA;
	Fri, 10 Apr 2026 23:23:43 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id pM6-5xqO5AQi; Fri, 10 Apr 2026 23:23:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id AFD0E1FAE85;
	Fri, 10 Apr 2026 23:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz AFD0E1FAE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856222;
	bh=Bo9qgWOSUxN9u0lrSF5eMvW/pUVtNNKukQZgbK6yhzk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JZEQQAwHvz9zBFRfwPq7gLz6CTYhsg5V+KdZNODzSAaE3nMO7gRo+oSVGmLs4Tslp
	 KCRaC/qW2ztSYC5YY8mXnZ3/kovPwahHGIJsxrxBzOIsqIA9jHJJ6TqbzbwuBQTfW5
	 a1efwEUeYrO+IjWVeeIqFD6chxB9lfzWQS5TvPYJVjRK7P+LsWGuFt4P4SH/i/UJgh
	 20PN+PkYAKwsCrVmLjWBAatcIM9iQzpRiXrlugbQvk0sypkdnX4L7NhbLxcA2uQaiU
	 q7QQjkXoSEKZaj3zAxqrqK5nd06cQlfELPPtihRSDH4ih6PdVVmv87psXqYIuRfHcE
	 Vw9gC/z/Q3eJg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id SRqULlZ9pW0X; Fri, 10 Apr 2026 23:23:42 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 520FB1FADEA;
	Fri, 10 Apr 2026 23:23:42 +0200 (CEST)
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
Subject: [PATCH v5 10/15] scripts/sbom: collect file metadata
Date: Fri, 10 Apr 2026 23:22:50 +0200
Message-ID: <20260410212255.9883-11-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12752-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,spdx_id_generators.build:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 088E33DCDF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement the kernel_file module that collects file metadata,
including license identifier for source files, SHA-256 hash,
Git blob object ID, an estimation of the file type, and
whether files belong to the source, build, or output SBOM.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |   2 +
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 310 ++++++++++++++++++
 2 files changed, 312 insertions(+)
 create mode 100644 scripts/sbom/sbom/spdx_graph/kernel_file.py

diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
index 9c47258a31c..0f95f99d560 100644
--- a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
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
diff --git a/scripts/sbom/sbom/spdx_graph/kernel_file.py b/scripts/sbom/s=
bom/spdx_graph/kernel_file.py
new file mode 100644
index 00000000000..c1136945dc0
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/kernel_file.py
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
+    if ends_with([".c", ".h", ".S", ".s", ".rs", ".pl", "gen_smb2_mappin=
g"]):
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
2.43.0


