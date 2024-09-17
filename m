Return-Path: <linux-kbuild+bounces-3586-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E225697B0D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 15:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2739C1C22511
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C0C16A959;
	Tue, 17 Sep 2024 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNC+hCx6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72390176233
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Sep 2024 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726580173; cv=none; b=l31N0myVd2DdT7fIkCUSocuLIC9ABs+UM6EvmPDpR8kWE5FQSKkPq3meoP/KjZ3AAZeT0nJQt5KQR3lHjoCnaTRBNZ746CYPIK0CtziZpaMX5h130PKupmk9Owr/tJ6l8JhE4dF6O7dO0QW9VET9C5q14HdDH/DDfmh3GTm3Oz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726580173; c=relaxed/simple;
	bh=fU2+9mTT8HYUtiIu+UD/btkl8OL4qTuCKM3/etSYI2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2sPIB9ACM4Nz7u1ftNIqFSG7Oz/neLTWXrlbqDaCLYofpKmr/Een18SURDKnnn58HH/h40YB5gUAEYUY9jbebf3MtWxT/iU8mYKcy2CBWTplFqg6Jj8kx9+MdhLA94RqNkH27+k5tHWTXZqPqmvQTSlpHpANcU47p1NOb4P/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNC+hCx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46114C4CECF
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Sep 2024 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726580173;
	bh=fU2+9mTT8HYUtiIu+UD/btkl8OL4qTuCKM3/etSYI2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MNC+hCx6no2PxRD4EwTKIzi8HRVy53i1p1KgMuliFHu3kxOx4Q+p1vf0gMYqzVkKz
	 xnPeBKivP/G9IbKJiIeoQNO8payfugXheoIDmdRJDAT6bxP8Xxlmj8S4nXaNgrC+cD
	 +xmTctSqeDhEkX94xmMlAWR4BZiVNqxVwXYPxbUWWmt2bbIL2JV+AA28lOhBr+FBkf
	 WnKYHLrT+aQKOSJf3O0vrJOyLL20MlevzeQZB3kAwG6wObfmGRKYQ9VJ7fxesCLhq+
	 zmxvEpLcaWltU+SxjbXxRKp2qZSjd6Nd18N/w/zDT4lFdjusPvOFFZ53DrmfvSb9u3
	 KcCUr8KuiJ2wg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75d044201so56761781fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Sep 2024 06:36:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVibNX4GbuLEB7pUBc0ac+0oNDNS0/zyEgFplVkXRJNHyZFZX+XW5D6Z7JjUDr0jm172wt3E/Xf9lt2SNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEsL1nryuYikYItMx9bPZxDFa3xK7B1K9SpblQtlZL/ezwnLjJ
	AHtRYAdbsQgYD9auiQN+DBcILa20uNuuS1wbarEaK72HKDvvUxqq5lrxPZKD8yl8i2fQ67HjeEA
	wVDD7hcT6ASTM4IoVKcbF1vDOXy8=
X-Google-Smtp-Source: AGHT+IHZ0cYv6cSLZfXdt5Anc5bdvuKcnGVF+R2nOXEmxri6VGPeA/bQEmqyziycvBNULdLhPRCeDFbJRiOM+fGwolw=
X-Received: by 2002:a05:651c:154b:b0:2f0:2026:3f71 with SMTP id
 38308e7fff4ca-2f772619a2dmr86256411fa.8.1726580171973; Tue, 17 Sep 2024
 06:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910014327.1726214-1-ushankar@purestorage.com>
In-Reply-To: <20240910014327.1726214-1-ushankar@purestorage.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Sep 2024 22:35:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUeGSoD909JEMFjo=f350iRrWTxkpjJDj_VP6YMzrNQQ@mail.gmail.com>
Message-ID: <CAK7LNARUeGSoD909JEMFjo=f350iRrWTxkpjJDj_VP6YMzrNQQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: include vmlinux debug symbols
To: Uday Shankar <ushankar@purestorage.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 10:44=E2=80=AFAM Uday Shankar <ushankar@purestorage=
.com> wrote:
>
> None of the RPMs created by make rpm-pkg appear to contain vmlinux debug
> symbols (though debug symbols for modules are left in the .ko files in
> the kernel-%{KERNELRELEASE} package). This causes issues when trying to
> run tools like systemtap against kernels produced via make rpm-pkg. Add
> the vmlinux debug symbols to the kernel-%{KERNELRELEASE} package (at
> /lib/modules/${KERNELRELEASE}/vmlinux.debug).
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  scripts/package/kernel.spec | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index ac3e5ac01d8a..f5d6ce95b4f0 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -60,6 +60,15 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/=
lib/modules/%{KERNELRELEAS
>  # DEPMOD=3Dtrue makes depmod no-op. We do not package depmod-generated f=
iles.
>  %{make} %{makeflags} INSTALL_MOD_PATH=3D%{buildroot} DEPMOD=3Dtrue modul=
es_install
>  %{make} %{makeflags} INSTALL_HDR_PATH=3D%{buildroot}/usr headers_install
> +(
> +       # eu-strip tries to truncate its output file, which does not end
> +       # well with -o /dev/null. so output to a junk temp file instead
> +       tmp=3D$(mktemp)
> +       trap "rm -f $tmp" 0
> +       eu-strip --remove-comment \
> +               -f %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinux.debu=
g \
> +               -o $tmp vmlinux
> +)


I agree with Nathan.
Please check what Fedora does.

Adding the debug info to the normal kernel package would be frowned upon
because it grows the package size, whereas many people do not need it.

As far as I understood, in Fedora, *-debuginfo package has it under
/usr/lib/debug/.


[vagrant@fedora39 ~]$ rpm -ql kernel-debuginfo | grep vmlinux
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/scripts/gdb/__pycache__/v=
mlinux-gdb.cpython-312.opt-1.pyc
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/scripts/gdb/__pycache__/v=
mlinux-gdb.cpython-312.pyc
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/scripts/gdb/vmlinux-gdb.p=
y
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/vmlinux
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/vmlinux-gdb.py
[vagrant@fedora39 ~]$ file
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/vmlinux
/usr/lib/debug/lib/modules/6.10.9-100.fc39.x86_64/vmlinux: ELF 64-bit
LSB executable, x86-64, version 1 (SYSV), statically linked,
BuildID[sha1]=3D109fc8dfd9c144def507008951ee8a26eef39086, with
debug_info, not stripped








>  cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
>  cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
>  if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND=3D'test -d ${srct=
ree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
>
> base-commit: e3bf4ec9d54ed96fb3eb7dd53edcc9452897604d
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

