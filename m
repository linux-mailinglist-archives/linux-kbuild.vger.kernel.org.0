Return-Path: <linux-kbuild+bounces-7794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BAAEE2E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 17:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FDE17A2CA3
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 15:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CEA28F92F;
	Mon, 30 Jun 2025 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjNCpwim"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757628EA76;
	Mon, 30 Jun 2025 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298098; cv=none; b=uaLykAMtujeFllCpyzHlGe7Y7cVZotwmTOmskR1OqOieaDhYGpfI5tuC7ecvLsmPJj9MY9Z4IF1k/MV83mvtdBMjWTKy38b7AdcdXQSw6iG/Vgfty86GZXBO+4nu6ZHtwZhtki51GqGe48LO5qSedSGsiM/EcpYcx3teMni3EvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298098; c=relaxed/simple;
	bh=U/Cox21FflLFj8VZkRclH0nSlm2+lf5+a3+6iHEqdhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVheJOrFAja7UPiAInm9ZWG54IPaneR3gPd1ELso3aXdiP/v/xX0ACB03zImU6zj46ONPSF5wYbMYSPj9ALKxaG1bFpVCKiJLpLQ418AudAfT5Mi6bqkoBq8qiatc3tF0pU1Gx2vvHkalAUXDWnSTvEl63ksEaZpKw8iovpRk/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjNCpwim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1C1C4CEEF;
	Mon, 30 Jun 2025 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751298096;
	bh=U/Cox21FflLFj8VZkRclH0nSlm2+lf5+a3+6iHEqdhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RjNCpwimw2bncyOG4/NcCqnnn6i504PvtEG1ewWFF+WznPYjs4f31Y3JoiJ6ffReU
	 Rb14n6OW3scOzyiAwcIfI9wezDWhJVV7CVpVa3wom2WopxH8rlyrixJX41b+dok3c7
	 Yv5GLEDdFOgw3mOKAK5CCC92v4NYZCRWxce44qcBqM/6Rcve9rkbqkSmSEUKiEJnxt
	 i7Cx6lqCi7n5fhr9SxaIgmBx8id6RA0e/lXRpWE1wKcEzpEW74yqk9B211QyA9UeLs
	 eGGYb9v3QGvnLbqSVSk4W1XWyngqvJce7mwOM/aWE98VM/OVIaSSU/3ehTKOrmHGik
	 zJ6YzUVUMOReA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55502821bd2so2519892e87.2;
        Mon, 30 Jun 2025 08:41:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfOLzyWMYpuwzEfQz8RBKrV1w8/pFr63neqbWWMwVhKtrVR4dYW7bx5vu2QwBC6wDcDmaDlf3sAhqQYZ9R@vger.kernel.org, AJvYcCVjYXQKqyMGZEhlDkbKcU0ubz1l+ztPuMEv2Z+I+D/XdZxDEyv8wdVsSYF+Kl9EuLtJ59bWViE/tBdLk6s=@vger.kernel.org, AJvYcCWSbr636inK6oYHqO99cnIUqInPmvDTasmoewnc5MxJIJfF8h+7spqzWwMNn3h45Km0aVaeWswQu5CNIsY9Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+bVheeWtrEPvMrnZJYmAoMIcAZYJqi2Gua1YYPgxL8HCVU+Z
	XrIhWwMW1nQVEH312M2hw6OKs4T+HbbywcSlyvl+MY/KFJXLMfVy/Hb8K794TrthKED3Rh8l1KU
	MxwSf56D+VYA22GW9UChmaIgZcQOjT1o=
X-Google-Smtp-Source: AGHT+IE7MU1OSdE0HWcTbqB/Z2gZNtSZo8xi396BsJAN275lk+KqWpRFVTfKZmP9/jZXHGVo6J1z+B9oYIGiaH3L3rw=
X-Received: by 2002:a05:6512:15a5:b0:553:2e0f:96c with SMTP id
 2adb3069b0e04-5550b84cdd0mr4095199e87.23.1751298095233; Mon, 30 Jun 2025
 08:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
 <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com>
 <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com> <CAGvU0HkKacQKB1q9NWcqChLGoMB+1vu9UdqYc+tBRbTTc3++GQ@mail.gmail.com>
