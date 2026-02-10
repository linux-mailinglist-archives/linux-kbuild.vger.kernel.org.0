Return-Path: <linux-kbuild+bounces-11106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOufAmCbi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11106-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C711F269
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55635301074E
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B35D337B9D;
	Tue, 10 Feb 2026 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="K3eQF4N3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4985339844;
	Tue, 10 Feb 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756922; cv=none; b=YMWVBU3jlv3E0xNsvPbSnGEFCc/441dj0UenJA2pYC7dYpb/9ovAgTTdAW1/FeKelr7/tOoLHFCkLONsRCtrEA6mPWmaWDt39WhGDd0hfWHO/Hcpxgj0DL13KXRN1tjA6g1utYDK0MdS5wXRcHb/sFcWUETKFWSd4C6EeEHoGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756922; c=relaxed/simple;
	bh=w8xDNvzuGzLme9gDxXabh8hOeO1zXeVq0LcrIIfGH4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uq2xAp0dEARUOYxsNw0lqr8swIMudm4ZLkrHJ8VV+t0IOuKCbyuPq7xE/e978AZ5UHX/ri3kCQVbzMHCxDTAZOqXrnoaVCkdoFhhtDHAnrX5eDsDwchHP2GnB11oEs+FBE7kM+bCbJqR3kKLR4sf84q7mht7JlPt1bb0JdM879k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=K3eQF4N3; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id DD3B33FAF1;
	Tue, 10 Feb 2026 21:55:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B81F81FA925;
	Tue, 10 Feb 2026 21:55:16 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2gLX2ix9yTPC; Tue, 10 Feb 2026 21:55:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D8BB01FA944;
	Tue, 10 Feb 2026 21:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz D8BB01FA944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756915;
	bh=33aoqKbqK0orV6h6vJrRc7CqZNl1Ru5jai29pjIoidc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=K3eQF4N3RgcHWwIVoRFyxIbFGdPR+aTrYt5bt6VJNQbtI04JuMm+ZwnqW+PfUVMT2
	 cg6jtwx2tsI77HftemaK5b8vsaBwKNaa71lxMkLYGsmtuOViA562/3FZPA6Fm4iSav
	 JDTiKvZ92KhaUCIwRUi6o51cO70/pj65wz1Z+2FZr+kCxSA8pB9H/laXBHUzuq4a/y
	 wHHbWUryFO9pSMvxZQhBiq5LwXXdujeHPjivwBiohU1iCrmUY/brZHgrAIsVaZ8CW4
	 Rh4/SipeLG1Kpb0XLF5dUa2JCFWRAEYFojaOVoOJYjQqr5Lh8l8S1JUSwKBBwpqgAR
	 1S9wFSWtcNLbg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id EqIEuvbkUzFD; Tue, 10 Feb 2026 21:55:15 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 6B6501FA99F;
	Tue, 10 Feb 2026 21:55:15 +0100 (CET)
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
Subject: [PATCH 08/15] scripts/sbom: add JSON-LD serialization
Date: Tue, 10 Feb 2026 21:54:17 +0100
Message-Id: <20260210205424.11195-9-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11106-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,spdx.software:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1B6C711F269
X-Rspamd-Action: no action

Add infrastructure to serialize an SPDX graph as a JSON-LD
document. NamespaceMaps in the SPDX document are converted
to custom prefixes in the @context field of the JSON-LD output.

The SBOM tool uses NamespaceMaps solely to shorten SPDX IDs,
avoiding repetition of full namespace URIs by using short prefixes.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/Makefile                         |  3 +-
 scripts/sbom/sbom.py                          | 52 +++++++++++++++++
 scripts/sbom/sbom/config.py                   | 56 +++++++++++++++++++
 scripts/sbom/sbom/path_utils.py               | 11 ++++
 scripts/sbom/sbom/spdx_graph/__init__.py      |  7 +++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py | 36 ++++++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  | 36 ++++++++++++
 7 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/path_utils.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_graph_model.py

diff --git a/scripts/sbom/Makefile b/scripts/sbom/Makefile
index 882271242957..74b638d91776 100644
--- a/scripts/sbom/Makefile
+++ b/scripts/sbom/Makefile
@@ -30,7 +30,8 @@ $(SBOM_TARGETS) &: $(SBOM_DEPS)
 		--src-tree $(abspath $(srctree)) \
 		--obj-tree $(abspath $(objtree)) \
 		--roots-file $(SBOM_ROOTS_FILE) \
