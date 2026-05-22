Return-Path: <linux-kbuild+bounces-13314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCnmDjieEGpuawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13314-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:19:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F05B8F08
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BD3301828B
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 18:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25393368D66;
	Fri, 22 May 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ir3t2e8h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF3275AF5
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473659; cv=pass; b=ZNttn9SY08OEVLQk5KOp4u/zsk9P9wAQ04T8+Ep9Uoja2lmt1iXvi3aO2NfBX3t+GGqrKG8gGRyJrFOHZv4qhZrIszg6AGF2wCS1mEoIsGCCFsrmuW7sSKPah7d77RhJAqjVlssQ2ldTOGhvqBZtVPkT/WIlnr1S0KjJOLGScd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473659; c=relaxed/simple;
	bh=RTWW02r38+B8yR0GhIPcq4df4zXYUwN6uotDuYtqzEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1IuRUBHbOh02+1eXNVFfjRVdNjjercUbzKPmLuloX8CW1ARmy2NbejTNoAhJ20pKFq3hZkXvE+q3uFPv5GCWDmNMtiH3Snnj+YhTlDcQpphPG5OwwbNcJRSp66dC0OmN2ps+x6gSxoIu+/dxRxoHymjjXiPHstSgyQgKELlpO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ir3t2e8h; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso142a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 11:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779473656; cv=none;
        d=google.com; s=arc-20240605;
        b=QJBv/kAv5gtzypLy0CP8/opEn913g5Fw6O9p+GYjSq+6SY8HnfXkbqVj4fBnPbNxZR
         GKo1EqNBnNGROkU4JbTV6GoXYT5Xcv4KciXxF/Ph7QpOjV85FkFAV3o+TO6N/ipnaZem
         z9WRp/KivCVUB8Tm6EQYbCDOuC7bLmp8lRyP93g6JlWAyx5Wk/esEB0C7Vttapr2qiJ+
         TSQctANUQb5M9th13urYh/mQ9pDEjbnlleWgEfGg5r2L/u5A0qQUDLrKkOFRi4nmNsdf
         x35ai3MV8Bi9c9CevAeYszCD5aPRnqKt2xKADw6OcbfEGYxFFxHMl6jRbua3tGvhJY0+
         Is4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        fh=BxGypisURrFQoHaVdLkyqj7CqBhtl82nHIJe3y3KW/8=;
        b=bvbmY/JyneE9seeMESL7dJarDXtj+b2S1P83KLOk25Rm+0jPBg0UXLAM9bUdvp1L/2
         O/U68h+1R7OLmYeVT8rL6c2OlBpP2pj4BhOHfP4CnKxuD1LkOky9v2ymf1sTFiRJuNfi
         0ljns1TRsfsQi9mt4ZvmO73OoBvne1xUcyxn0jI6IvGfjG9DXsrUnSd7Cab6nEa6EHoy
         2ePzqvgndCNlE3ri63WgkQ+MsB5cY1oxQlUSxFdMtFEYONMj7l3ga29AXpJZX6WgpsUA
         ln3EKK2c7nzfE9uKsYBMLoApn7XqfPXqiDblyLitUFZSD/OFqQFLO4VJHHSxQspUg2vQ
         vcxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779473656; x=1780078456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        b=ir3t2e8hvDRlbc/iD49pMlJmYEaUf/c8UYQ33pLyoGK7GmQ2su4K5btBqeyeDJHbPL
         9Rreah4k3DRC5ukgLiE7CAqDfrNfmwR34ISIZ2/i61hYjIp12OxWcFhUbD1t8Ci22Tiu
         jLAQKZ8be0TKXWtQ9JE2L3CjqGgFgN2R7jT/SexRDk9e6Sh1CoELwznUeYcfN1ECYWJ+
         aWOcWgKcwUrLVK796Mq1RVT4BncNh3vmAYZbwdycYoEMJnFQGUMWqikJLYERQa3PwKEI
         lEIFLKAgQUjo2U+T2lNESR6loKOMOJo0hir0OdSk/iz6dRPDRk3OR50H1lwDA4ulIrUb
         K4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779473656; x=1780078456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SVOjN8nARQR8e69Dc/KabVi6lzhVRC8O4He915pda0o=;
        b=PkJJXuSyge/SWuExX/UnvMFR2ReNEMWHKUxHJFH1V3lTdvCn+8c7ZfDLCCD0aPcDRd
         hJEXeg9SRSepCxbsl1cqdW9M7xl9Qca6BHx3xMAFGnJLiGbXfNlLvnd7UHRN/T9o+5Kr
         gjk9X8ecbPZ5UlsYmd4JhAgMuzRE/4FRg+859/hYfhAYoyjbXGiY6Sah/RkIITZ7/2c8
         1ks1VRFD10tqj6PhgSZhBf8QG0HrMakRX4V4Dajz+a3TzmyA7jovnN6xOqs+40gNphF1
         pStgfDFrxVfuQf7Avus6bF0nal6JkpBxkdU/d/QvLUC3z+Dg3/LfB9fFTbY78ffXOPuF
         1rsg==
