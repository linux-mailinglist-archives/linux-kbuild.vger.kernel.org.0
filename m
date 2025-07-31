Return-Path: <linux-kbuild+bounces-8258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039DAB17070
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 13:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B9701AA2D25
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 11:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BEE2C9A;
	Thu, 31 Jul 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uK5isa/J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE932BE059
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Jul 2025 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753961894; cv=none; b=B5paYZGdRHFpZsTBCj6iSd1CwiUltzR06Vh/bI+pj9st2BYdvThdIdBLOAiWEUnIQeKZib6gGVxLaPz0dXa/7vGNr78FRr2R3WFoZRUAXrJ57qjGP+BjtGNXdADZ5c0k3pgD+JguVGIpwmaAbS9s3p6YS6vCnfNK9UWZgoJfNe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753961894; c=relaxed/simple;
	bh=yddIsPfRcDoE+LzIiDbPY+7IxAS6D6Z3Wj2NyJ3aExI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bke0szW0jTfKs1xnNRx87I1Lbu5S7GqDJhzfMNbWqFpvuBx5Y1kMMLdid1owuPCT2y5J7HP8MbxRxnaINTRh8jGqyDiWJy9oATqAzKAbZrdsLwSqM1RTBWr6eTUESq8z9KAT+1OqcnEWY1bBwp5UoRRyhnWy9bmfebi2Helgpu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uK5isa/J; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 31 Jul 2025 13:38:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753961888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jO8WX1xSPSs50ZO+PH2osUuKqBsP5KCRVFwqDaGyhXY=;
	b=uK5isa/JD4sDY87ijyZZSgPq9Y9KIX4cAqDLYkgz6jQdL7AigB1ZQZlibaILPr87ShbJYT
	us75ywRJ3MhQgLimTnar/UEEFhEGiarMkHTxoJFfP6SZCwAf3l9krp3ffil8/cNmThC3MC
	acOMqEmeZjbeNrtOP/77p/VJmumxTvc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "David F." <df7729@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
Message-ID: <aItVnueRx5QW2Zds@fjasle.eu>
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 30, 2025 at 01:51:21PM -0700 David F. wrote:
> Hello,
> 
> I build the amd64 kernel on a debian based linux 686 version.
> Building the 6.6.x kernel, everything was fine (fixdep/modpost were
> ELF32), however I jumped to 6.12.x / 6.15.x versions and now the
> system is building them as ELF64 which means I can't build my custom
> kernel module.
> 
> To make the kernel(s) I use: make bindeb-pkg
> 
> The build for the 686 kernel worked fine, creating the ELF32 binaries,
> and allowed me to build my kernel module for it.
> 
> What do I need to change for the build to properly create the ELF32
> version of the various scripts created with the headers for the amd64
> kernel?

I cannot reproduce your issue at all on v6.6.100, v6.12.40, v5.15.8 or v6.16 on
a clean Debian bookworm i386.  I did:

make mrproper
make x86_64_defconfig CROSS_COMPILE=x86_64-linux-gnu- bindeb-pkg

Can you be more concrete about the actual commands you run?   Which Debian
distribution do you use?

Kind regards,
Nicolas

