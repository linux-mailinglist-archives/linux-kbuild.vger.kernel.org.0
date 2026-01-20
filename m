Return-Path: <linux-kbuild+bounces-10711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKXTKEwkcGlRVwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10711-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:56:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851B4EC1B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CAEB64636C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6945D425CD3;
	Tue, 20 Jan 2026 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="J7OQYrB6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86733F371;
	Tue, 20 Jan 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910142; cv=none; b=Fca8CEOGkydP0+ML4cCxpjOb/NTPq9atUZm2ltdQIuLQsmKS6ewtz5d3LL+k4DGZ97R1OiRPZird9+jLpB2Tqtw2bPaE//vYU3qJJUuq2lbgLLslO3S0qhC2tochQwq94vI4v0exeOCo98CLyv2uOe26uZIWTJ5jRFSC7xL/WPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910142; c=relaxed/simple;
	bh=vxsj0vozrmNCJZJnpHlDEszqHMXArMmk6Orxrb2wBJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ocw/Ge6TvXKEFVQ2/aqCbV61y5T9bRpKFjxONmz3f3BLJ6RdOblX42liAd+ZraHj1ppEfkzXJ71PGH0AgP1tbEF1QMNTotPkFSRVqGkkEzsO8z1MIy/7P9zwv/t7t85tHzquAN9MOi4euKuonIS1GQuINbzqXw+5tuMX7I0fo0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=J7OQYrB6; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 2779E200BF;
	Tue, 20 Jan 2026 12:55:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 9C9A71FA659;
	Tue, 20 Jan 2026 12:55:35 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 0c7_QKE-Lt0Z; Tue, 20 Jan 2026 12:55:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 85D491FA5F5;
	Tue, 20 Jan 2026 12:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 85D491FA5F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1768910133;
	bh=X7VLnM545K9h8NsVTCbW97cPRbf+gkr53bpvW4mQFr0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=J7OQYrB6XP4rVCWN9Pi+S4v3h1wcjPyj5j8PjIZFU6vBj88gQa72PpKx28iH/1WtI
	 buS94SnFGQTkVMm0hLyhi+QIRjfmo5CQydQjxB2+uhAXOiTpqA/xaABMv1umq2igCJ
	 AT8hArdT2+3hitrvo1oDEiKkRNT7qDADQXT93lCnRiUJ40eDaAE+XyP/REy8pGUTDj
	 X5SQGcOsBc+6qHRo9UsMjHGG5z7nohXoNOw59YRCv68SJHz/HxgJ0/VANWxiHq8M4G
	 B0ZKlPc60sIgkq/Mem9iVjImEM9Y0aDlCCYxMlR+hYHWtU7QSCAbvCb6rgwIvcrmAt
	 3FcLZEI2QS2Yg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id seRQc7sYk6FH; Tue, 20 Jan 2026 12:55:33 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C623E1FA659;
	Tue, 20 Jan 2026 12:55:32 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v2 03/14] tools/sbom: add command parsers
Date: Tue, 20 Jan 2026 12:53:41 +0100
Message-Id: <20260120115352.10910-4-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120115352.10910-1-luis.augenstein@tngtech.com>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tngtech.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[tngtech.com,quarantine];
	TAGGED_FROM(0.00)[bounces-10711-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,tngtech.com:email,tngtech.com:dkim,tngtech.com:mid];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4851B4EC1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement savedcmd_parser module for extracting input files
from kernel build commands.

Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 tools/sbom/sbom/cmd_graph/savedcmd_parser.py | 664 +++++++++++++++++++
 1 file changed, 664 insertions(+)
 create mode 100644 tools/sbom/sbom/cmd_graph/savedcmd_parser.py

