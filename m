Return-Path: <linux-kbuild+bounces-6403-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43316A7B96D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 11:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC4B3B666C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 09:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CE31A08B8;
	Fri,  4 Apr 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uox9NFcA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AD19D8BC;
	Fri,  4 Apr 2025 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757252; cv=none; b=G0LQEZ8oYpspKPhf8Lo9UjLEv8TNum8Lmcl3vC+ssrKivCRcJqbprUhN9Qt925mngRJFC/0aogC5wNZEYXCxIZ4cO6cj574eWuACX9aMhIJ1ZqwbYS2iDD1LhDHCt+vdvwY7Kd2JyByCTQyG5aQbCA4rxkjCl6oqhOVHUZ+3Zqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757252; c=relaxed/simple;
	bh=k/YiXYU6vKrqfpgBxhCR7zyfbZ02ohzIpo4VCo5cDsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jftl9znveM5apwGA8NzW+DF0xSMqGlLtk+w94V5OM80vq/nSaZlB+cM+MFGMiTgNSR4ovdAZLn6UuJWPac5+d4iM9L1BWFa/OJpnSJqvoNK4PsvFQqDXtACNKJ0GeLpuXUn1zaA+gFPmD6q4FC3d6X9jPpbfkG6NXpbPhRQItWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uox9NFcA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E27C4CEDD;
	Fri,  4 Apr 2025 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743757252;
	bh=k/YiXYU6vKrqfpgBxhCR7zyfbZ02ohzIpo4VCo5cDsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uox9NFcADIkeM4YsiP9YvUMwFy97Vf2K/xCcAJNmDrfUIAIe/TU7lmq8YBrGsehlp
	 /zpX+RQjdhyfGh1PTfLrWX6uCtPGv3c0clRxeYo1KLBSpM95jDaTLAP8XqlUneNCMo
	 DEBc+whvZrZKGZbjaddwSY4NTvLg3ogMBQvBXaGBoZDXaPfYM9ONV5Du5T8+K5eEAO
	 fvwh+Gssay8P0Qkx+pDCZdiFitsUR0b1LMCoKTlWRuJkLsoPqErspcMDLqBr2SK6xO
	 cniRfaLSWKUjlsbrg29f2JoOAw/ojxt9UR0NmWHHpVKDfdkBmBSbvE32eg/G3qWgnW
	 Vv/DSNwQXyEhA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db3f3c907so15363411fa.1;
        Fri, 04 Apr 2025 02:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMhaReFZ59kMzp5ZuEXRRDuS8Rtus/vKFe0btro5rTmOhxvFxjJ6nmEfQYmcfMJKOKDVKYSXwy/pldblw=@vger.kernel.org, AJvYcCWo3RniH7ltavENFye0LiPezzln7+9kCuUw8bSuvVscqYcKerok5cJ1iEbKUaWVlkZzJXdFp5OXZEfUIkGn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwe8RgaiU4EufaKf6bYzYCuJWvpCR1qMs+mCT39kDDHqxLuEk
	WPrnkrTTWGTOO2kUE33cwS9G3Qe3H2nwov631NpwzDAHsvXCL1Htc1ceZzu1XIhnEIJvjkJNUJ/
	5Mvyg6ylZ/j44rCufxBbMYZi9R9Y=
X-Google-Smtp-Source: AGHT+IELBJHSywFYB1gsUU3kEehfOSZtRZAacPMzmPSGEn+1NnIGOb2Dzwpf/0Z43HJH2r7L0FLZO4AVQvWfAcv6TXU=
X-Received: by 2002:a05:651c:1556:b0:30b:a20b:eccc with SMTP id
 38308e7fff4ca-30f0a118e41mr8587311fa.11.1743757250970; Fri, 04 Apr 2025
 02:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
 <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com> <F0F0E660A98E4FA3+de115480-b3ee-4f33-b90f-a8f3badc97de@uniontech.com>
In-Reply-To: <F0F0E660A98E4FA3+de115480-b3ee-4f33-b90f-a8f3badc97de@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 18:00:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASep+fv2F7tZAu3VC8V3bvFZuxfto-OPLuuL3uSt+kqxA@mail.gmail.com>
X-Gm-Features: AQ5f1JoMRvLxWPixpoi67ZNides3gWF-YhKD-ZFbUzcfU6-xl6uYXmdFHMbXi9M
Message-ID: <CAK7LNASep+fv2F7tZAu3VC8V3bvFZuxfto-OPLuuL3uSt+kqxA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	samitolvanen@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 12:06=E2=80=AFPM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Hi Petr,
>
> On 2025/3/28 18:19, Petr Pavlu wrote:
> > If scripts/package/mkdebian is updated in this way then I think
> > scripts/package/mkspec -> scripts/package/kernel.spec should be adjuste=
d
> > as well for consistency.
> >
> > File scripts/package/kernel.spec contains:
> > BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
> >
> > elfutils-libelf-devel is for Fedora/RH distros, libelf-devel is for
> > (open)SUSE.
> >
> > If I'm looking correctly, a new dependency to make dwarf.h available fo=
r
> > both would be:
> > BuildRequires: elfutils-devel or libdw-devel
> >
> Alright, thank you for the feedback.
> But it appears that the dependency package is named differently on
> Fedora and openSUSE.
> I will expand my testing scope to address this in the patch and will
> resubmit it once the merge window has closed.


Yeah, it would be appreciated if you fix the rpm-pkg as well,
but please submit two separate patches for deb-pkg and rpm-pkg.
(perhaps, pacman-pkg too?)

Also, please fix the commit log, as suggested by Sami.



--=20
Best Regards
Masahiro Yamada

