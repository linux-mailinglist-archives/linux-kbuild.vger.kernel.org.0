Return-Path: <linux-kbuild+bounces-13308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDCpCRx3EGoZXgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13308-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 17:32:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0C5B6F0E
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 17:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 275F63002318
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 15:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E288342532;
	Fri, 22 May 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMKRO0UR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A933D4FB
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463960; cv=pass; b=ZzSAHYSysgYbfokF0Dbm4cUVCClRc14oKksN7a3ctYknpg8hGS8lbgEB20BrtX4EPsRVKZE+nadyI5Sf9nCMPX05Uaa6b6WxAbJnfLQBH9ZJhtuILsiVdEpGUSFwqCZb4rUNOo5Pq+OhMt4+kCG94/Asg9nUY2TKt8oOhSH57RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463960; c=relaxed/simple;
	bh=a9VS412HjFSA9q4crKDon66e2bzVF7Ac8ki81ngingg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqGPQZ/l/a5Uz5WvSK+dtWdb97we1PW9KKe6K2MLoRrpzI+S18IPABbDErEtqWZpfroCz8L5UmoJz2gGjRg6YDEUYKO00XcXAkK0Wa5Yz29g5/i94PI6FIVBKY/lu6Ex8HKv6zihbcodLPozbCgak+DUJzutNTrX4F+9SRJJFZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMKRO0UR; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so311a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 08:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779463956; cv=none;
        d=google.com; s=arc-20240605;
        b=fAdJk8zNwwXSVKD68ZfY9sYpZmlrMAFcLlxGy5No9Gv0f9VNrpGv7rLTWjaiq/xVza
         dPCAdrKcDbjKkpp1K3lr+nLmnpu0chAiDFBdKz8jmpEAyQXrm8sTMfom5YYgjr7/Svdm
         3kFCnTuxFMLmz/AjHjeoOHypeucZPiaRJf8vjLND7khdjpzMl2h8KCKcX+NfWHjnk3aN
         nZ2MBDFfaiSZJYDZRpZ0rzKvC49rxfMP5IFDnXRU3LbqBtt6phacu18h1K9USFXYCM9m
         KNc0w5yIpBzH4rx3BIlq6Wr9Y83BgXEkaX+pO1PoNRPruZLVnZCPF2JLMleD1XGS0JtG
         wq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        fh=dzKeSLXXRthRRDUUrz6MSqjre5XSaw652kJi+XBfVT0=;
        b=ETVfBjlGsAl5Ui4sXnk2b0GghjsxAYpz3HBIA0H2PEBF4/V40Rrq5Ydh/I25WmUsIj
         iIMrvRaCR2q1GtHjneF3FD5WLRk4DiJct3Q5FYfmZ/0a2HihsiEpS4ilKkE/++i2+20o
         n/QyCoDk62hB9Xd4nvCSxFcAMF6iyVUsLcayA2Nlo6vAtaGKNJMwB8Syr7ddWg7EafcP
         fdzS3TS8wohk9F2oODGeBUCn70FQDSzmTBUZp/2/a1E1fJZYRTBr8fF2PE9F/cOmLVB+
         a+WGVhlCAHvheUk8RW8Hts3e8+dhbH2aN5swZgQS6waZdZtg6+z0/bfTqrUEm0uDQnUu
         K1fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779463956; x=1780068756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        b=PMKRO0URzxThTlfR/XO0S+0DhNjaM05KaA47E9t5sM1uU6q2KLvvVJulfGrQ91aM4h
         kyj0ZsCzTOdJlTjmJqEf8I/lExnFxGri7yOPNOTe5hn+qCIlYBgL2TrRKe6uIDuokfQq
         sfIMWl4iWSEEvODQmuJsSBXWaoAnaQZCk3U4ZtISLHRFDrqMJ3HZ93ndkfhcsUylI2J1
         QMQzO0lXaSBHQ6oaZGXUI43uDlyFN8FgMAdB4bwRbYC/juNWhwmtfxoIUGWkAoT6OKnO
         wyEcwrJHiI2Qhe4opSy3KVeRJhFFWHoE70Plf6N78RDXbSnqwyeVuOuVxw5XAvQrX1j9
         5FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463956; x=1780068756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rI/yUCYSeKg3fwrAwmuT28Ed1FRs8RkhlNNNjCcL7B4=;
        b=QMs5MyGnriZXnigQ7hgpIyZ1UGwIQ5U1uIKn8LRjAKEXO6frRNwHR/D6TYPb/zwID0
         WMVZpGhl5L+tPe5+YLQG45RYcjeqmGUD42EOWPMVVo0g+LcvZGALlOfeDYEnGBXwo6sb
         xvMWAvHFkN2rer5s7/pXvLqVNnnEm5N/HdsZqAi+YSiS3bvWPiOQrJnmJX4lLyZBmeCc
         X7dPLKkAujUW03Vy8lHScB8SzyLiKG1jWy0Qni1fcUti5y7pV0StLfShn2xx/vyEAFlB
         Bz7uxjO68qKFzE5/5MrCsG0zd5oMlCCtoPrWTuZE0clIrGGQja1vLsY2KA5lyn27AhKB
         NW1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+2LyU9YSwdrE+wr3aQCfuHLZp2EFEkzgvgcp0IT1XTcRYiIBWfkRN70CQbqtLTcM1h0ScKHGcxXGjXseo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzI/W4xakwn/5zGJi0j+x/4RG0hI163HTiVLyEiMeCtQIVQBs
	BzZaNxpAet7OJjpBhrzOLDftfWHt1oWBHL7KAF2s2a2EWo+zdRW2UNXxMqH3MJkEdmdHzNKZgCl
	qYr2gS/GOJRP50nF6u+6nWJKzsFQfZ4e4XhIorj2E
