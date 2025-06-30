Return-Path: <linux-kbuild+bounces-7791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A0AEDEE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 15:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF539169369
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 13:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AEA285042;
	Mon, 30 Jun 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OymH8Dh9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5F2737E7;
	Mon, 30 Jun 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289886; cv=none; b=KZihxCcUh8RvNcVLKKGxhn9RRykZ+3+S8Jtgp61k+Mn68OueOEBUuidQih/DyxNBkVtP+/EymIBBeCBy7cX1lzoY9Cb9MuoObzVmvBV6G0WjDECcYPXULD50e4zJ/RKGgeTeWkLR1Rv3Bg7LszP1LRXb3X7Uy7RhaCh/Hz10U6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289886; c=relaxed/simple;
	bh=C/KLwVpP5vnvnPOKwYbYJLVyr9fOvwvaHrGH3cxFg0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSdlhBJflSjKaEGVX+CQPNGXoIA6TjH9jk0RE9mi5L1zi/C0/WY/gRCmkzQRNZFVBG14fPpAAQT7aV8D5yGH1nrm0/J89NpTORMWPLLD0WyV5Bswl9w+h/K2Y9hgkR2acSJrzn7zZInBiJYBxY9GYvb+lfEekd7VyykOv/O2kaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OymH8Dh9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64A7C4CEF1;
	Mon, 30 Jun 2025 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289885;
	bh=C/KLwVpP5vnvnPOKwYbYJLVyr9fOvwvaHrGH3cxFg0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OymH8Dh9BlD0r5vlxqHynf4+ixUT8pqe92NBhQh8kCAGv7fAUwGvXvMejQQZUnruy
	 xnPx3yBjrjMGROw/yyZM95VcwNnDcHVaB8gBtPKMlazMX0YWRjQgVaczADH/mCt8w+
	 4Av9uwfO9F9wU3bghMN6sBKh4CNKtaxPnw7tmZr2O01decJrpzyGdV50Hz6YIjoxE4
	 XruyUQUZhDXOBgapP5EEPRBlmoWCA4R09e3bJ24XeiN30b1m9ndKF2Q+k8hv2q+B5s
	 RL3H66Hwj9LgPH1iUH2vtLTc/C2ymbq95+DHJcc1r2JXnan7R5GeNkvRS0FVJDsm5u
	 zK6q48EC0xnrQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553c31542b1so2401080e87.2;
        Mon, 30 Jun 2025 06:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV49BSH2A9Q67wZZngvVWBwJ2x3D/BPnx8somx9HSdnvDG1TUMYKWE70dvSW103UjVa9VD5hN50BKskpzQ=@vger.kernel.org, AJvYcCVQ4AWzkPary3gVuwSJjHvovCT48OvjE5BWGuQ97y4DhowuuQpCfcxzOO9ix7HrbqQwEdDsLyQCruj/HBaVYA==@vger.kernel.org, AJvYcCWH8zkunrE1Uzmgv8nyhvVn5FJReM+g2jhxgNgkbpwndz6O08Fc3gN5tDva4elnety1PgbW8SckiJDq/Rpb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7k0m6C8pcbmXo1hAZWjzzOQ5/HU00UuweP5Q8wRw4AVe0bGl
	LKdNakMoEyrOR7974Ib3SmQBFUMts2TYl16mXeOQPFlxm4DIEryN/+ZKCo5Q0nDh+ZkfIGYdpAV
	URdhu4HhE/hHL5lwTgDA0Hp9jRe0hFPs=
X-Google-Smtp-Source: AGHT+IEPzeuwWBdYagliwzijFiih6tkbayTrYgIeMSfrJEjQfMGuWR0UrzbUSJHDJ6lRnmEznbVIahWtFQmo5AgezlU=
X-Received: by 2002:a05:6512:224b:b0:553:1f90:cca4 with SMTP id
 2adb3069b0e04-5550b87a206mr4541686e87.13.1751289884414; Mon, 30 Jun 2025
 06:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com> <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com>
In-Reply-To: <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 22:24:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
X-Gm-Features: Ac12FXwwD9lkICBnBWvlITUhX_Y0G7ZiNvAyww9EJdEFCZePWHqzKfblx7Gg6Qs
Message-ID: <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Giuliano Procida <gprocida@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 7:05=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> Hi.
>
> On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@goog=
le.com> wrote:
> > >
> > > When writing symtypes information, we iterate through the entire hash
> > > table containing type expansions. The key order varies unpredictably
> > > as new entries are added, making it harder to compare symtypes betwee=
n
> > > builds.
> > >
> > > Resolve this by sorting the type expansions by name before output.
> > >
> > > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > ---
> > >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> > >  1 file changed, 26 insertions(+), 3 deletions(-)
> > >
> > > [Adjusted the first line of the description. Added reviewer tags.
> > >  Added missing CC to linux-modules.]
> > >
> > > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/ty=
pes.c
> > > index 7bd459ea6c59..51c1471e8684 100644
> > > --- a/scripts/gendwarfksyms/types.c
> > > +++ b/scripts/gendwarfksyms/types.c
> > > @@ -6,6 +6,8 @@
> > >  #define _GNU_SOURCE
> > >  #include <inttypes.h>
> > >  #include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <string.h>
> > >  #include <zlib.h>
> > >
> > >  #include "gendwarfksyms.h"
> > > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struc=
t type_expansion **res)
> > >         return -1;
> > >  }
> > >
> > > +static int cmp_expansion_name(const void *p1, const void *p2)
> > > +{
> > > +       struct type_expansion *const *e1 =3D p1;
> > > +       struct type_expansion *const *e2 =3D p2;
> > > +
> > > +       return strcmp((*e1)->name, (*e2)->name);
> > > +}
> > > +
> > >  static void type_map_write(FILE *file)
> > >  {
> > >         struct type_expansion *e;
> > >         struct hlist_node *tmp;
> > > +       struct type_expansion **es;
> > > +       size_t count =3D 0;
> > > +       size_t i =3D 0;
> > >
> > >         if (!file)
> > >                 return;
> > >
> > > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > > -               checkp(fputs(e->name, file));
> > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > +               ++count;
> > > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> >
> > Just a nit:
> >
> >            es =3D xmalloc(count * sizeof(*es));
> >
> > is better?
> >
> > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > +               es[i++] =3D e;
> > > +
> > > +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansi=
on_name);
> >
> > qsort(es, count, sizeof(*es), cmp_expansion_name);
> >
>
> That's a fair point.
>
> However, in the gendwarfksyms code, all but one of the sizeofs uses an
> explicit type name. The exception is sizeof(stats) where stats is an arra=
y.
>
> I'll leave Sami's code as it is.


This rule is clearly documented with rationale.

See this:
https://github.com/torvalds/linux/blob/v6.15/Documentation/process/coding-s=
tyle.rst?plain=3D1#L941





--
Best Regards
Masahiro Yamada

