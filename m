Return-Path: <linux-kbuild+bounces-6307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C362FA6CE68
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Mar 2025 09:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E2B316D8FE
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Mar 2025 08:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406E118C900;
	Sun, 23 Mar 2025 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e72WfGzA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD678F2F;
	Sun, 23 Mar 2025 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742720108; cv=none; b=oRriAfIQncPkYfjb/g6cffHSE7z30AleYZ50gG7szYyDThgg8GjHjoHJd6UiVk3z8H0SasI+iOciX6two1NVFSAV09sggdMbNbF1mGYeDhPpZmXyuNQx5dKey1K6C/kuoRkaB5DyOc4pxZQNC08iq8zh13sDTxu3iulx0DzKdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742720108; c=relaxed/simple;
	bh=flR4GIm1FPYA5DwXQfno9t+Hl4BxQ/ih67ca55cfyRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDIFigRACtoRG72rtQpGUWFeDpiIAbmTu4VJj4YTtXRYU/Zgbp2ym/9WPy0uaa/aFNEQ7Pp7zBY/ZoCb/APESwsUVBUD7AKEI4vTQNkzdnosdX6Nh3aagokVnah67RUf+7jlB3NPIUCTbFV2nvgIxOFrAFRAvHulzz43+JmsuJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e72WfGzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F164C4CEE2;
	Sun, 23 Mar 2025 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742720107;
	bh=flR4GIm1FPYA5DwXQfno9t+Hl4BxQ/ih67ca55cfyRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e72WfGzAS1p2vvOwUMR40zbZ0hXofmEmdRatqQXXK3JFhQHEJKG2FBH26YRLILmzh
	 YpuKzcn9xwkgp94pWcrwFh2DZrNI/vSDotFgVr3OI1d1MCs32dnjWGK0M6wtEi0hjV
	 1uMA0WMnpdYz0rGyMjI6EO/sT1DQ9zpRnHOitpWwVieFGvf1vTtvIUvee8DXXli/xp
	 eVPmJMSH4BU7UPTkXgVTVwfSKOXKEcvmSibmVLKbUK8OPhjOHw3Yzb8IUrJiwI9Gwh
	 TPL2SmXpSGw3TdrYQ2JqHpAiW8upnSSX5cKgXNxM5dID70qhJlPYqpeIt3E986ogcx
	 ykakjI3ns/TcQ==
Date: Sun, 23 Mar 2025 01:55:05 -0700
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
	Carlos Maiolino <cem@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
Message-ID: <Z9_MaS4zWExJi9tJ@bombadil.infradead.org>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
 <Z6oeplCypN825pyR@bombadil.infradead.org>
 <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
 <ac98e417-1587-4806-9576-7661acc6bf6e@ruhr-uni-bochum.de>
 <CAK7LNAT4ezUbKj1N95tN2xaiGXWABp3ABkwK+NePWc87XgcEDw@mail.gmail.com>
 <Z9_JA_tuFbVJRcTR@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9_JA_tuFbVJRcTR@bombadil.infradead.org>

On Sun, Mar 23, 2025 at 01:40:37AM -0700, Luis Chamberlain wrote:
> Let me know if your team is interested in exploring these things.

Hrm, actually there's much more...
Given we support all cloud providers...

This can also be something like:

matrix:
  providers: [aws, gcp]
    storage: [ebs, nvme]
      filesystems: [xfs, ext4]
      testsuites: [fstests]
 
If we could gather data about price...

       - cost_limit: $0.50/hr

We then just need a mapping of code to tests.

code_paths:
  fs/xfs/: [fstests, ltp, gitr]
  block/: [blktets]

Ie, code maps to Kconfig attributes, and so we know what tests to run
as code gets updated on each commit.

  Luis


