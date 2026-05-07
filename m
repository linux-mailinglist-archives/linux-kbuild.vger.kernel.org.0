Return-Path: <linux-kbuild+bounces-13064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHz3JDjO/GlhTwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13064-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:39:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F334ECF5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 19:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8959E300C0C4
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 17:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E02401A0E;
	Thu,  7 May 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="aXyIOMjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177216F27F;
	Thu,  7 May 2026 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175542; cv=none; b=cTPaU5tQTZriNd03Bi9IvzE6hlhFkSoP8MO9Js6F8TZjJ1PtJ1aRE43RDCwgc6YqipW2Je0CyPIBK87SxtPpd7XGrwBQ75pWnHU4LuS3z+b3+nAx1qiQiI9RD+07R7aKIihL7odK8b81H0PBCVfuG+spsDF+BwOXMYfnPZTvS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175542; c=relaxed/simple;
	bh=OahAwIRUPBHwCFveoUdEBnnxQxtcKeHuVao1BcljE3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ggu6ApCIBZfaCnomdkvzM7uGFtk9XzIeA7oTvaLt0j6zHLVCm8kkhJ4fanH8tFdxULVpxfQ+WZx/oyWIKk8izDg+WYo2fOWDpOtplHwYCS8Y6Cf5Lj0L8wP3vgeBIjmol5fo8IofcC0VUcs2R2otMoju8wj7uMfkDE/kQ56nq38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=aXyIOMjL; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 13C6C200B5;
	Thu,  7 May 2026 19:38:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C31681FB106;
	Thu,  7 May 2026 19:38:51 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nw_DZbIw-nON; Thu,  7 May 2026 19:38:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C73361FB1AB;
	Thu,  7 May 2026 19:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz C73361FB1AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1778175527;
	bh=W1XiUWdRUVPS387UzVdwy4CCWmUH2xSu2eBRs+gAxGY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aXyIOMjL0ynz7PxDOnPan+MYYXBjt62EB9qLGCnN0lWES4yUeVSsgTaHz1Q4oRNjH
	 8UMi7JLVtYb4ZbySA0mm/DUz0Sly2vPZF5AeDnUuBimWyruFkNiBDGg2Hkuav2FfXz
	 9F6SFtOoepSqy8LvEY1lWg+ig4seegoDb5eoaMqnndvnw6rTKndFuXtsanyAnF3XtL
	 rjPlii9gUAWaAK9OHdWgJJm+bEKzI7RsyuFAvLThnCmw1DFjIfgwdLTMu++wlmMCiE
	 6ugDyLYwGIhayBSPoBrhJnOliVNhXToKxmfrDvA8h1/m4KFPquAOhCF9cStDrxgTOV
	 kMXKqqpFlZlDg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 50P9FF6lTlGz; Thu,  7 May 2026 19:38:47 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 561581FB106;
	Thu,  7 May 2026 19:38:47 +0200 (CEST)
From: Luis <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis <luis.augenstein@tngtech.com>
Subject: [PATCH v6 00/15] add SPDX SBOM generation script
Date: Thu,  7 May 2026 19:38:12 +0200
Message-ID: <20260507173827.70949-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 35F334ECF5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13064-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:mid,tngtech.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
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

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
Changes in v6:
- parsers: add support for cp and vdsomunge commands
- sashiko:
  - bugfix: resolve symlinked relative paths correctly to avoid duplicate=
 SBOM entries
  - bugfix: use timezone-aware UTC timestamps for SBOM creation metadata
  - bugfix: classify external files outside source and object trees corre=
ctly
  - robustness: several minor improvements to make the script more robust=
 against=20
    unexpected inputs, uncommon build setups, and invalid assumptions
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
 Documentation/tools/sbom/sbom.rst             | 206 ++++++++
 MAINTAINERS                                   |   6 +
 Makefile                                      |  28 +-
 scripts/sbom/sbom.py                          | 129 +++++
 scripts/sbom/sbom/__init__.py                 |   0
 scripts/sbom/sbom/cmd_graph/__init__.py       |   7 +
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 162 ++++++
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |  46 ++
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 142 +++++
 scripts/sbom/sbom/cmd_graph/deps_parser.py    |  52 ++
 .../sbom/cmd_graph/hardcoded_dependencies.py  |  87 ++++
 scripts/sbom/sbom/cmd_graph/incbin_parser.py  |  42 ++
 .../cmd_graph/savedcmd_parser/__init__.py     |   6 +
 .../command_parser_registry.py                | 491 ++++++++++++++++++
 .../savedcmd_parser/command_splitter.py       | 124 +++++
 .../savedcmd_parser/savedcmd_parser.py        |  67 +++
 .../cmd_graph/savedcmd_parser/tokenizer.py    |  92 ++++
 scripts/sbom/sbom/config.py                   | 321 ++++++++++++
 scripts/sbom/sbom/environment.py              | 192 +++++++
 scripts/sbom/sbom/path_utils.py               |  22 +
 scripts/sbom/sbom/sbom_logging.py             |  90 ++++
 scripts/sbom/sbom/spdx/__init__.py            |   7 +
 scripts/sbom/sbom/spdx/build.py               |  17 +
 scripts/sbom/sbom/spdx/core.py                | 170 ++++++
 scripts/sbom/sbom/spdx/serialization.py       |  62 +++
 scripts/sbom/sbom/spdx/simplelicensing.py     |  20 +
 scripts/sbom/sbom/spdx/software.py            |  69 +++
 scripts/sbom/sbom/spdx/spdxId.py              |  36 ++
 scripts/sbom/sbom/spdx_graph/__init__.py      |   7 +
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  83 +++
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 314 +++++++++++
 .../sbom/spdx_graph/shared_spdx_elements.py   |  32 ++
 .../sbom/sbom/spdx_graph/spdx_build_graph.py  | 319 ++++++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  |  36 ++
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 187 +++++++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 130 +++++
 scripts/sbom/tests/__init__.py                |   0
 scripts/sbom/tests/cmd_graph/__init__.py      |   0
 .../tests/cmd_graph/test_savedcmd_parser.py   | 425 +++++++++++++++
 scripts/sbom/tests/spdx_graph/__init__.py     |   0
 .../sbom/tests/spdx_graph/test_kernel_file.py |  33 ++
 43 files changed, 4259 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/tools/sbom/sbom.rst
 create mode 100644 scripts/sbom/sbom.py
 create mode 100644 scripts/sbom/sbom/__init__.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/__init__.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_file.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/deps_parser.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/incbin_parser.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.=
py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_p=
arser_registry.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_s=
plitter.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_=
parser.py
 create mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer=
.py
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
2.43.0


