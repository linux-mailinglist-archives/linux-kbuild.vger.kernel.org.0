Return-Path: <linux-kbuild+bounces-6870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FDAA7319
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 15:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED560987B49
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6382B255F5E;
	Fri,  2 May 2025 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ub4NMQhI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A52550A9;
	Fri,  2 May 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191555; cv=none; b=HxvlNBRM7C/HyDWXgGahWG+xAFFu40RXASB4V7gkuU4VJEN3obZvV+tV3GDflSWgdeumkvawuY5lFOQZ78isA2us+dXxw8BFCsaA/E8rIyQyMHhEDQRyEUHgp+EGgqE/GYyaEk5bndUwl+wH8wkTsPFQbKmCMc9AJJ8bWdhNsWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191555; c=relaxed/simple;
	bh=eO/6WTxBp/tHRsX3i6QIsJOm81cgQed0I23DFFmvMXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR/Ch9DsEcBkVL0HP4/v2DrHjAlXwnYCN15llnFuipBVoaMu7ygbKqZK3aCZ9lPYcQaAjBhXqoWzBIETVDaAHvK4zJBDCpJPHimAtg84D32EAazA5V2R5kcp8pZneE7YDaTJdviV2i1SsL1a5bJKg9hDwOdK41l3UocySGvOyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ub4NMQhI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lMELRAP9hESac1mRjr54OpfOeUqvHKxQqk6ZFIBM4cQ=; b=Ub4NMQhI6xje8y/TBiKnwiCfjx
	hu8z24AycgeKB00xHf1LM/cnHBr2DFESV64orBNAnKhSQ9Asl++VeeyWmUj/VFQ+rygACNQKWSz16
	C7fy7tV68OpvEHiL5VohWknYQQwnGfTjzXSRWA6yMhn8OaCiwTeI2wA6hof54ePIF1nZ7D8yZMXo4
	3P1S+eOC96F9BzJmMg1sp5bZ8VHEAVUTGybBqgo1NJUFdTrZSLRTSPycAfkdCRZtabHAFOLkf5fws
	qA29usr8I5s1MQpW1F5S3i33BoJvJlHx3WUjo8z2nA2uBhg6Bv1RozXPGh5sk4Iu618mtZd6sighD
	6KCBVELg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqBK-00000000hV5-0Ddk;
	Fri, 02 May 2025 13:11:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 280EB300777; Fri,  2 May 2025 15:11:39 +0200 (CEST)
Date: Fri, 2 May 2025 15:11:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org,
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -v2 5/7] module: Extend the MODULE_ namespace parsing
Message-ID: <20250502131139.GC4198@noisy.programming.kicks-ass.net>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.496784892@infradead.org>
 <CAK7LNAT9yyCFApF=HgmvTjHiAyAagzvRfu+cx0_D+7FBxpzk9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT9yyCFApF=HgmvTjHiAyAagzvRfu+cx0_D+7FBxpzk9Q@mail.gmail.com>

On Sat, Feb 08, 2025 at 12:45:21AM +0900, Masahiro Yamada wrote:
> On Tue, Dec 3, 2024 at 12:11 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Instead of only accepting "MODULE_${name}", extend it with a comma
> > separated list of module names and add tail glob support.
> >
> > That is, something like: "MODULE_foo-*,bar" is now possible.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/module/main.c  |   39 ++++++++++++++++++++++++++++++++++-----
> >  scripts/mod/modpost.c |   40 ++++++++++++++++++++++++++++++++++------
> >  2 files changed, 68 insertions(+), 11 deletions(-)
> >
> 
> >  static void check_exports(struct module *mod)
> >  {
> >         struct symbol *s, *exp;
> > @@ -1714,7 +1741,8 @@ static void check_exports(struct module
> >
> >                 basename = mod_basename(mod->name);
> >
> > -               if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> > +               if (!module_namespace(exp->namespace, basename) &&
> > +                   !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> >                         modpost_log(!allow_missing_ns_imports,
> >                                     "module %s uses symbol %s from namespace %s, but does not import it.\n",
> >                                     basename, exp->name, exp->namespace);
> >
> 
> When module_namespace() fails, the following error message is shown:
> 
>   ERROR: modpost: module bar uses symbol foo from namespace
> MODULE_kvm, but does not import it.
> 
> 
> We get a hint from this error message, but the solution
> is not MODULE_IMPORT_NS();
> 
> 'make nsdeps' will try to solve this by adding
> 
>   MODULE_IMPORT_NS("MODULE_kvm");
> 
> Apparently, this does not work.
> 
> Not sure if you want to solve the issue.

Seems unsolvable by construction; so no.

