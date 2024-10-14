Return-Path: <linux-kbuild+bounces-4096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABC99D2EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 17:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93DB8283123
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 15:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2DB1B4F1C;
	Mon, 14 Oct 2024 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLVknPOj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076083A14;
	Mon, 14 Oct 2024 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728919722; cv=none; b=lHiI+cg8CsytptDNpQqw7SdxGjFUBzneYFnO/UxDvix6i7Aw6Bv6ZBi4irh2RPciVvQJUsKdjMsPn1KB2vtvqgRlEEfcTeYsI3LviKITaO1pe+cQPVqxx7+r6WvQZpzQO9ODzP9J73SOAt04fQ7Ip1iNRPh9/iCpyG9cUD7uCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728919722; c=relaxed/simple;
	bh=GOY2LALp9PgBCrTIZavuPYxhSWkM7sIYSTmUNjXQfT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Th5IA5fCHgq7dbWX+SGCxmeoVDN0L/pcv3o/SGgzGr5ToA8dJNIi6GoirQyCuJi6laJBbIoVz+qgRWO8SDupPS5WGWTD6p8WoOwU9p9TjKPbTnq1vI/S9zTb6Kl+tBcph5DvRkqTV2UcBvKLeC2HiWlg7ESsVcCd6u1te7zRMw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLVknPOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D565DC4CECF;
	Mon, 14 Oct 2024 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728919721;
	bh=GOY2LALp9PgBCrTIZavuPYxhSWkM7sIYSTmUNjXQfT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vLVknPOje3oOFClD0CvAA+0vXsDdOBTI6LorhfZP4PISNeq7fFL4OnkCJ0hQB/Sql
	 m3T+tHKeYeAbM3ZHmqluKMLXoNKM1fnx9pbdfzYcudGSrWZsVeMZjpP0zuZLdgPro2
	 MRjHTq5++QR+3gJtowv4Us2CG2HAlXY5PiCoJxmeXSmBOz+0fnTcz/kEWc9aYphGDh
	 BB3U7PyDPGjNBRmqXLiy8lrrf92PLR7zbSusnCXVbe0jiUQjPdv5+8VQj06AObJi0p
	 41jjCowZQdFB8sfjo6mxqJPeR1ZT6JSBrGVBvZZLUq+Fq9mqoFG9ZXWwCRPNbltQkD
	 eDvwS+esy90OQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso15068991fa.3;
        Mon, 14 Oct 2024 08:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMu+OJrM6onVc47xw9SGzjQXJgDWkNGFUacCTl12YqRkDVW25ieXfC/an8E8bQxcy1sKP3D5w6GXQorfil@vger.kernel.org, AJvYcCXR9Lki6qbSmgcqoNfl4XIYArrnDIy7razHVF0MvLB5HoF/mMdWbtrtOG1LR2M3YAS1DW5PkyKqdOqAQAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqyVbUYzT72OBQLhuEmCU2eqgkmXfPONPS8WhLeT4Rcj+C0Ns+
	7vqROgpxhCKMtwV8g9QTFPpi6Zvl/pda/KOfYg+iYVtA6Yij4NtLBKIMNpvZh+/jsy8WrVwzWk8
	nen1pTw4NcrEG7dUQ133tEC+YGVc=
X-Google-Smtp-Source: AGHT+IGZw0sfP5fXotQ+EW8q59RrWgTE+YxHXTOxMH816H028SiBsvxr9usneTtq13TEEEvwEysuaklZ8W06Hx+sLW0=
X-Received: by 2002:a05:6512:1598:b0:530:b773:b4ce with SMTP id
 2adb3069b0e04-539e551a25emr4543093e87.33.1728919720519; Mon, 14 Oct 2024
 08:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241013131110.1706-1-esalomatkina@ispras.ru>
In-Reply-To: <20241013131110.1706-1-esalomatkina@ispras.ru>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 15 Oct 2024 00:28:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrtLTrU2dpNwqjWQNhXzPxunjygrix2AMQ6B2UcWrNQA@mail.gmail.com>
Message-ID: <CAK7LNARrtLTrU2dpNwqjWQNhXzPxunjygrix2AMQ6B2UcWrNQA@mail.gmail.com>
Subject: Re: [PATCH] sumversion: Fix a memory leak in get_src_version()
To: Elena Salomatkina <esalomatkina@ispras.ru>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 10:11=E2=80=AFPM Elena Salomatkina
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


Thanks for spotting this.

This is a bike-shed, but please use 'p' or 'pos' as
the moving pointer and keep the 'buf'.

This is consistent with the following functions:

extract_crcs_for_object()
mod_set_crcs()
handle_white_list_exports()
read_dump()
parse_source_files()


> ---
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
> +       char *buf, *orig;
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
> +       orig =3D buf =3D read_text_file(filelist);
>
>         md4_init(&md);
>         while ((fname =3D strsep(&buf, "\n"))) {
> @@ -406,5 +406,5 @@ void get_src_version(const char *modname, char sum[],=
 unsigned sumlen)
>
>         md4_final_ascii(&md, sum, sumlen);
>  free:
> -       free(buf);
> +       free(orig);
>  }
> --
> 2.33.0
>
>


--=20
Best Regards
Masahiro Yamada

