Return-Path: <linux-kbuild+bounces-1193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE3F8744EE
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Mar 2024 01:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19E91C22293
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Mar 2024 00:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BCF380;
	Thu,  7 Mar 2024 00:03:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F981F
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Mar 2024 00:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709769800; cv=none; b=DL7N1ZcYwPNpwEyP3iI/NmRWaJHwpXHNauRuFFSHw6Vgk+MHmAmIhqwwcvcDgecLmnk/RQiDIZF5xrONI/nUSRwXVD7W7kuTEfq7UsgcuZ1EJiwaeolP0rSW0pasrBNfNDGpca/zghMZpmszVNoihCDJ8W7WgWpmfKgcRUdaGIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709769800; c=relaxed/simple;
	bh=dxMV2EYsA+X03oE2vgZRrsga00DKie4y0dZ5qlaqZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXas113L6yopIdlaCq8s/0edYJcMx/Le4dY3dYROLsBA/NpNhx9RgEfIpMD01quIWaVsFgUjkAQcgzi2wYZWd6VCxyiZlLLYRdV4Yuz2AZCi8yndmazujW7VX70zL3bdHhNkMGSwsSoWgyE59x3IszzykCVbOAnGXZ4/84WdKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42702hcn037445
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 6 Mar 2024 19:02:49 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 42702gm2037444;
	Wed, 6 Mar 2024 16:02:42 -0800 (PST)
	(envelope-from ehem)
Date: Wed, 6 Mar 2024 16:02:42 -0800
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
Message-ID: <ZekEIt2aqSbhP3iF@mattapan.m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
 <Zeb3O0IaAOJHY02w@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zeb3O0IaAOJHY02w@buildd.core.avm.de>

On Tue, Mar 05, 2024 at 11:51:36AM +0100, Nicolas Schier wrote:
> On Mon, Mar 04, 2024 at 11:45:45AM -0800, Elliott Mitchell wrote:
> > On Mon, Mar 04, 2024 at 10:50:49AM +0100, Nicolas Schier wrote:
> > > On Fri, Mar 01, 2024 at 12:51:01PM -0800, Elliott Mitchell wrote:
> > > > As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
> > > > shouldn't be used with $(objtree) or $(srctree).
> > > > 
> > > > Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
> > > > Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
> > > > ---
> > > > I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
> > > > recent one.
> > > 
> > > If you add a 'Fixes' trailer, please just include changes that fix that
> > > commit.  You're patch does much more than just modifying the changes
> > > from commit 0e1aa629f1ce.
> > 
> > Since all of these should have been used $(abs_srctree) or $(abs_objtree)
> > when committed, all of these are fixes.  Issue is most of them moved at
> > least once, so tracking down the list is annoying.
> > 
> > You consider ignoring this is fixing around 5-13 commits reasonable?
> 
> I think, fixing inconsistencies is a good thing, but I'm afraid it's
> not always important enough to mark such changes as 'Fixes', as 'Fixes'
> is especially used for auto-selecting patches for stable trees.

Eventually resolved to 8 in the end:

Fixes: 606b9ac81a63 ("doc-rst: generic way to build only sphinx sub-folders")
Fixes: 8e9b46679923 ("kbuild: use $(abspath ...) instead of $(shell cd ... && /bin/pwd)")
Fixes: 787360f8c2b8 ("samples: bpf: fix build after move to compiling full libbpf.a")
Fixes: 50d3a3f81689 ("kbuild: Add resolve_btfids clean to root clean target")
Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
Fixes: 98d614bdaa58 ("docs: Makefile: use the right path for DOCS_CSS")
Fixes: 6008105b4f4e ("samples/hid: add new hid BPF example")

I guess this isn't too crucial to document, though it is useful to
observe the rate at which these were being added.  I consider it within a
maintainer's discretion to pull such from a commit message.


On Tue, Mar 05, 2024 at 11:43:07AM +0100, Nicolas Schier wrote:
> On Mon, Mar 04, 2024 at 11:36:27AM -0800, Elliott Mitchell wrote:
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
> 
> oh well.  You are probably aware of things like
> subdir-ccflags-y and that kmods built via M= are considered to be
> out-of-tree and taint the kernel.

I hadn't yet been considering such issues since that isn't yet urgent.
In fact given the level of patching this distribution does, having the
kernel marked as tained for out-of-tree modules may well be appropriate.
The amount of backporting is impressive.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



