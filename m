Return-Path: <linux-kbuild+bounces-7389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EFAD0DB0
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 15:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C3E1896F93
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA3B7E9;
	Sat,  7 Jun 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5NtHAK0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65829F9C0
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Jun 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749303819; cv=none; b=NHhdLNNVnjyhMgc1LzeiiUq/cHT38Ng9H4SyWp8op3wzo3RyxLCyHCjyFkVLZjZC9uWQiXJhNZph6VWeHuMCbCftLIlSIMWXw1DZHDbzJNczY8e2Kexy9aqiaFnzidBz/cwQ1cY/hgO/DL48V5hH77XF75Sns5yFCpKPM/YFn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749303819; c=relaxed/simple;
	bh=iGzuPd+7TuLnwjt3z50mq0U0zq+LGJ9fUvzl9F61axw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm93zP08W9heV+VRL1q5YNxR4UEphh3M9x1HfEL4zsP6BkYfHCKiHr/DHgQRdSegj5AotqKFAZtAZUrl74JRX/Zz7UysnySJCh9FZiaBjLF2x/8nF3JxxLyoCjBbbHw7nSL7ZPJT/DVfaogyS14yBGrCVb7WeakAsscboE7ExwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5NtHAK0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7150C4CEEE
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Jun 2025 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749303817;
	bh=iGzuPd+7TuLnwjt3z50mq0U0zq+LGJ9fUvzl9F61axw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F5NtHAK0VZDB6wNui3jVWP+nr3cYyOWmB6At1Adfn0awFMjuUfKuN9swuXhKR7xR6
	 CdPjXDlUY+xpzBHvbQe2Xse4dUqPhwMVQ7J9nfp8bdf/ZxNO/txQkDpvml6PwYvgRB
	 E8etVTI4bpbVd4rjeLZzJaO7I6IBIjJHNgNpWRnO2vtOK2bAMFrXO3fiNt++ou4fQE
	 bYELgEbbVMJtiRImXL7Q6GloYekXO2IezxQXQVor/1uLVQBipz+1Q6NXyhEdUXx0tK
	 sfcEc49g3LlNwOxjeylRFF3cNZzA/tcw6/ShwpGoOeYRx4Jtcq5p5jdbtoaMRRl7m6
	 I/TfpySc4D/UQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-552206ac67aso3392052e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Jun 2025 06:43:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2y3plWKE2iV4J0+S5iJNEnp8IW8PYMxkw6QHPAGDEdBDydYkr
	XM88d2648I07QMqzlF6uobo1SFDR02AL9O0NTTAZA1PGCvcQqOql4/PHs5VljSuQaZBIJqJUd13
	zfq6OCXNJUhVwPDfnzDkciTVOAsq2d0A=
X-Google-Smtp-Source: AGHT+IGzjvrSNnZE8QgeSC77WmUyNk5qvTrweHNWQHiG7aoBJ4qI2iIgQ7nawZJ81byI13JIaEabYbuxR2X8brYtvdU=
X-Received: by 2002:a05:6512:3b28:b0:553:34c8:f6ca with SMTP id
 2adb3069b0e04-55366c35a40mr2027908e87.35.1749303816546; Sat, 07 Jun 2025
 06:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607090800.3033-1-huyubiaox@gmail.com>
In-Reply-To: <20250607090800.3033-1-huyubiaox@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Jun 2025 22:43:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQj+36AGf=ectokdJ+ngVZYgP6AKiEcYUU0bCtt6infGw@mail.gmail.com>
X-Gm-Features: AX0GCFuaqSO6O7FsodhJqgsfc1NZTGHn5LOEPxHM1uSbt9i4oiNoqS3lcvW-gfk
Message-ID: <CAK7LNAQj+36AGf=ectokdJ+ngVZYgP6AKiEcYUU0bCtt6infGw@mail.gmail.com>
Subject: Re: [PATCH] modpost: Reduce the log level and fix the errors causing
 livepatch failure
To: huyubiaox@gmail.com
Cc: linux-kbuild@vger.kernel.org, ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 6:08=E2=80=AFPM <huyubiaox@gmail.com> wrote:
>
> From: huyubiao <huyubiaox@gmail.com>
>
> Since the commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpo=
st"), modpost has become stricter in handling EXPORT_SYMBOL, making it inco=
mpatible with older versions of livepatch builds.
>
> Is the error level too strict? In my opinion, even if there are issues wi=
th the use of EXPORT_SYMBOL, they are not necessarily fatal to program exec=
ution.

These are errors, as they should be.
Why should I loosen the preciseness for your purpose?


> ---
>  scripts/mod/modpost.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index fb787a5715..13f81392a4 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1055,21 +1055,21 @@ static void check_export_symbol(struct module *mo=
d, struct elf_info *elf,
>         label_name =3D sym_name(elf, label);
>
>         if (!strstarts(label_name, prefix)) {
> -               error("%s: .export_symbol section contains strange symbol=
 '%s'\n",
> +               warn("%s: .export_symbol section contains strange symbol =
'%s'\n",
>                       mod->name, label_name);
>                 return;
>         }
>
>         if (ELF_ST_BIND(sym->st_info) !=3D STB_GLOBAL &&
>             ELF_ST_BIND(sym->st_info) !=3D STB_WEAK) {
> -               error("%s: local symbol '%s' was exported\n", mod->name,
> +               warn("%s: local symbol '%s' was exported\n", mod->name,
>                       label_name + strlen(prefix));
>                 return;
>         }
>
>         name =3D sym_name(elf, sym);
>         if (strcmp(label_name + strlen(prefix), name)) {
> -               error("%s: .export_symbol section references '%s', but it=
 does not seem to be an export symbol\n",
> +               warn("%s: .export_symbol section references '%s', but it =
does not seem to be an export symbol\n",
>                       mod->name, name);
>                 return;
>         }
> @@ -1080,7 +1080,7 @@ static void check_export_symbol(struct module *mod,=
 struct elf_info *elf,
>         } else if (!strcmp(data, "")) {
>                 is_gpl =3D false;
>         } else {
> -               error("%s: unknown license '%s' was specified for '%s'\n"=
,
> +               warn("%s: unknown license '%s' was specified for '%s'\n",
>                       mod->name, data, name);
>                 return;
>         }
> --
> 2.33.0
>


--=20
Best Regards
Masahiro Yamada

