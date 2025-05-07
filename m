Return-Path: <linux-kbuild+bounces-6995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12CAADEB6
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3EA4986876
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D858A202C2D;
	Wed,  7 May 2025 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xjwuKz9r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF825E81C
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619869; cv=none; b=cdnGTKc8xjNODwOLe/4+xrpxtSj3jjTNybvMG5+/Qo+kLXPi56GJPXMOM7u2Dg9s/v2mYN80giyPVUnMk914r7dfs0wvPAtgDPnpNmoQ34uhTJxtq/QErpOrmH8eFQF6YYpmgMPHjMh4+U2XSNmxWtPoH3GlfQriCnbLamQyVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619869; c=relaxed/simple;
	bh=ZwMl1jmbgmzYrhfYTpZjT1qj6wac4wSVs91SQ8cjA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn2FLulWrvGzuWYUtm7tTyK2e2/nnGwQrIQ8Qx1YMDDSOuqkxLa+C5i14e3ddPI/xS9aC/iPOSB+xqE+oc8qVYNslDnt5f+NPCt0Zh22J2V8G4vNRDpR1IWk+DGD2HijudHJj7piDkvp/lEkz8ncsJLjLTS6KSqoQYmSUDJlVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xjwuKz9r; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 7 May 2025 14:10:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746619865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U24XQpAOzVn9OeiX2WXRKmdViNITlRLJUufl1hqU+7o=;
	b=xjwuKz9rinwdzzhVqNnlMxNciaX3Kc9S07w8Xu5j+TKTlQIE0EraBQvW7SyAW8/aCP3oXO
	xK+q07svcAmdGlOvay907f7wIinAGGMa1CNKwofQ7NxQTMSCDSjiqxm1g6ggK77CRwa3bs
	lbQUUB3zYjo18Ben9b+GtAGrwB6IYuo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] gcc-plugins: Force full rebuild when plugins
 change
Message-ID: <20250507-overjoyed-coucal-from-betelgeuse-4eaa7b@l-nschier-aarch64>
References: <20250503184001.make.594-kees@kernel.org>
 <20250503184623.2572355-1-kees@kernel.org>
 <20250507-emerald-lyrebird-of-advertising-e86beb@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507-emerald-lyrebird-of-advertising-e86beb@l-nschier-aarch64>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Wed, 07 May 2025, Nicolas Schier wrote:

> On Sat, 03 May 2025, Kees Cook wrote:
> 
> > There was no dependency between the plugins changing and the rest of the
> > kernel being built. This could cause strange behaviors as instrumentation
> > could vary between targets depending on when they were built.
> > 
> > Generate a new header file, gcc-plugins.h, any time the GCC plugins
> > change. Include the header file in compiler-version.h when its associated
> > feature name, GCC_PLUGINS, is defined. This will be picked up by fixdep
> > and force rebuilds where needed.
> > 
> > Add a generic "touch" kbuild command, which will be used again in
> > a following patch. Add a "normalize_path" string helper to make the
> > "TOUCH" output less ugly.
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nicolas Schier <nicolas.schier@linux.dev>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: <linux-hardening@vger.kernel.org>
> > Cc: <linux-kbuild@vger.kernel.org>
> > ---
> >  include/linux/compiler-version.h |  4 ++++
> >  scripts/Makefile.gcc-plugins     |  2 +-
> >  scripts/Makefile.lib             | 18 ++++++++++++++++++
> >  scripts/gcc-plugins/Makefile     |  4 ++++
> >  4 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
> > index 573fa85b6c0c..74ea11563ce3 100644
> > --- a/include/linux/compiler-version.h
> > +++ b/include/linux/compiler-version.h
> > @@ -12,3 +12,7 @@
> >   * and add dependency on include/config/CC_VERSION_TEXT, which is touched
> >   * by Kconfig when the version string from the compiler changes.
> >   */
> > +
> > +#ifdef GCC_PLUGINS
> 
> Out of curiousity:  Why can't we use CONFIG_GCC_PLUGINS here?

... because compiler-version.h is included before kconfig.h (which 
includes autoconf.h).  Sorry for the noise.


