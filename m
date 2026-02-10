Return-Path: <linux-kbuild+bounces-11100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJIaOqqbi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11100-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:57:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A811F2DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D42F303FAE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB5A336EE7;
	Tue, 10 Feb 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="L83dx/cs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63113334C06;
	Tue, 10 Feb 2026 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756914; cv=none; b=GUkYeXBSpV/Sq9rO66+ENtwEH7urzAn/B8H0WOI6QPXftJtvZe7TPxRAvd+VReDbsho5oZKiDHJdIJA5jJtaqb5VTVyjVA02r6eBnv0Po5xgUrg7CLicgc2iwqZE78gxsjqK418IfQdB2MuF14Zse6NQODJsWMMh1/BXfiHUjq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756914; c=relaxed/simple;
	bh=z46CzfEwCgubETXX+VR96PRcPHGksw4Omg2gBQOxuuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbCOszWEB60N5iZa+FJF54RIDt7egOT5sGFcdu10IW5EaX1Iuxpq+kZt/cKU9/M1+DCsU3qsmDj8CJV6nmHDPddfaUKRFcQ6vPoom+c3pgVzU/W0RbFoydr2WULj6YIoHfhBDCPYCWetI1noV7efWKiKobazZ0e4MtLCpva5AZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=L83dx/cs; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 143ED3FAF0;
	Tue, 10 Feb 2026 21:55:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C1C901FA8CD;
	Tue, 10 Feb 2026 21:55:04 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id qGfmRll1i-5L; Tue, 10 Feb 2026 21:55:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E81341FA952;
	Tue, 10 Feb 2026 21:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz E81341FA952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756904;
	bh=6roMjR2a619Wnado/gGPgnY04vOcE8DszX6XtCQQg6s=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=L83dx/csSm+rleoYA5U/ayxhvLpwAgTW6X/YlBuz73WGBzYpyoXkiOb2hrPg4Rfeg
	 BXIY9B93X+uvaYaKDNIXGeLUiUKYv+s/M6l43g7X/ZTTQQ+Ztxoh6bWkyop7n6//v0
	 0RPuG6CnNZGSnALQgUBGGDYSNMHei+LzPjLn184VyvHwx2koKDV5vVvIdL0HkvGaUH
	 suq/2GJlTrTxDBqeg83EMANLP1EKEz+XXa5GIeECYwiI4mE8YMWfzOknp91qJRQiXx
	 CQQtI2A2bpdf90Cwsp9zGxLD3oxm5VY2yZFjcmJwQhakWc2NWEvtcervQ0CxrYLCKz
	 EnJ62VtdXLzCw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id B0Cu17xA9G7f; Tue, 10 Feb 2026 21:55:03 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 8BFEE1FA8CD;
	Tue, 10 Feb 2026 21:55:03 +0100 (CET)
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
Subject: [PATCH 01/15] scripts/sbom: add documentation
Date: Tue, 10 Feb 2026 21:54:10 +0100
Message-Id: <20260210205424.11195-2-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11100-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spdx.github.io:url,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,spdx.org:url];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 463A811F2DF
X-Rspamd-Action: no action

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 Documentation/tools/index.rst     |   1 +
 Documentation/tools/sbom/sbom.rst | 206 ++++++++++++++++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 Documentation/tools/sbom/sbom.rst

diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rs=
t
index 80488e290e10..6b0319b2d334 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -12,6 +12,7 @@ more additions are needed here:
=20
    rtla/index
    rv/index
+   sbom/sbom
=20
 .. only::  subproject and html
