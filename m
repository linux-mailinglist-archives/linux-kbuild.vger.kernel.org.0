Return-Path: <linux-kbuild+bounces-10661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3ED39EF1
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B4263001817
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7262836A4;
	Mon, 19 Jan 2026 06:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="QAP+4jH/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2027F75F;
	Mon, 19 Jan 2026 06:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805338; cv=none; b=ZzYDexhguL3Surmkd6GZTNUufOGSNiaHR0iZ4XKSDDEHxiIfd4d4A+m77GGG2wT9+/2h5BHyT5BCx2U0QsuFur3UdQQtYpi4TaDTmCRUirXcviDWaT27gDwwe1ZITwq5ajZR10J2y7EGK4KwN5G0hJ5v/147QSCgKawFu6f2BV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805338; c=relaxed/simple;
	bh=7XOK4wiYCZC+Ny0WSGTz6ctxoIolkif7nnYKMI5h7Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nVrFfR3++G9f4LPjQcOvhQ82wSlrBjvmTUUQX/zeMV4PQ7xe3Dkofu0YEweEHU8Ot0OHzt1b+Nlqnly2CZTTHxRwW2tJyIgGCOnT2Ozr4VzG4r4905OC6fyTyiK+IxaRPIXe/kiAI+XreR1FoysUQU7xWG9yfPcrQ8IPrbFR204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=QAP+4jH/; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id C5F14200C4;
	Mon, 19 Jan 2026 07:48:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 856C01FA56A;
	Mon, 19 Jan 2026 07:48:52 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id V5rlamLjVm1Y; Mon, 19 Jan 2026 07:48:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id BDB091FA449;
	Mon, 19 Jan 2026 07:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz BDB091FA449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805331;
	bh=XdtMq6t8dOHFwgTJCo9aliVSFXyexdarBYSpb0Fuwc0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=QAP+4jH/1yo6RG42i/gob/Oha0HtqzUfLyP6ToSyP1hzDiGsM+93nwGS5qQZomhQo
	 Vwm4IguKfGlwY/LGePRUtrGxqh9S+ghwlOi8vTxsKV3ecci/hqVPKwdLFiUDsLE7cZ
	 xNxg91FMywe6fbZs/W+MKzRQf5D+l9D7Z5xk54wUZQ7VNQJCSq2lvvbw5/mYp5pvvU
	 cnPYgkGLahgpQEeOxUUkrnFIN/YCjqO3zQhSOJ9ySUdLgC5FPA9ywR1ocz8LfOegic
	 gpTqZIU5bT3PuF2ktPzAkcbhTzLzQC4FDYpdz8Se21qcXZZH2hWQJ0z26LfuKtIyiz
	 ucN6pyuCFhHrQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BO349gTeaT36; Mon, 19 Jan 2026 07:48:51 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 6C8BF1F88B3;
	Mon, 19 Jan 2026 07:48:51 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 05/14] tools/sbom: add additional dependency sources for cmd graph
Date: Mon, 19 Jan 2026 07:47:22 +0100
Message-Id: <20260119064731.23879-6-luis.augenstein@tngtech.com>
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

Add hardcoded dependencies and .incbin directive parsing to
discover dependencies not tracked by .cmd files.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/sbom/cmd_graph/cmd_graph_node.py   | 24 +++++-
 .../sbom/cmd_graph/hardcoded_dependencies.py  | 83 +++++++++++++++++++
 tools/sbom/sbom/cmd_graph/incbin_parser.py    | 42 ++++++++++
 tools/sbom/sbom/environment.py                | 14 ++++
 4 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 tools/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 tools/sbom/sbom/cmd_graph/incbin_parser.py
 create mode 100644 tools/sbom/sbom/environment.py

