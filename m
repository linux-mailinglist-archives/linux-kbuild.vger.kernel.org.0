Return-Path: <linux-kbuild+bounces-4698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F69CFDA7
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 10:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52F21F25705
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 09:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53329192D62;
	Sat, 16 Nov 2024 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvCkggzk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F9191F67
	for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2024 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731750717; cv=none; b=VGti/WiEKJvT0Y9zgeecTK49+6/QR9ocwhtw4fvzGmbDBH19sfFbL19v5eHE4w683lIX8YIYeBznacFHau5qftaLvfb79qQDYcb6Cg/YLly15MY/kWbi5/HmizPTR6wOr7Vk8JIR69NPxKv2k8F3/41MvCLCqlMcra9mscFhLpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731750717; c=relaxed/simple;
	bh=DKhEskjUBNLAkOcJOHPaIud+CFnKLb4sCtqSwxpqzxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEJwdpzYa6pnMi34RYbSvQvf9/DGK8zi1rC4x6Y2YtZmKJMzPg4Tz8Th0JnFVhG2haQPdtzpyq3YHTZFlHuANFbKhoP3M5l6Xc0RK6159xhrSRyo0WdzMwTh1GKxeoPLjE6tJpVMQxfugIebkf/+B7pWZaF/fvP0zh3uQt384WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvCkggzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913C5C4CED2
	for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2024 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731750716;
	bh=DKhEskjUBNLAkOcJOHPaIud+CFnKLb4sCtqSwxpqzxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CvCkggzkQmJNc75WS5SxN5UOLgPmGwjyIvwQrL07cb9kBUAABT0cF0qgocLZAyRxj
	 X8ZY4bMrJaDzvnz5xTNTJe6n4J8oUaxQU8yn6p1RBt/z728GtY/aczsgZpYnJo8+VB
	 I4f87K/kOgDWIMHysTy01fQNm06xCCh77XeoPspxXemoUuf0uyALSifI8sm2etLgbZ
	 GIztKGIHhajCxKH8vaQ8DLrRgIAMuSRdza01+OHyzgBTy+yL8XB5W0PNjMMq9LIo7Y
	 eSUgzpt6QWN6Ikidfyr/QSUQ9cz5tZ1diSXrFKctYlYgk/Nv81Ix1YbTNp4A2w79A1
	 2+ysNe8Zw1bvA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53d9ff8f1e4so428559e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2024 01:51:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwUJJaUyIxN/nXMf1jOUQJx5h6tU49iKk8AXdolRj+lfOTA5sE4
	ZQxdbvnzohQIn29H4DhsCvyjJHHGUidsGPh3VIS0kQZQL3MR7hE/x/5hdtW0e6qScTufSddfixl
	9LnXQcyhYqSNMH4G8SV3X5x3xVEw=
X-Google-Smtp-Source: AGHT+IFZSwzEW31xXb2DVRA3W9Lm9z++DpEd2ogKatG7BFARkWWE62h2bR7af59BbvvOGsvfRRTJhaB0G+w8zZLwuug=
X-Received: by 2002:a05:6512:39d0:b0:53d:a680:b811 with SMTP id
 2adb3069b0e04-53dab2a2d4amr2282279e87.28.1731750715275; Sat, 16 Nov 2024
 01:51:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110182132.810269-1-daan.j.demeyer@gmail.com>
In-Reply-To: <20241110182132.810269-1-daan.j.demeyer@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 18:51:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQCERUDZAmRosDu6+Vh98bEuVyex4riAFE7oFVZAROFnw@mail.gmail.com>
Message-ID: <CAK7LNAQCERUDZAmRosDu6+Vh98bEuVyex4riAFE7oFVZAROFnw@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] package: Add extra Provides to the kernel rpm package
To: Daan De Meyer <daan.j.demeyer@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 3:21=E2=80=AFAM Daan De Meyer <daan.j.demeyer@gmail=
.com> wrote:
>
> It's a useful property for kernel rpms produced from the kernel source
> tree to behave somewhat as drop-in replacements for the kernel rpms
> shipped by distributions. For example, when building Linux OS images,
> this allows replacing the distribution kernel rpm packages with kernel
> rpm packages produced from the kernel source tree without having to modif=
y
> the OS image recipes. Instead, by just adding an extra repository contain=
ing
> the kernel rpms built from the kernel source tree, the OS image build pro=
cess
> will prefer these rpms over the distribution ones if they're of a newer v=
ersion.
>
> To make this work, let's add various extra Provides to the kernel
> rpm spec so that it provides more of the common kernel rpm package names
> used by the CentOS/Fedora distribution kernel rpm packages.

I did not check these one by one, but kerne.spec in Fedora
specifies '=3D <version>'.

So, I guess this patch will not work equivalently.





> ---
>  scripts/package/kernel.spec | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 42447c5fd7ac..61a151026afc 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -17,6 +17,21 @@ Source0: linux.tar.gz
>  Source1: config
>  Source2: diff.patch
>  Provides: kernel-%{KERNELRELEASE}
> +Provides: kernel-%{_target_cpu}
> +Provides: kernel-uname-r
> +Provides: kernel-core
> +Provides: kernel-modules
> +Provides: kernel-modules-uname-r
> +Provides: kernel-modules-%{_target_cpu}
> +Provides: kernel-modules-internal
> +Provides: kernel-modules-internal-uname-r
> +Provides: kernel-modules-internal-%{_target_cpu}
> +Provides: kernel-modules-extra
> +Provides: kernel-modules-extra-uname-r
> +Provides: kernel-modules-extra-%{_target_cpu}
> +Provides: kernel-modules-core
> +Provides: kernel-modules-core-uname-r
> +Provides: kernel-modules-core-%{_target_cpu}
>  BuildRequires: bc binutils bison dwarves
>  BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
>  BuildRequires: gcc make openssl openssl-devel perl python3 rsync
> --
> 2.47.0
>
>


--=20
Best Regards
Masahiro Yamada

