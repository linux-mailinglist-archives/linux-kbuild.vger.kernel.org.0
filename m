Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE922FA67E
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 17:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393520AbhARQlE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 11:41:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390380AbhARQk3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 11:40:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FC26206F7;
        Mon, 18 Jan 2021 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610987989;
        bh=/XyZZytsXsIiGIMUoHK1SO+Ufo+9X9KY7fkU6YpHpwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tw83WnlbDVTXWxk7hn9NDqNVAHRTcXQXINm45MJHO+zVdvtg5HQDXdFnyUNrnlaIu
         QyTbxenJ9dZWdJsbJjDVpGJaTgNaBZLDgeshrm5abzLVYLC20sQoqIqIxBguEsOthM
         YeUoWr8ZZLyK03Bg3yW4Na7uZjgJHcipLlIy3QGY=
Date:   Mon, 18 Jan 2021 17:39:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Message-ID: <YAW50m8ymp6I9nYp@kroah.com>
References: <20210118014951.250815-1-sashal@kernel.org>
 <YAVTDETPaJuaRPfc@kroah.com>
 <YAVT0XV7uX2NpIRe@kroah.com>
 <20210118133959.GZ4035784@sasha-vm>
 <YAWSgjWHCcJt6m0j@kroah.com>
 <20210118153135.GA4035784@sasha-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118153135.GA4035784@sasha-vm>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 18, 2021 at 10:31:35AM -0500, Sasha Levin wrote:
> On Mon, Jan 18, 2021 at 02:52:02PM +0100, Greg KH wrote:
> > On Mon, Jan 18, 2021 at 08:39:59AM -0500, Sasha Levin wrote:
> > > I think it would also affect code that doesn't do things based on
> > > SBULEVEL. Consider something like:
> > > 
> > > 	if (LINUX_VERSION_CODE < KERNEL_VERSION(4,5,0))
> > > 
> > > Which will cause 4.4.256 to now change the result of that comparison.
> > 
> > Sure, but there are no in-kernel users like this, so my sympathy is
> > quite low :)
> 
> Wouldn't it be an issue for the hacky in-kernel users too? For example,
> right now the USB code does:
> 
> 	#define KERNEL_REL      bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> 	#define KERNEL_VER      bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
> 
> After 4.4.256, KERNEL_VER will be (5) rather than (4), indicating a
> version of 4.5.

Which, really, is just fine.  This is an informational string that shows
up in 'lsusb' for root hubs.  Same for V4L devices, they just want to
send some string to userspace.  Yes, it might look odd, but nothing is
going to break, it's just a string :)

thanks,

greg k-h
