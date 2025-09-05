Return-Path: <linux-kbuild+bounces-8735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F803B44EB5
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 09:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F0B1899D2A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 07:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF41289367;
	Fri,  5 Sep 2025 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kJrhCRVf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA232F76C;
	Fri,  5 Sep 2025 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056152; cv=none; b=buMO+qa7gsxZCSnvvgoiz72FR7yALHFImNZP5h4mOaEdlpPPU9hkNiJ92nBFXZBEr8Qu/u4IuWGCTk9WVsyrLjVJU4+PLeKaXuxxMLIynPpoz3Du+MFN37GUFdozOjjkwg0T5QrzrVqDHNCdMpmpKM2CJATQbZFKgVYSuz0Ho+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056152; c=relaxed/simple;
	bh=uW6MvFBs8s7onCuHdD02j3rhqcGvGTFKLr5+U/ZCBNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkN/YyCyHIgPLMBg7F3qVwCPlSl/9kNke1TdMUTbF61b9OX0b5UdDRjgvErorxQaUwTmyOTMioNT3GetAyTUhY+p2zxdqN8MYYc79ZeanVLEUja+vewiGkdZYu9UfiUGc42+Va1o28fXrffXcAOfpD8i2NCfRooQRAYOCcHKS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kJrhCRVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C477C4CEF1;
	Fri,  5 Sep 2025 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757056151;
	bh=uW6MvFBs8s7onCuHdD02j3rhqcGvGTFKLr5+U/ZCBNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJrhCRVfXTWCWu3txFyy9ohboIYaRM+La8MSMSlWRhC6cAVnNAiJTSxeIVAPxKmc1
	 RbGcPOaCjVAJvmlIA3WJfFjWQpmuazpWp8gxNH+QF1R2CRvri0kc/bIHGE/EWC0Ri8
	 K7xV1SL50L01pD8a2JxL9kvXbbFgpSPFQp/6gWMs=
Date: Fri, 5 Sep 2025 09:09:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ming Wang <wangming01@loongson.cn>
Cc: WangYuli <wangyuli@uniontech.com>, ardb@kernel.org,
	chenhuacai@kernel.org, chenhuacai@loongson.cn, kernel@xen0n.name,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu, sashal@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
Message-ID: <2025090549-mannish-tremor-2469@gregkh>
References: <2024120635-wham-campsite-b62b@gregkh>
 <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
 <2025020611-olive-gluten-fa45@gregkh>
 <17f2c722-a32b-482b-9363-6a415443fb40@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17f2c722-a32b-482b-9363-6a415443fb40@loongson.cn>

On Fri, Sep 05, 2025 at 02:49:44PM +0800, Ming Wang wrote:
> Hi Greg, all,
> 
> On 2/6/25 18:03, Greg KH wrote:
> > On Thu, Feb 06, 2025 at 04:37:02PM +0800, WangYuli wrote:
> > > Hi, Greg,
> > > 
> > > It's rather unfortunate that currently, almost all Linux distributions
> > > supporting LoongArch are using LTS kernels version v6.6 or older, such as
> > > openEuler and deepin. [1][2]
> > > 
> > > If this bugfix isn't merged into linux-stable, then every single distro
> > > kernel team will have to waste time fixing the same darn bug over and
> > > over, even though it's already fixed in later kernels.
> > > 
> > > This would really make LTS look like it's failing to serve its intended
> > > purpose. And I'm sure all of us do not want to see something so terrible
> > > happen.
> > 
> > LTS is here to ensure that the original release of these branches, keeps
> > working for that branch.  Adding support for newer toolchains sometimes
> > happens, but is not a requirement or a normal thing to do as that really
> > isn't a "regression", right?
> > 
> > Most of the time, fixing things up for newer compilers is simple.
> > Sometimes it is not simple.  The "not simple" ones we usually just do
> > not backport as that causes extra work for everyone over time.
> > 
> > As for the distros like openEuler, and deepin, they are free to add
> > these patches there, on top of their other non-LTS patches, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> I'm writing to follow up on this important discussion. I have carefully
> read the entire thread, including your explanation of the LTS philosophy
> regarding support for new toolchains. I understand and respect the
> principle that LTS aims to maintain stability for the environment in
> which it was released, and that adapting to future toolchains is
> primarily a distributor's responsibility.
> 
> However, I would like to respectfully ask for a reconsideration by
> framing this issue from a slightly different perspective, based on the
> excellent technical analysis provided by Xi Ruoyao and Ard Biesheuvel.

<snip>

i'm sorry, but for an email thread that happened 6+ months ago, it's a
bit hard to try to remember anything involved in it.

Heck, I can't remember an email thread from last week.

Remember, some of us get 1000+ emails a day to deal with.

If you feel a patch set should be applied to a stable tree, and it has
been rejected in the past, feel free to resubmit it with all of the new
information about why the previous rejection was wrong and why it really
should be applied this time.  Otherwise, there's really nothing I could
possibly do here as the patches are long gone from everyone's review
queues.

Also, why aren't you just using 6.12.y now?  :)

thanks,

greg k-h

