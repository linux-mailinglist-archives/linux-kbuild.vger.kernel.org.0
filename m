Return-Path: <linux-kbuild+bounces-11612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHncE9ZmqmlOQwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11612-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 06:32:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0B21BBCA
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 06:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2499304139E
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 05:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD5B3112BA;
	Fri,  6 Mar 2026 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NEifPV4A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80E17C69;
	Fri,  6 Mar 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775108; cv=none; b=jdZwWK2jCpgemMX0hfAvsEvuKcEkL4jmPkmZe6uAC9mRMSzh5zLEmNraJfJ0IzEhgmEU6pSydB+DUyaEd9cRCrv3ufikeQiou0f4kfwthAgeuTjz1AAzyp0CVFGNuWNiHOUAgYB/cNiWtQ0RAi/W5WbPMKPckdt7B/bvKSrh7A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775108; c=relaxed/simple;
	bh=TuZ4HMuvMsyaE+P8oAO3m10hFVVxMOdkXaWq3jt0wrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+TrwMTrbHRj5OdxnSms5JAVrhmkqtZIWaaNDDPfzb9mfuEOniP0xiA+gD2yMVpg+XGAxpVIwoWx8HmsGGy8ugcdjOdK2lJYSI8IvTGDFMJ4svZcLcLCHfRgWf45ESNDkO1/E/4UZ9oTys/yD0EgUoTZ69lreSC7K4pZDjW7QLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NEifPV4A; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YTy9WH4252KkEisoIowgga7hEsIxg8Hn2L4+MHnhZgw=; b=NEifPV4AurNeboy+GzmVzpJVHk
	pwctB56sgrisw4DR+3m59BGRuE3/eH2ucib1ru2Foeoyijws5jEGElOGUzEPvtPclmrZ99bf5qths
	a1IWjYqYaNWxitOcK1mvNEi88gIiIj9SvUkXvpZDHmWl/mAmiXLamVGOuXYH0bWlocnbVVPjbJ6Zy
	locXi+7Kl9zKNKwfvkW31VzCNF+9fvduS54pqYATipwVQvgCATggLs94JIlg/393ipmtYYj+DTSIA
	3xnED0N2OWbE+I74sUHAzeKsWY255E2+PuX1zxiXGzbSZ8kf2Erk9ZoFzKjvCJ+BuRDwC2ea7UY9Q
	eBt0H2Uw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNml-000000032wP-2vq8;
	Fri, 06 Mar 2026 05:31:39 +0000
Message-ID: <14977e29-cd76-424c-89c3-9f8c73186e27@infradead.org>
Date: Thu, 5 Mar 2026 21:31:38 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel stack
 traces
To: Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
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
 <258d7167-2e82-4402-9545-108c501ae69e@gmx.de> <aajoETEtX9r2XzT7@laps>
 <eab67de3-74af-45d9-bf67-1bf2c10aec37@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <eab67de3-74af-45d9-bf67-1bf2c10aec37@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ACC0B21BBCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11612-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Action: no action



On 3/5/26 2:26 PM, Helge Deller wrote:
> On 3/5/26 03:18, Sasha Levin wrote:
>> On Wed, Mar 04, 2026 at 09:17:37PM +0100, Helge Deller wrote:
>>> On 3/3/26 19:21, Sasha Levin wrote:
>>>> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>>> lookup table in the kernel image so stack traces directly print source
>>>> file and line number information:
>>>>
>>>>   root@localhost:~# echo c > /proc/sysrq-trigger
>>>>   [   11.201987] sysrq: Trigger a crash
>>>>   [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>>>>   [   11.206218] Call Trace:
>>>>   [   11.206501]  <TASK>
>>>>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
>>>>   [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
>>>>   [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
>>>>   [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
>>>>   [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
>>>>   [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
>>>>   [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
>>>>   [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
>>>>   [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
>>>>   [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
>>>>   [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
>>>>   [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
>>>>   [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
>>>>   [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)
>>>
>>> As mentioned in the other series, I really like this patch series.
>>>
>>> I tested this series again on the parisc architecture, and the relative
>>> directories are now stripped with this version of your patch.
>>> IIRC, the previous patch did show the subdirectory names.
>>> [  132.840382] Backtrace:
>>> [  132.840382]  [<104254d8>] show_stack+0x50/0x64 (traps.c:212)
>>> [  132.840382]  [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (dump_stack.c:122)
>>> [  132.840382]  [<1041c118>] dump_stack+0x1c/0x2c (dump_stack.c:130)
>>> [  132.840382]  [<10402218>] vpanic+0x154/0x344 (panic.c:550)
>>> [  132.840382]  [<10402438>] panic+0x30/0x34 (panic.c:787)
>>> [  132.840382]  [<10bebea8>] sysrq_handle_crash+0x30/0x34 (rcupdate.h:110)
>>> [  132.840382]  [<10bec720>] __handle_sysrq+0xc0/0x1e4 (preempt.h:14)
>>
>> Ugh... Can you confirm that you've build this kernel with O=?
> 
> Yes. Both -Os and -O2 do not show the relative path.

Helge,
I'm fairly sure that Sasha meant with O=build_dir_name,
not -O for optimization levels.

>> The RFC had a dirty dirty hack around how we turn these absolute paths into
>> relative ones, but I tried to re-do it so no one would yell at me :)
> 
> Seems it is needed...
> 
> Helge
> 

-- 
~Randy


