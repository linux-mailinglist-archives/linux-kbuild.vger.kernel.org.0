Return-Path: <linux-kbuild+bounces-8697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B6B42CCC
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 00:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58C1B7B2940
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 22:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62C41FBC92;
	Wed,  3 Sep 2025 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR/BOXqb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA06833E7;
	Wed,  3 Sep 2025 22:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756938695; cv=none; b=WGzISDcpHP1PPZ9qIfreQqbaBd1clT6Mr1snqvC5Nt7+1WTi8EOQ7x0Ke4DHusP5dVnbrGQ+UOMiKdfAyCFR3J1/sUqWeh/+msBOUyjCT4QdFY/pshu91l08TcQozzTPjUtsJc+wCa+Odp2R0APPCp+oTc9/C+lWlvancptnPgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756938695; c=relaxed/simple;
	bh=hMTWPV4vXxy0kK4lIqRCMYJrOMWekCx6wvmJsNUebX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDZ8Vh/w2opIYrZiOV8bSgnIEEhqpLPMAxTE0vyYsCN51zKTHbnMBRebgA3pUFFFW0afynRPb12lZjEUTExl7wxOL8Nq7XgVUAIJA1vkxoi26nAvhlqVTBmVWKPTPfyQAekN7OWhKE/u+cKa4ucx/PCD1QlcDPdSdGJ8miHaabE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR/BOXqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070E6C4CEE7;
	Wed,  3 Sep 2025 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756938695;
	bh=hMTWPV4vXxy0kK4lIqRCMYJrOMWekCx6wvmJsNUebX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YR/BOXqbiVd9qwtFUJHp6EHi7oJ0V2ClNGiuiKaKyfS/exYtM1wCNIZbOGb95TZep
	 RtbLgxmvtQnuXFY+UGF8JEjCqrlNW3VpY75KUGkXTV3pS45956dxvL3/ABLoDmNemj
	 n9s2LUVts1BImtEjo0RraGU2BY3Z7CZCwiO4ZBWwguNfZrQujdPVVVQvfU9WcFEz+i
	 qqr9oESaKpEWuTVJtnVrVS28wQjBOyYd21yR3swT2NzOKw7DM2dEc0uEWhSM/3PM/2
	 Oy30NJab6YCgQ1UGT5v1B1E6PUmY1MAeaTz+D7lU/ZNRJVqdXJc6trMUJjG4x/g1Vj
	 Ethx80ten+2XA==
Date: Wed, 3 Sep 2025 15:31:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250903223131.GA2264021@ax162>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>

On Mon, Sep 01, 2025 at 11:51:03AM +0200, Thomas Weißschuh wrote:
> Exactly. The normal cases can be handled generically. For example the kconfig
> below works for architectures which only differ in byte order and 32bit/64bit,
> which are most of them. MIPS should require more logic.
> Also I'm ignoring x32, as it is never the kernel's native ABI.
> 
>  config CC_CAN_LINK
>         bool
> +       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> +       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
>         default $(cc_can_link_user,$(m64-flag)) if 64BIT
> +       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> +       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
>         default $(cc_can_link_user,$(m32-flag))
> 
> 
> > Feels like that could get complicated quickly but this would probably be
> > the objectively most robust and "hands off" option.
> 
> Agreed.

Nicolas might feel differently but this does not seem terrible to me,
especially with a macro to wrap the common logic, which is where I felt
like things could get unwieldy. Feel free to send an RFC if it is not
too much work.

Cheers,
Nathan

