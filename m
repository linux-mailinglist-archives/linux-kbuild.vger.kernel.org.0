Return-Path: <linux-kbuild+bounces-1040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602085F6A7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 12:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624911F2184C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 11:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E50405DF;
	Thu, 22 Feb 2024 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2FWqWvep"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B227208A2
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600871; cv=none; b=i+Y3SJyVIJMczM7WFKsc5EC3xzi02QqemrcKHl5etx/a4OnEs3cRPdaa3PDM/L147ZUdEP2Nk6bXaRqN/dYw65omszk0bJXZglKM9lv+VHeeVbylOKR8zkJ/8K//9iMb0TOMqBWSYybRqztCbhWMw8MoV7Que/92qdXup8WrW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600871; c=relaxed/simple;
	bh=9Pqfn0qC+Yj0+qJNWDK84EdmrphKvk4v2jyMlAkwfrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CW9V1o7xmbXvXn1g+/xcRbaPR283pr5TZY02zgUEZPuEasYi9lPIdMzMDyDdoaw8UfqYi71GSn2W9E6iqUDYlmOZrdeLtLInzuEVY0agdfZx2T7WsaCb5ByuQp/1vjzqPSpehl9m0Q8sblwTsN8BnN9KIZHaVRYFBlB9s0X619c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2FWqWvep; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5650c27e352so8671a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 03:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708600868; x=1709205668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SjcXiN0HSEY14VbtkYXT9a2V6mhrgFrbcQEYTI562s=;
        b=2FWqWvepbEwV3t9/82tcf+XsbCGiEcCpFv900lXJ4xI/+rMYHiELH1cdVOoieUx5cn
         pH2Z2sAyPWH5+KYQRvEmdmKo3CmvqObtbWdeTpH33pnrI8whJZNmmh3yeTJqB+G9kt09
         a6QuRNORuy/PPsEoUMQ9NVgHETRezA5vW13BhfMO0o4I0qRNMBD52G6NsWY1rNO+Ke3g
         kA/6b1KWzqajMNqYjkqcHM4cle/0cvVP8C4w0ruT5QnNOHw4t94YFpPNqGdYKF635YEK
         P/NhXeG8fEgFEWf/MaAf1oVajhyNwuNCXzQLQ+8FhT2T+Gse+25WjMebdjCsRK6ZsofH
         jAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708600868; x=1709205668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SjcXiN0HSEY14VbtkYXT9a2V6mhrgFrbcQEYTI562s=;
        b=WNaAeOezWXtJHHVTybW6nbywwWfrscHw4GmIcvUl6H6Y4YBpFCe08z6Mnt2urNoDrQ
         yJvZaB7BF07tplowvsXh0h4B1Phf43Y1/xq9qrcl+K2394shZY5l5GndYsDXCgiEqO9e
         wCrLPzlHcCoWGlU7/ltL34pOdVZ0Rx0UPDA1LTH/Vmu9qec/kGHptRv9GeGzwwOhBWQt
         ipRyC4GbdxJU8zsatUYEcOX/ptbwPe4OvJAZWdRI23LCDcVxCfSHcep9edKs0N7iAJtM
         4eX0o2tJVXm16fA3w54C3/xN8ZEWtL0QgFy39x56gXyx8LUzpzzaI5TWkO+ZS6+Sm1Cl
         0h0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbxV+A3seYoHMLQish3Yj5tUr/6UBqTkssjveIgrjWkLJDCTuTHqFH2ktFHe+KjbgNwyuSKjdTXtTKbUzlTNgthUCXIlevAYvDnMf1
X-Gm-Message-State: AOJu0Yy5pOZ8DRGmPUZZlgJl65pPWzlg7BORHSRYbqQrJ383Q3thfGuG
	tlJemh9C8qVTZWTVYx6dFPSs6eebC2U+v937WeCmCOArZlxCdZyaaQ93wvQc+I+qamqw9vOQpEE
	QVNF1MffBLCCItDv2yv+HO8LHtDMyvuO+O/Nr
