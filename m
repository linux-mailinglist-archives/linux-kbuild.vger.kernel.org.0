Return-Path: <linux-kbuild+bounces-1215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6C878BD7
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Mar 2024 01:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E938D1C20B03
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Mar 2024 00:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D721396;
	Tue, 12 Mar 2024 00:16:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348A7EC3
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2024 00:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710202568; cv=none; b=T2RmNtOc7k4yaObBV7GaA197DXJanx+2/p9Z+mzprtbAHksU41tev10LYy5tLW4uCn572a8Ssz0KXi/Otyr1laOl4ra/PiKZbrjw6od39puE2iZa6eOsW21G8CdIRWWHgVrLTBSdibaX4FepEJe9HTx3sKS+wDBB27R1AcGMWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710202568; c=relaxed/simple;
	bh=g2UGS1Ye/6i+Znz+JBxp0ASHTOwQzqFQwG0+8M3NqC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgPpGvdyYMaOSW6G/0nVY8qdNWj6gdgKkNfL+TSi3R0mejuz66Up7PzQrb3zZmFPg+Fb+yX6TrYdhfLVThoba3JSjrThgAE7P99eiQRtV8xJ6nmT0Cr4VsdyWVNbk+Yh7oR/e8te8mLVXjowGvaK5S/B9UYr0zYzKBqDAymUFrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42C0FS1x072609
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 20:15:34 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 42C0FQ1C072608;
	Mon, 11 Mar 2024 17:15:26 -0700 (PDT)
	(envelope-from ehem)
Date: Mon, 11 Mar 2024 17:15:26 -0700
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, nathan@kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
Message-ID: <Ze+ensR/W0aesLPN@mattapan.m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
 <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
 <ZekFzmXKKgHYZPcq@mattapan.m5p.com>
 <CAK7LNATKE9wYpmxsWLmF++yQsKAN2dKSxta+O8x6UhWhRCkTCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATKE9wYpmxsWLmF++yQsKAN2dKSxta+O8x6UhWhRCkTCQ@mail.gmail.com>

On Sun, Mar 10, 2024 at 10:07:14PM +0900, Masahiro Yamada wrote:
> On Thu, Mar 7, 2024 at 9:10 AM Elliott Mitchell <ehem+linux@m5p.com> wrote:
> >
> > On Wed, Mar 06, 2024 at 12:20:17AM +0900, Masahiro Yamada wrote:
> >
> > > I see no good reason to do this change.
> > >
> > > I will not take this series.
> >
> > Could I get you to provide further detail as to why you consider my
> > reasons inadaquate?
> >
> > The distribution is well-known.  I believe in-tree and out-of-tree build
> > mechanisms being as possible to each other is a Good Thing.
> >
> > I guess I should also note, in the past (890676c65d699, 9da0763bdd825,
> > likely others) nicer build output has been sufficient justification for
> > changes.  An effect of the series is a leading "./" will disappear from
> > many files in full build output.  As such this also matches that reason.
> 
> It is ideal to in-tree and out-of-tree build mechanisms
> look symmetrical (and perhaps could be achieved in a
> different way), but your approach is not the direction
> I want to go.

I'm glad we're in agreement with the former.  Do you have any guesses
for when your approach to this will be visible?

I suspect most approaches will eventually run into an issue with the
current interpretation of $(srctree)/$(objtree).  Unless you can ensure
$(src)/$(obj) will never end up with absolute paths.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



