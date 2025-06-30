Return-Path: <linux-kbuild+bounces-7782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A33AED953
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7B4C3B0606
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B682472BE;
	Mon, 30 Jun 2025 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lkaUtHQ7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822324889F
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277957; cv=none; b=ZSPXI20o5hbVTkduWnYyh5lvSMdilEOnGJ7lcFPp+pPGrxGdZQru3Vvo08FhHP2zSaCXpzNQDQ3yRe221/WTDkK4/ON0GM5C8KcTM5YByFgdnIij3dIxewGDaToRm9k2U++Or0aF3+Ld55xfuaQKqyN1vxuH9EorrZBfrLoRgxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277957; c=relaxed/simple;
	bh=cND8KnHFqjASahdvxji0sLcbPl2XO4nal1045B0qiPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFZ9hxX52A9qOouKIGIlCDCy+QlbPyW5XUnjGB7Qs0GqwZ/mK3zqsgUmkiNJ3U4dPyqikE2L4mBNtxsL9Fo0QuisutcLRX8Dq6Uhhk2QYT7YWX9QvRCkd813/yMIOUR4KxHj/FsduGDeP7jLa5mMuwAY3nmpTz6ZPkZ0Eg+v2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lkaUtHQ7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553aa258aecso8750e87.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Jun 2025 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751277953; x=1751882753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5W/aCkH5j3ZLhBzUnk4+o0iMGbCFsEB9QPytpHfm7c=;
        b=lkaUtHQ7s6Qovu0Bu7CWOB4E6beA1euHJmtgrce8hLSQ8LiIkRu76mRVQdyVokoohk
         TJ6MSZ+ER+ZmRptxNls6FS5wGJTvYSIpEIB+AELMjNucYJLcNUQ++9Y0q94mXYxg0FPe
         Eivf961N6XtYs9YQf2HRf45c4HJMOr/pNtNrzmjESmgR76SMjibSrllt7mk/WBPWuF32
         nZKoSJOmx1+Y8gQl0TDDhQbH0a61+ypj/H6p21KLpngImdoGPUSMBDwFvCN6wtFixt1j
         4zT4fiUExe2S+fDp6FQc+Wsc/LCR2GkwrXmoeTCFQRqc3NEEZDa5q2SAkA5orQtAFK2K
         iqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277953; x=1751882753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5W/aCkH5j3ZLhBzUnk4+o0iMGbCFsEB9QPytpHfm7c=;
        b=fxu3GfyE4lTOpuB8ZUhbllGrNRdwKM3auyoTBC0XBeQtpMJTE4DzlUTqLv2Uq5SYSs
         k+MNYoFhCccaau1jVwP8QBcu54mthkbPKUf2NgDUkRDIkpuHZsGL2j3zI/OIM9das6RK
         1KrrC9u7itnazJZZh4a3ocudYgvdEMAp/s0fL63Jku/SbrNPdZco1pWH/A+KdlGeRHSo
         xykBB6XDqj2AM8urjAELsKOnrypSiPP6PSNe18vo99XFg99tp/wtQL4kpyJ3y2Dafb0r
         7PdTBqXJGH22/5YOk4UG3BFHpmBItQOJ1HPvZx3fLHkVzAA/JLxzu+J5TGDz+P6wkYzU
         r2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH2asWKED345+WBeLedrW5zjnCa2ld2RI18d9MD+LItoDlM3qqdfRllWtvLjNVwV4msFPEvBJMeh0WnVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtK4jDZDuIXLy7zI4aWk/kvQMbwYiyesZ7aJEMLeNQuL6sJfK
	NezAQSfjCtm5F+bE9nXiSmU5zWots3aUJroKcAxKnnCr1dhgfvcWzwWCCLAnno8zqMd4wEfjosw
	QhLaJpEiPqUO0AT9RbVaG6xG3x4svFst2eikO/IL/
X-Gm-Gg: ASbGncuqcYoC3gIXCIWupCy/odRSbLcYNJR8ujxTQyydVuZOg6jBd/A65y8wGhIyGz5
	o41v43emJoRPdv9W6s7tqdjZV+TP9J/h0rNAFi5hMEmCyOeCkt5B9n4nWhemq1DlRjhSncMglub
	iufWBnVBQZfmIC4UpUWto861y4MqTh7fi1sOoex4GZhQtE76hNFT/GrfixTQN525MJTqoobPs=
