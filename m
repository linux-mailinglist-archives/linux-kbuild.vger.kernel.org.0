Return-Path: <linux-kbuild+bounces-5595-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06BA247F8
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2025 10:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1283E7A2E23
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2025 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06191369AA;
	Sat,  1 Feb 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icEKna1a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B989433D1;
	Sat,  1 Feb 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738402281; cv=none; b=hwQXzckC2B1wOzvR1XwqYSxRvSsSJQFNDmk5aiKzMitxlH1G3M3wUfW32jblwHLxJA2PamIH79ayWGvjpWzeuYHxuMh2IuoU2eOYDGWGwl7kSm1U6ZWINsIfbOt82Ed6MoF7UcrUgKFGIVLVTfPqnlcqd/Gwdkhmv/4FREoBrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738402281; c=relaxed/simple;
	bh=6DiUo9G39DaWbmRy6lCYOWw+aW2k6BNakn+GWpCVmYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbuAX03rhXT87OSmsVHmLdTPuBSN9aS3hiaG61BO6vDhtbbo4lvw/sUCVR38aoLHkFsm9k0d47T7/vg473GMrbqRZADYRHvt0qMKWa3LhAeQwdTRPR/I0+YQuloywgZBJl2TUN7AiidpmUv1BgROSGgYdHJWGsgOjXJe653sIr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icEKna1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06BEC4CEE2;
	Sat,  1 Feb 2025 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738402281;
	bh=6DiUo9G39DaWbmRy6lCYOWw+aW2k6BNakn+GWpCVmYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=icEKna1ax3M+9sQ0nOXpx2qrPh0SywEn1Sq7vInQ1kK0S4/2Oc7ed3GACSDbBjn96
	 q7Dsn2yhfforlX9dr6HKfVo7u2Uq9JZLXMxnpz865w1zGfzg3MNj1fHvxnsfNael3r
	 4jn5URjGKXhvvmPsMLhpT4pKHw4gvpf9KTqWZRw6CoayNRPnBQUUnEuiHGsm7eoO0O
	 tLB2DMAvyI7E1Gjbb3LckYGdDtbS38mKPQVEIFCtxM4Yd/EmYyy+gRZVVeU1uE1k6K
	 68aFoakDdK7CFmqPtTcDaCk9ZYvr0DXHTQ4klIdDGAKdpsrnlcSYRFfpoqJwPF4LGh
	 1Ig8ZFpctEcMQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-303548a933aso23509831fa.3;
        Sat, 01 Feb 2025 01:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWC3M9YwJ2km358cx/RCKCDSShPKkbmirftu/8amwSWLphzQCzzklJL4c/BUpMzmwThLssvCIP8DvTjdAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7JmMbk5tPJJACt/hSDcLVQvBaUo1wf4940fBzDlHd0qfEe3m
	71XIMHqIyoKBiJSAHOOECO3v/Fk9pXImMu36tBOQ/HT2UzxT2LfoWA6vHjcrnGzfXTwtLYh+5Nb
	+i5oraxnrlEa5hn2Pc3/GtSOtzbU=
X-Google-Smtp-Source: AGHT+IFZ+BVnAff2qucCKMwfJKaFH6U9NoPlFG9EX15dBLth7fCztHJ+8Xt/1N2IXzize4CrVjAIfWsnTe5r1UMeecE=
X-Received: by 2002:a2e:a54a:0:b0:302:4a61:8b85 with SMTP id
 38308e7fff4ca-307968fcc32mr50769211fa.37.1738402279650; Sat, 01 Feb 2025
 01:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
 <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
In-Reply-To: <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 18:30:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+uTNfrRu2+=yc1qvWBcFuNK+PCDHN1_tODQ5EkgxCBg@mail.gmail.com>
X-Gm-Features: AWEUYZke96FRhojHqLyYZ3OPw0I6v2I9aMVr3RCPCmvk4S8BO4_q35IF-Uhgslg
Message-ID: <CAK7LNAT+uTNfrRu2+=yc1qvWBcFuNK+PCDHN1_tODQ5EkgxCBg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Feb 1, 2025 at 5:16=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 31 Jan 2025 at 11:45, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git
> > tags/kbuild-v6.14
>
> Hmm. I was expecting the CONFIG_TRIM_UNUSED_KSYMS fix to come in from
> you too. IOW, this:
>
>   https://lore.kernel.org/all/20241214105726.92557-1-masahiroy@kernel.org=
/
>
> which fixes the "load_utf8() ->symbol_request() -> symbol_get()
> returns NULL" case when CONFIG_TRIM_UNUSED_KSYMS is enabled.
>
> Obviously I can apply that patch directly, but the reason I _didn't_
> do so was that I was just expecting it to come through the normal
> Kbuild tree... Pls advice,

Sorry, I noticed a case where that patch does not work.

For example, when both consumer and provider of a symbol
are modules,v2 does not solve the issue.

I need to send v3.




>
>                 Linus



--=20
Best Regards
Masahiro Yamada

