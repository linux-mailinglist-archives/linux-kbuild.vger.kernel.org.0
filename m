Return-Path: <linux-kbuild+bounces-4903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C99DAFD3
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 00:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAC2FB217EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F79B1990BD;
	Wed, 27 Nov 2024 23:26:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B061990B7;
	Wed, 27 Nov 2024 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749965; cv=none; b=IN5uIB9AFk5zAPOBcZf9c5vP7ZyxcaAK6gf7HczW97qGTLBKl7QJ9lkghBWXWPdM5ocKN5hDODHyjE3+P8PFTUGc2DpjHeFoCgFyfw+y01Pm98Q3Q6KkoGM0ix8WO4Mm5OMplNmbhIv2OEFmx3mMhF4EDWJvtotD5ssjZS1Lp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749965; c=relaxed/simple;
	bh=1FJBXmaQSpmIb5DuWh95szHp6eXBY0xiIxMtpeRMYpk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnI7iePZEUoMqiUNKPG7AMQoVcJWR8jINe8GVhShl97IOfY/8O8LITvUcWW/H5379F+gOSJ5KU3GBAJNM86i8gww/8+5Ae3m04ZVNT77LP0I/Lr0y+3mH5/u3PSNnqt+wOWGLxrEGlp04Uu+95RJ9eHXc5nZuNIst51acCqgBAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F90C4CED3;
	Wed, 27 Nov 2024 23:26:04 +0000 (UTC)
Date: Wed, 27 Nov 2024 18:26:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: David Hunter <david.hunter.linux@gmail.com>
Cc: javier.carrasco.cruz@gmail.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, masahiroy@kernel.org, shuah@kernel.org
Subject: Re: [PATCH v3 0/7] streamline_config.pl: fix: process configs set
 to "y"
Message-ID: <20241127182656.5834616b@gandalf.local.home>
In-Reply-To: <20241127230547.2047716-1-david.hunter.linux@gmail.com>
References: <20241018103032.09ff7dcf@gandalf.local.home>
	<20241127230547.2047716-1-david.hunter.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Nov 2024 18:05:47 -0500
David Hunter <david.hunter.linux@gmail.com> wrote:

> From: David.hunter.linux@gmail.com
> 
> I think that there are 2 distinct reasons that a module should not be
> turned off when using the 'localmodconfig' command. 
> 
> 1) the module is used directly
> 2) the module is needed for another module that has been included in the
> kernel with a "y". 
> 
> I think we both agree on the first reason, but we may be having a
> disagreement/miscommunication for reason 2. 

Note, Linus uses make localmodconfig a lot. He didn't always, because he
complained that it would keep too many options enabled. I don't want to
suddenly have Linus's make localmodconfig blow up the options again. I can
see him complaining about it. Believe me, you don't want Linus to notice
this patch for the wrong reasons.

This is why I'm very concerned about things like BCACHEFS being enabled
after localmodconfig when there's obviously no reason for it. Even if it
enables CLOSURES. BCACHEFS is an filesystem that I don't use. It should not
be enabled on my machines.

> 
> > For example:
> >
> >  BCACHEFS_FS n -> m
> >
> > Why is that needed?  
> 
> With regards to your question, I see that 'CLOSURES' is set to 'y' in
> your original .config file. 'BCACHEFS_FS' selects 'CLOSURES'. I suspect
> that if 'BCACHEFS_FS' is set to 'n', then your config would have no way
> of keeping 'CLOSURES' as 'y'.

Which is OK for this example.

> 
> I understand that the following patch is not suitable for upstream;
> however, the following patch might help you to understand a little bit
> more about each config options like 'BCACHEFS_FS'. 
> 
> https://lore.kernel.org/all/20241014141345.5680-5-david.hunter.linux@gmail.com/

Note, I'll try to remember to look at this after the Thanksgiving break.

> 
> If you put in
> 
> dprintvar("BCACHEFS_FS);
> 
> you would be able to see what selects 'BCACHEFS_FS' and what is selected
> by 'BCACHEFS_FS'. I suspect that if you were to use it for each of the
> config options that you have questions about, you would likely see that
> each config option set to "m" has a "y" option that it selects. The
> question then would be is the "y" option actually required for your
> particular machine.   

I would argue that if a 'y' depends on a 'm' then it's not needed unless
that 'y' is a dependency for other 'm's that are needed. We should look
into seeing if that's the case.

> 
> This brings us to the root cause of the issue that we are having: there
> is no way to know if a config option set to 'y' is actually required. If
> there was a way to tell if 'CLOSURES' is needed, we can easily determine
> whether BCACHEFS_FS is actually necessary. 

I would say that CLOSURES is considered needed if a 'm' that is needed
depends on it. Otherwise, I would say no.

> 
> Without knowing whether the 'y' options are needed, we then have to make
> a determination whether it is better to have the (potentially necessary)
> 'y' options with the extra (not directly used) 'm' options or to drop
> those 'y' options along with those 'm' options. 
> 
> My argument is that the 'y' options are important, even if we cannot
> determine whether they are used or not. The problem I had that made me
> aware of the issues with localmodconfig was that my new computer would
> consistently do an emergency shutdown whenever I would try to compile the
> kernel. I eventually realized that the fan was not being recognized, so
> my workaround was to put the BIOS in control of the fan (instead of the
> kernel). 
> 
> It was not until I realized that I had a few hardware devices that were
> not being recognized that I was able to pinpoint the root cause of the
> problem. For clarity, some of my hardware devices that were nonfunctional
> were USBs, the microphone, Bluetooth (and as mentioned earlier, the fan). 

Can you show the dependency change for those devices. Knowing what exactly
was disabled and knowing what was needed would be useful. That way we can
fix the actual problem without using a big hammer approach of just keeping
any module enabled that enables a 'y'.

> 
> I am curious to know if there are any hardware devices that are not
> recognized on your computer after you use localmodconfig. One way to
> check is to use use 'ls' on the psuedofilesystem or to use any of the
> commands (like lspci) that recognize hardware.
> 
> I do not know whether any of your hardware requires the 'CLOSURES'
> config, but because someone's hardware MAY need it, my reasoning is that
> streamline_config.pl should include 'BCACHEFS_FS' if it is the only thing
> that selects another config opiton set to 'y'. 

BACHEFS is a new file system. If there's a dependency in my config that
requires it, that's a bug in the config.

> 
> On my computer, when all of these configs set to 'm' are added (because
> of reason 2), all of my hardware works (including the Bluetooth,
> microphone, and USBs. 
> 
> If, on the other hand, you still feel like it would be better to not
> include these particular config options, I would ask that you allow a
> command line option like '-s' or '--safe' that users could use to make
> the config file with the added modules. 

Let's first find out what the problem is. Remember, this is code that Linus
uses for his builds. Rule #1 I was told when I first became a kernel
developer was, "Whatever you do. Don't break Linus's workstation!"

-- Steve

