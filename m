Return-Path: <linux-kbuild+bounces-11098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDa8HYSbi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11098-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C547211F2AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 21:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA07C3007F63
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123D33346A6;
	Tue, 10 Feb 2026 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="JBlKex/i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6A332ECC;
	Tue, 10 Feb 2026 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756912; cv=none; b=onqwMcWgwn74bGRgplqGMuD1HFUyd8t0OqDQfFj4zhbc+lCR4YFt/+cNBVmdsTuGQ3Yd9ctOcvr8smY2oin9IAKPYQrg16J2a+bwLx84/d/0JnKgie0M+eK5n7gBQHUs+AttoQzBwSn8h72ISUP0GhIdD2K0z02B+gWuLp9P1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756912; c=relaxed/simple;
	bh=QAT9DZf0dFr/FiOCeDWfY8YmIs4sDybTYbtyzNNt6ag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K7Wg3cCGFpaVkPezBLgOu0RPdW/vtMj8/V1tpzT983pJPIfOKyEEc6TstDvFz7L3ahIS2bC9FxnDlSRbNNmn5B8MNH00e+dnNz6H+NOQNuQmRs9B9PHsv/49/PmPy30mHwysZnfD24Ku6xrQ8odrTwYcS8mx3snGu+anC9nO2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=JBlKex/i; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 560393FAEF;
	Tue, 10 Feb 2026 21:55:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id EFFF51FA864;
	Tue, 10 Feb 2026 21:55:01 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id xi_mVSyP6Myn; Tue, 10 Feb 2026 21:55:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 4188A1FA8CD;
	Tue, 10 Feb 2026 21:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 4188A1FA8CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756901;
	bh=s9J3CbPo9Mf5sbC0li5Hzn0x2iTmlo/7CSoDa0RQa9M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JBlKex/iQmr6sWwRpXS0o4K3IUup00cVue6Z52Ry900lfnxvDJYALxB5B5udKRN/k
	 Jlo5URGZsIijhb/JLGWHHl7yoOkmCcSNjc1+k25QZHkuEE20CY6yfGfzqR3QAcKQw8
	 bKmaWTbwR95axuKWjMoArLN6u5iWVFQmizZXDjuzpWuxMJ7b+tVE1mD5R/owZeE5iL
	 oFk7c43RTebU55xRkzxkJsjdMDvVdy9M8oLXo84N8ZanbTVK+GAQAEctmxevlcO2o9
	 iXzWP0WUWxPlei3TjFUtBgk1g6ikwTehoNCR6eJ0riPZ0ZgvwDHJudIPZ23tGdC//z
	 bghrBw/xP1Jmg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id N9OmW1oipTwo; Tue, 10 Feb 2026 21:55:01 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id CBFD71FA864;
	Tue, 10 Feb 2026 21:55:00 +0100 (CET)
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
Subject: [PATCH v4 00/15] add SPDX SBOM generation script
Date: Tue, 10 Feb 2026 21:54:09 +0100
Message-Id: <20260210205424.11195-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
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
	TAGGED_FROM(0.00)[bounces-11098-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tngtech.com:mid,tngtech.com:dkim,tngtech.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C547211F2AA
X-Rspamd-Action: no action

This patch series introduces a Python-based script for generating SBOM
documents in the SPDX 3.0.1 format for kernel builds.

A Software Bill of Materials (SBOM) describes the individual components
of a software product. For the kernel, the goal is to describe the
distributable build outputs (typically the kernel image and modules),
the source files involved in producing these outputs, and the build
process that connects the source and output files.

To achieve this, the sbom script generates three SPDX documents:

- sbom-output.spdx.json
  Describes the final build outputs together with high-level
  build metadata.

- sbom-source.spdx.json
  Describes all source files involved in the build, including
  licensing information and additional file metadata.

- sbom-build.spdx.json
  Describes the entire build process, linking source files
  from the source SBOM to output files in the output SBOM.

The sbom script is optional. It can be invoked via the `make sbom` target=
.
This target depends on `all` and triggers a standard kernel build. Once a=
ll
output artifacts have been generated, starting from the kernel image and
modules as root nodes, the script reconstructs the dependency graph up
to the original source files. Build dependencies are primarily derived fr=
om
the `.cmd` files generated by Kbuild, which record the full command used
to build each output file.

Currently, the script only supports x86 and arm64 architectures.

This series was developed with assistance from AI tools, namely Cursor
with Claude Sonnet 4.5 and OpenCode with GLM-4.7. The AI was used for
documentation, exploring the repository, and iterating on design
questions and implementation details such as regex patterns.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
Changes in v4:
- move sbom script from tools/ to scripts/ and simplify Makefile
- use $(Q), $(PYTHON3) in scripts/sbom/Makefile
- replace README with Documentation/tools/sbom/sbom.rst
- add Assisted-by tags to document usage of AI tools
---
Luis Augenstein (15):
  scripts/sbom: add documentation
  scripts/sbom: integrate script in make process
  scripts/sbom: setup sbom logging
  scripts/sbom: add command parsers
  scripts/sbom: add cmd graph generation
  scripts/sbom: add additional dependency sources for cmd graph
  scripts/sbom: add SPDX classes
  scripts/sbom: add JSON-LD serialization
  scripts/sbom: add shared SPDX elements
  scripts/sbom: collect file metadata
  scripts/sbom: add SPDX output graph
  scripts/sbom: add SPDX source graph
  scripts/sbom: add SPDX build graph
  scripts/sbom: add unit tests for command parsers
  scripts/sbom: add unit tests for SPDX-License-Identifier parsing

 .gitignore                                    |   1 +
 Documentation/tools/index.rst                 |   1 +
 Documentation/tools/sbom/sbom.rst             | 206 ++++++
 MAINTAINERS                                   |   6 +
 Makefile                                      |  11 +-
 scripts/sbom/Makefile                         |  40 ++
 scripts/sbom/sbom.py                          | 129 ++++
 scripts/sbom/sbom/__init__.py                 |   0
 scripts/sbom/sbom/cmd_graph/__init__.py       |   7 +
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 149 ++++
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |  46 ++
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 142 ++++
 scripts/sbom/sbom/cmd_graph/deps_parser.py    |  52 ++
 .../sbom/cmd_graph/hardcoded_dependencies.py  |  83 +++
 scripts/sbom/sbom/cmd_graph/incbin_parser.py  |  42 ++
 .../sbom/sbom/cmd_graph/savedcmd_parser.py    | 664 ++++++++++++++++++
 scripts/sbom/sbom/config.py                   | 335 +++++++++
 scripts/sbom/sbom/environment.py              | 168 +++++
 scripts/sbom/sbom/path_utils.py               |  11 +
 scripts/sbom/sbom/sbom_logging.py             |  88 +++
 scripts/sbom/sbom/spdx/__init__.py            |   7 +
 scripts/sbom/sbom/spdx/build.py               |  17 +
 scripts/sbom/sbom/spdx/core.py                | 182 +++++
 scripts/sbom/sbom/spdx/serialization.py       |  56 ++
 scripts/sbom/sbom/spdx/simplelicensing.py     |  20 +
 scripts/sbom/sbom/spdx/software.py            |  71 ++
 scripts/sbom/sbom/spdx/spdxId.py              |  36 +
 scripts/sbom/sbom/spdx_graph/__init__.py      |   7 +
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  82 +++
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 310 ++++++++
 .../sbom/spdx_graph/shared_spdx_elements.py   |  32 +
 .../sbom/sbom/spdx_graph/spdx_build_graph.py  | 317 +++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  |  36 +
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 188 +++++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 126 ++++
 scripts/sbom/tests/__init__.py                |   0
 scripts/sbom/tests/cmd_graph/__init__.py      |   0
 .../tests/cmd_graph/test_savedcmd_parser.py   | 383 ++++++++++
 scripts/sbom/tests/spdx_graph/__init__.py     |   0
 .../sbom/tests/spdx_graph/test_kernel_file.py |  32 +
 40 files changed, 4081 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/tools/sbom/sbom.rst
 create mode 100644 scripts/sbom/Makefile
 create mode 100644 scripts/sbom/sbom.py
 create mode 100644 scripts/sbom/sbom/__init__.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_file.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/deps_parser.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/incbin_parser.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser.py
 create mode 100644 scripts/sbom/sbom/config.py
 create mode 100644 scripts/sbom/sbom/environment.py
 create mode 100644 scripts/sbom/sbom/path_utils.py
 create mode 100644 scripts/sbom/sbom/sbom_logging.py
 create mode 100644 scripts/sbom/sbom/spdx/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx/build.py
 create mode 100644 scripts/sbom/sbom/spdx/core.py
 create mode 100644 scripts/sbom/sbom/spdx/serialization.py
 create mode 100644 scripts/sbom/sbom/spdx/simplelicensing.py
 create mode 100644 scripts/sbom/sbom/spdx/software.py
 create mode 100644 scripts/sbom/sbom/spdx/spdxId.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/build_spdx_graphs.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/kernel_file.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/shared_spdx_elements.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_build_graph.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_graph_model.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_output_graph.py
 create mode 100644 scripts/sbom/sbom/spdx_graph/spdx_source_graph.py
 create mode 100644 scripts/sbom/tests/__init__.py
 create mode 100644 scripts/sbom/tests/cmd_graph/__init__.py
 create mode 100644 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py
 create mode 100644 scripts/sbom/tests/spdx_graph/__init__.py
 create mode 100644 scripts/sbom/tests/spdx_graph/test_kernel_file.py

--=20
2.34.1

