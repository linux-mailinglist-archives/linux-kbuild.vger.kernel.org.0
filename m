Return-Path: <linux-kbuild+bounces-4788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD49D5533
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 23:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C80B281BB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0BE1DC05D;
	Thu, 21 Nov 2024 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJWLzhuX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200F1DA103;
	Thu, 21 Nov 2024 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227020; cv=none; b=kd9gY4AA4vQBVytyT+M7k3O3jy/JSwjLmwUv3zRJ9AFy/JgHCDDweSa4ghuzCCLuFagkOHqLYPhk30UcckeXYyb5FnDK+/c5aJ3B7P1bVKzpzNcCET2sik4uyfmXmsXxPn7xc2zTGxZ3zVuGFWbX2l5r9vavbML9e5Ude3PhgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227020; c=relaxed/simple;
	bh=P8Qd/MRAyy/b/gU33MQSGIBjufUiMMrQJ42bPKEfkWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pq4nGqljnS3HnwS6LrJlW265UygRHdwiDWt3+dOH3e9zaKU6c2uoVW34I2TEcINbhtLnfDgYBKtHcuqsYjPTfM2cIqly3Q7KXJeml3GTVAXbMGTU1vkxynKzlpN6Lm6g4nApmRAx1FKf8tj1tAxmd3RbnNYyoGlsOqi4fUPFNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJWLzhuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910A4C4CECC;
	Thu, 21 Nov 2024 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732227018;
	bh=P8Qd/MRAyy/b/gU33MQSGIBjufUiMMrQJ42bPKEfkWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qJWLzhuXblhGHrc/UdhNMI/aMPQ4f+rWm1uLJUpLV/vlCbtu7bE6Cx/guToc4eGqt
	 yg6DKpXgmiSdb2o8t0eDbW2765Pyv21LAPOYeZ5eP7sborjvW6sOAZ7HgymHWbAvuQ
	 rrfwAgl6zTPQO54aaGiCOzOfFsGACb0WgAErIMCM9Bzwvis+3emIVfIAX9Eltbj8rb
	 cV8PgzC0CpN28z4EL+qmyHGwCF5YRfAlG9wGbYwcECwcYVaZUnOluv5sav2JYebTsV
	 AfraWN1mO9wk13MXtVOgdk6pHgiezjbBrpON/OLtlqwX4PJva87MPwHsTTypGsVuFA
	 tnhG+SeNpP5wg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1525293e87.0;
        Thu, 21 Nov 2024 14:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqXSVQ4FMF7YRIVFnO/Frh/bD8f1eSfvA/b6Kq8qvCUnQc8Zj3RJyNktTO8HnATh0LuIwkXz77wsOu/1GY@vger.kernel.org, AJvYcCXuwwMI/YDwvIceQ4hoMV32QVcWhoq9ezMq13sIlNGGPKzLqyB39G6ER1N4LVDDRpMrR5cmB1aVvuJjl6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuS4LOZ+K96SlfHXL7F5aurEcI447DsxliiNnqy8LaR4lD5Gf0
	mLCitYmtbdkRCD+W/RIp+Nye53RMwyGfYQF3HJVr99ct7CpahN1hGIXo6mmtSPUmzp0Dxi2Ets2
	ivcUrygQaDifoueaajeRnLeUxLBk=
X-Google-Smtp-Source: AGHT+IFzJA2JGKgzD7q4s8J77+zJtSvedW7tV0Gczz0OSUyzXKCpXkShpj+6t0JHVapFkxxPqHLVJ/O0fxFMYlOy+C8=
X-Received: by 2002:a05:6512:31ce:b0:536:a583:2777 with SMTP id
 2adb3069b0e04-53dd35a4ce4mr184353e87.9.1732227017219; Thu, 21 Nov 2024
 14:10:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
In-Reply-To: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Nov 2024 07:09:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
Message-ID: <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
Subject: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet build
 dependencies: libssl-dev) in 6.12
To: Frank Wunderlich <frank-w@public-files.de>
Cc: re@w6rz.net, nicolas@fjasle.eu, nathan@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 2:09=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Hi,
>
> i noticed this issue with debian package build-system in final 6.12.
>
> LOCALVERSION=3D-main board=3Dbpi-r2 ARCH=3Darm CROSS_COMPILE=3Dccache arm=
-linux-gnueabihf-
> make[1]: Entering directory '/media/data_ext/git/kernel/build'
>   GEN     debian
> dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-changes -R'm=
ake -f debian/rules' -j1 -a$(cat debian/arch)
> dpkg-buildpackage: info: source package linux-upstream
> dpkg-buildpackage: info: source version 6.12.0-00061-g837897c10f69-3
> dpkg-buildpackage: info: source distribution noble
> dpkg-buildpackage: info: source changed by frank <frank@frank-u24>
> dpkg-buildpackage: info: host architecture armhf
>  dpkg-source --before-build .
> dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev

This error message means, you need to install "libssl-dev:armhf"


> dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; abo=
rting
> dpkg-buildpackage: warning: (Use -d flag to override.)
> make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4.14/scripts/Makefile.pac=
kage:126: bindeb-pkg] Error 3
>
> it was ok in at least rc1 and libssl-dev is installed


Presumably, you already installed libssl-dev for your build machine
(i.e. "libssl-dev:amd64" if your build machine is x86_64).

But, you have not installed "libssl-dev" for the architecture
your are building for (i.e, "libssl-dev:armhf")













>
> basicly i use this command after setting crosscompiler
>
> LOCALVERSION=3D"${gitbranch}" board=3D"$board" KDEB_COMPRESS=3Dgzip make =
bindeb-pkg
>
> if i Revert "kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders buil=
d profile"
>
> i can compile again..any idea why this happens? my build-system is ubuntu=
 24.4 and github actions with ubuntu-latest.
>
> https://github.com/frank-w/BPI-Router-Linux/actions/runs/11955322294/job/=
33327423877
>
> regards Frank</frank@frank-u24>



--=20
Best Regards
Masahiro Yamada

