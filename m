Return-Path: <linux-kbuild+bounces-12223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEUKEheowmkyggQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12223-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:04:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B97317AAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F11A53076797
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 15:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F258E402B8F;
	Tue, 24 Mar 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siUVWbSY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB394035B8
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364625; cv=pass; b=Kxqg7tFdANkoeY9bhJrll8dYeh2U9mdZjEBxjCXaWf9mXOrvTOdAoFIcyaHeLmIw/hyUvTa108aNCt9tNKtr88DfLjf1Gku19VCDDkaOACwPSrI2LtRBwJyzqwBQkYR3/wrIekpeKyXxoICJCETHqwnNkYT8oiHsQoSF3bt/Wvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364625; c=relaxed/simple;
	bh=pGbN+jWmTUnUhmVdSv4PjGYUGPR4AJuGRrmDZfe9TOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hg2NwJWeMyOsaLAMwZJbdgjVPp/+nwVTRdH7SJutdEUprmFE0dkhnsY0SoGQMuclcXor3/910ZdazuRfW1iN9TJ+Hrh3XZ8FwwXWMLsbmibxZMPF7KzRy7s8PtsYq6xIv1JJZ3MfUAd6zfLsBD8qKUDyKANSH0d05uLhtd+sx5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siUVWbSY; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so1362126f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 08:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364622; cv=none;
        d=google.com; s=arc-20240605;
        b=UW9B70zlI75bT8Fbhqsb/PH1Dt4mYv7zgkc09Gx0marmkxsMYtCE+Av1wvvKzwocTj
         p2vfQhtNRer7yiGrqzvnMJ7h6E6T2wII4f5AdNbJJoyOT26j7Om8+yQCpfKpowJgrrni
         bLGe5SFwsMz5Yl+yhW+Cj13N/PLq9mkdebtI0gemSAcQV0ptBqySWsj2oiG9QbLiaAlU
         g5YfdJO2I2r3RvwSq3LNWC6v9UFyJ83gk0Ny5up2i9oA9/SFaAqth1l9IAii+2o2a8DX
         ubptKN/Ch+ktEPZNSreQKFIBHeUD+upg3lHMkQf8CA3k9MKElxYTjnmkJv2hqLMnxR+G
         jm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        fh=sAQ3dgR4YQhIOgMxOZPh76j2bRNxtKxaltdmSK5AJX8=;
        b=S8zZ+QFTh4NTRGo6UJX2n+bwQe6P9WMVcAEkn52ojAYEP+zIcWParQAhBhtJrzZePY
         kNQm5bWouYjt+M7KvWz9Muayc0udYlZ11C+cwYtXhBH4K0J7AVmupR/aJG79O/sl3qPY
         uxacaS4wKRVNOdL8mT/WonFFjXZ+3SBlTSI+JDjfja2ktHZwW1Tr1i5gx6oeqURvCZHG
         nkj/od+qA4fhv6fg+PWW6krhIszDJMaGWVDTCcUAuSOxBR7Xz5paLtWd/P9SRKHYDH/V
         O06/oFiOLLu4Oh1E3Ga0Gy54aWzAS2u3Kq8vEYukRABoRJ0DJcoRdhrOUqL7DYXhGVzI
         ovKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774364622; x=1774969422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        b=siUVWbSYsavvuxYNjP/noYbF2sxVqbJG6PaAsB9okjKvG4Aw9y6LDOLp5hiqMfM5ke
         tD7QxgOChmurznz/jclKWPLualaCjOt5+yIbyBsTzQrH8ogjBbxzmJa5C8IqbKDGzY+0
         N+rxbhTOA+aJX1jJnKSgnOpsxYDj//mNeWklMxXUWL2ohm/SMETvB9MkMIxLq+Ea+jwX
         zv6TnqozUCoU6aT8Fks/btbFo1BwM1nnYq8JI50vzsGEvC3hFeDGsq6VNFp/iYvbmVmf
         bS/6Yx1EwlafiRevKRIo34SPtKeyi5qBkiydVySWmV8KG+ynX0l7s0PnX6AY63fMduCQ
         mUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364622; x=1774969422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        b=pgIhBxKbo5UdwUs8McGPZHYEYRQMVMsPYfnAjXAn86CwhWQLw3QzRFtcAEygraPm2z
         8h41Z/FLLLZ+BlcvxgnYcwuMtCvk5obFMgMgiA0Gc/9t4zRQXqq9wbgcHQDAodDpVkWl
         Bs9K8RT2LTPc5OvTBlRCFroSYkjF6LBeftZf9cnYSNNFvP43RsZapIhuTQUk59WzM6n+
         jLPssl62zu5ZKdRRBRQJyhO5K0p2KhksautNqRUHBTGTJQSB7JQNp0Y6auPXG/HTnx9R
         8KixEqePwbu90OHy2F9pf437NAb9eGtn5i3Rivy5nhZv0lQfMCRNMuRQueE1rPkjKHJL
         8rkw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBxgLt7IAZ3mm7bKQ//7GyHbtvj2f0iZiWQGoIG/qXPgFb9AFFNam0IlQOrZDqCO5hZDPHKEMG+JXzQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/b1plLoGndx5flVJxfS3556gBVfjwaPCWzGQpLcBN5XHpPO0
	LTfKWEGeIPSjf56zLlr28BLrdhbDufJX/sjn+fnXIJhHOI2Z34vsBHReDM9mB6j6/elhB52Skq8
	eLKLVqTt5Xrq/hwSwBK1nGlKr+ZdjBWc=