=20
diff --git a/Documentation/tools/sbom/sbom.rst b/Documentation/tools/sbom=
/sbom.rst
new file mode 100644
index 000000000000..029b08b6ad87
--- /dev/null
+++ b/Documentation/tools/sbom/sbom.rst
@@ -0,0 +1,206 @@
+.. SPDX-License-Identifier: GPL-2.0-only OR MIT
+.. Copyright (C) 2025 TNG Technology Consulting GmbH
+
+KernelSbom
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+------------
+
+KernelSbom is a Python script ``scripts/sbom/sbom.py`` that can be
+executed after a successful kernel build. When invoked, KernelSbom
+analyzes all files involved in the build and generates Software Bill of
+Materials (SBOM) documents in SPDX 3.0.1 format.
+The generated SBOM documents capture:
+
+* **Final output artifacts**, typically the kernel image and modules
+* **All source files** that contributed to the build with metadata
+  and licensing information
+* **Details of the build process**, including intermediate artifacts
+  and the build commands linking source files to the final output
+  artifacts
+
+KernelSbom is originally developed in the
+`KernelSbom repository <https://github.com/TNG/KernelSbom>`_.
+
+Requirements
+------------
+
+Python 3.10 or later. No libraries or other dependencies are required.
+
+Basic Usage
+-----------
+
+Run the ``make sbom`` target.
+For example::
+
+    $ make defconfig O=3Dkernel_build
+    $ make sbom O=3Dkernel_build -j$(nproc)
+
+This will trigger a kernel build. After all build outputs have been
+generated, KernelSbom produces three SPDX documents in the root
+directory of the object tree:
+
+* ``sbom-source.spdx.json``
+  Describes all source files involved in the build and
+  associates each file with its corresponding license expression.
+
+* ``sbom-output.spdx.json``
+  Captures all final build outputs (kernel image and ``.ko`` module file=
s)
+  and includes build metadata such as environment variables and
+  a hash of the ``.config`` file used for the build.
+
+* ``sbom-build.spdx.json``
+  Imports files from the source and output documents and describes every
+  intermediate build artifact. For each artifact, it records the exact
+  build command used and establishes the relationship between
+  input files and generated outputs.
+
+When invoking the sbom target, it is recommended to perform
+out-of-tree builds using ``O=3D<objtree>``. KernelSbom classifies files =
as
+source files when they are located in the source tree and not in the
+object tree. For in-tree builds, where the source and object trees are
+the same directory, this distinction can no longer be made reliably.
+In that case, KernelSbom does not generate a dedicated source SBOM.
+Instead, source files are included in the build SBOM.
+
+Standalone Usage
+----------------
+
+KernelSbom can also be used as a standalone script to generate
+SPDX documents for specific build outputs. For example, after a
+successful x86 kernel build, KernelSbom can generate SPDX documents
+for the ``bzImage`` kernel image::
+
+    $ SRCARCH=3Dx86 python3 scripts/sbom/sbom.py \
+        --src-tree . \
+        --obj-tree ./kernel_build \
+        --roots arch/x86/boot/bzImage \
+        --generate-spdx \
+        --generate-used-files \
+        --prettify-json \
+        --debug
+
+Note that when KernelSbom is invoked outside of the ``make`` process,
+the environment variables used during compilation are not available and
+therefore cannot be included in the generated SPDX documents. It is
+recommended to set at least the ``SRCARCH`` environment variable to the
+architecture for which the build was performed.
+
+For a full list of command-line options, run::
+
+    $ python3 scripts/sbom/sbom.py --help
+
+Output Format
+-------------
+
+KernelSbom generates documents conforming to the
+`SPDX 3.0.1 specification <https://spdx.github.io/spdx-spec/v3.0.1/>`_
+serialized as JSON-LD.
+
+To reduce file size, the output documents use the JSON-LD ``@context``
+to define custom prefixes for ``spdxId`` values. While this is compliant
+with the SPDX specification, only a limited number of tools in the
+current SPDX ecosystem support custom JSON-LD contexts. To use such
+tools with the generated documents, the custom JSON-LD context must
+be expanded before providing the documents.
+See https://lists.spdx.org/g/Spdx-tech/message/6064 for more information=
.
+
+How it Works
+------------
+
+KernelSbom operates in two major phases:
+
+1. **Generate the cmd graph**, an acyclic directed dependency graph.
+2. **Generate SPDX documents** based on the cmd graph.
+
+KernelSbom begins from the root artifacts specified by the user, e.g.,
+``arch/x86/boot/bzImage``. For each root artifact, it collects all
+dependencies required to build that artifact. The dependencies come
+from multiple sources:
+
+* **.cmd files**: The primary source is the ``.cmd`` file of the
+  generated artifact, e.g., ``arch/x86/boot/.bzImage.cmd``. These files
+  contain the exact command used to build the artifact and often include
+  an explicit list of input dependencies. By parsing the ``.cmd``
+  file, the full list of dependencies can be obtained.
+
+* **.incbin statements**: The second source are include binary
+  ``.incbin`` statements in ``.S`` assembly files.
+
+* **Hardcoded dependencies**: Unfortunately, not all build dependencies
+  can be found via ``.cmd`` files and ``.incbin`` statements. Some build
+  dependencies are directly defined in Makefiles or Kbuild files.
+  Parsing these files is considered too complex for the scope of this
+  project. Instead, the remaining gaps of the graph are filled using a
+  list of manually defined dependencies, see
+  ``scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py``. This list i=
s
+  known to be incomplete. However, analysis of the cmd graph indicates a
+  ~99% completeness. For more information about the completeness analysi=
s,
+  see `KernelSbom #95 <https://github.com/TNG/KernelSbom/issues/95>`_.
+
+Given the list of dependency files, KernelSbom recursively processes
+each file, expanding the dependency chain all the way to the version
+controlled source files. The result is a complete dependency graph
+where nodes represent files, and edges represent "file A was used to
+build file B" relationships.
+
+Using the cmd graph, KernelSbom produces three SPDX documents.
+For every file in the graph, KernelSbom:
+
+* Parses ``SPDX-License-Identifier`` headers,
+* Computes file hashes,
+* Estimates the file type based on extension and path,
+* Records build relationships between files.
+
+Each root output file is additionally associated with an SPDX Package
+element that captures version information, license data, and copyright.
+
+Advanced Usage
+--------------
+
+Including Kernel Modules
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The list of all ``.ko`` kernel modules produced during a build can be
+extracted from the ``modules.order`` file within the object tree.
+For example::
+
+    $ echo "arch/x86/boot/bzImage" > sbom-roots.txt
+    $ sed 's/\.o$/.ko/' ./kernel_build/modules.order >> sbom-roots.txt
+
+Then use the generated roots file::
+
+    $ SRCARCH=3Dx86 python3 scripts/sbom/sbom.py \
+        --src-tree . \
+        --obj-tree ./kernel_build \
+        --roots-file sbom-roots.txt \
+        --generate-spdx
+
+Equal Source and Object Trees
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When the source tree and object tree are identical (for example, when
+building in-tree), source files can no longer be reliably distinguished
+from generated files.
+In this scenario, KernelSbom does not produce a dedicated
+``sbom-source.spdx.json`` document. Instead, both source files and build
+artifacts are included together in ``sbom-build.spdx.json``, and
+``sbom.used-files.txt`` lists all files referenced in the build document=
.
+
+Unknown Build Commands
+~~~~~~~~~~~~~~~~~~~~~~
+
+Because the kernel supports a wide range of configurations and versions,
+KernelSbom may encounter build commands in ``.cmd`` files that it does
+not yet support. By default, KernelSbom will fail if an unknown build
+command is encountered.
+
+If you still wish to generate SPDX documents despite unsupported
+commands, you can use the ``--do-not-fail-on-unknown-build-command``
+option. KernelSbom will continue and produce the documents, although
+the resulting SBOM will be incomplete.
+
+This option should only be used when the missing portion of the
+dependency graph is small and an incomplete SBOM is acceptable for
+your use case.
--=20
2.34.1

