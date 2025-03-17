Return-Path: <linux-kbuild+bounces-6211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FFA65A97
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 18:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701C33AA752
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 17:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D1D19992D;
	Mon, 17 Mar 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqzM8AT6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81DA48;
	Mon, 17 Mar 2025 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231864; cv=none; b=N4H8HQ91Otsc1ObywTMt/xOSA0QyjSbpx8MNvgkXYrJrK2zLaFmm84B1+ASoGwU0UlYuYxp/iLHES+QjatlfKAkcETu2xx3jokkU3pA//jLPlYPnJ040x3bMz3irN3RVPwJWamBo+qlUpxucAzFctfn8BmdjRm1iGwtMqkYpBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231864; c=relaxed/simple;
	bh=PDbGY0+yFN/TsSCp60uaacAZ4qKJrbB58cB10UtXUP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4YgUM2u1mYvhT4o2q4IadIyAxcGWV0TS2bzBZKS8enHBhrYh/or1HGMU8bz7l/g474oNwIavNJpTn9nuvLJZaaESDFJ4CZbfZ3MdO4cRtM6u3aJDw+5ndb7sh94oNdabHW51ibYM8RVc1xp/r+piyrmKbu15zzztGQxYxMaE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqzM8AT6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A35C4CEE3;
	Mon, 17 Mar 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231863;
	bh=PDbGY0+yFN/TsSCp60uaacAZ4qKJrbB58cB10UtXUP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tqzM8AT67XBjrXKaasp8CMYr313yUBbNYq28nrcszv5BUM4VlzXgEz9cn6C3FrG5d
	 SDDbP8YNlXMfMGdoLbZLtGq8ay92h1xvuFzflCwKHoERgtVXyG5GuTAlChTGz4Y4iF
	 JbcJmdRozTGoVjUBd6pJORXkPgMw2yrmb0u92NvPXxiWc55Jpn01CwTeeqkxXYwQEV
	 Czp5V0qoFosyEEIsXS63/KYha+QMH73zY6fS/p1yOMHdWmlcrfAtJhOCc4eoy2TZm5
	 L3nUmirWdqchox+H9KKz/fNb1zNL5wPs2a5xIZbb3gf2rYh/LqfficP8o7u/4m1KV2
	 GzlvopMus0dmg==
Date: Mon, 17 Mar 2025 10:17:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
Message-ID: <20250317171738.GA950672@ax162>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
 <d250e864d6d81cc02e2599f710872f72d58a3c29.camel@decadent.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d250e864d6d81cc02e2599f710872f72d58a3c29.camel@decadent.org.uk>

On Sun, Mar 16, 2025 at 08:08:37PM +0100, Ben Hutchings wrote:
> On Sat, 2025-03-15 at 14:20 +0100, Thomas Weißschuh wrote:
> > -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> > Other references, for example in debug information, are not affected.
> > This makes handling of file references in the compiler outputs harder to
> > use and creates problems for reproducible builds.
> > 
> > Switch to -ffile-prefix map which affects all references.
> 
> This appears to cover all the C sources, but not quite all the assembly
> sources:
> 
> [...]
> 
> > --- a/arch/x86/boot/Makefile
> > +++ b/arch/x86/boot/Makefile
> > @@ -54,7 +54,7 @@ targets += cpustr.h
> >  
> >  KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
> >  KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
> > -KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> > +KBUILD_CFLAGS	+= $(call cc-option,-ffile-prefix-map=$(srctree)/=)
> [...]
> 
> I think this addition to KBUILD_CFLAGS needs to be done before the
> assignment to KBUILD_AFLAGS.

This probably belongs in KBUILD_CPPFLAGS then, similar to clang's
'--target' flag and other options that we always want invoked?

Cheers,
Nathan

