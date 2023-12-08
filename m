Return-Path: <linux-kbuild+bounces-300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B5980AB97
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 19:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CDE61F21131
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 18:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F83A3A262;
	Fri,  8 Dec 2023 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKvYX2II"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAEE1986
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Dec 2023 10:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702058676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZQgPsmonl7Wi7hg4g+zI/qzT5CWeAjHhow4pzmW6d4=;
	b=VKvYX2IICQ5+VN3JLgrpk5dmegFo/daoxKWQXs36VB3x5/AbptuFQ7tcunJgwPBJtmJQIG
	1bAV4yOgbbL8BHcFoD+0bJffkdH9P12PKMoe/F+E3qRVNTX6qcmv3ginfWZJHwrs4fjBCO
	DNZf6AZj81TYWJh9CLOar4PZnW5vCNE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-PhJqvrxeMQ27ZSHtfR6lFA-1; Fri, 08 Dec 2023 13:04:33 -0500
X-MC-Unique: PhJqvrxeMQ27ZSHtfR6lFA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425a8465e32so4381891cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Dec 2023 10:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702058673; x=1702663473;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZQgPsmonl7Wi7hg4g+zI/qzT5CWeAjHhow4pzmW6d4=;
        b=YMkodUt7aZ23kaYavg5vKtElWdyyncU3P9lksNYaLu2mW25C/Totg42THlZIq+cGOv
         ZtvNkHqB3z7IRmVYlo6wxlTzdzf5euqDneJ6L+4Ji2npbSlQPmfDeuCmidfwyHRt9y6T
         HYPFZpFH7jA38ppX+4PaVncXnkfRbG2NW4iz7syPnW7n98Cu5ajtCkClRaL6WkD1dFam
         1NvVSD9DKO9Hrkf12phklMqQ6zu/QgqdvmQdr6th62CCAtg+I055fZ8FF5TZ3osulC+v
         i5EezOPPHCMNyEHSwJ1dzLfZNDxegV8sJC5rVW/lZecW7xb7ctGrYKieI5u4acXDWeky
         Ye6Q==
X-Gm-Message-State: AOJu0Yz6Qp0ezIu5UJLJGifu5PFzjO2cwtxPaHYOr+bbcbaSXyN/JK5c
	oLZJEw+EBZwBMqsm60bLfl9Inpy3igDM0pnLosXcLlcYHb1kOWDTpzZyCyY8ravqYksEoBVrXNC
	wENSLJEYar0NTqvM4WsD51aqLDQe5RBHxNvxAiZw3
X-Received: by 2002:ac8:57c3:0:b0:425:4043:8d3c with SMTP id w3-20020ac857c3000000b0042540438d3cmr493102qta.87.1702058672793;
        Fri, 08 Dec 2023 10:04:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcQR0AzrXqX8g8QkJ9bHKVbYFY+AcmSXI0mII0WLkYN3Ixd7BiYzX6ZGozilt9HvxSt3eT1+HOAIIlVMeL7L8=
X-Received: by 2002:ac8:57c3:0:b0:425:4043:8d3c with SMTP id
 w3-20020ac857c3000000b0042540438d3cmr493094qta.87.1702058672516; Fri, 08 Dec
 2023 10:04:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205182853.40627-1-leobras.c@gmail.com> <ZXMXOPxyx7YGB43l@buildd.core.avm.de>
In-Reply-To: <ZXMXOPxyx7YGB43l@buildd.core.avm.de>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 8 Dec 2023 15:04:16 -0300
Message-ID: <CAJ6HWG6AvwAA0e3J=oSXmjYbzqwidsPRD9SrDL==TAuONh5oWg@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v4 1/1] scripts: Introduce a default git.orderFile
To: Leonardo Bras <leobras.c@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 10:25=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Tue, Dec 05, 2023 at 03:28:51PM -0300, Leonardo Bras wrote:
> > From: Leonardo Bras <leobras@redhat.com>
> >
> > When reviewing patches, it looks much nicer to have some changes shown
> > before others, which allow better understanding of the patch before the
> > the .c files reviewing.
> >
> > Introduce a default git.orderFile, in order to help developers getting =
the
> > best ordering easier.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > ---
> >
> > Please provide feedback on what else to add / remove / reorder here!
> >
> > Changes since RFCv3:
> > - Added "*types.h" matching so type headers appear before regular heade=
rs
> > - Removed line ends ($) in patterns: they previously provided a
> >   false-positive
> > - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
> >   in any subdirectory
> >
> > Changes since RFCv2:
> > - Fixed licence comment to from /**/ to #
> > - Fixed filename in how-to comment
> > - Fix build order: Kconfig -> Kbuild -> Makefile
> > - Add *.mk extension
> > - Add line-ends ($) to make sure and get the correct extensions
> > - Thanks Masahiro Yamada for above suggestions!
> > - 1 Ack, thanks Randy!
> >
> > Changes since RFCv1:
> > - Added Kconfig* (thanks Randy Dunlap!)
> > - Changed Kbuild to Kbuild* (improve matching)
> >
> >
> >  scripts/git.orderFile | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 scripts/git.orderFile
> >
> > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > new file mode 100644
> > index 000000000000..7cef02cbba3c
> > --- /dev/null
> > +++ b/scripts/git.orderFile
> > @@ -0,0 +1,34 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# order file for git, to produce patches which are easier to review
> > +# by diffing the important stuff like header changes first.
> > +#
> > +# one-off usage:
> > +#   git diff -O scripts/git.orderFile ...
> > +#
> > +# add to git config:
> > +#   git config diff.orderFile scripts/git.orderFile
> > +#
> > +
> > +MAINTAINERS
> > +
> > +# Documentation
> > +Documentation/*
> > +*.rst
> > +
> > +# build system
> > +*Kconfig*
> > +*Kbuild*
> > +*Makefile*
> > +*.mak
> > +*.mk
>
> I'd like to see 'scripts/*' here, too, to have the build system stuff
> together.  Possibly it makes sense to add .gitignore files here too.
>
> Kind regards,
> Nicolas

Sure, I will add it and send a v5 soon.

Thanks!

>
>
> > +
> > +# semantic patches
> > +*.cocci
> > +
> > +# headers
> > +*types.h
> > +*.h
> > +
> > +# code
> > +*.c
> > --
> > 2.42.0
> >
>


