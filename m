Return-Path: <linux-kbuild+bounces-10666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EFD39F0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74B2D3036425
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46800286416;
	Mon, 19 Jan 2026 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="Erwo7pz4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BDA2836A4;
	Mon, 19 Jan 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805355; cv=none; b=koBHF/dJQfYP6lvKks9u6AOJKyPaIP5HL1ARhzzLz857vNxrzQYRqo1mzFX8WZTrSyT3iOlVL2vmWQW0wuUzRKa5uQsO28D5xoAZihs8uguXMoQuunkp4XLPmn3C87cDuTPXsmUWa7/zoDviI6+PaGJXScwWu0QLt2bNGniukiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805355; c=relaxed/simple;
	bh=z8VljajjmjjtZTPFHIokOKbe8xBe7rGROHsRV5zSb/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HgPa1HmuE2v4iw32an3MI3fbSAAdg+QbTvLjF3wE2YwfC1bU9sdeeNhyUfc1L0oL0PMAnd2J4qpe6hRJlW5kny+fch653XjPG391FcwzK9Hbu7K7lQocIJzXOBWoMRp2huGJREK5JBnK9PspoVw15xurTk9mSQpYsPTcosOv6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=Erwo7pz4; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id AE150200CA;
	Mon, 19 Jan 2026 07:49:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 6EFDC1FA802;
	Mon, 19 Jan 2026 07:49:06 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u7bW7Pnd3q57; Mon, 19 Jan 2026 07:49:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 1C3B41FA56A;
	Mon, 19 Jan 2026 07:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 1C3B41FA56A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805345;
	bh=LoabRW+kGkUJFwZK9CX2TgFN9c/Ij+DUQn7JYqRv/B4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Erwo7pz47m0JxfJ8E/dEuut5OgFczgxo+16NdbnW+YlSdeiC5LJTpO5Tap3qLzVoz
	 PdQAX/qSnYMCSphRLOAlTt1E8O/wudLrqDn6huxpGDkNtAybuKhZYyvnWYeUpYlLzz
	 29BX0uz5IYedTsFzQ59hJr2CHDu7q6MmZWImnaRuqLddAFcLDX6QvEsZKvUvqfgU39
	 Ik0JYC+SfxbsbidtRKPjBjdOWlhfDXqC/T2dw9AmkGn0L2+Ua7L1PCF4yXJ2xJpJBT
	 zvIpFogbp7DcelERCHe47ldEino07ioSl93ppyvdPWS/VZbwltO8P6nyPmKJwEjU1f
	 GKFCFNMiJMdWA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3taDP8DY47Ly; Mon, 19 Jan 2026 07:49:05 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id BDF6A1FA802;
	Mon, 19 Jan 2026 07:49:04 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 12/14] tools/sbom: add SPDX build graph
Date: Mon, 19 Jan 2026 07:47:29 +0100
Message-Id: <20260119064731.23879-13-luis.augenstein@tngtech.com>
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

Implement the SPDX build graph to describe the relationships
between source files in the source SBOM and output files in
the output SBOM.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  17 +
 .../sbom/sbom/spdx_graph/spdx_build_graph.py  | 317 ++++++++++++++++++
 2 files changed, 334 insertions(+)
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_build_graph.py

diff --git a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py b/tools/sbom=
/sbom/spdx_graph/build_spdx_graphs.py
index a61257a90..eecc52156 100644
--- a/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
+++ b/tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
@@ -4,6 +4,7 @@
 from datetime import datetime
 from typing import Protocol
=20
+import logging
 from sbom.config import KernelSpdxDocumentKind
 from sbom.cmd_graph import CmdGraph
 from sbom.path_utils import PathStr
@@ -11,6 +12,7 @@ from sbom.spdx_graph.kernel_file import KernelFileColle=
ction
 from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
 from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
 from sbom.spdx_graph.spdx_source_graph import SpdxSourceGraph
+from sbom.spdx_graph.spdx_build_graph import SpdxBuildGraph
 from sbom.spdx_graph.spdx_output_graph import SpdxOutputGraph
=20
=20
@@ -61,5 +63,20 @@ def build_spdx_graphs(
             shared_elements=3Dshared_elements,
             spdx_id_generators=3Dspdx_id_generators,
         )
