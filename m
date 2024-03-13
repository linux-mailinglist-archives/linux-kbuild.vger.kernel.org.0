Return-Path: <linux-kbuild+bounces-1225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C787A243
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 05:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6C881C20DBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 04:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B9F10A1F;
	Wed, 13 Mar 2024 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahM8aPV9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBEC13D
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2024 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710303805; cv=none; b=naRkU5c5O33e381E7EMw1Qqm5dS3HEwC/kwLHhD1j4ujXkn0KfGgfXU7oM4LKs47VcByM0Z4cNDKakX/A3UY6Tu6lt5kMFe3hyM5saSnPe1QkenA0JxpciDvToLkKO0VzM6NkSMxe1kUyTGwjO77mROD8nqt99pi0H4296LxDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710303805; c=relaxed/simple;
	bh=L6JVjFeaF0SzJLkup9ytH1RlMdI44febxWG4uLjqDCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLeSFJ4ypNWc/GXkianGVBrRw0v0ws/DbG3+fQiNG52CFzVNojjVwxRdGPDVLAbLtWGQrwTmzYghvWO9mqIiGD9N40nHWlypRSLFbQHseP9EJUj+nnug7vSCbehXRbNhFvB2asypqCmPjbwpeU+s80siGm6c/HIFQ8HEVGl/BBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahM8aPV9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB988C433F1
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2024 04:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710303804;
	bh=L6JVjFeaF0SzJLkup9ytH1RlMdI44febxWG4uLjqDCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ahM8aPV992LWWJi5nj5mCavp6NuGQgpgU/qG3X1hYZ4lHzbHxJY0LqmO6AUPtfXyP
	 5XokMTsSeiRvfm3bZ0cwMey/tTTETuRi0TU4LJwTJtPpZuhxbJIttMyh/hOxSuuJG5
	 ali1Y7ZJdfj5nJM11cY53KQn46p1i7Y8zRSQaHeKRMGTeelfKL4V+vg+TxMRluFHzG
	 rsf1WYxuF5sJFtsCEZLwqMxpMBt+5uqJbI38SzReYbjFUUGJcZKKN7rqt/MFPsvlA0
	 Se++LyBVfZgC3uWGNzf4zt3jNq5E43Yqqrdbre2WBYLd6ynkhZpQ8uZNbKAgoXfX4J
	 rhGmgOKjdHgXA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d41d1bedc9so73684811fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2024 21:23:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUDC/NiE5IZcp6t4TZ5qzc7vxpIIME1BLqMflUUUqPh+qGtbIdiuobWJSnAMnvhms76iOeaRZoGJ02zsfY4q2snT3PhJWYHAeAQsDc
X-Gm-Message-State: AOJu0YzZ2dmHSO0Dh0biqdpV1tfGy1p3j2H6O98FS9hGmy9sDR11B3ZH
	49qnHQFu6zX+1b3jzgmYrgyljFnz+EgioCNQWoMZDf+Vv6KBRB31+9uK5Mg0DHFSY+rHYK5WE9T
	fjbtT9o6xvs+XWXMfwgoNTj2iWjs=
X-Google-Smtp-Source: AGHT+IH88crqeJt1k7aJd4MuFVmCfPOVi3Fbr4/YJ/hvdSk1dpMgEpkcD7aFb7l7l7PWjdlrdmfQjMCIiGuSC3CL5kQ=
X-Received: by 2002:a2e:9644:0:b0:2d2:2cff:fc49 with SMTP id
 z4-20020a2e9644000000b002d22cfffc49mr8401478ljh.18.1710303803234; Tue, 12 Mar
 2024 21:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1709508290.git.ehem+linux@m5p.com> <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com> <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
 <ZekFzmXKKgHYZPcq@mattapan.m5p.com> <CAK7LNATKE9wYpmxsWLmF++yQsKAN2dKSxta+O8x6UhWhRCkTCQ@mail.gmail.com>
 <Ze+ensR/W0aesLPN@mattapan.m5p.com>
In-Reply-To: <Ze+ensR/W0aesLPN@mattapan.m5p.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Mar 2024 13:22:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMQKrXr=UScvUwNFNEN0gEKcrqriXB5AxfEc6gWbGeFw@mail.gmail.com>
Message-ID: <CAK7LNARMQKrXr=UScvUwNFNEN0gEKcrqriXB5AxfEc6gWbGeFw@mail.gmail.com>
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, nathan@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 9:16=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p.co=
m> wrote:
>
> On Sun, Mar 10, 2024 at 10:07:14PM +0900, Masahiro Yamada wrote:
> > On Thu, Mar 7, 2024 at 9:10=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p=
.com> wrote:
> > >
> > > On Wed, Mar 06, 2024 at 12:20:17AM +0900, Masahiro Yamada wrote:
> > >
> > > > I see no good reason to do this change.
> > > >
> > > > I will not take this series.
> > >
> > > Could I get you to provide further detail as to why you consider my
> > > reasons inadaquate?
> > >
> > > The distribution is well-known.  I believe in-tree and out-of-tree bu=
ild
> > > mechanisms being as possible to each other is a Good Thing.
> > >
> > > I guess I should also note, in the past (890676c65d699, 9da0763bdd825=
,
> > > likely others) nicer build output has been sufficient justification f=
or
> > > changes.  An effect of the series is a leading "./" will disappear fr=
om
> > > many files in full build output.  As such this also matches that reas=
on.
> >
> > It is ideal to in-tree and out-of-tree build mechanisms
> > look symmetrical (and perhaps could be achieved in a
> > different way), but your approach is not the direction
> > I want to go.
>
> I'm glad we're in agreement with the former.  Do you have any guesses
> for when your approach to this will be visible?


No.


This is not important.
There is no need to rush.





> I suspect most approaches will eventually run into an issue with the
> current interpretation of $(srctree)/$(objtree).  Unless you can ensure
> $(src)/$(obj) will never end up with absolute paths.
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>


--=20
Best Regards
Masahiro Yamada

