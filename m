Return-Path: <linux-kbuild+bounces-4235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A937A9AB5F3
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 20:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28681C2300B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 18:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513C91BD50C;
	Tue, 22 Oct 2024 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgjXqMB6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B61BD03F;
	Tue, 22 Oct 2024 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729621520; cv=none; b=iB/OoijfcwnV+7LCdHxdfKsQ0KSDCk2L8hqJDnI1580rO9zDg9YhNVRiizVKmoagVjXJmqM0K4Env09eCXIW1etYHO6c8N4f8Yrcly7T/LMOFPLTUZscazFC/63mS9W7DE6h1kRBg2FREfuPMh+aU65m6yuulEaK/SnR2izfsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729621520; c=relaxed/simple;
	bh=uJOh1SR8v7FhnAuONru4SIa9hiSNYTb28wi6YMVJRKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYr0GLOuRzy2jS3NMgjGkOz3A8mdPhKcY7ZUyJa8o5k3hslbd+Ij8C5K5AQgLKPsOLxJ9xiB6FXkJUXD2Lu/JAWwg3weWoa3DbTNKn7FkbWQP+vXTr1HYi/9gVfRYRTsuoqTXh7+kCBeSEEa9yIripAlvNoNNdlz1htq3O8YgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgjXqMB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE93AC4CEC7;
	Tue, 22 Oct 2024 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729621518;
	bh=uJOh1SR8v7FhnAuONru4SIa9hiSNYTb28wi6YMVJRKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pgjXqMB6sYQCtrnnf6C4TYI7Mmf+t2JJmTU8BP5fzWl6GcmHO786Bf9VvxK0Im2c0
	 jZOQDXYcwDhWiJIU0VMk0tFdZJqSdABb7o4bxQW3/eyG5lFbAHZvdQzRj3ejKW8xeO
	 k00dk5BAaGPeFOK6WUfsO6zkmvvcovBSz+xlOSVaBhOlCTfG2M2AX1YyMp6rb632Nt
	 dbm9wOhae6c0bd6FR2Sxm4wBtR3Bp93226zxTQ36H+X8uV+9x24bBsudLPAPL9D6/I
	 PhXvNSJzr+aIN/MkjGjMO2xi+xAAFkbqCkTf3nHlOTEvGHLROK9f3yEk7b2T3oNRGW
	 xwxG7L0IMdIuA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fbbadf83so7872675e87.0;
        Tue, 22 Oct 2024 11:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWgBzl5Sv1N2mpr8iAa2vzpYCVE5H2y+NrG9Xnv/v8dI8SxOw8cJjCUNOCUEFe2CzPNx/oJ+kwu6K8UlDa@vger.kernel.org, AJvYcCXWkYzc6xW7Xq332F7iZyZlqnqs7d1mU2OEIrhxg9BAOMPV+g7eaUzvcfgfaBS17xDU2COo1AYlavd/Qcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVfEZ+Q9CVFTUBuXSnNfzYpuq7qDqs6FLRkV3BZFHXe6x9Mia
	6bOpNLQ2JBxRbvnJ9YBY6JoQ2UPrGHBNDPROgckiJK8kGsgN9czanHp6ka4Fk45JlVqDdroswQL
	naDhbh1gjQw/2YsrAHtEjE7Zz2hI=
X-Google-Smtp-Source: AGHT+IHOmNp0Hx4TCwtJw9r1z+I3AfLbSk1w41Q9dHVt8eynv8u+g5IP/8iHve0xLFfreOQwuS09lFti/yhunEAUyBs=
X-Received: by 2002:a05:6512:3c81:b0:53a:aea:a9e1 with SMTP id
 2adb3069b0e04-53b13a3a251mr2155832e87.54.1729621517466; Tue, 22 Oct 2024
 11:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021203846.930-1-esalomatkina@ispras.ru>
In-Reply-To: <20241021203846.930-1-esalomatkina@ispras.ru>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 03:24:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATq9t7iYN52rw3B_5wJH3X32pp96c0maGNtXG5Abjpx0g@mail.gmail.com>
Message-ID: <CAK7LNATq9t7iYN52rw3B_5wJH3X32pp96c0maGNtXG5Abjpx0g@mail.gmail.com>
Subject: Re: [PATCH v2] sumversion: Fix a memory leak in get_src_version()
To: Elena Salomatkina <esalomatkina@ispras.ru>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 5:39=E2=80=AFAM Elena Salomatkina
<esalomatkina@ispras.ru> wrote:
>
> strsep() modifies its first argument - buf.
> If an error occurs in the parsing loop, an invalid pointer
> will be passed to the free() function.
> Make the pointer passed to free() match the return value of
> read_text_file().
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms=
")
> Signed-off-by: Elena Salomatkina <esalomatkina@ispras.ru>
> ---
> v2: Rename 'orig' to 'pos'

No, I did not ask this. Please read my previous email.

 'p' or 'pos' : advances every time strsep() is called
 'buf'  : hold the allocated buffer and is passed to free()




>
>  scripts/mod/sumversion.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 6bf9caca0968..03774957d8b9 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -385,7 +385,7 @@ static int parse_source_files(const char *objfile, st=
ruct md4_ctx *md)
>  /* Calc and record src checksum. */
>  void get_src_version(const char *modname, char sum[], unsigned sumlen)
>  {
> -       char *buf;
> +       char *buf, *pos;
>         struct md4_ctx md;
>         char *fname;
>         char filelist[PATH_MAX + 1];
> @@ -393,7 +393,7 @@ void get_src_version(const char *modname, char sum[],=
 unsigned sumlen)
>         /* objects for a module are listed in the first line of *.mod fil=
e. */
>         snprintf(filelist, sizeof(filelist), "%s.mod", modname);
>
> -       buf =3D read_text_file(filelist);
> +       pos =3D buf =3D read_text_file(filelist);
>
>         md4_init(&md);
>         while ((fname =3D strsep(&buf, "\n"))) {
> @@ -406,5 +406,5 @@ void get_src_version(const char *modname, char sum[],=
 unsigned sumlen)
>
>         md4_final_ascii(&md, sum, sumlen);
>  free:
> -       free(buf);
> +       free(pos);
>  }
> --
> 2.33.0
>


--=20
Best Regards
Masahiro Yamada