+    else:
+        logging.info(
+            "Skipped creating a dedicated source SBOM because source fil=
es cannot be "
+            "reliably classified when the source and object trees are id=
entical. "
+            "Added source files to the build SBOM instead."
+        )
+
+    build_graph =3D SpdxBuildGraph.create(
+        cmd_graph,
+        kernel_files,
+        shared_elements,
+        output_graph.high_level_build_element,
+        spdx_id_generators,
+    )
+    spdx_graphs[KernelSpdxDocumentKind.BUILD] =3D build_graph
=20
     return spdx_graphs
diff --git a/tools/sbom/sbom/spdx_graph/spdx_build_graph.py b/tools/sbom/=
sbom/spdx_graph/spdx_build_graph.py
new file mode 100644
index 000000000..2956800fa
--- /dev/null
+++ b/tools/sbom/sbom/spdx_graph/spdx_build_graph.py
@@ -0,0 +1,317 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass
+from typing import Mapping
+from sbom.cmd_graph import CmdGraph
+from sbom.path_utils import PathStr
+from sbom.spdx import SpdxIdGenerator
+from sbom.spdx.build import Build
+from sbom.spdx.core import ExternalMap, NamespaceMap, Relationship, Spdx=
Document
+from sbom.spdx.software import File, Sbom
+from sbom.spdx_graph.kernel_file import KernelFileCollection
+from sbom.spdx_graph.shared_spdx_elements import SharedSpdxElements
+from sbom.spdx_graph.spdx_graph_model import SpdxGraph, SpdxIdGeneratorC=
ollection
+from sbom.spdx_graph.spdx_source_graph import source_file_license_elemen=
ts
+
+
+@dataclass
+class SpdxBuildGraph(SpdxGraph):
+    """SPDX graph representing build dependencies connecting source file=
s and
+    distributable output files"""
+
+    @classmethod
+    def create(
+        cls,
+        cmd_graph: CmdGraph,
+        kernel_files: KernelFileCollection,
+        shared_elements: SharedSpdxElements,
+        high_level_build_element: Build,
+        spdx_id_generators: SpdxIdGeneratorCollection,
+    ) -> "SpdxBuildGraph":
+        if len(kernel_files.source) > 0:
+            return _create_spdx_build_graph(
+                cmd_graph,
+                kernel_files,
+                shared_elements,
+                high_level_build_element,
+                spdx_id_generators,
+            )
+        else:
+            return _create_spdx_build_graph_with_mixed_sources(
+                cmd_graph,
+                kernel_files,
+                shared_elements,
+                high_level_build_element,
+                spdx_id_generators,
+            )
+
+
+def _create_spdx_build_graph(
+    cmd_graph: CmdGraph,
+    kernel_files: KernelFileCollection,
+    shared_elements: SharedSpdxElements,
+    high_level_build_element: Build,
+    spdx_id_generators: SpdxIdGeneratorCollection,
+) -> SpdxBuildGraph:
+    """
+    Creates an SPDX build graph where source and output files are refere=
nced
+    from external documents.
+
+    Args:
+        cmd_graph: The dependency graph of a kernel build.
+        kernel_files: Collection of categorized kernel files involved in=
 the build.
+        shared_elements: SPDX elements shared across multiple documents.
+        high_level_build_element: The high-level Build element reference=
d by the build graph.
+        spdx_id_generators: Collection of generators for SPDX element ID=
s.
+
+    Returns:
+        SpdxBuildGraph: The SPDX build graph connecting source files and=
 distributable output files.
+    """
+    # SpdxDocument
+    build_spdx_document =3D SpdxDocument(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        profileConformance=3D["core", "software", "build"],
+        namespaceMap=3D[
+            NamespaceMap(prefix=3Dgenerator.prefix, namespace=3Dgenerato=
r.namespace)
+            for generator in [
+                spdx_id_generators.build,
+                spdx_id_generators.source,
+                spdx_id_generators.output,
+                spdx_id_generators.base,
+            ]
+            if generator.prefix is not None
+        ],
+    )
+
+    # Sbom
+    build_sbom =3D Sbom(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        software_sbomType=3D["build"],
+    )
+
+    # Src and object tree elements
+    obj_tree_element =3D File(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        name=3D"$(obj_tree)",
+        software_fileKind=3D"directory",
+    )
+    obj_tree_contains_relationship =3D Relationship(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        relationshipType=3D"contains",
+        from_=3Dobj_tree_element,
+        to=3D[],
+    )
+
+    # File elements
+    build_file_elements =3D [file.spdx_file_element for file in kernel_f=
iles.build.values()]
+    file_relationships =3D _file_relationships(
+        cmd_graph=3Dcmd_graph,
+        file_elements=3D{key: file.spdx_file_element for key, file in ke=
rnel_files.to_dict().items()},
+        high_level_build_element=3Dhigh_level_build_element,
+        spdx_id_generator=3Dspdx_id_generators.build,
+    )
+
+    # Update relationships
+    build_spdx_document.rootElement =3D [build_sbom]
+
+    build_spdx_document.import_ =3D [
+        *(
+            ExternalMap(externalSpdxId=3Dfile_element.spdx_file_element.=
spdxId)
+            for file_element in kernel_files.source.values()
+        ),
+        ExternalMap(externalSpdxId=3Dhigh_level_build_element.spdxId),
+        *(ExternalMap(externalSpdxId=3Dfile.spdx_file_element.spdxId) fo=
r file in kernel_files.output.values()),
+    ]
+
+    build_sbom.rootElement =3D [obj_tree_element]
+    build_sbom.element =3D [
+        obj_tree_element,
+        obj_tree_contains_relationship,
+        *build_file_elements,
+        *file_relationships,
+    ]
+
+    obj_tree_contains_relationship.to =3D [
+        *build_file_elements,
+        *(file.spdx_file_element for file in kernel_files.output.values(=
)),
+    ]
+
+    # create Spdx graphs
+    build_graph =3D SpdxBuildGraph(
+        build_spdx_document,
+        shared_elements.agent,
+        shared_elements.creation_info,
+        build_sbom,
+    )
+    return build_graph
+
+
+def _create_spdx_build_graph_with_mixed_sources(
+    cmd_graph: CmdGraph,
+    kernel_files: KernelFileCollection,
+    shared_elements: SharedSpdxElements,
+    high_level_build_element: Build,
+    spdx_id_generators: SpdxIdGeneratorCollection,
+) -> SpdxBuildGraph:
+    """
+    Creates an SPDX build graph where only output files are referenced f=
rom
+    an external document. Source files are included directly in the buil=
d graph.
+
+    Args:
+        cmd_graph: The dependency graph of a kernel build.
+        kernel_files: Collection of categorized kernel files involved in=
 the build.
+        shared_elements: SPDX elements shared across multiple documents.
+        high_level_build_element: The high-level Build element reference=
d by the build graph.
+        spdx_id_generators: Collection of generators for SPDX element ID=
s.
+
+    Returns:
+        SpdxBuildGraph: The SPDX build graph connecting source files and=
 distributable output files.
+    """
+    # SpdxDocument
+    build_spdx_document =3D SpdxDocument(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        profileConformance=3D["core", "software", "build"],
+        namespaceMap=3D[
+            NamespaceMap(prefix=3Dgenerator.prefix, namespace=3Dgenerato=
r.namespace)
+            for generator in [
+                spdx_id_generators.build,
+                spdx_id_generators.output,
+                spdx_id_generators.base,
+            ]
+            if generator.prefix is not None
+        ],
+    )
+
+    # Sbom
+    build_sbom =3D Sbom(
+        spdxId=3Dspdx_id_generators.build.generate(),
+        software_sbomType=3D["build"],
+    )
+
+    # File elements
+    build_file_elements =3D [file.spdx_file_element for file in kernel_f=
iles.build.values()]
+    file_relationships =3D _file_relationships(
+        cmd_graph=3Dcmd_graph,
+        file_elements=3D{key: file.spdx_file_element for key, file in ke=
rnel_files.to_dict().items()},
+        high_level_build_element=3Dhigh_level_build_element,
+        spdx_id_generator=3Dspdx_id_generators.build,
+    )
+
+    # Source file license elements
+    source_file_license_identifiers, source_file_license_relationships =3D=
 source_file_license_elements(
+        list(kernel_files.build.values()), spdx_id_generators.build
+    )
+
+    # Update relationships
+    build_spdx_document.rootElement =3D [build_sbom]
+    root_file_elements =3D [file.spdx_file_element for file in kernel_fi=
les.output.values()]
+    build_spdx_document.import_ =3D [
+        ExternalMap(externalSpdxId=3Dhigh_level_build_element.spdxId),
+        *(ExternalMap(externalSpdxId=3Dfile.spdxId) for file in root_fil=
e_elements),
+    ]
+
+    build_sbom.rootElement =3D [*root_file_elements]
+    build_sbom.element =3D [
+        *build_file_elements,
+        *source_file_license_identifiers,
+        *source_file_license_relationships,
+        *file_relationships,
+    ]
+
+    build_graph =3D SpdxBuildGraph(
+        build_spdx_document,
+        shared_elements.agent,
+        shared_elements.creation_info,
+        build_sbom,
+    )
+    return build_graph
+
+
+def _file_relationships(
+    cmd_graph: CmdGraph,
+    file_elements: Mapping[PathStr, File],
+    high_level_build_element: Build,
+    spdx_id_generator: SpdxIdGenerator,
+) -> list[Build | Relationship]:
+    """
+    Construct SPDX Build and Relationship elements representing dependen=
cy
+    relationships in the cmd graph.
+
+    Args:
+        cmd_graph: The dependency graph of a kernel build.
+        file_elements: Mapping of filesystem paths (PathStr) to their
+            corresponding SPDX File elements.
+        high_level_build_element: The SPDX Build element representing th=
e overall build process/root.
+        spdx_id_generator: Generator for unique SPDX IDs.
+
+    Returns:
+        list[Build | Relationship]: List of SPDX Build and Relationship =
elements
+    """
+    high_level_build_ancestorOf_relationship =3D Relationship(
+        spdxId=3Dspdx_id_generator.generate(),
+        relationshipType=3D"ancestorOf",
+        from_=3Dhigh_level_build_element,
+        completeness=3D"complete",
+        to=3D[],
+    )
+
+    # Create a relationship between each node (output file)
+    # and its children (input files)
+    build_and_relationship_elements: list[Build | Relationship] =3D [hig=
h_level_build_ancestorOf_relationship]
+    for node in cmd_graph:
+        if next(node.children, None) is None:
+            continue
+
+        # .cmd file dependencies
+        if node.cmd_file is not None:
+            build_element =3D Build(
+                spdxId=3Dspdx_id_generator.generate(),
+                build_buildType=3Dhigh_level_build_element.build_buildTy=
pe,
+                build_buildId=3Dhigh_level_build_element.build_buildId,
+                comment=3Dnode.cmd_file.savedcmd,
+            )
+            hasInput_relationship =3D Relationship(
+                spdxId=3Dspdx_id_generator.generate(),
+                relationshipType=3D"hasInput",
+                from_=3Dbuild_element,
+                to=3D[file_elements[child_node.absolute_path] for child_=
node in node.children],
+            )
+            hasOutput_relationship =3D Relationship(
+                spdxId=3Dspdx_id_generator.generate(),
+                relationshipType=3D"hasOutput",
+                from_=3Dbuild_element,
+                to=3D[file_elements[node.absolute_path]],
+            )
+            build_and_relationship_elements +=3D [
+                build_element,
+                hasInput_relationship,
+                hasOutput_relationship,
+            ]
+            high_level_build_ancestorOf_relationship.to.append(build_ele=
ment)
+
+        # incbin dependencies
+        if len(node.incbin_dependencies) > 0:
+            incbin_dependsOn_relationship =3D Relationship(
+                spdxId=3Dspdx_id_generator.generate(),
+                relationshipType=3D"dependsOn",
+                comment=3D"\n".join([incbin_dependency.full_statement fo=
r incbin_dependency in node.incbin_dependencies]),
+                from_=3Dfile_elements[node.absolute_path],
+                to=3D[
+                    file_elements[incbin_dependency.node.absolute_path]
+                    for incbin_dependency in node.incbin_dependencies
+                ],
+            )
+            build_and_relationship_elements.append(incbin_dependsOn_rela=
tionship)
+
+        # hardcoded dependencies
+        if len(node.hardcoded_dependencies) > 0:
+            hardcoded_dependency_relationship =3D Relationship(
+                spdxId=3Dspdx_id_generator.generate(),
+                relationshipType=3D"dependsOn",
+                from_=3Dfile_elements[node.absolute_path],
+                to=3D[file_elements[n.absolute_path] for n in node.hardc=
oded_dependencies],
+            )
+            build_and_relationship_elements.append(hardcoded_dependency_=
relationship)
+
+    return build_and_relationship_elements
--=20
2.34.1


