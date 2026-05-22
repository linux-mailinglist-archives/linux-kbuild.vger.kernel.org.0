Return-Path: <linux-kbuild+bounces-13316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKNPMnGnEGqYbwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13316-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:58:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE085B93C5
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 20:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94B3D3009F07
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 18:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDFD377ED2;
	Fri, 22 May 2026 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KeeZ78d7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68161374E6C
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 18:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476332; cv=pass; b=bkck31jD9ECBPSYYkID4HYA/G6GXEJQgfhrwirTwzcVyf9+gGpCAnoNbB5WhsgsEQ4j6xBnJPCd/YxbUROQK2lCnaJTeADy49x4IQno6rWiHU0O/DFH1sV2NpjPqf7uvZGzf8R51qNpxyvRXyhmhS+pb0ec37mLe0t0/g4AcBsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476332; c=relaxed/simple;
	bh=hRFS4cmhynTPVd4GrMfoxSj6j39EY7It1MyHgoE9fjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC33A9p/q/7xJVKdqZkaVRYcZDIYMiFGDu5M3JfxdRwHX1OHWiNIvV7Qv/muFJ32mvClOk2TYTTqckt3UnFSuKVUxD8dd3xrCFORfAfbkMjZxet247Dir0oTrwBv/l2bpoPbSxNkeeDUSOIf7CEGqy/iPvA6LudZlbVHpXx0TsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KeeZ78d7; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso117a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 11:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779476329; cv=none;
        d=google.com; s=arc-20240605;
        b=f280z1Qx7foA6Y8vDW+xOMg58T3YE4fzyMygjGb3HB7yEpGYiX3uaskqVNYYgQ1AOO
         xtkyhP29VPEzDGVl99udRJ7e8irAUojg7rz64DgzCUuuIKnFP1QcYfnjsum3g86Cj+wD
         57p+SITA3bzSZxkeL2/EBuLeLPvQpQ7s9zsTt/7dIVGz4kax8QLUpT440D0UG1Sb6qqA
         W73h3jV9GyNAV0eSM/EYhW7A+GYbhoki5cuGekLffPNgHIRXyTCloZC9OxfPApvDKPPD
         jLmXuoSCQiR1XQ6fwoCCy0C1sS1a+3F13t/cyaVSJ6JWFA6GasLVfsu64gxSFXP+i74l
         Z5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        fh=E22h2HxOOjWIpsna2/WJvfJMXQ9kS3ck56Cq2FMbF9o=;
        b=kPmKys0NGMmaUQ7YaUqjRY7+Z++Eszh8oGrgwR5RJKsLeG3ITXDXHCcE6MyCmCkgme
         tgAdNgPgVGmgcrtkcs2ZvLqjwnnLDMsv2zd1HQdDZejzXGgDAl3JHhvDbX3g+cXDVyV/
         HcP73NtvBi6NJfg8wD5hs90NTsmltnPVjP4CHKyQUT742HcqYZKRX7Oix2HA8zs64z6Z
         PDb/mZwGtn2uDYKlY3p68vW/eXEza2WXoDztd7nm/cIcLcwgsa4HwRe+MNi9QBtuZzg5
         Ut4gFomV2D8b2Uq13ULzmmiboPLBVaJy+VcAkwMzOFM5R7SDmGtrCwWuhDOBNiSFjl+X
         tyFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779476329; x=1780081129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        b=KeeZ78d7mDNNtZ3PggCcoQX91qWSYN2skgvy+6s66ReKVnrei5MCenwyyXx/CHlTyw
         MfojgRKZsqKkOb/aG0Ebty3Z43Avn+N9Io/NxrVZbhl1fdtgTPCW1hPz/WODSI48gqfk
         6UDD1XNkWqpx3mva8ii1USJ4KSvyY9m6YN1dap8ZY3b52sSbG0jVKNUwcmJrz/G857ze
         Thj7dj8mj78Dw0K1kYkjrrXTfk+0bLK8RBMnfq4JFDYXJLK7xq56vs1RzbCv4YkkNj35
         k/eI1ylGFbZBjjASEcvpfw+xJ5Cjnecg7xDGGIq1b/o9qCVN0l8Ylyql6S1LDf2oS0XT
         hJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779476329; x=1780081129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMwz4z+EA6zNQCbHPb/YJJbfZgdDZSR5G08ccyLBu/U=;
        b=WPNPCIuj75OgiXwkeRabN3wprI7pciZVoX7jwTDIj0HMqr/ZN2P/s4J8kN4HLbmwpN
         Nu2kjHu1MaopITwwSDwrNa4IUxtP+eW5WlEp1hEnxnqvMfsgqB+AcsC5xBZr2Dg6oAMP
         w6xU8HlyDqLUWKSOujdhwU3HBUU35D5xnsiwSTvC1kGfsngvcePvmV0/1ejmQ142rnAy
         iqhRaLROox5FD/6fZsJkwHWjO8gjxJLAKHX8+//v9AdLgSDhs1MqhaVwtNKJbr7kT786
         nBUapPTWknKdZ/m43wnmAmJ3kgUYhg7Wru0R3kUa3ZVK2ilgZ5JfwH/LRZIA3VjXVorI
         asvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gXTg4wLr8Xit5orZhUQvCVX1n1rTBRsspM5aLw2XWTZcolBwjn2to2dpZ3tWSCE/ZV6zOX9Mo/ke9xbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIZsUKMvYzP1i6bLF9rpK+db0HOQS5njY1jASwJ1DoeilrcJ6
	T3NMkWGZs9qOnwSkW0bMa6bLuqXRaDw3DQ4mCV86o4ZR7rEpL8Hd93AyAoKmiZsOB7iUAGhT1lh
	vzBkd8fB/qtKmoQompOHjY63EQx8zrNsx/5ZKfQRf