X-Google-Smtp-Source: AGHT+IEcTG/GdWgu9Ui4LLjkbYfNdp0E+FczKDajRVi7qSQMUwu9HMIX4CuPOYE4s2ORF/roDBrhCKNx3PhP6c+3YKo=
X-Received: by 2002:a50:cdcc:0:b0:560:1a1:eb8d with SMTP id
 h12-20020a50cdcc000000b0056001a1eb8dmr322200edj.7.1708600867697; Thu, 22 Feb
 2024 03:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221202655.2423854-1-jannh@google.com> <20240221202655.2423854-2-jannh@google.com>
 <CAK7LNAQG_dX8p0Lch-wg8cOVRQzaJUh2zFJL+3tgpcT8_iSTow@mail.gmail.com>
In-Reply-To: <CAK7LNAQG_dX8p0Lch-wg8cOVRQzaJUh2zFJL+3tgpcT8_iSTow@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 Feb 2024 12:20:29 +0100
Message-ID: <CAG48ez3Kg+BPsf_gWhm9E3QwOOw_CbTnHJ828Df41i1_EYrxnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kallsyms: build faster by using .incbin
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:07=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> On Thu, Feb 22, 2024 at 5:27=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> >
> > Currently, kallsyms builds a big assembly file (~19M with a normal
> > kernel config), and then the assembler has to turn that big assembly
> > file back into binary data, which takes around a second per kallsyms
> > invocation. (Normally there are two kallsyms invocations per build.)
> >
> > It is much faster to instead directly output binary data, which can
> > be imported in an assembly file using ".incbin". This is also the
> > approach taken by arch/x86/boot/compressed/mkpiggy.c.
>
>
> Yes, that is a sensible case because it just wraps the binary
> without any modification.
>
>
>
>
> > So this patch switches kallsyms to that approach.
> >
> > A complication with this is that the endianness of numbers between
> > host and target might not match (for example, when cross-compiling);
> > and there seems to be no kconfig symbol that tells us what endianness
> > the target has.
>
>
>
> CONFIG_CPU_BIG_ENDIAN is it.
>
>
>
> You could do this:
>
> if is_enabled CONFIG_CPU_BIG_ENDIAN; then
>         kallsymopt=3D"${kallsymopt} --big-endian"
> fi
>
> if is_enabled CONFIG_64BIT; then
>         kallsymopt=3D"${kallsymopt} --64bit"
> fi

Aah, nice, thanks, I searched for endianness kconfig flags but somehow
missed that one.

Though actually, I think further optimizations might make it necessary
to directly operate on ELF files anyway, in which case it would
probably be easier to keep using the ELF header...

> > So pass the path to the intermediate vmlinux ELF file to the kallsyms
> > tool, and let it parse the ELF header to figure out the target's
> > endianness.
> >
> > I have verified that running kallsyms without these changes and
> > kallsyms with these changes on the same input System.map results
> > in identical object files.
> >
> > This change reduces the time for an incremental kernel rebuild
> > (touch fs/ioctl.c, then re-run make) from 27.7s to 24.1s (medians
> > over 16 runs each) on my machine - saving around 3.6 seconds.
>
>
>
>
> This reverts bea5b74504742f1b51b815bcaf9a70bddbc49ce3
>
> Somebody might struggle with debugging again, but I am not sure.
>
> Arnd?
>
>
>
> If the effort were "I invented a way to do kallsyms in
> one pass instead of three", it would be so much more attractive.

Actually, I was chatting with someone about this yesterday, and I
think I have an idea on how to get rid of two link steps... I might
try out some stuff and then come back with another version of this
series afterwards.

> I am not so sure if this grain of the optimization is exciting,
> but I confirmed that a few seconds were saved for the defconfig.
>
> I am neutral about this.
>
>
>
> For the debugging purpose, perhaps we can add --debug option
> in order to leave the possibility for
> outputting the full assembly as comments.

Hm, maybe... though that also involves a lot of duplicate code...

