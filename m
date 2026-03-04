Return-Path: <linux-kbuild+bounces-11550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEdyHxGUqGkLvwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11550-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 21:20:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFC2078CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 21:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E43030B0785
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 20:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB2F351C13;
	Wed,  4 Mar 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="JjMwmxvu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549434A78F;
	Wed,  4 Mar 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655466; cv=none; b=kUl5oJIiXtWEWFOf4oaXL5Sdw8FHHO4xnkm4Co9s4txsV1ViB0HkQ2ucNks36u+38676leZFjXLOXB/sfbGMPRIzlI1L+HKh4vOo5SIgF0HAq0JjZiRtB+2ZZMh6f6gBFMvGZ4YANqrhyW55DyAKzIrzwT4AYsYundJQGVGoVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655466; c=relaxed/simple;
	bh=PYvdxZiw1RfZX+K+ZkvKCJ48cH0uwPbklG5oNBSPXCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jB+yuS0q2xxshB1+fqhHVWAz2S+Q+qSsKoQPSnTPM/9zokaj6Lj8z72b10Jzx5XxR6r3XgtAB5gImEx0TxA7IDsXF2oJPnktAl2QJLPyEelc2bEwH6tebGlgyt4UxSet9lBESfcRGnL7JdNi0OIoIN5v3jYqLaHPGmZo5g2BENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=JjMwmxvu; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772655462; x=1773260262; i=deller@gmx.de;
	bh=BuJg84OdiykMj8ycqKLmDhSVlFL1Ozm7lCuoZPZCiGY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JjMwmxvuc0IFD3oL8yLcagUam7KjqaDVpjXMy1UUyld0J5iMzIleWGnjNY86KLy6
	 KOuQJ4rm+GEK7IJ1wHk1SO6q3agBMeIM8QMvVS9S1n+ESLbHLkIZ4Vmh0fTlJPQD8
	 BpuQb/bseJhatYyhGizqb081UYPyZZvTdqqWSOOYMAI8YeatgNgnw7pwKUFQlH4lA
	 QTAa+m7mfPvHT6kSHin7wxsZLTzdoU093RJJg3e8+YMYorDyqk1/5WOayp6vB0xIy
	 NoLNBWDgNlA7tW+jucKnUgA6twn2YjFKZdMvKb4Xy/bI5VlgrFrtMDSwZNtYZi0dw
	 xEgwnkZGjl/1XhtueA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1vxsf73MFU-00GGO6; Wed, 04
 Mar 2026 21:17:41 +0100
Message-ID: <258d7167-2e82-4402-9545-108c501ae69e@gmx.de>
Date: Wed, 4 Mar 2026 21:17:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel stack
 traces
To: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260303182103.3523438-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q6PsiMN4dSeQZnkkakOBqi966mM343mTRHc088cSuN+FqngqEfg
 gAHJeyEKw12gEBoceUmZz+HYATzw6vklqngfHquJprCpQ2IMXsz8bjC73vXHHi/GL+IAkLI
 prl0qPK1C5QC1HAXzA4zYNWOTgtmHX7pZiNSLM8ZDJlJO24AzRrTyD1evhOgjqKRU+p0da+
 4PPV0/QQIF8e0atPYAfqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xQabxkf/k2o=;zKxHw793N1dZ63SsnRGYe7jpNJX
 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
 SbSwWATs=
X-Rspamd-Queue-Id: DAAFC2078CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11550-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:dkim,gmx.de:mid,localhost:email]
X-Rspamd-Action: no action

On 3/3/26 19:21, Sasha Levin wrote:
> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> lookup table in the kernel image so stack traces directly print source
> file and line number information:
>=20
>    root@localhost:~# echo c > /proc/sysrq-trigger
>    [   11.201987] sysrq: Trigger a crash
>    [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>    [   11.206218] Call Trace:
>    [   11.206501]  <TASK>
>    [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>    [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>    [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep=
.c:4674)
>    [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>    [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:=
5350)
>    [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5=
535)
>    [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154=
)
>    [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:6=
11)
>    [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:12=
21)
>    [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>    [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>    [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>    [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c=
:63)
>    [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/en=
try/entry_64.S:121)

As mentioned in the other series, I really like this patch series.

I tested this series again on the parisc architecture, and the relative
directories are now stripped with this version of your patch.
IIRC, the previous patch did show the subdirectory names.
[  132.840382] Backtrace:
[  132.840382]  [<104254d8>] show_stack+0x50/0x64 (traps.c:212)
[  132.840382]  [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (dump_stack.c:122)
[  132.840382]  [<1041c118>] dump_stack+0x1c/0x2c (dump_stack.c:130)
[  132.840382]  [<10402218>] vpanic+0x154/0x344 (panic.c:550)
[  132.840382]  [<10402438>] panic+0x30/0x34 (panic.c:787)
[  132.840382]  [<10bebea8>] sysrq_handle_crash+0x30/0x34 (rcupdate.h:110)
[  132.840382]  [<10bec720>] __handle_sysrq+0xc0/0x1e4 (preempt.h:14)

Helge