-		--output-directory $(abspath $(objtree))
+		--output-directory $(abspath $(objtree)) \
+		--generate-spdx
=20
 	$(Q)rm $(SBOM_ROOTS_FILE)
=20
diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
index 25d912a282de..426521ade460 100644
--- a/scripts/sbom/sbom.py
+++ b/scripts/sbom/sbom.py
@@ -6,13 +6,18 @@
 Compute software bill of materials in SPDX format describing a kernel bu=
ild.
 """
=20
+import json
 import logging
 import os
 import sys
 import time
+import uuid
 import sbom.sbom_logging as sbom_logging
 from sbom.config import get_config
 from sbom.path_utils import is_relative_to
+from sbom.spdx import JsonLdSpdxDocument, SpdxIdGenerator
+from sbom.spdx.core import CreationInfo, SpdxDocument
+from sbom.spdx_graph import SpdxIdGeneratorCollection, build_spdx_graphs
 from sbom.cmd_graph import CmdGraph
=20
=20
@@ -56,10 +61,57 @@ def main():
                 f.write("\n".join(str(file_path) for file_path in used_f=
iles))
             logging.debug(f"Successfully saved {used_files_path}")
=20
+    if config.generate_spdx is False:
+        return
+
+    # Build SPDX Documents
+    logging.debug("Start generating SPDX graph based on cmd graph")
+    start_time =3D time.time()
+
+    # The real uuid will be generated based on the content of the SPDX g=
raphs
+    # to ensure that the same SPDX document is always assigned the same =
uuid.
+    PLACEHOLDER_UUID =3D "00000000-0000-0000-0000-000000000000"
+    spdx_id_base_namespace =3D f"{config.spdxId_prefix}{PLACEHOLDER_UUID=
}/"
+    spdx_id_generators =3D SpdxIdGeneratorCollection(
+        base=3DSpdxIdGenerator(prefix=3D"p", namespace=3Dspdx_id_base_na=
mespace),
+        source=3DSpdxIdGenerator(prefix=3D"s", namespace=3Df"{spdx_id_ba=
se_namespace}source/"),
+        build=3DSpdxIdGenerator(prefix=3D"b", namespace=3Df"{spdx_id_bas=
e_namespace}build/"),
+        output=3DSpdxIdGenerator(prefix=3D"o", namespace=3Df"{spdx_id_ba=
se_namespace}output/"),
+    )
+
+    spdx_graphs =3D build_spdx_graphs(
+        cmd_graph,
+        spdx_id_generators,
+        config,
+    )
+    spdx_id_uuid =3D uuid.uuid5(
+        uuid.NAMESPACE_URL,
+        "".join(
+            json.dumps(element.to_dict()) for spdx_graph in spdx_graphs.=
values() for element in spdx_graph.to_list()
+        ),
+    )
+    logging.debug(f"Generated SPDX graph in {time.time() - start_time} s=
econds")
+
     # Report collected warnings and errors in case of failure
     warning_summary =3D sbom_logging.summarize_warnings()
     error_summary =3D sbom_logging.summarize_errors()
=20
+    if not sbom_logging.has_errors() or config.write_output_on_error:
+        for kernel_sbom_kind, spdx_graph in spdx_graphs.items():
+            spdx_graph_objects =3D spdx_graph.to_list()
+            # Add warning and error summary to creation info comment
+            creation_info =3D next(element for element in spdx_graph_obj=
ects if isinstance(element, CreationInfo))
+            creation_info.comment =3D "\n".join([warning_summary, error_=
summary]).strip()
+            # Replace Placeholder uuid with real uuid for spdxIds
+            spdx_document =3D next(element for element in spdx_graph_obj=
ects if isinstance(element, SpdxDocument))
+            for namespaceMap in spdx_document.namespaceMap:
+                namespaceMap.namespace =3D namespaceMap.namespace.replac=
e(PLACEHOLDER_UUID, str(spdx_id_uuid))
+            # Serialize SPDX graph to JSON-LD
+            spdx_doc =3D JsonLdSpdxDocument(graph=3Dspdx_graph_objects)
+            save_path =3D os.path.join(config.output_directory, config.s=
pdx_file_names[kernel_sbom_kind])
+            spdx_doc.save(save_path, config.prettify_json)
+            logging.debug(f"Successfully saved {save_path}")
+
     if warning_summary:
         logging.warning(warning_summary)
     if error_summary:
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 39e556a4c53b..0985457c3cae 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -3,11 +3,18 @@
=20
 import argparse
 from dataclasses import dataclass
+from enum import Enum
 import os
 from typing import Any
 from sbom.path_utils import PathStr
=20
=20
+class KernelSpdxDocumentKind(Enum):
+    SOURCE =3D "source"
+    BUILD =3D "build"
+    OUTPUT =3D "output"
+
+
 @dataclass
 class KernelSbomConfig:
     src_tree: PathStr
@@ -19,6 +26,13 @@ class KernelSbomConfig:
     root_paths: list[PathStr]
     """List of paths to root outputs (relative to obj_tree) to base the =
