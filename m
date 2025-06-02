Return-Path: <linux-kbuild+bounces-7331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DCACA802
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 03:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E0E81885744
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 01:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02E58BE8;
	Mon,  2 Jun 2025 01:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oLVKO0f6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F031B85C5
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 01:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748826246; cv=none; b=j1TkqMsmsr63kfTA1V7khYZD+FdZscOZ7FLCWJWqObrlgFX4wczqOXoSEIi9nhMsyc9AHLqCh9a9TJNLuCJKfvN5p9wUaZl98DhYUepezigyAhv3/nChAu7jMuRph75jbhx4lP50q+3zRmXxiyNhAoJaFIZjaO0uDgAgubJ9EzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748826246; c=relaxed/simple;
	bh=pTuw7O0aO+giWN7RaXx8dkyPOijHgWqqSSEevZYPCQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQZ966IxbTWsICx6NKN62qcObO4z6C9ON8YLdYQK4lznO/jBhyFELfnvmP1r7HJ2Jz8Vv0iewT0o6+Q2vYh5TgWFgjbRnnsE+D1rsDXLDzhpaKY83VJRGEQVZ10IzPP0AkGeKDSC1KkJTVVk4MRWRK0L3y/i5XRBgXFsM0hYogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oLVKO0f6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hHjiL3LvWHECdIaJWOMwGSCKT4bXV9Sn4Wb1eIP91JE=; b=oLVKO0f6BBUk45ToOdbBQcmaoE
	CnF6qnLBdO5ZgDGyYKVZcvE9Uroqo/nWN32fFerj4JJmgWEorQRCFuThPpXx5rSHrc3Bz4tMSDP1z
	Cr3uFi9xUTGhYfFZurxK740A0D0YeicFPfvaJ1kHE2u8hi6c/UOVGFyNjxUFFjxUiK1a0OHPGX70f
	f/aJDEz5OHqEWDJvqX0W8nxbS3rxXdCWzo/mJM2XK6x9sNbrRbsT8yTqTbO4H37Ca5wMp2abrDjlg
	X+B+l+qN03+3TiK/r2/KHoAQ4Xxq5M72wnr//NoyAnN4BAY9KjVXPZN+peCjcSf+QICfJ2vIqqlpm
	J07VuYAg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLtas-00000000ZRZ-3AKr;
	Mon, 02 Jun 2025 01:04:03 +0000
Message-ID: <a7fb70de-7bf1-4208-a62c-2b8b9d0ec6bf@infradead.org>
Date: Sun, 1 Jun 2025 18:04:00 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] kconfig: comparison feature between two .config files
 added to mconf
To: Franco Martelli <martellif67@gmail.com>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250601184049.368419-1-martellif67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,



On 6/1/25 11:40 AM, Franco Martelli wrote:
> Dear Linux hacker,
> 
> I've written a patch that allows to compare the tristate value of two
> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
> It can be useful when customizing the .config file, personally I use it
> to compare my .config file with the one provided by the software
> distribution.

I like this concept. Thanks.

> > A screenshot of the new mconf view is available here:
> https://i.is.cc/2cpIXxoP.jpg

That virtual terminal is wider than 80 columns.  :)

Please make <Compare> fit into an 80-columns terminal (squeeze spaces on that line).

> The patch was originally written on Linux 6.1 amd64 series tested on
> 6.1.137 kernel version.
> 
> The patch has a limitation, it only show the tristate value (Y/N/M) not
> differences for symbol with a value (string), but it also marks with a
> "#" the symbol missing in the loaded .config, meaning therefore the
> symbol as a new feature.
> 
> o I've also added support for the more canonical <F1> key to show inline
> help window, in addition to <?> and <h> keys.
> 
> o By pressing the <F2> key you will get a view with all the symbol
> differences listed.
> 
> o By pressing the <F4> key you'll save to a file the differences.

   I would appreciate at least one alternate to F2 (Compare) and F4 (save
   diff to file) since my window manager (xfce4) intercepts Function keys.

> o Added help text that it describes the new features.
> 
> If you like this patch, it would be nice that other kconfig GUI client
> such as nconf, gconf and qconf be patched in order to have compare
> capability for them too.
> This software is under GPL-2.0 license.
> 
> Franco Martelli (1):
>   Kconfig: Added compare capabilities for mconf
> 
>  scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
>  scripts/kconfig/expr.h             |   9 ++
>  scripts/kconfig/lkc.h              |  11 ++
>  scripts/kconfig/lkc_proto.h        |   4 +
>  scripts/kconfig/lxdialog/menubox.c |  13 +-
>  scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
>  6 files changed, 376 insertions(+), 18 deletions(-)
> 

   The patch justification should be with patch 1/1, not patch 0/1,
   so that the maintainer does not need to merge text from 2 patches.

-- 
~Randy