X-Gm-Gg: Acq92OHwXEuM+vTFqI3MeI8h6FvbIkhNem+9NF+2o55GRFdaJPtbk2GWWs9k1Axfybp
	vini1gs/fraDb8UFGk+K1H4nQFMeCpIqipSQ6iTNoZuJ6qo/WVbVFGHsFWfk+gokkPpnf+yaY05
	X6u/6N6BqlB9lKc7EtTpNffvTB5N+AZbcnqmZQFiZqAiu6IFi08vuOHukazPuWiKbWaQsKDOlxf
	3NVBiWo9CljxphJ0OhwUsparO+vjZ7k5Dt7lHowopp6mGfEns56XGAbeuVgM4K21iP4MeeU63w7
	fduSKL2ujnjKReqPRU8=
X-Received: by 2002:aa7:ca4d:0:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-688fd149e71mr7025a12.10.1779476328245; Fri, 22 May 2026
 11:58:48 -0700 (PDT)
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
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev> <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
In-Reply-To: <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 11:58:35 -0700
X-Gm-Features: AVHnY4K3cFIW6JK6tgXDuCP9vy2W1rymg6sZaGXje-miO-XEwEi8PJimZKWBOaw
Message-ID: <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13316-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[o.map:url,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Queue-Id: 3DE085B93C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:44=E2=80=AFAM Yonghong Song <yonghong.song@linux=
.dev> wrote:
>
>
>
> On 5/22/26 11:14 AM, Rong Xu wrote:
> > On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.song@l=
inux.dev> wrote:
> >>
> >>
> >> On 5/22/26 8:32 AM, Rong Xu wrote:
> >>> On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@=
linux.dev> wrote:
> >>>>
> >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> >>>>> Yonghong, thanks for the update.
> >>>>>
> >>>>> Regarding this guard: ther is a period of Clang (before this patch =
and
> >>>>> after your first patch), even though ld.lld having these options
> >>>>> (specifically --lto-whole-program-visibility -mllvm
> >>>>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> >>>>> remains unsupported, correct? What the behvior of using this option=
s
> >>>>> in distributed mode with these compilers? nop or it will lead to
> >>>>> error?
> >>>> The in-process thin-lto support is landed on Feb 27.
> >>>> The distributed thin-lto support is landed on Apr 24.
> >>>>
> >>>> If people are using distributed thin-lto in kernel between Feb 27 an=
d
> >>>> Apr 24, there will be some issues. But people typically use released
> >>>> compiler, so we should be fine.
> >>> This is not the case for us (google). We do use compiler b/w releases=
,
> >>> and we build our own.
> >>>
> >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> >> If you use the custom compiler between Feb27 and Apr24 and your kernel
> >> will do distributed thin-lto, you can remove
> >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-re=
name-promoted-locals=3Dfalse)
> >> from your kernel. Since you have custom compiler, you can
> >> do some customization for your kernel as well.
> > I am referring to this specific patch -- there are cases that use
> > custom compilers built between the February 27 and April 24 LLVM
> > releases.
> > I don't want to see any breakage for distributed ThinLTO in these cases=
.
> >
> > I would prefer to keep this guard for distributed ThinLTO for the time
> > being and remove it later. What do you think?
>
> For 'remove it later', when this will happen? When llvm23 cuts the rc
> in July or cut the release in September or the end of bug fix say in Dece=
mber?

I can remove the guard when the minimal clang containis the 4/24 patch.

> If we carry the guard (for distributed thinlto) in this kernel release,
> that means at some point, we will need to do kernel backport, extra work.

I don't understand here: this is part of the distributed thinlto patch
that you would need merge anyay.
where is the extra work for backporting?

> Also, since you are building custom in-development compiler, you can
> disable this flag -always-rename-promoted-locals, problem solved, right?

I'm not only talking about me. There are other users also use this way.
BTW, even in google, I don't control the compiler that being used.

>
> Nathan, what do you think?
>
>
> >
> >
> >>
> >>> -Rong
> >>>
> >>>>> I would assume there will be errors; otherwise, you would not ask m=
e
> >>>>> to change my patch last time. In this case, I would keep this guard
> >>>>> and remove it when the minimum llvm version passes llvm23. What do =
you
> >>>>> think?
> >>>> There is no need to keep compiler version guard.
> >>>>
> >>>> Before llvm23, the below will be a noop:
> >>>>       $(call ld-option,--lto-whole-program-visibility -mllvm -always=
-rename-promoted-locals=3Dfalse)
> >>>> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag =
and the compiler won't
> >>>> recognize it so the kernel will resolve above 'call ...' option as n=
oop.
> >>>>
> >>>> With llvm23 and later, the kernel will be able to recognize above op=
tions and
> >>>> things should be okay.
> >>>>
> >>>>> Best,
> >>>>>
> >>>>> -Rong
> >>>>>
> >>>>>
> >>>>> On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.son=
g@linux.dev> wrote:
> >>>>>> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>>>>>> Hi Rong,
> >>>>>>>
> >>>>>>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>>>>>> diff --git a/Makefile b/Makefile
> >>>>>>>> index 69ccf9b8507d..26005c64016d 100644
> >>>>>>>> --- a/Makefile
> >>>>>>>> +++ b/Makefile
> >>>>>>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>>>>>      endif
> >>>>>>>>
> >>>>>>>>      ifdef CONFIG_LTO_CLANG
> >>>>>>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>>>>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>>>>>> +CC_FLAGS_LTO        :=3D -flto
> >>>>>>>> +else
> >>>>>>>>      CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>>>>>> +if CONFIG_LTO_CLANG_THIN
> >>>>>>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mis=
take:
> >>>>>>>
> >>>>>>>       https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>>>>>       https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d=
7@linux.dev/
> >>>>>>>
> >>>>>>> Please slow down and test build your changes before sending them.=
 Each
> >>>>>>> revision adds four new emails to everyone's inbox, which is just =
noise
> >>>>>>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>>>>>> difference from v8 and v9, which should have been caught by a sim=
ple
> >>>>>>> build test right before 'git send-email'.
> >>>>>>>
> >>>>>>>>      KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-vi=
sibility -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>>>>>> -else
> >>>>>>>> -CC_FLAGS_LTO        :=3D -flto
> >>>>>>>> +endif
> >>>>>> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be re=
moved.
> >>>>>> See llvm patch
> >>>>>>        https://github.com/llvm/llvm-project/pull/188074
> >>>>>> which supports distributed thin-lto mode too for reducing the numb=
er
> >>>>>> of renaming. In other words, for llvm23, both in-process and
> >>>>>> distributed-process are supported for thin-lto.
> >>>>>>
> >>>>>>>>      endif
> >>>>>>>>      CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>>>>>
> >>>>>>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>>>>>      CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>>>>>                modules.builtin modules.builtin.modinfo modules.n=
sdeps \
> >>>>>>>>                modules.builtin.ranges vmlinux.o.map vmlinux.unst=
ripped \
> >>>>>>>> +           vmlinux.thinlto-index builtin.order \
> >>>>>>>>                compile_commands.json rust/test \
> >>>>>>>>                rust-project.json .vmlinux.objs .vmlinux.export.c=
 \
> >>>>>>>>                     .builtin-dtbs-list .builtin-dtb.S
> >>>>>>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>>>>>         $(call cmd,rmfiles)
> >>>>>>>>         @find . $(RCS_FIND_IGNORE) \
> >>>>>>>>                 \( -name '*.[aios]' -o -name '*.rsi' -o -name '*=
.ko' -o -name '.*.cmd' \
> >>>>>>>> -            -o -name '*.ko.*' \
> >>>>>>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>>>>>                 -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>>>>>                 -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>>>>>                 -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>>>>>> With that addressed above, the series survives my basic LLVM 22.1=
.2
> >>>>>>> build test with my distribution configuration. I'll provide forma=
l tags
> >>>>>>> on a properly tested and fixed revision.
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Nathan
>

