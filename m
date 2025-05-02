Return-Path: <linux-kbuild+bounces-6851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936CAA67D1
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 02:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B143ADA78
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 00:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEB4DDA9;
	Fri,  2 May 2025 00:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TmxrxU1a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BAC2E0;
	Fri,  2 May 2025 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746145721; cv=none; b=Oy/XBz/BAraRGYOpjTUf5jayKZjeE+3pWyBvLANeQVjVnF1zkIwu/wnv/xw1ZW6ZKNVLNhKLs+rAYlrTDUDib+kSS50JlMXhuseKbBbSiOP45T7TtFcBYWy/dR/Er7hSc41i63DvJm1tmTGhYQIfpe3RraG8UDIlVyjyXypm9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746145721; c=relaxed/simple;
	bh=41F5qJAqo1GXXVxnrBrRIl0INyJpmHJaX3Q0ndGq7XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlJep3ydfBdqhnv68KKnf+8k4Fos7gWvrgjyvxJp2JtADOZEcB198prfCDVprbiOub0zHopbETWFTb5jAyQPJIlfXyiT/qwX4asfk5RRX9RWfmlV9YBpM1WwYuJyErX4WnUOfVeydxZVoPmPq+BYT1ipUygluAurq4Ky3C6Swzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=TmxrxU1a; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=owuCWq2JyFGAqOe0Re/Y9wDqtd94HJni5eLJSVYkbZI=; b=TmxrxU1aWxRu6SZbwXmp2SD+hH
	aQzcSmsT5C9R1NqX/CCWo38Mih6N87k7zUh/xMgapkMfwh1oHdkHeoPcdk44o0DEzF3l5U+vqIdDD
	il6CgWKsIIwWj2dGBKuUtMBX8MJvcNthkZnvPqygWjdE8/QFeBuaE6W5gU1h6Bg34CHWMS6QD1Bhk
	Q/zgQTYrL20SY4WkHbchtUxND3WatsYV7NanO/HObbZ01uOZZt8UmSOyK5ondJL/VWi03f3mz4NYx
	ZeLha92WgSQkhRCA+BJGiIFGao0M07nWCXA9CI7SUYrDgWy3O7yZhUyXTmGogMyf/E7OBAVpu8BEd
	j+rYGfTg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeGZ-0000000EaLn-0Gl5;
	Fri, 02 May 2025 00:28:35 +0000
Date: Fri, 2 May 2025 01:28:35 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <20250502002835.GT2023217@ZenIV>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, May 01, 2025 at 04:28:25PM -0700, Linus Torvalds wrote:
> On Thu, 1 May 2025 at 16:00, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > +({     type __dummy = {}; \
> > +       typeof(x) __dummy2 = {}; \
> 
> I'm actually surprised that this doesn't cause warnings in itself.
> 
> The types in question are not necessarily compound types, and can be
> simple types like 'int'.
> 
> The fact that you can write
> 
>        int x = {};
> 
> without the compiler screaming bloody murder about that insanity blows
> my mind, but it does seem to be valid C (*).
> 
> How long has that been valid? Because this is certainly new to the
> kernel, and sparse does complain about this initializer.
> 
> So honestly, this will just cause endless sparse warnings instead. I
> think disabling this warning for now is likely the right thing to do.
> 
>                 Linus
> 
> (*) Yes, the empty initializer is new in C23, but we've used that in
> the kernel for non-scalar objects for a long time.

For scalars it had been flat-out invalid all along - doesn't even
need -Wpedantic for gcc to reject that.  I hadn't checked C23, but
older variants all fail on that.

We can force sparse to accept that thing, but I rather wonder if it's
a good idea.  Both gcc 12 and clang 14 give hard error with -std=gnu11;
do we really want to bump the minimal versions that much?

