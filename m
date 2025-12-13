Return-Path: <linux-kbuild+bounces-10087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84959CBA2AA
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 02:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A895300A2B2
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 01:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8D01B87C0;
	Sat, 13 Dec 2025 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRiu2/q5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA819F13F;
	Sat, 13 Dec 2025 01:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765590015; cv=none; b=oDg710/V9F+OIR2YntqOi7WAsAig84j1W9po59olx6kZhSGGC61FEvUCWaLA/eIbXYAUrtwC/JUx+Rckpyk1N/SYuS/XzOZNpRN+ohdqjMNJvmmcRILg/KVY0eLtPAIwIs6q7ip7MUimvo/OXAoXVZ0y/4DJSzf9OksXgytEKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765590015; c=relaxed/simple;
	bh=O/jwb1Bfr59e/A6IOWCJZGscFliaL38PsmVm26gy0jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz3zKVlsVUnLkfe+MLQ/ZklUajD1KvRSqgfPc7g8kPQd34e36pS39wBqvwf2LvIgxt/INtc0lpQBEsU3x49Vu8/WOI+gEKj5hmW55dx3pEP9F2J0A/9zwvEMvTeKR7B8Pu1OmysKpU9uVGp0aHA7lhab5aGLH3UE+8kCygSkJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRiu2/q5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B948C4CEF1;
	Sat, 13 Dec 2025 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765590014;
	bh=O/jwb1Bfr59e/A6IOWCJZGscFliaL38PsmVm26gy0jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRiu2/q53dkLif7q4uNFSnrsQYxunLMq2sapvB98RRwCwkK/kljK9PhJmbHlGH43W
	 pcJw1pFHMkgPFz9dwNK1DIhqneUFOcoVLP6TfBTIZpV6rpsP5e99fbmDrlRiAnXkP8
	 I949hvbxr7t+18H+8zb7yThzoJI6OH2/VZbdgtSuUru6sYPY89o9ENxcTQmC0SC+IB
	 QtWgQBfoDhoM298ltcyA11fpzQbIfgZIA03K4IdcD5l5h05DyF+oydEr9todwiBOtg
	 5R9AdnTGvxxoph70+mmM8/BX2WFQulQ3YU98vmRzFQQA758ZhE0MCCnpl7CGOA0UpA
	 HIMU8F/ZvN0ew==
Date: Sat, 13 Dec 2025 10:40:09 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Graham Roff <grahamr@qti.qualcomm.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
Message-ID: <20251213014009.GA3115176@ax162>
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
 <20251205015352.GA2060615@ax162>
 <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
 <20251205182334.GB3974306@ax162>
 <1f2376e39dc46772e630e2cc9f9b40a2ef20993d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2376e39dc46772e630e2cc9f9b40a2ef20993d@intel.com>

On Wed, Dec 10, 2025 at 05:07:39PM +0200, Jani Nikula wrote:
> On Fri, 05 Dec 2025, Nathan Chancellor <nathan@kernel.org> wrote:
> > On Fri, Dec 05, 2025 at 09:01:51AM +0100, Arnd Bergmann wrote:
> >> This is the bit that frequently confuses developers with the
> >> current syntax, and I agree it would be nice to have a better
> >> way,  but I'm not sure the proposal actually helps enough to
> >> warrant a mass-conversion of existing Kconfig files.
> >
> > I do agree that the 'depends on A || !A' syntax is confusing and that
> > this does not really address that but I think that is besides the point
> > here. I also agree that it is probably not worth converting existing
> > users to this syntax (unless there is solid reasoning), I would not want
> > to see cleanup patches of that nature, just use in new code.
> 
> I think "depends on A if A" is an improvement over "A || !A". But not a
> drastic improvement.

Agreed.

> I think the question is, can we figure out an even better syntax for
> that use case? Something that conveys the "optionally depends on A"
> meaning? Is there something so good that it would warrant cleanup
> conversions just for the improved clarity?

I cannot think of anything off the top of my head but given how new I am
to actually maintaining Kconfig, maybe something else will come up over
time (or maybe Nicolas has some thoughts).

> If we can't come up with anything, let's just roll with what we have
> here?

This is my plan personally, as I feel like this (or the future v3) is
good enough (and brings consistency to "depends" with regards to
supporting "if" like "prompt" and "select" do). I am a firm believer in
"don't let perfect be the enemy of good".

Cheers,
Nathan

