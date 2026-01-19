Return-Path: <linux-kbuild+bounces-10662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C68D39EFD
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40DC6305CAC9
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E40283FE6;
	Mon, 19 Jan 2026 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="AzkEA574"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC427E05E;
	Mon, 19 Jan 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805347; cv=none; b=NODsFrX0okjDkW7C3qlwGu6CnJwhXkzyxY/HCV1efQ0KzQ575FBzJk9Kum3pVZQm1cCR8A7oBXf0kikB8AvmvNzXYL3HzOVtLKuoGEo0haGRXB14PhXBsFTg2oc4wHv3++5fulVSy7DYtlC9cuBQc1qBxpW7kpNSJ4b37FP7XtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805347; c=relaxed/simple;
	bh=8i7kx01pGA78GKksWPyQSKGP3U95oDyL3JlYAUREOrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gvlkRm3USSJGR4CCSKCqpP47T0antckm9ZamJZACNSTyh6zo6G9HxP+zy3uGMGV2sD1je/jclU8ZrNRLEt6v0PfMDhtTbWkjQ9qCA5FOYdOdx7GetOEfJQe3wCPg34boYiOfXI7STqovYmE2VrTN1YR6dOn4YXXN3673EnpF/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=AzkEA574; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 51FA8200C2;
	Mon, 19 Jan 2026 07:48:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2FD6A1FA449;
	Mon, 19 Jan 2026 07:48:58 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id LZG5TVgEAAQb; Mon, 19 Jan 2026 07:48:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9030E1FA5F5;
	Mon, 19 Jan 2026 07:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 9030E1FA5F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805337;
	bh=bZHn8RYpjRJkEa9Nnmi+y/s8Is1EbJKbSy/POxHHySQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AzkEA574y+NdJ7OJZxHv0TRQsLFDptDDLJXwFx8RGbkUpRmdxTThDflue3a8FMjUu
	 Qom/F60WMk2gGH9O8Z1cYS8p4s/COJFUuPik1qPyv/NxPq6zYD5hb0OxsdS9g8U5co
	 Ynq9hLUryOoJpF/K+JPXtOz+RvRZs3zviOWEC50JXVjNc3B0AXfOgNlDmW45MnRYoK
	 4A9ThiiivFr4oRXdtv+XM0ZOKbWEx90u7T5Cb+JDkHPa/aA1WqzurwLF1VHLaGP7IG
	 5tgKi7tQVWiTe1uEbpYD3i1qESD7Q4yYbZHrLc7DFy1fZLKSaVG+iP2Q8LBGiI34Yc
	 SorGeEDsc9uUw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Hh-w-mNUoSqK; Mon, 19 Jan 2026 07:48:57 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 40DA41FA449;
	Mon, 19 Jan 2026 07:48:57 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 08/14] tools/sbom: add shared SPDX elements
Date: Mon, 19 Jan 2026 07:47:25 +0100
Message-Id: <20260119064731.23879-9-luis.augenstein@tngtech.com>
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

Implement shared SPDX elements used in all three documents.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/sbom/config.py                     | 25 +++++++++++++++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  5 ++-
 .../sbom/spdx_graph/shared_spdx_elements.py   | 32 +++++++++++++++++++
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 tools/sbom/sbom/spdx_graph/shared_spdx_elements.py

diff --git a/tools/sbom/sbom/config.py b/tools/sbom/sbom/config.py
index 0985457c3..9278e2be7 100644
--- a/tools/sbom/sbom/config.py
+++ b/tools/sbom/sbom/config.py
@@ -3,6 +3,7 @@
=20
 import argparse
 from dataclasses import dataclass
+from datetime import datetime
 from enum import Enum
 import os
 from typing import Any
@@ -52,6 +53,9 @@ class KernelSbomConfig:
     write_output_on_error: bool
     """Whether to write output documents even if errors occur."""
=20
+    created: datetime
+    """Datetime to use for the SPDX created property of the CreationInfo=
 element."""
