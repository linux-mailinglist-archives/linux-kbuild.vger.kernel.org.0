Return-Path: <linux-kbuild+bounces-7894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43537AFB126
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 12:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1983AE40A
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE842882DF;
	Mon,  7 Jul 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQVsUl7e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8121C18C;
	Mon,  7 Jul 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883922; cv=none; b=jL0b7DZE8gbN0uX+nSt5FUYXHsVDismapCTBa1sv5keN/Xs/6FGtGAHxyPiAutDCdt/csmz2LqaEdl4183BtWtUIntFLtxQsWYRncIscHaKkiA7cpMKopxxUwhv9i4qlFzzgu/rtLkPDXm6VCcfVry5LMr4Hx4r27Nw8MPvk4H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883922; c=relaxed/simple;
	bh=Htuse16fRp/5gHNzzTrJ4ZjG647kLmCCaapTD76Pa68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyRwhhHAztSg9UVxXQ+oO1mWaOv5bavmj5ZbqzlUyR140KfeUomr49YCkY418jw/dgqtGAWwNpSkJo2P8pAVT+k6sZWvSTtUk4UGyzqUW1WWb86rMW5/s9cXYx372Pw923YZjWfR9Fe/N2iTefaOpZ8rmoIL4ecw22KnHzVtITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQVsUl7e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E53C4CEE3;
	Mon,  7 Jul 2025 10:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751883922;
	bh=Htuse16fRp/5gHNzzTrJ4ZjG647kLmCCaapTD76Pa68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VQVsUl7ePrqrsR9BS1nDfhZ5pyLBE6y5F87UjJPZFWsuxwGOXhHqaTJ9gGFXeqKzr
	 o3RoRcriR/5pOWH1E13hbEWub0GgHE12U0DyNtMrrEdgQXEgzl2aospw1L0RhnMY+H
	 tohF/NpEcph1BdlXqmRVWWFhG25ja0zKjsShSJcKhqA/V8/3u20nYCkc7jyL/Oh4W3
	 jmyCHPS8ve4RyCqmUrmzA5W1hERxEnWwf5ppS7jrOjwXTr5Vw38cTIKhb5IvNv97mA
	 4bwacyqIUMsnw/ydxEP2m9KJCsvdYI2AbgOiPtXOpbutXl0PnipJg+Uf9x2Hb+i/Sk
	 ZzYHTDcGdQD+A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b584ac96so2797291e87.1;
        Mon, 07 Jul 2025 03:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpb++4WV9wDkue1ed8uzDOq+jYkAzD9DB5ZPUMfqjLeC5PGYIwYV53RX5rODx8gYCjVnlQTQrG9lDxUUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN075i8xyJ4Ui857HDekG8HkvWmosC/V47ZMxa3uoZD7Yr8JT7
	EZSDDKcI3ZTSaknLoN8corCjtwMJH3QdJSxouIYMQ1hz9/cEhmFp+HaZnxrIkPDc9x4uUJ7Mgw/
	8YBDEOSOJ/UiL9r5ZRdttusJNotmxrqE=
X-Google-Smtp-Source: AGHT+IGc/YbpQI/A+qXqQ7t5lQDqHzLyDqOnYUiAfyKiuxFRRxRAWDMyVUdzoOvGBkt/R0gSt0IwJ2sptZVFw10DEm8=
X-Received: by 2002:a05:6512:6d2:b0:553:543d:d96b with SMTP id
 2adb3069b0e04-557e553a205mr2106467e87.11.1751883920825; Mon, 07 Jul 2025
 03:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706210940.1720720-1-sidnayyar@google.com>
In-Reply-To: <20250706210940.1720720-1-sidnayyar@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Jul 2025 19:24:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
X-Gm-Features: Ac12FXzWkAb_nRjQlFj-0jKZwwPeaHkDbGYK5VbPHxxHwn-SSMAQ1DEbZSN-P14
Message-ID: <CAK7LNATbinPVLDqxzPQn9QNQGyacB5rDFsjQwwygy2KEjbhRFA@mail.gmail.com>
Subject: Re: [PATCH] modpost: check for NULL filename pointer in find_module()
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 6:09=E2=80=AFAM Siddharth Nayyar <sidnayyar@google.c=
om> wrote:
>
> Pointer for dump filename can be NULL when a module is not created from
> a dump file in modpost. The find_module() function should therefore
> check whether the dump filename pointers are NULL before comparing them
> using strcmp().

I do not understand.
I do not think that scenario would happen.

There are two call-sites for new_module():
[1] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L157=
6
[2] https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L211=
7


For [2], mod->dump_file is set in the next line.

[1] is always called after read_dump(), where
is the only user of find_module(). [3]

[3]: https://github.com/torvalds/linux/blob/v6.15/scripts/mod/modpost.c#L21=
15






> Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
> ---
>  scripts/mod/modpost.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5ca7c268294e..9a64d0a55f89 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -178,8 +178,12 @@ static struct module *find_module(const char *filena=
me, const char *modname)
>         struct module *mod;
>
>         list_for_each_entry(mod, &modules, list) {
> -               if (!strcmp(mod->dump_file, filename) &&
> -                   !strcmp(mod->name, modname))
> +               if (strcmp(mod->name, modname) !=3D 0)
> +                       continue;
> +               if (!mod->dump_file && !filename)
> +                       return mod;
> +               if (mod->dump_file && filename &&
> +                   !strcmp(mod->dump_file, filename))
>                         return mod;
>         }
>         return NULL;
> --
> 2.50.0.727.gbf7dc18ff4-goog
>


--=20
Best Regards
Masahiro Yamada

