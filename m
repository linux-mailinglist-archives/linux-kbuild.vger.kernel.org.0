Return-Path: <linux-kbuild+bounces-5704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E23A2FFAA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 01:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF7C188BFBA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 00:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31AA1B5EB5;
	Tue, 11 Feb 2025 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4H/VYac"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE6175D53;
	Tue, 11 Feb 2025 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234623; cv=none; b=fE5x9fJYcIbqgeFcuwoRRk+3jO8EpCj25oEfsJrsmI+uCmPDQjJV+dfrppcx0V3B8QYuYu42cpkDgAjCtAzKcsvLDOB6DeEwQwIq4jtdyfkBdc8mRYTzqstZKyvOT6FE35nB5VPfRlg6L1TmycjU5kM7ZMY/BHE6s1H0OKF1cOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234623; c=relaxed/simple;
	bh=KCSViv0OWASYK3hvtHdH5e/jXmrnMM4Yi/yKHh5fLC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4qhoEMioBwB3CzslICW2Jhm0UKfD6G3hSgPXuyzaG4YqbZro3lJi2UuFN6Va3tlPzQe4Peb7PMotM6Zm7LyKArV0Nrb/5j1638eI4NN6Kw283FfuDFOpvjjlDhKQZepBYr5EzC8RMYDec+pN1H1GKILUxha1jO3P7a2bcAF0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4H/VYac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A8CC4CED1;
	Tue, 11 Feb 2025 00:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739234623;
	bh=KCSViv0OWASYK3hvtHdH5e/jXmrnMM4Yi/yKHh5fLC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i4H/VYac8zLfn7i+NuAGfWMvfRgsHZKuA/IshQnvvVPUdGpI9K+7n/wgck4hJIJko
	 5AqHMihBnmmCu6c1vzEcWM5c8H9LKqm3ZVEUNOmLz6ugLWv4RPaLSu4XHkdPc+sTbN
	 Tc4+S0rQXU03cGkxoEhCfVKRD99oxHO7fYEekXw4j/hnMpxUa48Z554SFi664lUehl
	 OuuVrYiqL24hbhKBN+xGFgnOapQT5tOQ2U6WYM/2rNo0Ewz23mqDAzqJ5k/OFZFsJx
	 KbC/vnrxF5Yekb0p92+iKGIdPD6LcBgq6pML0xxImsICb2xDelWRbiNpbhIM+gg8TQ
	 cnYkFLHpyJGxg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a59so51124321fa.0;
        Mon, 10 Feb 2025 16:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLB4uWzLW16PAosynudgOn1aucVLErcF1oDSsyy8xMFu+zoJI/O2pTPn2m3ldRdvYoMd+Eyn9VYRO9nZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDI1nllLj3v7D24ZWGjmlnTkZ3BYTg6u/biS79X8KesxJAaNiO
	3hRXEEj+KILSOJlGZGHLMO9MDvNg0UxwOXPrvLl1tDBglr4gUqwk3o6xhmMMpoSc/XjelMW9Rrt
	NzG0RIxNDDtS2+oWbhFbXoxfINQA=
X-Google-Smtp-Source: AGHT+IFvZm9mStugcDaqkymRtqbkTbT9YgU/LWYFh0JCnpWFPqzIgoYsv87gNn0UQZrN1uip6zaigJT3CFuJoAvD8Ik=
X-Received: by 2002:a2e:a58d:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-307e5a85f92mr60294321fa.34.1739234621920; Mon, 10 Feb 2025
 16:43:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207175104.412158-1-masahiroy@kernel.org> <Z6cmGqMMLHrWddU6@bergen>
In-Reply-To: <Z6cmGqMMLHrWddU6@bergen>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Feb 2025 09:43:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9f=u3tFQE_xczxOHv5FzJRdAxi81-TJ95BNxEsO9Lbw@mail.gmail.com>
X-Gm-Features: AWEUYZmupTElOmYrHrexq_tqn4O9uIWLVOFNNLjbwf0BWcb5y7Ro9MVpaOwrpNQ
Message-ID: <CAK7LNAR9f=u3tFQE_xczxOHv5FzJRdAxi81-TJ95BNxEsO9Lbw@mail.gmail.com>
Subject: Re: [PATCH] modpost: use strstarts() to clean up parse_source_files()
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 6:38=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Sat 08 Feb 2025 02:50:55 GMT, Masahiro Yamada wrote:
> > No functional changes are intended.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/mod/sumversion.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> > index e79fc40d852f..3dd28b4d0099 100644
> > --- a/scripts/mod/sumversion.c
> > +++ b/scripts/mod/sumversion.c
> > @@ -330,7 +330,7 @@ static int parse_source_files(const char *objfile, =
struct md4_ctx *md)
> >                       line++;
> >               p =3D line;
> >
> > -             if (strncmp(line, "source_", sizeof("source_")-1) =3D=3D =
0) {
> > +             if (strstarts(line, "source_")) {
> >                       p =3D strrchr(line, ' ');
> >                       if (!p) {
> >                               warn("malformed line: %s\n", line);
> > @@ -344,7 +344,7 @@ static int parse_source_files(const char *objfile, =
struct md4_ctx *md)
> >                       }
> >                       continue;
> >               }
> > -             if (strncmp(line, "deps_", sizeof("deps_")-1) =3D=3D 0) {
> > +             if (strstarts(line, "deps_")) {
> >                       check_files =3D 1;
> >                       continue;
> >               }
> > --
> > 2.43.0
> >
>
> Thanks, looks good to me.
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>
> Do you also want to replace the last strncmp() in
> scripts/mod/modpost.c?
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e18ae7dc8140..31468923cdf6 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -670,7 +670,7 @@ static char *get_next_modinfo(struct elf_info *info, =
const char *tag,
>         }
>
>         for (p =3D modinfo; p; p =3D next_string(p, &size)) {
> -               if (strncmp(p, tag, taglen) =3D=3D 0 && p[taglen] =3D=3D =
'=3D')
> +               if (strstarts(p, tag) =3D=3D 0 && p[taglen] =3D=3D '=3D')
>                         return p + taglen + 1;
>         }
>         return NULL;


I believe you meant:

  if (strstarts(p, tag) && p[taglen] =3D=3D '=3D')



I do not think there is a strong reason to do so
because taglen is already calculated a few lines above,
but the compiler may be clever enough to avoid
calling strlen() twice. I did not check the compiler output.





--=20
Best Regards
Masahiro Yamada