X-Forwarded-Encrypted: i=1; AFNElJ/uqNqiyK7dzNbFGn3Z06S+NU3UxZq9e2XHF0ScrWjaNH6Mw5mtyFvdYK/pdzwOepQrIEDwI5u6g45hxn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRwdIOHzH5Ij7bQx11LVR8MxHfhhdyhLeBzf5lu51zuoWZrnp
	qyKewMDqdNMjsuHl6lsKLUXNPq6vYdkaK4ki4/sD1guTHingXvIlP0eELFOKKE9y3LYqJA7ZJ2j
	rq3THD5CArNG2UMOH1aWe2tIuojZiYyeEJN5ZJ1sa
X-Gm-Gg: Acq92OHuSDz7M3U9ASvtlDDWnSi5ETwaH3QBIwz4mISnSeTJ2JPylOpQxq4kujX7S0P
	hPtRUbCHSN8Ayks9ZrkvEi1upIH1clMO5y0KoGJXEOL+WeuUYGcC4t3qCv0dxJBjunoDaPsjdvT
	LMf/U6+pVyJxYe/svktojREAyQs6acxL7gNPfr4fnmnu+ZmKiZQNfFWU9tUuvljwZgIMH+HGyCh
	rDJSBwZsy04vcPbD7k5LBzmf1GODiITg5uL/hJwM/qqCzbitsSis3A7FQeZ6QEkLEEaf7PipLL+
	ncsHgqTufnUeKrvaT64=
X-Received: by 2002:a05:6402:3047:10b0:678:93b4:1fd3 with SMTP id
 4fb4d7f45d1cf-688fd162ae6mr4766a12.6.1779473655215; Fri, 22 May 2026 11:14:15
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev> <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
In-Reply-To: <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 11:14:01 -0700
X-Gm-Features: AVHnY4IyUbfkIDAcyICEqLeddZZVv8dc-GKGofSIvTvA2_zZ32AYW60ZtIP9fZM
Message-ID: <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13314-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,o.map:url]
X-Rspamd-Queue-Id: 972F05B8F08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.song@linux=
.dev> wrote:
>
>
>
> On 5/22/26 8:32 AM, Rong Xu wrote:
> > On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@li=
nux.dev> wrote:
> >>
> >>
> >> On 5/21/26 11:31 AM, Rong Xu wrote:
> >>> Yonghong, thanks for the update.
> >>>
> >>> Regarding this guard: ther is a period of Clang (before this patch an=
d
> >>> after your first patch), even though ld.lld having these options
> >>> (specifically --lto-whole-program-visibility -mllvm
> >>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> >>> remains unsupported, correct? What the behvior of using this options
> >>> in distributed mode with these compilers? nop or it will lead to
> >>> error?
> >> The in-process thin-lto support is landed on Feb 27.
> >> The distributed thin-lto support is landed on Apr 24.
> >>
> >> If people are using distributed thin-lto in kernel between Feb 27 and
> >> Apr 24, there will be some issues. But people typically use released
> >> compiler, so we should be fine.
> > This is not the case for us (google). We do use compiler b/w releases,
> > and we build our own.
> >
> > What is the issue if we use the compiler in b/w Feb27 and Apr24?
>
> If you use the custom compiler between Feb27 and Apr24 and your kernel
> will do distributed thin-lto, you can remove
>     $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename=
-promoted-locals=3Dfalse)
> from your kernel. Since you have custom compiler, you can
> do some customization for your kernel as well.

