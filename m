Return-Path: <linux-kbuild+bounces-10672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F198DD39F2C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 07:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7136130161E2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 06:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E843F2BE031;
	Mon, 19 Jan 2026 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="YHtn+7cR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6929D291;
	Mon, 19 Jan 2026 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805925; cv=none; b=NHXwTQtwnSHIvb8FECBHk09J6Qmiu5sOQ3b7V4030PDath+JY3w0xri3uf2hIdKoi+/KX7Q4hy8ciDPDaM3fQIf4nVG6vWtrWRlhJN4lUNU36gF5QfqrcIlBJnqLGcgTWh6TBjK4FBixoawtiNrhv0Xf7RRs1F6TD7XYUzFUNig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805925; c=relaxed/simple;
	bh=+Cdu9dTNpsyFd9tWtns2EuGZ+6EV1WK9UhJsOZdDnS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oXeVWod+065uzcaSAv3mXFklLL8BsNJOyjPUl/RXUekWy3owHG5uj8AVfU+zPBScjqWThiz8+j6KGGvnyezK9kZltYdP01w8xEs/wUNxQ8N1fJOn44oru1Hqgn7pGEQu4dXpYIrsFwlYC33UB9X/Xd9InIY9hd5pf/FphoX3vIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=YHtn+7cR; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 66397200B0;
	Mon, 19 Jan 2026 07:48:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E259A1F88B3;
	Mon, 19 Jan 2026 07:48:40 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6mBRldcEwi5w; Mon, 19 Jan 2026 07:48:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 2EC991FA56A;
	Mon, 19 Jan 2026 07:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 2EC991FA56A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768805320;
	bh=nsytgFEUhXAjMJBwubuN3tjNMA0H6+Mk1QvLD/GxVKI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YHtn+7cR/BqBt+qNcTb03uR672TLWCLHGO+/78dXmgr0VhPTzeJGxxMQ00W/bmtlS
	 +77Mla01x43L7YW0CvCuz0cYacaok5WsdsbgSG3b2yOPDDQwC3IZm/P41QC0mgXTqr
	 A9NaaqSzN8XOwpaIhEcOI4j0rZiZDnK4kfuxQW6a+6eNcotw6jwyiGTjY5aDtTsZCu
	 onQ467c2mdSS2UfiyAP4PJ3K3OBtbuXdaMt5lzCQepd6GtDnhtZIkyVD4jpMADlvel
	 QldKGpsqpjgxmxNz0NK1MVkW0LyInWMY1lmxDMagbOvmy7kklHGUQwHe7uZ4wC8jeE
	 lrikps58j42JA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Uye6xvrrKdym; Mon, 19 Jan 2026 07:48:40 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C781E1F88B3;
	Mon, 19 Jan 2026 07:48:39 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 00/14] Add SPDX SBOM generation tool
Date: Mon, 19 Jan 2026 07:47:17 +0100
Message-Id: <20260119064731.23879-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series introduces a Python-based tool for generating SBOM
documents in the SPDX 3.0.1 format for kernel builds.

A Software Bill of Materials (SBOM) describes the individual components
of a software product. For the kernel, the goal is to describe the
distributable build outputs (typically the kernel image and modules),
the source files involved in producing these outputs, and the build
process that connects the source and output files.

To achieve this, the SBOM tool generates three SPDX documents:

- sbom-output.spdx.json
  Describes the final build outputs together with high-level
  build metadata.

- sbom-source.spdx.json
  Describes all source files involved in the build, including
  licensing information and additional file metadata.

- sbom-build.spdx.json
  Describes the entire build process, linking source files
  from the source SBOM to output files in the output SBOM.

The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
is invoked after the build, once all output artifacts have been
generated. Starting from the kernel image and modules as root nodes,
the tool reconstructs the dependency graph up to the original source
files. Build dependencies are primarily derived from the .cmd files
generated by Kbuild, which record the full command used to build
each output file.

Currently, the tool only supports x86 and arm64 architectures.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>

