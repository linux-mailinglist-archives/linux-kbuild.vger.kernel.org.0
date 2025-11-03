Return-Path: <linux-kbuild+bounces-9371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1CC2CB3A
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 16:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9105F562260
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 15:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1977F315D3B;
	Mon,  3 Nov 2025 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPqhH38S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704928506C
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182058; cv=none; b=AMH68rqtAGieFdszxn9Al+xA/08Z9lxZz9FGalqG4J0o1Vf5HCUILNBzCYKpVwntuqy4yYkFecHtmBphsPNeIleEC0lPpaKxpnqHF9xAiK4U//mfhDWpqWkfupk2BCIj6yoRbcL+QorMjJTXNJkdQ3IXBKgNUbWPHhPai488Qvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182058; c=relaxed/simple;
	bh=/uwToHnwNW84HCHbkJWQFde13XUJe2F71QknFu5Kl/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPFeQ9ujCwaOCFd2Ih0VUfQLCswRLIXAkM9jXbU3/JGG+d7jSTP33O8pk3v9j+ypdke0oCzIay/OGWcfwFS78XCBoqeyRHFj3pHvfGQQNNl5f7Abkd6ApX75okA2Csv8MBZRzeIHUCNPAmfjQqOda173UIKCG2XdsOtNpSlgW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPqhH38S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C692C4CEFD
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182057;
	bh=/uwToHnwNW84HCHbkJWQFde13XUJe2F71QknFu5Kl/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZPqhH38S2QoMVWjiO6GbUV7fs9JkjFS9LnfJSS2MTA6oSJj668XxfWrghiNB+HUxr
	 A62Lt0aepLOHQW33FqgMClWPFi5Afrh2Ro65ouWqOvtOIwY2mLl6FCC31dX1YkSKdj
	 q0OqAFTM8EIK2gz7XV0lsgJTRD4bcjWmUNX6E0gHi5v1tUYr6TqzFdP/EydZUlvSOC
	 47DB1wI1TgLYUfiXN2x+yTjLEXhQjobULfP5V0lf0uq0YNrLAUvp+FqXiBK50OHB6l
	 Rvrxw0pkONOY0XfWnnuwsR6lCB8SnzECpy3U9anrtOqgFZ4cFxBWiUcQ0pt8RySt5X
	 pxCFcwRC11PSw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a33f49018so9991611fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 07:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWh/j57ZeOoLTJUScd6sWBRtGakD6VtOikEmKgVsa78IssKIFbXtsZv/CVvlQ3wiDTIzp8dqbltx4Z/GNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YymEbLGS1GWiKsQusZwt4KgUGIKyidQcdhoRbxNbaEz+M3t5i8x
	SwpOHKOoTa6Y+kNhqjYV1fQlDvrdATSc9Kq0Q4KYkpwrjR1oorFpxbWFrWgq1LOMUnljuanp8Hh
	ma+9Q8yuVki5o1UqGEiRtY+gYswR6UtI=
X-Google-Smtp-Source: AGHT+IEi+iSwjuEXmvD7iegxDUaoM6UQcmHjxFljBvwZBo2gIGwFbAv6omtrOKP2lEzQH/dsslIHmWcQ1h1CFoMZQY8=
X-Received: by 2002:a2e:a109:0:b0:372:8ba7:21e7 with SMTP id
 38308e7fff4ca-37a18d8f192mr39642631fa.1.1762182055907; Mon, 03 Nov 2025
 07:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162> <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162> <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162>
In-Reply-To: <20251031220732.GA2254630@ax162>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Nov 2025 16:00:44 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
X-Gm-Features: AWmQ_bliwR1u_FsAwYSAtWHdXAJut1MeLr288G3HbZXN8FGeOCxGQhM0ghX94as
Message-ID: <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Nathan Chancellor <nathan@kernel.org>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Oct 2025 at 23:07, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Eugene,
>
> On Wed, Oct 29, 2025 at 09:07:20PM +0100, Eugene Shalygin wrote:
> > On Tue, 28 Oct 2025 at 18:45, Nathan Chancellor <nathan@kernel.org> wrote:
> > > > Replacing CONFIG_KERNEL_ZSTD with  CONFIG_KERNEL_GZIP made the kernel
> > > > bootable. What does that mean?
> > >
> > > Hmmmm, I am not sure... That seems rather odd within the context of the
> > > flagged change.
> >
> > Huh! The fourth of my machines with the similar config (also fully
> > updated ~amd64 Gentoo) with rEFind boots kernel 6.17.5 with
> > CONFIG_KERNEL_ZSTD enabled.
> >
> > > Could you post the output of 'readelf -S vmlinux vmlinux.unstripped'
> > > from the broken and good builds?
> >
> > Attached.
>
> Unfortunately, nothing appears to be out of the ordinary there... Only
> .modinfo gets removed from the vmlinux.unstripped to vmlinux stage.
>
> > > Does rEFInd have any sort of additional
> > > debugging to see why/what it is complaining about not being able to
> > > find?
> >
> > No, unfortunately. However, I was unable to find the first part of the
> > error message ("Not Found") in the rEFInd sources.
>
> I am guessing the "Not Found" is EFI_NOT_FOUND, so I think this is
> coming from StartEFIImage() in refind/launch_efi.c:
>
>   https://sourceforge.net/p/refind/code/ci/253abe5c4af58d044912517daa567c4440612c46/tree/refind/launch_efi.c#l290
>
> I am not sure where the LoadImage call comes from (the firmware?) so I
> don't really know why that call would fail... Has CONFIG_KERNEL_ZSTD
> always worked in this configuration? Presumably since you are not seeing
> "Invalid loader file", you are going into the
>
>   if ((LoaderType == LOADER_TYPE_EFI) || (LoaderType == LOADER_TYPE_GZIP)) {
>
> branch there. I am at a bit of a loss here. Ard, could you see any
> obvious reason from an EFI perspective why
>
>   3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
>
> would cause issues with booting via rEFInd?

For some reason, this change seems to result in a PE/COFF header
change that results in the EFI firmware refusing to load it.

Eugene, can you try whether the image can be loaded by the EFI shell
directly? You may have to rename the file and give it a .efi
extension, but otherwise, you should be able to boot it using

Shell> fs0:bzImage.efi root=/dev/....   etc etc

(or wherever the file resides)

