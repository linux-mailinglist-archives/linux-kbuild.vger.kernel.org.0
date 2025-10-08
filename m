Return-Path: <linux-kbuild+bounces-9057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A523BC7501
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 05:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B64D4E2BDC
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 03:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D519923BCFD;
	Thu,  9 Oct 2025 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhel5p+x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2EA7261A;
	Thu,  9 Oct 2025 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759981481; cv=none; b=uU9Kk3f3tvUjmeFbYwepqtZTYE+e2TCGBksXN/26EIrlPYwzChfVR7udEzTOFqomLCkgifGZzjEL5l8bYNNTTiGNSq3w95pDkqO57MLq0aj0XN2747Irg0kOyJ1Fu5nRXJJtH2mwOH4QKB1EOYdIYnDm6JudcY1On5/AXQLSeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759981481; c=relaxed/simple;
	bh=HgZ6zzODSIrnwYu4EFvmHmU5frccBU91n5zHjRH6eLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmlR9NlZXnmqmmvXi3kAH+M9AfF2nW4NFtDL1UDRajehK8FhEOjtA+PWcQ0uYspqcgyfynMWB8RpP7Vp4EM3NG9TqJztPUumErHqZf/mxWXY/ZEASEOtaFBFWiQs38gtWQVJGJjhNskqwT/NYhXn3MVIBRTU7JwUT/LHdWtCRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhel5p+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A3C4CEF7;
	Thu,  9 Oct 2025 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759981481;
	bh=HgZ6zzODSIrnwYu4EFvmHmU5frccBU91n5zHjRH6eLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhel5p+xgZqT6vVr9iDk76AVP40koVTBJgYUwqGQ+Kwu1zliVkCE0GrT1U4tghBe+
	 LAbFO3SN4FH75GvSkRhDnIXsQFRN7ZI/ytIRHmXK61ktqmyq470ecxJ8Vkd6o7o4JE
	 Z7poXaPntiXmiaSm7hLUGgWxbZB0oD47+GUbKPVgvYfVHpBF/D+SXp7aRV7fSazNm1
	 ssp/I05Uw3QINvDrQM/Vcg+SaU+zz6UrDRiHxotOlE4k13SV5/FYoq0tUxJljOKQvZ
	 p5U9Oc4VY9iFpGG2eZiqeOa5T/Oae+gzScewOiVEugLQE43vaLJUx2WwHE/RdPmQfE
	 GTirY0rL5I8tA==
Date: Wed, 8 Oct 2025 21:52:02 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] kbuild: uapi: upgrade check_sizetypes() warning
 to error
Message-ID: <aObA4vNF4tppZ5vR@levanger>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
 <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
 <20251006190048.GA2395186@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006190048.GA2395186@ax162>

On Mon, Oct 06, 2025 at 12:00:48PM -0700, Nathan Chancellor wrote:
> On Wed, Aug 13, 2025 at 08:16:59AM +0200, Thomas Weiﬂschuh wrote:
> > No problematic type usages exist anymore.
> > 
> > Make sure it stays this way.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > ---
> >  usr/include/headers_check.pl | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> > index 36307a137cc1e109e3e1c253f66f3e5935499fc8..36349b21cef5d55241b68ca24dabe6a321b7ce27 100755
> > --- a/usr/include/headers_check.pl
> > +++ b/usr/include/headers_check.pl
> > @@ -159,7 +159,6 @@ sub check_sizetypes
> >  		              "found __[us]{8,16,32,64} type " .
> >  		              "without #include <linux/types.h>\n";
> >  		$linux_types = 2;
> > -		# Warn until headers are all fixed
> > -		#$ret = 1;
> > +		$ret = 1;
> >  	}
> >  }
> > 
> > -- 
> > 2.50.1
> > 
> 
> Geert's regression report and subsequent fix made me look a little
> closer at this check. Is it even useful to do this anymore now that we
> compile test the headers? If these types are found without the
> appropriate include, won't there just be an error? Or is this to avoid
> the case where a system header may transitively include types.h so the
> compile would succeed but the header is not as contained as it could be?

Good question.  I think you're right, that header compiling should be
enough.

I cannot think of a sensible way that with successful header compile
test for an UAPI header file that is not contained. 

Setting USERCFLAGS='-include something/like/types.h' during header
compilation may hide a missing '#include <linux/types.h>', but I don't
think that this is a good reason to keep the checking.

Kind regards,
Nicolas

