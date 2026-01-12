Return-Path: <linux-kbuild+bounces-10533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2811D1574E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 22:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5519303E412
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 21:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2477D343D6F;
	Mon, 12 Jan 2026 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oWL6Z7f+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7435A314A7F;
	Mon, 12 Jan 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253832; cv=none; b=jwiYHjCxadWctACLMac7LZozwvdJcxZ6NuJdpiGqBdXk9Yx9BeErC34OwsRp/Tcq6z1fV4odOcFJC/kB4BzodaTlYz/s2S3Ao3MmUEIZ9/pIFGlCnuerNG6nhEEyGDDSQZmEPTuqe42uvkMdKgGRaZeraP0EbFUTAUSkwR32kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253832; c=relaxed/simple;
	bh=hRFWcaipyLONtRXyHxft03VAoFh756m7VR33q0xfuhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuohQvjvOlR3lyQpwd6+Sd+9LosWWAMe5HvvtQycle6QF89RmJYbDxwV+664oJNDCSzjkaPDHEAcc0yIzmmUKf27dpovnEtHAHVCbFJz2WtmOaAwIYVstvWydM7pWXPeNJiUgAyqfkfFsHSjajAzgmbRR/G3lFUz9gEOGpAQF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oWL6Z7f+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768253828;
	bh=hRFWcaipyLONtRXyHxft03VAoFh756m7VR33q0xfuhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWL6Z7f+4jHLgJ56uYgGAJhkJcyc1pgHI2iMhqzpbP2gsS9K3XB22RMzAda9NPtWs
	 xRH6zn/r3TofeiDRyg4sXpRM+PnzTSHbSOXYj2Taf1IxLZnWtzeiejRXJIx61tMOwL
	 7O2FNq583n/I7qZtqQPF3e5tclRqzHRah0NC2CXE=
Date: Mon, 12 Jan 2026 22:37:08 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: WangYuli <wangyuli@aosc.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Reject unexpected values for LLVM=
Message-ID: <06011271-65b0-4992-8d6b-8946c1c9d287@t-8ch.de>
References: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
 <d43c85d0-4d84-44df-a436-09fca7a11b07@aosc.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43c85d0-4d84-44df-a436-09fca7a11b07@aosc.io>

On 2026-01-12 14:58:08+0800, WangYuli wrote:
> Hi Thomas Weißschuh,
> 
> On 2026/1/12 14:43, Thomas Weißschuh wrote:
> 
> > The LLVM argument is documented to accept one of three forms:
> > * a literal '1' to use the default 'clang',
> > * a toolchain prefix path, ending in a trailing '/',
> > * a version suffix.
> > 
> > All other values are silently treated as '1'. If for example
> > the user accidentally forgets the trailing '/' of a toolchain prefix,
> > kbuild will unexpectedly and silently fall back to the system toolchain.
> > 
> > Instead report an error if the user specified an invalid value for LLVM.
> > 
> "Falling back to the system toolchain" may be an acceptable behavior; I
> think reporting a warning here rather than an error would be more
> appropriate.

For which value of 'LLVM' would a silent fallback be the thing to do?


Thomas