I am referring to this specific patch -- there are cases that use
custom compilers built between the February 27 and April 24 LLVM
releases.
I don't want to see any breakage for distributed ThinLTO in these cases.

I would prefer to keep this guard for distributed ThinLTO for the time
being and remove it later. What do you think?


>
>
> >
> > -Rong
> >
> >>> I would assume there will be errors; otherwise, you would not ask me
> >>> to change my patch last time. In this case, I would keep this guard
> >>> and remove it when the minimum llvm version passes llvm23. What do yo=
u
> >>> think?
> >> There is no need to keep compiler version guard.
> >>
> >> Before llvm23, the below will be a noop:
> >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-re=
name-promoted-locals=3Dfalse)
> >> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag an=
d the compiler won't
> >> recognize it so the kernel will resolve above 'call ...' option as noo=
p.
> >>
> >> With llvm23 and later, the kernel will be able to recognize above opti=
ons and
> >> things should be okay.
> >>
> >>> Best,
> >>>
> >>> -Rong
> >>>
> >>>
> >>> On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@=
linux.dev> wrote:
> >>>>
> >>>> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>>>> Hi Rong,
> >>>>>
> >>>>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>>>> diff --git a/Makefile b/Makefile
> >>>>>> index 69ccf9b8507d..26005c64016d 100644
> >>>>>> --- a/Makefile
> >>>>>> +++ b/Makefile
> >>>>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>>>     endif
> >>>>>>
> >>>>>>     ifdef CONFIG_LTO_CLANG
> >>>>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>>>> +CC_FLAGS_LTO        :=3D -flto
> >>>>>> +else
> >>>>>>     CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>>>> +if CONFIG_LTO_CLANG_THIN
> >>>>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mista=
ke:
> >>>>>
> >>>>>      https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>>>      https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@l=
inux.dev/
> >>>>>
> >>>>> Please slow down and test build your changes before sending them. E=
ach
> >>>>> revision adds four new emails to everyone's inbox, which is just no=
ise
> >>>>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>>>> difference from v8 and v9, which should have been caught by a simpl=
e
> >>>>> build test right before 'git send-email'.
> >>>>>
> >>>>>>     KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visib=
ility -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>>>> -else
> >>>>>> -CC_FLAGS_LTO        :=3D -flto
> >>>>>> +endif
> >>>> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be remo=
ved.
> >>>> See llvm patch
> >>>>       https://github.com/llvm/llvm-project/pull/188074
> >>>> which supports distributed thin-lto mode too for reducing the number
> >>>> of renaming. In other words, for llvm23, both in-process and
> >>>> distributed-process are supported for thin-lto.
> >>>>
> >>>>>>     endif
> >>>>>>     CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>>>
> >>>>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>>>     CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>>>               modules.builtin modules.builtin.modinfo modules.nsde=
ps \
> >>>>>>               modules.builtin.ranges vmlinux.o.map vmlinux.unstrip=
ped \
> >>>>>> +           vmlinux.thinlto-index builtin.order \
> >>>>>>               compile_commands.json rust/test \
> >>>>>>               rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>>>>>                    .builtin-dtbs-list .builtin-dtb.S
> >>>>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>>>        $(call cmd,rmfiles)
> >>>>>>        @find . $(RCS_FIND_IGNORE) \
> >>>>>>                \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko=
' -o -name '.*.cmd' \
> >>>>>> -            -o -name '*.ko.*' \
> >>>>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>>>                -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>>>                -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>>>                -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>>>> With that addressed above, the series survives my basic LLVM 22.1.2
> >>>>> build test with my distribution configuration. I'll provide formal =
tags
> >>>>> on a properly tested and fixed revision.
> >>>>>
> >>>>> Cheers,
> >>>>> Nathan
>

