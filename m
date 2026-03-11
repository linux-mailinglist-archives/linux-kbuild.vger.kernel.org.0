Return-Path: <linux-kbuild+bounces-11816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AeiITDssGmRogIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11816-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 05:14:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50325BDF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 05:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F130F3063B76
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 04:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EF4253B42;
	Wed, 11 Mar 2026 04:14:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A1156F45;
	Wed, 11 Mar 2026 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773202476; cv=none; b=ukzMMZTvDMIlZcbn08gSUUpsdRTcEbY+krK1AxTz6EMA1stpjgtuGLBEmSN/77wZ0GXTKxh+jYrDz3Au8i4RAqkbM4GjZEE2T6A5P9FxlxkbfOYip8adjo9NC2JuVfEWkXYmIKYuFcbcpwzT0hU/g+O/bC+Tc9c8a0iI7bctG8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773202476; c=relaxed/simple;
	bh=nndBuIvvvc8s3P+94WWplXSwKQrlkxY1Dk02gVlifk4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QYgr0UO9edWsqXwa9hWyKoy0fbwsxY3/uY0ZyRtkIMmLqd9f2wqGkVHVKrEnuU8nSmq41NcrbeCw1wAIMeFnhR9IxOKWA13iZibUNa3XFaL4wM/WBSOGU+NeSpeOpaN+vVTrtnLi1UTAt1Xjpy/u1tzw3B9e1EQcGwKz+umQc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.22.86] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowABH8WwC7LBpnxu4CQ--.2041S2;
	Wed, 11 Mar 2026 12:13:55 +0800 (CST)
Message-ID: <37d9cd62-da72-4dc4-bc08-48d6e26c5222@iscas.ac.cn>
Date: Wed, 11 Mar 2026 12:13:54 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
From: Vivian Wang <wangruikang@iscas.ac.cn>
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
 <20260303182103.3523438-4-sashal@kernel.org>
 <e393e07f-368f-4b38-b2ed-937ddcc0a217@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <e393e07f-368f-4b38-b2ed-937ddcc0a217@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qwCowABH8WwC7LBpnxu4CQ--.2041S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWfZF48ZF4UGryUWw4kWFg_yoW5XryUpr
	98Kr1DCr48Jw4fA34Svrn8Zay8uw4kGa43Jr97Zrn8AF40gF4ktFySqF429r1DKr9YkFyx
	Xw4qkFWDK34kJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU9ebkUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Rspamd-Queue-Id: 2F50325BDF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.572];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11816-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On 3/11/26 11:34, Vivian Wang wrote:
> Hi Sasha,
>
> I've been trying this out and AFAICT this does work perfectly.=C2=A0Tha=
nk you
> for this.
>
> There are a few oddities I found:
>
> Firstly I've been building with something like O=3D_riscv out of
> convenience, and the file names have an extra ../ in the front. (This i=
s
> just me exiting out of init=3D/bin/sh.)
>
> [    2.317268] Kernel panic - not syncing: Attempted to kill init! exit=
code=3D0x00000000
> [    2.320283] CPU: 0 UID: 0 PID: 1 Comm: sh Not tainted 7.0.0-rc3-0000=
4-g8ad18f1a1a2f #31 PREEMPTLAZY=20
> [    2.322048] Hardware name: riscv-virtio,qemu (DT)
> [    2.323220] Call Trace:
> [    2.324465] [<ffffffff800172a8>] dump_backtrace+0x1c/0x24 (../arch/r=
iscv/kernel/stacktrace.c:150)
> [    2.329061] [<ffffffff8000241e>] show_stack+0x2a/0x34 (../arch/riscv=
/kernel/stacktrace.c:156)
> [    2.330334] [<ffffffff8000fe32>] dump_stack_lvl+0x4a/0x68 (../lib/du=
mp_stack.c:122)
> [    2.331462] [<ffffffff8000fe64>] dump_stack+0x14/0x1c (../lib/dump_s=
tack.c:130)
> [    2.332571] [<ffffffff80002a88>] vpanic+0x108/0x2bc (../kernel/panic=
=2Ec:651)
> [    2.333674] [<ffffffff80002c6e>] panic+0x32/0x34 (../kernel/panic.c:=
787)
> [    2.334427] [<ffffffff8002e97a>] do_exit+0x7ee/0x7f4 (../kernel/exit=
=2Ec:930)
> [    2.335194] [<ffffffff8002eade>] do_group_exit+0x1a/0x88 (../kernel/=
exit.c:1099)
> [    2.335945] [<ffffffff8002eb62>] __riscv_sys_exit_group+0x16/0x18 (.=
=2E/kernel/exit.c:1129)
> [    2.336763] [<ffffffff80b3e868>] do_trap_ecall_u+0x260/0x45c (../arc=
h/riscv/include/asm/syscall.h:112)
> [    2.337765] [<ffffffff80b4c034>] handle_exception+0x168/0x174 (../ar=
ch/riscv/kernel/entry.S:233)
>
> This is fine by me, but I've seen mentions of O=3D builds but I'm not s=
ure
> if it's expected.
>
> Also, toggling CONFIG_KALLSYMS_LINEINFO seems to rebuild every single
> file. I haven't debugged why, but is this expected?
>
> I have a few ideas about the code as well. Since this patch 3 touches
> most of the files involved, I'll just dump my thoughts on the whole
> series here. I want to note that I haven't read the RFC thread too
> carefully, but I don't think there were many comments on the implementa=
tion.

Uh, oops, I just realized I was replying on v1 not v2.

Most of my idea should still apply. One notable idea was the module
lineinfo header offset/size one. I see that one of the things addressed
in v2 was the alignment after compressed data. If we'd been using
offset/size in the header it would be just, code-wise, one extra .balign
4 and done. No need to fiddle with alignment when decoding in
mod_lineinfo_file_offsets_off().

Sorry for the inconvenience.


