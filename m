Return-Path: <linux-kbuild+bounces-11680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBmsMDjCrWlm7AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11680-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 19:38:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BDE231B55
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 19:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E4C3015E1A
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 18:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B023939D1;
	Sun,  8 Mar 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdlCCoG6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA2433344C;
	Sun,  8 Mar 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995108; cv=none; b=AKGT6JY09XsHcIy4htN3JlJH60Y14qS0kmCtt84FehA/nZVkHJptGgzkU9sW2qSY58A1pEMzncW3ohPC7/3ByCiW1/vxdg30eg9a9LJSCF4BsAW8Sy6TOpXFN+9EMI7691F5FQpSvnXO8HNk10OZQWinCcj1GOCZA63Hi4Z50oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995108; c=relaxed/simple;
	bh=jZJBIlksgatlFHsMEq+0aBvFqu9v03d1c2RJYYj3/Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYTUq7dQ7zqCAtabLk0Z5qbDhfQc8+oCvLFIGqbe4nvq27MXgm7si51Jm6sWjlhkEa7IfShH+OQSmSpZGy5mLD0ZwoFVR9gGH60/BUyvy/u72/V3eQ24G/xPJQ4R16X0suMUSY7XNaDCnPkLtCq7W1el8fTHIJS90fHZrREWHJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdlCCoG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AEAC116C6;
	Sun,  8 Mar 2026 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772995107;
	bh=jZJBIlksgatlFHsMEq+0aBvFqu9v03d1c2RJYYj3/Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdlCCoG6Ebyt/aF+JtWn7ConBk0iCh3KFkGnTKE7yJGso4f70z61PDqQtRXrEOvn2
	 +D+NCfDBND9QYYPFr66KckKOiSR3m0BQhweE79tNRn93I4FRQXoq6ZKxKoMywkv6fG
	 58+nryM1wSgC25gN5Vo3PMjWHJPatD085BEbVbAQkOwyCHW6nSZ3B272MaIDA7+oX6
	 Wjh0NMvkNbAq29M3izmciA6W9WXnJUws4C0qPWRd11j5Yk5e0boHvq2MrXovrJbyXe
	 PZKUwnTHoVX6Hq1byo/tE/oypmbk8JJ7+VS1/tE76gWKfhc0dijkSg0SWLt/e4DO1Z
	 /6tTN6EBTF5xA==
Date: Sun, 8 Mar 2026 14:38:26 -0400
From: Sasha Levin <sashal@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org, rdunlap@infradead.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/4] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <aa3CIjVhSsQUXSej@laps>
References: <20260307172022.460402-1-sashal@kernel.org>
 <20260307172022.460402-2-sashal@kernel.org>
 <3ab0cad6-bf55-4ae5-afb7-d9129ac2032e@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3ab0cad6-bf55-4ae5-afb7-d9129ac2032e@gmx.de>
X-Rspamd-Queue-Id: 35BDE231B55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11680-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,localhost:email,gmx.de:email]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 10:41:20PM +0100, Helge Deller wrote:
>Hi Sasha,
>
>On 3/7/26 18:20, Sasha Levin wrote:
>>Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>lookup table in the kernel image so stack traces directly print source
>>file and line number information:
>>
>>   root@localhost:~# echo c > /proc/sysrq-trigger
>>   [   11.201987] sysrq: Trigger a crash
>>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>>   [   11.206218] Call Trace:
>>   [   11.206501]  <TASK>
>>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>>   [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>>   [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
>>[...]
>>
>>Assisted-by: Claude:claude-opus-4-6
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Shows relative paths and works OK on 32- and 64-bit parisc kernel.
>You may add
>Tested-by: Helge Deller <deller@gmx.de>

Thanks for testing! I'm happy the regression was fixed.

>A few notes/suggestions below....
>
>
>>---
>>  Documentation/admin-guide/index.rst           |   1 +
>>  .../admin-guide/kallsyms-lineinfo.rst         |  72 +++
>>  MAINTAINERS                                   |   6 +
>>  include/linux/kallsyms.h                      |  32 +-
>>  init/Kconfig                                  |  20 +
>>  kernel/kallsyms.c                             |  61 +++
>>  kernel/kallsyms_internal.h                    |  11 +
>>  scripts/.gitignore                            |   1 +
>>  scripts/Makefile                              |   3 +
>>  scripts/gen_lineinfo.c                        | 510 ++++++++++++++++++
>>  scripts/kallsyms.c                            |  16 +
>>  scripts/link-vmlinux.sh                       |  70 ++-
>>  12 files changed, 799 insertions(+), 4 deletions(-)
>>  create mode 100644 Documentation/admin-guide/kallsyms-lineinfo.rst
>>  create mode 100644 scripts/gen_lineinfo.c
>
>>diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
>>index aec2f06858afd..c94d8f332c5df 100644
>>--- a/kernel/kallsyms.c
>>+++ b/kernel/kallsyms.c
>>@@ -467,6 +467,54 @@ static int append_buildid(char *buffer,   const char *modname,
>>  #endif /* CONFIG_STACKTRACE_BUILD_ID */
>>+#ifdef CONFIG_KALLSYMS_LINEINFO
>>+bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
>>+			      const char **file, unsigned int *line)
>>+{
>>+	unsigned long long raw_offset;
>>+	unsigned int offset, low, high, mid, file_id;
>>+
>>+	if (!lineinfo_num_entries)
>>+		return false;
>
>The "#ifdef CONFIG_KALLSYMS_LINEINFO" above prevents that this function
>is compiled when the option is disabled.
>
>Instead, you *could* move the "CONFIG_KALLSYMS_LINEINFO" option into
>the function with "IS_ENABLED()", like this...:
>+	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) || !lineinfo_num_entries)
>+		return false;
>
>That way your code will always be compiled, and the code will be optimized
>away by the compiler if the option is disabled. The huge benefit is, that
>the compiler will do syntax-checking at every build, so you will see coding
>bugs early.
>
>You could use the same semantic at other places in your patches, and of
>course you then need to remove the #ifdef ...

Ack, this makes sense. I'll do it in the v3 if it's needed.

-- 
Thanks,
Sasha