diff --git a/tools/sbom/sbom/cmd_graph/cmd_graph_node.py b/tools/sbom/sbo=
m/cmd_graph/cmd_graph_node.py
index fdaed0f0c..feacdbf76 100644
--- a/tools/sbom/sbom/cmd_graph/cmd_graph_node.py
+++ b/tools/sbom/sbom/cmd_graph/cmd_graph_node.py
@@ -9,6 +9,8 @@ from typing import Iterator, Protocol
=20
 from sbom import sbom_logging
 from sbom.cmd_graph.cmd_file import CmdFile
+from sbom.cmd_graph.hardcoded_dependencies import get_hardcoded_dependen=
cies
+from sbom.cmd_graph.incbin_parser import parse_incbin_statements
 from sbom.path_utils import PathStr, is_relative_to
=20
=20
@@ -104,14 +106,34 @@ class CmdGraphNode:
             )
             return node
=20
+        # Search for dependencies to add to the graph as child nodes. Ch=
ild paths are always relative to the output tree.
+        def _build_child_node(child_path: PathStr) -> "CmdGraphNode":
+            return CmdGraphNode.create(child_path, config, cache, depth =
+ 1)
+
+        node.hardcoded_dependencies =3D [
+            _build_child_node(hardcoded_dependency_path)
+            for hardcoded_dependency_path in get_hardcoded_dependencies(
+                target_path_absolute, config.obj_tree, config.src_tree
+            )
+        ]
+
         if cmd_file is not None:
             node.cmd_file_dependencies =3D [
-                CmdGraphNode.create(cmd_file_dependency_path, config, ca=
che, depth + 1)
+                _build_child_node(cmd_file_dependency_path)
                 for cmd_file_dependency_path in cmd_file.get_dependencie=
s(
                     target_path, config.obj_tree, config.fail_on_unknown=
_build_command
                 )
             ]
=20
+        if node.absolute_path.endswith(".S"):
+            node.incbin_dependencies =3D [
+                IncbinDependency(
+                    node=3D_build_child_node(incbin_statement.path),
+                    full_statement=3Dincbin_statement.full_statement,
+                )
+                for incbin_statement in parse_incbin_statements(node.abs=
olute_path)
+            ]
+
         return node
