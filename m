Return-Path: <linux-kbuild+bounces-6112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16943A5E937
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 02:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815FA3B80ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D89915E90;
	Thu, 13 Mar 2025 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2RZfHfx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76802E3391;
	Thu, 13 Mar 2025 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741828176; cv=none; b=OxIBjeKd1Ef+ly4Lw3l/JGwOSKVnOkEJgZ+CI2YI1XrkgpKFqq8l4kvTNM8VJUSvhkkgHn93r862k7Y4R+1koQpJ+qJl7Nx1Eb5RU/BuRSak4Oxfbiy3ZC0hxrBcjXZUTA50CMFiv2YfwCw+SMcQZjGWxpip5vOpIudvNP2CTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741828176; c=relaxed/simple;
	bh=B8HwtBeRaBHX5JkhLaSUnbwXsgTX3Q2lYTiyZCaBn8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfD3VMUkST9fex4mq0sqvJub9YP+nzkiAkLsLpx6bLO+1Ru0IIevd+YMFt29UzpbF6iWEWXkG0epu9GTgkhdblbgDd/gqbd4LeY0BILyNU1UNaxfgZrHBrYT9UGFtADz40K7XC+57jlBg3bqnFpFfjP62/Dh/43hP6d9xWOIwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2RZfHfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641EBC4CEDD;
	Thu, 13 Mar 2025 01:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741828175;
	bh=B8HwtBeRaBHX5JkhLaSUnbwXsgTX3Q2lYTiyZCaBn8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q2RZfHfxspRUmiRDGz1eQYWca14CBctZRqmJ16TJt+kFFcS5rMijsvjUuz6QXnyy6
	 03om4s121sP8wh4BkrGOBCx1PSYmztOe3U6Zs2MhwXtdyuNL7eMoAGl4GOcyeeT4mG
	 ZKAj8wEb/IRIsrCvv5tiBt4o1sU+qTTRFOrbzZOVcCIHqnJYIyd0erdB+SNe+CBzyn
	 e+W7M4vBOwQlkt8577G6sRta4NxBqu62HyUJO+RF9G41aXHpKe9No8hjUFhuAA6+ik
	 PX3bOwelan9yK0d3uDQcXmKYnuUFDE5+OosGpovScnj4TYxag7SuuTOhPrYnBWDBYg
	 te/e20T/7s9JA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54963160818so511420e87.2;
        Wed, 12 Mar 2025 18:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF0Uu8wfuJflTBVfObuqW88P3NP5WUd2RdQZGglhYov8cpJRjS4Ul27w+gshvj5xwI6XP4Rob8gIliPG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtgWklIvlCa1STkPj0fiysM8pb2gcJkNz/sulyc/8obfjixn3L
	jEXcXDQxLw++QJ2zSjZtbMUdQg964ZFG+cNLFzpCL4FhIk0+i3pyiQL5XykFTcQ31wvd2Z2L54P
	J2Sy7I8+3B8SVelSm0LQHqAmDUgw=
X-Google-Smtp-Source: AGHT+IFcqvfBK68BflSjEsKvxfdHwOVmP0F1TRkLwGsuRvd3qs57522RPwblzli5/mHmSvGhpUo6BT/N+AoOzkTRGxY=
X-Received: by 2002:a05:6512:2203:b0:545:22ec:8b6b with SMTP id
 2adb3069b0e04-54990eadb29mr8212477e87.35.1741828174119; Wed, 12 Mar 2025
 18:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312033421.2365201-1-xin@zytor.com>
In-Reply-To: <20250312033421.2365201-1-xin@zytor.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 10:08:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJ4g3OeD1wo+x=P3ZkkT3mG1JTZCzkuT_3F8eHm5xeig@mail.gmail.com>
X-Gm-Features: AQ5f1JrPBxNEmEklDdxxiwmQPfFeDBzR-Ujh2xOuHw3dw3B0mYVA2_y8zsc15gY
Message-ID: <CAK7LNATJ4g3OeD1wo+x=P3ZkkT3mG1JTZCzkuT_3F8eHm5xeig@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] kbuild: Add a help message for "headers"
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com, 
	sraithal@amd.com, n.schier@avm.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:35=E2=80=AFPM Xin Li (Intel) <xin@zytor.com> wro=
te:
>
> Meanwhile explicitly state that the headers are uapi headers.
>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>

Applied to linux-kbuild.
Thanks!



> Change in v3:
> * Fix a typo and write uapi in capital letters (Nicolas Schier).
>
> Changes in v2:
> * Revise the help message for "headers" (Masahiro Yamada).
> * Revise the shortlog (Masahiro Yamada).
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 70bdbf2218fc..08918088ab35 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1659,7 +1659,8 @@ help:
>         @echo  '  kernelrelease   - Output the release version string (us=
e with make -s)'
>         @echo  '  kernelversion   - Output the version stored in Makefile=
 (use with make -s)'
>         @echo  '  image_name      - Output the image name (use with make =
-s)'
> -       @echo  '  headers_install - Install sanitised kernel headers to I=
NSTALL_HDR_PATH'; \
> +       @echo  '  headers         - Build ready-to-install UAPI headers i=
n usr/include'
> +       @echo  '  headers_install - Install sanitised kernel UAPI headers=
 to INSTALL_HDR_PATH'; \
>          echo  '                    (default: $(INSTALL_HDR_PATH))'; \
>          echo  ''
>         @echo  'Static analysers:'
>
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
> --
> 2.48.1
>


--
Best Regards
Masahiro Yamada

