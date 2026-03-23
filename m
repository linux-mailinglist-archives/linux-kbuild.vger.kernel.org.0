Return-Path: <linux-kbuild+bounces-12202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOlgKVx5wWkQTQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12202-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:33:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A342FA01B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DEB13014F78
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552023C343A;
	Mon, 23 Mar 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF1zUqht"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A563BF665;
	Mon, 23 Mar 2026 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284550; cv=none; b=VQjyJ7iQGJM6Od3rD5GMBrch6qOa/URftvPPsKmJFVTQ8kMLdyOAj9GhkuzoC/v+2oDJvhP4JH/G/ucFJF0/FWV4SP5TzQHK9KOy48RGJ/4nDN5F3CyMyTbjtxZXO3o1XCIlGFJUHB2/+zgym4krJL5keAy9A3ghVzIEiG6H+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284550; c=relaxed/simple;
	bh=EHB56yz9Q2YdtCy/0KpSoteN7vl9bwzv8n9uiKRf7Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XAan5cx6J+epvf4x+cQJXDdOZVA9d4YflwSC+QfjG1ALrTWw/ayqJcsJO3s56bKNE9ujNk5ZPmsQVYvK3nset/M0tUwJ3baPxkVFIhJcsA73GXghzrxTi1u0Fi2AFaa4izV+b0VNIY/vjoL7PmWMpJlH649GHOkX//OxwaZMMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF1zUqht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714D2C4CEF7;
	Mon, 23 Mar 2026 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284549;
	bh=EHB56yz9Q2YdtCy/0KpSoteN7vl9bwzv8n9uiKRf7Dk=;
	h=From:To:Cc:Subject:Date:From;
	b=FF1zUqhtJg9+qUTuYWgAvYr63kc903U588Br0VefAPGuMNRJrXMEwgSxdyV7sdXnB
	 J/2qvzXyXMu0oTi+kMqUwBG7cN6MPjfmygMis3jSHM0IIOfZwqZfWsZ6ZRJLcCeF6W
	 gZ0/hziE1LcAll3J4HkHSd009maWB7ZZuJp8eKFgbaIT6xCeIJqShQSKze0gSKd2uF
	 uJPiIg1dFZ3o4lmmBbSe2Co9LxJ5GYpgrq/RiKfQ0i7LqJSGE3s/drPCx6XfUdidTQ
	 YBymox/1Wtf/0r+Rr68GSlvz4+5xIQqinkwQjsMXbUuBXSzz64W1heVtpBHdZ1ZsI3
	 YwZjkDJhNTwDQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	David Gow <davidgow@google.com>,
	Kees Cook <kees@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Juergen Gross <jgross@suse.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-modules@vger.kernel.org,
	bpf@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 0/2] kallsyms: show typed function parameters in oops/WARN dumps
Date: Mon, 23 Mar 2026 12:48:55 -0400
Message-ID: <20260323164858.1939248-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,HansenPartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12202-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3A342FA01B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Building on the lineinfo series, this adds typed function parameter
display to oops and WARN dumps.  A build-time tool extracts parameter
names and types from DWARF, and the kernel maps pt_regs to the calling
convention at crash time.  When BTF is available, struct pointer
parameters are dereferenced and their members displayed.

Example output from a WARN in a function receiving struct new_utsname *
(kernel version info) and struct file * parameters:

 ------------[ cut here ]------------
 WARNING: drivers/tty/sysrq.c:1209 at demo_crash+0xf/0x20 (drivers/tty/sysrq.c:1209)
 CPU: 2 UID: 0 PID: 323 Comm: bash
 RIP: 0010:demo_crash+0xf/0x20 (drivers/tty/sysrq.c:1209)
 ...
 RDI: ffffffffb8ca8d00
 RSI: ffffa0a3c250acc0
 ...
 Function parameters (paraminfo_demo_crash):
  uts      (struct new_utsname *) = 0xffffffffb8ca8d00
   .sysname = "Linux"                        .nodename = "localhost"
   .release = "7.0.0-rc2-00006-g3190..."     .version = "#45 SMP PRE"
  file     (struct file *       ) = 0xffffa0a3c250acc0
   .f_mode = (fmode_t)67993630               .f_op = (struct file_operations *)0xffffffffb7237620
   .f_flags = (unsigned int)32769            .f_cred = (struct cred *)0xffffa0a3c2e06a80
   .dentry = (struct dentry *)0xffffa0a3c0978cc0
   .prev_pos = (loff_t)-1
 Call Trace:
  <TASK>
  write_sysrq_trigger+0x96/0xb0 (drivers/tty/sysrq.c:1222)
  proc_reg_write+0x54/0xa0 (fs/proc/inode.c:330)
  vfs_write+0xc9/0x480 (fs/read_write.c:686)
  ksys_write+0x6e/0xe0 (fs/read_write.c:738)
  do_syscall_64+0xe2/0x570 (arch/x86/entry/syscall_64.c:62)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)

Patch 1 adds the core paraminfo infrastructure (DWARF extraction,
kernel-side lookup, register-to-parameter mapping, ~1-2 MB overhead).
Patch 2 adds optional BTF-based struct rendering, gated behind
CONFIG_KALLSYMS_PARAMINFO_BTF.

Sasha Levin (2):
  kallsyms: show function parameter info in oops/WARN dumps
  kallsyms: add BTF-based deep parameter rendering in oops dumps

 .../admin-guide/kallsyms-lineinfo.rst         |  31 +
 arch/x86/kernel/dumpstack.c                   |   6 +-
 include/linux/kallsyms.h                      |   9 +
 init/Kconfig                                  |  40 ++
 kernel/Makefile                               |   1 +
 kernel/kallsyms.c                             | 182 ++++++
 kernel/kallsyms_internal.h                    |   6 +
 kernel/kallsyms_paraminfo_btf.c               | 199 ++++++
 lib/Kconfig.debug                             |  11 +
 lib/tests/Makefile                            |   3 +
 lib/tests/paraminfo_kunit.c                   | 249 ++++++++
 scripts/Makefile                              |   3 +
 scripts/empty_paraminfo.S                     |  18 +
 scripts/gen_paraminfo.c                       | 597 ++++++++++++++++++
 scripts/link-vmlinux.sh                       |  44 +-
 15 files changed, 1393 insertions(+), 6 deletions(-)
 create mode 100644 kernel/kallsyms_paraminfo_btf.c
 create mode 100644 lib/tests/paraminfo_kunit.c
 create mode 100644 scripts/empty_paraminfo.S
 create mode 100644 scripts/gen_paraminfo.c

--
2.51.0


