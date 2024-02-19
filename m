Return-Path: <linux-kbuild+bounces-996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38485ABBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 20:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC948B24516
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Feb 2024 19:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F564A99A;
	Mon, 19 Feb 2024 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Up8H6bHF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B592E408;
	Mon, 19 Feb 2024 19:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708369452; cv=none; b=elFCm1bc8nvXawktkB72dVCdtOIP7Hhw3raAq97TyLYWMJvIVSD5W45UuM93dmuL7Af2HVF0wIGGDE5AT05inn1fiKLpEfNLR4oBVNNAfVOWtV85ml1dJlOMRHpJXOqaQakufHrRqaMnZo5RdPuwucPXNFgHK5xP45cR9dVGIv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708369452; c=relaxed/simple;
	bh=KgsvHWbboERan+JN0vWR0UmbKSP49QP+8jjmUGjbisI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCPfK48ovFA9r0nZr/IgxPIVQfjhfKPJX41MlpqI4HdcJK1dj5KP3OB6d/0RjGYbiqCZOCm1dJ5tQ+Ill7l5w/9QP9X8a5SptwR1D/979c8aLyumyIv7muBY7Wh/y71ZqlxlJlJpFXHsBp1i5DQuPxmEYZa1ceJAKEuv13lj4Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Up8H6bHF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9664C43399;
	Mon, 19 Feb 2024 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708369451;
	bh=KgsvHWbboERan+JN0vWR0UmbKSP49QP+8jjmUGjbisI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Up8H6bHFlnABdsMZJViTWTzbLUdMt8Sk9MRLrinlfQ9l5edYfLrwTWz9iUnkXNi5F
	 qgzQMlq5ksC7niWjSdjycvf123QOVRyiEqz1JTvknYAa9/Jgl0KXnvxjhWFT5shMSi
	 C1T5PKvvzi/IWju38rxg3mmU2JilvAadvj8d16g07HEJRlr2nU080+AEJHZZzU+U22
	 axEVnYsOIBDpgTa/6v+qUftHsEkS/y13hbUFnYjfja3UQAzIsjp9+j0OsmzzzXZtqk
	 I3VGA1e0El+Tp9cAPoPnPLLxBg7AfQCyS6c4NAzuehZnOmwEPWXWGWUU7GomHKat4T
	 bGUk8gUy/QH5A==
Date: Mon, 19 Feb 2024 12:04:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: gregkh@linuxfoundation.org
Cc: masahiroy@kernel.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: Patch "modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS"
 has been added to the 6.6-stable tree
Message-ID: <20240219190409.GB2348301@dev-arch.thelio-3990X>
References: <2024021932-overpass-stinger-b897@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021932-overpass-stinger-b897@gregkh>

Hi Greg,

On Mon, Feb 19, 2024 at 05:28:33PM +0100, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
> 
> to the 6.6-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      modpost-add-.ltext-and-.ltext.-to-text_sections.patch
> and it can be found in the queue-6.6 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> From 397586506c3da005b9333ce5947ad01e8018a3be Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Tue, 23 Jan 2024 15:59:55 -0700
> Subject: modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
> 
> From: Nathan Chancellor <nathan@kernel.org>
> 
> commit 397586506c3da005b9333ce5947ad01e8018a3be upstream.

Please apply upstream commit 6a4e59eeedc3 ("linux/init: remove __memexit*
annotations") before this change, as there is a warning in modpost
without it:

  scripts/mod/modpost.c:916:37: warning: excess elements in array initializer [-Wexcess-initializers]
    916 |         .good_tosec = {ALL_TEXT_SECTIONS , NULL},
        |                                            ^~~~
  .../lib/clang/19/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
     26 | #define NULL ((void*)0)
        |              ^~~~~~~~~~
  1 warning generated.

It applies cleanly with 'git format-patch | patch' for me and I don't
think it is unreasonable as a fix for this issue in stable.

This will be needed in 6.1 as well but that backport is a little more
involved, I will reply there with an mbox series.

Cheers,
Nathan

