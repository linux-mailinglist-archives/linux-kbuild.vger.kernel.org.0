Return-Path: <linux-kbuild+bounces-4601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACB9C2FD9
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 23:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF8F1F2137C
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 22:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F8C14B976;
	Sat,  9 Nov 2024 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPX4xBFJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648E42069;
	Sat,  9 Nov 2024 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731192814; cv=none; b=U8o9ivDiJ7RkhcBb3dOv/7qAC/b3EPDERL8oypelIvl9p3dohjOWBzREkWBZ8P15YJhdjdKR0UFc6AlFpzNGeGVGfrsCgIxkjqh7Yjli7/6x8eM92uqiPNVPSEEe/IiuEtX9NaR62QdFI/grYwPZTW67x8a3Eio3T2EL2fiVCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731192814; c=relaxed/simple;
	bh=xtcrRBtDp1sQT0+olLfHpFoUN9DRG4asrIehpwN2shU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRx7SyuIbEFMjD47e7PCQJdZTESxwPQCW7TkMVWG5S0FbWDKpGUwXFL3QcI2LdvOYcO+BAUSagxvZXhyZ3fKlA3rwo61wkbmkbAePtxpEaoIlfpG+K7nI80em/5cSidDu2Lms1cVnS4PYS4plL6Tax12Ot0u94F4nLkqZ5+PCTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPX4xBFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B82DC4CECE;
	Sat,  9 Nov 2024 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731192813;
	bh=xtcrRBtDp1sQT0+olLfHpFoUN9DRG4asrIehpwN2shU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iPX4xBFJO+DLDLWfGnZwDzJz+350Jl+p/Wjd1mXWjXvvLePBnvbRqSUpkA3vmag/I
	 a+5gbmDwYC/F2i9T9WCbDawKptanoPpoLskgED7+2h/AVZX9ETah6xO8kUY3se2B/g
	 WBZuE7d0Lg6FCwluIR9dOvfjh43ScCO8FXbWOcC/6YliZLoH1nNB2+H2RjUAsqmluv
	 r1zWqcEwE3EfpS2DF8XnLaF3pd9cglAd/WdQFa8Z5ULeufpn8HKSsKq65uubxU+dgt
	 OVg1NtFgDtBUJ9bHhuCd19thrhPYL7Dql6tAAdNMmTrjffLWr7pmFDEbnYMvuAkJ7K
	 cwwT+NpBfjD5Q==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so39208801fa.0;
        Sat, 09 Nov 2024 14:53:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwFiuloN1/GDZuo6Kdbs7KS3NvDjcA374ztyk8W7oDCFOFS0/SLfqZZafEqvMqf23ye9S0jvi7n7mx5HJJ@vger.kernel.org, AJvYcCVL5kp4uQEATtQYTe0+KxpeDar4O3o/KxiILzxQR6gGu85iLPIB/KuGhvrvFz2PUD456SYm5NZ/inNyaSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCLEjyJSqds2uXFHgzK2zSQ/YEcFjgL/bvaDMcP2TsKSlIhFu
	d3b0q7Q7Hk8BU1YENFCh+ynpacXE/q2QmS7iz1j0Wg4SzJkW3E8lvazbcPcDxXLrmlwnWHbhk3G
	AAi9YaM4OsJC9ZQg3ixHXTaYzFk4=
X-Google-Smtp-Source: AGHT+IHjvn36AnbQLmAWrdPLIf0XSNJ4Dxd6AnhuLakBkJhSf8xKtWBp8YWLdr4o6gqYTIovPRGtUTSjRuk/Ho4NbdY=
X-Received: by 2002:a05:651c:221e:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff209437a4mr22012941fa.2.1731192812236; Sat, 09 Nov 2024
 14:53:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031132630.24667-1-t.boehler@kunbus.com> <20241031132630.24667-4-t.boehler@kunbus.com>
In-Reply-To: <20241031132630.24667-4-t.boehler@kunbus.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 07:52:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSJJy27=jc3qQVsLd0kYmUJBOa7c=b6pHeonx81TwKFQ@mail.gmail.com>
Message-ID: <CAK7LNAQSJJy27=jc3qQVsLd0kYmUJBOa7c=b6pHeonx81TwKFQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] package: debian: don't include .gitignore under scripts/
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <t.boehler@kunbus.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Philipp Rosenberger <p.rosenberger@kunbus.com>, 
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please use "kbuild: deb-pkg:" as the commit subject.



On Thu, Oct 31, 2024 at 10:26=E2=80=AFPM Thomas B=C3=B6hler <t.boehler@kunb=
us.com> wrote:
>
> Files to copy into the header package from the scripts/ directory are
> listed by a call to find which also includes .gitignore files. These
> don't belong in the package, and lintian also complains with a
> "package-contains-vcs-control-file":
>
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/.gitignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/basic/.giti=
gnore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/gcc-plugins=
/.gitignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/gdb/linux/.=
gitignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/genksyms/.g=
itignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/ipe/polgen/=
.gitignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/mod/.gitign=
ore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/selinux/gen=
headers/.gitignore]
>     W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-contr=
ol-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/selinux/mdp=
/.gitignore]


Could you add log messages based on linux-headers-6.12.0-rc6 instead?
Then, the line length will become shorter.



> Filter the .gitignore files so they're not copied into the resulting
> package.
>
> Signed-off-by: Thomas B=C3=B6hler <t.boehler@kunbus.com>
> ---
>  scripts/package/install-extmod-build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/install-extmod-build b/scripts/package/insta=
ll-extmod-build
> index d2c9cacecc0c..5c735e176b53 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -12,7 +12,8 @@ is_enabled() {
>  find_in_scripts() {
>         find scripts \
>                 \( -name atomic -o -name dtc -o -name kconfig -o -name pa=
ckage \) -prune -o \
> -               ! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o =
-type l \) -print
> +               ! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o =
-type l \) \
> +               ! -name .gitignore -print

For consistency, please move the new pattern before -a \( -type f -o -type =
l \)



>  }
>
>  mkdir -p "${destdir}"
> @@ -23,7 +24,8 @@ mkdir -p "${destdir}"
>         find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
>         find "arch/${SRCARCH}" -name generated -prune -o -name include -t=
ype d -print
>         find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
> -       find include \( -name config -o -name generated \) -prune -o \( -=
type f -o -type l \) -print
> +       find include \( -name config -o -name generated \) -prune -o \( -=
type f -o -type l \) \
> +               ! -name .gitignore -print
>         find_in_scripts
>  ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
>
> --
> 2.39.2
>


--=20
Best Regards
Masahiro Yamada

