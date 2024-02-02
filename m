Return-Path: <linux-kbuild+bounces-764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E14846792
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 06:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0441F25591
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 05:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FBB171DC;
	Fri,  2 Feb 2024 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nStGfGl/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C717548
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Feb 2024 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706853108; cv=none; b=ITkJ3F3XYHjx7f1KWlFwthkoUdB+jo8efDsEDHtUuURBdyKFgSjK9i0NFBnRvu2TRiyHSeVf9dl7ca3BatMiJ45OZ+tJ+U4PViRE7P2fb1TwsHEE48g0UnG3c3xWHwWBYuTR0rwdbKDU0Ap+4sJs1zWD5GZthKxtEYtalb3ChiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706853108; c=relaxed/simple;
	bh=JiK10dJJLae+DOLrSmHdJpA3FOSw/UOMCjKUHxENl/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIMEVG12cNrVxoOlKZMJ1lXYjAbDzegvapzaS9Kl7VG0GQfTBjcFzBIYX5oaIfO17joT9FNCsKrzzTaRqAmIs6R6RdCaMLLdGx5EbFJS/nLJFsrwL6eqVpg8u2DAD7MlpbtOxJ+vEid46vxtlPSXHLlbTh6lem2PDHi40phpw5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nStGfGl/; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7810827e54eso113197185a.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Feb 2024 21:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706853105; x=1707457905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnkH8fJQBXfV2L2xqtoOhLvmJ1yqJf+EmJ3STRwe3tE=;
        b=nStGfGl/oxSAVCnyAioNaWByz1C9900cP/hZKkLugE6Xq165sJMC3RIOi9gZy4CY8l
         LSJ4vnmFumuf43GAQklTA/nT1V/69Y/1TacKnuOEcB+SDTP6L0bFlNgxDW42ZzbsUpxX
         xqcBWSKjaFNwLm/dKsQoQDSvS/IHmpPlbk0zGYvgbyHcCCTc65OYaR8KXPyZdCylM0vu
         UxTzvYNUy+pxQHQi4v+ccA+BYtxUJXTsxgKm/HZgYUfwGQExTaH5yUoneoXH/TVb3UBB
         3GnbJXbb4RQbWqGlQ3mY67fZ3obPOjY6xssrImzPpLGWVqXVmxvklEkqCuT9uk7eZFfA
         qN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706853105; x=1707457905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnkH8fJQBXfV2L2xqtoOhLvmJ1yqJf+EmJ3STRwe3tE=;
        b=OObaY1tpqRt9zCrlt1PIdcXgB4kdko1u5upisulobm4y9Zix0OXkuqcVSwszr010c4
         VO1BhLzYJknAfD+sx6kHUfvuKcKRm9kh0ch8Ors93L7EO3WIKiATMcMDEHedSaIushsc
         jj61njHISgu75cXRh4OPKqqYaRm2dj3mY0sjM3sqYNb2Rr2UwNn6hUBzD0j5sg48ZYkj
         2Y+4B93uwP1BtG49vl8aG1KFhG6gvR40RyBKhOTAikJ/vuyhxX70W5TYTzS3zVTDqg0X
         sCOo7ukJti0mZX0fuJ/vL+gNS6Z8WJOnVyl86Jtp6G2cIZXNLBtYHvblberoZA7Z0zxy
         PHoA==
X-Gm-Message-State: AOJu0YxJUpgD9m+ToLPUVFuXpSFM384OozbRbq48ReIzaRiT8W1m1t6K
	HM2is0B47kienmWhzAloSEOh5QcgLvr87vsRfoTHgNP/totxqlKYajsdGrRMcoTONE4nynMcLif
	lbk6JvWR+sVlNrXGVIXLg8Rc/kRwsamy2
