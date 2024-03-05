Return-Path: <linux-kbuild+bounces-1182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9981872A01
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 23:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4DD3283211
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 22:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FC712D1F7;
	Tue,  5 Mar 2024 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMjyak1D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA912B17E;
	Tue,  5 Mar 2024 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709676845; cv=none; b=fwJuemPcPcysfDf3Vu7rBN4XUAXMbSkqyeDXvtW2sfQYPX4mEsnqu78+fRKtsH5o+AAwPCvHC7OliTvIXWvOKQiNBAs3aeazyu7AshEVUri7whuoWFVDagOpP2xYH4GZZJLUtggvOp+dgS12t7n0gZ6pRMG9JeorjRxtY2urZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709676845; c=relaxed/simple;
	bh=Wg1yOxK1nVNYDzyYiT6yn8Qfew3WmNqQyzmb5xL2bp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBAVjTCP8tsTFTQp/zjeQwNvLJXAYR1vrQSXhfYN1A4fP+IlFrPJElzAnFdPiVQaDHUqgsuVLBXoAg676WaIRx2ijHarFuwL9oV+C+sBoPVv31kmSn++lOO+drvBsrNaauW9EAMQnStEC4z1LqOF4iMtOH8bt6CVZiJ3WV+xPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMjyak1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710E2C433F1;
	Tue,  5 Mar 2024 22:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709676845;
	bh=Wg1yOxK1nVNYDzyYiT6yn8Qfew3WmNqQyzmb5xL2bp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMjyak1DcC35R39kjuT1KsfnwtYMQvCp/Tspa20T5whG+f1hseD7ZfCc/tmp7hKzo
	 O8e9+pDjdhoobSMnLwo4D9mCj+ktQi+x4+t/2iEmy7tz+P9tq1omnRAOH139Zv+Zuz
	 uMAYuW4Bpign/wn9E9o9DcEopWHMWRTPVeF4Q9w1I7yOUbdDZOP32wi5QjNwrRhfO1
	 nAJ9kcYOs9G8ayjzR0ifI7xOHdGPNdL3uywB6qVocFw2xa3HjZOR+tlWqbGFRIqKVp
	 t7NJMhRIynPfkz8Fun67GlG4dlw8h7G/vDexHRsifUoxyKy0HpGGljBafsOdpbC6qK
	 NjFumDPyThqYw==
Date: Tue, 5 Mar 2024 15:14:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Disable two Clang specific enumeration warnings
Message-ID: <20240305221402.GA233379@dev-arch.thelio-3990X>
References: <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
 <57abd8e9-3177-4260-b423-38d5cdcda44e@app.fastmail.com>
 <CAKwvOd=V_Qtd2pK8AKc6bv=zMPnAaCf08=QO74ckqH26A3sefA@mail.gmail.com>
 <20240305193015.GA1173426@dev-arch.thelio-3990X>
 <5b4fa755-571e-4a99-8614-ca0df1db1563@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b4fa755-571e-4a99-8614-ca0df1db1563@app.fastmail.com>

On Tue, Mar 05, 2024 at 10:52:54PM +0100, Arnd Bergmann wrote:
> On Tue, Mar 5, 2024, at 20:30, Nathan Chancellor wrote:
> > On Tue, Mar 05, 2024 at 10:52:16AM -0800, Nick Desaulniers wrote:
> >> On Tue, Mar 5, 2024 at 10:50 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> >
> >> > On Tue, Mar 5, 2024, at 18:42, Nathan Chancellor wrote:
> >> > >
> >> > > As the warnings do not appear to have a high signal to noise ratio and
> >> > > the source level silencing options are not sustainable, disable the
> >> > > warnings unconditionally, as they will be enabled with -Wenum-conversion
> >> > > and are supported in all versions of clang that can build the kernel.
> >> >
> >> > I took a look at a sample of warnings in an allmodconfig build
> >> > and found a number that need attention. I would much prefer to
> >> > leave these turned on at the W=1 level and only disable them
> >> > at the default warning level.
> >> 
> >> Sounds like these new diagnostics are very noisy. 0day bot sends
> >> people reports at W=1. Perhaps W=2?
> 
> It feels like this is not a great reason for moving it to W=2
> instead of W=1, but W=2 is still better than always disabling
> it I think.
> 
> Specifically, the 0day bot warns for newly added W=1 warnings
> but not for preexisting ones, and I think there are other warnings
> at the W=1 level that are similarly noisy to this one.
> 
> > A number of subsystems test with W=1 as well and while opting into W=1
> > means that you are potentially asking for new warnings across newer
> > compiler releases, a warning with this number of instances is going to
> > cause a lot of issues (I think of netdev for example).
> 
> I only see a handful of warnings in net (devlink, bpf) and
> drivers/net (ethernet/{3com,amd8111e,funeth,hns,idpf,jme,mlx4} and
> wireless/{iwlwifi,mt76,rtw88,rtw89}). 
> 
> These are also some of the ones that I think need a closer look.

Fair enough, I have sent v2 that just moves these warnings to W=1.

Cheers,
Nathan

