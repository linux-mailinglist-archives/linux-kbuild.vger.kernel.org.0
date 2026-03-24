Return-Path: <linux-kbuild+bounces-12226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJpCGPu5wmlilAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12226-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:21:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AE318E82
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B94BF30962F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 16:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6928E3A1683;
	Tue, 24 Mar 2026 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh6tn7NE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EE39B95B
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368259; cv=pass; b=uza9gcCMWA21EpCjB+wXQiZ8q5e36lvdEKPPl+1HeDzlsc2tckXbxvNRhSL6a/+uWqQQPArf3XzIU4x0rwJ94Sz1suVewUj+9VdcHNDO9vTLDmZIopX3LZ+29Z+IWrRPCvMmnA2VnsplGmT9V2d45iKVppOfkdEDniMPRPLk+7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368259; c=relaxed/simple;
	bh=Bap2I2Iwx1j90rJe9QRr9BlObCdTslZ+pvyg11P5Bkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTKnicdn/maOY9LfjN5XBoZWk2cayJ2xSUFZqnx9kcdeSubm1qdZI+TVmlJ1/skr8ZKakdv7IOb4vN3palo19rqvoQyoP5JZSXSL5UCnXCpazXxV7FsAWB1+cq5K3huIkDQsasbhTslWuVVlBVCFFv4P6Tw5ZXjZeRQA7u8xDeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh6tn7NE; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-668e55bd36bso4518157a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 09:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774368256; cv=none;
        d=google.com; s=arc-20240605;
        b=LS/W3dj9q230nwdj3JST5xBAPDsBTL2GlT8ZMoMws8BseIfq3Fkf/tHkEagpqrbCjR
         Loi5Om3zKZ8My8UYnvq8KmStTm+9rZ3LvtgD+4rx7izD5Bg9x5/h07nXQF8AW1F/np+d
         faqLg60uYMbB2DDpO62h+nQ21a+ns51HtMVxTZSdGuCwDd5m+zzC2YA9lvV3vxWkuavB
         yzFZfcei2VyGkDwGNHsUPXceWkou3Pa4JtcGCaCOMbg2+zO0t1AZ6sBgNgDI0ZOKTQRh
         XAwduzhjVJ6ZLEoPyNedk3IqiQah1kYn1CjfyqDn4TuCEpBNaEIYXUyn1vR794Vh4WTA
         PVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        fh=+0m3CrugnSu8NMtFJ3x/OclyKMw1g/R/1N/GeeWGvzs=;
        b=FgNF1iyi3jvVaa2s6SfcLoOmo/QWvyYBf1bqFE2k6YwFiYYXaA+RYPdTHe3bN/dLhe
         hsSOycs9ag5TIDYKO0LnUXYe0OUtnmbsN+YOCjg2Q7oZ8pEl7U+CB/UH3HlX6+InKK5G
         B9TkUNGjnax4abuPQr6wska5daLew6mXhYIwOJyXjSTtySVqw/g/B7Dmdhp6pujjl+Wh
         H0jkiaXiAAEwlIcNw9VmfoXr0QmifAjC4phYwe/Fcp1CqFtFuYYN6IhXqXU74MBFG5yg
         lC1gd9QIhTgAY+emaPRx+kJY0wUvrmbWTdWoJOjo4jnzpYwU3gocxy+bEDGiA07RAB59
         TLvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368256; x=1774973056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        b=qh6tn7NEE62HHX3lMpBe7k2khmCW7U35AtqhMprApltPlBRt9IlTWtAF584ZGtnAf/
         Rdh/SWyughatgMoucsZtjvMqa3P0la0SKGbrWMU8Z0Bf2/FGFkPPP7oLX2k4OdesqcPa
         k9k2eid1bA6w6ZouXsQd8pHUDafnTZh1tsFgaKzsXg1ZrvZ/j7c20MG3gacpDE37rIJ4
         3SWsPTR7SvHbb8DoFVhh3pSq+IrFw4VrLGJS2tlJgubFQ5R3JQS9ozUfD6ep76AFTJLC
         CbGHW2Rogx5U00e38UbbQjFENm60+9lpMFL1qLJT/nDcVxNzfczk9zreYGRLKQnKThpX
         RBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368256; x=1774973056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        b=fqlmah4t/lcnDcdJPj8WwMC7Ecj6shmt43ZS5XeeqLlhRqQhGssiUPKDdE+vN+renL
         8dQ4+gimkSjmYvDf8uWg9WJ/el0NOfpGAgP94WqSQSu8WJKeysRveXI/7XKb3+gPFSA1
         nwLhiHUHhZ5eyeQpF5LA3XoXeK0tOI+zqB+qxEgbzP4YVgF0jme+2VPhLQyhmUJl2oOM
         5nUSEPrxcJUPeGOvjSaJxm7wchrYoM05AbhCwpktdo8VlW1gSL5bzUCYE/ZhN+l3TLp1
         tH/feFldlYpkqN3NMDUyPvnKi89yUf3QEPK+EQNBWqLVwJF278aiLO+aTJA90/t/Wt5q
         EQiA==
