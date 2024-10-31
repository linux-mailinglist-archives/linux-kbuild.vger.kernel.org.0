Return-Path: <linux-kbuild+bounces-4440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13249B746B
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 07:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44AC9B23055
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 06:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94749142900;
	Thu, 31 Oct 2024 06:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsHf0WBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B213D8A3;
	Thu, 31 Oct 2024 06:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730355548; cv=none; b=TOyTFLLxRHF/dFKpa//RPCNI4+ZwSRcw2RUj6oYCAbRj3Tfb6Np/ej45XblB1OWjrJDBfZ5pxAc/GzKLG0ktbGXw2+MOV5wwzYcXVDIW+x59AobHcVaPQEcL9uscYxHcPGwcr+nn+We1DwnUTPWE0XsEPqlDMVr21bd1dOx1l4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730355548; c=relaxed/simple;
	bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQqUGEbu+XTMzqeusmrEbfOJZa3s7A+4sL4VEeyulKo6LP/vVcrh5ZXF7K2+n8mi8KWt2eOK3rw6cM8r3zm+P2TZYrsm1hnMvUVyNoMvgHq+oGqWPgwvk/ppC1PD2+4EDXDNU7DjPI3iPAnSW72k6B9R6ztWIbRmdXVGpB4vq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsHf0WBF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so8203841fa.0;
        Wed, 30 Oct 2024 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355544; x=1730960344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
        b=JsHf0WBFyzYThua4mNHDC2cKLxpHqJhUdXxSEoypUuRYKeEZlfgoOKkmeDgCGflJbI
         WePNOgHi1Pz4M9/lvb9j1tBVDjbmOKYoDJ/H1/xJy9ghdQ7phDcKQ7eIlLZDyvIrqDMj
         JN67r4mpt7UiL+iRn31pGStAFvvqKI8Xs1KdpzI8qusQEknSKkBmbSMIFUAixH6G9ngb
         ugew2aB9A/jVp+n0wFdcQBu35nPMQZyJyVuLtzYDDUeEaFBvzLwipILuepWaDcfm3Rkl
         9qNvtF25zCWiq+R3bGeL1p8Pev1KC+k5hIx03e2BQi0lHXwEp5qeHzoYxIL6dBHv/QKN
         KE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355544; x=1730960344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
        b=jzUZbWpGDTi1Kn4pa49GuGJFDJ2eBAMUGTx5mq17DaP8O2e5PiV/4dPu7xkUqP8JKc
         SPR+vIHQPBpheomhOc0ORUgHt/CkLH4PCFf7WNJOYTXbzYCL1iD2NFot1KICODnaAZCZ
         V4EXliKjBIP+RS/T797aisqR7Nb5w56lj/cUgn5YWe5RcJPuSaUi24uEwNbKiKms06Ux
         V10QDEBu3n4D5ef4jK6DvAhpfsWApxdb5aAVMgVFGO/jXV2BRCg+h4IP6xd/VM54hEIi
         A6wGHcMst61G5P2AqVGQAO6xg60yf9VOumbpltW6BnMriyPCVddMjJghpxKDSsl0Z8L9
         QZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDzFH0kw7CH9hDJ1HPyGaTHD9zwYiTh2XTK0+OrudsVXGJvt34pvZpiwOIe1qvOR8VebbRSm/E7A2op/Fo@vger.kernel.org, AJvYcCVdqlINt4OeOVWnP6UVGej70L+3JZ/MbSoeypFh5TE24Ta48oAuB+zYlkkefkPMswS3x1wKNhTAm8pVFHlEWds=@vger.kernel.org, AJvYcCVvHs3tl8bukZOnFS1ExhQ7pmvQvV7GxH4QqpD/rhswvsr2hPrN0Gsiy1nn6NvZ5ULaKbLWBB7MtYNkTu0=@vger.kernel.org, AJvYcCWqogwy6HYMLbe7Nsok0JvedugyNx66B5Vm2DDiCNiufN4v8FytN4R6vRwK9tHnjgHosL4bWklJ1R9HTu1QGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWboV2DTTucniDM7uIaEsaRYUdEh3iqXjKpdMT1F8Qq5VapQ+
	BG1om9BYtQiBJH0x84Tc9m08rmuJ1vsJelq0TRnBYzroRoSwv/9zzHrbk0R1nW2tFi8IEcL3xKj
	7AxUHT20IgM8MZP1i6hvGQoDNcb4=
X-Google-Smtp-Source: AGHT+IFHxxJrlKSrgAAFWAELVctspErXwBbZUkqdQIAVIWmjs2xYQmxqsiV/CAi8amXUPGmri9GG+BeSf/deG9l51jo=
X-Received: by 2002:a2e:bc15:0:b0:2fa:c5d9:105b with SMTP id
 38308e7fff4ca-2fcbdf61167mr145428871fa.2.1730355544208; Wed, 30 Oct 2024
 23:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
 <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com> <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
In-Reply-To: <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 31 Oct 2024 07:18:28 +0100
Message-ID: <CA+icZUWRqBgqS0TpJsUumZRJMc=XRQJ=NMUj=O_WS9o2dCiBsw@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:56=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Wed, Oct 30, 2024 at 10:14=E2=80=AFPM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
> >
> > Hi Sedat,
> >
> > On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> > >
> > > Hi Sami,
> > >
> > > perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
> > >
> > > KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> > > What value is recommended?
> >
> > The usage is similar to KBUILD_SYMTYPES, you can just set
> > KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
> > versions. However, it's not normally necessary to set this flag at all
> > when building your own kernel, it's mostly for distributions.
> >
> > Sami
>
> OK, thanks.
>
> # cat /proc/version
> Linux version 6.12.0-rc5-1-amd64-clang19-kcfi
> (sedat.dilek@gmail.com@iniza) (ClangBuiltLinux clang version 19.1.3
> (https://github.com/llvm/llvm-project.git
> ab51eccf88f5321e7c60591c5546b254b6afab99), ClangBuiltLinux LLD 19.1.3
> (https://github.com/llvm/llvm-project.git
> ab51eccf88f5321e7c60591c5546b254b6afab99)) #1~trixie+dileks SMP
> PREEMPT_DYNAMIC 2024-10-30
>
> Tested-by: Sedat Dilek <sedat,dilek@gmail.com> # LLVM/Clang v19.1.3 on x8=
6-64
>

Fix email-address in credit tag:

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v19.1.3 on x86-=
64

-sed@-

