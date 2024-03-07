Return-Path: <linux-kbuild+bounces-1194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C44874506
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Mar 2024 01:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA651F25A4F
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Mar 2024 00:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B56437E;
	Thu,  7 Mar 2024 00:10:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85702360
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Mar 2024 00:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709770210; cv=none; b=qFeexp+P0lazDOn2U7Ni5+UjaEsU0nIwnnNIZrJ/jAIO44mMTKUIYlh3fBANEaRajxA726o2bvuZzhrfwmfO8xT+gN6JiLq+Xxlu4BJ1atrHVD+Z2dksgSgi2eDEhvZ5euePdmyNbT0p0pWu5D/Ywtm6wvIo2Eduib9U2a5p//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709770210; c=relaxed/simple;
	bh=vNnUy/WZ7nLTFm8Pw5v12EJ8SIGYQUhkcCfzxzRjBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SflLIgasToGTE6L7COMOIwukcAxLilNjt0OIoj94HY7atqwNpUEC8PrYLY/IDcURQ0AI2v6zfa9opx0fjQU3JVY6rn4VwGZDANiau4twLYo2XaaEvGIGalXM33sm51GNLk8Qe4FHD50X9R7hl0A/g+HslQP9K39FyleRoOY3D4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42709pjG037477
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 6 Mar 2024 19:09:56 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 42709oGH037476;
	Wed, 6 Mar 2024 16:09:50 -0800 (PST)
	(envelope-from ehem)
Date: Wed, 6 Mar 2024 16:09:50 -0800
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, nathan@kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
Message-ID: <ZekFzmXKKgHYZPcq@mattapan.m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
 <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>

On Wed, Mar 06, 2024 at 12:20:17AM +0900, Masahiro Yamada wrote:
> On Tue, Mar 5, 2024 at 4:36 AM Elliott Mitchell <ehem+linux@m5p.com> wrote:
> >
> > On Mon, Mar 04, 2024 at 10:57:18AM +0100, Nicolas Schier wrote:
> > >
> > > can you please describe a concrete problem you want to solve with your
> > > patch set?  Masahiro already asked in [1], and I still don't get your
> > > motivation while reading your cover letter.  It would be helpful to see
> > > your goal when looking at your patches.
> >
> > I'm trying to develop an alternative kernel build system for one Linux
> > distribution.  Due to how other pieces of the distribution work it seems
> > using the out-of-tree build mechanism to build in-tree modules may be a
> > better approach.  This may be abusing the current build system, but if it
> > works without breaking anything else that should be acceptable.
> >
> > The problem I've run into is due to the mechanisms of the build system,
> > the variable $(srctree) gets the value "." while $(src) got the value of
> > $(CURDIR).
> >
> > At which point various places which use $(srctree)/$(src) ended up with
> > the value ./`pwd` and that doesn't work.  Almost all uses of $(srctree)
> > had it followed with a slash, so if $(srctree) includes the trailing
> > slash, $(srctree)$(src) ends up the correct value.
> >
> > This may be outside the envelope of what is supportted, but if it works
> > without breaking anything it really should be okay.

> I see no good reason to do this change.
> 
> I will not take this series.

Could I get you to provide further detail as to why you consider my
reasons inadaquate?

The distribution is well-known.  I believe in-tree and out-of-tree build
mechanisms being as possible to each other is a Good Thing.

I guess I should also note, in the past (890676c65d699, 9da0763bdd825,
likely others) nicer build output has been sufficient justification for
changes.  An effect of the series is a leading "./" will disappear from
many files in full build output.  As such this also matches that reason.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



