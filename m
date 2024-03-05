Return-Path: <linux-kbuild+bounces-1161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E4871C61
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 11:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06221F252F4
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 10:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A177548F3;
	Tue,  5 Mar 2024 10:51:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3054CB58
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709635910; cv=none; b=NHmUrUT3fExcjBpP9c9V5C6E2K0aGI3ip4CRSB6wm2VXm+v5Vvm5E6TWo+RDBW5LgKK0aXPm1JSc9Ceg8BIvBgNsHbu1De+D0Rze558ApShbK9EIwtmGXc2B4oMSbSjl14pje6Xom8nIzwHqWhOgGNvsxJf8ejwXP9vttRmozf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709635910; c=relaxed/simple;
	bh=+Y478lehSXfWfOd0iGK6y70HR3lCRVo9Qbsv8WT0Jhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRzbB4vaAI0frqyuQcpZJIZeQgXlv9uRxhjeWLExemkU6F4p6be09Tn9CLBavm3rP5S+9jdvh6IGkOlz+OytU3/B+BwxoGInzqE3wE/OgjmUV0BFpqWWm8E95bGJjMmn2MI9Y7/rpmJPuzfExdA+DF+avCz128giuNz4uMdUWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  5 Mar 2024 11:51:36 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 6C6D7802A1;
	Tue,  5 Mar 2024 11:51:36 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 62EB718B4EA; Tue,  5 Mar 2024 11:51:36 +0100 (CET)
Date: Tue, 5 Mar 2024 11:51:36 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 01/30] build: replace uses of $(abspath ) with
 existing variables
Message-ID: <Zeb5OGhjDSPv3QVm@buildd.core.avm.de>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
 <ZeWZebwyvtuJ6Xd1@buildd.core.avm.de>
 <ZeWb9EaO4WhcgEEs@buildd.core.avm.de>
 <ZeYk6fsZr7PWiHID@mattapan.m5p.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZeYk6fsZr7PWiHID@mattapan.m5p.com>
X-purgate-ID: 149429::1709635896-F0644402-EC654002/0/0
X-purgate-type: clean
X-purgate-size: 1314
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Mon, Mar 04, 2024 at 11:45:45AM -0800, Elliott Mitchell wrote:
> On Mon, Mar 04, 2024 at 10:50:49AM +0100, Nicolas Schier wrote:
> > On Fri, Mar 01, 2024 at 12:51:01PM -0800, Elliott Mitchell wrote:
> > > As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
> > > shouldn't be used with $(objtree) or $(srctree).
> > > 
> > > Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
> > > Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
> > > ---
> > > I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
> > > recent one.
> > 
> > If you add a 'Fixes' trailer, please just include changes that fix that
> > commit.  You're patch does much more than just modifying the changes
> > from commit 0e1aa629f1ce.
> 
> Since all of these should have been used $(abs_srctree) or $(abs_objtree)
> when committed, all of these are fixes.  Issue is most of them moved at
> least once, so tracking down the list is annoying.
> 
> You consider ignoring this is fixing around 5-13 commits reasonable?

I think, fixing inconsistencies is a good thing, but I'm afraid it's
not always important enough to mark such changes as 'Fixes', as 'Fixes'
is especially used for auto-selecting patches for stable trees.

Kind regards,
Nicolas

