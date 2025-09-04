Return-Path: <linux-kbuild+bounces-8701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB5B43008
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 04:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FA31B25304
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 02:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A0E21D5BF;
	Thu,  4 Sep 2025 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciIOzHMP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EA71D63F7;
	Thu,  4 Sep 2025 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954275; cv=none; b=CQS7Kr1qDfNGU1D2tU/1OMbg4cRFNOVIoSKFRN/nSR0iBrv3AeVIUXNMcegQMVitB5R1OEaAaNqr3jiiLWx15go24FTHc+7KNRqYahULVOxBBy5MpoIQKAGO+gS82VEs2qP0HpWf7UY2yNexYpWvMrQNyGyd+OvTVFaOw3Vzo5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954275; c=relaxed/simple;
	bh=0797LXPhzUWWmKfaqTHozOceixXo9Y5kTFjvx233sr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzKZtMKww+HcStIb8qAw4jk36Fe1EuoiV4/kwkNICOFjmazJKuFXFuOYsYZdn8tNdl7hdpiAu33CqTooVPXwu3AIFFDDZrkSVvDGtPamWRQ35RtCg6G06MVXJJBOL7QkaktxpCNLLWYgNlBoQPGf9f8n9LHm9VdMeCfXvcLnCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciIOzHMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D57C4CEE7;
	Thu,  4 Sep 2025 02:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756954274;
	bh=0797LXPhzUWWmKfaqTHozOceixXo9Y5kTFjvx233sr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciIOzHMPJ4gH+LPXkgpLk0sZ/vopItqvdlqeH+tdeTTmDhU28644VEhWBrinbvx3u
	 nD5dPqP3agBuNLB/cnDUQeYvFj89O/tgVzkqDLJHAPHPJw5a39/DS5/ISSqgYH78Np
	 gu2504NcLsh/llNKF5AB2jaBhYFOtuVng/GQr55EyZZsUI87dr4pie2SF9ChKqet+L
	 G+mGryIeFrqr2Ea97h4DPbN13rajR8HJZlAvbyEzGOhWIjNNDBjuRkJihhgxe+vILY
	 rWvX5OKIpQgUQfFW8ezPwhKGQNUoxn6+FIlVg0k2hGBM9mAyymzP1G83Oy+N0wqxed
	 Mbjk7xHixrEtA==
Date: Wed, 3 Sep 2025 19:51:14 -0700
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <202509031949.375138FB13@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>

On Mon, Sep 01, 2025 at 08:44:56PM +0200, Vegard Nossum wrote:
> If you change sym_calc_visibility() to always return 'yes' for
> transitional values then I don't think you need to touch
> sym_calc_value() at all.

Hm, it looks like sym_calc_visibility() doesn't strictly just look at
visibility. And visibility seems to "last"? And I think the "tri" still
can't just be "yes", don't we need the other stuff handled?

Do you see a way to do it how you're suggesting? And now I wrote the
regression tests so we can test any alternatives! ;)

-- 
Kees Cook

