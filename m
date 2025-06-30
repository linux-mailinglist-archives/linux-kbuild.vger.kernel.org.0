Return-Path: <linux-kbuild+bounces-7792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6DAEDF77
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 15:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDCC1894C15
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DD9156678;
	Mon, 30 Jun 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4s/41yj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EE13A3F2
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291162; cv=none; b=UNbLSCednw14grgMNVQTcwRXvxG2Se1kMlyvS+wEjKqWwfOlH/3qdk8EjRh76nr2Q+FphFqtVlxc4Mf4YcoYztRCOCrbJsQskdUlbNANiIdq7nPY9L87muCuechzrIuGIN/r6Gm9ajHH1eqkq9VPr5eAbPRksHO191p+DI7d9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291162; c=relaxed/simple;
	bh=Hm2MbwnXKGaJY2SHxo57MJJ3f6qfhV7R4lhuAtejQEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF3/YtE9vxY6bIVTc7fWRLBgNo2wU1Zh4LKluOuRh1kF+Att3nvyc9rj74sZYZJv9ypvJIBrj1eXq1a1e5ifMtGTIYVLwAupLwA4eV2kJyamIEwe1HkxBGBOWQE/ov4XZcWJ4bkortY6qI2xgOxIWxWkQKikdSATwB0M7cQnbT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4s/41yj; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553a5f2d321so11399e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751291158; x=1751895958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWmIrVh084A9jSFONPMpFqcwNwUZcNanqciTXj5s4zw=;
        b=U4s/41yjZbvcqUJ8z9Dgo4L4piFHwwV+7mVljl87BsuCPpZsYrV7R+dzgNnuAIqhXx
         jruH7+/JoQC5tO2iQ01lKTMrJDI6vhTml0ctGJqJGrwFRUJXlPb8iLlL4375IsjjYuUK
         0+fpdQyVyfXCGzT2hEq43wEAF2ZL3j4xPPo+MhsE7HYDPFeHBk6pzwAXPaPgcs03A4qv
         eHIgIOPfrJI8cPsvkwhHM6+hVvTbIFu2/FvS/PoOs7tggcEW2jAdwbRtiL5vntIDDjG4
         DH/4HuJ57HJjYoSJ3Rr/VxJp8Mlz2nkExR6NZxyDXUEul4UBxLzQjQWMsrTc7nxgYJP3
         t5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291158; x=1751895958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWmIrVh084A9jSFONPMpFqcwNwUZcNanqciTXj5s4zw=;
        b=HN5LoVvagKpS8ou/n8CZM4hcAuJF/dP+4O8QgGLBPdAHtoUV67r1NgKdztraqJ+ZGo
         P37qZ2en8qwBgPxCZXULGk00noSwPgFxv853AB2hMo4eOmnIRMeB8a7AGt/8tPb6k+It
         0oMcMBsI/i6cjBz9R58cMVGjcB6oOF+iniPthWFZPRfWMYaj5QT2tjPXmfL21p2uemg9
         tofI9QmebbgWJGL2gRPRd6cnqcpXQ1a8AZwAJLwHAThG1jh7ULcqvFIRXRWIpFu3W1tK
         HKIwwF5IP8+LbvX/zK2IpTzTFPgEQWrgXyxTbOEtBvTa4YMUo+ExOEj5MjV9A9MKp1xz
         rU1g==
X-Forwarded-Encrypted: i=1; AJvYcCVWvVE7tYvlKqc+dT1ej4CZROUxicinvHO8kq+/qxln+CSSAr23TdwlS5OdU4iDrwSdPPh4y3ElxPQWvQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xKvREMLcd+5gfg/N6n+wejokkpFQ8fjV4ZUmnBJNkNbu3zn9
	TfCBdqRupcYc/npo5CCeBdOeAwX0T+7xmUxi6T0xYrJnV66YV/BgUEBVMBkR2XvLw6ddbuMhwiV
	s64GH0q5IqIHv16WbTxOafyIMCWV0EaHvjD8g8gwa
X-Gm-Gg: ASbGnctPL0GCbT6xNDLbIwgOIBQ35dYONApST1on6lkeItgqj3/nO2xSQ4fiA5d2RxE
	hifT8j+QusLD4LPd9KtOpST1TgRrFG0zsYe51unQoyB0NtZg9NfuOlKrpJyYBErGeDv+WTbQTCU
	zTVteGOqTLYIKM7u66V3VXu09KyT3hSxJlacWS2AjVCY41Q5Ne+9iW0ZDSwwXW6rjxvC0Gmqy5
