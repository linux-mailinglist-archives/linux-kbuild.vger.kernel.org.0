Return-Path: <linux-kbuild+bounces-12748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHZDO49q2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12748-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 708853DCE0C
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42E82300F9C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831813D6462;
	Fri, 10 Apr 2026 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="fOJVNeLr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7CF3C7DF2;
	Fri, 10 Apr 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856225; cv=none; b=Se1283FdSqDormKna3BvzJItEndgjFLbyj3jAGa3OCKzO4fdYl1XXbks8OqybSlv4liqkkQr6q/nE2FqESH8s9xv0lJr8gnTfA/Z7TVmWBkSJQlutuIxS49hcKspi7WOEMSxSt1RbrEjzQmBZSl4CuHVXBuNX14RDE9se5Ka6Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856225; c=relaxed/simple;
	bh=dMxScmmWvdV/DgvOlbwONaE917GIbGF2lZK3dey5El8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmQqVD2CL5+t2w6rTdTKt6KN3Ut3xP8f0h90urmVIozaqQB4rmt7e8xQAtLlti0ASY0VIF8QizQmSdVdlY1hp1EUv4ej1Mxkce9tCuyhN1QzDQtMsSP3ms4YQ4U22sic51SjzPgjT/4TH2arNqLxU5VCAAFh9ZmjJaTwL2nzgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=fOJVNeLr; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 700DB3FAF3;
	Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 3A1851FA89E;
	Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id O8m-TwMEe-G7; Fri, 10 Apr 2026 23:23:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B81351FADEA;
	Fri, 10 Apr 2026 23:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz B81351FADEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856215;
	bh=Ec/NyMZ1LEwH8JGHpb6OE8SlGmGiPVfyghWL5EH+vBM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fOJVNeLrvYBnEkvw7T0aAIh57Sn2m+kl4vRnGf3EtthGlOhbmFQU7a8aTqrVM0R9o
	 OwYucx2HvU1Y6n/odtYze5kxZHpH3fPR9zOA6rzY2VPCqgy8cvGW5jFKXXc08Uy3Be
	 OpDZInOJjtwidbx7n2XUI6fvYQ2/4F71hbCSIvWogpoJdlp5r7PkBLBGs0c8x0lhkw
	 h/tBFBK47BqfRq01tJ1N7PvgHCpiMQT6Ycttph6EhezBPyFqEztZ8JojFKwRPCi23x
	 NT4stRtdIeJXkLEJdL36vdzz7Xo8dBzms4DxoEeT5lk82lxjXyiYawXF6pPETgFcZY
	 eJ6Ku/G05uVAA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id W6d8rO7HTu0M; Fri, 10 Apr 2026 23:23:35 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 35A921FADC9;
	Fri, 10 Apr 2026 23:23:35 +0200 (CEST)
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
Subject: [PATCH v5 05/15] scripts/sbom: add cmd graph generation
Date: Fri, 10 Apr 2026 23:22:45 +0200
Message-ID: <20260410212255.9883-6-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12748-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,target_path.name:url];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 708853DCE0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement command graph generation by parsing .cmd files to build a
dependency graph.
Add CmdGraph, CmdGraphNode, and .cmd file parsing.
Supports generating a flat list of used source files via the
--generate-used-files cli argument.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 Makefile                                      |   6 +-
 scripts/sbom/sbom.py                          |  39 +++++
 scripts/sbom/sbom/cmd_graph/__init__.py       |   7 +
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 149 ++++++++++++++++++
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |  46 ++++++
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 111 +++++++++++++
 scripts/sbom/sbom/cmd_graph/deps_parser.py    |  52 ++++++
 scripts/sbom/sbom/config.py                   | 147 ++++++++++++++++-
 scripts/sbom/sbom/path_utils.py               |  11 ++
 9 files changed, 565 insertions(+), 3 deletions(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_file.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/deps_parser.py
 create mode 100644 scripts/sbom/sbom/path_utils.py

diff --git a/Makefile b/Makefile
index 06d1ccd9b96..394ebd46e82 100644
--- a/Makefile
+++ b/Makefile
@@ -2170,7 +2170,11 @@ sbom_targets +=3D sbom-build.spdx.json sbom-output=
.spdx.json
 quiet_cmd_sbom =3D GEN     $(sbom_targets)
       cmd_sbom =3D printf "%s\n" "$(KBUILD_IMAGE)" >"$(tmp-target)"; \
                  $(if $(CONFIG_MODULES),sed 's/\.o$$/.ko/' $(objtree)/mo=
dules.order >> "$(tmp-target)";) \
-                 $(PYTHON3) $(srctree)/scripts/sbom/sbom.py;
+                 $(PYTHON3) $(srctree)/scripts/sbom/sbom.py \
+                     --src-tree $(abspath $(srctree)) \
+                     --obj-tree $(abspath $(objtree)) \
+                     --roots-file "$(tmp-target)" \
+                     --output-directory $(abspath $(objtree));
 PHONY +=3D sbom
 sbom: $(notdir $(KBUILD_IMAGE)) include/generated/autoconf.h $(if $(CONF=
IG_MODULES),modules modules.order)
 	$(call cmd,sbom)
diff --git a/scripts/sbom/sbom.py b/scripts/sbom/sbom.py
index c7f23d6eb30..25d912a282d 100644
--- a/scripts/sbom/sbom.py
+++ b/scripts/sbom/sbom.py
@@ -7,9 +7,13 @@ Compute software bill of materials in SPDX format descri=
bing a kernel build.
 """
=20
 import logging
+import os
 import sys
+import time
 import sbom.sbom_logging as sbom_logging
 from sbom.config import get_config
+from sbom.path_utils import is_relative_to
+from sbom.cmd_graph import CmdGraph
=20
=20
 def main():
@@ -22,6 +26,36 @@ def main():
         format=3D"[%(levelname)s] %(message)s",
     )
=20
+    # Build cmd graph
+    logging.debug("Start building cmd graph")
+    start_time =3D time.time()
+    cmd_graph =3D CmdGraph.create(config.root_paths, config)
+    logging.debug(f"Built cmd graph in {time.time() - start_time} second=
s")
+
+    # Save used files document
+    if config.generate_used_files:
+        if config.src_tree =3D=3D config.obj_tree:
+            logging.info(
+                f"Extracting all files from the cmd graph to {(config.us=
ed_files_file_name,)} "
+                "instead of only source files because source files canno=
t be "
+                "reliably classified when the source and object trees ar=
e identical.",
+            )
+            used_files =3D [os.path.relpath(node.absolute_path, config.s=
rc_tree) for node in cmd_graph]
+            logging.debug(f"Found {len(used_files)} files in cmd graph."=
)
+        else:
+            used_files =3D [
+                os.path.relpath(node.absolute_path, config.src_tree)
+                for node in cmd_graph
+                if is_relative_to(node.absolute_path, config.src_tree)
+                and not is_relative_to(node.absolute_path, config.obj_tr=
ee)
+            ]
+            logging.debug(f"Found {len(used_files)} source files in cmd =
graph")
+        if not sbom_logging.has_errors() or config.write_output_on_error=
:
+            used_files_path =3D os.path.join(config.output_directory, co=
nfig.used_files_file_name)
+            with open(used_files_path, "w", encoding=3D"utf-8") as f:
+                f.write("\n".join(str(file_path) for file_path in used_f=
iles))
+            logging.debug(f"Successfully saved {used_files_path}")
+
     # Report collected warnings and errors in case of failure
     warning_summary =3D sbom_logging.summarize_warnings()
     error_summary =3D sbom_logging.summarize_errors()
@@ -30,6 +64,11 @@ def main():
         logging.warning(warning_summary)
     if error_summary:
         logging.error(error_summary)
+        if not config.write_output_on_error:
+            logging.info(
+                "Use --write-output-on-error to generate output document=
s even when errors occur. "
+                "Note that in this case the generated SPDX documents may=
 be incomplete."
+            )
         sys.exit(1)
=20
=20
diff --git a/scripts/sbom/sbom/cmd_graph/__init__.py b/scripts/sbom/sbom/=
cmd_graph/__init__.py
new file mode 100644
index 00000000000..9d661a5c3d9
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/__init__.py
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from .cmd_graph import CmdGraph
+from .cmd_graph_node import CmdGraphNode, CmdGraphNodeConfig
+
+__all__ =3D ["CmdGraph", "CmdGraphNode", "CmdGraphNodeConfig"]
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
new file mode 100644
index 00000000000..d85ef5de0c2
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+import re
+from dataclasses import dataclass, field
+from sbom.cmd_graph.deps_parser import parse_cmd_file_deps
+from sbom.cmd_graph.savedcmd_parser import parse_inputs_from_commands
+import sbom.sbom_logging as sbom_logging
+from sbom.path_utils import PathStr
+
+SAVEDCMD_PATTERN =3D re.compile(r"^(saved)?cmd_.*?:=3D\s*(?P<full_comman=
d>.+)$")
+SOURCE_PATTERN =3D re.compile(r"^source.*?:=3D\s*(?P<source_file>.+)$")
+
+
+@dataclass
+class CmdFile:
+    cmd_file_path: PathStr
+    savedcmd: str
+    source: PathStr | None =3D None
+    deps: list[str] =3D field(default_factory=3Dlist[str])
+    make_rules: list[str] =3D field(default_factory=3Dlist[str])
+
+    @classmethod
+    def create(cls, cmd_file_path: PathStr) -> "CmdFile | None":
+        """
+        Parses a .cmd file.
+        .cmd files are assumed to have one of the following structures:
+        1. Full Cmd File
+            (saved)?cmd_<output> :=3D <command>
+            source_<output> :=3D <main_input>
+            deps_<output> :=3D \
+            <dependencies>
+            <output> :=3D $(deps_<output>)
+            $(deps_<output>):
+
+        2. Command Only Cmd File
+            (saved)?cmd_<output> :=3D <command>
+
+        3. Single Dependency Cmd File
+            (saved)?cmd_<output> :=3D <command>
+            <output> :=3D <dependency>
+
+        Args:
+            cmd_file_path (Path): absolute Path to a .cmd file
+
+        Returns:
+            cmd_file (CmdFile): Parsed cmd file.
+        """
+        with open(cmd_file_path, "rt") as f:
+            lines =3D [line.strip() for line in f.readlines() if line.st=
rip() !=3D "" and not line.startswith("#")]
+
+        # savedcmd
+        match =3D SAVEDCMD_PATTERN.match(lines[0])
+        if match is None:
+            sbom_logging.error(
+                "Skip parsing '{cmd_file_path}' because no 'savedcmd_' c=
ommand was found.", cmd_file_path=3Dcmd_file_path
+            )
+            return None
+        savedcmd =3D match.group("full_command")
+
+        # Command Only Cmd File
+        if len(lines) =3D=3D 1:
+            return CmdFile(cmd_file_path, savedcmd)
+
+        # Single Dependency Cmd File
+        if len(lines) =3D=3D 2:
+            dep =3D lines[1].split(":")[1].strip()
+            return CmdFile(cmd_file_path, savedcmd, deps=3D[dep])
+
+        # Full Cmd File
+        # source
+        line1 =3D SOURCE_PATTERN.match(lines[1])
+        if line1 is None:
+            sbom_logging.error(
+                "Skip parsing '{cmd_file_path}' because no 'source_' ent=
ry was found.", cmd_file_path=3Dcmd_file_path
+            )
+            return CmdFile(cmd_file_path, savedcmd)
+        source =3D line1.group("source_file")
+
+        # deps
+        deps: list[str] =3D []
+        i =3D 3  # lines[2] includes the variable assignment but no actu=
al dependency, so we need to start at lines[3].
+        while i < len(lines):
+            if not lines[i].endswith("\\"):
+                break
+            deps.append(lines[i][:-1].strip())
+            i +=3D 1
+
+        # make_rules
+        make_rules =3D lines[i:]
+
+        return CmdFile(cmd_file_path, savedcmd, source, deps, make_rules=
)
+
+    def get_dependencies(
+        self: "CmdFile", target_path: PathStr, obj_tree: PathStr, fail_o=
n_unknown_build_command: bool
+    ) -> list[PathStr]:
+        """
+        Parses all dependencies required to build a target file from its=
 cmd file.
+
+        Args:
+            target_path: path to the target file relative to `obj_tree`.
+            obj_tree: absolute path to the object tree.
+            fail_on_unknown_build_command: Whether to fail if an unknown=
 build command is encountered.
+
+        Returns:
+            list[PathStr]: dependency file paths relative to `obj_tree`.
+        """
+        input_files: list[PathStr] =3D [
+            str(p) for p in parse_inputs_from_commands(self.savedcmd, fa=
il_on_unknown_build_command)
+        ]
+        if self.deps:
+            input_files +=3D [str(p) for p in parse_cmd_file_deps(self.d=
eps)]
+        input_files =3D _expand_resolve_files(input_files, obj_tree)
+
+        cmd_file_dependencies: list[PathStr] =3D []
+        for input_file in input_files:
+            # input files are either absolute or relative to the object =
tree
+            if os.path.isabs(input_file):
+                input_file =3D os.path.relpath(input_file, obj_tree)
+            if input_file =3D=3D target_path:
+                # Skip target file to prevent cycles. This is necessary =
because some multi stage commands first create an output and then pass it=
 as input to the next command, e.g., objcopy.
+                continue
+            cmd_file_dependencies.append(input_file)
+
+        return cmd_file_dependencies
+
+
+def _expand_resolve_files(input_files: list[PathStr], obj_tree: PathStr)=
 -> list[PathStr]:
+    """
+    Expands resolve files which may reference additional files via '@' n=
otation.
+
+    Args:
+        input_files (list[PathStr]): List of file paths relative to the =
object tree, where paths starting with '@' refer to files
+                                     containing further file paths, each=
 on a separate line.
+        obj_tree: Absolute path to the root of the object tree.
+
+    Returns:
+        list[PathStr]: Flattened list of all input file paths, with any =
nested '@' file references resolved recursively.
+    """
+    expanded_input_files: list[PathStr] =3D []
+    for input_file in input_files:
+        if not input_file.startswith("@"):
+            expanded_input_files.append(input_file)
+            continue
+        with open(os.path.join(obj_tree, input_file.lstrip("@")), "rt") =
as f:
+            resolve_file_content =3D [line_stripped for line in f.readli=
nes() if (line_stripped :=3D line.strip())]
+        expanded_input_files +=3D _expand_resolve_files(resolve_file_con=
tent, obj_tree)
+    return expanded_input_files
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph.py b/scripts/sbom/sbom=
/cmd_graph/cmd_graph.py
new file mode 100644
index 00000000000..cad54243ff3
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph.py
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from collections import deque
+from dataclasses import dataclass, field
+from typing import Iterator
+
+from sbom.cmd_graph.cmd_graph_node import CmdGraphNode, CmdGraphNodeConf=
ig
+from sbom.path_utils import PathStr
+
+
+@dataclass
+class CmdGraph:
+    """Directed acyclic graph of build dependencies primarily inferred f=
rom .cmd files produced during kernel builds"""
+
+    roots: list[CmdGraphNode] =3D field(default_factory=3Dlist[CmdGraphN=
ode])
+
+    @classmethod
+    def create(cls, root_paths: list[PathStr], config: CmdGraphNodeConfi=
g) -> "CmdGraph":
+        """
+        Recursively builds a dependency graph starting from `root_paths`=
.
+        Dependencies are mainly discovered by parsing the `.cmd` files.
+
+        Args:
+            root_paths (list[PathStr]): List of paths to root outputs re=
lative to obj_tree
+            config (CmdGraphNodeConfig): Configuration options
+
+        Returns:
+            CmdGraph: A graph of all build dependencies for the given ro=
ot files.
+        """
+        node_cache: dict[PathStr, CmdGraphNode] =3D {}
+        root_nodes =3D [CmdGraphNode.create(root_path, config, node_cach=
e) for root_path in root_paths]
+        return CmdGraph(root_nodes)
+
+    def __iter__(self) -> Iterator[CmdGraphNode]:
+        """Traverse the graph in breadth-first order, yielding each uniq=
ue node."""
+        visited: set[PathStr] =3D set()
+        node_stack: deque[CmdGraphNode] =3D deque(self.roots)
+        while len(node_stack) > 0:
+            node =3D node_stack.popleft()
+            if node.absolute_path in visited:
+                continue
+
+            visited.add(node.absolute_path)
+            node_stack.extend(node.children)
+            yield node
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py b/scripts/sbom=
/sbom/cmd_graph/cmd_graph_node.py
new file mode 100644
index 00000000000..7a5279a1ba0
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+import logging
+import os
+from typing import Iterator, Protocol
+
+from sbom import sbom_logging
+from sbom.cmd_graph.cmd_file import CmdFile
+from sbom.path_utils import PathStr, is_relative_to
+
+
+class CmdGraphNodeConfig(Protocol):
+    obj_tree: PathStr
+    src_tree: PathStr
+    fail_on_unknown_build_command: bool
+
+
+@dataclass
+class CmdGraphNode:
+    """A node in the cmd graph representing a single file and its depend=
encies."""
+
+    absolute_path: PathStr
+    """Absolute path to the file this node represents."""
+
+    cmd_file: CmdFile | None =3D None
+    """Parsed .cmd file describing how the file at absolute_path was bui=
lt, or None if not available."""
+
+    cmd_file_dependencies: list["CmdGraphNode"] =3D field(default_factor=
y=3Dlist["CmdGraphNode"])
+
+    @property
+    def children(self) -> Iterator["CmdGraphNode"]:
+        seen: set[PathStr] =3D set()
+        for node in self.cmd_file_dependencies:
+            if node.absolute_path not in seen:
+                seen.add(node.absolute_path)
+                yield node
+
+    @classmethod
+    def create(
+        cls,
+        target_path: PathStr,
+        config: CmdGraphNodeConfig,
+        cache: dict[PathStr, "CmdGraphNode"] | None =3D None,
+        depth: int =3D 0,
+    ) -> "CmdGraphNode":
+        """
+        Recursively builds a dependency graph starting from `target_path=
`.
+        Dependencies are mainly discovered by parsing the `.<target_path=
.name>.cmd` file.
+
+        Args:
+            target_path: Path to the target file relative to obj_tree.
+            config: Config options
+            cache: Tracks processed nodes to prevent cycles.
+            depth: Internal parameter to track the current recursion dep=
th.
+
+        Returns:
+            CmdGraphNode: cmd graph node representing the target file
+        """
+        if cache is None:
+            cache =3D {}
+
+        target_path_absolute =3D (
+            os.path.realpath(p)
+            if os.path.islink(p :=3D os.path.join(config.obj_tree, targe=
t_path))
+            else os.path.normpath(p)
+        )
+
+        if target_path_absolute in cache:
+            return cache[target_path_absolute]
+
+        if depth =3D=3D 0:
+            logging.debug(f"Build node: {target_path}")
+
+        cmd_file_path =3D _to_cmd_path(target_path_absolute)
+        cmd_file =3D CmdFile.create(cmd_file_path) if os.path.exists(cmd=
_file_path) else None
+        node =3D CmdGraphNode(target_path_absolute, cmd_file)
+        cache[target_path_absolute] =3D node
+
+        if not os.path.exists(target_path_absolute):
+            error_or_warning =3D (
+                sbom_logging.error
+                if is_relative_to(target_path_absolute, config.obj_tree)
+                or is_relative_to(target_path_absolute, config.src_tree)
+                else sbom_logging.warning
+            )
+            error_or_warning(
+                "Skip parsing '{target_path_absolute}' because file does=
 not exist",
+                target_path_absolute=3Dtarget_path_absolute,
+            )
+            return node
+
+        # Search for dependencies to add to the graph as child nodes. Ch=
ild paths are always relative to the output tree.
+        def _build_child_node(child_path: PathStr) -> "CmdGraphNode":
+            return CmdGraphNode.create(child_path, config, cache, depth =
+ 1)
+
+        if cmd_file is not None:
+            node.cmd_file_dependencies =3D [
+                _build_child_node(cmd_file_dependency_path)
+                for cmd_file_dependency_path in cmd_file.get_dependencie=
s(
+                    target_path, config.obj_tree, config.fail_on_unknown=
_build_command
+                )
+            ]
+
+        return node
+
+
+def _to_cmd_path(path: PathStr) -> PathStr:
+    name =3D os.path.basename(path)
+    return path.removesuffix(name) + f".{name}.cmd"
diff --git a/scripts/sbom/sbom/cmd_graph/deps_parser.py b/scripts/sbom/sb=
om/cmd_graph/deps_parser.py
new file mode 100644
index 00000000000..fb3ccdd415b
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/deps_parser.py
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+import sbom.sbom_logging as sbom_logging
+from sbom.path_utils import PathStr
+
+# Match dependencies on config files
+# Example match: "$(wildcard include/config/CONFIG_SOMETHING)"
+CONFIG_PATTERN =3D re.compile(r"\$\(wildcard (include/config/[^)]+)\)")
+
+# Match dependencies on the objtool binary
+# Example match: "$(wildcard ./tools/objtool/objtool)"
+OBJTOOL_PATTERN =3D re.compile(r"\$\(wildcard \./tools/objtool/objtool\)=
")
+
+# Match any Makefile wildcard reference
+# Example match: "$(wildcard path/to/file)"
+WILDCARD_PATTERN =3D re.compile(r"\$\(wildcard (?P<path>[^)]+)\)")
+
+# Match ordinary paths:
+# - ^(\/)?: Optionally starts with a '/'
+# - (([\w\-\., ]*)\/)*: Zero or more directory levels
+# - [\w\-\., ]+$: Path component (file or directory)
+# Example matches: "/foo/bar.c", "dir1/dir2/file.txt", "plainfile"
+VALID_PATH_PATTERN =3D re.compile(r"^(\/)?(([\w\-\., ]*)\/)*[\w\-\., ]+$=
")
+
+
+def parse_cmd_file_deps(deps: list[str]) -> list[PathStr]:
+    """
+    Parse dependency strings of a .cmd file and return valid input file =
paths.
+
+    Args:
+        deps: List of dependency strings as found in `.cmd` files.
+
+    Returns:
+        input_files: List of input file paths
+    """
+    input_files: list[PathStr] =3D []
+    for dep in deps:
+        dep =3D dep.strip()
+        match dep:
+            case _ if CONFIG_PATTERN.match(dep) or OBJTOOL_PATTERN.match=
(dep):
+                # config paths like include/config/<CONFIG_NAME> should =
not be included in the graph
+                continue
+            case _ if match :=3D WILDCARD_PATTERN.match(dep):
+                path =3D match.group("path")
+                input_files.append(path)
+            case _ if VALID_PATH_PATTERN.match(dep):
+                input_files.append(dep)
+            case _:
+                sbom_logging.error("Skip parsing dependency {dep} becaus=
e of unrecognized format", dep=3Ddep)
+    return input_files
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 3dc569ae0c4..39e556a4c53 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -3,15 +3,43 @@
=20
 import argparse
 from dataclasses import dataclass
+import os
+from typing import Any
+from sbom.path_utils import PathStr
=20
=20
 @dataclass
 class KernelSbomConfig:
+    src_tree: PathStr
+    """Absolute path to the Linux kernel source directory."""
+
+    obj_tree: PathStr
+    """Absolute path to the build output directory."""
+
+    root_paths: list[PathStr]
+    """List of paths to root outputs (relative to obj_tree) to base the =
SBOM on."""
+
+    generate_used_files: bool
+    """Whether to generate a flat list of all source files used in the b=
uild.
+    If False, no used-files document is created."""
+
+    used_files_file_name: str
+    """If `generate_used_files` is True, specifies the file name for the=
 used-files document."""
+
+    output_directory: PathStr
+    """Path to the directory where the generated output documents will b=
e saved."""
+
     debug: bool
     """Whether to enable debug logging."""
=20
+    fail_on_unknown_build_command: bool
+    """Whether to fail if an unknown build command is encountered in a .=
cmd file."""
+
+    write_output_on_error: bool
+    """Whether to write output documents even if errors occur."""
+
=20
-def _parse_cli_arguments() -> dict[str, bool]:
+def _parse_cli_arguments() -> dict[str, Any]:
     """
     Parse command-line arguments using argparse.
=20
@@ -19,8 +47,49 @@ def _parse_cli_arguments() -> dict[str, bool]:
         Dictionary of parsed arguments.
     """
     parser =3D argparse.ArgumentParser(
+        formatter_class=3Dargparse.RawTextHelpFormatter,
         description=3D"Generate SPDX SBOM documents for kernel builds",
     )
+    parser.add_argument(
+        "--src-tree",
+        default=3D"../linux",
+        help=3D"Path to the kernel source tree (default: ../linux)",
+    )
+    parser.add_argument(
+        "--obj-tree",
+        default=3D"../linux/kernel_build",
+        help=3D"Path to the build output directory (default: ../linux/ke=
rnel_build)",
+    )
+    group =3D parser.add_mutually_exclusive_group(required=3DTrue)
+    group.add_argument(
+        "--roots",
+        nargs=3D"+",
+        default=3D"arch/x86/boot/bzImage",
+        help=3D"Space-separated list of paths relative to obj-tree for w=
hich the SBOM will be created.\n"
+        "Cannot be used together with --roots-file. (default: arch/x86/b=
oot/bzImage)",
+    )
+    group.add_argument(
+        "--roots-file",
+        help=3D"Path to a file containing the root paths (one per line).=
 Cannot be used together with --roots.",
+    )
+    parser.add_argument(
+        "--generate-used-files",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D(
+            "Whether to create the sbom.used-files.txt file, a flat list=
 of all "
+            "source files used for the kernel build.\n"
+            "If src-tree and obj-tree are equal it is not possible to re=
liably "
+            "classify source files.\n"
+            "In this case sbom.used-files.txt will contain all files use=
d for the "
+            "kernel build including all build artifacts. (default: False=
)"
+        ),
+    )
+    parser.add_argument(
+        "--output-directory",
+        default=3D".",
+        help=3D"Path to the directory where the generated output documen=
ts will be stored (default: .)",
+    )
     parser.add_argument(
         "--debug",
         action=3D"store_true",
@@ -28,6 +97,28 @@ def _parse_cli_arguments() -> dict[str, bool]:
         help=3D"Enable debug logs (default: False)",
     )
=20
+    # Error handling settings
+    parser.add_argument(
+        "--do-not-fail-on-unknown-build-command",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D(
+            "Whether to fail if an unknown build command is encountered =
in a .cmd file.\n"
+            "If set to True, errors are logged as warnings instead. (def=
ault: False)"
+        ),
+    )
+    parser.add_argument(
+        "--write-output-on-error",
+        action=3D"store_true",
+        default=3DFalse,
+        help=3D(
+            "Write output documents even if errors occur. The resulting =
documents "
+            "may be incomplete.\n"
+            "A summary of warnings and errors can be found in the 'comme=
nt' property "
+            "of the CreationInfo element. (default: False)"
+        ),
+    )
+
     args =3D vars(parser.parse_args())
     return args
=20
@@ -42,6 +133,58 @@ def get_config() -> KernelSbomConfig:
     # Parse cli arguments
     args =3D _parse_cli_arguments()
=20
+    # Extract and validate cli arguments
+    src_tree =3D os.path.realpath(args["src_tree"])
+    obj_tree =3D os.path.realpath(args["obj_tree"])
+    root_paths =3D []
+    if args["roots_file"]:
+        with open(args["roots_file"], "rt") as f:
+            root_paths =3D [root.strip() for root in f.readlines()]
+    else:
+        root_paths =3D args["roots"]
+    _validate_path_arguments(src_tree, obj_tree, root_paths)
+
+    generate_used_files =3D args["generate_used_files"]
+    output_directory =3D os.path.realpath(args["output_directory"])
     debug =3D args["debug"]
=20
-    return KernelSbomConfig(debug=3Ddebug)
+    fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_b=
uild_command"]
+    write_output_on_error =3D args["write_output_on_error"]
+
+    # Hardcoded config
+    used_files_file_name =3D "sbom.used-files.txt"
+
+    return KernelSbomConfig(
+        src_tree=3Dsrc_tree,
+        obj_tree=3Dobj_tree,
+        root_paths=3Droot_paths,
+        generate_used_files=3Dgenerate_used_files,
+        used_files_file_name=3Dused_files_file_name,
+        output_directory=3Doutput_directory,
+        debug=3Ddebug,
+        fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
+        write_output_on_error=3Dwrite_output_on_error,
+    )
+
+
+def _validate_path_arguments(src_tree: PathStr, obj_tree: PathStr, root_=
paths: list[PathStr]) -> None:
+    """
+    Validate that the provided paths exist.
+
+    Args:
+        src_tree: Absolute path to the source tree.
+        obj_tree: Absolute path to the object tree.
+        root_paths: List of root paths relative to obj_tree.
+
+    Raises:
+        argparse.ArgumentTypeError: If any of the paths don't exist.
+    """
+    if not os.path.exists(src_tree):
+        raise argparse.ArgumentTypeError(f"--src-tree {src_tree} does no=
t exist")
+    if not os.path.exists(obj_tree):
+        raise argparse.ArgumentTypeError(f"--obj-tree {obj_tree} does no=
t exist")
+    for root_path in root_paths:
+        if not os.path.exists(os.path.join(obj_tree, root_path)):
+            raise argparse.ArgumentTypeError(
+                f"path to root artifact {os.path.join(obj_tree, root_pat=
h)} does not exist"
+            )
diff --git a/scripts/sbom/sbom/path_utils.py b/scripts/sbom/sbom/path_uti=
ls.py
new file mode 100644
index 00000000000..d28d67b2539
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
--=20
2.43.0


