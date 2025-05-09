Return-Path: <linux-kbuild+bounces-7054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7948AB0745
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 02:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6827717E856
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 00:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B144717BCE;
	Fri,  9 May 2025 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhYED6Sd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1B3FC7;
	Fri,  9 May 2025 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751676; cv=none; b=FyKpqqfkzsT9d9EQ1L0MuRt8mfgPg/yomSjPIDgBPqNmPMhoT7YsDAX5xcQE+yRkGJw9St2sb1WjJ0biGhea6C8pgH3a43jMkIrYGDZdYB69AEUs/il7TozE0B2FiIOLoU0Mq0V/aUEYtGSfaOWrmc6AaF1hoe5QtpjGu3Hwikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751676; c=relaxed/simple;
	bh=bMakgoMCuiRE72u/z+hJBAzxNQv9g+Mt/nWMliQW9cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFgE3SYqK5wG7zWyrK3dfTI3ptOp8i0iE4B+45X5mA1Z+4Gx2PiV73+V/9e8lpU9Ne5Ucag/Iqh95xd4wQNXB5PFQMlxWBag6x6GBnTY6JvG+OYCgQpPjFOysgr3pg+0Dfpd9u5G+qEbwQAHvJq7pSJRkrMcSDlcphkmbwy1WNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhYED6Sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DB3C4CEE7;
	Fri,  9 May 2025 00:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746751675;
	bh=bMakgoMCuiRE72u/z+hJBAzxNQv9g+Mt/nWMliQW9cs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XhYED6Sd5TjEoox6RCu60AkqsdrkeQ+XbMCsWxO/VYqx0YuIemCzYjffuEbFIIftg
	 1XdkJ+J4CJoMBOa+uIzdTRvzJ+niJ3nv9TcBdvpaMWYEJ0CsiJmAhPPpBQubTxU6e+
	 juZ793W+uXqvPi6zYeqJXEoIzBxLXzJF8LI3HFKGF8WhhpdXxTHhKXcF0uvAUazKkg
	 yTLG/9gljKa2TwdIhKPRjNodB2pQk2+O3POiu+WV4j0EHtd8yYRm31bx2SGFe6RdpE
	 +cCrGbklk3lLBixRS2mcB//FkiDIOQSjds3fI0sH9co/to1gBySjSmqWUr36M8PmJY
	 aVPjo+eI2EJbg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10956398so793193e87.0;
        Thu, 08 May 2025 17:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvgH76pF8RJL1sBG4qBIET830lUTAhZyVTpGAUgO15aRkEhE7C3B6gikOqXSLxG/m6AUtQvpjtTpnlWal0VA==@vger.kernel.org, AJvYcCVKzrG4e4vt8NSerdnleFtIz8UX+GXfwFSjZVtNe3K/W/DxeRAV7SNmLrVzmZfWV1jqWtY4r+8kTbgA7g0=@vger.kernel.org, AJvYcCXS0/WUOyk34oW5JTUlVNOPfMZ83e7IQWr8mVaGnxlElXHQYcMpGsackt6XE+Dy48rI4hb3EEZs9pxEZ1ti@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhSFSEjA/UQoAxZQfFH2Jv49Pp8NGGX981uPb9SqPTAMedn2C
	DXOZCNJO98liZpitbyV9s+THQSY5IGl7TMqXHt6gsXSUUKf9by+wS4BBGcz/awoG9HhAsGK+7aO
	BIVax8anM2WuOHuCn4kpQaG+qLII=
X-Google-Smtp-Source: AGHT+IFv19RUNrFsCEhoEdrdZSMlUKojQE9ydSn84wpWSlEvgoaEXcsWoPuOwYb8qhFkDFA1A40/QAjvvOqk9FF2nQw=
X-Received: by 2002:a05:6512:6094:b0:549:7c5f:d961 with SMTP id
 2adb3069b0e04-54fc679583amr418503e87.17.1746751674642; Thu, 08 May 2025
 17:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141843.937580735@infradead.org>
In-Reply-To: <20250502141843.937580735@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 09:47:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCQ6_yWiUCwVLEAeqJ_zN4pw73uLaJ7pWd02dqiSDa4w@mail.gmail.com>
X-Gm-Features: ATxdqUGI3Y68vP87Uwm_DYEQHZajtw-tHyZdm5jP7oRxwSU3uhUsZJ1CM3C6U2o
Message-ID: <CAK7LNARCQ6_yWiUCwVLEAeqJ_zN4pw73uLaJ7pWd02dqiSDa4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] modpost: Use for() loop
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:25=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Slight cleanup by using a for() loop instead of while(). This makes it
> clearer what is the iteration and what is the actual work done.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  scripts/mod/modpost.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Applied to linux-kbuild.
Thanks.



> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1595,12 +1595,10 @@ static void read_symbols(const char *mod
>                         license =3D get_next_modinfo(&info, "license", li=
cense);
>                 }
>
> -               namespace =3D get_modinfo(&info, "import_ns");
> -               while (namespace) {
> +               for (namespace =3D get_modinfo(&info, "import_ns");
> +                    namespace;
> +                    namespace =3D get_next_modinfo(&info, "import_ns", n=
amespace))
>                         add_namespace(&mod->imported_namespaces, namespac=
e);
> -                       namespace =3D get_next_modinfo(&info, "import_ns"=
,
> -                                                    namespace);
> -               }
>
>                 if (!get_modinfo(&info, "description"))
>                         warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
>
>


--=20
Best Regards
Masahiro Yamada