X-Google-Smtp-Source: AGHT+IEnTlpYI4zJJkmmhbUxiUtQU3MGTWQXxW+VsYXVLG2BX3yNHnkZnEVPrjPipyk0hW0cGE4V1U2+eXGFaKKUTIg=
X-Received: by 2002:ac8:5f85:0:b0:42b:fdb7:654e with SMTP id
 j5-20020ac85f85000000b0042bfdb7654emr1283833qta.4.1706853105578; Thu, 01 Feb
 2024 21:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
 <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com> <CAGRSmLs9M+XAk6q=7s_aGMfjAHkTVEtYszsTsoBkSdwPoeTd9g@mail.gmail.com>
In-Reply-To: <CAGRSmLs9M+XAk6q=7s_aGMfjAHkTVEtYszsTsoBkSdwPoeTd9g@mail.gmail.com>
From: "David F." <df7729@gmail.com>
Date: Thu, 1 Feb 2024 21:51:34 -0800
Message-ID: <CAGRSmLs_7DjjZazExF+cjHCzaiRsrfKNh89au+nF-dkhQ79uwA@mail.gmail.com>
Subject: Re: Changes to kbuild in 6.x causing cpp build issues.
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any help would be appreciated on how to create the *.o.cmd file for .cpp fi=
les?

On Tue, Jan 30, 2024 at 10:42=E2=80=AFPM David F. <df7729@gmail.com> wrote:
>
> Thank you, I use .cpp rather than .cc, would I be better off using
> .cc?     Or, how do I create the .cmd file when building the .o file?
>
> On Tue, Jan 30, 2024 at 12:37=E2=80=AFAM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > On Tue, Jan 30, 2024 at 3:32=E2=80=AFPM David F. <df7729@gmail.com> wro=
te:
> > >
> > > Hello,
> > >
> > > resending this because it doesn't show that it made it to the archive=
s.
> > >
> > > I've been building an out-of-tree linux kernel module that has a .cpp
> > > module (plus a library that is built) for well over a decade using th=
e
> > > basic method outlined at https://github.com/veltzer/kcpp.   There was
> > > a patch needed (provided here) in the 5.x version to be able to link
> > > to the .a file generated.  That patch I've been able to modify as
> > > slight changes occured, but now in 6.6.14 things have changed a lot,
> > > I'm not sure if I'll need something like it to get to the final link
> > > but I don't think I'm at that point yet.
> > >
> > > My main issue now is this:
> > >
> > > LD [M]  /media/sf_SRC_DRIVE/mymodule/l
> > > inux/driver/6.6.14-686-mine/mymodule.o
> > >   ld -m elf_i386 -z noexecstack   -r -o
> > > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o
> > > @/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.m=
od
> > > # cmd_modules_order
> > > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.ord=
er
> > >   {   echo /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/=
mymodule.o;
> > > :; } > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modu=
les.order
> > > sh ./scripts/modules-check.sh
> > > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.ord=
er
> > > make -f ./scripts/Makefile.modpost
> > > # MODPOST /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/M=
odule.symvers
> > >    scripts/mod/modpost -M -m       -o
> > > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Module.symv=
ers
> > > -T /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.=
order
> > > -i Module.symvers -e
> > > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/.mymoduleli=
ndrivercpp.o.cmd:
> > > No such file or directory
> > >
> > > It has never built a *.o.cmd file for the .cpp module and still
> > > doesn't, but the new system is looking for it.    Could someone
> > > familiar with kbuild tell me what I can patch / do to allow the syste=
m
> > > to complete the build like it used to?
> > >
> > > Thank You.
> > >
> >
> >
> > Presumably, the relevant commit is
> > f292d875d0dc700b3af0bef04c5abc1dc7b3b62c
> >
> >
> > modpost requires .*.cmd files, when CONFIG_MODVERSIONS=3Dy.
> >
> >
> > This project does not produce .*.cmd file
> > when building *.o from *.cc
> >
> > https://github.com/veltzer/kcpp/blob/177ea052f3c52c9f85bb091235061a0e62=
0f51bd/Makefile#L68
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada

