Return-Path: <linux-kbuild+bounces-13235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMsrMgGwCmog5wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13235-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37E5669D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 08:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A953D3002D3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 06:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801483DEFF8;
	Mon, 18 May 2026 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="W42LhRxE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C23DE420;
	Mon, 18 May 2026 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085292; cv=none; b=NnRCSlzOdm86K0JyhRLJ9ZMKy/wdyWYtBE9Sdato908kmPwJrV/J62Sw0z7JUVOSemX6wN+4GSEjzV+ua3KAolQJiC+q1fE6V1ORzvT6BZrJPYFzK7krJYkoBJfwwESdt4weuUa+aHbbLg3opMTEb/dkY14yTWuupVExa3TndmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085292; c=relaxed/simple;
	bh=0HhtpX6wXVGv7ju6BRjOJQwpkKFdBDtQixJWlUzoVEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biXgNLtMn9ybgeT20rjoGOBWfPsYjckVl9Fhzl3afqeHZLAcbxeY8cpo92cqsT4CfmHOiRC0VAttyMHBNgETA1Vx4ml/dz80NJ6eddad1FFxVfV8Hby2wsmh/OPiSiQREsQhICsuByMVuKV16YVuzyefl9lpIE441GVFNVYFweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=W42LhRxE; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 23753200BE;
	Mon, 18 May 2026 08:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id E75531FAD21;
	Mon, 18 May 2026 08:21:15 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2vNXyV3zB_3E; Mon, 18 May 2026 08:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id BD16F1FAD23;
	Mon, 18 May 2026 08:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz BD16F1FAD23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1779085273;
	bh=Je4grYFP3lZK0hYLXd3y/+5zGMGIrn3hUN7UBzkJs0A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=W42LhRxEux2EwVIcztomnOH74P8N1wpHV7AGgE1MTsWeQwMUDwfTxE6aiqBCbqBk7
	 OjBzfT4dJ2KoBxRSOgypN7eO3fGKQPfnZdOiZ3PY2F8PVWZQ1TrOqgs1UFJf3W9WPo
	 fhlTarKN69HmiNj4Oic2cmOS70ZHXzQEW2vB2mO0k2I9WmjsS/l/AA2drTY/jE8RON
	 VPe8ucEpcnC8B+JtPE3l6xdwXQg4cwi4HlOJMQxJU5CTPyKalpIcrjVkPE4ZsUX7eN
	 sE1RWY89Tn9+9rlgM5A/jzjNC6dYSOga28z6P3fB6807Ryeqm2YRp0xCzzxOZ/Lz4k
	 hL5imuLpd0yYA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Wp6zazqLJATq; Mon, 18 May 2026 08:21:13 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-239-167.092.209.pools.vodafone-ip.de [92.209.239.167])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 5B7BA1FAD21;
	Mon, 18 May 2026 08:21:13 +0200 (CEST)
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
Subject: [PATCH v7 04/15] scripts/sbom: add command parsers
Date: Mon, 18 May 2026 08:20:51 +0200
Message-ID: <20260518062102.2051814-5-luis.augenstein@tngtech.com>
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
X-Rspamd-Queue-Id: 6B37E5669D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13235-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

From: Luis Augenstein <luis.augenstein@tngtech.com>

Implement savedcmd_parser module for extracting input files
from kernel build commands.

Assisted-by: Cursor:claude-sonnet-4-5
Assisted-by: OpenCode:GLM-4-7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 .../cmd_graph/savedcmd_parser/__init__.py     |   6 +
 .../command_parser_registry.py                | 516 ++++++++++++++++++
 .../savedcmd_parser/command_splitter.py       | 128 +++++
 .../savedcmd_parser/savedcmd_parser.py        |  67 +++
 .../cmd_graph/savedcmd_parser/tokenizer.py    |  92 ++++
 scripts/sbom/sbom/environment.py              | 192 +++++++
 6 files changed, 1001 insertions(+)
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
 create mode 100644 scripts/sbom/sbom/environment.py

diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py b/sc=
ripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py
new file mode 100644
index 00000000000..d13876af4df
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from sbom.cmd_graph.savedcmd_parser.savedcmd_parser import parse_inputs_=
from_commands
+
+__all__ =3D ["parse_inputs_from_commands"]
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_r=
egistry.py b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_r=
egistry.py
new file mode 100644
index 00000000000..a48040b2c13
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_registry=
.py
@@ -0,0 +1,516 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+import shlex
+from typing import Callable, Iterator
+
+import sbom.sbom_logging as sbom_logging
+from sbom.environment import Environment
+from sbom.cmd_graph.savedcmd_parser.command_splitter import IfBlock, spl=
it_commands
+from sbom.cmd_graph.savedcmd_parser.tokenizer import (
+    CmdParsingError,
+    Option,
+    Positional,
+    tokenize_single_command,
+    tokenize_single_command_positionals_only,
+)
+from sbom.path_utils import PathStr
+
+CommandParser =3D Callable[[str], list[PathStr]]
+CommandParserRegistryEntry =3D tuple[re.Pattern[str], CommandParser]
+
+
+def _parse_dd_command(command: str) -> list[PathStr]:
+    match =3D re.match(r"dd.*?if=3D(\S+)", command)
+    if match:
+        return [match.group(1)]
+    return []
+
+
+def _parse_cat_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["cat", input1, input2, ...]
+    return [p for p in positionals[1:]]
+
+
+def _parse_compound_command(command: str) -> list[PathStr]:
+    compound_command_parsers: list[CommandParserRegistryEntry] =3D [
+        (re.compile(r"dd\b"), _parse_dd_command),
+        (re.compile(r"cat.*?\|"), lambda c: _parse_cat_command(c.split("=
|")[0])),
+        (re.compile(r"cat\b[^|>]*$"), _parse_cat_command),
+        (re.compile(r"echo\b"), _parse_noop),
+        (re.compile(r"\S+=3D"), _parse_noop),
+        (re.compile(r"printf\b"), _parse_noop),
+        (re.compile(r"sed\b"), _parse_sed_command),
+        (
+            re.compile(r"(.*/)scripts/bin2c\s*<"),
+            lambda c: [input] if (input :=3D c.split("<")[1].split(">")[=
0].strip()) !=3D "/dev/null" else [],
+        ),
+        (re.compile(r"^:$"), _parse_noop),
+    ]
+
+    match =3D re.match(r"\s*[\(\{](.*)[\)\}]\s*>", command, re.DOTALL)
+    if match is None:
+        raise CmdParsingError("No inner commands found for compound comm=
and")
+    input_files: list[PathStr] =3D []
+    inner_commands =3D split_commands(match.group(1))
+    for inner_command in inner_commands:
+        if isinstance(inner_command, IfBlock):
+            sbom_logging.error(
+                "Skip parsing inner command {inner_command} of compound =
command because IfBlock is not supported",
+                inner_command=3Dinner_command,
+            )
+            continue
+
+        parser =3D next((parser for pattern, parser in compound_command_=
parsers if pattern.match(inner_command)), None)
+        if parser is None:
+            sbom_logging.error(
+                "Skip parsing inner command {inner_command} of compound =
command because no matching parser was found",
+                inner_command=3Dinner_command,
+            )
+            continue
+        try:
+            input_files +=3D parser(inner_command)
+        except (CmdParsingError, IndexError) as e:
+            sbom_logging.error(
+                "Skip parsing inner command {inner_command} of compound =
command because of command parsing error: {error_message}",
+                inner_command=3Dinner_command,
+                error_message=3Dstr(e),
+            )
+    return input_files
+
+
+def _parse_objcopy_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command, flag_options=3D["=
-S", "-w"])
+    positionals =3D [part.value for part in command_parts if isinstance(=
part, Positional)]
+    # expect positionals to be ['objcopy', input_file] or ['objcopy', in=
put_file, output_file]
+    return [positionals[1]]
+
+
+def _parse_link_vmlinux_command(command: str) -> list[PathStr]:
+    """
+    For simplicity we do not parse the `scripts/link-vmlinux.sh` script.
+    Instead the `vmlinux.a` dependency is just hardcoded for now.
+    """
+    return ["vmlinux.a"]
+
+
+def _parse_cp_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["cp", input1, ..., destination]
+    return positionals[1:-1]
+
+
+def _parse_noop(command: str) -> list[PathStr]:
+    """
+    No-op parser for commands with no input files (e.g., 'rm', 'true').
+    Returns an empty list.
+    """
+    return []
+
+
+def _parse_ar_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ['ar', flags, output, input1, input2, ...=
]
+    flags =3D positionals[1]
+    if "r" not in flags:
+        # 'r' option indicates that new files are added to the archive.
+        # If this option is missing we won't find any relevant input fil=
es.
+        return []
+    return positionals[3:]
+
+
+def _parse_ar_piped_xargs_command(command: str) -> list[PathStr]:
+    printf_command, _ =3D command.split("|", 1)
+    positionals =3D tokenize_single_command_positionals_only(printf_comm=
and.strip())
+    # expect positionals to be ['printf', '{prefix_path}%s ', input1, in=
put2, ...]
+    prefix_path =3D positionals[1].removesuffix("%s ")
+    return [f"{prefix_path}{filename}" for filename in positionals[2:]]
+
+
+def _parse_gcc_or_clang_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # compile mode: expect last positional argument ending in a source f=
ile extension to be the input file
+    for part in reversed(parts):
+        if not part.startswith("-") and any(part.endswith(suffix) for su=
ffix in [".c", ".S", ".dts"]):
+            return [part]
+
+    # linking mode: expect all .o files to be the inputs
+    return [p for p in parts if p.endswith(".o")]
+
+
+def _parse_rustc_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # expect last positional argument ending in `.rs` to be the input fi=
le
+    for part in reversed(parts):
+        if not part.startswith("-") and part.endswith(".rs"):
+            return [part]
+    raise CmdParsingError("Could not find .rs input source file")
+
+
+def _parse_rustdoc_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # expect last positional argument ending in `.rs` to be the input fi=
le
+    for part in reversed(parts):
+        if not part.startswith("-") and part.endswith(".rs"):
+            return [part]
+    raise CmdParsingError("Could not find .rs input source file")
+
+
+def _parse_syscallhdr_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command.strip(), flag_opti=
ons=3D["--emit-nr"])
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/syscallhdr.sh, input, outp=
ut]
+    return [positionals[2]]
+
+
+def _parse_syscalltbl_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command.strip())
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/syscalltbl.sh, input, outp=
ut]
+    return [positionals[2]]
+
+
+def _parse_mkcapflags_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/mkcapflags.sh, output, inp=
ut1, input2]
+    return [positionals[3], positionals[4]]
+
+
+def _parse_orc_hash_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/orc_hash.sh, '<', input, '=
>', output]
+    return [positionals[3]]
+
+
+def _parse_xen_hypercalls_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/xen-hypercalls.sh, output,=
 input1, input2, ...]
