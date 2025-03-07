Return-Path: <linux-kbuild+bounces-6005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC67A57324
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 21:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EDAA18992B5
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 20:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B419B25742A;
	Fri,  7 Mar 2025 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKm9g3QW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AE23E23D;
	Fri,  7 Mar 2025 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741380977; cv=none; b=lT0khNl8iDgJj+zUcaqu5BsfuDvkc9frBEd1Y2pGatMi7D3tOQfDHz46dVluqrVQO+KSpGWBpCkVJrbfZDPeMCYJqKmFXUOMbthkT+jMT1qFnN1Zg6stkRfDW0MZos9u0XMZbUH4uF8e7IiK9u1933eomugUAMJ+YtTsfBkQl+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741380977; c=relaxed/simple;
	bh=LW61GiFRBiR5ZfRsuGNqCCLtftCdpNgqKswwFYOx2X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKBgmHOSectG3H9YmH1wRGCW61lj1PNvPQ7exUBiOVaQbxU0Wt2f7r9GfX/yvVz9MiTOFQDzZG0DpC6eiaaUY/fivnAUL9jgZVRolCai0OFEsIAHTjT1O6jlIahfU2Gnm8yUWu6Dn7bRL0cMoXr86vGUJ+BNnEEjvsioIs3IIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKm9g3QW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6579CC4CED1;
	Fri,  7 Mar 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741380976;
	bh=LW61GiFRBiR5ZfRsuGNqCCLtftCdpNgqKswwFYOx2X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKm9g3QWSeGUvxdxtJOsYcQp/dE2FR2xOh0b5kdAVwb1eEY7Fskq3jmkTbN3Uh5wh
	 6keCPcSOUvammav/UYf6jYipzA04bM7S+noMjvA/csLj2Vr/tVlYNtQD0X77faujPw
	 obg4XZ3+51OAE1vGQ2EAE/ptjU9w5LJgMQVVLWyEl8aH2oz7lBYj6lAev+2Z3gYdT2
	 Im+HRjB2/5NN2iFhNWcaYMFo0/bzby45YhwTVCMCYHN1Pl7XGYAgM9SmunAyMmUVNu
	 jq+74T7ZOGbzXOkQEcc+/mmxwkzlcSJhfgIdAveznSYJu8rN5QkqRh8UvyiZfcH2It
	 qWtsDYvutU3XA==
Date: Fri, 7 Mar 2025 21:56:12 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Alexandru Gagniuc <alexandru.gagniuc@hp.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION
 indiscriminately
Message-ID: <20250307205612.GA2695746@ax162>
References: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
 <Z8sgisZ8FI3wkpfZ@fjasle.eu>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sgisZ8FI3wkpfZ@fjasle.eu>

On Fri, Mar 07, 2025 at 05:36:26PM +0100, Nicolas Schier wrote:
> On Wed, Mar 05, 2025 at 07:25:36PM +0000 Alexandru Gagniuc wrote:
> > Cc: <stable@vger.kernel.org> # v6.12+
> 
> Shouldn't this be v6.8, as 7d4f07d5cb71 got introduced there?

Presumably this is because there are no supported kernel versions
between 6.8 and 6.12 anymore but I think the '# v6.12+' is entirely
superfluous because there is a fixes tag, so the stable folks will
figure out how far to backport it automatically based on that.

> > Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-build-option to debian/rules")

Cheers,
Nathan