+
     spdxId_prefix: str
     """Prefix to use for all SPDX element IDs."""
=20
@@ -150,6 +154,16 @@ def _parse_cli_arguments() -> dict[str, Any]:
=20
     # SPDX specific options
     spdx_group =3D parser.add_argument_group("SPDX options", "Options fo=
r customizing SPDX document generation")
+    spdx_group.add_argument(
+        "--created",
+        default=3DNone,
+        help=3D(
+            "The SPDX created property to use for the CreationInfo eleme=
nt in "
+            "ISO format (YYYY-MM-DD [HH:MM:SS]).\n"
+            "If not provided the last modification time of the first roo=
t output "
+            "is used. (default: None)"
+        ),
+    )
     spdx_group.add_argument(
         "--spdxId-prefix",
         default=3D"urn:spdx.dev:",
@@ -195,6 +209,16 @@ def get_config() -> KernelSbomConfig:
     fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_b=
uild_command"]
     write_output_on_error =3D args["write_output_on_error"]
=20
+    if args["created"] is None:
+        created =3D datetime.fromtimestamp(os.path.getmtime(os.path.join=
(obj_tree, root_paths[0])))
+    else:
+        try:
+            created =3D datetime.fromisoformat(args["created"])
+        except ValueError:
+            raise argparse.ArgumentTypeError(
+                f"Invalid date format for argument '--created': '{args['=
created']}'. "
+                "Expected ISO format (YYYY-MM-DD [HH:MM:SS])."
+            )
     spdxId_prefix =3D args["spdxId_prefix"]
     prettify_json =3D args["prettify_json"]
=20
@@ -218,6 +242,7 @@ def get_config() -> KernelSbomConfig:
         debug=3Ddebug,
         fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
         write_output_on_error=3Dwrite_output_on_error,
+        created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
         prettify_json=3Dprettify_json,
     )
diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index bb3db4e42..9c47258a3 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -1,18 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 # Copyright (C) 2025 TNG Technology Consulting GmbH
=20
-
+from datetime import datetime
 from typing import Protocol
=20
 from sbom.config import KernelSpdxDocumentKind
 from sbom.cmd_graph import CmdGraph
 from sbom.path_utils import PathStr
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
=20
=20
 class SpdxGraphConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
+    created: datetime
=20
=20
 def build_spdx_graphs(
@@ -33,4 +35,5 @@ def build_spdx_graphs(
     Returns:
         Dictionary of SPDX graphs
     """
+    shared_elements =3D SharedSpdxElements.create(spdx_id_generators.bas=
e, config.created)
     return {}
diff --git a/tools/sbom/sbom/spdx_graph/shared_spdx_elements.py b/tools/s=
bom/sbom/spdx_graph/shared_spdx_elements.py
new file mode 100644
index 000000000..0c83428f4
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/shared_spdx_elements.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from datetime import datetime
+from sbom.spdx.core import CreationInfo, SoftwareAgent
+from sbom.spdx.spdxId import SpdxIdGenerator
+
+
+@dataclass(frozen=3DTrue)
+class SharedSpdxElements:
+    agent: SoftwareAgent
+    creation_info: CreationInfo
+
+    @classmethod
+    def create(cls, spdx_id_generator: SpdxIdGenerator, created: datetim=
e) -> "SharedSpdxElements":
+        """
+        Creates shared SPDX elements used across multiple documents.
+
+        Args:
+            spdx_id_generator: Generator for creating SPDX IDs.
+            created: SPDX 'created' property used for the creation info.
+
+        Returns:
+            SharedSpdxElements with agent and creation info.
+        """
+        agent =3D SoftwareAgent(
+            spdxId=3Dspdx_id_generator.generate(),
+            name=3D"KernelSbom",
+        )
+        creation_info =3D CreationInfo(createdBy=3D[agent], created=3Dcr=
eated.strftime("%Y-%m-%dT%H:%M:%SZ"))
+        return SharedSpdxElements(agent=3Dagent, creation_info=3Dcreatio=
n_info)
--=20
2.34.1


