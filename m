Return-Path: <linux-kbuild+bounces-1179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23287278D
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 20:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6942B2498F
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 19:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCB738FAF;
	Tue,  5 Mar 2024 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uemJS2rM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881D18EA2;
	Tue,  5 Mar 2024 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709667018; cv=none; b=sCi90Yxjj1i757ipIGla9T5YfnSP3bcDAkWoUemsk/XlUZC+chqaunQVH3GmuoqVRDetB0FsgTCPGbkMLCHbHA1p+DHCYkXLsNngk+5Q3F6/hthzSux4y3zMzY8/oH0J6URFwxKT3XtOUqL406PJSiIM3ObUdLMSFHVPMhld9lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709667018; c=relaxed/simple;
	bh=TU7ULCtZZi7jWcyR3SfCPPJFR2ljxw8j93N5IXJXUxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKOiu59z/DTNqMlbCSwRq4Cjs5UN/YD3ay4+mQhCaHU5OIyHbZSilxCvGAWaVZIQkYvUap4LvJ7UNPdysT1m92/vxVPIpd2db0c6YyA9vjTQnPoGFNSxff2H3xNwGYUW9u0bHY2tgHAPMbAuUApFHT2gjNAZueMeykTlQqBekZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uemJS2rM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E931C433F1;
	Tue,  5 Mar 2024 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709667018;
	bh=TU7ULCtZZi7jWcyR3SfCPPJFR2ljxw8j93N5IXJXUxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uemJS2rMuMgBzT5h2fwcU3pGWU0E9XbFWhYKPDhkOfzmZAAgc8S62twn2OVLfmip2
	 KvLlUw5S+HrGkwMgw7mFgoGK9l9+OPQEoW7wpeXUdgyu6Ulst5/vzAomcr02XxgAfe
	 QZFqBHj3+nt0SD8I8EJ8OKnN8dVXVqirrADklkXyi93YCeZAdhWldBSlJ1YkyKKYTJ
	 PTAHz3dFz7mK859VUiX9xINC+8BuRXNkjFMBzt2wu3pXP1RXpeDcGi9I/11IJjKV1I
	 FTNAERf506r1JhprRgZ+/SR1FaR2A2oW3Sm9M634uwH7LGI8vrz/C7IZ1iNmTw7d+j
	 pqp8Ah2Qtpaeg==
Date: Tue, 5 Mar 2024 12:30:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Disable two Clang specific enumeration warnings
Message-ID: <20240305193015.GA1173426@dev-arch.thelio-3990X>
References: <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
 <57abd8e9-3177-4260-b423-38d5cdcda44e@app.fastmail.com>
 <CAKwvOd=V_Qtd2pK8AKc6bv=zMPnAaCf08=QO74ckqH26A3sefA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=V_Qtd2pK8AKc6bv=zMPnAaCf08=QO74ckqH26A3sefA@mail.gmail.com>

On Tue, Mar 05, 2024 at 10:52:16AM -0800, Nick Desaulniers wrote:
> On Tue, Mar 5, 2024 at 10:50 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Mar 5, 2024, at 18:42, Nathan Chancellor wrote:
> > >
> > > As the warnings do not appear to have a high signal to noise ratio and
> > > the source level silencing options are not sustainable, disable the
> > > warnings unconditionally, as they will be enabled with -Wenum-conversion
> > > and are supported in all versions of clang that can build the kernel.
> >
> > I took a look at a sample of warnings in an allmodconfig build
> > and found a number that need attention. I would much prefer to
> > leave these turned on at the W=1 level and only disable them
> > at the default warning level.
> 
> Sounds like these new diagnostics are very noisy. 0day bot sends
> people reports at W=1. Perhaps W=2?

A number of subsystems test with W=1 as well and while opting into W=1
means that you are potentially asking for new warnings across newer
compiler releases, a warning with this number of instances is going to
cause a lot of issues (I think of netdev for example).

I think if we are going to leave it enabled at W=2, we might as well
just take this change as is then have people who are developing the
fixes use 'KCFLAGS=-Wenum-conversion' when building to override it,
which is more targeted than using W=2. W=2 is not run by any CI as far
as I am aware, so there is not really any difference between disabled
altogether vs.  enabled at W=2 in terms of widespread testing. Once all
the fixes (or patches to hide instances) are picked up and merged into
Linus's tree, this change can just be reverted.

Fundamentally, I do not really care which avenue we take (either this
change or off by default, on at W=1), I am happy to do whatever.
Unfortunately, CONFIG_WERROR makes these decisions much more urgent
because it is either disable it and have other warnings creep in amongst
the sprawl of these warnings or leave it on and miss other errors for
the same reason.

Cheers,
Nathan