X-Forwarded-Encrypted: i=1; AJvYcCWd3oNTua97LIExb8RrJGlH2+b1YC1xpmenYybPg57WE1um0AuHqIwO3NzxggF0tG84uLUgLm9qvYREJ1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbTwRedm2QWWXiNSxHTThag0hM7PRI4PBdRjNsWZmHmHJy6ed
	9Z1fRUrhzvd964VAoc0B35rAzRItCTZJJlxz567+lmidxYSf4S38ADQwr081AJEijhh1OjJ+/Iq
	4HPtaI3kBSoSzD0K/OCaeNIBYw+CEQRE=
X-Gm-Gg: ATEYQzxxJ+p2kaVMRnEsiY0Pp86flV9oBrLiuEJ+xOLOkVUQYgGIamWGvD57CH5Ap0p
	9/i2tb0daaJPcnjrmjZzXtYBWhMKt4Fv/JbN6l6HH99a8uePo26J0DMbmPdOeErElVkXRmggcjQ
	IJibtJOmB7pMl4YnARFOtxpaPRMhiRECgSU4qiaRmrZT6OqMZ7BT/47rjwFqNyfRuuyLLF+dDsE
	GPIYecQFvejJACjxTM9RpBFAc3aBK8ir9gvWFy1iCqCqzCrwq4YZKhunypBsIpFoWzosVkAvGCx
	U1BrKpFMdpy8viIJwLZgmisrbxChE2QHSFOHY4LjPnLMW80P+GuYCmRmYrDVdpjxuNneOA/WgDR
	3haArHb8DjlGQGiaGJPtYHHqr6Q==
X-Received: by 2002:a17:907:a807:b0:b90:8016:cfe4 with SMTP id
 a640c23a62f3a-b982f0bd41bmr1118661566b.10.1774368255441; Tue, 24 Mar 2026
 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-2-sashal@kernel.org>
 <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com> <acK1M_CvbYCtq7im@laps>
In-Reply-To: <acK1M_CvbYCtq7im@laps>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 09:04:03 -0700
X-Gm-Features: AaiRm50g5sRljE-pOlu1qkME3uHtiXscwZS9bY6E1gCFONCc9DBnMt7wYDgAtI4
Message-ID: <CAADnVQLr5Sx+vG6D4Jxm8r2vPxu7ygFz60LGwmqfkc=VB0-Miw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12226-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C4AE318E82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 9:00=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Mar 24, 2026 at 08:03:30AM -0700, Alexei Starovoitov wrote:
> >On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> =
wrote:
> >>
> >> Embed DWARF-derived function parameter name and type information in th=
e
> >> kernel image so that oops and WARN dumps display the crashing function=
's
> >> register-passed arguments with their names, types, and values.
> >>
> >> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogr=
am
> >> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
> >> parameter names and human-readable type strings. The resulting tables =
are
> >> stored in .rodata using the same two-phase link approach as lineinfo.
> >>
> >> At runtime, kallsyms_show_paraminfo() performs a binary search on the
> >> paraminfo tables, maps parameters to x86-64 calling convention registe=
rs
> >> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
> >> and value from pt_regs. If a parameter value matches the page fault
> >> address (CR2), it is highlighted with "<-- fault address".
> >>
> >> Integration at show_regs() means this works for both oops and WARN()
> >> automatically, since both paths provide full pt_regs at the exception
> >> point.
> >>
> >> Example output:
> >>
> >>   Function parameters (ext4_readdir):
> >>     file     (struct file *)         =3D 0xffff888123456000
> >>     ctx      (struct dir_context *)  =3D 0x0000000000001234  <-- fault=
 address
> >>
> >> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LIN=
EINFO).
> >> Adds approximately 1-2 MB to the kernel image for ~58K functions.
> >>
> >> Assisted-by: Claude:claude-opus-4-6
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> >
> >Nack.
> >
> >You asked claude to reinvent pahole and BTF and it did it
> >completely missing years of fine tuning that pahole does.
>
> Let's keep this on the technical side please.
>
> >dwarf cannot be trusted as-is. pahole converts it carefully
> >by analyzing optimized out arguments and dropping signatures
>
> Fair point about pahole and optimized-out args. The problem is that BTF d=
epends
> on BPF_SYSCALL, and the environments I care about can't enable either.

This is trivially fixable without reinventing pahole.

