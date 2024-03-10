Return-Path: <linux-kbuild+bounces-1200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E168776F0
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 14:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDBB1C20828
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 13:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444F128E09;
	Sun, 10 Mar 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzPl20OU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670416FF23
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710076073; cv=none; b=LcNznasDmrbXpUFv0j5I6s5R4302bHoJZJ6hQLUqZIo4TWv3Ue5DPJ9vGfejo/atLrFcFLylCpuSXQUr5adoQQ37k3bgOUROWnw5XVXZB6KxFsOSvKA2/Ia28OZYHjcodshM00t99UpOO4ygHGZoIn5vtXSYd7t34Ow3AVzgIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710076073; c=relaxed/simple;
	bh=EV0pGCS6nvvFNZ1ftECPbULLa2ouy1Ogdb0X1IuXj7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzYc4otc+r/PQmXVwF0x/EGweivdP1MnJ7z+fbYGWK2eGmfXxeZldwsEuzLkbW7UEeNpX5Dk/5miv6yWAbhYFGHHiAt7uogYkQodrpTvU/ELHa/76MScpN4GW0Onh672d9G6y3MZyHL98rhIhK9PPfrTqxK0xWRCaLcVA2LmpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzPl20OU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6C4C43390
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710076072;
	bh=EV0pGCS6nvvFNZ1ftECPbULLa2ouy1Ogdb0X1IuXj7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AzPl20OUE+YwZ9UzkL66Bdza3eIEUiU5TC0OwbnHuitN8yKHozs9Pg//qaeW9s6b8
	 NO+Z+XpvUwu5R1cIp62eFzhS93T7ikmxyHeFXGQOl7UH0jEnH1DIUfS7zRmv5fzxdA
	 pd2HTzyXWa6zs8PA5lhvEfY/lUUNsOu/qfNQvg773JoFHi9IeLBol76qyt0yJkEDKX
	 HpSWIM8MNRYV8soPoJHSzHd5i75vuG27vZXpe91a6kAoCtsbcCfFFkCHx96WJZYlcu
	 LKGyufL7kK/ZNLYQXWEZgByvyq4R51Sv+bggdj/l1jL4YxIwdOy8S1+1Fev3YWjRB+
	 radNosBSweX+g==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so47558751fa.3
        for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 06:07:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVisDJoCjqd/+Yj5k58BM+JyuFF6BIk1htd4W49B5g2XHON/Ac1dOjRcr+DeFRyf+OHEp+18W4vU04LwplYZzeAlr81vb8+y4s9vs1
X-Gm-Message-State: AOJu0YxGRhKIFTB/5cnk/6nWUuB/STSsXPtzm4mch2NybC0v4AOn9bMX
	2HnYFCOkD3crZZcGqRiOCiPXY5CyfjMcAoVYmQloyhIT10Cb/GirKebT7sp+ds8/zoT7AyeyT2S
	slZv4ADUwlANdGNNfbJiL/TT40XE=
X-Google-Smtp-Source: AGHT+IHHMnkhXxSbyt/pUQRX+bDWOnWnTRCA1tF0RFwcgx/i+xSBgkIvh4xeDM4GfeD3ro0RS+Gqh49oRuO7eD94wzY=
X-Received: by 2002:a05:651c:1986:b0:2d2:2dbb:389e with SMTP id
 bx6-20020a05651c198600b002d22dbb389emr2967775ljb.23.1710076071119; Sun, 10
 Mar 2024 06:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1709508290.git.ehem+linux@m5p.com> <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com> <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
 <ZekFzmXKKgHYZPcq@mattapan.m5p.com>
In-Reply-To: <ZekFzmXKKgHYZPcq@mattapan.m5p.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Mar 2024 22:07:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKE9wYpmxsWLmF++yQsKAN2dKSxta+O8x6UhWhRCkTCQ@mail.gmail.com>
Message-ID: <CAK7LNATKE9wYpmxsWLmF++yQsKAN2dKSxta+O8x6UhWhRCkTCQ@mail.gmail.com>
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, nathan@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 9:10=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p.com=
> wrote:
>
> On Wed, Mar 06, 2024 at 12:20:17AM +0900, Masahiro Yamada wrote:
> > On Tue, Mar 5, 2024 at 4:36=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p=
.com> wrote:
> > >
> > > On Mon, Mar 04, 2024 at 10:57:18AM +0100, Nicolas Schier wrote:
> > > >
> > > > can you please describe a concrete problem you want to solve with y=
our
> > > > patch set?  Masahiro already asked in [1], and I still don't get yo=
ur
> > > > motivation while reading your cover letter.  It would be helpful to=
 see
> > > > your goal when looking at your patches.
> > >
> > > I'm trying to develop an alternative kernel build system for one Linu=
x
> > > distribution.  Due to how other pieces of the distribution work it se=
ems
> > > using the out-of-tree build mechanism to build in-tree modules may be=
 a
> > > better approach.  This may be abusing the current build system, but i=
f it
> > > works without breaking anything else that should be acceptable.
> > >
> > > The problem I've run into is due to the mechanisms of the build syste=
m,
> > > the variable $(srctree) gets the value "." while $(src) got the value=
 of
> > > $(CURDIR).
> > >
> > > At which point various places which use $(srctree)/$(src) ended up wi=
th
> > > the value ./`pwd` and that doesn't work.  Almost all uses of $(srctre=
e)
> > > had it followed with a slash, so if $(srctree) includes the trailing
> > > slash, $(srctree)$(src) ends up the correct value.
> > >
> > > This may be outside the envelope of what is supportted, but if it wor=
ks
> > > without breaking anything it really should be okay.
>
> > I see no good reason to do this change.
> >
> > I will not take this series.
>
> Could I get you to provide further detail as to why you consider my
> reasons inadaquate?
>
> The distribution is well-known.  I believe in-tree and out-of-tree build
> mechanisms being as possible to each other is a Good Thing.
>
> I guess I should also note, in the past (890676c65d699, 9da0763bdd825,
> likely others) nicer build output has been sufficient justification for
> changes.  An effect of the series is a leading "./" will disappear from
> many files in full build output.  As such this also matches that reason.


It is ideal to in-tree and out-of-tree build mechanisms
look symmetrical (and perhaps could be achieved in a
different way), but your approach is not the direction
I want to go.








--=20
Best Regards
Masahiro Yamada

