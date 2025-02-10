Return-Path: <linux-kbuild+bounces-5697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0EA2F1F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 16:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42A2B3A3DB9
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4642417EF;
	Mon, 10 Feb 2025 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0YETIzB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263C24BD0E;
	Mon, 10 Feb 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202216; cv=none; b=h44zDtdRi+3RdqCKNR2KVXWidmZw99N2lzsZSjuX4+HYxMIvMkJfjnq+yxIUPZlhow94AjwY16RzkJxu1AlwKAT+RFu+G0HbUFJxvCG3iRJCoYyXCHpntL2trICmJxU6srwmS6cST/aS0+HkdEEi4YPGX1Cu+75AFUpNqjIJYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202216; c=relaxed/simple;
	bh=WZS3sU0sd86m5bHMF0peMXVJ5xWj23Gx8p6IR1Vj8QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB6XNa7SPCOLg0ud6BIefpIiYtnNed7WnxXTlZGEP5HP/yLoBPraAKleZROWPkdy4BOdrzVHkK6KaOXRDKOF9Ms+YID4tKEe3yfBAxGHqxAGM8aVF9LcffEIQJk9zE2I32D6ewG5pLObRoBN+0wuxekIlxhfT43ULqvCnXdkTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0YETIzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D83C4CEDF;
	Mon, 10 Feb 2025 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739202215;
	bh=WZS3sU0sd86m5bHMF0peMXVJ5xWj23Gx8p6IR1Vj8QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0YETIzBl11DiMk52ESkHHlfdY1zRHLPCMB2BIZWKn3NgekVPVRx96vKjr4BYpWye
	 mheMWPsGKlo4G+s8SoLFNWEQoiWSEWj/sSvC1dlhS+RDzEssnVnvbPKj/bv7VKw7et
	 KRZ5stzP5kxqnbB7GjzucUt2j5KfZVpAkZL3abjoCDgsTKGqmAZr4MbIB5lmNpenVa
	 0jbGclfi2rBfaOrgEAzdh56SZDoGb3m2y7ug1npjMznkMNsPZ53+sEcYXDOXDj+djQ
	 n7KdebyCtqAj4MHZxr2q5N/vqmuXBwKBWzfTQVapAtCrnXAQEccbONuwtvJs3PBW5z
	 3z1MxcfZg24gA==
Date: Mon, 10 Feb 2025 07:43:34 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ole Schuerks <ole0811sch@gmail.com>, linux-kbuild@vger.kernel.org,
	jude.gyimah@rub.de, thorsten.berger@rub.de, deltaone@debian.org,
	jan.sollmann@rub.de, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
Message-ID: <Z6oeplCypN825pyR@bombadil.infradead.org>
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>

On Mon, Feb 10, 2025 at 02:00:52PM +0900, Masahiro Yamada wrote:
> Thanks for this, but I have no plans to merge the SAT solver.
> 
> The reason is that my future plan is to move toolchain selection
> to the Kconfig stage instead of specifying it statically from the command line.

That makes sense.

> This approach was suggested by Linus [1], and to achieve that,
> the shell evaluation must be dynamically re-evaluated [2].

Sure.

> The SAT solver would likely conflict with this plan. At least due to the
> significant amount of additional code, which would be an obstacle.

I can't see how the toolchain selection, if set on Kconfig can't be
leveraged later to enable / disable the SAT solver, however I can
see the amount of code shuffling incurred to be an extra hurdle to
address and a preference to leave that for later.

In other words, I susepct it is still possible to evaluate to
add support for the SAT solver post toolchain kconfig integration.

Thoughts?

 Luis

