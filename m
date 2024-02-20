Return-Path: <linux-kbuild+bounces-1002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED185B47E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 09:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426BC1F21482
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 08:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD25A5C5F7;
	Tue, 20 Feb 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k7x8RBfy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC75C5ED;
	Tue, 20 Feb 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708416437; cv=none; b=Gc7tAToINmjtCwKJ/+0iKCw48rY3oiTMFbpZhfXI0Klpmr2GnH0lsMRTxBPPnmjoIJPP1LLIDoo5yRmnK74BaqmGFzul2/cIGCDw8sAoqo1+JDSzS+dYLv6e/bj2wdg+s5r43ONaUU/Cqy9WBsiNPr10qIp48eogFaEW+4Meed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708416437; c=relaxed/simple;
	bh=4atb1M7uIDo/hdKyPFzsjJcQrZQMqn8eciRrtEvsmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amZW1d4faEoCZlzrEogcGIeCmUWMiwrL9OMUfKLHfvBhIh8St/ItxVAOZ3BrHcLeKyVUb0PXlAg+kRhuvHK/9Pv0VHnwdjBfEeo8wzytJMvvUCSEwPVxw/BGNhhgVoUBtq0Mc1dGu/7JF1H3UZszP9LK8SUGF4V2l4zj7Guw8T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k7x8RBfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741AFC43394;
	Tue, 20 Feb 2024 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708416436;
	bh=4atb1M7uIDo/hdKyPFzsjJcQrZQMqn8eciRrtEvsmKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7x8RBfymH0rxdDhCuzZU65oCufYMrJtIO+RNuc+2IkIZIoB+dbdTl2qhX+jbiI0h
	 prvWc9E2T90drPpH/NH5Zc0y7RZvEfLgy8AUHOdNH81K/TgRbG79d6fVox1GKepvx1
	 XQ+qO4xKfkm3w2iaiVO4i1OWMJr9/ozjxHvzHOfk=
Date: Tue, 20 Feb 2024 09:07:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "um: Fix adding '-no-pie' for clang" has been added to the
 6.1-stable tree
Message-ID: <2024022003-absurd-patriot-6e11@gregkh>
References: <2024021953-shrimp-trilogy-590a@gregkh>
 <20240219192315.GC2348301@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219192315.GC2348301@dev-arch.thelio-3990X>

On Mon, Feb 19, 2024 at 12:23:15PM -0700, Nathan Chancellor wrote:
> Hi Greg,
> 
> On Mon, Feb 19, 2024 at 05:50:54PM +0100, gregkh@linuxfoundation.org wrote:
> > 
> > This is a note to let you know that I've just added the patch titled
> > 
> >     um: Fix adding '-no-pie' for clang
> > 
> > to the 6.1-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> > 
> > The filename of the patch is:
> >      um-fix-adding-no-pie-for-clang.patch
> > and it can be found in the queue-6.1 subdirectory.
> > 
> > If you, or anyone else, feels it should not be added to the stable tree,
> > please let <stable@vger.kernel.org> know about it.
> > 
> > 
> > From 846cfbeed09b45d985079a9173cf390cc053715b Mon Sep 17 00:00:00 2001
> > From: Nathan Chancellor <nathan@kernel.org>
> > Date: Tue, 23 Jan 2024 15:59:54 -0700
> > Subject: um: Fix adding '-no-pie' for clang
> > 
> > From: Nathan Chancellor <nathan@kernel.org>
> > 
> > commit 846cfbeed09b45d985079a9173cf390cc053715b upstream.
> 
> Please replace this patch with the attached series. While this patch
> does fix this particular issue, commit 397586506c3d ("modpost: Add
> '.ltext' and '.ltext.*' to TEXT_SECTIONS") is also needed to resolve all
> errors with clang-18+ and ARCH=um. That commit needs a few (reasonable,
> imo) prerequisite patches to apply cleanly without causing any build
> warnings, as I point out on the 6.6 patch.
> 
> If there are any issues, please let me know.

All now queued up, thanks!

greg k-h

