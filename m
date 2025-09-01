Return-Path: <linux-kbuild+bounces-8682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E82B3ECA0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82701481579
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 16:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE50306489;
	Mon,  1 Sep 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOiP5G9m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203F2EF66A;
	Mon,  1 Sep 2025 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745334; cv=none; b=N1gPaP7SYjNvON4uf3IvPIhoByCtnlGujsxipVVuCSbYw0f/xifEr8d6sRCdqIHMo2WfKwmW/J4Bku2Gkc4NfavZr0ri+nRaMFzkbl8TBbw5VD7i/cDGNgJ8YFJF0yJCr+vJbvlX9lkqA/Q2HNak1TgOKGhtmijHXawc+X/oo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745334; c=relaxed/simple;
	bh=npiCjXJvWwrONV5808iUFIV/5RdHhnOxIdCK+bUrDhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL6Cn5LCzFVVGosufkYjixRQf5Dl24ahOd59SaxTGpwA8W4ERte8No9XJmYgm0eZWcZbRKcedN7kqe9bImikVgmss/m+bMGEdxUsDwotZ9kCAhnbOfZZhHcEfRo584TkPytoZpVu7dpegGNNmhlB8ZMa15kjtEqFstnG+6OYEAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOiP5G9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB79C4CEF1;
	Mon,  1 Sep 2025 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756745334;
	bh=npiCjXJvWwrONV5808iUFIV/5RdHhnOxIdCK+bUrDhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOiP5G9mcW5YrbNZW9hAkVVXRXYQ6JzkWmPyZOMvn89GSNQifGyPW04tmZ83dhfW/
	 iJkGyvcm+QyM2Q5XNe+OHDhXC2ugNaG3uUdP68Ru/WtugN3X4vdphCOA2AhE6jdUA/
	 +I6cH6UdMU+K+upzsk+2SOKSh0uSqDQcbFX4YtA5Zj29Zw2ZRy2jS2NftYpSlYqY1r
	 XZ0uYPwxEOe27gUdREZDkZYjOgc0LBGKxN63okG6CoE2WFgojR0/5X0rdxWOFTxhUM
	 fF2Txfxe3/YgPfQWOQwkng0x75qeWpgARJlFBiiRm5eLAFlR2ZPr4OrJhDS3NEpak9
	 yF8OlxTYFJAoQ==
Date: Mon, 1 Sep 2025 09:48:54 -0700
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Message-ID: <202509010945.D266C0E6@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <7bca36d46dab04667aa595623fd0966385ee4658@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bca36d46dab04667aa595623fd0966385ee4658@intel.com>

On Mon, Sep 01, 2025 at 12:09:14PM +0300, Jani Nikula wrote:
> On Fri, 29 Aug 2025, Kees Cook <kees@kernel.org> wrote:
> > The transitional syntax requires a type argument and prevents type
> > redefinition:
> >
> >     config OLD_OPTION
> >         transitional bool
> >         help
> >           Transitional config for OLD_OPTION migration.
> 
> How long do you think we'll need to keep the transitional config options
> around? Forever?

As with the "manual" transitions, it'd probably be until the next LTS is
released.

-- 
Kees Cook

