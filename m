Return-Path: <linux-kbuild+bounces-13233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHRjHOmvCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13233-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4255669A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF16730062F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E027D3DE445;
	Mon, 18 May 2026 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="DwkX2u3K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF543176EE;
	Mon, 18 May 2026 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085283; cv=none; b=u1Ys2mVOTZwl79w2alhGRpl/1hjKeEJ+zNOxKoRrT0HVdT3n2Z19fzBES/wJ/z+UFNfPT6ZObu+HoXrTb8GfIanllmSuqvU8UZqBFhxLlxWLZDBBZki5PYDeJHdU1lrVkRGv/eF1N5oS8IYDMcuFatllLStjTVrp/dVhFeFgwao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085283; c=relaxed/simple;
	bh=BhDM3wxbRQR+9889hYbygD2Zy9Xs083yLTH4wRhGWIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtK0A+yzTkVTUruAWmU6+l/qar11YMKzADs+BnpL8sQMTW5wBTIkUYSQKjVP048ZLaKuWRC1vrMjXx4zmXpNlyYkBFZkR0XpxvN2xnrdas5Uw9U3pzrR9oagSIcrYJC24Mn73ndel6ESINgMhtWxkzK2dW962bfqWB/Xoft0zYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=DwkX2u3K; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 267C7200AA;
	Mon, 18 May 2026 08:21:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E36E61FAD2B;
	Mon, 18 May 2026 08:21:08 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id SbyGJfaKSExT; Mon, 18 May 2026 08:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 012051FAD2F;
	Mon, 18 May 2026 08:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 012051FAD2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085268;
	bh=D+eLvV0iz2LovY/WMJKzo0PTVmPQCEG6btwOjsAZPIc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DwkX2u3KftQqBVu2HvywtOUJUdcCmuDDlYinkF/bjQWy5Fe93ZqJNv4yte8o0aogj
	 ARPdK/G5lEZ/oAk8eFqKwGqK+4CArAW9MWPSO4/aXcsN97rbOy9uMZB+/toC/nc/eq
	 iiW5mn7NTVJvrYx+5L/ZB90gnrv9sJyVyYGm3pwcU0N0Oufb8zJF+7g48k9ILbyPlc
	 +cupcmNizs/zfO8Z24xV1AlyllZ+gX/bWzgjEE7BNElpUd1KOBoY1Ry9BRzgAjCMie
	 3KRGwMK1iW0iFkJhFlaHPmt1EX6IyJmVKQQ7oE2xTZ7SXdT17NuHoJf31irLRhQ+ly
	 EKMTz1fhQItpA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id sG0-Hq2XVOC8; Mon, 18 May 2026 08:21:07 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 9C5DE1FAD2B;
	Mon, 18 May 2026 08:21:07 +0200 (CEST)
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
Subject: [PATCH v7 01/15] scripts/sbom: add documentation
Date: Mon, 18 May 2026 08:20:48 +0200
Message-ID: <20260518062102.2051814-2-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: BB4255669A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13233-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
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
index 5f2f63bcb28..1adf4a6f909 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -13,3 +13,4 @@ more additions are needed here:
    rtla/index
    rv/index
    python
+   sbom/sbom
diff --git a/Documentation/tools/sbom/sbom.rst b/Documentation/tools/sbom=
/sbom.rst
new file mode 100644
index 00000000000..029b08b6ad8
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
2.43.0


