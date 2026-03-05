Return-Path: <linux-kbuild+bounces-11555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHzgKhboqGmKygAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11555-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 03:19:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CF20A22B
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 03:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62F5E3020201
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 02:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832DB23C39A;
	Thu,  5 Mar 2026 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pawCvHiZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE771A23A4;
	Thu,  5 Mar 2026 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772677139; cv=none; b=lVAfPmk6XghPbHLCn89LHJUWgzHKkCKUAJzmmDoRRMrZ5kReTd5HI2710Q+me/AuJqlDXgavsN1UsrSsXsTozjpjj9igbDRGFnuDGxV/UKHIEWWQf1nEsgIuPqOvCuSr4yzCe9pdAziIEGXqaXzIxmHP24aVAO+UVcH6HYznWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772677139; c=relaxed/simple;
	bh=Ls/7mcA2DK1yUNDKwWVDb+Xk7O6ZAGJS7ZHtXQtS4sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1ljOGZAXFZ2NMdl4XaBoXcTYlCsj3uomhRQwB+TATS5EAYmNFLB0Iu54+vWrr5HCfYihXFSd3O85MXokPj+JYamyZwFmVyGFUP9DG7timw1t3ZKQCIR0FTxhCpIs9A68PoAM5DBVzI7xEZV/TlHBZn6x6FMM6Pe9rNkAWdS6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pawCvHiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6EAC4CEF7;
	Thu,  5 Mar 2026 02:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772677138;
	bh=Ls/7mcA2DK1yUNDKwWVDb+Xk7O6ZAGJS7ZHtXQtS4sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pawCvHiZSp7TytfXL17wDR0K9R0m/k1ZLv5M80Yj6FEjwhe66HcUrZniCaGC8bysk
	 2MrZySXtcpKszetZbzw6Cli/lg1vdfeueZuBn3ABqQjfzlmMLQxOjPQaO0LH4YJ1WD
	 Haw14DWcqB+POm5YJLoIveLxljpRGnFTSoM8C7m3lIvfiwh38t8J3pcCXP7rYez8Dn
	 8iJRLmNzJXXK5bBPw3TAK/O554ERaOPj/8RioVipVJTzHgGuEkqdEdiufjvnybbplc
	 aXUh3zhMwepJ8hj0ckPvlNfFQHaQt3ti/caRF4/yFvnftgP+Gss5XMIfri38yProH6
	 XPpGtFnHD7Qhw==
Date: Wed, 4 Mar 2026 21:18:57 -0500
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
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <aajoETEtX9r2XzT7@laps>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <258d7167-2e82-4402-9545-108c501ae69e@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <258d7167-2e82-4402-9545-108c501ae69e@gmx.de>
X-Rspamd-Queue-Id: 4A3CF20A22B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11555-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 09:17:37PM +0100, Helge Deller wrote:
>On 3/3/26 19:21, Sasha Levin wrote:
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
>>   [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>>   [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
>>   [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
>>   [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>>   [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>>   [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>>   [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>>   [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>>   [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>>   [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
>>   [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)
>
>As mentioned in the other series, I really like this patch series.
>
>I tested this series again on the parisc architecture, and the relative
>directories are now stripped with this version of your patch.
>IIRC, the previous patch did show the subdirectory names.
>[  132.840382] Backtrace:
>[  132.840382]  [<104254d8>] show_stack+0x50/0x64 (traps.c:212)
>[  132.840382]  [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (dump_stack.c:122)
>[  132.840382]  [<1041c118>] dump_stack+0x1c/0x2c (dump_stack.c:130)
>[  132.840382]  [<10402218>] vpanic+0x154/0x344 (panic.c:550)
>[  132.840382]  [<10402438>] panic+0x30/0x34 (panic.c:787)
>[  132.840382]  [<10bebea8>] sysrq_handle_crash+0x30/0x34 (rcupdate.h:110)
>[  132.840382]  [<10bec720>] __handle_sysrq+0xc0/0x1e4 (preempt.h:14)

Ugh... Can you confirm that you've build this kernel with O=?

The RFC had a dirty dirty hack around how we turn these absolute paths into
relative ones, but I tried to re-do it so no one would yell at me :)

-- 
Thanks,
Sasha

