Return-Path: <linux-kbuild+bounces-13240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIRkAh6wCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13240-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C55566A07
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65B993015A55
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF023DFC80;
	Mon, 18 May 2026 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="hYYCAevj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F463DE45C;
	Mon, 18 May 2026 06:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085297; cv=none; b=G78aFuChrqToR3jHUvB6sBcQWL8kirbj+kSpiP8DoZRw/NDk/rgMWB5i+1f0k0n7KKAa25PRJzhhbU+jo72lJ1hM2rX5rIa3MsNnOvL88iX9BomTLiNbXk7X+sHQ2t/t1x/I+4dDzmt0M3UFTrkX3oFVCozUj/MzexkRNrGFaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085297; c=relaxed/simple;
	bh=GZ4rErdzlNjbULgFzTaRldiXR+bwkL7yLNUIKEruU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1d6U2B3b3Ti4Rh2RSpmRW3pmmrakeCzoP8/hH04fdg86pPN/8nbWYoX4chyL0MBc4kur2NEWmoESOUKxRypDx+9mwQNtklaaC5f1tsCrX0YfqKleklaxFdFkn1v112uaaX8wELAzjVFTerk654TPfpJfZSEFDMSbMGmIVO4B28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=hYYCAevj; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 61B80200CA;
	Mon, 18 May 2026 08:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 255751F8989;
	Mon, 18 May 2026 08:21:25 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id IqPhhak03CXC; Mon, 18 May 2026 08:21:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9C9491FACD3;
	Mon, 18 May 2026 08:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 9C9491FACD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085279;
	bh=nVd2LHper35jUbhxLuTA1qjKsjS7H5X2RBEO/PcfDiM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hYYCAevj9+S6M6Zk0VoL1HxK9YNs3iLRVmRIcwhXVBrbjmBy77NXXfs99hhu7uXvE
	 iB09I7hGNJfKuVsICgNJN8lYieHQCcgpT15fBF+RWDSI5tb9keTst6K/oJOrhQry+U
	 C2+iYTP+UEplJEuDRp7lfVHLattiEDxiqFtdtw3BELGSMc38ksaqKjfUWWEQJvSw2L
	 Xa+qn1TMk6eER2z2nrdTZTjh4vhChL4S0GZD3FQhnGnznoMmxa8QGIy94TnYUuL/a3
	 iHkxUTi1ei9Gi6kcX3WoE9eG9zHGFaq0gNzOhz+IgYX9hs1C4pchfvYYVakGzDrA7d
	 MPUl9nHK/cGeg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id T5MZgUDEQg59; Mon, 18 May 2026 08:21:19 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 46E551F8989;
	Mon, 18 May 2026 08:21:19 +0200 (CEST)
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
Subject: [PATCH v7 08/15] scripts/sbom: add JSON-LD serialization
Date: Mon, 18 May 2026 08:20:55 +0200
Message-ID: <20260518062102.2051814-9-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
References: <20260518062102.2051814-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 38C55566A07
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-13240-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spdx.software:url];
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
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Add infrastructure to serialize an SPDX graph as a JSON-LD
document. NamespaceMaps in the SPDX document are converted
to custom prefixes in the @context field of the JSON-LD output.

The SBOM tool uses NamespaceMaps solely to shorten SPDX IDs,
avoiding repetition of full namespace URIs by using short prefixes.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 Makefile                                      |  3 +-
 scripts/sbom/sbom.py                          | 56 +++++++++++++++++++
 scripts/sbom/sbom/config.py                   | 56 +++++++++++++++++++
 scripts/sbom/sbom/spdx_graph/__init__.py      |  7 +++
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py | 36 ++++++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  | 36 ++++++++++++
 6 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_graph_model.py

diff --git a/Makefile b/Makefile
index 5cae3679343..c121283231d 100644
--- a/Makefile
+++ b/Makefile
@@ -2212,7 +2212,8 @@ quiet_cmd_sbom =3D GEN     $(sbom_targets)
                      --src-tree $(abspath $(srctree)) \
                      --obj-tree $(abspath $(objtree)) \
                      --roots-file "$(tmp-target)" \
-                     --output-directory $(abspath $(objtree));
+                     --output-directory $(abspath $(objtree)) \
+                     --generate-spdx;
 PHONY +=3D sbom
 sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if $(CONF=
IG_MODULES),modules modules.order)
 	$(call cmd,sbom)
diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
index d700e4f294f..764175b9c89 100644
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
@@ -71,6 +76,57 @@ def main():
                 f.write("\n".join(str(file_path) for file_path in used_f=
iles))
             logging.debug(f"Successfully saved {used_files_path}")
=20
+    if config.generate_spdx is False:
+        _exit_with_summary(config.write_output_on_error)
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
+    if not sbom_logging.has_errors() or config.write_output_on_error:
+        for kernel_sbom_kind, spdx_graph in spdx_graphs.items():
+            spdx_graph_objects =3D spdx_graph.to_list()
+            # Add warning and error summary to creation info comment
+            creation_info =3D next(element for element in spdx_graph_obj=
ects if isinstance(element, CreationInfo))
+            creation_info.comment =3D "\n".join([
+                sbom_logging.summarize_warnings(),
+                sbom_logging.summarize_errors(),
+            ]).strip()
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
     _exit_with_summary(config.write_output_on_error)
=20
=20
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index b8c1a2b404d..98c7d939364 100644
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
 def _parse_cli_arguments(parser: argparse.ArgumentParser) -> dict[str, A=
ny]:
     """
@@ -67,6 +87,15 @@ def _parse_cli_arguments(parser: argparse.ArgumentPars=
er) -> dict[str, Any]:
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
@@ -114,6 +143,20 @@ def _parse_cli_arguments(parser: argparse.ArgumentPa=
rser) -> dict[str, Any]:
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
     _validate_path_arguments(parser, src_tree, obj_tree, root_paths)
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
diff --git a/scripts/sbom/sbom/spdx_graph/__init__.py b/scripts/sbom/sbom=
/spdx_graph/__init__.py
new file mode 100644
index 00000000000..3557b1d51bf
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
index 00000000000..bb3db4e423d
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
index 00000000000..682194d4362
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
2.43.0


