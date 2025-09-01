Return-Path: <linux-kbuild+bounces-8681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82993B3EC94
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9962C0793
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 16:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7F121E0AD;
	Mon,  1 Sep 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ3+GBwj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2591E2853;
	Mon,  1 Sep 2025 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745145; cv=none; b=lUKjTHlz7fJuo6Ef/ODauKXkDIqDD08ehRU3qNOSutQOGbrGSlpHbTp1mTQHfjSggCf8gyMB1L5mR2CqW4nXaIMYXrYuuNTCayRPXxuunQhVfxGbB0/2AkbR13nGNdZt1SW7Cu+pNBzWOysgixBUDxHQgUy7W51c2HcrjKDxCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745145; c=relaxed/simple;
	bh=QNxYSIZMDJxh+pYTXN1N3A1Kh9aq43hGRs/RiFWve/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ1ZbAYKcwqoxooKZX9wwsAzK1gBhTNN8S1ZogkAbRu9NUQAGLWDFETWUxYPnzwXvdHr6APil2QlUkNK8K553gn1Bf0OporevLk9XME3T+GQARMX6D0xB0n40BW/+W1Hl43O0szuEkDiifPzyVAdUc6AGrfY+Dy+E/0jwpDFONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ3+GBwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A4BC4CEF0;
	Mon,  1 Sep 2025 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756745145;
	bh=QNxYSIZMDJxh+pYTXN1N3A1Kh9aq43hGRs/RiFWve/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQ3+GBwjK9Vbcq2uaFaQsH+AUdXUr+tBV+kkhjte/7//GXTvWe9eh651+Zv+tEcJ9
	 OO9YAl1C6VeNuPHbvmuekHrouFuGgexRROGf+WYcgf8sXa/FlCYDTANBMkiF9AC4Jf
	 ZLcfKSqtc1vfxFIbhLNSS2qzSHR0C0oqVBrc0eXCzLWhrC8Jgb2aRX5m3en4CdSnba
	 s1Rs1O53zHCxUw6LltIS3sFd7ac6JMLhPRPJ5bvAlFBc7fsbLWpYd2uA/+VmirUrzX
	 1V7BxHwHqsMaWwWQwXOXIhEWGXfDf5SLTYzQBY99xV1+bgVdsaOvIx7Gdec2FAYg7h
	 gX5ND4dpPxoPQ==
Date: Mon, 1 Sep 2025 09:45:44 -0700
From: Kees Cook <kees@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <202509010944.CAAFB2ED22@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <a123ab8b-a335-48a1-9ac3-e3b348d78cd1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a123ab8b-a335-48a1-9ac3-e3b348d78cd1@infradead.org>

On Mon, Sep 01, 2025 at 09:39:46AM -0700, Randy Dunlap wrote:
> Are you (implicitly?) saying that all previous attempts at transitional
> kconfig symbols have failed?  If so, I just wasn't aware of that.

I haven't found any way to do a "proper" CONFIG transition. I looked
through past transitions and they all left stuff visible. Is there a way
to actually do this with existing kconfig?

-- 
Kees Cook

