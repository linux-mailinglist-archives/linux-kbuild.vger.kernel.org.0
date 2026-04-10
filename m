Return-Path: <linux-kbuild+bounces-12760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHS/Fnhs2WmKpggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12760-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:32:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE93DCF41
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 23:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9DAC302C35D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 21:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996373DC4A7;
	Fri, 10 Apr 2026 21:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="Rft9X0bg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B453DA5C1;
	Fri, 10 Apr 2026 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856714; cv=none; b=r6Tk80CJlNcq4WsIn4eOIvJ2dhMBpDM4J46XXIlLd1CfiwOh2xPEzvu2Hjym01ZBMuNjGKZLn8XrVLvsW89hBhGxw42mC1o+ounOG3cSxZl+4G6cd1NACTOigx7fubhpv+TperBbxFMFyIK8MqAQcgCBNR7uSklHCIxdUvnbHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856714; c=relaxed/simple;
	bh=pcpUj/dVtoFg9v7+CIAbjyj70pgb22HEoscsnoIedlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KfF0gSSM5VmFGrCrD5nSxD4mQfvg56FkQ0+qrTShZaYUWds/f0hj5HlyrO1RUy7xzMUEBzydcKk5UA75DhMW8T4w2k2ZNDf5BLs69fO6yjkhZINlD8KVI/qE2zmaNMM8SSXTkSHSvqN8ogx6x0pFq4Cd2XePYIrvOhAkPA2S930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=Rft9X0bg; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id DCE963FAEA;
	Fri, 10 Apr 2026 23:23:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 8B1AD1FA89E;
	Fri, 10 Apr 2026 23:23:25 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 8QrivyP-hq-E; Fri, 10 Apr 2026 23:23:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 572611FAA6D;
	Fri, 10 Apr 2026 23:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 572611FAA6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1775856204;
	bh=0NPpsbq0uAq9nmEtGWYwnJwRQUPJwqY4MMxOtoLd6FI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Rft9X0bg/AsNBRfGnUK1S/a6Zt3q/uAp19KmfS3TbEKYi+CG0tKIMEEwwOhxMU6Gq
	 yZB16iovR2jR3u5Ha10b8us1wqEfGsUTAqdGOcD8ep13sQDoztI3a31HABf6GmvYKB
	 v27Z5ya3rsQ7HPMkiYcevFdjfCPIWwPl+4PwDUlBXaSwHvwHZVIQwGYhE4CRIsf+1e
	 bqB9rW+9ItlF+hvpNsZ/Af3dADUFCymZrChE2kKWL5MZ5gI7MNINCrfmVT7nnb2clU
	 t30lBADRIWHIZl8F1aeU/GgFtpVG22aVwtk1Lk91nxj2SdCdJlm8rX3HVmmYXQPm7e
	 EJHIeywfANjJQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kjKIhtCatTEe; Fri, 10 Apr 2026 23:23:24 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id DA62F1FA89E;
	Fri, 10 Apr 2026 23:23:23 +0200 (CEST)
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
Subject: [PATCH v5 00/15] add SPDX SBOM generation script
Date: Fri, 10 Apr 2026 23:22:40 +0200
Message-ID: <20260410212255.9883-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12760-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tngtech.com:dkim,tngtech.com:email,tngtech.com:mid,savedcmd_parser.py:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C3EE93DCF41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v5:
- simplify make integration. No dedicated Makefile. Only top level.
- support dynamic command parser templates based on environment variable =
overwrites:=20
  CC, LD, AR, NM, OBJCOPY, STRIP.
- add --write-output-on-error cli argument when invoked from the Makefile=
 which
  allows to generate spdx documents despite errors.
  This was for example a problem in https://birdcloud.org/bc/Linux_Kernel=
_Missing_SPDX_ID_lines_from_build_SBOMs
  The script still exits with a non-zero exit code.
- split savedcmd_parser.py file into multiple files for better readabilit=
y.
- add command parser for gen-hyprel command.
- remove the created cli argument for CreationInfo object which does not =
need to be a configurable.=20
  Instead, the latest modified timestamp of the provided root artifacts i=
s used.
- remove the originatedBy property from Package elements which was set to=
 the agent who created the SBOM.
  This was a wrong usage of the property.
- remove some spdx properties that were not used in the current version, =
namely SoftwareArtifact.additionalPurpose,
  Package.downloadLocation, Artifact.builtTime, and Agent.externalIdentif=
ier
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
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 149 ++++++
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |  46 ++
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 142 ++++++
 scripts/sbom/sbom/cmd_graph/deps_parser.py    |  52 ++
 .../sbom/cmd_graph/hardcoded_dependencies.py  |  83 +++
 scripts/sbom/sbom/cmd_graph/incbin_parser.py  |  42 ++
 .../cmd_graph/savedcmd_parser/__init__.py     |   6 +
 .../command_parser_registry.py                | 474 ++++++++++++++++++
 .../savedcmd_parser/command_splitter.py       | 124 +++++
 .../savedcmd_parser/savedcmd_parser.py        |  68 +++
 .../cmd_graph/savedcmd_parser/tokenizer.py    |  94 ++++
 scripts/sbom/sbom/config.py                   | 318 ++++++++++++
 scripts/sbom/sbom/environment.py              | 192 +++++++
 scripts/sbom/sbom/path_utils.py               |  11 +
 scripts/sbom/sbom/sbom_logging.py             |  88 ++++
 scripts/sbom/sbom/spdx/__init__.py            |   7 +
 scripts/sbom/sbom/spdx/build.py               |  17 +
 scripts/sbom/sbom/spdx/core.py                | 170 +++++++
 scripts/sbom/sbom/spdx/serialization.py       |  56 +++
 scripts/sbom/sbom/spdx/simplelicensing.py     |  20 +
 scripts/sbom/sbom/spdx/software.py            |  69 +++
 scripts/sbom/sbom/spdx/spdxId.py              |  36 ++
 scripts/sbom/sbom/spdx_graph/__init__.py      |   7 +
 .../sbom/sbom/spdx_graph/build_spdx_graphs.py |  82 +++
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 310 ++++++++++++
 .../sbom/spdx_graph/shared_spdx_elements.py   |  32 ++
 .../sbom/sbom/spdx_graph/spdx_build_graph.py  | 317 ++++++++++++
 .../sbom/sbom/spdx_graph/spdx_graph_model.py  |  36 ++
 .../sbom/sbom/spdx_graph/spdx_output_graph.py | 187 +++++++
 .../sbom/sbom/spdx_graph/spdx_source_graph.py | 126 +++++
 scripts/sbom/tests/__init__.py                |   0
 scripts/sbom/tests/cmd_graph/__init__.py      |   0
 .../tests/cmd_graph/test_savedcmd_parser.py   | 412 +++++++++++++++
 scripts/sbom/tests/spdx_graph/__init__.py     |   0
 .../sbom/tests/spdx_graph/test_kernel_file.py |  32 ++
 43 files changed, 4181 insertions(+), 2 deletions(-)
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


