Return-Path: <linux-kbuild+bounces-4790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903A9D557C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 23:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67209283254
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1601DA60B;
	Thu, 21 Nov 2024 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcWrzrsH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F21D5164;
	Thu, 21 Nov 2024 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732228151; cv=none; b=l+O//1bppB4KXqBfYbf5sXmgtVkv9XtG0n7VM6DMqNfll8fY+LS9yBCEOwMSGI4aNznkWe69Brix6HoS6NPowI5iE87YPtJk/sDq/A6jjDeYPMQIA4RNPtP0g7zdfSb5874vGisTYUcQMAb1J9qVF0hBMEBAJDzO1/9JVNSiuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732228151; c=relaxed/simple;
	bh=tjQSsOUWzW3WwJYC83/glQCSqGSvUSIbP3JOWT1OQe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Qrk6uFJYipXo4UAT5IpdLendDdM90VYZse2gEk49o7HHK3vuxbIMuzLLECWElvXGpatr7t+uiY5LXEA1T2d49he0D04Xx1UFrJxYPJbnmAfBRZvR2X2wgWZT+tl5DnGCSwEXd9La8i1qmfq8c7xw0a0USZ6Tj11jRyzSBakgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcWrzrsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96726C4CED2;
	Thu, 21 Nov 2024 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732228150;
	bh=tjQSsOUWzW3WwJYC83/glQCSqGSvUSIbP3JOWT1OQe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rcWrzrsH4tEfQHf3P7q+6wJHhl56AH3LlQmqwrbYgwwVSUSTCOttUuxqiTtt8MYtA
	 AT0LT77kW5Hfk1KR228V62O5x2hnzoAn703DD3JdU9rzR8Lnc95qr7UNoNnK7q9J14
	 MTi3uIbSJFd2+6flzi3Sx8YcdJXa8XIbTEn2xhIDSiEQMGlQriOdRLbe0Lg27pia8j
	 MWY3CBf7TLhCF/27xxkwDcGgOzRxHlyBaQT8hHKs9/KQdFPQFSglmIsxeypi3bisCW
	 pdUeHmcNsRH47gwWbmtMDwYtyok7H/GBhI7j/TWRojepAA1ra1E8p1nD73S90uviyc
	 Ix5mYtx8tw5pQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da4fd084dso2656811e87.0;
        Thu, 21 Nov 2024 14:29:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVemAih31VTO1wYEg0N5WsycA9tH+ePgKMELzQANLial8vNYBnOXKKsG5aRVb4HG7DAQ0ZmEFUegjnLWlo/@vger.kernel.org, AJvYcCVxjp0cgVg3702T9yFQU3YDrla9pUEyIwz6Iy8UK2GkOX2Z1fZ0DZQRSuUEpSxSJIRcgxe3pVjCA7ra7IpC@vger.kernel.org, AJvYcCXpfEbwCvQE1MRGiO74K1dgmZeXvAIIqA6uJKIQm0YQgg/q/Q6AQzOD5hkEreFFbsPLCOgrsmHsczFtfqwU@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDaMWqeMLVuuZGDBaT/4sJf5VOtMJ/eHAXMxy7bstemwQf6X5
	36ani4EsrejY74VtKDC0mwM+NVMuaH7wH/YazfNt5Gq+10Na278/7J2xGDfsb+oGmN6vx9cLmHR
	jeEwRPMtIPOXYLZmXcbNOidy0FUQ=
X-Google-Smtp-Source: AGHT+IHW+QS4dVHOxA02lbsya/fSi8Nd0koHSYBV9qK4E+o17m5c7V+ut9orQpRQIqJnqhxvz3Dnlr3nqgP2Bv8wIDM=
X-Received: by 2002:a05:6512:1383:b0:53d:d209:d96b with SMTP id
 2adb3069b0e04-53dd209d986mr500586e87.13.1732228149219; Thu, 21 Nov 2024
 14:29:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz> <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik> <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
In-Reply-To: <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 22 Nov 2024 07:28:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
Message-ID: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Rob Clark <robdclark@gmail.com>
Cc: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 10:49=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Wed, Nov 20, 2024 at 5:17=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote=
:
> >
> > > On Thu, Nov 21, 2024 at 5:41=E2=80=AFAM Petr Vorel <pvorel@suse.cz> w=
rote:
> >
> > > > It will be used in the next commit for DRM_MSM.
> >
> > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > ---
> > > > Changes v3->v4:
> > > > * Move definition to the end of the file
> >
> >
> > > I prefer to not check the tool.
> >
> > Ack.
> >
> > > Why don't you install python3?
> >
> > Everybody installs it when it's required, the question is how to inform=
 about
> > the dependency.
> >
> > There build environments are minimal environments:
> > * chroot (e.g. cross compilation)
> > * container
> >
> > These are used by both developers and distros.
>
> I don't think py3 is an _onerous_ dependency, but it has come up as a
> surprise in minimal distro build environments at least once.. so I'd
> be a fan of surfacing this dependency in a predictable/understandable
> way (ie. I'm in favor of this patchset)


"once" is a keyword here.

"/bin/sh: python3: not found" provides sufficient information
about why the compilation failed, and you know what to do
to fix the problem.
This is good.


If you hide CONFIG_DRM_MSM silently
due to missing python3, you may scratch your head
"why drm/msm was not compiled?".
This is worse.








--
Best Regards
Masahiro Yamada