X-Google-Smtp-Source: AGHT+IEehaw/D/wnspUhLXMrazPF9xkSjn2yt6Mt9vV9dtn4BkBRGAGPcuzi4KGS7PFJfVQUk50Qzwro6et5OzesapA=
X-Received: by 2002:a05:6512:228b:b0:555:4de:c172 with SMTP id
 2adb3069b0e04-55513fc99eemr271882e87.3.1751277953101; Mon, 30 Jun 2025
 03:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
 <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
In-Reply-To: <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
From: Giuliano Procida <gprocida@google.com>
Date: Mon, 30 Jun 2025 11:05:16 +0100
X-Gm-Features: Ac12FXxmNoP6PvMu6OOoOXG12Jh_6-R_MmbOZXUFBdsR8S9d8WpM8vXppST1XSk
Message-ID: <CAGvU0HnzfLxGhLT3Se4wNvyzEkpTKmd8ATFFgBRBVNrOKDXcgA@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

On Sun, 29 Jun 2025 at 18:51, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@google=
.com> wrote:
> >
> > When writing symtypes information, we iterate through the entire hash
> > table containing type expansions. The key order varies unpredictably
> > as new entries are added, making it harder to compare symtypes between
> > builds.
> >
> > Resolve this by sorting the type expansions by name before output.
> >
> > Signed-off-by: Giuliano Procida <gprocida@google.com>
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> >
> > [Adjusted the first line of the description. Added reviewer tags.
> >  Added missing CC to linux-modules.]
> >
> > diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/type=
s.c
> > index 7bd459ea6c59..51c1471e8684 100644
> > --- a/scripts/gendwarfksyms/types.c
> > +++ b/scripts/gendwarfksyms/types.c
> > @@ -6,6 +6,8 @@
> >  #define _GNU_SOURCE
> >  #include <inttypes.h>
> >  #include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> >  #include <zlib.h>
> >
> >  #include "gendwarfksyms.h"
> > @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct =
type_expansion **res)
> >         return -1;
> >  }
> >
> > +static int cmp_expansion_name(const void *p1, const void *p2)
> > +{
> > +       struct type_expansion *const *e1 =3D p1;
> > +       struct type_expansion *const *e2 =3D p2;
> > +
> > +       return strcmp((*e1)->name, (*e2)->name);
> > +}
> > +
> >  static void type_map_write(FILE *file)
> >  {
> >         struct type_expansion *e;
> >         struct hlist_node *tmp;
> > +       struct type_expansion **es;
> > +       size_t count =3D 0;
> > +       size_t i =3D 0;
> >
> >         if (!file)
> >                 return;
> >
> > -       hash_for_each_safe(type_map, e, tmp, hash) {
> > -               checkp(fputs(e->name, file));
> > +       hash_for_each_safe(type_map, e, tmp, hash)
> > +               ++count;
> > +       es =3D xmalloc(count * sizeof(struct type_expansion *));
>
> Just a nit:
>
>            es =3D xmalloc(count * sizeof(*es));
>
> is better?
>
> > +       hash_for_each_safe(type_map, e, tmp, hash)
> > +               es[i++] =3D e;
> > +
> > +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansion=
_name);
>
> qsort(es, count, sizeof(*es), cmp_expansion_name);
>

That's a fair point.

However, in the gendwarfksyms code, all but one of the sizeofs uses an
explicit type name. The exception is sizeof(stats) where stats is an array.

I'll leave Sami's code as it is.

Giuliano.

>
> > +
> > +       for (i =3D 0; i < count; ++i) {
> > +               checkp(fputs(es[i]->name, file));
> >                 checkp(fputs(" ", file));
> > -               type_list_write(&e->expanded, file);
> > +               type_list_write(&es[i]->expanded, file);
> >                 checkp(fputs("\n", file));
> >         }
> > +
> > +       free(es);
> >  }
> >
> >  static void type_map_free(void)
> > --
> > 2.50.0.714.g196bf9f422-goog
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