+    return positionals[3:]
+
+
+def _parse_gen_initramfs_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/gen_initramfs.sh, input1, =
input2, ...]
+    return positionals[2:]
+
+
+def _parse_vdso2c_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ['vdso2c', raw_input, stripped_input, out=
put]
+    return [positionals[1], positionals[2]]
+
+
+def _parse_vdsomunge_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ['vdsomunge', input, output]
+    return [positionals[1]]
+
+
+def _parse_ld_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(
+        command=3Dcommand.strip(),
+        flag_options=3D[
+            "-shared",
+            "--no-undefined",
+            "--eh-frame-hdr",
+            "-Bsymbolic",
+            "-r",
+            "--no-ld-generated-unwind-info",
+            "--no-dynamic-linker",
+            "-pie",
+            "--no-dynamic-linker--whole-archive",
+            "--whole-archive",
+            "--no-whole-archive",
+            "--start-group",
+            "--end-group",
+        ],
+    )
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["ld", input1, input2, ...]
+    return positionals[1:]
+
+
+def _parse_sed_command(command: str) -> list[PathStr]:
+    command_parts =3D shlex.split(command)
+    # expect command parts to be ["sed", *, input]
+    input =3D command_parts[-1]
+    if input =3D=3D "/dev/null":
+        return []
+    return [input]
+
+
+def _parse_awk(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command)
+    options =3D [p for p in command_parts if isinstance(p, Option)]
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    has_script_file =3D any(p.name =3D=3D "-f" for p in options)
+    # With -f option: expect ["awk", input1, input2, ...]
+    # Without -f option: expect ["awk", inline_program, input1, input2, =
...]
+    return positionals[1:] if has_script_file else positionals[2:]
+
+
+def _parse_nm_piped_command(command: str) -> list[PathStr]:
+    nm_command, _ =3D command.split("|", 1)
+    command_parts =3D tokenize_single_command(
+        command=3Dnm_command.strip(),
+        flag_options=3D["-p", "--defined-only"],
+    )
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["nm", input1, input2, ...]
+    return [p for p in positionals[1:]]
+
+
+def _parse_pnm_to_logo_command(command: str) -> list[PathStr]:
+    command_parts =3D shlex.split(command)
+    # expect command parts to be ["pnmtologo", <options>, input]
+    return [command_parts[-1]]
+
+
+def _parse_relacheck(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["relacheck", input, log_reference]
+    return [positionals[1]]
+
+
+def _parse_gen_hyprel_command(command: str) -> list[PathStr]:
+    gen_hyprel_command, _ =3D command.split(">", 1)
+    command_parts =3D shlex.split(gen_hyprel_command)
+    # expect command_parts to be ["gen-hyprel", input]
+    return [command_parts[1]]
+
+
+def _parse_perl_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command.str=
ip())
+    # expect positionals to be ["perl", input]
+    return [positionals[1]]
+
+
+def _parse_strip_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command, flag_options=3D["=
--strip-debug"])
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["strip", input1, input2, ...]
+    return positionals[1:]
+
+
+def _parse_mkpiggy_command(command: str) -> list[PathStr]:
+    mkpiggy_command, _ =3D command.split(">", 1)
+    positionals =3D tokenize_single_command_positionals_only(mkpiggy_com=
mand)
+    # expect positionals to be ["mkpiggy", input]
+    return [positionals[1]]
+
+
+def _parse_relocs_command(command: str) -> list[PathStr]:
+    if ">" not in command:
+        # Only consider relocs commands that redirect output to a file.
+        # If there's no redirection, we assume it produces no output fil=
e and therefore has no input we care about.
+        return []
+    relocs_command, _ =3D command.split(">", 1)
+    command_parts =3D shlex.split(relocs_command)
+    # expect command_parts to be ["relocs", options, input]
+    return [command_parts[-1]]
+
+
+def _parse_mk_elfconfig_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["mk_elfconfig", "<", input, ">", output]
+    return [positionals[2]]
+
+
+def _parse_flex_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # expect last positional argument ending in `.l` to be the input fil=
e
+    for part in reversed(parts):
+        if not part.startswith("-") and part.endswith(".l"):
+            return [part]
+    raise CmdParsingError("Could not find .l input source file in comman=
d")
+
+
+def _parse_bison_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # expect last positional argument ending in `.y` to be the input fil=
e
+    for part in reversed(parts):
+        if not part.startswith("-") and part.endswith(".y"):
+            return [part]
+    raise CmdParsingError("Could not find input .y input source file in =
command")
+
+
+def _parse_tools_build_command(command: str) -> list[PathStr]:
+    positionals =3D tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["tools/build", "input1", "input2", "inpu=
t3", "output"]
+    return positionals[1:-1]
+
+
+def _parse_extract_cert_command(command: str) -> list[PathStr]:
+    command_parts =3D shlex.split(command)
+    # expect command parts to be [path/to/extract-cert, input, output]
+    input =3D command_parts[1]
+    if not input:
+        return []
+    return [input]
+
+
+def _parse_dtc_command(command: str) -> list[PathStr]:
+    wno_flags =3D [command_part for command_part in shlex.split(command)=
 if command_part.startswith("-Wno-")]
+    command_parts =3D tokenize_single_command(command, flag_options=3Dwn=
o_flags)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be [path/to/dtc, input]
+    return [positionals[1]]
+
+
+def _parse_bindgen_command(command: str) -> list[PathStr]:
+    command_parts =3D shlex.split(command)
+    header_file_input_paths =3D [part for part in command_parts if part.=
endswith(".h")]
+    return header_file_input_paths
+
+
+def _parse_gen_header(command: str) -> list[PathStr]:
+    command_parts =3D shlex.split(command)
+    # expect command parts to be ["python3", path/to/gen_headers.py, ...=
, "--xml", input]
+    i =3D next((i for i, token in enumerate(command_parts) if token =3D=3D=
 "--xml"), None)
+    if i is None:
+        raise CmdParsingError(f"Expected --xml input file in gen_headers=
 command but got {command}")
+    return [command_parts[i + 1]]
+
+def _parse_mkuboot_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command)
+    # mkuboot.sh passes all args to mkimage; -d specifies the data/input=
 image file
+    for part in command_parts:
+        if isinstance(part, Option) and part.name =3D=3D "-d" and part.v=
alue is not None:
+            return [part.value]
+    raise CmdParsingError("Could not find -d (data file) option in mkubo=
ot.sh command")
+
+
+def _parse_syscallnr_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command.strip())
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/syscallnr.sh, input, outpu=
t]
+    return [positionals[2]]
+
+
+def _parse_gen_kernel_hwcaps_command(command: str) -> list[PathStr]:
+    command_parts =3D tokenize_single_command(command.strip(), flag_opti=
ons=3D["-e"])
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/gen-kernel-hwcaps.sh, inpu=
t]
+    return [positionals[2]]
+
+
+class CommandParserRegistry:
+    """
+    Registry mapping command patterns to their input-file parsers.
+    """
+
+    def __init__(self, entries: list[CommandParserRegistryEntry]) -> Non=
e:
+        self._entries =3D entries
+
+    def __iter__(self) -> Iterator[CommandParserRegistryEntry]:
+        return iter(self._entries)
+
+    @staticmethod
+    def create() -> "CommandParserRegistry":
+        def env_or_default_pattern(env_value: str | None, default_patter=
n: str) -> str:
+            if env_value is None or not env_value.strip():
+                return default_pattern
+            return rf"(?:{re.escape(env_value.strip())}|{default_pattern=
})"
+
+        cc_pattern =3D env_or_default_pattern(Environment.CC(), r"([^\s]=
+-)?(gcc|clang)")
+        ld_pattern =3D env_or_default_pattern(Environment.LD(), r"([^\s]=
+-)?ld")
+        ar_pattern =3D env_or_default_pattern(Environment.AR(), r"([^\s]=
+-)?ar")
+        nm_pattern =3D env_or_default_pattern(Environment.NM(), r"([^\s]=
+-)?nm")
+        objcopy_pattern =3D env_or_default_pattern(Environment.OBJCOPY()=
, r"([^\s]+-)?objcopy")
+        strip_pattern =3D env_or_default_pattern(Environment.STRIP(), r"=
([^\s]+-)?strip")
+
+        entries: list[CommandParserRegistryEntry] =3D [
+            # Compound commands
+            (re.compile(r"\(.*?\)\s*>", re.DOTALL), _parse_compound_comm=
and),
+            (re.compile(r"\{.*?\}\s*>", re.DOTALL), _parse_compound_comm=
and),
+            # Standard Unix utilities and system tools
+            (re.compile(r"^rm\b"), _parse_noop),
+            (re.compile(r"^mkdir\b"), _parse_noop),
+            (re.compile(r"^touch\b"), _parse_noop),
+            (re.compile(r"^cp\b"), _parse_cp_command),
+            (re.compile(r"^truncate\b"), _parse_noop),
+            (re.compile(r"^cat\b.*?[\|>]"), lambda c: _parse_cat_command=
(c.split("|")[0].split(">")[0])),
+            (re.compile(r"^echo[^|]*$"), _parse_noop),
+            (re.compile(r"^sed.*?>"), lambda c: _parse_sed_command(c.spl=
it(">")[0])),
+            (re.compile(r"^sed\b"), _parse_noop),
+            (re.compile(r"^awk.*?<.*?>"), lambda c: [c.split("<")[1].spl=
it(">")[0]]),
+            (re.compile(r"^awk.*?>"), lambda c: _parse_awk(c.split(">")[=
0])),
+            (re.compile(r"^(/bin/)?true\b"), _parse_noop),
+            (re.compile(r"^(/bin/)?false\b"), _parse_noop),
+            (re.compile(r"^openssl\s+req.*?-new.*?-keyout"), _parse_noop=
),
+            # Compilers and code generators
+            # (C/LLVM toolchain, Rust, Flex/Bison, Bindgen, Perl, etc.)
+            (
+                re.compile(rf"^{cc_pattern}\b"),
+                lambda command: _parse_gcc_or_clang_command(re.sub(rf"^{=
cc_pattern}\b", "gcc", command, count=3D1)),
+            ),
+            (
+                re.compile(rf"^{ld_pattern}\b"),
+                lambda command: _parse_ld_command(re.sub(rf"^{ld_pattern=
}\b", "ld", command, count=3D1)),
+            ),
+            (
+                re.compile(rf"^printf\b.*\| xargs {ar_pattern}\b"),
+                lambda command: _parse_ar_piped_xargs_command(
+                    re.sub(rf"xargs {ar_pattern}\b", "xargs ar", command=
, count=3D1)
+                ),
+            ),
+            (
+                re.compile(rf"^{ar_pattern}\b"),
+                lambda command: _parse_ar_command(re.sub(rf"^{ar_pattern=
}\b", "ar", command, count=3D1)),
+            ),
+            (
+                re.compile(rf"^{nm_pattern}\b.*?\|"),
+                lambda command: _parse_nm_piped_command(re.sub(rf"^{nm_p=
attern}\b", "nm", command, count=3D1)),
+            ),
+            (
+                re.compile(rf"^{objcopy_pattern}\b"),
+                lambda command: _parse_objcopy_command(re.sub(rf"^{objco=
py_pattern}\b", "objcopy", command, count=3D1)),
+            ),
+            (
+                re.compile(rf"^{strip_pattern}\b"),
+                lambda command: _parse_strip_command(re.sub(rf"^{strip_p=
attern}\b", "strip", command, count=3D1)),
+            ),
+            (re.compile(r".*?rustc\b"), _parse_rustc_command),
+            (re.compile(r".*?rustdoc\b"), _parse_rustdoc_command),
+            (re.compile(r"^flex\b"), _parse_flex_command),
+            (re.compile(r"^bison\b"), _parse_bison_command),
+            (re.compile(r"^bindgen\b"), _parse_bindgen_command),
+            (re.compile(r"^perl\b"), _parse_perl_command),
+            # Kernel-specific build scripts and tools
+            (re.compile(r"^(.*/)?link-vmlinux\.sh\b"), _parse_link_vmlin=
ux_command),
+            (re.compile(r"sh (.*/)?syscallhdr\.sh\b"), _parse_syscallhdr=
_command),
+            (re.compile(r"sh (.*/)?syscalltbl\.sh\b"), _parse_syscalltbl=
_command),
+            (re.compile(r"sh (.*/)?mkcapflags\.sh\b"), _parse_mkcapflags=
_command),
+            (re.compile(r"sh (.*/)?orc_hash\.sh\b"), _parse_orc_hash_com=
mand),
+            (re.compile(r"sh (.*/)?xen-hypercalls\.sh\b"), _parse_xen_hy=
percalls_command),
+            (re.compile(r"sh (.*/)?gen_initramfs\.sh\b"), _parse_gen_ini=
tramfs_command),
+            (re.compile(r"sh (.*/)?checkundef\.sh\b"), _parse_noop),
+            (re.compile(r"(bash|sh) (.*/)?mkuboot\.sh\b"), _parse_mkuboo=
t_command),
+            (re.compile(r"sh (.*/)?syscallnr\.sh\b"), _parse_syscallnr_c=
ommand),
+            (re.compile(r"(/bin/)?sh (.*/)?gen-kernel-hwcaps\.sh\b"), la=
mbda c: _parse_gen_kernel_hwcaps_command(c.split(">")[0])),
+            (re.compile(r"(.*/)?vdso2c\b"), _parse_vdso2c_command),
+            (re.compile(r"(.*/)?vdsomunge\b"), _parse_vdsomunge_command)=
,
+            (re.compile(r"^(.*/)?mkpiggy.*?>"), _parse_mkpiggy_command),
+            (re.compile(r"^(.*/)?relocs\b"), _parse_relocs_command),
+            (re.compile(r"^(.*/)?mk_elfconfig.*?<.*?>"), _parse_mk_elfco=
nfig_command),
+            (re.compile(r"^(.*/)?tools/build\b"), _parse_tools_build_com=
mand),
+            (re.compile(r"^(.*/)?certs/extract-cert"), _parse_extract_ce=
rt_command),
+            (re.compile(r"^(.*/)?scripts/dtc/dtc\b"), _parse_dtc_command=
),
+            (re.compile(r"^(.*/)?pnmtologo\b"), _parse_pnm_to_logo_comma=
nd),
+            (re.compile(r"^(.*/)?kernel/pi/relacheck"), _parse_relacheck=
),
+            (re.compile(r"^(.*/)?gen-hyprel\b"), _parse_gen_hyprel_comma=
nd),
+            (re.compile(r"^drivers/gpu/drm/radeon/mkregtable"), lambda c=
: [c.split(" ")[1]]),
+            (re.compile(r"(.*/)?genheaders\b"), _parse_noop),
+            (re.compile(r"^(.*/)?mkcpustr\s+>"), _parse_noop),
+            (re.compile(r"^(.*/)polgen\b"), _parse_noop),
+            (re.compile(r"make -f .*/arch/x86/Makefile\.postlink"), _par=
se_noop),
+            (re.compile(r"^(.*/)?raid6/mktables\s+>"), _parse_noop),
+            (re.compile(r"^(.*/)?objtool\b"), _parse_noop),
+            (re.compile(r"^(.*/)?module/gen_test_kallsyms.sh"), _parse_n=
oop),
+            (re.compile(r"^(.*/)?gen_header.py"), _parse_gen_header),
+            (re.compile(r"^(.*/)?scripts/rustdoc_test_gen"), _parse_noop=
),
+        ]
+        return CommandParserRegistry(entries)
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter=
.py b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter.py
new file mode 100644
index 00000000000..4749f4bd669
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter.py
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+from dataclasses import dataclass
+
+
+# If Block pattern to match a simple, single-level if-then-fi block. Nes=
ted If blocks are not supported.
+IF_BLOCK_PATTERN =3D re.compile(
+    r"""
+    ^if(.*?);\s*         # Match 'if <condition>;' (non-greedy)
+    then(.*?);\s*        # Match 'then <body>;' (non-greedy)
+    fi\b                 # Match 'fi'
+    """,
+    re.VERBOSE,
+)
+
+
+@dataclass
+class IfBlock:
+    condition: str
+    then_statement: str
+
+
+def _unwrap_outer_parentheses(s: str) -> str:
+    s =3D s.strip()
+    if not (s.startswith("(") and s.endswith(")")):
+        return s
+
+    count =3D 0
+    for i, char in enumerate(s):
+        if char =3D=3D "(":
+            count +=3D 1
+        elif char =3D=3D ")":
+            count -=3D 1
+            # If count is 0 before the end, outer parentheses don't matc=
h
+            if count =3D=3D 0 and i !=3D len(s) - 1:
+                return s
+
+    # outer parentheses do match, unwrap once
+    return _unwrap_outer_parentheses(s[1:-1])
+
+
+def _find_first_top_level_command_separator(
+    commands: str, separators: list[str] =3D [";", "&&"]
+) -> tuple[int | None, int | None]:
+    def is_escaped(index: int) -> bool:
+        preceding =3D commands[:index]
+        return (len(preceding) - len(preceding.rstrip("\\"))) % 2 =3D=3D=
 1
+
+    in_single_quote =3D False
+    in_double_quote =3D False
+    in_curly_braces =3D 0
+    in_braces =3D 0
+    for i, char in enumerate(commands):
+        if char =3D=3D "'" and not in_double_quote and not is_escaped(i)=
:
+            # Toggle single quote state (unless inside double quotes or =
escaped)
+            in_single_quote =3D not in_single_quote
+        elif char =3D=3D '"' and not in_single_quote and not is_escaped(=
i):
+            # Toggle double quote state (unless inside single quotes or =
escaped)
+            in_double_quote =3D not in_double_quote
+
+        if in_single_quote or in_double_quote:
+            continue
+
+        # Toggle braces state
+        if char =3D=3D "{":
+            in_curly_braces +=3D 1
+        if char =3D=3D "}":
+            in_curly_braces -=3D 1
+
+        if char =3D=3D "(":
+            in_braces +=3D 1
+        if char =3D=3D ")":
+            in_braces -=3D 1
+
+        if in_curly_braces > 0 or in_braces > 0:
+            continue
+
+        # return found separator position and separator length
+        for separator in separators:
+            if commands[i : i + len(separator)] =3D=3D separator:
+                return i, len(separator)
+
+    return None, None
+
+
+def split_commands(commands: str) -> list[str | IfBlock]:
+    """
+    Splits a string of command-line commands into individual parts.
+
+    This function handles:
+    - Top-level command separators (e.g., `;` and `&&`) to split multipl=
e commands.
+    - Conditional if-blocks, returning them as `IfBlock` instances.
+    - Preserves the order of commands and trims whitespace.
+
+    Args:
+        commands (str): The raw command string.
+
+    Returns:
+        list[str | IfBlock]: A list of single commands or `IfBlock` obje=
cts.
+    """
+    single_commands: list[str | IfBlock] =3D []
+    remaining_commands =3D _unwrap_outer_parentheses(commands)
+    while len(remaining_commands) > 0:
+        remaining_commands =3D remaining_commands.strip()
+
+        # if block
+        matched_if =3D IF_BLOCK_PATTERN.match(remaining_commands)
+        if matched_if:
+            condition, then_statement =3D matched_if.groups()
+            single_commands.append(IfBlock(condition.strip(), then_state=
ment.strip()))
+            full_matched =3D matched_if.group(0)
+            remaining_commands =3D remaining_commands.removeprefix(full_=
matched).lstrip("; \n")
+            continue
+
+        # command until next separator
+        separator_position, separator_length =3D _find_first_top_level_c=
ommand_separator(remaining_commands)
+        if separator_position is not None and separator_length is not No=
ne:
+            single_commands.append(remaining_commands[:separator_positio=
n].strip())
+            remaining_commands =3D remaining_commands[separator_position=
 + separator_length :].strip()
+            continue
+
+        # single last command
+        single_commands.append(remaining_commands)
+        break
+
+    return single_commands
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.=
py b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py
new file mode 100644
index 00000000000..6a7ea4787aa
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import sbom.sbom_logging as sbom_logging
+from sbom.cmd_graph.savedcmd_parser.command_splitter import IfBlock, spl=
it_commands
+from sbom.cmd_graph.savedcmd_parser.command_parser_registry import Comma=
ndParserRegistry
+from sbom.cmd_graph.savedcmd_parser.tokenizer import CmdParsingError
+from sbom.path_utils import PathStr
+
+DEFAULT_COMMAND_PARSER_REGISTRY =3D CommandParserRegistry.create()
+
+
+def parse_inputs_from_commands(
+    commands: str,
+    fail_on_unknown_build_command: bool,
+    registry: CommandParserRegistry | None =3D None,
+) -> list[PathStr]:
+    """
+    Extract input files referenced in a set of command-line commands.
+
+    Args:
+        commands (str): Command line expression to parse.
+        fail_on_unknown_build_command (bool): Whether to fail if an unkn=
own build command is encountered. If False, errors are logged as warnings=
.
+        registry (CommandParserRegistry | None): Registry of single comm=
and parsers.
+
+    Returns:
+        list[PathStr]: List of input file paths required by the commands=
.
+    """
+
+    def log_error_or_warning(message: str, /, **kwargs: str) -> None:
+        if fail_on_unknown_build_command:
+            sbom_logging.error(message, **kwargs)
+        else:
+            sbom_logging.warning(message, **kwargs)
+
+    if registry is None:
+        registry =3D DEFAULT_COMMAND_PARSER_REGISTRY
+
+    input_files: list[PathStr] =3D []
+    for single_command in split_commands(commands):
+        if isinstance(single_command, IfBlock):
+            inputs =3D parse_inputs_from_commands(single_command.then_st=
atement, fail_on_unknown_build_command, registry)
+            if inputs:
+                log_error_or_warning(
+                    "Skipped parsing command {then_statement} because in=
put files in IfBlock 'then' statement are not supported",
+                    then_statement=3Dsingle_command.then_statement,
+                )
+            continue
+
+        matched_parser =3D next((parser for pattern, parser in registry =
if pattern.match(single_command)), None)
+        if matched_parser is None:
+            log_error_or_warning(
+                "Skipped parsing command {single_command} because no mat=
ching parser was found",
+                single_command=3Dsingle_command,
+            )
+            continue
+        try:
+            inputs =3D matched_parser(single_command)
+            input_files.extend(inputs)
+        except (CmdParsingError, IndexError) as e:
+            log_error_or_warning(
+                "Skipped parsing command {single_command} because of com=
mand parsing error: {error_message}",
+                single_command=3Dsingle_command,
+                error_message=3Dstr(e),
+            )
+
+    return [input.strip().rstrip("/") for input in input_files]
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py b/s=
cripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py
new file mode 100644
index 00000000000..1bf081f40be
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+import shlex
+from dataclasses import dataclass
+from typing import Union
+
+
+class CmdParsingError(Exception):
+    pass
+
+
+@dataclass
+class Option:
+    name: str
+    value: str | None =3D None
+
+
+@dataclass
+class Positional:
+    value: str
+
+
+_SUBCOMMAND_PATTERN =3D re.compile(r"\$\$\(([^()]*)\)")
+"""Pattern to match $$(...) blocks"""
+
+
+def tokenize_single_command(command: str, flag_options: list[str] | None=
 =3D None) -> list[Union[Option, Positional]]:
+    """
+    Parse a shell command into a list of Options and Positionals.
+    - Positional: the command and any positional arguments.
+    - Options: handles flags and options with values provided as space-s=
eparated, or equals-sign
+        (e.g., '--opt val', '--opt=3Dval', '--flag').
+
+    Args:
+        command: Command line string.
+        flag_options: Options that are flags without values (e.g., '--ve=
rbose').
+
+    Returns:
+        List of `Option` and `Positional` objects in command order.
+    """
+
+    #  Wrap all $$(...) blocks in double quotes to prevent shlex from sp=
litting them.
+    command_with_protected_subcommands =3D _SUBCOMMAND_PATTERN.sub(lambd=
a m: f'"$$({m.group(1)})"', command)
+    tokens =3D shlex.split(command_with_protected_subcommands)
+
+    parsed: list[Option | Positional] =3D []
+    i =3D 0
+    while i < len(tokens):
+        token =3D tokens[i]
+
+        # Positional
+        if not token.startswith("-"):
+            parsed.append(Positional(token))
+            i +=3D 1
+            continue
+
+        # Option without value (--flag)
+        if (token.startswith("-") and i + 1 < len(tokens) and tokens[i +=
 1].startswith("-")) or (
+            flag_options and token in flag_options
+        ):
+            parsed.append(Option(name=3Dtoken))
+            i +=3D 1
+            continue
+
+        # Option with equals sign (--opt=3Dval)
+        if "=3D" in token:
+            name, value =3D token.split("=3D", 1)
+            parsed.append(Option(name=3Dname, value=3Dvalue))
+            i +=3D 1
+            continue
+
+        # Option with space-separated value (--opt val)
+        if i + 1 < len(tokens) and not tokens[i + 1].startswith("-"):
+            parsed.append(Option(name=3Dtoken, value=3Dtokens[i + 1]))
+            i +=3D 2
+            continue
+
+        raise CmdParsingError(f"Unrecognized token: {token} in command {=
command}")
+
+    return parsed
+
+
+def tokenize_single_command_positionals_only(command: str) -> list[str]:
+    command_parts =3D tokenize_single_command(command)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    if len(positionals) !=3D len(command_parts):
+        raise CmdParsingError(
+            f"Invalid command format: expected positional arguments only=
 but got options in command {command}."
+        )
+    return positionals
diff --git a/scripts/sbom/sbom/environment.py b/scripts/sbom/sbom/environ=
ment.py
new file mode 100644
index 00000000000..4304066fe97
--- /dev/null
+++ b/scripts/sbom/sbom/environment.py
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import os
+
+KERNEL_BUILD_VARIABLES_ALLOWLIST =3D [
+    "AFLAGS_KERNEL",
+    "AFLAGS_MODULE",
+    "AR",
+    "ARCH",
+    "ARCH_CORE",
+    "ARCH_DRIVERS",
+    "ARCH_LIB",
+    "AWK",
+    "BASH",
+    "BINDGEN",
+    "BITS",
+    "CC",
+    "CC_FLAGS_FPU",
+    "CC_FLAGS_NO_FPU",
+    "CFLAGS_GCOV",
+    "CFLAGS_KERNEL",
+    "CFLAGS_MODULE",
+    "CHECK",
+    "CHECKFLAGS",
+    "CLIPPY_CONF_DIR",
+    "CONFIG_SHELL",
+    "CPP",
+    "CROSS_COMPILE",
+    "CURDIR",
+    "GNUMAKEFLAGS",
+    "HOSTCC",
+    "HOSTCXX",
+    "HOSTPKG_CONFIG",
+    "HOSTRUSTC",
+    "INSTALLKERNEL",
+    "INSTALL_DTBS_PATH",
+    "INSTALL_HDR_PATH",
+    "INSTALL_PATH",
+    "KBUILD_AFLAGS",
+    "KBUILD_AFLAGS_KERNEL",
+    "KBUILD_AFLAGS_MODULE",
+    "KBUILD_BUILTIN",
+    "KBUILD_CFLAGS",
+    "KBUILD_CFLAGS_KERNEL",
+    "KBUILD_CFLAGS_MODULE",
+    "KBUILD_CHECKSRC",
+    "KBUILD_CLIPPY",
+    "KBUILD_CPPFLAGS",
+    "KBUILD_EXTMOD",
+    "KBUILD_EXTRA_WARN",
+    "KBUILD_HOSTCFLAGS",
+    "KBUILD_HOSTCXXFLAGS",
+    "KBUILD_HOSTLDFLAGS",
+    "KBUILD_HOSTLDLIBS",
+    "KBUILD_HOSTRUSTFLAGS",
+    "KBUILD_IMAGE",
+    "KBUILD_LDFLAGS",
+    "KBUILD_LDFLAGS_MODULE",
+    "KBUILD_LDS",
+    "KBUILD_MODULES",
+    "KBUILD_PROCMACROLDFLAGS",
+    "KBUILD_RUSTFLAGS",
+    "KBUILD_RUSTFLAGS_KERNEL",
+    "KBUILD_RUSTFLAGS_MODULE",
+    "KBUILD_USERCFLAGS",
+    "KBUILD_USERLDFLAGS",
+    "KBUILD_VERBOSE",
+    "KBUILD_VMLINUX_LIBS",
+    "KBZIP2",
+    "KCONFIG_CONFIG",
+    "KERNELDOC",
+    "KERNELRELEASE",
+    "KERNELVERSION",
+    "KGZIP",
+    "KLZOP",
+    "LC_COLLATE",
+    "LC_NUMERIC",
+    "LD",
+    "LDFLAGS_MODULE",
+    "LEX",
+    "LINUXINCLUDE",
+    "LZ4",
+    "LZMA",
+    "MAKE",
+    "MAKEFILES",
+    "MAKEFILE_LIST",
+    "MAKEFLAGS",
+    "MAKELEVEL",
+    "MAKEOVERRIDES",
+    "MAKE_COMMAND",
+    "MAKE_HOST",
+    "MAKE_TERMERR",
+    "MAKE_TERMOUT",
+    "MAKE_VERSION",
+    "MFLAGS",
+    "MODLIB",
+    "NM",
+    "NOSTDINC_FLAGS",
+    "O",
+    "OBJCOPY",
+    "OBJCOPYFLAGS",
+    "OBJDUMP",
+    "PAHOLE",
+    "PATCHLEVEL",
+    "PERL",
+    "PYTHON3",
+    "Q",
+    "RCS_FIND_IGNORE",
+    "READELF",
+    "REALMODE_CFLAGS",
+    "RESOLVE_BTFIDS",
+    "RETHUNK_CFLAGS",
+    "RETHUNK_RUSTFLAGS",
+    "RETPOLINE_CFLAGS",
+    "RETPOLINE_RUSTFLAGS",
+    "RETPOLINE_VDSO_CFLAGS",
+    "RUSTC",
+    "RUSTC_BOOTSTRAP",
+    "RUSTC_OR_CLIPPY",
+    "RUSTC_OR_CLIPPY_QUIET",
+    "RUSTDOC",
+    "RUSTFLAGS_KERNEL",
+    "RUSTFLAGS_MODULE",
+    "RUSTFMT",
+    "SRCARCH",
+    "STRIP",
+    "SUBLEVEL",
+    "SUFFIXES",
+    "TAR",
+    "UTS_MACHINE",
+    "VERSION",
+    "VPATH",
+    "XZ",
+    "YACC",
+    "ZSTD",
+    "building_out_of_srctree",
+    "cross_compiling",
+    "objtree",
+    "quiet",
+    "rust_common_flags",
+    "srcroot",
+    "srctree",
+    "sub_make_done",
+    "subdir",
+]
+
+
+class Environment:
+    """
+    Read-only accessor for kernel build environment variables.
+    """
+
+    @classmethod
+    def KERNEL_BUILD_VARIABLES(cls) -> dict[str, str]:
+        return {
+            name: value.strip()
+            for name in KERNEL_BUILD_VARIABLES_ALLOWLIST
+            if (value :=3D os.getenv(name)) is not None and value.strip(=
)
+        }
+
+    @classmethod
+    def ARCH(cls) -> str | None:
+        return os.getenv("ARCH")
+
+    @classmethod
+    def SRCARCH(cls) -> str | None:
+        return os.getenv("SRCARCH")
+
+    @classmethod
+    def CC(cls) -> str | None:
+        return os.getenv("CC")
+
+    @classmethod
+    def LD(cls) -> str | None:
+        return os.getenv("LD")
+
+    @classmethod
+    def AR(cls) -> str | None:
+        return os.getenv("AR")
+
+    @classmethod
+    def NM(cls) -> str | None:
+        return os.getenv("NM")
+
+    @classmethod
+    def OBJCOPY(cls) -> str | None:
+        return os.getenv("OBJCOPY")
+
+    @classmethod
+    def STRIP(cls) -> str | None:
+        return os.getenv("STRIP")
--=20
2.43.0


