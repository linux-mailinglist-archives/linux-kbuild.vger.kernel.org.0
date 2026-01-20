Return-Path: <linux-kbuild+bounces-10708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EpgMPjAcGmKZgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10708-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:05:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA556780
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C4A6641449
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A140F8CD;
	Tue, 20 Jan 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="CElyADqT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971D3DA7C5;
	Tue, 20 Jan 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910139; cv=none; b=Y9bu/evlK8Xgmc9C+my8LHfrACl4EtdD0ab1+Tck34d96sObK6wjf/UkNztmrM2wUHj30BQidvtKUp4PjVoau261RgU8qgTnS4srUWqB7ex3fkUprgZhJd86QKvoHx3NWol6S59sdhQF/4mys97tybmjl1Vm/Etjk3odihbYjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910139; c=relaxed/simple;
	bh=8Y1yWTrbA9GziqwTw0/q+Zq8DmVVYFVqBVc+fWciMLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fdN3QX3TcDkTdNUct1NDiWCqKvXIqvnWkz+JEp/bgeLIhpMwxGKUI28qsaF1GxlxP5zOeoTdfaotUPsZ8NzDEunfMwTP6TfwWn4AXO8js/fxg28w51Sns1L3xWrLwbPzXAHmawD9spz+/Z+f2CsLLkjek2MBOvWQIbvW0+msNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=CElyADqT; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id AADC9200B1;
	Tue, 20 Jan 2026 12:55:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A564D1F88AF;
	Tue, 20 Jan 2026 12:55:24 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1wEAfkPkgTnO; Tue, 20 Jan 2026 12:55:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id DE6D61FA63B;
	Tue, 20 Jan 2026 12:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz DE6D61FA63B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768910123;
	bh=Yt1OjE5PdmgZkZz3OCb7TaTPBTnZFXHkiICu7YkUOU8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CElyADqTKxq7YktwuGwf7wAluEaUwdBOvlw3d7vB732G3R/OgemClenG5arSnLBdB
	 WEI0Say2+IwcIgeBxiY2JPpnW+rVGe/wN7ALuVtwU6fwZq5IN5cs299VP8OncVCZ0C
	 57e31GRkdoYN7bsZa5B3JhaQ2/XlQuINQ1SPZX8JndM5V9pcdCfVe+ug6RHu5uKmKW
	 pA51kb7Lx5jUL+UnJ7hBHMMKgTbSc24bQEf/euOdThBVnHrlHgH7spmJKcnrdBqJaT
	 Km+WOFV3RXbTESblHkTCUNnJVlX/5r5kCyItb1cpoxxuc/MoK91fwQg/Cmyj5USA0F
	 Np6jz+MdTlVgA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id tDY2ehM5H9fL; Tue, 20 Jan 2026 12:55:23 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 820281F88AF;
	Tue, 20 Jan 2026 12:55:23 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v2 00/14] Add SPDX SBOM generation tool
Date: Tue, 20 Jan 2026 12:53:38 +0100
Message-Id: <20260120115352.10910-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.54 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[24];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10708-lists,linux-kbuild=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[tngtech.com,quarantine];
	DKIM_TRACE(0.00)[tngtech.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,tngtech.com:dkim,tngtech.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 62CA556780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
Changes in v2:
- regenerate sbom documents when build configuration changes
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
 lib/Kconfig.debug                             |   9 +
 tools/Makefile                                |   3 +-
 tools/sbom/Makefile                           |  42 ++
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
 41 files changed, 4096 insertions(+), 2 deletions(-)
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

