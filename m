Return-Path: <linux-kbuild+bounces-4178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787609A3D30
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 13:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72F01C210E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF30B18EFD4;
	Fri, 18 Oct 2024 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOSoCDnr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5F200BBC;
	Fri, 18 Oct 2024 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250378; cv=none; b=g9YOFN1nikTMusAdn4TyrzRRSGZsuk6pJWX0Tg77dDjtFNor7d4VHuo61d8ggHh2Q7AtM1g0zsB2JlirhDfq+tI3KEjF5Hn9MpZ0zRZTYidcDBSw2ylH65NZ6YkQwzn1qEXV0bOyESHVXuQahvK5SV+64ypPZ6iBVQj1/xBYvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250378; c=relaxed/simple;
	bh=cZQZyFhV6odFwcw9cSqGUp+HOV68fnDoIk0m8gHESu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvVIcTSBZmyj/fKjNRHpFZnWKglPvHivdvx6SfmUYkPgtcnNsLZX8Ly5BovdS6gGBVMgOqe0SkjGo5Uou5JMjSRnpzDZlPhK3c24gmEewL5c/24sHH+92SyhPFwh0iYcRbpEyqTOYMJcl7hFj3ZEgcjk90NziLcQezsih1+pzyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOSoCDnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A264C4CECF;
	Fri, 18 Oct 2024 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729250378;
	bh=cZQZyFhV6odFwcw9cSqGUp+HOV68fnDoIk0m8gHESu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iOSoCDnrKHv9F3qbdIvsWcPxVm+kRdE2eXyjpD1P41J4Gl2vNRboPgd/f6fOniMkZ
	 +hOyy8o4SKmg9ucMMhkTE/rj1oDK2evXQmxvHChOuYG58CcNHzjGPNQDc11Y9S3bkT
	 8IEBdpuZ2TI/cGL2MlCBQCrZk8Mk0z6M2VdkjIImMgXSiTz8YmfP8f4Yz+XjPJcuhg
	 Bjom38p4aYxSOBkwtKr0X+hxr0+hBp+EftFXv9FoFPziqQq/LsuCAGjzOAjHi8Sjzj
	 OnOqbWCpDLsWuJLrqPM7G4M+K5pw5qyAA0P/N+rDLckLqlAXckbOTBG963yx9zWQhi
	 Q5Wz6A92nBwCg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539983beb19so2276301e87.3;
        Fri, 18 Oct 2024 04:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJgQnUIqBZtXmoLfLdYvGi0nsb81ZIzkjU+b4SaS9dvhxegbqAZi7VWuV0W52dR+1AK7IkedWi4M9+cQE=@vger.kernel.org, AJvYcCXLCw+HJ4nUnl248W/qc11Oq0bi6coVCjKH57SuBb7XE795cu0+dZOZ3lB6K6oCrh7Bxby21oCLS9Q8mDzw@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMwRQ1axBgJuFNT5snPQpUW5BhwGhbRzqX47/V9pKOBxpnvk4
	ZCkXlb+IiOKosEF1iuCoHdv5krtzRa/vqHTIVTJ8hOsO37UtIwi9QREvmtCjHdLYxAFTnVoEW0c
	VDS6wAHd8Obh2hCXxSv4dq1bwXlU=
X-Google-Smtp-Source: AGHT+IEU88aZtXtf9yQ9ikU7FiDgZ3r01jLQvmdVnpJB8djfFtTyO8sx2VEgMvKXQYJdS/pw86TTFXGJzhu8ilMTXPw=
X-Received: by 2002:a05:6512:104c:b0:539:e85f:ba98 with SMTP id
 2adb3069b0e04-53a154fa46bmr1195071e87.56.1729250376855; Fri, 18 Oct 2024
 04:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 18 Oct 2024 20:19:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com>
Message-ID: <CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Restore the ability to build out of tree dtbs
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 4:59=E2=80=AFAM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> A build pattern to handle out of tree dtbs is to copy the .dts file into
> the kernel source tree and run `make myboard.dtb`. This is supported by
> the wildcard %.dtb rule in the Makefile but recent changes to split the
> dtb handling out of scripts/Makefile.build stopped this from working.
> Restore this functionality by looking for .dtb in $(MAKECMDGOALS) as
> well as $(targets).
>
> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/=
Makefile.dtbs")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

This is not a use-case in upstream.

If you drop-in your downstream DT to the kernel tree,
you need to associate it with Makefile.





>
> Notes:
>     Changes in v2:
>     - keep $(target) and search for .dtb in $(MAKECMDGOALS)
>
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8f423a1faf50..78763a4bc58a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -449,7 +449,7 @@ ifneq ($(userprogs),)
>  include $(srctree)/scripts/Makefile.userprogs
>  endif
>
> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
targets)),)
> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
targets))$(filter %.dtb,$(MAKECMDGOALS)),)
>  include $(srctree)/scripts/Makefile.dtbs
>  endif
>
> --
> 2.47.0
>
>


--
Best Regards
Masahiro Yamada

