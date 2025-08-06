Return-Path: <linux-kbuild+bounces-8307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BDBB1CC46
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 21:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A399C5627FF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 19:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC2D28DEE1;
	Wed,  6 Aug 2025 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLd3kwWm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC761A76B1;
	Wed,  6 Aug 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507133; cv=none; b=C2hhpPqr+uzkcch/rf6DA8VLYNdtYxuLhMvKLvq2R0M2v1h4qRUIFQb16sNszctxQg1MVNof+coPuHRUQmUkotJJVkw/QKk9HYbC1q/6s1EBoP8lBl8/PaobPQxX9+/TZoo+s3RLftmhuAypK/TG9oE1puJaqXu0EWznpqPeu/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507133; c=relaxed/simple;
	bh=F/oYw1LzqhlgKXSO+DPY4BkW2P7FM7aPglYNuefA9II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEpIs172Nnkw0KZaWla49C0VtWfjhcWlfxK/JWJc86I9Ct4fA2D+rqEOPECjkBkHiENw8qXOgh4UvQEOl/WAcfA6zpdq+A/z3ER5TsXCQEdEo4Zy1mZKsWqtAeuut9K/U7CCJi8796oSGorPgIIhWnIEDuKFAEn510moJWK6A0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLd3kwWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C82C4CEE7;
	Wed,  6 Aug 2025 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754507132;
	bh=F/oYw1LzqhlgKXSO+DPY4BkW2P7FM7aPglYNuefA9II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLd3kwWmlJ0WrvYyw/X3XEbltBnk584slRuhOAd6SmgVhC++Mecc7jJo3LsSPBO4d
	 4KCB1/nDs80DSEP/IAX6vWGUwYCSl0IKGiWcVphn1SmKhggUyGkup8KmPuwNOQHTJP
	 glC4WF5EUGXIm+pBWJLydCLtkaDKdmi6lOn9wjuce5GhwYEUcIRB0+wd4qqbwmQtu5
	 lJ68s4Raweh+V/s803rvf/c5/C/LoueDxpidKue4mrdWD+MJD21kJCRiSQczpkDCnc
	 sxxCKVTVZTKazPZU6rWGLEv967spIHT+HDeauZovDScaoWFZGy/sMILfFdqYE2yNdl
	 B70Y3dO9ERdGw==
Date: Wed, 6 Aug 2025 12:05:32 -0700
From: Kees Cook <kees@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <202508061158.49E749B46@keescook>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
 <20250805214823.GB200407@ax162>
 <546c9819-20e7-4474-9281-5d1567263637@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546c9819-20e7-4474-9281-5d1567263637@intel.com>

On Wed, Aug 06, 2025 at 05:29:55PM +0200, Alexander Lobakin wrote:
> From: Nathan Chancellor <nathan@kernel.org>

Thank you for the fixes Nathan! I'll dig through these and get them sent
out before I try to land this patch again -- "But COMPILE_TEST is never
wrong!" ;)

> > [...]
> > descriptions expected to be stable once they are released or are we able
> 
> Ethtool private stats are not "ABI" at all. Moreover, if they result in
> incorrect code, this needs to be fixed no matter if someone already
> wrote scripts dependent on these names or not.

Internally there isn't an ABI, but the userspace interface effectively has
an ABI: the strings are fixed-size and NUL-padded but not NUL-terminated.

> > to adjust them? We could maybe shave an 'o' from 'unknown' to easily
> > resolve this without losing much in the way of quick visual processing.
> 
> I've no idea why it's popular to define Ethtool stats names in drivers
> using a fixed array of ETH_GSTRING_LEN and then do memcpy().

The above is why: they are fixed-size, non-NUL-terminated strings, so
many drivers use this memcpy pattern. But not all.

> I've been always using just `const char * const[]` + strscpy() (then
> switched the latter to ethtool_puts()/ethtool_sprintf() -- we even have
> special helpers for that). In case some name goes past ETH_GSTRING_LEN,
> it would just be truncated, but always have \0 at the end.

Unfortunately this is not true: not all sources are NUL terminated.

> Plus most of the names are shorter than 32, so defining such arrays of
> 32 just wastes space in .rodata.

That IS true, but many drivers just keep giant blocks of data they can
memcpy. :(

Regardless, I will double-check this and see what needs to happen here.
I've fixed a lot of these already[1].

-Kees

[1] https://lore.kernel.org/lkml/20250416010210.work.904-kees@kernel.org/

-- 
Kees Cook

