Return-Path: <linux-kbuild+bounces-11605-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGRaF7UDqmliJgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11605-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 23:29:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA887218E7F
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 23:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335AD301174E
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 22:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FFA364045;
	Thu,  5 Mar 2026 22:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="j2/iLDVZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8D3644DC;
	Thu,  5 Mar 2026 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749619; cv=none; b=c4xtJLNtgdlZ4NETFAWA1KoUiqWhPWG/46DY8r4xWwuOKKib9DgPplNxwPlBE03dJf3e1pEZDFgqBjqAozNJ/IS3I1pL40KP3yTz/U5HVq9cVyPdUuamfJc4Qsvfw8s2BYNbI4ok1VDF1eCCtgiNP9Iumwh9d6RXD+Zup9vZKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749619; c=relaxed/simple;
	bh=hNnMq8FvFX1nG1QXTvWJcTeDNWW6SlyE/X9uE7YrQVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wjwe56fs4TEQypKwbh7LI3J4cn7YHUxd9tn0zkwc42UtWEPo6x19Vs6tVW9yofz10YNGQKI2GN9F2CGNiI0Sw5LrnEm/64nQNtdZKBJBBpFKe99to4uMPEPUwNiTZqCjIgeFIsL9mtTBB4Zktf7W3ApCwL+u5IOGQh9a8PjrA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=j2/iLDVZ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772749610; x=1773354410; i=deller@gmx.de;
	bh=hNnMq8FvFX1nG1QXTvWJcTeDNWW6SlyE/X9uE7YrQVE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=j2/iLDVZaTbaXOOyHXgnQMc4F1gNVgViIXsC+UZpbTOhxQMARMJ/w/JLL18F2lYl
	 TfMjntlzMTvHREqD7aaVKTng8Mt7bl4/PzMA/IDcmqyCFGkbFhcNsc9NCLWKTvcSZ
	 U8OXmnBQpOgTfWE/UcEqhDOZZ7HolGnKI3+G+ePv2WmOd72vTVz9/ef01Dbzk7Yxo
	 ullYCdKAE5UYBxQqNoTVhjG2ZI/AUataZ+ruCa58EF2avaZwRiwVdd9Q0IIpJRlfn
	 34jikj1gGVUBxTCf92/+hdJqWlzmUrwug4oAomreD3GOE8AgjPOSqiYwIhgULo/9j
	 BVroSoJhPpJz8Nn9dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO6C-1vIg0A1ebg-00aBqt; Thu, 05
 Mar 2026 23:26:50 +0100
Message-ID: <eab67de3-74af-45d9-bf67-1bf2c10aec37@gmx.de>
Date: Thu, 5 Mar 2026 23:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel stack
 traces
To: Sasha Levin <sashal@kernel.org>
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
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aajoETEtX9r2XzT7@laps>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Om1G2GTK4Xx3gD0Qa7wFB75ufr2ygUf/SDR3IKB7WLr6Gt4vjC
 8pdZWwLxNJDSi/LFy+Io6dnXzE/TXA8tbID9+9YTFa98rcm4v1A0cwjTu1ymJJoFQNyBliP
 dRfw1/xxOOLikps1BJNxXGxM/qaRtPpufE7Hazhx4sgNmlFbdbOlBCchd5KM+eiOQIxnelo
 nYN0+YPJYL8Uu5koFsoZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iUKJReAxJWw=;IyGJ6xQiGL1DtIt1DLuAA6vB722
 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
 dedpO25IxRCyaXrwZJ4y6Ywhj7+eN
