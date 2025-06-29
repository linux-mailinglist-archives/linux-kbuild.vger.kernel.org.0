Return-Path: <linux-kbuild+bounces-7733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B8AECF56
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 19:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6826172A8B
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 17:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A72B235055;
	Sun, 29 Jun 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lE/Xk1B9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF252576;
	Sun, 29 Jun 2025 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751219520; cv=none; b=Yc2cYrh2vF/oTF7Fx/+7CvAPVx3KMqpQ5jm0GiyCj7MvEvZlQyBNhsQq8pLuVtjpGdx43mx73wS/cBoLB+BgywrQt93BAHlcPkGTyt9Xdj3uQWxv7vXR2mBBLfpYAiiTcTyPs1b+Ui1fz5y7TyFrpY12ovU+nA7CEE4IfuO8JJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751219520; c=relaxed/simple;
	bh=Prf/TUB7pIIY1tQutcBvAREu0B7HpCJ8U7iuapmx4w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9p01icim/LPl0ELVUd3oMwP/aEBHoDxmUsVruXc3QxcIRElQtGNeX8s7pm1NCg1WgHAECXxxz4rxtBS4e2hqafPqHLyE0Ur/vaqZNi0iInyFdvO1174XhCCVXCHNKs6SEbtmO6DV+vBHtckIQuGTh+jT5dh+HORbjvvnl+L/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lE/Xk1B9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CEAC4CEEF;
	Sun, 29 Jun 2025 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751219518;
	bh=Prf/TUB7pIIY1tQutcBvAREu0B7HpCJ8U7iuapmx4w0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lE/Xk1B9i566SJ5DYEVfz6jNuQt9HaVR4A1SZuEeECe9oSer7QMfL3UOduNmDuo7l
	 ebW7pXkjH16Uorm4T7m+jyrrIHlNr4Kmw+we40MHU8wjQnd/t0rKKx2sx2g4aPwYHS
	 fZDxIvTEs1J1WFl/4fBdm4gPYnifBdKnBNYg2EP3TRyzEvQlFHOrIVrJdYdXbnGU/6
	 1fRzJDk2jhmDPQ3myoztBR8WmTZAb1MJAfvqkvZduEInHNdD3PCR8MuTEBxG9r/Z7S
	 9/T2yRZun0CR9z5QBoXzxSvQ3DUx+kPnmggLm7ct1KLVnmVRaLm73p0epk9InsJD6Z
	 hryEuvsQ26RIw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b584ac96so3461994e87.1;
        Sun, 29 Jun 2025 10:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJX7LSHrT02ta0xbjs0g3DpnAUu6MhU3bgB9OVdZRzJmQLru96H1mO2uFzfsWVh3OR5jY7/XjTXeS2PWfsNg==@vger.kernel.org, AJvYcCVxNQshELe7MzdypV0aPfH8eQUUBLGUDR5yztf4ofyGd7NIUt7JmmJuNtTY64BEuADmtUcywkMQWjW9+po=@vger.kernel.org, AJvYcCXwootx34zFL3uVMaUCvrvkITtrHrrKkz9wiO8mOKJW7dYAYHsbuX69FK21jzvM0Wo4ux5a7UO7yazBIRbq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ca29MC1HG8kuNfObvZhpnSLURpfoV4lJFDT0P8cyrSyMore3
	mZT0TvqgC3ZiMJa9p5raLoHVWCBzIdldGzjiPKFUG+gbCpuFVXCosJvMNjHpV+wWo7D1co0eUgu
	xbRKJ+U3La+Lv2yPTCy0/48raLvUM0Dw=
X-Google-Smtp-Source: AGHT+IHGzcfNbyV3nTioSzVq3CZ7iDMNUw8mckzCx1zMvJTjhKiI3PSf9s53U4g409i7ky4TD5Dn4mE0do6B0F84IgA=
X-Received: by 2002:a05:6512:1193:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-5550b869efdmr3015172e87.9.1751219517077; Sun, 29 Jun 2025
 10:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com> <20250625095215.4027938-1-gprocida@google.com>
In-Reply-To: <20250625095215.4027938-1-gprocida@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 02:51:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
X-Gm-Features: Ac12FXzvLpu_LygASIkWAtnx_s-9k2Pilxeog1cyF0ArojQilgT-M0HHJZzQe1w
Message-ID: <CAK7LNASNVh8fDErjSbcR1TiCfy=LM-j3iYSNpqAvp8OhGmsKjQ@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: order -T symtypes output by name
To: Giuliano Procida <gprocida@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 6:52=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> When writing symtypes information, we iterate through the entire hash
> table containing type expansions. The key order varies unpredictably
> as new entries are added, making it harder to compare symtypes between
> builds.
>
> Resolve this by sorting the type expansions by name before output.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> [Adjusted the first line of the description. Added reviewer tags.
>  Added missing CC to linux-modules.]
>
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.=
c
> index 7bd459ea6c59..51c1471e8684 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -6,6 +6,8 @@
>  #define _GNU_SOURCE
>  #include <inttypes.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <zlib.h>
>
>  #include "gendwarfksyms.h"
> @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct ty=
pe_expansion **res)
>         return -1;
>  }
>
> +static int cmp_expansion_name(const void *p1, const void *p2)
> +{
> +       struct type_expansion *const *e1 =3D p1;
> +       struct type_expansion *const *e2 =3D p2;
> +
> +       return strcmp((*e1)->name, (*e2)->name);
> +}
> +
>  static void type_map_write(FILE *file)
>  {
>         struct type_expansion *e;
>         struct hlist_node *tmp;
> +       struct type_expansion **es;
> +       size_t count =3D 0;
> +       size_t i =3D 0;
>
>         if (!file)
>                 return;
>
> -       hash_for_each_safe(type_map, e, tmp, hash) {
> -               checkp(fputs(e->name, file));
> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               ++count;
> +       es =3D xmalloc(count * sizeof(struct type_expansion *));

Just a nit:

           es =3D xmalloc(count * sizeof(*es));

is better?

> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               es[i++] =3D e;
> +
> +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_n=
ame);

qsort(es, count, sizeof(*es), cmp_expansion_name);



> +
> +       for (i =3D 0; i < count; ++i) {
> +               checkp(fputs(es[i]->name, file));
>                 checkp(fputs(" ", file));
> -               type_list_write(&e->expanded, file);
> +               type_list_write(&es[i]->expanded, file);
>                 checkp(fputs("\n", file));
>         }
> +
> +       free(es);
>  }
>
>  static void type_map_free(void)
> --
> 2.50.0.714.g196bf9f422-goog
>
>


--
Best Regards
Masahiro Yamada

