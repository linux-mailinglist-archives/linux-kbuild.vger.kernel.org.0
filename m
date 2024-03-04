Return-Path: <linux-kbuild+bounces-1153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C1870ACE
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 20:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285E71F22C1D
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 19:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DF94D599;
	Mon,  4 Mar 2024 19:36:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CF4653A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 19:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709581012; cv=none; b=cng4ElWonhUulszbTyHetr5ePMYslzqkc2hIMOmAdtxibiFLByFZKo75d5DnQR/EFyrmiaFS1NU3mQE1TIaOFQEj9CzXrGIUy4eSxLphZ2StM3DrlU+6cnpKhMYGPoHWD3vuKnLs3ycwjdGytojrKsi27G4CuujKYmEfOxnxglM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709581012; c=relaxed/simple;
	bh=/3jDrbr0BOd7Tr99v28GlXd07pwmjRKkCXUxX/XwTBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vct6yltx77TymhKm2AkTaP0L5VdjlL3uc2J4ycY9DRKYmxbF0ReCo1HVwyFJVGGxZUj5+JozVKfWYkjzt6Ww/XB1oUehtJ5vp9zdfyDqAW+KZviWdeoBos1Q1bWzTYL79EPMmJYh4dUZ5XT0xIJdepj0tvnwAVZrv/oLGwYyJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 424JaSlm025906
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 4 Mar 2024 14:36:33 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 424JaRoh025905;
	Mon, 4 Mar 2024 11:36:27 -0800 (PST)
	(envelope-from ehem)
Date: Mon, 4 Mar 2024 11:36:27 -0800
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
Message-ID: <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>

On Mon, Mar 04, 2024 at 10:57:18AM +0100, Nicolas Schier wrote:
> 
> can you please describe a concrete problem you want to solve with your
> patch set?  Masahiro already asked in [1], and I still don't get your
> motivation while reading your cover letter.  It would be helpful to see
> your goal when looking at your patches.

I'm trying to develop an alternative kernel build system for one Linux
distribution.  Due to how other pieces of the distribution work it seems
using the out-of-tree build mechanism to build in-tree modules may be a
better approach.  This may be abusing the current build system, but if it
works without breaking anything else that should be acceptable.

The problem I've run into is due to the mechanisms of the build system,
the variable $(srctree) gets the value "." while $(src) got the value of
$(CURDIR).

At which point various places which use $(srctree)/$(src) ended up with
the value ./`pwd` and that doesn't work.  Almost all uses of $(srctree)
had it followed with a slash, so if $(srctree) includes the trailing
slash, $(srctree)$(src) ends up the correct value.

This may be outside the envelope of what is supportted, but if it works
without breaking anything it really should be okay.


> Also, I cannot see the problem with commit 16671c1e1cac2 that you
> mentioned.  If a subtree does not want to inherit some variables, but
> re-use the same names, it seems quite legitimate to me to reset those
> variables before use.

Take a quick glance at patch #27.  Basically every Makefile inside tools/
sets $(srctree) to the equivalent of $(abs_srctree).  This suggests
16671c1e1cac2 was working around an issue for tools/perf, but instead
the issue effects most of the Makefiles.  I'm left suspecting the issue
was later fixed for tools/perf and 16671c1e1cac2 was a mistake.

I suspect at this point removing the lines at the top of tools/Makefile
added by 16671c1e1cac2 and removing all those duplications would work
better.  All I'm certain of is the present situation it doesn't look
right.

Another option is dropping the last 4 looks viable.  Due to ending up
with absolute paths, their values of $({src|obj}tree) are likely
non-problematic for me.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