In-Reply-To: <CAGvU0HkKacQKB1q9NWcqChLGoMB+1vu9UdqYc+tBRbTTc3++GQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Jul 2025 00:40:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo0CyMdsVSg4dfWjVU+uYUSMdmwgLEdpRfTVcgOTuwzg@mail.gmail.com>
X-Gm-Features: Ac12FXyyzl9OrOby5-5Dtzs7KHIbfWmtldkF9gESl3FWHywGg2_mXLcsMMx9C-M
Message-ID: <CAK7LNAQo0CyMdsVSg4dfWjVU+uYUSMdmwgLEdpRfTVcgOTuwzg@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Giuliano Procida <gprocida@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:46=E2=80=AFPM Giuliano Procida <gprocida@google.=
com> wrote:
>
> On Mon, 30 Jun 2025 at 14:24, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Mon, Jun 30, 2025 at 7:05=E2=80=AFPM Giuliano Procida <gprocida@goog=
le.com> wrote:
> > >
> > > Hi.
> > >
> > > On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> > > >
> > > > On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@=
google.com> wrote:
> > > > >
> > > > > When writing symtypes information, we iterate through the entire =
hash
> > > > > table containing type expansions. The key order varies unpredicta=
bly
> > > > > as new entries are added, making it harder to compare symtypes be=
tween
> > > > > builds.
> > > > >
> > > > > Resolve this by sorting the type expansions by name before output=
.
> > > > >
> > > > > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > ---
> > > > >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> > > > >  1 file changed, 26 insertions(+), 3 deletions(-)
> > > > >
> > > > > [Adjusted the first line of the description. Added reviewer tags.
> > > > >  Added missing CC to linux-modules.]
> > > > >
> > > > > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksym=
s/types.c
> > > > > index 7bd459ea6c59..51c1471e8684 100644
> > > > > --- a/scripts/gendwarfksyms/types.c
> > > > > +++ b/scripts/gendwarfksyms/types.c
> > > > > @@ -6,6 +6,8 @@
> > > > >  #define _GNU_SOURCE
> > > > >  #include <inttypes.h>
> > > > >  #include <stdio.h>
> > > > > +#include <stdlib.h>
> > > > > +#include <string.h>
> > > > >  #include <zlib.h>
> > > > >
> > > > >  #include "gendwarfksyms.h"
> > > > > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, s=
truct type_expansion **res)
> > > > >         return -1;
> > > > >  }
> > > > >
> > > > > +static int cmp_expansion_name(const void *p1, const void *p2)
> > > > > +{
> > > > > +       struct type_expansion *const *e1 =3D p1;
> > > > > +       struct type_expansion *const *e2 =3D p2;
> > > > > +
> > > > > +       return strcmp((*e1)->name, (*e2)->name);
> > > > > +}
> > > > > +
> > > > >  static void type_map_write(FILE *file)
> > > > >  {
> > > > >         struct type_expansion *e;
> > > > >         struct hlist_node *tmp;
> > > > > +       struct type_expansion **es;
> > > > > +       size_t count =3D 0;
> > > > > +       size_t i =3D 0;
> > > > >
> > > > >         if (!file)
> > > > >                 return;
> > > > >
> > > > > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > > > > -               checkp(fputs(e->name, file));
> > > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > > +               ++count;
> > > > > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> > > >
> > > > Just a nit:
> > > >
> > > >            es =3D xmalloc(count * sizeof(*es));
> > > >
> > > > is better?
> > > >
> > > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > > +               es[i++] =3D e;
> > > > > +
> > > > > +       qsort(es, count, sizeof(struct type_expansion *), cmp_exp=
ansion_name);
> > > >
> > > > qsort(es, count, sizeof(*es), cmp_expansion_name);
> > > >
> > >
> > > That's a fair point.
> > >
> > > However, in the gendwarfksyms code, all but one of the sizeofs uses a=
n
> > > explicit type name. The exception is sizeof(stats) where stats is an =
array.
> > >
> > > I'll leave Sami's code as it is.
> >
> >
> > This rule is clearly documented with rationale.
> >
> > See this:
> > https://github.com/torvalds/linux/blob/v6.15/Documentation/process/codi=
ng-style.rst?plain=3D1#L941
> >
> >
>
> I can follow up with a change that adjusts all occurrences. That
> shouldn't take long at all.

I expected a new patch version (I do not know whether it is v2 or v3 since
you do not add such a prefix),
instead of breaking the style, and fixing it in a follow-up patch.







--
Best Regards
Masahiro Yamada

