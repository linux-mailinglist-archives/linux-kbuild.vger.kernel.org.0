Return-Path: <linux-kbuild+bounces-1154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA2870AE7
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 20:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C57D284751
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 19:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872024653A;
	Mon,  4 Mar 2024 19:46:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9979DA5
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709581565; cv=none; b=Kd+PtU32frtNJJg75D+ano8xJRRV0Ci4KYMBfiL+TXmzuCVpeg2JZCA20QgSxLOAgobXorxkmI35RlPMXg3GCqDo2Z07qZTrlMud17HrISrVB7YKN7WdgkGVkBwN9MzHONuXcR8azrLNb3vBr7DV469flpkgc3KlIGvkhK+0wGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709581565; c=relaxed/simple;
	bh=xO+v31ZE6POZ3De7usp3rSyaWHN3mu3oGs7tKWe8p84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlI+h3AVoR3kQ4dl+7CPPOZh5FPmYwZlRIGus27xSdx1NjmWwunWujKDNbuf6f5CHnkqMYFf0qEIoXk7nPHWL/pHuUYECJxWTT0kGgmDN4Qj458SVCRW/spJIINDUaY/1WlRoz3lYsHk2Dn4o9bXyLMvGo3GvWR0+lgHxUDzqdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 424Jjj6e025960
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 4 Mar 2024 14:45:51 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 424JjjLW025959;
	Mon, 4 Mar 2024 11:45:45 -0800 (PST)
	(envelope-from ehem)
Date: Mon, 4 Mar 2024 11:45:45 -0800
From: Elliott Mitchell <ehem+linux@m5p.com>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 01/30] build: replace uses of $(abspath ) with
 existing variables
Message-ID: <ZeYk6fsZr7PWiHID@mattapan.m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
 <ZeWZebwyvtuJ6Xd1@buildd.core.avm.de>
 <ZeWb9EaO4WhcgEEs@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeWb9EaO4WhcgEEs@buildd.core.avm.de>

On Mon, Mar 04, 2024 at 10:50:49AM +0100, Nicolas Schier wrote:
> On Fri, Mar 01, 2024 at 12:51:01PM -0800, Elliott Mitchell wrote:
> > As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
> > shouldn't be used with $(objtree) or $(srctree).
> > 
> > Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
> > Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
> > ---
> > I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
> > recent one.
> 
> If you add a 'Fixes' trailer, please just include changes that fix that
> commit.  You're patch does much more than just modifying the changes
> from commit 0e1aa629f1ce.

Since all of these should have been used $(abs_srctree) or $(abs_objtree)
when committed, all of these are fixes.  Issue is most of them moved at
least once, so tracking down the list is annoying.

You consider ignoring this is fixing around 5-13 commits reasonable?


On Mon, Mar 04, 2024 at 11:01:24AM +0100, Nicolas Schier wrote:
> oh and please do not re-use the same commit subject line for different
> changes.  This will be quite confusing when reading the git history.

Several of these were originally a single commit.  Many of them are
doing exactly the same job, just to a distinct filename pattern.  Issue
is #5 is already so large squashing things together would likely make
reviewing harder.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



