Return-Path: <linux-kbuild+bounces-7482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9141AD77E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 18:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73083A6DD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 16:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49D52D879A;
	Thu, 12 Jun 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArH5qg8/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5C2D8796;
	Thu, 12 Jun 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744651; cv=none; b=sWegSOWI41NkUg0bTYY1htIl6XdWdO5ntGZd99oKploqUb2C67cOEDvREF0GU21gGe4yS3BHbVloZ1/km6RYP1PmCfmsy0I0QdSXSIGvr1PRdnjbwuGhlCZ6Rgh2ECx5L/t/DnkhdWARwgSOyDWcSqe8rkLwBO7YrghJB2Rhf3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744651; c=relaxed/simple;
	bh=0tJPuLJzplHSLCKLl5IAR6N3cdTftKei25pDSJK8fbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAb5tD+uHNO0Tn4yWgezJfJrQ3JfliIibX7T9KwTYY5+Dj0s6x6hjq2LyIFKMMuG0vOvMDZEtxn0MJHmq10aHRMi2lTTy5dT22ithlND6/Os7tkfpKYY/WZ0NuO5jQgnXk0RoEI0iapLaUmDaB2GM3utuMRZ2HnX2UAg0uXCdFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArH5qg8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C71C4CEEE;
	Thu, 12 Jun 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744651;
	bh=0tJPuLJzplHSLCKLl5IAR6N3cdTftKei25pDSJK8fbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ArH5qg8/16C/5akIeSXyQGLdDKvAH0Bm1rbEQUrFDsnm3jHqqI1Hr1Cpiv7oflgAm
	 f6ymsD15nZuUSNOHX/FZyI89IG/5y0D4wreuWJvOLyVt8dCPtsfrnBgJdwRqdO6GuP
	 cuNKgVWXOPO29B6ayQV8SeUv3MC8xdFFHoyQ9V3vEr2tQTNiduW9Azk3iUVSTwtz2N
	 Ge4nThcYl6MOAp/6YzaFdBo7iMvyufiJY56skd0xDCi6vBFL4Sw2o1SETKDN2tDA7/
	 CO7bcvYq2El6Ve6jH4RNQKhY8WyPMyPsgVcY+1t2jD0jsfgxiez9ZL0myIz/cBSw7E
	 nWneiYPYmATKA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55220699ba8so1221224e87.2;
        Thu, 12 Jun 2025 09:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/oDJfvFiWllWgn0et3cYdjxaFJbf9Zu7eVeCql8rtN192Mx03M7ONHWGf6Ouu9vOOOp0QFqdV/7SaVjs=@vger.kernel.org, AJvYcCWOtsHXYlDA13x7uYTt5fwnKqlsMsQ7PmsJs2+gKXJLXUz5azaXL+yNruwB6TcO9rE84RooUlW3PjpSSWqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7h8aZQd17gO1zuMrSuovfRfTEUne2dP2RSq8BslvAKSxqwqn
	3RcuYjFKyHDhNi4A1umJDd2lelxmhweKEY7DyGGM9vM68eI7c+GswinIYdCS0WMbHEKE2Tk/BVY
	iHatO/Itk3OD+evtisE1zTfwV9q1h3OA=
X-Google-Smtp-Source: AGHT+IEvNqyvadnOAl3oSGrlzNWzeH1A+7dlL7umrjsFvmwBmevNAZfba9haWRf0TRi1yCGGHP2yID5znfiKcAMUelI=
X-Received: by 2002:a05:6512:3e10:b0:553:3028:75ae with SMTP id
 2adb3069b0e04-553a55783fcmr1264206e87.46.1749744649873; Thu, 12 Jun 2025
 09:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com> <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com> <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
 <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com> <20250612142938.10868H90-hca@linux.ibm.com>
In-Reply-To: <20250612142938.10868H90-hca@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Jun 2025 01:10:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3_tBrjfsGyeeKow5VD8tmtumdkBKyxXv1Dai6dNSziA@mail.gmail.com>
X-Gm-Features: AX0GCFsqQcXnvEYUvLuV7mECSnsQL9sAKTtVtL_PwWNJ3QHC-oEHdisvTlaZTVI
Message-ID: <CAK7LNAQ3_tBrjfsGyeeKow5VD8tmtumdkBKyxXv1Dai6dNSziA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 11:29=E2=80=AFPM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Thu, Jun 12, 2025 at 10:01:00AM +0200, Arnd Bergmann wrote:
> > On Thu, Jun 12, 2025, at 03:42, Masahiro Yamada wrote:
> > > On Wed, Jun 11, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de=
> wrote:
> > >> On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
> > >> > On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.=
ibm.com> wrote:
> > >> I think this makes sense in general, but the output here is
> > >> excessive if it leads to users no longer wanting to enable W=3D1.
> > >>
> > >> There are other warnings that I think should be enabled at the
> > >> W=3D1 level (e.g. -Wformat-security) and eventually by default,
> > >> but that are still too noisy at that level.
> > >>
> > >> My own cutoff would be at a few hundred warnings in allmodconfig
> > >> builds if there is an effort to reduce it further, but it seems
> > >> that this one is still at a few thousand, which does not seem ok.
> > >
> > > Then, what to do?  Downgrade to W=3D2?
> > >
> > > I think nobody cares about W=3D2 builds,
> >
> > I think the first step would be mass-cleanup patches to get
> > the initial numbers down. A lot of this can be scripted.
>
> I'm not sure this should be separate patches which would then be sent for
> review. This is way too much churn for something trivial like this. Only =
very
> few patches have been posted yet, and discussions started:
>
> https://lore.kernel.org/all/aEjwqtotEEH8QMHB@gondor.apana.org.au
> https://lore.kernel.org/all/aEl9kO81-kp0hhw0@google.com
> https://lore.kernel.org/all/CAHp75Vc7AO_sRgB1Nj6CevbseMFyv5ku8ZS3PwzAuAgy=
sKVxNg@mail.gmail.com
>
> This looks like the start of an immense waste of developer time.
>
> Can't this be scripted and be addressed with a single commit shortly
> after/before the next merge window closes?

https://lore.kernel.org/linux-kbuild/20250612160850.3007038-1-masahiroy@ker=
nel.org/T/#u

--=20
Best Regards
Masahiro Yamada