X-Gm-Gg: Acq92OG2kLxblK7TogdukNhT85C0HinrCBtxM23O7f+VcUe29C0k1UAdwDuJg4bhlS6
	lJ1JOtIXCl+qaGxONrdSkX9EUuHoTqFN2gEh6q88q45a33zV4Pkq2erImLsTg7sDAHWlcQKmZDT
	kophb7C8tRZY6vJLw8SGl3t6oy6oZMhK42cXArRTW57K28hsiYVipB69JQ2JlBoPp23b8KNh8AM
	H4yQ1RUaknQd9QZQ3DhjWeSllK8VjOvO8ldOAXYFSNRgcsEeMfYHUrozOYeUiDRwK0jH48qA9K7
	LuzDNWwlmOLy0rjsekM=
X-Received: by 2002:a05:6402:5143:b0:679:4b60:c7d2 with SMTP id
 4fb4d7f45d1cf-688b5fc3349mr44103a12.1.1779463955878; Fri, 22 May 2026
 08:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com> <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162> <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com> <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
In-Reply-To: <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 08:32:23 -0700
X-Gm-Features: AVHnY4LkDeTc8ulhes7q2m4zXKmK8ysgPXmh9U1opVtQGL54sFQJ74iKiLeEB-w
Message-ID: <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13308-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B9D0C5B6F0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 5/21/26 11:31 AM, Rong Xu wrote:
> > Yonghong, thanks for the update.
> >
> > Regarding this guard: ther is a period of Clang (before this patch and
> > after your first patch), even though ld.lld having these options
> > (specifically --lto-whole-program-visibility -mllvm
> > -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mode
> > remains unsupported, correct? What the behvior of using this options
> > in distributed mode with these compilers? nop or it will lead to
> > error?
>
> The in-process thin-lto support is landed on Feb 27.
> The distributed thin-lto support is landed on Apr 24.
>
> If people are using distributed thin-lto in kernel between Feb 27 and
> Apr 24, there will be some issues. But people typically use released
> compiler, so we should be fine.

This is not the case for us (google). We do use compiler b/w releases,
and we build our own.

What is the issue if we use the compiler in b/w Feb27 and Apr24?

-Rong

>
> >
> > I would assume there will be errors; otherwise, you would not ask me
> > to change my patch last time. In this case, I would keep this guard
> > and remove it when the minimum llvm version passes llvm23. What do you
> > think?
>
> There is no need to keep compiler version guard.
>
> Before llvm23, the below will be a noop:
>     $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename=
-promoted-locals=3Dfalse)
> since '-mllvm -always-rename-promoted-locals=3Dfalse' is a new flag and t=
he compiler won't
> recognize it so the kernel will resolve above 'call ...' option as noop.
>
> With llvm23 and later, the kernel will be able to recognize above options=
 and