X-Google-Smtp-Source: AGHT+IH05ue31sjxr2KdVgJP17Yc3pASLUVWnVUjo0re10D86rxcIxDQG9NNQHSZ1qpfo2acDCIsZpKWq8UAcdAUe3c=
X-Received: by 2002:a05:6512:2445:b0:553:24cf:79c with SMTP id
 2adb3069b0e04-5551404736bmr276292e87.7.1751291158014; Mon, 30 Jun 2025
 06:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
 <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com> <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
In-Reply-To: <CAK7LNATp1n2c9RqNoe0oztRtLoMy8JqHF1KqSRsj5avp3vjHCQ@mail.gmail.com>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 30 Jun 2025 14:45:21 +0100
X-Gm-Features: Ac12FXyRhPKA7k9LFq_9lXtXeBu0I63z-ojiqb2OMdNduBkpVKUo_WdgJg-YSnA
Message-ID: <CAGvU0HkKacQKB1q9NWcqChLGoMB+1vu9UdqYc+tBRbTTc3++GQ@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Jun 2025 at 14:24, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Jun 30, 2025 at 7:05=E2=80=AFPM Giuliano Procida <gprocida@google=
.com> wrote:
> >
> > Hi.
> >
> > On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
> > >
> > > On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@go=
ogle.com> wrote:
> > > >
> > > > When writing symtypes information, we iterate through the entire ha=
sh
> > > > table containing type expansions. The key order varies unpredictabl=
y
> > > > as new entries are added, making it harder to compare symtypes betw=
een
> > > > builds.
> > > >
> > > > Resolve this by sorting the type expansions by name before output.
> > > >
> > > > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > ---
> > > >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> > > >  1 file changed, 26 insertions(+), 3 deletions(-)
> > > >
> > > > [Adjusted the first line of the description. Added reviewer tags.
> > > >  Added missing CC to linux-modules.]
> > > >
> > > > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/=
types.c
> > > > index 7bd459ea6c59..51c1471e8684 100644
> > > > --- a/scripts/gendwarfksyms/types.c
> > > > +++ b/scripts/gendwarfksyms/types.c
> > > > @@ -6,6 +6,8 @@
> > > >  #define _GNU_SOURCE
> > > >  #include <inttypes.h>
> > > >  #include <stdio.h>
> > > > +#include <stdlib.h>
> > > > +#include <string.h>
> > > >  #include <zlib.h>
> > > >
> > > >  #include "gendwarfksyms.h"
> > > > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, str=
uct type_expansion **res)
> > > >         return -1;
> > > >  }
> > > >
> > > > +static int cmp_expansion_name(const void *p1, const void *p2)
> > > > +{
> > > > +       struct type_expansion *const *e1 =3D p1;
> > > > +       struct type_expansion *const *e2 =3D p2;
> > > > +
> > > > +       return strcmp((*e1)->name, (*e2)->name);
> > > > +}
> > > > +
> > > >  static void type_map_write(FILE *file)
> > > >  {
> > > >         struct type_expansion *e;
> > > >         struct hlist_node *tmp;
> > > > +       struct type_expansion **es;
> > > > +       size_t count =3D 0;
> > > > +       size_t i =3D 0;
> > > >
> > > >         if (!file)
> > > >                 return;
> > > >
> > > > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > > > -               checkp(fputs(e->name, file));
> > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > +               ++count;
> > > > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> > >
> > > Just a nit:
> > >
> > >            es =3D xmalloc(count * sizeof(*es));
> > >
> > > is better?
> > >
> > > > +       hash_for_each_safe(type_map, e, tmp, hash)
> > > > +               es[i++] =3D e;
> > > > +
> > > > +       qsort(es, count, sizeof(struct type_expansion *), cmp_expan=
sion_name);
> > >
> > > qsort(es, count, sizeof(*es), cmp_expansion_name);
> > >
> >
> > That's a fair point.
> >
> > However, in the gendwarfksyms code, all but one of the sizeofs uses an
> > explicit type name. The exception is sizeof(stats) where stats is an ar=
ray.
> >
> > I'll leave Sami's code as it is.
>
>
> This rule is clearly documented with rationale.
>
> See this:
> https://github.com/torvalds/linux/blob/v6.15/Documentation/process/coding=
-style.rst?plain=3D1#L941
>
>

I can follow up with a change that adjusts all occurrences. That
shouldn't take long at all.

>
> --
> Best Regards
> Masahiro Yamada

