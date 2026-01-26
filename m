Return-Path: <linux-kbuild+bounces-10887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJsaIjXEd2nckgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10887-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:44:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C08CB77
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE6DF3006825
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD7C2868A9;
	Mon, 26 Jan 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="AZx0DEkH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE026C3B0;
	Mon, 26 Jan 2026 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456690; cv=none; b=k/oCZan3bZOaYTDljOQ2Mfd6GO1reOcOnWaPMCO5bZgOAIvMEd4IcWC1AHrXGgJlY6YHo1wo8/AtqGmmzuamz9QcOaSQLbkGf3ABjlP0UgDm47h/7Oyq0BZ7813izfzy3TiF6tH4Samb5PeKpDYMXCv1X7HLtb0Yc9U2E/cILwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456690; c=relaxed/simple;
	bh=jfshPB0npxntwMtm0kNp0LwkUiIA29PhOAASS4SsJzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gEGMvBj0oVP7rkayVod4f/VhOgIj78+pUvsazExTMAZsnwakxZ4CxkqoVVbfJz2/PccVYWYva9JokhIlknRuEn1b6Uwc7klShiwjPtUriiMHtrEICOup/qbyqhRyR2cGflqrIu2Gbkm5Jk0lP8fi541rxl4+CVKGA5YZi0nqKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=AZx0DEkH; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 02FA33FAE4;
	Mon, 26 Jan 2026 20:35:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 722531F8839;
	Mon, 26 Jan 2026 20:35:00 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id f_Ph9zKHO_FK; Mon, 26 Jan 2026 20:34:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 285ED1FA3D7;
	Mon, 26 Jan 2026 20:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 285ED1FA3D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1769456099;
	bh=klR+aQDNslY9CCiARddqXptyOhsLMjGUilJbVjEBqvs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AZx0DEkHHZG3bQs5XEH4i3JA1UpjcML7W/FVkWRXmWaUk8m+jkhhBLgiy7l9Lj2Hr
	 +NSUOgXvKVpEYaF3fGimjiM2ej2uf2hFfml6Knz/fPjrl20dJzN2XrMUm5jZGoQSNn
	 KLUe2X/7fJ7lSkSnk3C8Vaobm33gCPD7RPwMvlJyY/Gf7Uaj1OD/AajW5giBuXsE+9
	 sOYXeyU3ieyFUHhtMOm2hYRiz1dRPcSLLLmZ3cu6ziXHaeVAKwnFpzycZeO3jF8WsM
	 lHeqh1+onGXt1h0JymFu/X9FstbzhlOrAxbGrA0nfl/GOWPd53jrMjsP9S6F8F60kn
	 37fN4fbvL0W3Q==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lM86InXxINY6; Mon, 26 Jan 2026 20:34:59 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id BE18A1F8839;
	Mon, 26 Jan 2026 20:34:58 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v3 00/14] Add SPDX SBOM generation tool
Date: Mon, 26 Jan 2026 20:32:50 +0100
Message-Id: <20260126193304.320916-1-luis.augenstein@tngtech.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10887-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tngtech.com:email,tngtech.com:dkim,tngtech.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 300C08CB77
X-Rspamd-Action: no action

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

The `make sbom` target allows the SBOM tool to be run after all build
artifacts have been generated. Starting from the kernel image and
kernel modules as root nodes, the tool reconstructs the build
dependency graph up to the original source files. Build dependencies
are primarily derived from the `.cmd` files generated by Kbuild, which
record the full command used to build each output file.

Currently, the tool only supports x86 and arm64 architectures.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
Changes in v3:
- Suppress make message "Nothing to be done" if sbom does not need to be
  regenerated
- Remove CONFIG_SBOM. Instead, introduce dedicated `make sbom` target to
  invoke the tool
---
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
  tools/sbom: add unit tests for SPDX-License-Identifier parsing

 .gitignore                                    |   1 +
 MAINTAINERS                                   |   6 +
 Makefile                                      |  15 +-
 tools/Makefile                                |   3 +-
 tools/sbom/Makefile                           |  43 ++
 tools/sbom/README                             | 207 ++++++
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
 40 files changed, 4086 insertions(+), 3 deletions(-)
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

