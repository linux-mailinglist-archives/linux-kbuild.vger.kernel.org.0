Return-Path: <linux-kbuild+bounces-9832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30CC85068
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DF964E395F
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 12:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39071320A3E;
	Tue, 25 Nov 2025 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Um2gjLgo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7WN+rbmK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95E27467D;
	Tue, 25 Nov 2025 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075184; cv=none; b=NS0Nu+Y42VJneZEYy0E3w6SW+WUpNRjfdbe8pSlhRDJ7ii0MCmN2kpOrsEDs5dsKHLcCDRE7qDtX6r+6jH1/42zGgeaidoFGOYcvnw2rJTSLtPLppXir27xI14VLP5FRieLw0TIa2zg93LM/FGjWU/VgNrGnrC1e/PAFFYCwgrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075184; c=relaxed/simple;
	bh=Qb6yADEJ6q0b5zhRUsbd+B9TbNhRB8As0A9B0/Zfd/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkqKRrgD4XPhPqaHgvVf5McuiljdjheCtMb/Wpw1IgRoAk3m3OzpZk6HIDKgXY5xYOJHkxFUh5ZGcIUAK0dWxMsHNRFp4F+FIf5dk5VuU9pYleCXNOt0yRorcD4Tzls0JncAy/jOdiy2S7w7h8tRn3vJwmCtxC+GYpXeGFFVMYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Um2gjLgo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7WN+rbmK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 25 Nov 2025 13:52:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764075180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCxUOclmtbZH0FfIA8TitbS2pzMJSgpDS1M3y8P1PcI=;
	b=Um2gjLgo3TnQatkVmZxEs+PAzzfwB4tlSBj95ieTk3fcTcT//EMzFH2OSbwwaIHXWXGn0N
	g+CJ7bLa88Twi3YksxZZ5I56lN/rBjpcUS3DVLBO4mxLYKs3jDFOSUjDqC2ljT83zdOnmM
	eVW9uYCmfLre76j4+2KBFTNsg/8QgEjidxE7Epil3CDzDL+10R9ie4vQ43Nf7j9iISZwa9
	+bQotKqytgeVRfUA8W2SnST/6j3QlgrQg7GWs3t32SEXo41+khqEgOGlk3FMWBEuvObH7r
	A0orZBoeKIF4vm4+hcobt4W2E+fv20hoQd5KHc90edwL6QtJpnZi8Fle8NGQiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764075180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCxUOclmtbZH0FfIA8TitbS2pzMJSgpDS1M3y8P1PcI=;
	b=7WN+rbmKQh+/SlNZQM4vLvHm1dHdtykOX3BkXhPLpEiIlX0j/Uo4BYOqT2mjaYLL65WGW9
	icThbs1AjNj6aZBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Simon Glass <sjg@chromium.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
Message-ID: <20251125134030-7a8d0be5-7404-4885-b179-86b8aab4cd07@linutronix.de>
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
 <20251120080325-536d8deb-fdfe-4dc0-9687-d5d73006376c@linutronix.de>
 <e358027d-a996-404f-b043-62b9c1b4d06c@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e358027d-a996-404f-b043-62b9c1b4d06c@pengutronix.de>

On Tue, Nov 25, 2025 at 01:07:20PM +0100, Ahmad Fatoum wrote:
> On 11/20/25 8:32 AM, Thomas Weißschuh wrote:
> >> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> >> index 74bcb9e7f7a4516473481468a0fcf700c3bead33..20eec9e2dec4dda3fa0ef64a15b80dccdcb55f90 100644
> >> --- a/scripts/Makefile.package
> >> +++ b/scripts/Makefile.package

(...)

> >> +quiet_cmd_cpio = CPIO    $@
> >> +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
> > 
> > Use $(CONFIG_SHELL).
> 
> Can do. Is this to allow users to override CONFIG_SHELL from outside?

I think so. Some distributions do weird things.

> If so, why not go one step further and remove shebangs from scripts
> altogether to enforce that they are called with a $(VARIABLE) that can
> be overridden?

The shebang is also useful to enable syntax highlighting in editors, tell
linters which shell dialect (POSIX/bash) is expected and to run the script
without kbuild. I would just leave it as is.

(...)

> > Is the cpio-data= intended to make sure the line 'hostprogs := gen_init_cpio'
> > is executed? I don't think this works as usr/Makefile will overwrite 'cpio-data'
> > in any case. But it should be fine to make hostprogs definition unconditional.
> 
> Will add a commit making hostprogs := gen_init_cpio unconditional.
> The current approach worked though, because specifying the variable on
> the command line overrides cpio-data := assignments even if there are
> multiple.

Indeed. Good to know, thanks!


Thomas

