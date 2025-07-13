Return-Path: <linux-kbuild+bounces-7998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE33B02ED5
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Jul 2025 07:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4C64A05A4
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Jul 2025 05:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C8C1804A;
	Sun, 13 Jul 2025 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmnCrFJ0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6020E1367;
	Sun, 13 Jul 2025 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752385563; cv=none; b=sv4KyjE9E22qwb7uiRUssgTwAbdJkEs9CABxj6uKvZVs7IH162QqtIuBw0sOyoUvh7HzQImFdgpKfOXmqblER/ZMLy9ZLiWYudFbADD0tj271ZqUU2q0HblB7bTYpVywdoVhXWeT1cv+ytWID16PkteabbHDLANjLluLpwvIbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752385563; c=relaxed/simple;
	bh=4k0dAosZm31RFHGdqanbfflaQSdly0kHGmJU7XkQxMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxjrZmiV/+wr3TJt9NnBinBaT/1lQ0qcUDBnuaqbo3yIYKPclBH9gh6SK8Zgy/2CKq0nDj7qZDu85T3KkG5FKdW4KMfBM3IFiY1Bjf7nmdSE5QGkvVQ05IcSCduHRaVsxYc/nW7bvnW0ansCaLPRwcfwEs8MkgZSsagJ1K+JpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmnCrFJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C84C4CEE3;
	Sun, 13 Jul 2025 05:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752385562;
	bh=4k0dAosZm31RFHGdqanbfflaQSdly0kHGmJU7XkQxMg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pmnCrFJ0O8o0FdOoqXS/Qsg4FD7Ga2HxVDBP5Sf4IHCZPPHPT9UKlrHzNkltjFDiM
	 R+FP0vr3jyu3m3gNdHeAafOB5v0DLY6Epp0pWiBGQBKRe6Uq8T+xPrf10ZFXRbrZg/
	 DX4B0oHflPAJsSSze/EkVZ60KVo4JBh8+8XyEppr9psvqqp+hlt3x+e+0vVdG14GTA
	 XX4OpKHXt4rRgQpvxrCbWnPXmzc8rfqN159Mz+h+jVAEY9ry3NrORQ8LJkTjLbhcUb
	 gY5YSX/1bQ1EL2/G+QIAA4CH8HEHOotDbKFxOqvXnmFe0eO4wXPJlNnbtLkob2MQAx
	 +JHTGTc6HFl1Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b595891d2so26695431fa.2;
        Sat, 12 Jul 2025 22:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbO5dO8/qw8/dgb/kSDUTJWicf7kEdDdBH40a7AJV+YgvsaEupgqMr2koqhrHKYVLNEXNohRudOSj5xeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDsSyOvnobRydJucNgPJBCT9xstSz9+wiAuNldK1uJtgmvI3a
	qh5jq3G/TBTYBlOa418QW1q6xlHy9yDvBONxvFNKRgvKJgTib4G6WDtWhMaLD0nJCV3CkOptY6y
	od467c4RwpKUS52S4OagVFpViL5SXov0=
X-Google-Smtp-Source: AGHT+IFeROkFm0f0RIqF6EgyaRrSSPuVaZr2TS4nBPCgR0gYv8MpZevbzQwbOS0B2Ygnk80EpfiJXf0a0dAzZZFGopQ=
X-Received: by 2002:a05:651c:315:b0:32b:7389:582 with SMTP id
 38308e7fff4ca-3305341bb40mr20792261fa.19.1752385561469; Sat, 12 Jul 2025
 22:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711162605.545514-1-jeremy.linton@arm.com>
 <20250711162605.545514-2-jeremy.linton@arm.com> <CAK7LNAQM02RBd4M5QgNTNKNaAYKGaPUSgJRXwq=Pq3OA5dYMRQ@mail.gmail.com>
 <bef8875c-a7c1-4ae2-abc4-ce279e9d4778@arm.com>
In-Reply-To: <bef8875c-a7c1-4ae2-abc4-ce279e9d4778@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 13 Jul 2025 14:45:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARBdF+7q03N07zz=pU4Ce59+O-_2Fb0vXLSrvgnj3zBeg@mail.gmail.com>
X-Gm-Features: Ac12FXzGsnBH6conCo1C2fV5glOspyLkLcKgFQwcmrWqGp_5mv_qE78YKF9I9SU
Message-ID: <CAK7LNARBdF+7q03N07zz=pU4Ce59+O-_2Fb0vXLSrvgnj3zBeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 13, 2025 at 3:50=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.co=
m> wrote:
>
> Hi,
>
> On 7/12/25 10:47 AM, Masahiro Yamada wrote:
> > On Sat, Jul 12, 2025 at 1:26=E2=80=AFAM Jeremy Linton <jeremy.linton@ar=
m.com> wrote:
> >>
> >> Zboot compressed kernel images are used for arm64 kernels on various
> >> distros.
> >>
> >> extract-vmlinux fails with those kernels because the wrapped image is
> >> another PE. While this could be a bit confusing, the tools primary
> >> purpose of unwrapping and decompressing the contained kernel image
> >> makes it the obvious place for this functionality.
> >>
> >> Add a 'file' check in check_vmlinux() that detects a contained PE
> >> image before trying readelf. Recent (FILES_39, Jun/2020) file
> >> implementations output something like:
> >>
> >> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
> >>
> >> Which is also a stronger statement than readelf provides so drop that
> >> part of the comment. At the same time this means that kernel images
> >> which don't appear to contain a compressed image will be returned
> >> rather than reporting an error. Which matches the behavior for
> >> existing ELF files.
> >>
> >> The extracted PE image can then be inspected, or used as would any
> >> other kernel PE.
> >>
> >> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> >> ---
> >>   scripts/extract-vmlinux | 13 ++++++-------
> >>   1 file changed, 6 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> >> index 8995cd304e6e..049bab337f0e 100755
> >> --- a/scripts/extract-vmlinux
> >> +++ b/scripts/extract-vmlinux
> >> @@ -12,13 +12,12 @@
> >>
> >>   check_vmlinux()
> >>   {
> >> -       # Use readelf to check if it's a valid ELF
> >> -       # TODO: find a better to way to check that it's really vmlinux
> >> -       #       and not just an elf
> >> -       readelf -h $1 > /dev/null 2>&1 || return 1
> >> -
> >> -       cat $1
> >> -       exit 0
> >> +       if file "$1" | grep -q 'Linux kernel.*boot executable' \
> >
> > Sorry for my nit-picking, but I'd like to get rid of this back-slash
> > by breaking the line _after_ the OR operator, not before.
> >
> > That is,
> >
> >
> >      if command1 ||
> >             command2
> >      then
> >           ...
> >      fi
> >
> >
> > rather than
> >
> >      if command1 \
> >            || command2
> >      then
> >            ...
> >      fi
>
> Moving the || is no problem, but I am/was under the impression that
> implicit line continuation is a posix shell gray area? Particularly when
> its outside of an explicit compound statement. This AFAIK was one of the
> things bash clarifed.


I believe this is clearly defined in POSIX [1]


2.10.2 Shell Grammar Rules:


and_or           :                         pipeline
                 | and_or AND_IF linebreak pipeline
                 | and_or OR_IF  linebreak pipeline
                 ;


linebreak        : newline_list
                 | /* empty */
                 ;


[1]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.h=
tml



So, you can optionally put a linebreak
after the OF_IF token ('||' operator).







--=20
Best Regards
Masahiro Yamada