> things should be okay.
>
> >
> > Best,
> >
> > -Rong
> >
> >
> > On Thu, May 21, 2026 at 1:57=E2=80=AFPM Yonghong Song <yonghong.song@li=
nux.dev> wrote:
> >>
> >>
> >> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
> >>> Hi Rong,
> >>>
> >>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
> >>>> diff --git a/Makefile b/Makefile
> >>>> index 69ccf9b8507d..26005c64016d 100644
> >>>> --- a/Makefile
> >>>> +++ b/Makefile
> >>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
> >>>>    endif
> >>>>
> >>>>    ifdef CONFIG_LTO_CLANG
> >>>> -ifdef CONFIG_LTO_CLANG_THIN
> >>>> +ifdef CONFIG_LTO_CLANG_FULL
> >>>> +CC_FLAGS_LTO        :=3D -flto
> >>>> +else
> >>>>    CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> >>>> +if CONFIG_LTO_CLANG_THIN
> >>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake=
:
> >>>
> >>>     https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
> >>>     https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linu=
x.dev/
> >>>
> >>> Please slow down and test build your changes before sending them. Eac=
h
> >>> revision adds four new emails to everyone's inbox, which is just nois=
e
> >>> when there are obvious, basic problems. 'b4 diff' shows no actual
> >>> difference from v8 and v9, which should have been caught by a simple
> >>> build test right before 'git send-email'.
> >>>
> >>>>    KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibili=
ty -mllvm -always-rename-promoted-locals=3Dfalse)
> >>>> -else
> >>>> -CC_FLAGS_LTO        :=3D -flto
> >>>> +endif
> >> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be remove=
d.
> >> See llvm patch
> >>      https://github.com/llvm/llvm-project/pull/188074
> >> which supports distributed thin-lto mode too for reducing the number
> >> of renaming. In other words, for llvm23, both in-process and
> >> distributed-process are supported for thin-lto.
> >>
> >>>>    endif
> >>>>    CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> >>>>
> >>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
> >>>>    CLEAN_FILES +=3D vmlinux.symvers modules-only.symvers \
> >>>>              modules.builtin modules.builtin.modinfo modules.nsdeps =
\
> >>>>              modules.builtin.ranges vmlinux.o.map vmlinux.unstripped=
 \
> >>>> +           vmlinux.thinlto-index builtin.order \
> >>>>              compile_commands.json rust/test \
> >>>>              rust-project.json .vmlinux.objs .vmlinux.export.c \
> >>>>                   .builtin-dtbs-list .builtin-dtb.S
> >>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
> >>>>       $(call cmd,rmfiles)
> >>>>       @find . $(RCS_FIND_IGNORE) \
> >>>>               \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -=
o -name '.*.cmd' \
> >>>> -            -o -name '*.ko.*' \
> >>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
> >>>>               -o -name '*.dtb' -o -name '*.dtbo' \
> >>>>               -o -name '*.dtb.S' -o -name '*.dtbo.S' \
> >>>>               -o -name '*.dt.yaml' -o -name 'dtbs-list' \
> >>> With that addressed above, the series survives my basic LLVM 22.1.2
> >>> build test with my distribution configuration. I'll provide formal ta=
gs
> >>> on a properly tested and fixed revision.
> >>>
> >>> Cheers,
> >>> Nathan
>

