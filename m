Return-Path: <linux-kbuild+bounces-1303-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436B88792E
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Mar 2024 16:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D9211C20C73
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Mar 2024 15:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D513D0D5;
	Sat, 23 Mar 2024 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="ZUGKPYGj";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="uFhlVOJ4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CF10A0C
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Mar 2024 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711206307; cv=none; b=M1CsF0yT5geJHQ5ktWycQ+JW82Jy+hLc1SFgtT52fel+5xfAVWNTCAd28bloG51I+8vbH54MhMR6UWVvzW4AXmlQ2m5w88jIt/u/DJa2zBsuN82gYl9dwSVVEgaIqW3pLy3j/7yMdr0Ya40gjP/kbKzxUHeIfuOad0AswGfEAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711206307; c=relaxed/simple;
	bh=DmjwTsURvWnAZTwfEJ7AZFEQbMFRgd4LbcGm+vqXblI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5+DD4LFFUYPufNHTYvKOUr4+Wb0dTfvZ0pNtFWyFIfdEDGw1OQ8MhMK7RP4Hg5xHQRcXcaCbm7qFlIqZYMMX3gFsJXbpGhEOAEA8MWjvQlHG1UQszV9lyeq0P8gTmbbVmzTaH6qnaqknbDDSGHNjvbt+VC+peR1qKL8uusEGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=ZUGKPYGj; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=uFhlVOJ4; arc=none smtp.client-ip=46.30.211.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:to:from:
	 date:from;
	bh=hTD37jtbF2IkLbRevRKol8O2fXTT+UqURCu+UVRCX4M=;
	b=ZUGKPYGjIkJknsOZLWsZbRSDIiBc76u/xflY0A5hKZLnpx6rIVin1Pn/prkOkKamqEGzijP7yQuxX
	 MYcTf7SmPcIpQwzDtvLchB9maeKT1bE0zrFb+lRa0hQs7/PjNFgpKv8MSZSVb6fMrmGaZVpTr7rP/y
	 Ycl89/ykaurMxC284fOi82evcHkdY8UZutm7ZXjdRiRkgqn03qZFTC1in1K2lzzW9NMUR42u8Ogy8E
	 OhpLQTZUOIdt4TUXKK2+4v64BVNLJbgyg36dvJGgdHFwulhJreBMJUyafYCXWV+stuh7aGI1YYd+bw
	 d9D/8wSRWCaaMBbwsgjGgQxl2fFhQRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:to:from:
	 date:from;
	bh=hTD37jtbF2IkLbRevRKol8O2fXTT+UqURCu+UVRCX4M=;
	b=uFhlVOJ4VTnu9mqrBs3w2Y45hODnUzJomgv8cxvnI3gVf8/yOtsj0GZEUPEvXhvjm4zFUOx66LWD4
	 PmM89oKBA==
X-HalOne-ID: 8e6306b9-e926-11ee-b332-dfbeffc51846
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 8e6306b9-e926-11ee-b332-dfbeffc51846;
	Sat, 23 Mar 2024 15:03:51 +0000 (UTC)
Date: Sat, 23 Mar 2024 16:03:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-kbuild@vger.kernel.org
Subject: Re: How to avoid "version generation failed" warning?
Message-ID: <20240323150350.GA936705@ravnborg.org>
References: <20240323131407.GA897267@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323131407.GA897267@ravnborg.org>

Hi all.

On Sat, Mar 23, 2024 at 02:14:07PM +0100, Sam Ravnborg wrote:
> Hi all.
> 
> When building sparc32 allmodconfig I see a lot of warnings like these:
> 
> WARNING: modpost: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
> Is "empty_zero_page" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__udelay" [vmlinux] version generation failed, symbol will not be versioned.
> Is "__udelay" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ndelay" [vmlinux] version generation failed, symbol will not be versioned.
> Is "__ndelay" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ashldi3" [vmlinux] version generation failed, symbol will not be versioned.
> Is "__ashldi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ashrdi3" [vmlinux] version generation failed, symbol will not be versioned.
> Is "__ashrdi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__lshrdi3" [vmlinux] version generation failed, symbol will not be versioned.
> Is "__lshrdi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: "__udelay" [kernel/locking/locktorture.ko] has no CRC!
> WARNING: modpost: "__udelay" [kernel/rcu/rcutorture.ko] has no CRC!
> WARNING: modpost: "__udelay" [kernel/rcu/rcuscale.ko] has no CRC!
> WARNING: modpost: "__udelay" [kernel/rcu/refscale.ko] has no CRC!
> WARNING: modpost: "__ndelay" [kernel/rcu/refscale.ko] has no CRC!
> WARNING: modpost: "__udelay" [kernel/time/test_udelay.ko] has no CRC!
> WARNING: modpost: "__udelay" [kernel/scftorture.ko] has no CRC!
> WARNING: modpost: "__ashrdi3" [fs/quota/quota_tree.ko] has no CRC!
> WARNING: modpost: "__ashldi3" [fs/ext4/ext4.ko] has no CRC!
> ...
> 
> I already tried to add the prototypes to asm/asm-prototypes.h - but this
> did not have any effect.

When I triggered a re-build of the affected .S files it worked.
(I am used to kbuild handle all dependencies so well...)

Solution seems simple:
- Add missing includes and missing prototypes.
- Include the asm-prototypes in the relevant .S files to trigger rebuild
  when the asm-prototype file changes.

I will prepare a patch and submit it to the sparc list.

	Sam

