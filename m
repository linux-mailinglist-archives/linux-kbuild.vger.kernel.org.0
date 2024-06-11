Return-Path: <linux-kbuild+bounces-2059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB508903F6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6F61C23D64
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 15:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C51B179AD;
	Tue, 11 Jun 2024 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK++gawO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129FFA94C;
	Tue, 11 Jun 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118056; cv=none; b=MPMEzKpqGTxu1iCKK90uII6G98Mj2N38wiKjzFnB9x+SKRoMCfM4ShK7RhWBve69odV1vtvp5BWZsqU+CqtIDE1P+5SKcJnkB9yBLYjPKxK1yTPi9IYaYcb1LSfllF0rvgTyovj8wozD6vXlJOklG0xSv8YUUatC3lNciYUBL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118056; c=relaxed/simple;
	bh=6AxpCQRp4CcCzGPTkvMdBUk76WhbB3R46k9hHy1H/X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+1Rw1eBj0X1wMaNBBo7PLpWftl0G9/hLKbgKPcYHHStRs/nNSCuSaB8Ea60wyQrA3OZGr0JHcqtLPOKefYrchQLmysYA8RhFe1lOQBmqkFmVNtVNeDpB5+JKh2loYnGPD0ZRBcuQ7uOXCiqX1OijiYpEbro5vcOHScCPjwbVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK++gawO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADADC2BD10;
	Tue, 11 Jun 2024 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718118055;
	bh=6AxpCQRp4CcCzGPTkvMdBUk76WhbB3R46k9hHy1H/X0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lK++gawOAE6NEeUaxXIDX1T+5GPz34SU9iKWri2aDHHa3CmTKMrOp2okkSwkADM9S
	 JmKpnWzCct8hWUkOXbieudG/cbwiXYqgbYWUSxJC9lyeshc1Aun1yBc6RTao6Ma+bs
	 BxZyiZD0Q+evT1i5rc2eTh0jzQfwGzc+eT/6nKvN81H+YNRcDQoEmu0EJlE9TfrO0N
	 MKtsBhhyOwixBOL51EmvBqayqIzO5qfWRNLtDUclcivUJuBDUXMX+VELO/t8SpX1wS
	 TPN8DiwtAmYMqWFMFDIkuwzRDxXMimOaMjPDQNGd4SdkEX0l7MEHvMJRkHlF79xOy+
	 a88HWDgcLa0tg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so4242459e87.3;
        Tue, 11 Jun 2024 08:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVowPU0khFPiMVTqCRWWRoYOiTYibzZF/duiL48hW1fWMVPrmVraJR16TNZWebJJYYDPCfRrmM0mm3pyd2pCgIOiIXDQoQW1823ItPU
X-Gm-Message-State: AOJu0Yyf/+zQ3X9O0Vga1XngHC5FfFHEtRyKsKIaUgGtti5Juocgs7Mz
	GAaUENWLh7qPhDbpxHcXVgCSZ6hJSD9tWTLl84a2HMz+MNmNj1CBn3eTDS5G+188j3GSDLiryZa
	cSsUgUBKs+yLC95eBGBG513YGAfE=
X-Google-Smtp-Source: AGHT+IGINOhzeZws/aQKQHJqJY9w+n3IdAFpdhvjtBhtXsixm0FIWnPZLcRWpo+Bp75TAg7lqZxIpftnFcVM+mT3aWY=
X-Received: by 2002:a05:6512:1191:b0:52c:856d:dd18 with SMTP id
 2adb3069b0e04-52c856debdfmr5745187e87.4.1718118054270; Tue, 11 Jun 2024
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610163856.693110-1-aquini@redhat.com>
In-Reply-To: <20240610163856.693110-1-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Jun 2024 00:00:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASe0q4W2cuLnLnpJbWtyoOoZ6Gi+wJw=JiRyZrT9KdNEQ@mail.gmail.com>
Message-ID: <CAK7LNASe0q4W2cuLnLnpJbWtyoOoZ6Gi+wJw=JiRyZrT9KdNEQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: fix rpmbuild warnings for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 1:39=E2=80=AFAM Rafael Aquini <aquini@redhat.com> w=
rote:
>
> Newer revisions of rpmbuild are throwing warnings about the current
> kernel.spec template having an unversioned kernel-headers in the
> 'Obsoletes:' field and not being able to source the epoch's date from
> the spec's missing '%changelog' section:
>
>   $ make srcrpm-pkg
>     UPD     include/config/kernel.release
>     GEN     rpmbuild/SPECS/kernel.spec
>     UPD     .tmp_HEAD
>     ARCHIVE linux.tar.gz
>   rpmbuild -bs rpmbuild/SPECS/kernel.spec --define=3D'_topdir /mnt/nfs/wo=
rk/kernel/linux/rpmbuild'
>   warning: line 34: It's not recommended to have unversioned Obsoletes: O=
bsoletes: kernel-headers
>   warning: source_date_epoch_from_changelog set but %changelog is missing
>   Wrote: /mnt/nfs/work/kernel/linux/rpmbuild/SRPMS/kernel-6.10.0_rc3-1.sr=
c.rpm
>
>   RPM build warnings:
>       line 34: It's not recommended to have unversioned Obsoletes: Obsole=
tes: kernel-headers
>       source_date_epoch_from_changelog set but %changelog is missing
>
> This patch addresses both RPM build warnings.
>
> Signed-off-by: Rafael Aquini <aquini@redhat.com>
> ---
>  scripts/package/kernel.spec | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index e095eb1e290e..4d58b29c03ad 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -1,3 +1,5 @@
> +%global source_date_epoch_from_changelog 0
>


Another possibility might be to add %changelog section.

In Debian packaging, debian/changelog is a requirement.

scripts/package/mkdebian generates a very small
debian/changelog with a single log entry.




>  # _arch is undefined if /usr/lib/rpm/platform/*/macros was not included.
>  %{!?_arch: %define _arch dummy}
>  %{!?make: %define make make}
> @@ -27,7 +29,7 @@ The Linux Kernel, the operating system core itself
>  %package headers
>  Summary: Header files for the Linux kernel for use by glibc
>  Group: Development/System
> -Obsoletes: kernel-headers
> +Obsoletes: kernel-headers < %{version}


No objection to this fix.



>  Provides: kernel-headers =3D %{version}
>  %description headers
>  Kernel-headers includes the C header files that specify the interface
> --
> 2.45.1
>


--=20
Best Regards
Masahiro Yamada

