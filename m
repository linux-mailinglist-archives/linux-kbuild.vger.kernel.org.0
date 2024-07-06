Return-Path: <linux-kbuild+bounces-2405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF7929094
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 05:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82F90B2258A
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 03:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448AED520;
	Sat,  6 Jul 2024 03:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdegHOt6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F1CA3D;
	Sat,  6 Jul 2024 03:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720237272; cv=none; b=b/Ub5qOdeGfk1BVluxsE8OLX2In3+jUl7c7LLy97510/hvKx3WAHP8GWB3Hyp67EY+tkG5C5ajnAeng40LafgRU9gPlhc2DuH+td0veRUqI39wwSfCFmtEwkYWbAowgwqCbaonxytrBAhIPGcZSxcA3+T3kXTvFkQnOBNwFd1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720237272; c=relaxed/simple;
	bh=dnQTlqE5vEF0/xAhbN3NPMt1YZcgHwtpstjGYKUP9kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gu01t/XVzAPX8hw48rSThsrUxFcweM7exEPyXup8YfjVWwLIG5ev/ZhKddrNQ+jgnwGd0+c/43OCHM5GO8vUPImSNHa4WZtg1vtHYDLVnQoZL6OW4DbJ0y7C0NwCdIk+tEx+ZbqPWzaU2MKbzrKgqOS+/Q5+qbtm09l8CqYSwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdegHOt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAF9C3277B;
	Sat,  6 Jul 2024 03:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720237271;
	bh=dnQTlqE5vEF0/xAhbN3NPMt1YZcgHwtpstjGYKUP9kM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LdegHOt6ANUZ3LVOb9GMOf1bZ+B2Vc30LIgk14rBaVmR0H5hRdsejf9R4lWdk0Sh1
	 xL+H0cV7hrHuPof1rq0nnJKWCwp5Y8TTZpmOeoFaGo6RF0yBrs6lEUT/pWgA1sdc1o
	 N+IikG2uwTdxKdAVNMl7g1fSKbR6UnoUM3vrrAVKBuk11G5LR32aYrE0/CH4WeAoCW
	 4GT7MJTf9eOwc9t7+3SZTpwhw3JVi0OpmtAqpEPPuGh4mYUPCqIa63h8Tv9cQDRgh1
	 ESZLrxzKBt+/YKA6SDtrzcRSPb2eWZjYlUlnu3R1R/c3r5Yn94FHlN7LRlxW0BB1bW
	 hHJG+aGXhZ6pg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea79e6979so1222883e87.2;
        Fri, 05 Jul 2024 20:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXePl4jmsKId+t4sURdk4w5cI2idQgbZaTWV7jamU1GO5EtrdR0nmz9sCjzA/uoTMGDCHg8PpOeUyY0/Koo5FRA5/gPzSkQ23LJi8Zp
X-Gm-Message-State: AOJu0YyoQiH7swppssmtvemr4VHTHRtaPHy0ZBhkkTSznndGUAAEXr0Z
	nHQe7hyyAK8Kv9ws40IcHL8HawEPBSvz8PL5SyJte1/8VOpO9IJmQea/nsMby9sRr1fWngY+5Dg
	Ee9HpRMmQtywJrK+aBglE706Kcmw=
X-Google-Smtp-Source: AGHT+IHq4GfIbwXhmYmJ6YNNElfd+1DbLFNa7ZZ6gG5GpVtvD6rgAzSAWD8pDPkCCTtQL7O/cKRNSWJ2BXDytfl+urE=
X-Received: by 2002:a19:8c48:0:b0:52c:e180:4eba with SMTP id
 2adb3069b0e04-52ea06f7cbbmr4093045e87.62.1720237270285; Fri, 05 Jul 2024
 20:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
 <20240704193642.1929491-1-aquini@redhat.com>
In-Reply-To: <20240704193642.1929491-1-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 6 Jul 2024 12:40:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
Message-ID: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: rpm-pkg: introduce a simple changelog
 section for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 4:36=E2=80=AFAM Rafael Aquini <aquini@redhat.com> wr=
ote:
>
> Fix the following rpmbuild warning:
>
>   $ make srcrpm-pkg
>   ...
>   RPM build warnings:
>       source_date_epoch_from_changelog set but %changelog is missing
>
> Signed-off-by: Rafael Aquini <aquini@redhat.com>
> ---
> v2: move the changelog stub generator to mkspec (masahiroy)
>
>  scripts/package/mkspec | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ce201bfa8377..6abbfef700fd 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -28,3 +28,25 @@ cat<<EOF
>  EOF
>
>  cat "${srctree}/scripts/package/kernel.spec"
> +
> +# collect the user's name and email addr for the changelog entry


"addr" -> "address"






> +if [ "$(command -v git)" ]; then
> +       name=3D$(git config user.name) || true
> +       email=3D$(git config user.email) || true
> +fi
> +
> +if [ ! "${name:+set}" ]; then
> +       name=3D${KBUILD_BUILD_USER:-$(id -nu)}
> +fi
> +
> +if [ ! "${email:+set}" ]; then
> +       buildhost=3D${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hos=
tname)}
> +       email=3D"${name}@${buildhost}"



This is not what I suggested.



My intention was to avoid spaces in the email address.


Consider this scenario:

 - `git config user.name` returns "Foo Bar".

 - There is no configuration for `git config user.email`


The email will be set to "Foo Bar@some-hostname".




I am not sure if a space is allowed in an email address,
but I have never seen such an address.









> +fi
> +
> +cat << EOF
> +
> +%changelog
> +* $(LC_ALL=3DC; date +'%a %b %d %Y') ${name} <${email}> - ${KERNELRELEAS=
E}
> +- Custom built Linux kernel.
> +EOF
> --
> 2.45.1
>

--
Best Regards
Masahiro Yamada

