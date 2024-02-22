Return-Path: <linux-kbuild+bounces-1043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350C85FDD8
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 17:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B92FB29948
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 16:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49D5153BC6;
	Thu, 22 Feb 2024 16:12:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05E15099C
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2024 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708618323; cv=none; b=Ky0loTnDe1XK5NCHcmW+reMn8x9uxmAKH7/aSQMczb3EMwer9FragQ5p0d0M2VymAcDGRHhfCuBmLVFZRdPfOYVy+mSrWLcaOYHeAOD2XCT3fzflBP1uDF774W1g+wPxx1gVZ60/4V0oUqAWsShdlpnKxiF8kmVWq0eFdd9TKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708618323; c=relaxed/simple;
	bh=5XwAavuEo1rmhtPDGAKfZA7UBr47djaM7C3fsnRGip4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3grnpt+2WTHsepVJzEOCDNfmSZWTWM/zIPOSjJYCfDivFGPXOQnC7sdXPZSoJ8zy4pLM/vHwsa9SNtSCw9l6ikPsxs0CutnuOPylmxCglJGBs5cgjWextc79eHG2z2P5DM7sF/mU0MYK2sX0uDcCRtllJsgFWlkhTqiL4LVSqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 41MGBcL1046981
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 22 Feb 2024 11:11:44 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 41MGBbRb046980;
	Thu, 22 Feb 2024 08:11:37 -0800 (PST)
	(envelope-from ehem)
Date: Thu, 22 Feb 2024 08:11:36 -0800
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Adding trailing slash to $(srctree)
Message-ID: <ZddyOOczOuPQU0d0@mattapan.m5p.com>
References: <cover.1708478591.git.ehem+linux@m5p.com>
 <CAK7LNARcv=iYRb_Qoq=tB3avbjQLpye9bCeqjmJUn6OyP6bZkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARcv=iYRb_Qoq=tB3avbjQLpye9bCeqjmJUn6OyP6bZkg@mail.gmail.com>

On Thu, Feb 22, 2024 at 01:38:36PM +0900, Masahiro Yamada wrote:
> On Thu, Feb 22, 2024 at 8:16 AM Elliott Mitchell <ehem+linux@m5p.com> wrote:
> >
> > The subject states exactly what I'm suggesting.
> >
> > The reason is the fallback value for $(srctree) of "." doesn't work
> > properly in several places under some conditions.  In particular in
> > several places a pattern of "$(srctree)/$(src)" is used.  If $(srctree)
> > ends up with the value "." and $(src) ends up with the value `pwd`, the
> > build breaks.  This can be triggered via in-tree/out-of-tree build
> > mechanisms.
> 
> 
> I really do not understand what you are trying to achieve,
> but this is just about
> "Do not try to build upstream drivers with M=".
> 
> 
> If you hack it, it is what you should do locally.

I think it is acceptable to state this usage of the build system is
unsupported.  This is not an acceptable reason to reject proposed
patches.

While this use of M= might be considered a hack, adjusting $(srctree) to
include the trailing slash is entirely appropriate.  Everything which
worked before still works and more situations now work.  This also
slightly shrinks the Makefiles.

Notice 306 Makefiles (excluding the top-level) reference $(srctree).  Of
those 26 include the construct which appears to be working around this
problem.  So 8.5% of Makefiles work around this problem, which seems a
pretty good hint the feature is desired.

This doesn't account for Makefiles which had such during development, but
was removed before submission.  This also doesn't account for ones which
had it removed after being brought into the Linux source tree.  The
differences between implementations suggest it might have been
independently implemented as many as 3-4 times.

That seems a good hint this is desired by a notable percentage of
developers.


In other news, examination of tools/testing/selftests/nolibc/Makefile
suggests $(objtree) needs similar treatment.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