Luis Augenstein (14):
  tools/sbom: integrate tool in make process
  tools/sbom: setup sbom logging
  tools/sbom: add command parsers
  tools/sbom: add cmd graph generation
  tools/sbom: add additional dependency sources for cmd graph
  tools/sbom: add SPDX classes
  tools/sbom: add JSON-LD serialization
  tools/sbom: add shared SPDX elements
  tools/sbom: collect file metadata
  tools/sbom: add SPDX output graph
  tools/sbom: add SPDX source graph
  tools/sbom: add SPDX build graph
  tools/sbom: add unit tests for command parsers
  tools/sbom: Add unit tests for SPDX-License-Identifier parsing

 .gitignore                                    |   1 +
 MAINTAINERS                                   |   6 +
 Makefile                                      |   8 +-
 lib/Kconfig.debug                             |   9 +
 tools/Makefile                                |   3 +-
 tools/sbom/Makefile                           |  39 +
 tools/sbom/README                             | 208 ++++++
 tools/sbom/sbom.py                            | 129 ++++
 tools/sbom/sbom/__init__.py                   |   0
 tools/sbom/sbom/cmd_graph/__init__.py         |   7 +
 tools/sbom/sbom/cmd_graph/cmd_file.py         | 149 ++++
 tools/sbom/sbom/cmd_graph/cmd_graph.py        |  46 ++
 tools/sbom/sbom/cmd_graph/cmd_graph_node.py   | 142 ++++
 tools/sbom/sbom/cmd_graph/deps_parser.py      |  52 ++
 .../sbom/cmd_graph/hardcoded_dependencies.py  |  83 +++
 tools/sbom/sbom/cmd_graph/incbin_parser.py    |  42 ++
 tools/sbom/sbom/cmd_graph/savedcmd_parser.py  | 664 ++++++++++++++++++
 tools/sbom/sbom/config.py                     | 335 +++++++++
 tools/sbom/sbom/environment.py                | 164 +++++
 tools/sbom/sbom/path_utils.py                 |  11 +
 tools/sbom/sbom/sbom_logging.py               |  88 +++
 tools/sbom/sbom/spdx/__init__.py              |   7 +
 tools/sbom/sbom/spdx/build.py                 |  17 +
 tools/sbom/sbom/spdx/core.py                  | 182 +++++
 tools/sbom/sbom/spdx/serialization.py         |  56 ++
 tools/sbom/sbom/spdx/simplelicensing.py       |  20 +
 tools/sbom/sbom/spdx/software.py              |  71 ++
 tools/sbom/sbom/spdx/spdxId.py                |  36 +
 tools/sbom/sbom/spdx_graph/__init__.py        |   7 +
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  82 +++
 tools/sbom/sbom/spdx_graph/kernel_file.py     | 310 ++++++++
 .../sbom/spdx_graph/shared_spdx_elements.py   |  32 +
 .../sbom/sbom/spdx_graph/spdx_build_graph.py  | 317 +++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  |  36 +
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 188 +++++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 126 ++++
 tools/sbom/tests/__init__.py                  |   0
 tools/sbom/tests/cmd_graph/__init__.py        |   0
 .../tests/cmd_graph/test_savedcmd_parser.py   | 383 ++++++++++
 tools/sbom/tests/spdx_graph/__init__.py       |   0
 .../sbom/tests/spdx_graph/test_kernel_file.py |  32 +
 41 files changed, 4086 insertions(+), 2 deletions(-)
 create mode 100644 tools/sbom/Makefile
 create mode 100644 tools/sbom/README
 create mode 100644 tools/sbom/sbom.py
 create mode 100644 tools/sbom/sbom/__init__.py
 create mode 100644 tools/sbom/sbom/cmd_graph/__init__.py
 create mode 100644 tools/sbom/sbom/cmd_graph/cmd_file.py
 create mode 100644 tools/sbom/sbom/cmd_graph/cmd_graph.py
 create mode 100644 tools/sbom/sbom/cmd_graph/cmd_graph_node.py
 create mode 100644 tools/sbom/sbom/cmd_graph/deps_parser.py
 create mode 100644 tools/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 tools/sbom/sbom/cmd_graph/incbin_parser.py
 create mode 100644 tools/sbom/sbom/cmd_graph/savedcmd_parser.py
 create mode 100644 tools/sbom/sbom/config.py
 create mode 100644 tools/sbom/sbom/environment.py
 create mode 100644 tools/sbom/sbom/path_utils.py
 create mode 100644 tools/sbom/sbom/sbom_logging.py
 create mode 100644 tools/sbom/sbom/spdx/__init__.py
 create mode 100644 tools/sbom/sbom/spdx/build.py
 create mode 100644 tools/sbom/sbom/spdx/core.py
 create mode 100644 tools/sbom/sbom/spdx/serialization.py
 create mode 100644 tools/sbom/sbom/spdx/simplelicensing.py
 create mode 100644 tools/sbom/sbom/spdx/software.py
 create mode 100644 tools/sbom/sbom/spdx/spdxId.py
 create mode 100644 tools/sbom/sbom/spdx_graph/__init__.py
 create mode 100644 tools/sbom/sbom/spdx_graph/build_spdx_graphs.py
 create mode 100644 tools/sbom/sbom/spdx_graph/kernel_file.py
 create mode 100644 tools/sbom/sbom/spdx_graph/shared_spdx_elements.py
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_build_graph.py
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_graph_model.py
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_output_graph.py
 create mode 100644 tools/sbom/sbom/spdx_graph/spdx_source_graph.py
 create mode 100644 tools/sbom/tests/__init__.py
 create mode 100644 tools/sbom/tests/cmd_graph/__init__.py
 create mode 100644 tools/sbom/tests/cmd_graph/test_savedcmd_parser.py
 create mode 100644 tools/sbom/tests/spdx_graph/__init__.py
 create mode 100644 tools/sbom/tests/spdx_graph/test_kernel_file.py

--=20
2.34.1

