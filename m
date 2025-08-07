Return-Path: <linux-kbuild+bounces-8317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4647B1DF32
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Aug 2025 00:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D365627767
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 22:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243D224A049;
	Thu,  7 Aug 2025 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4CjexnF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2A233D7C;
	Thu,  7 Aug 2025 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754604025; cv=none; b=G8XAvg5iFNRhKwWVAydVOpMjasiL3JT3elSLTB5lqvuxJf1X/LOZ9op7DfLuHp9lDPYVWlybQpo1BcRfvQyFoCdbXu4FIKVS91mGb5JV/w6AorI3SUbtna51h2uvfAKeQyru8ks3kyVD+6wEH9kpu2PR0eHpIVH/DAHRrN9gMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754604025; c=relaxed/simple;
	bh=Ut11L6heyBfAU0NJL1jWvWVqaogbRscBzHfDu0x35y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfzZairwd+UBIQk7sQlEGlnGWusp/Tuq6FR0yGgleKAocorKVNcWo9ofucCuQEN9AFDY1/Any/opcmOo4iFiXcwhdC9n59V6WVCErpTYdijMmUXHGorHjuapIGw2d6BG7r+6Bo+nveah26rCNaFIRkGdcHI0Ur2u0oQl7PLjpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4CjexnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC090C4CEEB;
	Thu,  7 Aug 2025 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754604024;
	bh=Ut11L6heyBfAU0NJL1jWvWVqaogbRscBzHfDu0x35y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4CjexnFfl1SKDaqHcwlLYBiqOoF17E7SVN4eKLjILTgky9RlB5zEGjCp+IWZD81D
	 U4QvhOAH8B16tSXTN8JidSqr+wvTT9hoCJc7xiI7YL3xV5o6VsVhTAI7EF+bM3Qo+Q
	 Rd38rgumucKitr6yqc2iGrkalY3CRDukDRamIQF2aSwcwv0IgSpLSBzrIp9HiVmdwy
	 2wbpG0XymeEydaH7YLrkGEEViAt0tbIn+6nCQJoM3iA7bCQ2HgZUshDeor2Dj27RAa
	 rGm+zvg1WzUolMZtVkquu6uF2VnVnZxUnTT8j2X5bTMnZh4nAtzqtSRvc7RRiMuTTO
	 Hehc1Jk7yOlrQ==
Date: Thu, 7 Aug 2025 15:00:24 -0700
From: Kees Cook <kees@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <202508071458.A97B471@keescook>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
 <20250805214823.GB200407@ax162>
 <546c9819-20e7-4474-9281-5d1567263637@intel.com>
 <202508061158.49E749B46@keescook>
 <a01cb1af-8f17-42c0-815c-f9c44a399cbf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a01cb1af-8f17-42c0-815c-f9c44a399cbf@intel.com>

On Thu, Aug 07, 2025 at 03:31:05PM +0200, Alexander Lobakin wrote:
> Sure, lots of drivers uses normal string copy functions etc.
> But Ethtool strings *must* be NUL-terminated, so this fixed-size +
> memcpy() only hurts.

This is the misunderstanding: they're only NUL padded, but not strictly
NUL terminated. You can see ethtool itself has to be careful with the
strings, limiting the fprintf to their sizeof():

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/ethtool.c#n1013

or using strncmp everywhere.

-- 
Kees Cook