=20
=20
diff --git a/tools/sbom/sbom/cmd_graph/hardcoded_dependencies.py b/tools/=
sbom/sbom/cmd_graph/hardcoded_dependencies.py
new file mode 100644
index 000000000..a5977f14a
--- /dev/null
+++ b/tools/sbom/sbom/cmd_graph/hardcoded_dependencies.py
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+from typing import Callable
+import sbom.sbom_logging as sbom_logging
+from sbom.path_utils import PathStr, is_relative_to
+from sbom.environment import Environment
+
+HARDCODED_DEPENDENCIES: dict[str, list[str]] =3D {
+    # defined in linux/Kbuild
+    "include/generated/rq-offsets.h": ["kernel/sched/rq-offsets.s"],
+    "kernel/sched/rq-offsets.s": ["include/generated/asm-offsets.h"],
+    "include/generated/bounds.h": ["kernel/bounds.s"],
+    "include/generated/asm-offsets.h": ["arch/{arch}/kernel/asm-offsets.=
s"],
+}
+
+
+def get_hardcoded_dependencies(path: PathStr, obj_tree: PathStr, src_tre=
e: PathStr) -> list[PathStr]:
+    """
+    Some files in the kernel build process are not tracked by the .cmd d=
ependency mechanism.
+    Parsing these dependencies programmatically is too complex for the s=
cope of this project.
+    Therefore, this function provides manually defined dependencies to b=
e added to the build graph.
+
+    Args:
+        path: absolute path to a file within the src tree or object tree=
.
+        obj_tree: absolute Path to the base directory of the object tree=
.
+        src_tree: absolute Path to the `linux` source directory.
+
+    Returns:
+        list[PathStr]: A list of dependency file paths (relative to the =
object tree) required to build the file at the given path.
+    """
+    if is_relative_to(path, obj_tree):
+        path =3D os.path.relpath(path, obj_tree)
+    elif is_relative_to(path, src_tree):
+        path =3D os.path.relpath(path, src_tree)
+
+    if path not in HARDCODED_DEPENDENCIES:
+        return []
+
+    template_variables: dict[str, Callable[[], str | None]] =3D {
+        "arch": lambda: _get_arch(path),
+    }
+
+    dependencies: list[PathStr] =3D []
+    for dependency_template in HARDCODED_DEPENDENCIES[path]:
+        dependency =3D _evaluate_template(dependency_template, template_=
variables)
+        if dependency is None:
+            continue
+        if os.path.exists(os.path.join(obj_tree, dependency)):
+            dependencies.append(dependency)
+        elif os.path.exists(os.path.join(src_tree, dependency)):
+            dependencies.append(os.path.relpath(dependency, obj_tree))
+        else:
+            sbom_logging.error(
+                "Skip hardcoded dependency '{dependency}' for '{path}' b=
ecause the dependency lies neither in the src tree nor the object tree.",
+                dependency=3Ddependency,
+                path=3Dpath,
+            )
+
+    return dependencies
+
+
+def _evaluate_template(template: str, variables: dict[str, Callable[[], =
str | None]]) -> str | None:
+    for key, value_function in variables.items():
+        template_key =3D "{" + key + "}"
+        if template_key in template:
+            value =3D value_function()
+            if value is None:
+                return None
+            template =3D template.replace(template_key, value)
+    return template
+
+
+def _get_arch(path: PathStr):
+    srcarch =3D Environment.SRCARCH()
+    if srcarch is None:
+        sbom_logging.error(
+            "Skipped architecture specific hardcoded dependency for '{pa=
th}' because the SRCARCH environment variable was not set.",
+            path=3Dpath,
+        )
+        return None
+    return srcarch
diff --git a/tools/sbom/sbom/cmd_graph/incbin_parser.py b/tools/sbom/sbom=
/cmd_graph/incbin_parser.py
new file mode 100644
index 000000000..130f95208
--- /dev/null
+++ b/tools/sbom/sbom/cmd_graph/incbin_parser.py
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+import re
+
+from sbom.path_utils import PathStr
+
+INCBIN_PATTERN =3D re.compile(r'\s*\.incbin\s+"(?P<path>[^"]+)"')
+"""Regex pattern for matching `.incbin "<path>"` statements."""
+
+
+@dataclass
+class IncbinStatement:
+    """A parsed `.incbin "<path>"` directive."""
+
+    path: PathStr
+    """path to the file referenced by the `.incbin` directive."""
+
+    full_statement: str
+    """Full `.incbin "<path>"` statement as it originally appeared in th=
e file."""
+
+
+def parse_incbin_statements(absolute_path: PathStr) -> list[IncbinStatem=
ent]:
+    """
+    Parses `.incbin` directives from an `.S` assembly file.
+
+    Args:
+        absolute_path: Absolute path to the `.S` assembly file.
+
+    Returns:
+        list[IncbinStatement]: Parsed `.incbin` statements.
+    """
+    with open(absolute_path, "rt") as f:
+        content =3D f.read()
+    return [
+        IncbinStatement(
+            path=3Dmatch.group("path"),
+            full_statement=3Dmatch.group(0).strip(),
+        )
+        for match in INCBIN_PATTERN.finditer(content)
+    ]
diff --git a/tools/sbom/sbom/environment.py b/tools/sbom/sbom/environment=
.py
new file mode 100644
index 000000000..b3fb2f0ba
--- /dev/null
+++ b/tools/sbom/sbom/environment.py
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+
+
+class Environment:
+    """
+    Read-only accessor for kernel build environment variables.
+    """
+
+    @classmethod
+    def SRCARCH(cls) -> str | None:
+        return os.getenv("SRCARCH")
--=20
2.34.1