SBOM on."""
=20
+    generate_spdx: bool
+    """Whether to generate SPDX SBOM documents. If False, no SPDX files =
are created."""
+
+    spdx_file_names: dict[KernelSpdxDocumentKind, str]
+    """If `generate_spdx` is True, defines the file names for each SPDX =
SBOM kind
+    (source, build, output) to store on disk."""
+
     generate_used_files: bool
     """Whether to generate a flat list of all source files used in the b=
uild.
     If False, no used-files document is created."""
@@ -38,6 +52,12 @@ class KernelSbomConfig:
     write_output_on_error: bool
     """Whether to write output documents even if errors occur."""
=20
+    spdxId_prefix: str
+    """Prefix to use for all SPDX element IDs."""
+
+    prettify_json: bool
+    """Whether to pretty-print generated SPDX JSON documents."""
+
=20
 def _parse_cli_arguments() -> dict[str, Any]:
     """
@@ -72,6 +92,15 @@ def _parse_cli_arguments() -> dict[str, Any]:
         "--roots-file",
         help=3D"Path to a file containing the root paths (one per line).=
 Cannot be used together with --roots.",
     )
+    parser.add_argument(
+        "--generate-spdx",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D(
+            "Whether to create sbom-source.spdx.json, sbom-build.spdx.js=
on and "
+            "sbom-output.spdx.json documents (default: False)"
+        ),
+    )
     parser.add_argument(
         "--generate-used-files",
         action=3D"store_true",
@@ -119,6 +148,20 @@ def _parse_cli_arguments() -> dict[str, Any]:
         ),
     )
=20
+    # SPDX specific options
+    spdx_group =3D parser.add_argument_group("SPDX options", "Options fo=
r customizing SPDX document generation")
+    spdx_group.add_argument(
+        "--spdxId-prefix",
+        default=3D"urn:spdx.dev:",
+        help=3D"The prefix to use for all spdxId properties. (default: u=
rn:spdx.dev:)",
+    )
+    spdx_group.add_argument(
+        "--prettify-json",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D"Whether to pretty print the generated spdx.json document=
s (default: False)",
+    )
+
     args =3D vars(parser.parse_args())
     return args
=20
@@ -144,6 +187,7 @@ def get_config() -> KernelSbomConfig:
         root_paths =3D args["roots"]
     _validate_path_arguments(src_tree, obj_tree, root_paths)
=20
+    generate_spdx =3D args["generate_spdx"]
     generate_used_files =3D args["generate_used_files"]
     output_directory =3D os.path.realpath(args["output_directory"])
     debug =3D args["debug"]
@@ -151,19 +195,31 @@ def get_config() -> KernelSbomConfig:
     fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_b=
uild_command"]
     write_output_on_error =3D args["write_output_on_error"]
=20
+    spdxId_prefix =3D args["spdxId_prefix"]
+    prettify_json =3D args["prettify_json"]
+
     # Hardcoded config
+    spdx_file_names =3D {
+        KernelSpdxDocumentKind.SOURCE: "sbom-source.spdx.json",
+        KernelSpdxDocumentKind.BUILD: "sbom-build.spdx.json",
+        KernelSpdxDocumentKind.OUTPUT: "sbom-output.spdx.json",
+    }
     used_files_file_name =3D "sbom.used-files.txt"
