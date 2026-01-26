Return-Path: <linux-kbuild+bounces-10875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC7jJybCd2nKkgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10875-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:36:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB008C9F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7B1030252B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238B0229B36;
	Mon, 26 Jan 2026 19:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="ji3kX5Z3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087326299;
	Mon, 26 Jan 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456130; cv=none; b=Cnrdvqgo2gYegz6Xnh2UlIcHdTSGDNj2/DJx4QREKFeIuMgeZ9xYaCE85uALaGpZLye5yfYlCh4f2GqA/JdktKvV3tWW5Y+qMaxS+iPWIVQsU1m/MaQYYhy79uuzkZ/3pvzK5PqMUD0y4zSKL0VEiLB0Y44ROATC5g5Iiqj64ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456130; c=relaxed/simple;
	bh=a1CLXFbQ5+y3Pm8Po8T4c1o5FI27N7Dg2WpWMiQme0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K+sQava1CBlIDnQtP4OnPdkC6RV1kcy08Fm6eulV+evkc69wom+Sp25xn04C6Lr2KEM8/MOoJW+purwQ41kV/uFqkn38lvDDMltNZoo08jSMLLOv/ZDS+IfhsKKosgE1LjQL8cidHObaOvhoqJXBbzQOyGNsLWA6NZKRFUcYaUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=ji3kX5Z3; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 485023FAF1;
	Mon, 26 Jan 2026 20:35:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 1B2301FA878;
	Mon, 26 Jan 2026 20:35:26 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id V03SDoXgyLFV; Mon, 26 Jan 2026 20:35:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 95BB71FA707;
	Mon, 26 Jan 2026 20:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 95BB71FA707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1769456122;
	bh=lEKS0ZbWsthJmCiuPhhWQbtJ3rpxVFIKmbJc0QGQK8A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ji3kX5Z32f9y0dTMB1uCVID68nYf/xoXVgCqBq1bL5FGAYR894/gwcCygTqTir6ZE
	 icWipBpyaVdLrJ4mYI0GN+dRIzuFifqvaYY3H7Q8BhenvXKrxraImoT7rKHpBwYoIg
	 LcfJwVAM0XuKqI+6uhvugBlp2qJK1nlyNRexoZ3jgyTk6m8//nYd018bzNq3mCUrDX
	 T024ks/XiRY3Dqxsu5/1YJz4Kt6phz4xJZFKaNLJmk8QQ8KzYqI+V3pUGrma57FUDp
	 eTXLEOWrQRWnuAV1+Pt57Z9AHK5vf1w3iDKDG3cKTrMsfVqErBkM4YLEvkO3mWVQl7
	 EEgTRvzo+oZhg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id SrEIBFBvSAGP; Mon, 26 Jan 2026 20:35:22 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 95E4E1FA8D7;
	Mon, 26 Jan 2026 20:35:20 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v3 05/14] tools/sbom: add additional dependency sources for cmd graph
Date: Mon, 26 Jan 2026 20:32:55 +0100
Message-Id: <20260126193304.320916-6-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126193304.320916-1-luis.augenstein@tngtech.com>
References: <20260126193304.320916-1-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10875-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:email,tngtech.com:dkim,tngtech.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[tngtech.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2AB008C9F9
X-Rspamd-Action: no action

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
index fdaed0f0ccba..feacdbf76955 100644
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
index 000000000000..a5977f14ae49
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
index 000000000000..130f9520837d
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
index 000000000000..b3fb2f0ba61d
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


