Return-Path: <linux-kbuild+bounces-12746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDWTFWNq2Wn5pQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12746-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:23:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2A3DCDD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BD213005399
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA463AF674;
	Fri, 10 Apr 2026 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="hUcj9pSF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D53CE484;
	Fri, 10 Apr 2026 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856223; cv=none; b=oBhrIKxxu9ybBHy8WQdcbnSPAFmHeV3OJMtqJS9wKpN525hv+gwmBnDyEQ+82XdmpEzCbr/wco25aCX7OKmU/ifNtk8VrptcLxrH6AsDiCfqzIMes4HwOG6+DBI/7Xz33W4m0xN9d6rsIoEGkr1cpni+sEUyf33p+jPvRXdjR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856223; c=relaxed/simple;
	bh=MyXYbny0p7YtafTHy2tJkFVT/L3pClljyZAX67XjY4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diw2VP4XgGksWicUt7DiEOdEOxYx2aBuH4j0clPVWx5xUf/+cHD/SEV8GVdXvqctZGjkz9FEdqJ0Y3Jk85rwdpF+GF4ioQ+2CVcgO6tFYfm9Bb4i2rJ3x/UcfJCYftjsAoxrELpmV8k3GRfX1jlcoJEokMQUWXPtNPbbfJrRQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=hUcj9pSF; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 02A1A3FAF6;
	Fri, 10 Apr 2026 23:23:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E3AFE1F89B3;
	Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id GDhGXyp_D1tl; Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2FFFB1FADC9;
	Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 2FFFB1FADC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856217;
	bh=ixwQrFF/HCDbBOGY+7tdSlPAbfVKT3drjaCxDac2zIE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hUcj9pSF/6h84kvmhW/J1P9/URNt7jaXg7FIGzCsBiE84jz2/6CgnnAG5O3qCDdhH
	 SPbid/m88gQHKV3M/2g3dOnIDypdo9/IYvy6RRpMbJSMbNGJOl4S7pe3qGr9FDtVdg
	 KU10Q9OzpFRrAc/uoTIzMQNbtH8U4WMrIa5Hfxup/NlsV4Kh07LyBCnh6Y+P5KTgkD
	 rVgxAPnZuYY8hYpQISTYQ9bYTVvbIIWwD4aATrDgUvjd6ml6N1ZvBWcr3qgsS1hBJV
	 Y0zuVl98p5d5t0aZXXZjNUZC1UchoPi6/Vb9RpaHt5eeLkg1VREF1ajIg4jzWeQemM
	 sCHuEPgzxLzuw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id V_qeZmypfRFm; Fri, 10 Apr 2026 23:23:37 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C8B3A1F89B3;
	Fri, 10 Apr 2026 23:23:36 +0200 (CEST)
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
Subject: [PATCH v5 06/15] scripts/sbom: add additional dependency sources for cmd graph
Date: Fri, 10 Apr 2026 23:22:46 +0200
Message-ID: <20260410212255.9883-7-luis.augenstein@tngtech.com>
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
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12746-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: BFE2A3DCDD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luis Augenstein <luis.augenstein@tngtech.com>

Add hardcoded dependencies and .incbin directive parsing to
discover dependencies not tracked by .cmd files.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 33 +++++++-
 .../sbom/cmd_graph/hardcoded_dependencies.py  | 83 +++++++++++++++++++
 scripts/sbom/sbom/cmd_graph/incbin_parser.py  | 42 ++++++++++
 3 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/incbin_parser.py

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py b/scripts/sbom=
/sbom/cmd_graph/cmd_graph_node.py
index 7a5279a1ba0..feacdbf7695 100644
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
 from sbom.path_utils import PathStr, is_relative_to
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
y=3Dlist["CmdGraphNode"])
+    incbin_dependencies: list[IncbinDependency] =3D field(default_factor=
y=3Dlist[IncbinDependency])
+    hardcoded_dependencies: list["CmdGraphNode"] =3D field(default_facto=
ry=3Dlist["CmdGraphNode"])
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
index 00000000000..a5977f14ae4
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
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
diff --git a/scripts/sbom/sbom/cmd_graph/incbin_parser.py b/scripts/sbom/=
sbom/cmd_graph/incbin_parser.py
new file mode 100644
index 00000000000..130f9520837
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
+    with open(absolute_path, "rt") as f:
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


