Return-Path: <linux-kbuild+bounces-8982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92818BAA48F
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 20:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6FF3A5768
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 18:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E57619F13F;
	Mon, 29 Sep 2025 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpVM4Xgj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BAB22FDE8
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759170317; cv=none; b=AxvFM9H8iBOnedG6qU83ee117bAAAQjxneA6F6bLzOMTfSAVBG8208eJpkyiHEOMdxRPjM0lIOG+INwNeTWIJT6Y8VVr2xH1Rdv13p0NNZVXMmHIa8SCokGy8eUqDiVPxtt/vwamoKcqrc2jVTH6IvUllyENEh9kAMRu3LZNXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759170317; c=relaxed/simple;
	bh=ZjObj942ob9QMvt7E5bgIOrXsIER1CwX+sikwrL/HAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeAHiciE7/hT/N4iYLY7ssQ5ET4PMQwyL9A8LeuUNdiDYVBCqX9EYpy1p7ty4Y7ULcQ+zZ1PMSuauU4QAMaYbyVFqrm7b5o1wt2UwyhDspt484G65kb4xQpfW2yTPjR0UrFXMtPzOHSVhY+/q0GXGfWG/Jw00DG1rV3wURw2zPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpVM4Xgj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F230C4CEF4;
	Mon, 29 Sep 2025 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759170316;
	bh=ZjObj942ob9QMvt7E5bgIOrXsIER1CwX+sikwrL/HAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpVM4XgjR1adKu/Ti6nEG3J9MbEYcSkjnFjv5x0cFPcC2cA7g+7Uzg5zNPnfL2Jgl
	 c0LUixDahIzUmP7s9GD2C/0A2hKQ1vW9G8n+oCEKySrpVPoY1PipFDsOTByVBKA66P
	 /u2Vbc+D6sCN2KRu2FlTlUaHYHOIPNv+p2bPXrDPNCY5/NOC/fFzadDBMiYcIOvn6c
	 DDUW3oveRMrrYJexhoVlIRjx3ttK0t0x9VvmCPK96qaCX+T9tEgP2O1uiKz+lkwhEi
	 TCKCMVdQclisTPcbEfW2P9zJQuOG2YSmZmJCEJI6w+UZH/L1hiuj6Z+QAVB+HoyU+j
	 ebH/iDqOIZdwQ==
Date: Mon, 29 Sep 2025 13:25:12 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Borislav Petkov <bp@alien8.de>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Tool directory build problem..
Message-ID: <20250929182512.GA1394437@ax162>
References: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYcmBXuE8OMoDF6vGwk9n_2XdwWbuh-5b0w0g7w-NK=g@mail.gmail.com>

Hi Linus,

On Sat, Sep 27, 2025 at 11:23:22AM -0700, Linus Torvalds wrote:
> It doesn't work for that pfrut tool because the top-level Makefile
> rule does this:
> 
>     $(Q)$(MAKE) LDFLAGS= O=$(abspath $(objtree)) subdir=tools -C
> $(srctree)/tools/ $*
> 
> and that "LDFLAGS=" is an overriding variable assignment, so the use of
> 
>     LDFLAGS += -luuid
> 
> in tools/power/acpi/tools/pfrut/Makefile end sup not working.
> 
> But it works in all other situations, just not when build this way
> from the top. Annoying.
> 
> I'm not sure *why* the top-level Makefile does that "LDFLAGS="
> override thing. It doesn't do it for anything else. Just that LDFLAGS
> variable.
> 
> Yes, yes, the ACPI tool makefile could then use
> 
>     override LDFLAGS += -luuid
> 
> but why would it do something as crazy as that?
> 
> That "LDFLAGS=" override goes back many many years,  In fact, it goes
> back to the very initial addition of those rules in commit
> ea01fa9f63ae ("tools: Connect to the kernel build system").
> 
> So I have no idea why it exists. Just removing the "LDFLAGS=" override
> seems to fix everything for me, but I must be missing something.

It looks like prior to commit d503ac531a52 ("kbuild: rename LDFLAGS to
KBUILD_LDFLAGS") in 4.19, LDFLAGS was used throughout Kbuild so I
suspect that LDFLAGS= was there to avoid poluting the tools build with
the flags from the main kernel build. Given the rename, it seems like
you should be able to remove LDFLAGS= from the tools target without any
problems.

I generally agree with Masahiro's prior comments around the tools/ build
system (especially hooking into it for the main kernel build) but I do
not see a good reason to break the tools/% target patterns if they are
not overly broken or hard to maintain :)

Cheers,
Nathan

