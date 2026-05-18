Return-Path: <linux-kbuild+bounces-13236-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGhEMv2vCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13236-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA975669D2
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56DE93012CAC
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4844F3DEFFA;
	Mon, 18 May 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="DK08614B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370C38B147;
	Mon, 18 May 2026 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085292; cv=none; b=YfnvO3JVBocYFGhIvVr/oOYkHu+ZsFXbmfE6Dvii0w/qqn/OatMdIr8RLQCakBSxHek5KQYC79EsxcFV5Apj4OibsPzWw/m/uApb631WoYKqpDtZom8j6eQ0+opVrHCx18nUJ68XLQrXBoOEqmlloTS4/UG0w2xmKCtLXD35TgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085292; c=relaxed/simple;
	bh=T30ra+tWj8xmNayf0D97b4yId+AmexN8t/uXoaOzjPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcNoMbR6h+jIPPweWuYpnwc0c0/396CR9sEY/SYReoG/x0FMjAF7kPQJ9A6+cFi9VeP1eRRHNJGEMyrkqUiz1bBwSoU+iK03MqpFAyVa6RSABiZ74PbfDIlJ/RQEdq/iVGXAf6eT/6Zm4IV82TvO8K0aiAZ/w/S1DZolHagGr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=DK08614B; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 3F433200C9;
	Mon, 18 May 2026 08:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C08D41FACD3;
	Mon, 18 May 2026 08:21:17 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7eGUm8tTHX2i; Mon, 18 May 2026 08:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B085C1FAD2F;
	Mon, 18 May 2026 08:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz B085C1FAD2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085276;
	bh=QUAiEzp97wF3qbltU1fFd8h/Mz4TvzQY3lZdncaz0jo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DK08614B7J6cePHB2zLtciPKs8UlzqZk4JconsdVv/Fmkim8iL/sCtwPDSDEhq7QE
	 8/+QzVFMr8eRD0baH2mEJss1d4J4UuH6WeiumMRYtNVpEZP2VGkyCb206j92RkbkBs
	 kqKnfPkShUFF2VRIlJ3RYCCSd2DeerV90gNCgad1zqoQtH2/CXdQgVsRZa5pftfHnV
	 6syeKJlsrdZtjf5zrP1l8RrhdZDRB9vCVMUD/20MPrzBvzbHctmodTlqnb66RR5knH
	 7m29C5gKt4VcT1BUX1DSrAwmuwb9QehFNrBGQHMUb4kh24euyILJaEAbblO78XgenJ
	 DU4HmsvsBIzEQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id pH80-6OPbOam; Mon, 18 May 2026 08:21:16 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 560D91FAD29;
	Mon, 18 May 2026 08:21:16 +0200 (CEST)
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
Subject: [PATCH v7 06/15] scripts/sbom: add additional dependency sources for cmd graph
Date: Mon, 18 May 2026 08:20:53 +0200
Message-ID: <20260518062102.2051814-7-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 7FA975669D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13236-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Add hardcoded dependencies and .incbin directive parsing to
discover dependencies not tracked by .cmd files.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 33 ++++++-
 .../sbom/cmd_graph/hardcoded_dependencies.py  | 87 +++++++++++++++++++
 scripts/sbom/sbom/cmd_graph/incbin_parser.py  | 42 +++++++++
 3 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/incbin_parser.py

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py b/scripts/sbom=
/sbom/cmd_graph/cmd_graph_node.py
index 7dde1c28eef..61f3a8140ce 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
@@ -2,15 +2,24 @@
 # Copyright (C) 2025 TNG Technology Consulting GmbH
=20
 from dataclasses import dataclass, field
+from itertools import chain
 import logging
 import os
 from typing import Iterator, Protocol
=20
 from sbom import sbom_logging
 from sbom.cmd_graph.cmd_file import CmdFile
+from sbom.cmd_graph.hardcoded_dependencies import get_hardcoded_dependen=
cies
+from sbom.cmd_graph.incbin_parser import parse_incbin_statements
 from sbom.path_utils import PathStr, has_link, is_relative_to
=20
=20
+@dataclass
+class IncbinDependency:
+    node: "CmdGraphNode"
+    full_statement: str
+
+
 class CmdGraphNodeConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
@@ -28,11 +37,17 @@ class CmdGraphNode:
     """Parsed .cmd file describing how the file at absolute_path was bui=
lt, or None if not available."""
=20
     cmd_file_dependencies: list["CmdGraphNode"] =3D field(default_factor=
y=3Dlist)
+    incbin_dependencies: list[IncbinDependency] =3D field(default_factor=
y=3Dlist)
+    hardcoded_dependencies: list["CmdGraphNode"] =3D field(default_facto=
ry=3Dlist)
=20
     @property
     def children(self) -> Iterator["CmdGraphNode"]:
         seen: set[PathStr] =3D set()
-        for node in self.cmd_file_dependencies:
+        for node in chain(
+            self.cmd_file_dependencies,
+            (dep.node for dep in self.incbin_dependencies),
+            self.hardcoded_dependencies,
+        ):
             if node.absolute_path not in seen:
                 seen.add(node.absolute_path)
                 yield node
@@ -95,6 +110,13 @@ class CmdGraphNode:
         def _build_child_node(child_path: PathStr) -> "CmdGraphNode":
             return CmdGraphNode.create(child_path, config, cache, depth =
+ 1)
=20
+        node.hardcoded_dependencies =3D [
+            _build_child_node(hardcoded_dependency_path)
+            for hardcoded_dependency_path in get_hardcoded_dependencies(
+                target_path_absolute, config.obj_tree, config.src_tree
+            )
+        ]
+
         if cmd_file is not None:
             node.cmd_file_dependencies =3D [
                 _build_child_node(cmd_file_dependency_path)
@@ -103,6 +125,15 @@ class CmdGraphNode:
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
diff --git a/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py b/scri=
pts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
new file mode 100644
index 00000000000..2eb04d30f4e
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
@@ -0,0 +1,87 @@
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
+"""
+Maps file paths to the list of dependencies required to build them
+which are not tracked by the .cmd dependency mechanism.
+Paths are relative to either the source tree or the object tree.
+"""
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
+        elif os.path.exists(dependency_absolute :=3D os.path.join(src_tr=
ee, dependency)):
+            dependencies.append(os.path.relpath(dependency_absolute, obj=
_tree))
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
diff --git a/scripts/sbom/sbom/cmd_graph/incbin_parser.py b/scripts/sbom/=
sbom/cmd_graph/incbin_parser.py
new file mode 100644
index 00000000000..ca289c2b888
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/incbin_parser.py
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
+    with open(absolute_path, "rt", encoding=3D"utf-8") as f:
+        content =3D f.read()
+    return [
+        IncbinStatement(
+            path=3Dmatch.group("path"),
+            full_statement=3Dmatch.group(0).strip(),
+        )
+        for match in INCBIN_PATTERN.finditer(content)
+    ]
--=20
2.43.0


