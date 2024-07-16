Return-Path: <linux-kbuild+bounces-2553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A1D932205
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 10:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16EE81C2198D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 08:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7AC17B4E9;
	Tue, 16 Jul 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMmXkjLt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610641B947;
	Tue, 16 Jul 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119254; cv=none; b=TpRMckYQl6tQFAkdriIN2j/oUdfSC/dowqxo8Z5V4PmEe5EBipGuI7u/uZmehwntSjTiUm0oN3Xu/tvtmEus4FC0+HI+YK8+1gjwNTAwQVhzl7ruiMbNyHJEzGeVxWVYufNM+je0PCwk0PLNgB0mKwTxQ7Gt1WtA9vpbDj0l/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119254; c=relaxed/simple;
	bh=YGrAhIFA8TiKJPE2DQShtLM985VOP2rPL3cg5tyAXnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nn6HXxCZblDrCePXa8TZl2ecyTYDgIo/yO2YooUunc9rIcTHeUvYNhQNu0U4kJbUV+mV4sMPkzFYBH7zl+U8RUiJm2QQCriOF4NI/bPUazMtpzppRjmJR+nMHtxaJLUA8X0yQ8NDiu6dMLB2cpZ14N78N2dJg/sGnPihaWm3+6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMmXkjLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0172AC116B1;
	Tue, 16 Jul 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721119254;
	bh=YGrAhIFA8TiKJPE2DQShtLM985VOP2rPL3cg5tyAXnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sMmXkjLtcHsxf0S0mQVPm+PJ4MxdgywbOp2QUM+8YQbpIRKzEsdfajxJTYNOITHao
	 m60qZobVlsEIJLo4YVMC0eYU9DdeESzgjQC4fdKY/1aem/WNiYq5gl94Cmwvqj6kD0
	 j44JAByKQfPlNV/f8NxcGJFE/5PaTUHDxBTO3nlMt0zO2ltWYylU/wWTauQXb+QHHI
	 s4KbpzrefHjAn67to8/nEdZMnVtTWTdQD3zxlghxs76K5wkGXPr0MSUiGZuf31xZjk
	 z1r1hWLqSz5RyX0ns+NLXFQI0QBdIWOKSfpx4/of4h8aWIJAUgUeNI27F7vJhhLDqC
	 d17wY6EWE50KQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso1560217e87.3;
        Tue, 16 Jul 2024 01:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/7vOEw78Y2mA6++BHsjFXRLCeL0h+9dSXeJUwVYJMSzm1UyoJwRKYnuvIxwq9aAoAC1CgxWE5wH8yxP4P18LQl1COVG2YJ6DmIJqm
X-Gm-Message-State: AOJu0YyaJFyuBEDFQUwlYWbxqCl1V40L1WjBQ26puMFyzyvzLpOi8NKR
	AclKmq+UlGTDJJceVQtWKIR4CoeBTi1qEWcXjrGf2EJ3cvU+6Xi5HA/d+JSxWfrk873sI6JYF+q
	wtrUbm4NPoTePz6l7a05Uf9lg+LI=
X-Google-Smtp-Source: AGHT+IEq4MJh9BWAM9rUzzPFUm544rLLMhXI2gofWB48KSRPyMHZCc/zqfanTxwz2hUyWLr/V4wQoCVBbhDWDcDZARw=
X-Received: by 2002:a05:6512:3e18:b0:52d:b226:9428 with SMTP id
 2adb3069b0e04-52edef0fe66mr1111565e87.6.1721119252503; Tue, 16 Jul 2024
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
 <20240706164423.1934390-1-aquini@redhat.com> <CAK7LNARATMy4hJ=Jp0fLd=JyD_SRC5ok8CFmLwHPv7kam4Eq1g@mail.gmail.com>
 <ZpWSxtUzBRkqB6CQ@optiplex-fbsd>
