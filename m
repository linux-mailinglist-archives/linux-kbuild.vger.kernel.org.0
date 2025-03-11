Return-Path: <linux-kbuild+bounces-6040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314AA5B6D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 03:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5CE4189443E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFD31E5B65;
	Tue, 11 Mar 2025 02:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrDgDCKF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48CD1DE3B1;
	Tue, 11 Mar 2025 02:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741660863; cv=none; b=r3h1TifYwwmgi4aF8dDYJXBgRd2d4xH3FSCFUk8PP4/pVtLHBWMhXQZqDswsUAo9L5V9Q7J0WeiYXh7gVsXcmloLuSv1qu5/9C+rkkbYpbPJ4KbNGCVSH0jqGYpDv+L3oPwsSJvfWliD62joqp/R6ZDNGHY4A1x4dWFFUo7mZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741660863; c=relaxed/simple;
	bh=TOck9dbE/f38A/Fy6z/I3QU0ISr9YoB3DDM+lRhDXo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVMn9vBUIoXSve/BcYk1AM9S9FcxRxtQgquPRrmyXiz3P6PNFflSvB6OUSUWhaA2iG98JzidktDaQkLuGyOvV14yYkIb2mY3sKa064RMhAZ6vczHTrBgFwkMwbUF4JmpkuCqguHOoAJyTXu/3xRRimqMjMY2doria5zBzfUjJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrDgDCKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1D1C4CEEC;
	Tue, 11 Mar 2025 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741660863;
	bh=TOck9dbE/f38A/Fy6z/I3QU0ISr9YoB3DDM+lRhDXo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mrDgDCKF30wtkDYLzsH4+HAmlDGiKr8rnVfa1Gibl4Lp8iICvSMFtD9TDQXzo2VaP
	 WUyo9w/o+tJAW4uXHGy3QDNrJmy3nm4UGEY2iLI7K4K+FTITCX5CCPbhowTVIEV7x1
	 kJfCGm3oA3yDL0ZhzGlM78Si/Syj2FpUbzUJ2B2SwGCDDj9FzmL9xUe6VftD9MWI8q
	 yjUMEaYWme4PmkDOu3ziy5I5LbGK/oHc8XZr5hK8PxKDgIaPZB3egXqPhinPajNfHM
	 xChYLQbaSpel9/y+jqN5M86qRj7gHo8zk35cM/KgfaxBXMSx3YpF1TQzRXxyex1X3G
	 u0i77Bt7CFWNA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso32036121fa.3;
        Mon, 10 Mar 2025 19:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgGBd65d3lBOi/pnf5apHUGc9f42VIb+XfGQ+LSrBiBt0IPVSvzWHdKxZxxUc03NBfKzIWzeOXmW3DL0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWzucS2gapOuYz6fMTvTts2kTaY050aJUwcUIxm+d7IBq3IUS
	XmeXNZngQwJh0f4n628rE5JmTs4aIVpqniwF2vDAZf8t9ibw1myCU7PA0g4iAf0OjofkkNy/AP4
	XoPNdI/r4hr7ml7iBImubkkgCLyU=
X-Google-Smtp-Source: AGHT+IHGe2LfIthGQK11JrXVlD9kobUfVLGQwUFy/9W+ux9KLhhYaH1rvAesiBnO6sMG5Sle1pqknm3GeItfpPAwLWI=
X-Received: by 2002:a05:6512:3d8f:b0:548:de7f:b3be with SMTP id
 2adb3069b0e04-54990e5e265mr5248695e87.21.1741660861802; Mon, 10 Mar 2025
 19:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308040451.585561-1-xin@zytor.com> <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com> <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
 <08bbfff0-4aef-4d9e-bbeb-661aedaf3737@zytor.com>
In-Reply-To: <08bbfff0-4aef-4d9e-bbeb-661aedaf3737@zytor.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 11:40:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASsASD31+6EEramGaRk4McxgXiOQLzfBg8k43dLe6cFdQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqKjXlXL6gF1rwPi8-1ohkMFd1g52ZHoRRH-wd2_1mkZxdHXb4d5NyxZUA
Message-ID: <CAK7LNASsASD31+6EEramGaRk4McxgXiOQLzfBg8k43dLe6cFdQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com, 
	sraithal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:19=E2=80=AFAM Xin Li <xin@zytor.com> wrote:
>
> On 3/10/2025 6:52 PM, Masahiro Yamada wrote:
> > On Mon, Mar 10, 2025 at 3:23=E2=80=AFPM Xin Li <xin@zytor.com> wrote:
> >>
> >> On 3/8/2025 7:12 AM, Masahiro Yamada wrote:
> >>> On Sat, Mar 8, 2025 at 1:05=E2=80=AFPM Xin Li (Intel) <xin@zytor.com>=
 wrote:
> >>>>
> >>>> Meanwhile explicitly state that the headers are uapi headers.
> >>>
> >>> There are many internal-use targets, which are not documented in the
> >>> help message.
> >>> I assume this one is the case.
> >>>
> >>> If users want to install UAPI headers, 'headers_install' is
> >>> the user-visible interface and it is already documented.
> >>>
> >>>
> >>
> >> hpa and Boris prefer to add it, which I also agree.  But ofc it's your
> >> call :)
> >>
> >> If you don't want to add help for "headers", it probably still makes
> >> sense to explicitly state that the headers are uapi headers, no?
> >>
> >> Thanks!
> >>       Xin
> >
> >
> > If a help message for "headers" is desired, how about this?
> >
> >    headers  - Build read-to-install uapi headers in usr/include
> >
>
> LGTM.
>
> I guess you will make the change right now?
>

I will not do it myself, but I just suggested a change for v2.


--=20
Best Regards
Masahiro Yamada

