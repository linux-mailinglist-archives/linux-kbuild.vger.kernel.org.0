Return-Path: <linux-kbuild+bounces-6306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57479A6CE57
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Mar 2025 09:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 089EE1897B5E
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Mar 2025 08:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A0F1FF60E;
	Sun, 23 Mar 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZwVqlUj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8F15ADA6;
	Sun, 23 Mar 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742719237; cv=none; b=rEiSVw54yXiSHieOfkjT1jAcgCRkpV7XcTDXt+rC2yy1Jt9XGGWjKdnjfNXX6jA8A7mbn0GpCVchEDARy3ypSXtADwi0mrGRuZml1FoXaaPYCu7wgId2t9iYvIZt8XezVtkIcc8HsH/458i7eW9eaHW9IcSrUyICt7mb8SKnhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742719237; c=relaxed/simple;
	bh=1Fqc8qTern+5AWtLNetV1XEhbB0+J28peG5nppakHYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBHqda9RyNVjtXieQlxQAhfVdzjdQiBNvsxIDZNgoaf9fZXW2ASJL8j0mL4gjlcgPvZ1Y6m3ZQEGO+RR+zXi5vLX3H5M+uC84wqlj993naQcoXVfOzEUSeMklnlfUvw4k7KmCqNZyA/z6YlcoJFFDgPdlVNdCYTvODmkJMhj1bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZwVqlUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C60C4CEE2;
	Sun, 23 Mar 2025 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742719237;
	bh=1Fqc8qTern+5AWtLNetV1XEhbB0+J28peG5nppakHYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZwVqlUjlWQkP8O41VjI4qwX9y6B/G5i1qCTPA/w58iL+GZ3HJBH0cW/kEsh5iS8A
	 CgFH1KjmSNJXBEXEJ3Df2cRzL+DnJ8nWzTD10jWReXePH4xO5YLHH8yu+Qk9HqobWT
	 GvTimM9CW6cRJ2MDIbrnbaRguPB1vvIjyTZVikR0llaKwv6jQ6PhhhPZSCU4+3j5ID
	 rIOHRZYIV73cttfY2knrjkMP4dLO2akiRqmhB5EKKioA2ipFBZA2n7FQfa9cSSAiAt
	 Yklq3/w6LxT9+QrWPMQRVWNv2sQ11osxIFrJkyTREY6nNZVXr/VEqSw2n44QfKWDGT
	 pNOzWKK4YKA2A==
Date: Sun, 23 Mar 2025 01:40:35 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, kdevops@lists.linux.dev
Cc: Jude Gyimah <Jude.Gyimah@ruhr-uni-bochum.de>,
	Ole Schuerks <ole0811sch@gmail.com>, linux-kbuild@vger.kernel.org,
	jude.gyimah@rub.de, thorsten.berger@rub.de, deltaone@debian.org,
	jan.sollmann@rub.de, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu,
	Brendan Jackman <jackmanb@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Carlos Maiolino <cem@kernel.org>
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
Message-ID: <Z9_JA_tuFbVJRcTR@bombadil.infradead.org>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
 <Z6oeplCypN825pyR@bombadil.infradead.org>
 <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
 <ac98e417-1587-4806-9576-7661acc6bf6e@ruhr-uni-bochum.de>
 <CAK7LNAT4ezUbKj1N95tN2xaiGXWABp3ABkwK+NePWc87XgcEDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT4ezUbKj1N95tN2xaiGXWABp3ABkwK+NePWc87XgcEDw@mail.gmail.com>

+ kdevops

On Mon, Mar 03, 2025 at 01:56:44AM +0900, Masahiro Yamada wrote:
> On Fri, Feb 21, 2025 at 12:03 PM Jude Gyimah
> <Jude.Gyimah@ruhr-uni-bochum.de> wrote:
> >
> > Quick follow-up.
> >
> > On our end, our SAT-solver implementations can be easily adapted to accommodate your future
> > toolchain selection refactorings.
> 
> OK, we will see.
> 
> >
> > Also, could you share with us the timelines for your refactorings so we can plan and deliver the
> > adjusted SAT-solver patches.
> 
> There is no timeline in upstream development.

Jude, while Masahiro works on dynamic shell evaluation support and
given the SAT solver currently works with bools / tristates, I can
think of ways we can likely move forward to experiment with the existing
SAT solver integration, and can think of ways we can get ahead by
exploring ways to leverage the SAT solver on kdevops which can likely
pave the way for its use also later in Linux.

We already carry a small delta on our kdevops kconfig to support yaml
output which has proven invaluable to us, we can carry a SAT solver, as
things settle with dynamic shell evaluation on Linux.

How can we leverage a SAT solver on kdevops?

1) Feature-driven configuration and scriptable goals

Instead of having the user do the heavy work on figuring out what the
heck to enable on make menuconfig, the user just has to writes a
requirement. Something like this:

ci-goal:
  - filesystem: xfs
  - features: [reflink, 4k]
  - workload: sysbench-mysql-docker

This can also enable scriptable CI goals:

kconfig-solve --enable sysbench --fs xfs --blocksize 4k --reflink

Generates .config to let us test this.

2) Minimized configs to reproduce a test on our CI

Today if someone wants to reproduce a generic/750 test on xfs reflink 4k
profile they can just use the web interface to select just the xfs_reflink_4k
defconfig, and we have a kconfig option to let us limit the test to a
set specified [0]. That requires adding a defconfig per test profile we
support. Wouldn't it be nicer if we can just say:

ci-goal:
  - filesystem: xfs
  - features: [reflink, 4k]
  - testsuite: fstests
  - tests: generic/750

3) Generate a set of different tests for a goal

Given a set of features we want to test, we could have the
SAT solver look for satisfiable combinations we could have

ci-goal:
  - filesystem: xfs
  - features: [reflink]
  - workload: sysbench-mysql-docker

And so this may generate different .configs to help us run each one as a
setup to test test XFS on mysql using docker using all XFS profiles.

Let me know if your team is interested in exploring these things.

[0] https://github.com/linux-kdevops/kdevops/blob/main/docs/kernel-ci/linux-filesystems-kdevops-CI-testing.md

  Luis

