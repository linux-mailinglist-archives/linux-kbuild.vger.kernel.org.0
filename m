Return-Path: <linux-kbuild+bounces-5135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E31599F1B81
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 01:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B80E1620B6
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 00:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4618BDF78;
	Sat, 14 Dec 2024 00:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7WVQ5xl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE18DF49;
	Sat, 14 Dec 2024 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137546; cv=none; b=biyMFxEWMewnzyAkPwAA2YroyIXucLCX1b1PzxCOi0VLvQxR78e5IFLBjYXnzYUh+ObZFJMRS4fgTNJVXJPfD8D2CG6NOG/Mp3nCaoqSClAs6R8HEnhz5IsxJ8p0zABXdH61Cok/3wXUI8LD9GcTzaDj1IjpsqD7TtHPuLNlbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137546; c=relaxed/simple;
	bh=+W4g2GLr3RRiyQamv62PIQrgXrlaNPxv9TTQuxY8cNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCP+zK1McJfMKniQpAD8iIQTkJvoyLY3U0WZ48nHNo7Yu52KfMgs2es8dbSKrL3Kr4dC9rk0gD8Fk1uMBE7sLuCT89eodnM6kpnte9ITfYNbJvgBM51/R5W115coyvN1zQjIllHp51m4AqqvoOXnqCzBsFhiT3eQwwlTLJQIgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7WVQ5xl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A63CC4CED0;
	Sat, 14 Dec 2024 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734137545;
	bh=+W4g2GLr3RRiyQamv62PIQrgXrlaNPxv9TTQuxY8cNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7WVQ5xlFplBESsEZw2EVTOURhz6zWrDUEOuEszXi8TTg0+XA8sag13DVQbHUBn8u
	 5mlA120CZQM95CS2nzTszpgMmlj41h3XjNXkN1QSz0RU5oBv30YClwX90q6G254sQE
	 ZShq5XbWkWD7V4+Tj8A4WYCz3vF5S1NS2lzd+wZErdfy+IyG2SI9PkJ4V5W/x7gKPv
	 KAuE7MC/6r/afcD+7WrJgw3FQ069Fds7r94PozNMwe2n76eXNuEf8c8Z/tLUcqHibZ
	 xUn0wJTNDz8kTiLdX4+AAuDT2MV+Yx8rK+V6nBspptxN/onZ+lUqYppOphAaN7A0FD
	 bH4PnrnGMfa+g==
Date: Fri, 13 Dec 2024 16:52:23 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: Add option to fail build on vmlinux objtool
 issues
Message-ID: <20241214005223.f2fansikbwovm3oo@jpoimboe>
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
 <20241213-objtool-strict-v1-2-fd388f9d971f@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-objtool-strict-v1-2-fd388f9d971f@google.com>

On Fri, Dec 13, 2024 at 11:31:31AM +0000, Brendan Jackman wrote:
> NOINSTR_VALIDATION is pretty helpful for detecting bugs, I would like
> my build to fail when those bugs arise.
> 
> If we wanted to we could enable this for individual warnings, it seems
> unlikely there's a use-case for that though. So for now I've just added
> a global setting for vmlinux.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Note that *any* objtool warning has a good change of being a major bug
in the kernel or compiler which could result in crashing the kernel or
breaking the livepatch consistency model.  So the option shouldn't be
restricted to noinstr builds only.  In which case it should be called
CONFIG_OBJTOOL_WERROR, analagous to CONFIG_WERROR.

We definitely need this, though it will likely break a lot of robot
builds, so it wouldn't be a good idea to merge it until after the
holidays.  Though once the patches are ready I could throw it on a git
branch to see how bad the robot breakage is.

-- 
Josh