X-Gm-Gg: ATEYQzxPOTc3yiq+46hmnpWxcjHL9wxK7tJvBvKRivKQTjxvdfxqPCokKFnqYeMsnmO
	HsykWvM7NFmeDVKJC5PaNaTE+j/VCoepI1bHl9dZJHO+OLSBzIasgYbabOKNCGKEMfV4BlZqWQL
	U2M1VroGM+6OGncu8OqHuFtOREasPm3jYf8HNqVqn8tDCrlZsGhbg6Fb+qojNEJzBJyXx3fWAEH
	JaQDXrTzrSng5yzFpv8LHGX0hLd1O9g8omCaWlAP+iBoSijjkZxiGl66IraLFg0to8ofjrkWfR6
	jK4g85Qfxbm+ErFPIDW8mAHojLIEI/JgBidp/5SCeoBCNgy6H4EBEzseq93+00uIVdb2Z99ZOS+
	vg1PC3UCG4y8MwUfOPwC9kr0cMA==
X-Received: by 2002:a05:6000:420e:b0:43b:5231:e94a with SMTP id
 ffacd0b85a97d-43b6426580dmr25272373f8f.30.1774364621590; Tue, 24 Mar 2026
 08:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-2-sashal@kernel.org>
In-Reply-To: <20260323164858.1939248-2-sashal@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:03:30 -0700
X-Gm-Features: AQROBzBtYHLNynVUYaVr0FFPgK1a9gR9szjQmqF2fXdYPXYOTswB5hwZbCigrcE
Message-ID: <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: show function parameter info in oops/WARN dumps
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Gow <davidgow@google.com>, Kees Cook <kees@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Juergen Gross <jgross@suse.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12223-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,hansenpartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 05B97317AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Embed DWARF-derived function parameter name and type information in the
> kernel image so that oops and WARN dumps display the crashing function's
> register-passed arguments with their names, types, and values.
>
> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
> parameter names and human-readable type strings. The resulting tables are
> stored in .rodata using the same two-phase link approach as lineinfo.
>
> At runtime, kallsyms_show_paraminfo() performs a binary search on the
> paraminfo tables, maps parameters to x86-64 calling convention registers
> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
> and value from pt_regs. If a parameter value matches the page fault
> address (CR2), it is highlighted with "<-- fault address".
>
> Integration at show_regs() means this works for both oops and WARN()
> automatically, since both paths provide full pt_regs at the exception
> point.
>
> Example output:
>
>   Function parameters (ext4_readdir):
>     file     (struct file *)         =3D 0xffff888123456000
>     ctx      (struct dir_context *)  =3D 0x0000000000001234  <-- fault ad=
dress
>
> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEIN=
FO).
> Adds approximately 1-2 MB to the kernel image for ~58K functions.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Nack.

You asked claude to reinvent pahole and BTF and it did it
completely missing years of fine tuning that pahole does.
dwarf cannot be trusted as-is. pahole converts it carefully
by analyzing optimized out arguments and dropping signatures
from BTF that are not accurate. This work is still ongoing.
For example see this set:
https://lore.kernel.org/bpf/20260320190917.1970524-1-yonghong.song@linux.de=
v/
pahole isn't perfect, but what you attempted to do here
is just broken.

