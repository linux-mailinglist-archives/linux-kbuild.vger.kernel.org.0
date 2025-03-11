Return-Path: <linux-kbuild+bounces-6036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97238A5B68E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 03:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15B0D7A1EDA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F421E520E;
	Tue, 11 Mar 2025 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y41IjJDQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABB1DE3D2;
	Tue, 11 Mar 2025 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659228; cv=none; b=oJdbLQO5ThXL8gThpvWERmOeOdVDq/RwuTP7AZh5s26BgBbwW1lKKGveUY8ENzLTIGN1Ch48FRmPViCxIslQ/d4Gvv6yft7Fk/dJXZDhZZA7APB+NuWn9ZpsrVgf/B6PWbqahXNJr9inQDDo0+zymepPLIPSM1xnFwzSTJbYBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659228; c=relaxed/simple;
	bh=veBU3gkYLoi0TeNh5/TA2R536cT3gCV1L2V1p3IRA/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnuzmfvFgBj+ZXF6H7RD+WUrcHaZrr9z+mEUUJuVanuxeFrbAYWK8cVqLz1nVmR3V8KahUOks71A4MUh06oGoXkKK4iR8mEEdEJuS4oCQkbGz5k4nqiMQU6D4OoVCnS8R/XZj1bZbrtSbGNpbSFmqHkdh9V4NLcPF5W1BKN1I9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y41IjJDQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A4EC4CEE5;
	Tue, 11 Mar 2025 02:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741659228;
	bh=veBU3gkYLoi0TeNh5/TA2R536cT3gCV1L2V1p3IRA/U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y41IjJDQcmdaRzaB7WhHlkqJReRUiFA93fF7QfXja1+jSvLsV+wNiYsVacwgZQEQR
	 j04G8X7p+/G2ypzDSIdCGhWKHjBG4GGlb9Z30CMl3Yno+DI9ezWZqV+ioxLE+QN9dR
	 LV2wXx9IjspHfKV7Su5Wc9D7QtXOOwn+B/mTzmYpz2h9z62DX3vtm/owRo7/Pysxzz
	 5jzAkmb9/MpAlOTGXTsJklk9lyVgTGDcWL/H8fgVsMfMCzOCXI+heUAXOcp9seqBHB
	 UXcIZMBqpf/sfBto4CgDkHw6o+L0oactjovF/Zi4F38Fq40/ugx3G5rH3BbOfSJFOO
	 MZ867VmY/wRyg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf8632052so36045001fa.0;
        Mon, 10 Mar 2025 19:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJMGf8zzl0rCFAh2afnfslyThIaeDJipLmE4XzU2wwMLwnZGTen3bHRu4wpSm7flJTo1ixbarI0L+kOKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJR7tjeALAXGm4nciJaelqu+U+D6FvUadAa+dEXDS6ZzrUk+Y
	1LC6U6GjgKHmj3ORrhgHONV8BO3w6bRh6IXQH9Y/Cn6l1leQm5xgK7ErXcYoU9wDrS6xuG3mZi/
	YtBCYopnwsqRArW6B7yIav1zIYmI=
X-Google-Smtp-Source: AGHT+IEUuj/ui7psFQVzyIso3elVkavHuoG7h3ILW8sx0F2My/4VP6bvJilVOpEgFYzuQEM+y43vM5HSURricFcL4zE=
X-Received: by 2002:a05:6512:b14:b0:545:c89:2bc9 with SMTP id
 2adb3069b0e04-549910cb4a9mr5955367e87.43.1741659227043; Mon, 10 Mar 2025
 19:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308040451.585561-1-xin@zytor.com> <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com> <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
In-Reply-To: <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 11:13:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHfOo3+vnqTt5A=X3SQEpMxz2aQBW2Hmvc_g0gg2ohLw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo0vXtTVwaaYwhqwxThusV4-7vUM90Qt5a8pipY3XSkQYGMJLRAZi3MIUc
Message-ID: <CAK7LNAQHfOo3+vnqTt5A=X3SQEpMxz2aQBW2Hmvc_g0gg2ohLw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com, 
	sraithal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 10:52=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Mon, Mar 10, 2025 at 3:23=E2=80=AFPM Xin Li <xin@zytor.com> wrote:
> >
> > On 3/8/2025 7:12 AM, Masahiro Yamada wrote:
> > > On Sat, Mar 8, 2025 at 1:05=E2=80=AFPM Xin Li (Intel) <xin@zytor.com>=
 wrote:
> > >>
> > >> Meanwhile explicitly state that the headers are uapi headers.
> > >
> > > There are many internal-use targets, which are not documented in the
> > > help message.
> > > I assume this one is the case.
> > >
> > > If users want to install UAPI headers, 'headers_install' is
> > > the user-visible interface and it is already documented.
> > >
> > >
> >
> > hpa and Boris prefer to add it, which I also agree.  But ofc it's your
> > call :)
> >
> > If you don't want to add help for "headers", it probably still makes
> > sense to explicitly state that the headers are uapi headers, no?
> >
> > Thanks!
> >      Xin
>
>
> If a help message for "headers" is desired, how about this?
>
>   headers  - Build read-to-install uapi headers in usr/include




For clarification, the following is the rationale.


Build                 Installation
-------------------------------------
vmlinux               install
modules               modules_install
dtbs                  dtbs_install
headers               headers_install



In Kbuild, the Build and Installation are separate steps,
since the latter usually requires the root permission.


--=20
Best Regards
Masahiro Yamada

