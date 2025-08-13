Return-Path: <linux-kbuild+bounces-8423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57521B240CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25E59165CCB
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204392BEFE0;
	Wed, 13 Aug 2025 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaueS57j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD722BDC3E;
	Wed, 13 Aug 2025 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064517; cv=none; b=foCh3fqmefPICBGofgYcH4GV9Fsi5RRT55GNWVo0llDXPHm1iey5GCb6oMWtvpDntt9FitSlmzSmAusV843AxL32uC5UdXwiveM2gwYrNPZ5htaRGf8500qAxxGQucOkEI4dSIAILewpDTZRSvw8Vku21pEBrBqk4daDO/yEM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064517; c=relaxed/simple;
	bh=HtfMSsPJkDgz1KqT+XgIf+Dum6qmrWtFBLSUEmMMyvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWXNdFSzOycSHiSoDZD2vXqMtOSbuqejS9I0q35guisJ1jHwNtjVfVmcBzITQCQff2mfuMVHmXbUindPeT7c7GHtv3mKc5cuQ7sdVgsg7A917N6XF8ecXgVKgn0BVokHR9R9k5PjL4NbuJIDrH48tIkNIWC4vEW8XE5xh0jhi6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaueS57j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29890C4CEEB;
	Wed, 13 Aug 2025 05:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755064515;
	bh=HtfMSsPJkDgz1KqT+XgIf+Dum6qmrWtFBLSUEmMMyvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaueS57jt9gBYMlZXfSaH8OfoeKOGB/j6OZ6zuBkC6PWueVEFSEWu9ibtxUwRA1o7
	 RxPpvqTT5/6LyL+zzEFQt6/PDPW8b36ljNmBWmP6DVKV94/y6Sg0+klMAKbHj74lQQ
	 YDk+zoC+G2uTw+WKZ5bb5gLzWtWdERW6ZkHuNF/Fi3VIohbv0MLQ+JcLGeDsQDG//T
	 4y2rMQeHmUOZjQ6H7hXQydAyDp4CUTdyxgdRk403rfc4OgT8alA5kcHnPa/JtXmdLg
	 wrL8Xl107ZapFERUz3Btx3fIm0ClgCZMWzY4DNjMI6MHzxIFY7Ic4AWb4A/On3D31Q
	 3HaB51uKs2DYg==
Date: Wed, 13 Aug 2025 07:46:29 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] kbuild: uapi: only update hdrtest output on success
Message-ID: <aJwmtfA4U1jOXljP@levanger>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
 <20250812-kbuild-hdrtest-fixes-v1-2-7ad2af66cd58@linutronix.de>
 <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARdhx+L6VeN2Q-gykcoWMY0MtoiNyhpY+Q9v_3tYA6o-w@mail.gmail.com>

On Wed, Aug 13, 2025 at 09:29:31AM +0900, Masahiro Yamada wrote:
> On Tue, Aug 12, 2025 at 2:33 PM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > If a header test fails, the output should not be updated.
> > Otherwise the next make invocation will not rerun the test.
> >
> > Also headers_check.pl should only run if the syntax check invocation
> > before succeeded.
> >
> > Add explicit sequencening.
> 
> Did you test this?
> 
> See scripts/Kbuild.include line 153
> 
> The macro 'cmd' has "set -e".
> 
> Any single error in a series of commands
> bails out.

Ah thanks!  Yes, for me it works correct w/o the patch.

I was struggling with this: If I apply this patch, make no more forwards
the error code if headers_check.pl exits with error.

It's actually a bit funny:

W/o this patch, we have a command sequence like:

    set -e; date ; false ; true; date

which bails out at false at stops processing subsequent commands.
Replacing the semicolons by '&&'

    set -e; date && false && true; date

will prevent 'true' to be run, but the trailing 'date' will still be
executed.

Kind regards,
Nicolas

