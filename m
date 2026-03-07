Return-Path: <linux-kbuild+bounces-11646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ16AZKbrGnlrQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11646-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 22:41:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DC22DBCB
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 22:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D239B300AB3F
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 21:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233392EA171;
	Sat,  7 Mar 2026 21:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="PNV/PUWd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1FE31354D;
	Sat,  7 Mar 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772919693; cv=none; b=ehhT1nxpXAcu0gNGfII3FsMzat9i0TERp+7PGxWaFraDVFMtaKBjFIN4nVq2xv0E5mt1mEepjCmRYCjLh0l7XNx5tNNj2nx82MrAetcmVg42LiIl1G76u5z0zuCr7REb0XNNCNN08P6nr5Pwe6fzuScz8WDnfkBXfQrb0Q/w0UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772919693; c=relaxed/simple;
	bh=haZHmRtFWguFXYuVi+kNMiP5Po1Q2CjXX1MomAUbPfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToqPLxqZ+5vfF7/Zxd+lVw2i1Vr0bmC16ALdXKGLNpzVI5rLB/UPbax4LaYPOabd7X9AeHQxs9ZHHdOw1uKw8h2ut+LzvAfjjPMA+ZUBYeuLBWokciTHJeS3gJ/xHK73yx2rugPqjO9KIdfsJ4WwD4AETzGjQevTT7NLKHFqrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=PNV/PUWd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772919686; x=1773524486; i=deller@gmx.de;
	bh=L4i5u1BDZWzo41+c1LLzpiTehQAqFUbk80A35bBJIWg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PNV/PUWdNAxVD25gWmBj2dAR31//+KLY+3O+jZHV6LSI+tllLAXwMOVJ5we5WP1L
	 2bDcOF/2KJLGqC6oZB6j3qB4tvWqFQ3z4RHVg3Q1Bq8rF8KQIAqeQDaLRbI3V+LjC
	 Di8DJqDAopE5VFONef6WIxOYX5xVG9Jzq/kQAaZprdWluSCiByujkUQLBJsLHXRAI
	 xGdNAWg6DrRquc6DjWoWz3VtkpVn5esoaWVsGot5l3la9188cK11H58tGq80ZEBjZ
	 JeZJvhyaPQdXnZkg670fEIjl2v2do03/4H5ZVJpiAk8PfFbaWPfcEsedin8cJlvSB
	 0mYPBy6+ZoX3/f0sNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6e4-1vRHPn3xJm-00maMr; Sat, 07
 Mar 2026 22:41:26 +0100
Message-ID: <3ab0cad6-bf55-4ae5-afb7-d9129ac2032e@gmx.de>
Date: Sat, 7 Mar 2026 22:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] kallsyms: embed source file:line info in kernel
 stack traces
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
 linux-doc@vger.kernel.org, rdunlap@infradead.org,
 laurent.pinchart@ideasonboard.com
References: <20260307172022.460402-1-sashal@kernel.org>
 <20260307172022.460402-2-sashal@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260307172022.460402-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PvUl2T444Ogel2P/iGqwtN5OmUe2RPJAz6SqwuJDcI0nRLAAd0M
 FiSCRYpOgtdJuUxKoNk98LXA4aXiQHqvPM5S9X5maGAxNosgZ5HtVqZmxrqLswqN9Kg9Oas
 y6ReRth4R3B+T1am4LxY+opJfD4R1tnKZGpV79OXWH7Aw1Y1l2itw3s81NUJbkk4W3OIy2S
 VpHFhT3EtlhIC1QMY4PuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qoqPwtua3e0=;fUyGifMOukJZ5K9ehp0GBY7ybC/
 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
 fXo9dXqQkvxBhVrNQ+3j
X-Rspamd-Queue-Id: 7B1DC22DBCB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11646-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.846];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gmx.de:dkim,gmx.de:email,gmx.de:mid,localhost:email]
X-Rspamd-Action: no action

Hi Sasha,

On 3/7/26 18:20, Sasha Levin wrote:
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
> [...]
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Shows relative paths and works OK on 32- and 64-bit parisc kernel.
You may add
Tested-by: Helge Deller <deller@gmx.de>

A few notes/suggestions below....


> ---
>   Documentation/admin-guide/index.rst           |   1 +
>   .../admin-guide/kallsyms-lineinfo.rst         |  72 +++
>   MAINTAINERS                                   |   6 +
>   include/linux/kallsyms.h                      |  32 +-
>   init/Kconfig                                  |  20 +
>   kernel/kallsyms.c                             |  61 +++
>   kernel/kallsyms_internal.h                    |  11 +
>   scripts/.gitignore                            |   1 +
>   scripts/Makefile                              |   3 +
>   scripts/gen_lineinfo.c                        | 510 ++++++++++++++++++
>   scripts/kallsyms.c                            |  16 +
>   scripts/link-vmlinux.sh                       |  70 ++-
>   12 files changed, 799 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/admin-guide/kallsyms-lineinfo.rst
>   create mode 100644 scripts/gen_lineinfo.c

> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858afd..c94d8f332c5df 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -467,6 +467,54 @@ static int append_buildid(char *buffer,   const cha=
r *modname,
>  =20
>   #endif /* CONFIG_STACKTRACE_BUILD_ID */
>  =20
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_sta=
rt,
> +			      const char **file, unsigned int *line)
> +{
> +	unsigned long long raw_offset;
> +	unsigned int offset, low, high, mid, file_id;
> +
> +	if (!lineinfo_num_entries)
> +		return false;

The "#ifdef CONFIG_KALLSYMS_LINEINFO" above prevents that this function
is compiled when the option is disabled.

Instead, you *could* move the "CONFIG_KALLSYMS_LINEINFO" option into
the function with "IS_ENABLED()", like this...:
+	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) || !lineinfo_num_entries)
+		return false;

That way your code will always be compiled, and the code will be optimized
away by the compiler if the option is disabled. The huge benefit is, that
the compiler will do syntax-checking at every build, so you will see codin=
g
bugs early.

You could use the same semantic at other places in your patches, and of
course you then need to remove the #ifdef ...

> diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> index 81a867dbe57d4..982557aeff28d 100644
> --- a/kernel/kallsyms_internal.h
> +++ b/kernel/kallsyms_internal.h
> @@ -15,4 +15,15 @@ extern const u16 kallsyms_token_index[];
>   extern const unsigned int kallsyms_markers[];
>   extern const u8 kallsyms_seqs_of_names[];
>  =20
> +#ifdef CONFIG_KALLSYMS_LINEINFO
> +extern const u32 lineinfo_num_entries;
> +extern const u32 lineinfo_addrs[];
^^ for exampe here...

Helge

