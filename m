Return-Path: <linux-kbuild+bounces-6289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4AA6CB15
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 16:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720CC8A849C
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2193122D79A;
	Sat, 22 Mar 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSAxla3m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1B1B21AD;
	Sat, 22 Mar 2025 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742654865; cv=none; b=V3L6FpKDhiANicBkbfH9jP/XC0qljqbR9dyv8aOhickkH8fO0CqVI0j82AOBXK8QG3IQoTETB7VlFqsGMGaG9Fmw292KOE2/+Jdgvgen4DWGXgGbLR5F+w+iYpJatXJk/mu6gvZeDjMsA0XuNvCp4nx39hlIXgctbFXTpH03hVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742654865; c=relaxed/simple;
	bh=HMjVCUa3JwVw1Tv3r9wblS2PZkI9aR8/EYJChBBqnC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+EjNRmcq6eM3zk+Wwvz/bRDFyXLh9Lx/An7Xft2Wmb/UsAIkdDVwSFSYN8lT+VdC17BM1Hvr/W0bhcHtqHLu7Q+EnNgn9zCwk9z/ytbY0O7hOSY9N3/FQ3hBvC0BuiI7UGOz0CYY+ems0HdTbzjdZ7u5gpc/IKkLID/H7JcOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSAxla3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73231C4CEEC;
	Sat, 22 Mar 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742654863;
	bh=HMjVCUa3JwVw1Tv3r9wblS2PZkI9aR8/EYJChBBqnC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BSAxla3mG2O3HMKk6PuuPMpzCfgHHz0Zk95rMhijvY1IurrLhhvDUtXrzKFpkVnJB
	 IkhqCfuFU9mkXG/SArQ+0YesbLIhUz3JKDn5C2vnR0rSXumgdEoKSXH9ttuxeghNxC
	 pwCy78IIeSTJYB5VVcNrmUhUZUU9z3DbFU3au7tJQvwZQhduJo5yBxnQtXpxh2eyUC
	 hkWxaaVYkzTFG7JWWxe/1XLvf/vOiJ1HmtQEORY9DvJiym3X8JjAXI9232q5QVEsFr
	 Bz20U5eA6nw96ddqDn9sXZzLdNpb+I4YfmGI6kHFPT8gfW4p84wcUy6jVrNO0B/Osw
	 kZsKjK5A2Nxqw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499d2134e8so3727032e87.0;
        Sat, 22 Mar 2025 07:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7SToY4kWpCjySoIcd3jS/miF0VEUhuNdklblDHz/EA2DXNfQGBWBqPBNlZmEeY4Q3VvL+YWUBG6ZwHNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwC8vsmCNGtlsZC8oKDE0YGEHDNdE5wph7Nv/YRwlQocCh5BN
	AtgOAE3wpYjJN+bLa3obplNV8ZIcVMUl73m70HHIJJR8QmrZi1gqpL5/5XwA3VVRZGG0zKkJja0
	joMvavzif05llcPOfgEhSLpSFIpY=
X-Google-Smtp-Source: AGHT+IFmaT97THmqSQLLjh2ht+hdYUlbwjE3AX/JLdiH1WTAYSzgmMbCZLNSd45QmabpNASWYmgqLa3R7/5Sbo13W20=
X-Received: by 2002:a05:6512:2206:b0:549:58db:6e9c with SMTP id
 2adb3069b0e04-54ad64ef3afmr2682443e87.39.1742654862096; Sat, 22 Mar 2025
 07:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311190124.634007-1-masahiroy@kernel.org> <20250321-proud-serious-kakapo-a6cdec@bergen>
In-Reply-To: <20250321-proud-serious-kakapo-a6cdec@bergen>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 22 Mar 2025 23:47:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5ZR-vMf-dOVEe15E+Wg7vxt+cms6d5nA54qALQsUaHA@mail.gmail.com>
X-Gm-Features: AQ5f1JptLRvdGyMC3Q66pnFqUcriFQ4ahVzXCmvI4BI7pqduYgzt8AJOkyGnnqg
Message-ID: <CAK7LNAT5ZR-vMf-dOVEe15E+Wg7vxt+cms6d5nA54qALQsUaHA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: require debian_revision when creating
 source package
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ben Hutchings <ben@decadent.org.uk>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 2:22=E2=80=AFPM Nicolas Schier <nicolas.schier@linu=
x.dev> wrote:
>
> On Wed, Mar 12, 2025 at 04:00:26AM +0900, Masahiro Yamada wrote:
> > Debian Policy [1] specifies the version format as follows:
> >
> >     [epoch:]upstream_version[-debian_revision]
> >
> > Here, the presence of the debian_revision part indicates a non-native
> > package, while its absence indicates a native package.
> >
> > Kbuild adopts the source format 3.0 (quilt), meaning the kernel is a
> > non-native package and therefore requires the revision portion.
> >
> > This commit prevents the creation of an invalid source package when
> > KDEB_PKGVERSION contains no hyphen.
> >
> > [1]: https://www.debian.org/doc/debian-policy/ch-controlfields.html#ver=
sion
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/package/mkdebian | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index b6dd98ca860b..193e33bcb989 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -94,6 +94,14 @@ set_debarch() {
> >  # Create debian/source/ if it is a source package build
> >  gen_source ()
> >  {
> > +     # The Debian Policy requires -debian_revision portion in the vers=
ion.
> > +     # Since the source format 3.0 (quilt) is used here, a hyphen is
> > +     # required in the version.
> > +     if [ "${KDEB_PKGVERSION:+set}" ] && ! echo "${KDEB_PKGVERSION}" |=
 grep -- '-..*'; then
>
> Thanks.  At first, I thought that the check pattern could be enhanced,
> but testing with '--' as version suffix led to
>
>     dpkg-buildpackage: warning:     debian/changelog(l1): version '6.14rc=
5+me--' is invalid: revision cannot be empty
>     LINE: linux-upstream (6.14rc5+avm--) trixie; urgency=3Dlow
>     dpkg-buildpackage: info: source package linux-upstream
>     dpkg-buildpackage: info: source version unknown
>     dpkg-buildpackage: error: version number does not start with digit
>
> thus this is great as it is.

Good point.

The debian tool already rejects incorrect version format.
So, we could simplify the version check to:

  grep -- -


However, on second thought, this patch might be unnecessary
because it is better to leave all the version checks
up to the debian tools.


When KDEB_PKGVERSION does not contain a hyphen,
this warning is shown:

  dpkg-source: warning: non-native package version does not contain a revis=
ion

It still produces a source package.
If this is just a warning instead of an error, it is fine.

>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks for the review.

--=20
Best Regards
Masahiro Yamada