=20
     return KernelSbomConfig(
         src_tree=3Dsrc_tree,
         obj_tree=3Dobj_tree,
         root_paths=3Droot_paths,
+        generate_spdx=3Dgenerate_spdx,
+        spdx_file_names=3Dspdx_file_names,
         generate_used_files=3Dgenerate_used_files,
         used_files_file_name=3Dused_files_file_name,
         output_directory=3Doutput_directory,
         debug=3Ddebug,
         fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
         write_output_on_error=3Dwrite_output_on_error,
+        spdxId_prefix=3DspdxId_prefix,
+        prettify_json=3Dprettify_json,
     )
=20
=20
diff --git a/scripts/sbom/sbom/path_utils.py b/scripts/sbom/sbom/path_uti=
ls.py
new file mode 100644
index 000000000000..d28d67b25398
--- /dev/null
+++ b/scripts/sbom/sbom/path_utils.py
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+
+PathStr =3D str
+"""Filesystem path represented as a plain string for better performance =
than pathlib.Path."""
+
+
+def is_relative_to(path: PathStr, base: PathStr) -> bool:
+    return os.path.commonpath([path, base]) =3D=3D base
diff --git a/scripts/sbom/sbom/spdx_graph/__init__.py b/scripts/sbom/sbom=
/spdx_graph/__init__.py
new file mode 100644
index 000000000000..3557b1d51bf9
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/__init__.py
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from .build_spdx_graphs import build_spdx_graphs
+from .spdx_graph_model import SpdxIdGeneratorCollection
+
+__all__ =3D ["build_spdx_graphs", "SpdxIdGeneratorCollection"]
diff --git a/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py b/scripts/=
sbom/sbom/spdx_graph/build_spdx_graphs.py
new file mode 100644
index 000000000000..bb3db4e423da
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+
+from typing import Protocol
+
+from sbom.config import KernelSpdxDocumentKind
+from sbom.cmd_graph import CmdGraph
+from sbom.path_utils import PathStr
+from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+
+
+class SpdxGraphConfig(Protocol):
+    obj_tree: PathStr
+    src_tree: PathStr
+
+
+def build_spdx_graphs(
+    cmd_graph: CmdGraph,
+    spdx_id_generators: SpdxIdGeneratorCollection,
+    config: SpdxGraphConfig,
+) -> dict[KernelSpdxDocumentKind, SpdxGraph]:
+    """
+    Builds SPDX graphs (output, source, and build) based on a cmd depend=
ency graph.
+    If the source and object trees are identical, no dedicated source gr=
aph can be created.
+    In that case the source files are added to the build graph instead.
+
+    Args:
+        cmd_graph: The dependency graph of a kernel build.
+        spdx_id_generators: Collection of SPDX ID generators.
+        config: Configuration options.
+
+    Returns:
+        Dictionary of SPDX graphs
+    """
+    return {}
diff --git a/scripts/sbom/sbom/spdx_graph/spdx_graph_model.py b/scripts/s=
bom/sbom/spdx_graph/spdx_graph_model.py
new file mode 100644
index 000000000000..682194d4362a
--- /dev/null
+++ b/scripts/sbom/sbom/spdx_graph/spdx_graph_model.py
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from sbom.spdx.core import CreationInfo, SoftwareAgent, SpdxDocument, Sp=
dxObject
+from sbom.spdx.software import Sbom
+from sbom.spdx.spdxId import SpdxIdGenerator
+
+
+@dataclass
+class SpdxGraph:
+    """Represents the complete graph of a single SPDX document."""
+
+    spdx_document: SpdxDocument
+    agent: SoftwareAgent
+    creation_info: CreationInfo
+    sbom: Sbom
+
+    def to_list(self) -> list[SpdxObject]:
+        return [
+            self.spdx_document,
+            self.agent,
+            self.creation_info,
+            self.sbom,
+            *self.sbom.element,
+        ]
+
+
+@dataclass
+class SpdxIdGeneratorCollection:
+    """Holds SPDX ID generators for different document types to ensure g=
lobally unique SPDX IDs."""
+
+    base: SpdxIdGenerator
+    source: SpdxIdGenerator
+    build: SpdxIdGenerator
+    output: SpdxIdGenerator
--=20
2.34.1


