Return-Path: <linux-kbuild+bounces-2835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274A948C67
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 11:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18BA1B255F8
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5283015B153;
	Tue,  6 Aug 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKW1L90T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E9515FA96;
	Tue,  6 Aug 2024 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937814; cv=none; b=WfS+IuzmX/ydoyXm6oXuDrcjqnYWa1FR5jXQ6SXyGBnjzQ9/grkKDa1GU6ucS7NFwDcltcN8htoMrfOpnpD577Db4jpnOn2J/k0ADhU27yNV+5MQtZngbEllb76YGYU8wnXmipu3TXxs0Zkbkdzpt5EtKB5EiCsJhG4FVt6zsig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937814; c=relaxed/simple;
	bh=ucoo6f54KwSD5SeHMZYpmPjZO4xNne7BCWHjR3gCdxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYQ7wv+6syKAsgBD1IX45QcuE/lXcdw4SDQFyLmnVggPTCaLFNUZejW2L0PBOEQtQuh4eNNdACbLwDNqJ31jx0dOfnHLe38pAd2u4FkEHXFewforBgsfPwhnAg0T8klV51x4vmBsOrH3PbJ0pE0R7H1WRql6pzpXJqt14msgIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKW1L90T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD95C4AF09;
	Tue,  6 Aug 2024 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722937813;
	bh=ucoo6f54KwSD5SeHMZYpmPjZO4xNne7BCWHjR3gCdxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oKW1L90TT5GCzFpxh34akZfkqpNPIUTKVhOQq0b8YnrBM7RoQsK76KzSl1zavr1px
	 fe24f91L8gDRrTGd38mM70jhqWKvfozVirArbgNZe8BrfMWoU6nKw5eWEj1Ch2Ikxu
	 Soi2xQgd441iCtHJiz6kZY9usmuGsE2OogE078LSZzbwm+t+KGO5Ivr4qxMQHjIvH+
	 mUk+SVxmYrlcZDuoRJCZEVLS4j/POjjjzFx+9IFC6wxFqKvl66WudqBmnpp/gvTgSE
	 kzWQ7x7RiJObZFICWyJ6AonUDaAveEAqIzHw7CjoTCXssRoW2aFEIsVXH2BA9xlRTg
	 hjbdFi64YG4eA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efabf5d7bso645485e87.1;
        Tue, 06 Aug 2024 02:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXweD4L6uObb/C/s3ulVll0888TKS8hi/M7Ir7ZHlooWhj9l8GpnYA8Or1iVjC3XbBiR/w1jzddfGfuy48r5zjR2opCsEmI+WjeqSI8y+HR1eQG5XPSPUrDGj2enGpJ2EnxPtpwTn7UKW7N
X-Gm-Message-State: AOJu0YxCCDHc+g8P72RNhVM9S0ymYMtNB4Jg4GoZo+pmy6Jla2FEve+I
	EPn28YvbiABAsmwhLEZ3uQTIajyRZeyuf3FPNYCBjiTfLZXlORkhUSIwqrTremse/84/lb1ip9V
	WISHCAkUWEeKh8bun4wU6KVgpTVs=
X-Google-Smtp-Source: AGHT+IHDmfEeaoMHn9wSEgbMyVwhE3oUE5/IxWnyUsHffsPs2/DlCmJRrk40n4zbU0A1zN9iMt7Y1obwj4hOYJAxV3A=
X-Received: by 2002:a05:6512:1310:b0:52c:d943:300f with SMTP id
 2adb3069b0e04-530bb3bd90cmr10650159e87.38.1722937812334; Tue, 06 Aug 2024
 02:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
 <CAK7LNARmV89PJV3sd93WwqLLQD0fg9mBOMetzECLriF8295zVA@mail.gmail.com> <D37UCSKCEVI5.100JF8WJR9DNY@bootlin.com>
In-Reply-To: <D37UCSKCEVI5.100JF8WJR9DNY@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Aug 2024 18:49:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQEXB2bnH1+yj8Xg-Xyb7x4Fi4KJrkowA8dyccyfvfPQ@mail.gmail.com>
Message-ID: <CAK7LNASQEXB2bnH1+yj8Xg-Xyb7x4Fi4KJrkowA8dyccyfvfPQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: run-clang-tools: add file filtering option
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:39=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:
>
> Hello Masahiro,
>
> On Sat Aug 3, 2024 at 10:42 AM CEST, Masahiro Yamada wrote:
> > On Thu, Jul 4, 2024 at 6:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bo=
otlin.com> wrote:
> > > +def filter_entries(datastore, filters):
> > > +    for entry in datastore:
> > > +        if filters =3D=3D []:
> > > +            yield entry
> > > +            continue
> >
> > Maybe, this can be checked on the caller side.
> > (Note, I did not test this at all)
> >
> > if args.file_filter:
> >         datastore =3D filter_entries(datastore, args.file_filter)
>
> Agreed.
>
> > > +
> > > +        assert entry['file'].startswith(entry['directory'])
> > > +        # filepath is relative to the directory, to avoid matching o=
n the absolute path
> >
> > Does this assertion work with the separate output directory
> > (O=3D option)?
> >
> > Just try this command:
> >
> >  $ make LLVM=3D1 O=3D/tmp/foo clang-tidy
>
> Indeed this does not work. It requires some changes to Makefiles to see
> that it does not work, as this assertion is only used when a filter is
> passed (which current cmd_clang_tools cannot do).
>
> What would you recommend to fix that? If we take the first entry:
>
>   {
>     "command": "clang ...",
>     "directory": "/tmp/foo",
>     "file": "/ABSOLUTE/PATH/linux-clang-tidy/arch/mips/crypto/crc32-mips.=
c"
>   },
>
> I don't see an easy way to know that "/ABSOLUTE/PATH/linux-clang-tidy/"
> should be removed. We could probably compute it from the command value
> but that isn't a great way forward.
>
> There are some entries that look like this. Those are easy to deal with.
>
>   {
>     "command": "clang ...",
>     "directory": "/tmp/foo",
>     "file": "/tmp/foo/drivers/tty/vt/defkeymap.c"
>   }


The top of the source tree is derived from __file__

  srctree =3D str(pathlib.Path(__file__).parents[2].resolve())








--
Best Regards
Masahiro Yamada

