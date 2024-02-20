Return-Path: <linux-kbuild+bounces-1000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2485B426
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 08:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB2A1C2259A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 07:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39285BAC3;
	Tue, 20 Feb 2024 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WWUmHfkS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75012E3E8;
	Tue, 20 Feb 2024 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708415075; cv=none; b=kS9aoL1lKh2RZrTL5KB0L9wcHuuCuUhGSASyqVGkK42aZu9y4TMNUjsG3Tny8mw4Vqpnxy+qG7DeO+Yzr5EImwTJB3tm2IJYYwIQgbjPYqWaHOfDTEhjXTL2M5bitshOObZAUye8pKP355fTUxSIs8u2vt8PTSXTf0e+rstQzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708415075; c=relaxed/simple;
	bh=CznrFdPtCoaliazdwCgiulJp4ke67wDPBiwMR9GbTfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROggRpc6c4otMGuropbzDy/OdENOltpAIJrSu+jdTSk8YmR3hmALB2J8yz/goNY6GLPii1IrRmX8034rmR+9qGndGQOJ4KArt/yBnV/VELaITce3FbfGZctSJCPCKV8r2bBp/ZQljOAEtczS/7DF6aY7+Nzj0S93U0b7afdyNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WWUmHfkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899DBC433C7;
	Tue, 20 Feb 2024 07:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708415075;
	bh=CznrFdPtCoaliazdwCgiulJp4ke67wDPBiwMR9GbTfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWUmHfkSzFJ13DF9oBGaY+Wx7o0hkMRjPpee4RUv8LvDxz65SqLNbDKCSq325C9ls
	 FnjuuRgUXKNTXLqlLPKetVPmcYy3nP2tEwroU8D214OgBoyLfTnPCpfSFoHelzEuxE
	 /imjCSByZOPn9iQNnnVR2ocNsdk8Owq4jClOtd1E=
Date: Tue, 20 Feb 2024 08:44:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS"
 has been added to the 6.6-stable tree
Message-ID: <2024022009-concur-slum-8043@gregkh>
References: <2024021932-overpass-stinger-b897@gregkh>
 <20240219190409.GB2348301@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219190409.GB2348301@dev-arch.thelio-3990X>

On Mon, Feb 19, 2024 at 12:04:09PM -0700, Nathan Chancellor wrote:
> Hi Greg,
> 
> On Mon, Feb 19, 2024 at 05:28:33PM +0100, gregkh@linuxfoundation.org wrote:
> > 
> > This is a note to let you know that I've just added the patch titled
> > 
> >     modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
> > 
> > to the 6.6-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> > 
> > The filename of the patch is:
> >      modpost-add-.ltext-and-.ltext.-to-text_sections.patch
> > and it can be found in the queue-6.6 subdirectory.
> > 
> > If you, or anyone else, feels it should not be added to the stable tree,
> > please let <stable@vger.kernel.org> know about it.
> > 
> > 
> > From 397586506c3da005b9333ce5947ad01e8018a3be Mon Sep 17 00:00:00 2001
> > From: Nathan Chancellor <nathan@kernel.org>
> > Date: Tue, 23 Jan 2024 15:59:55 -0700
> > Subject: modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
> > 
> > From: Nathan Chancellor <nathan@kernel.org>
> > 
> > commit 397586506c3da005b9333ce5947ad01e8018a3be upstream.
> 
> Please apply upstream commit 6a4e59eeedc3 ("linux/init: remove __memexit*
> annotations") before this change, as there is a warning in modpost
> without it:
> 
>   scripts/mod/modpost.c:916:37: warning: excess elements in array initializer [-Wexcess-initializers]
>     916 |         .good_tosec = {ALL_TEXT_SECTIONS , NULL},
>         |                                            ^~~~
>   .../lib/clang/19/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
>      26 | #define NULL ((void*)0)
>         |              ^~~~~~~~~~
>   1 warning generated.
> 
> It applies cleanly with 'git format-patch | patch' for me and I don't
> think it is unreasonable as a fix for this issue in stable.
> 
> This will be needed in 6.1 as well but that backport is a little more
> involved, I will reply there with an mbox series.

Thanks, that fixed the build warning!

greg k-h

