Return-Path: <linux-kbuild+bounces-9341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B1C27198
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Oct 2025 23:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21BC94E16EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Oct 2025 22:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18CB305077;
	Fri, 31 Oct 2025 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFHV3omO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F7F26C3BE;
	Fri, 31 Oct 2025 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761948456; cv=none; b=FkESl598MWQg+QD2qh9DaEgeNYDS8TGc0lBr8xTdzvQl57mFuvpdljiCXL1J6+JhsXBj4tvXR+JTBltO3LVxiMeRi3SYLa65v2o3GhmLTNWJN0jbQNDvrELeo4uzzEbeom+XB4i1Ya4sBl5jlmxbemzc4wHBjkVtkdBQKCshIUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761948456; c=relaxed/simple;
	bh=Rgn3LkUMZ++OrDl6gjJRkfmgwxCC+cQ/f30IerXYXmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDcFA7V8pBKSY4qWLvqBV7I43lm5iUcpipmjTH97QXL3sQNT2VZl/wtN/SjGfyE++/856xjm/YQHizUUfP/25iiVkAi8xDwJbtt4Bxok+widqHFgOInmTIrlAazYsoAE79abttatrCVh/cHLC4hZ6hsEDbV+EvpNICThEP7BIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFHV3omO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44F0C4CEE7;
	Fri, 31 Oct 2025 22:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761948456;
	bh=Rgn3LkUMZ++OrDl6gjJRkfmgwxCC+cQ/f30IerXYXmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFHV3omOTIcQYaEPwXFK5VcqI3hbYnw4kqG9hOusYbCq8wrd5049KXLvxbo5Z5VFx
	 jjtoh9wWCsx+dt3zxsV5Sve7aiN24EVsvcGWq3lKWCR6R6OWaYjiugqHxduPal3QI2
	 Pi48lGHqq8IVsa07eSG46qE54wJQCGmiiXAyvJlWjFwCGuq8dQuMSc9AHFPkVJYIyF
	 WkwJ7n4TG8bs1lQTGkt5Oid/g5r6seH2QJKO2tDjGSqOhCkTKQR/4EBTD7x2oiSAFC
	 b6SpUd1Y5tVNABpiFYNxvZHpFssrmVLI0aRIkJlC+5hFfDwHHaEFujFw6g6DppzxZY
	 +H3Yq9MQrvYJQ==
Date: Fri, 31 Oct 2025 18:07:32 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
Message-ID: <20251031220732.GA2254630@ax162>
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162>
 <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162>
 <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>

Hi Eugene,

On Wed, Oct 29, 2025 at 09:07:20PM +0100, Eugene Shalygin wrote:
> On Tue, 28 Oct 2025 at 18:45, Nathan Chancellor <nathan@kernel.org> wrote:
> > > Replacing CONFIG_KERNEL_ZSTD with  CONFIG_KERNEL_GZIP made the kernel
> > > bootable. What does that mean?
> >
> > Hmmmm, I am not sure... That seems rather odd within the context of the
> > flagged change.
> 
> Huh! The fourth of my machines with the similar config (also fully
> updated ~amd64 Gentoo) with rEFind boots kernel 6.17.5 with
> CONFIG_KERNEL_ZSTD enabled.
> 
> > Could you post the output of 'readelf -S vmlinux vmlinux.unstripped'
> > from the broken and good builds?
> 
> Attached.

Unfortunately, nothing appears to be out of the ordinary there... Only
.modinfo gets removed from the vmlinux.unstripped to vmlinux stage.

> > Does rEFInd have any sort of additional
> > debugging to see why/what it is complaining about not being able to
> > find?
> 
> No, unfortunately. However, I was unable to find the first part of the
> error message ("Not Found") in the rEFInd sources.

I am guessing the "Not Found" is EFI_NOT_FOUND, so I think this is
coming from StartEFIImage() in refind/launch_efi.c:

  https://sourceforge.net/p/refind/code/ci/253abe5c4af58d044912517daa567c4440612c46/tree/refind/launch_efi.c#l290

I am not sure where the LoadImage call comes from (the firmware?) so I
don't really know why that call would fail... Has CONFIG_KERNEL_ZSTD
always worked in this configuration? Presumably since you are not seeing
"Invalid loader file", you are going into the

  if ((LoaderType == LOADER_TYPE_EFI) || (LoaderType == LOADER_TYPE_GZIP)) {

branch there. I am at a bit of a loss here. Ard, could you see any
obvious reason from an EFI perspective why

  3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")

would cause issues with booting via rEFInd? You can see Eugene's
original report at

  https://lore.kernel.org/CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com/

and subsequent replies in case they are relevant.

Cheers,
Nathan