In-Reply-To: <ZpWSxtUzBRkqB6CQ@optiplex-fbsd>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 17:40:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_b6hmN4W94D_7o5XZAc7jYhBi5rp=GUE=y+_BHjccGQ@mail.gmail.com>
Message-ID: <CAK7LNAT_b6hmN4W94D_7o5XZAc7jYhBi5rp=GUE=y+_BHjccGQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rpm-pkg: introduce a simple changelog
 section for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 6:21=E2=80=AFAM Rafael Aquini <aquini@redhat.com> w=
rote:
>
> On Tue, Jul 16, 2024 at 01:32:56AM +0900, Masahiro Yamada wrote:
> > On Sun, Jul 7, 2024 at 1:45=E2=80=AFAM Rafael Aquini <aquini@redhat.com=
> wrote:
> > >
> > > Fix the following rpmbuild warning:
> > >
> > >   $ make srcrpm-pkg
> > >   ...
> > >   RPM build warnings:
> > >       source_date_epoch_from_changelog set but %changelog is missing
> > >
> > > Signed-off-by: Rafael Aquini <aquini@redhat.com>
> > > ---
> > >  scripts/package/mkspec | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > > index ce201bfa8377..e45fdb12fbc7 100755
> > > --- a/scripts/package/mkspec
> > > +++ b/scripts/package/mkspec
> > > @@ -28,3 +28,26 @@ cat<<EOF
> > >  EOF
> > >
> > >  cat "${srctree}/scripts/package/kernel.spec"
> > > +
> > > +# collect the user's name and email address for the changelog entry
> > > +if [ "$(command -v git)" ]; then
> > > +       name=3D$(git config user.name) || true
> > > +       email=3D$(git config user.email) || true
> > > +fi
> > > +
> > > +if [ ! "${name:+set}" ]; then
> > > +       name=3D${KBUILD_BUILD_USER:-$(id -nu)}
> > > +fi
> > > +
> > > +if [ ! "${email:+set}" ]; then
> > > +       buildhost=3D${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null ||=
 hostname)}
> > > +       builduser=3D${KBUILD_BUILD_USER:-$(id -nu)}
> > > +       email=3D"${builduser}@${buildhost}"
> > > +fi
> > > +
> > > +cat << EOF
> > > +
> > > +%changelog
> > > +* $(LC_ALL=3DC; date +'%a %b %d %Y') ${name} <${email}> - ${KERNELRE=
LEASE}
> >
> >
> > I am not sure whether the version is required or not.
> >
> > In the following guide, not all entries have the version.
> >
> >   https://jfearn.fedorapeople.org/en-US/RPM/4/html/RPM_Guide/ch09s06.ht=
ml
> >
> >
> > If you want to add the version, perhaps is it better to
> > follow the fedora convention?
> >
> >
> > The spec file of Fedora looks as follows.
> > The version is enclosed in the square brackets.
> >
> > %changelog
> > * Wed Dec 13 2023 Augusto Caringi <acaringi@redhat.com> [6.6.7-0]
> > - Add rhbz#2253632 rhbz#2253633 to BugsFixed (Justin M. Forbes)
> > - Turn on DRM_ACCEL drivers for Fedora (Justin M. Forbes)
> > - Linux v6.6.7
> >
> >
> >
> >
> > Or, is this not important because there is no strict format?
>
> Darn, I've been using the "- release" pattern for my RPMs for
> quite a long time, as circa 2010 that was the suggestion.
> I guess I just got used to it and never really noticed
> the change along the way.
>
> There's not a strict format, though, and it's just nice
> to have the version showing in there.
> I have no strong feelings about the format we should be
> going to go with, so I'll leave it up to you.
>
> What is the format you'd prefer for the changelog entry?
> Leave it as it is in this patch, or adopt the Fedora standard?
>
> I'll wait for your input before refreshing this patch (or not)


My preference is to get rid of the version number from %changelog
because this is an upstream snapshot source package,
and there is only one entry.

The version number is already expressed in the
"Version:" field.





--=20
Best Regards
Masahiro Yamada