diff --git a/tools/sbom/sbom/cmd_graph/savedcmd_parser.py b/tools/sbom/sb=
om/cmd_graph/savedcmd_parser.py
new file mode 100644
index 000000000000..d72f781b4498
--- /dev/null
+++ b/tools/sbom/sbom/cmd_graph/savedcmd_parser.py
@@ -0,0 +1,664 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+import shlex
+from dataclasses import dataclass
+from typing import Any, Callable, Union
+import sbom.sbom_logging as sbom_logging
+from sbom.path_utils import PathStr
+
+
+class CmdParsingError(Exception):
+    def __init__(self, message: str):
+        super().__init__(message)
+        self.message =3D message
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
+def _tokenize_single_command(command: str, flag_options: list[str] | Non=
e =3D None) -> list[Union[Option, Positional]]:
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
+def _tokenize_single_command_positionals_only(command: str) -> list[str]=
:
+    command_parts =3D _tokenize_single_command(command)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    if len(positionals) !=3D len(command_parts):
+        raise CmdParsingError(
+            f"Invalid command format: expected positional arguments only=
 but got options in command {command}."
+        )
+    return positionals
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
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["cat", input1, input2, ...]
+    return [p for p in positionals[1:]]
+
+
+def _parse_compound_command(command: str) -> list[PathStr]:
+    compound_command_parsers: list[tuple[re.Pattern[str], Callable[[str]=
, list[PathStr]]]] =3D [
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
+            lambda c: [input] if (input :=3D c.split("<")[1].strip()) !=3D=
 "/dev/null" else [],
+        ),
+        (re.compile(r"^:$"), _parse_noop),
+    ]
+
+    match =3D re.match(r"\s*[\(\{](.*)[\)\}]\s*>", command, re.DOTALL)
+    if match is None:
+        raise CmdParsingError("No inner commands found for compound comm=
and")
+    input_files: list[PathStr] =3D []
+    inner_commands =3D _split_commands(match.group(1))
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
+        except CmdParsingError as e:
+            sbom_logging.error(
+                "Skip parsing inner command {inner_command} of compound =
command because of command parsing error: {error_message}",
+                inner_command=3Dinner_command,
+                error_message=3De.message,
+            )
+    return input_files
+
+
+def _parse_objcopy_command(command: str) -> list[PathStr]:
+    command_parts =3D _tokenize_single_command(command, flag_options=3D[=
"-S", "-w"])
+    positionals =3D [part.value for part in command_parts if isinstance(=
part, Positional)]
+    # expect positionals to be ['objcopy', input_file] or ['objcopy', in=
put_file, output_file]
+    if not (len(positionals) =3D=3D 2 or len(positionals) =3D=3D 3):
+        raise CmdParsingError(
+            f"Invalid objcopy command format: expected 2 or 3 positional=
 arguments, got {len(positionals)} ({positionals})"
+        )
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
+def _parse_noop(command: str) -> list[PathStr]:
+    """
+    No-op parser for commands with no input files (e.g., 'rm', 'true').
+    Returns an empty list.
+    """
+    return []
+
+
+def _parse_ar_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command)
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
+    positionals =3D _tokenize_single_command_positionals_only(printf_com=
mand.strip())
+    # expect positionals to be ['printf', '{prefix_path}%s ', input1, in=
put2, ...]
+    prefix_path =3D positionals[1].rstrip("%s ")
+    return [f"{prefix_path}{filename}" for filename in positionals[2:]]
+
+
+def _parse_gcc_or_clang_command(command: str) -> list[PathStr]:
+    parts =3D shlex.split(command)
+    # compile mode: expect last positional argument ending in `.c` or `.=
S` to be the input file
+    for part in reversed(parts):
+        if not part.startswith("-") and any(part.endswith(suffix) for su=
ffix in [".c", ".S"]):
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
+    command_parts =3D _tokenize_single_command(command.strip(), flag_opt=
ions=3D["--emit-nr"])
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/syscallhdr.sh, input, outp=
ut]
+    return [positionals[2]]
+
+
+def _parse_syscalltbl_command(command: str) -> list[PathStr]:
+    command_parts =3D _tokenize_single_command(command.strip())
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/syscalltbl.sh, input, outp=
ut]
+    return [positionals[2]]
+
+
+def _parse_mkcapflags_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/mkcapflags.sh, output, inp=
ut1, input2]
+    return [positionals[3], positionals[4]]
+
+
+def _parse_orc_hash_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/orc_hash.sh, '<', input, '=
>', output]
+    return [positionals[3]]
+
+
+def _parse_xen_hypercalls_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["sh", path/to/xen-hypercalls.sh, output,=
 input1, input2, ...]
+    return positionals[3:]
+
+
+def _parse_gen_initramfs_command(command: str) -> list[PathStr]:
+    command_parts =3D _tokenize_single_command(command)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["sh", path/to/gen_initramfs.sh, input1, =
input2, ...]
+    return positionals[2:]
+
+
+def _parse_vdso2c_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ['vdso2c', raw_input, stripped_input, out=
put]
+    return [positionals[1], positionals[2]]
+
+
+def _parse_ld_command(command: str) -> list[PathStr]:
+    command_parts =3D _tokenize_single_command(
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
+    command_parts =3D _tokenize_single_command(command)
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["awk", input1, input2, ...]
+    return positionals[1:]
+
+
+def _parse_nm_piped_command(command: str) -> list[PathStr]:
+    nm_command, _ =3D command.split("|", 1)
+    command_parts =3D _tokenize_single_command(
+        command=3Dnm_command.strip(),
+        flag_options=3D["p", "--defined-only"],
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
+    positionals =3D _tokenize_single_command_positionals_only(command)
+    # expect positionals to be ["relachek", input, log_reference]
+    return [positionals[1]]
+
+
+def _parse_perl_command(command: str) -> list[PathStr]:
+    positionals =3D _tokenize_single_command_positionals_only(command.st=
rip())
+    # expect positionals to be ["perl", input]
+    return [positionals[1]]
+
+
+def _parse_strip_command(command: str) -> list[PathStr]:
+    command_parts =3D _tokenize_single_command(command, flag_options=3D[=
"--strip-debug"])
+    positionals =3D [p.value for p in command_parts if isinstance(p, Pos=
itional)]
+    # expect positionals to be ["strip", input1, input2, ...]
+    return positionals[1:]
+
+
+def _parse_mkpiggy_command(command: str) -> list[PathStr]:
+    mkpiggy_command, _ =3D command.split(">", 1)
+    positionals =3D _tokenize_single_command_positionals_only(mkpiggy_co=
mmand)
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
+    positionals =3D _tokenize_single_command_positionals_only(command)
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
+    positionals =3D _tokenize_single_command_positionals_only(command)
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
+    command_parts =3D _tokenize_single_command(command, flag_options=3Dw=
no_flags)
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
+    i =3D next(i for i, token in enumerate(command_parts) if token =3D=3D=
 "--xml")
+    return [command_parts[i + 1]]
+
+
+# Command parser registry
+SINGLE_COMMAND_PARSERS: list[tuple[re.Pattern[str], Callable[[str], list=
[PathStr]]]] =3D [
+    # Compound commands
+    (re.compile(r"\(.*?\)\s*>", re.DOTALL), _parse_compound_command),
+    (re.compile(r"\{.*?\}\s*>", re.DOTALL), _parse_compound_command),
+    # Standard Unix utilities and system tools
+    (re.compile(r"^rm\b"), _parse_noop),
+    (re.compile(r"^mkdir\b"), _parse_noop),
+    (re.compile(r"^touch\b"), _parse_noop),
+    (re.compile(r"^cat\b.*?[\|>]"), lambda c: _parse_cat_command(c.split=
("|")[0].split(">")[0])),
+    (re.compile(r"^echo[^|]*$"), _parse_noop),
+    (re.compile(r"^sed.*?>"), lambda c: _parse_sed_command(c.split(">")[=
0])),
+    (re.compile(r"^sed\b"), _parse_noop),
+    (re.compile(r"^awk.*?<.*?>"), lambda c: [c.split("<")[1].split(">")[=
0]]),
+    (re.compile(r"^awk.*?>"), lambda c: _parse_awk(c.split(">")[0])),
+    (re.compile(r"^(/bin/)?true\b"), _parse_noop),
+    (re.compile(r"^(/bin/)?false\b"), _parse_noop),
+    (re.compile(r"^openssl\s+req.*?-new.*?-keyout"), _parse_noop),
+    # Compilers and code generators
+    # (C/LLVM toolchain, Rust, Flex/Bison, Bindgen, Perl, etc.)
+    (re.compile(r"^([^\s]+-)?(gcc|clang)\b"), _parse_gcc_or_clang_comman=
d),
+    (re.compile(r"^([^\s]+-)?ld(\.bfd)?\b"), _parse_ld_command),
+    (re.compile(r"^printf\b.*\| xargs ([^\s]+-)?ar\b"), _parse_ar_piped_=
xargs_command),
+    (re.compile(r"^([^\s]+-)?ar\b"), _parse_ar_command),
+    (re.compile(r"^([^\s]+-)?nm\b.*?\|"), _parse_nm_piped_command),
+    (re.compile(r"^([^\s]+-)?objcopy\b"), _parse_objcopy_command),
+    (re.compile(r"^([^\s]+-)?strip\b"), _parse_strip_command),
+    (re.compile(r".*?rustc\b"), _parse_rustc_command),
+    (re.compile(r".*?rustdoc\b"), _parse_rustdoc_command),
+    (re.compile(r"^flex\b"), _parse_flex_command),
+    (re.compile(r"^bison\b"), _parse_bison_command),
+    (re.compile(r"^bindgen\b"), _parse_bindgen_command),
+    (re.compile(r"^perl\b"), _parse_perl_command),
+    # Kernel-specific build scripts and tools
+    (re.compile(r"^(.*/)?link-vmlinux\.sh\b"), _parse_link_vmlinux_comma=
nd),
+    (re.compile(r"sh (.*/)?syscallhdr\.sh\b"), _parse_syscallhdr_command=
),
+    (re.compile(r"sh (.*/)?syscalltbl\.sh\b"), _parse_syscalltbl_command=
),
+    (re.compile(r"sh (.*/)?mkcapflags\.sh\b"), _parse_mkcapflags_command=
),
+    (re.compile(r"sh (.*/)?orc_hash\.sh\b"), _parse_orc_hash_command),
+    (re.compile(r"sh (.*/)?xen-hypercalls\.sh\b"), _parse_xen_hypercalls=
_command),
+    (re.compile(r"sh (.*/)?gen_initramfs\.sh\b"), _parse_gen_initramfs_c=
ommand),
+    (re.compile(r"sh (.*/)?checkundef\.sh\b"), _parse_noop),
+    (re.compile(r"(.*/)?vdso2c\b"), _parse_vdso2c_command),
+    (re.compile(r"^(.*/)?mkpiggy.*?>"), _parse_mkpiggy_command),
+    (re.compile(r"^(.*/)?relocs\b"), _parse_relocs_command),
+    (re.compile(r"^(.*/)?mk_elfconfig.*?<.*?>"), _parse_mk_elfconfig_com=
mand),
+    (re.compile(r"^(.*/)?tools/build\b"), _parse_tools_build_command),
+    (re.compile(r"^(.*/)?certs/extract-cert"), _parse_extract_cert_comma=
nd),
+    (re.compile(r"^(.*/)?scripts/dtc/dtc\b"), _parse_dtc_command),
+    (re.compile(r"^(.*/)?pnmtologo\b"), _parse_pnm_to_logo_command),
+    (re.compile(r"^(.*/)?kernel/pi/relacheck"), _parse_relacheck),
+    (re.compile(r"^drivers/gpu/drm/radeon/mkregtable"), lambda c: [c.spl=
it(" ")[1]]),
+    (re.compile(r"(.*/)?genheaders\b"), _parse_noop),
+    (re.compile(r"^(.*/)?mkcpustr\s+>"), _parse_noop),
+    (re.compile(r"^(.*/)polgen\b"), _parse_noop),
+    (re.compile(r"make -f .*/arch/x86/Makefile\.postlink"), _parse_noop)=
,
+    (re.compile(r"^(.*/)?raid6/mktables\s+>"), _parse_noop),
+    (re.compile(r"^(.*/)?objtool\b"), _parse_noop),
+    (re.compile(r"^(.*/)?module/gen_test_kallsyms.sh"), _parse_noop),
+    (re.compile(r"^(.*/)?gen_header.py"), _parse_gen_header),
+    (re.compile(r"^(.*/)?scripts/rustdoc_test_gen"), _parse_noop),
+]
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
+    in_single_quote =3D False
+    in_double_quote =3D False
+    in_curly_braces =3D 0
+    in_braces =3D 0
+    for i, char in enumerate(commands):
+        if char =3D=3D "'" and not in_double_quote:
+            # Toggle single quote state (unless inside double quotes)
+            in_single_quote =3D not in_single_quote
+        elif char =3D=3D '"' and not in_single_quote:
+            # Toggle double quote state (unless inside single quotes)
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
+def _split_commands(commands: str) -> list[str | IfBlock]:
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
+
+
+def parse_inputs_from_commands(commands: str, fail_on_unknown_build_comm=
and: bool) -> list[PathStr]:
+    """
+    Extract input files referenced in a set of command-line commands.
+
+    Args:
+        commands (str): Command line expression to parse.
+        fail_on_unknown_build_command (bool): Whether to fail if an unkn=
own build command is encountered. If False, errors are logged as warnings=
.
+
+    Returns:
+        list[PathStr]: List of input file paths required by the commands=
.
+    """
+
+    def log_error_or_warning(message: str, /, **kwargs: Any) -> None:
+        if fail_on_unknown_build_command:
+            sbom_logging.error(message, **kwargs)
+        else:
+            sbom_logging.warning(message, **kwargs)
+
+    input_files: list[PathStr] =3D []
+    for single_command in _split_commands(commands):
+        if isinstance(single_command, IfBlock):
+            inputs =3D parse_inputs_from_commands(single_command.then_st=
atement, fail_on_unknown_build_command)
+            if inputs:
+                log_error_or_warning(
+                    "Skipped parsing command {then_statement} because in=
put files in IfBlock 'then' statement are not supported",
+                    then_statement=3Dsingle_command.then_statement,
+                )
+            continue
+
+        matched_parser =3D next(
+            (parser for pattern, parser in SINGLE_COMMAND_PARSERS if pat=
tern.match(single_command)), None
+        )
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
+        except CmdParsingError as e:
+            log_error_or_warning(
+                "Skipped parsing command {single_command} because of com=
mand parsing error: {error_message}",
+                single_command=3Dsingle_command,
+                error_message=3De.message,
+            )
+
+    return [input.strip().rstrip("/") for input in input_files]
--=20
2.34.1