X-Rspamd-Queue-Id: CA887218E7F
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
	TAGGED_FROM(0.00)[bounces-11605-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/5/26 03:18, Sasha Levin wrote:
> On Wed, Mar 04, 2026 at 09:17:37PM +0100, Helge Deller wrote:
>> On 3/3/26 19:21, Sasha Levin wrote:
>>> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
>>> lookup table in the kernel image so stack traces directly print source
>>> file and line number information:
>>>
>>> =C2=A0 root@localhost:~# echo c > /proc/sysrq-trigger
>>> =C2=A0 [=C2=A0=C2=A0 11.201987] sysrq: Trigger a crash
>>> =C2=A0 [=C2=A0=C2=A0 11.202831] Kernel panic - not syncing: sysrq trig=
gered crash
>>> =C2=A0 [=C2=A0=C2=A0 11.206218] Call Trace:
>>> =C2=A0 [=C2=A0=C2=A0 11.206501]=C2=A0 <TASK>
>>> =C2=A0 [=C2=A0=C2=A0 11.206749]=C2=A0 dump_stack_lvl+0x5d/0x80 (lib/du=
mp_stack.c:94)
>>> =C2=A0 [=C2=A0=C2=A0 11.207403]=C2=A0 vpanic+0x36e/0x620 (kernel/panic=
.c:650)
>>> =C2=A0 [=C2=A0=C2=A0 11.208565]=C2=A0 ? __lock_acquire+0x465/0x2240 (k=
ernel/locking/lockdep.c:4674)
>>> =C2=A0 [=C2=A0=C2=A0 11.209324]=C2=A0 panic+0xc9/0xd0 (kernel/panic.c:=
787)
>>> =C2=A0 [=C2=A0=C2=A0 11.211873]=C2=A0 ? find_held_lock+0x2b/0x80 (kern=
el/locking/lockdep.c:5350)
>>> =C2=A0 [=C2=A0=C2=A0 11.212597]=C2=A0 ? lock_release+0xd3/0x300 (kerne=
l/locking/lockdep.c:5535)
>>> =C2=A0 [=C2=A0=C2=A0 11.213312]=C2=A0 sysrq_handle_crash+0x1a/0x20 (dr=
ivers/tty/sysrq.c:154)
>>> =C2=A0 [=C2=A0=C2=A0 11.214005]=C2=A0 __handle_sysrq.cold+0x66/0x256 (=
drivers/tty/sysrq.c:611)
>>> =C2=A0 [=C2=A0=C2=A0 11.214712]=C2=A0 write_sysrq_trigger+0x65/0x80 (d=
rivers/tty/sysrq.c:1221)
>>> =C2=A0 [=C2=A0=C2=A0 11.215424]=C2=A0 proc_reg_write+0x1bd/0x3c0 (fs/p=
roc/inode.c:330)
>>> =C2=A0 [=C2=A0=C2=A0 11.216061]=C2=A0 vfs_write+0x1c6/0xff0 (fs/read_w=
rite.c:686)
>>> =C2=A0 [=C2=A0=C2=A0 11.218848]=C2=A0 ksys_write+0xfa/0x200 (fs/read_w=
rite.c:740)
>>> =C2=A0 [=C2=A0=C2=A0 11.222394]=C2=A0 do_syscall_64+0xf3/0x690 (arch/x=
86/entry/syscall_64.c:63)
>>> =C2=A0 [=C2=A0=C2=A0 11.223942]=C2=A0 entry_SYSCALL_64_after_hwframe+0=
x77/0x7f (arch/x86/entry/entry_64.S:121)
>>
>> As mentioned in the other series, I really like this patch series.
>>
>> I tested this series again on the parisc architecture, and the relative
>> directories are now stripped with this version of your patch.
>> IIRC, the previous patch did show the subdirectory names.
>> [=C2=A0 132.840382] Backtrace:
>> [=C2=A0 132.840382]=C2=A0 [<104254d8>] show_stack+0x50/0x64 (traps.c:21=
2)
>> [=C2=A0 132.840382]=C2=A0 [<1041c0c8>] dump_stack_lvl+0x6c/0xa0 (dump_s=
tack.c:122)
>> [=C2=A0 132.840382]=C2=A0 [<1041c118>] dump_stack+0x1c/0x2c (dump_stack=
.c:130)
>> [=C2=A0 132.840382]=C2=A0 [<10402218>] vpanic+0x154/0x344 (panic.c:550)
>> [=C2=A0 132.840382]=C2=A0 [<10402438>] panic+0x30/0x34 (panic.c:787)
>> [=C2=A0 132.840382]=C2=A0 [<10bebea8>] sysrq_handle_crash+0x30/0x34 (rc=
update.h:110)
>> [=C2=A0 132.840382]=C2=A0 [<10bec720>] __handle_sysrq+0xc0/0x1e4 (preem=
pt.h:14)
>=20
> Ugh... Can you confirm that you've build this kernel with O=3D?

Yes. Both -Os and -O2 do not show the relative path.
 =20
> The RFC had a dirty dirty hack around how we turn these absolute paths i=
nto
> relative ones, but I tried to re-do it so no one would yell at me :)

Seems it is needed...

Helge

