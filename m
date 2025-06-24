Return-Path: <linux-kbuild+bounces-7622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD6AAE61C0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 12:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32FAE7B1DED
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B7917A31C;
	Tue, 24 Jun 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5ovLigp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F054D53BE;
	Tue, 24 Jun 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759473; cv=none; b=ORi7I7FKXkkHkv/eeGO11681xsUhlenf9C983G7lOotYVw2CdgX5U+uPMyXxOm3TB4FLjhCXLkOxU1Fh43qj1wHOgjcVP3oIcynWfimoE88ZMqhgMog3RhVsUAyt6jB4JiNEwBIFqHiA1lnUSdIC3skEjDt6Cavj7rQVa7mfx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759473; c=relaxed/simple;
	bh=yuky1KMuwLyezT7zsNu7UR5nO0M0oPkxN05XH1BLzTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QI2r1SoD/lk0iGScdzhF/xbveYIXMQKcJhLKN4uQXBc9G1TsNbn1A5vNYmbkkQQzDiHCQHA7dZnkXP4XNY0p99rHbSv/nSw4zI/uqfj7wrJnAuiVIwEQF5S0oqp+POU44vNQLifenhE7/bFi85PtqgP/uCeWb+Zevf45hz9pvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5ovLigp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2FCC4CEF1;
	Tue, 24 Jun 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750759472;
	bh=yuky1KMuwLyezT7zsNu7UR5nO0M0oPkxN05XH1BLzTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c5ovLigpoen7/Le6G6wi16Oo/Qp9mPatsMQtPE5Aw3eH3TJHrytTYqLOFQ2z/Ddci
	 odvW50wvsOPElPNsE7eeUFCZam7b9b0U3Z4+H7sGX5EIrtGfYGqrz7JNjF9KOUvKpb
	 LcYn5DFGj+ww/PPzVLr+Vp1DIUIuJIqtV73CxV3LtbuHm73/89e4iKCNb6oQtTkfA3
	 tXaif8Y0syoYSfwO3XglEPS0YCoVXLRh4658moADGf36DJMKQHpIs26w6q9hJOzFDb
	 V8CJq1S/AN6FNJd+Ch2KzhAaRk1L6zE0AV/WtzD+4uS/AFYaF8UpbUBY5q7vYtgv9y
	 kdYaTOvkQDF9A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553d771435fso193273e87.3;
        Tue, 24 Jun 2025 03:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyVVGsqCztz6j/7fpjTU4NzlK9ezwuaizFHtq+wqDrAB4o+1jMZWlRZMV1S6AbIm6BznQSVv/yoA3zi14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy62OJ09NPWR2VyJ8jpveokT41p8114cEaEBcPgPJWFpFxSpHm
	ImT0VngESqOnbV5G0HcgOZEevp8LA0Yagwx8QhLxWYusQTC00Ptk2yIo3TDdSULL9gQEXZUJXrX
	bt3VGz7pIRz7M9IcnVedfREWJfJj0lhk=
X-Google-Smtp-Source: AGHT+IE2kPmWyLdjN2VE22RCv5wEmUp4M4LHQULY6ZKGn87p2P2hAQM7jj+tB3I/OvjU5ENSuZfXh9PuIZ4OtGZ0HxQ=
X-Received: by 2002:a05:6512:3b9e:b0:553:a272:4d1f with SMTP id
 2adb3069b0e04-553e3d15578mr4524935e87.49.1750759471099; Tue, 24 Jun 2025
 03:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621084124.7134-1-dungeonlords789@naver.com>
In-Reply-To: <20250621084124.7134-1-dungeonlords789@naver.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Jun 2025 19:03:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTUCQ4rdnwm-KMPoQxJMLF+HTFOvAM_uw15dG+HuBhhA@mail.gmail.com>
X-Gm-Features: AX0GCFtk2Ef1ilFRVYsFr-aBy0dqnUWMDsBpqsVhvycCDgvFe5uHGqsFrUodGxg
Message-ID: <CAK7LNAQTUCQ4rdnwm-KMPoQxJMLF+HTFOvAM_uw15dG+HuBhhA@mail.gmail.com>
Subject: Re: [PATCH 1/1] kconfig: fix 'space' to (de)select options
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 5:51=E2=80=AFPM Cherniaev Andrei
<dungeonlords789@naver.com> wrote:
>
> Fix that by treating 'space' as we treat y/m/n, ie. as an action key, not=
 as shortcut to jump to prompt. This is copy of commit https://gitlab.com/b=
uildroot.org/buildroot/-/raw/master/support/kconfig/patches/16-fix-space-to=
-de-select-options.patch
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> ---
>  scripts/kconfig/lxdialog/menubox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialo=
g/menubox.c
> index 6e6244df0c56..d4c19b7beebb 100644
> --- a/scripts/kconfig/lxdialog/menubox.c
> +++ b/scripts/kconfig/lxdialog/menubox.c
> @@ -264,7 +264,7 @@ int dialog_menu(const char *title, const char *prompt=
,
>                 if (key < 256 && isalpha(key))
>                         key =3D tolower(key);
>
> -               if (strchr("ynmh", key))
> +               if (strchr("ynmh ", key))
>                         i =3D max_choice;
>                 else {
>                         for (i =3D choice + 1; i < max_choice; i++) {
> --
> 2.48.1
>

I will take directly from Buildroot (with your signed-off),
as this commit provides more details about how to reproduce the issue.

https://gitlab.com/buildroot.org/buildroot/-/commit/c6597e5aa3fa4bb52e97497=
97c90467083aa363b

Thanks
--=20
Best Regards
Masahiro Yamada

