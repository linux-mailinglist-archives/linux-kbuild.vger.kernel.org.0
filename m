Return-Path: <linux-kbuild+bounces-6021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA338A57C28
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EAEF16E460
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E8D1E834F;
	Sat,  8 Mar 2025 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fSueElyy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B493D1E8344;
	Sat,  8 Mar 2025 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741452607; cv=none; b=DJmLLL6E8GipaDojlBSD2Cbb7Abj+ylwCUxzfORj1hZi2YzgCnTq0JtrLdAUGm9gxcrf3fFIgVvRQ9BniqMAwb4MYIxu2PTdJwabh8EukcUO7fbyvxj0hQIy+Job65Zk0co+P0JDtMnyq2tBxgTd+a09mOA8+WAt+z6llPqMZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741452607; c=relaxed/simple;
	bh=q5ToWsqwfUJVfGtsOnAxosRif4Zfret3ISIx6DxbI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyuYGsbwae8TSdpN8u5LUx6k0tyh1LTDevmwuMkOvaOb5uK+x7GKPnaDvDHuSlqV8o2ZkENdHZfv669j2jDYGMifvfK7rkr6+nLaIeL/ITFmLCKUNfxHxT/x7UQsI8j14oIMnf3scvN9zpZTjqQop1MO0dNnAvl2hy/SuiKJfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fSueElyy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DF33F40E0202;
	Sat,  8 Mar 2025 16:49:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id S-T5ad5jWdO2; Sat,  8 Mar 2025 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741452593; bh=arEv/Pd18rGteBgIYsKtY/Bv9Ca+WV87XA2nz4xo1rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSueElyy9h5oZMBGqN2Lxiizg7wnOEEyoy+4HJlPDL2FGLcyUqnB5gB1xbrsPUwNY
	 yIG9SWGJ/bqSdPBoa0RC9lKTpMAuGOh9ZSuFxSSX+dyADDtD01WNyKJ64x3eoJiTCd
	 XzsjkKe+k4Lx2TKSWIhQkdjoA0qXwSUDWqSjUPAqS+UL83dO6Kh7/M05RtK1yLAaMp
	 Pmch6pUwDtaAKC+vNqqry1THS6agl8vVva6cuGj3mCotK0G/cbBvCQvCRS2Sl8sV4I
	 TfiAC63FHKodF1uBqb9noIb19nqFgMySGn+j+KTeSUaDWBKYqMQXnIgw+IR0+dFkXu
	 fyu9IVKDWsQCTE4DT2FDIQxuH3XrjqWqA5dzhEH445lXeod6vCs1rjX/jmIBq7zMZ6
	 T9hc7HEnTWKA6V2bENsS67VXhdKF0SNUmUMcCcASb/Mu43xp66OY0EnNcxWCWODOGR
	 wV1dDk7nWE5qnt624uh3PQt0VxodBqPV7dyWstiFmjeY/WD3I7tah7k20VjzxLLL6s
	 B4v1zFZbs+dWMapQL3LV9uOcG8Y9LWRsUAmrpx7DQEEIxXIYtyPKTLNq7RhpIfPd0V
	 BJ3XZ3FLqNaOD8jsMhRgucMicT9UNYuJbCsQZIGQ5TbKd7P0BxJYMSCvuKXm+weJIc
	 mIxQA72ziacCt+0Kx5iG5PVk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B7CF440E016E;
	Sat,  8 Mar 2025 16:49:45 +0000 (UTC)
Date: Sat, 8 Mar 2025 17:49:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
Message-ID: <20250308164944.GGZ8x1KPX1-NfFaF5B@fat_crate.local>
References: <20250308040451.585561-1-xin@zytor.com>
 <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <FAE530F5-B657-4C72-8D69-7ABA2D3209A9@zytor.com>
 <20250308164151.GFZ8xzTwiNd1JVcMHT@fat_crate.local>
 <DC1CB322-2527-4F6A-8EC4-A76DD35CB564@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DC1CB322-2527-4F6A-8EC4-A76DD35CB564@zytor.com>

On Sat, Mar 08, 2025 at 08:47:44AM -0800, H. Peter Anvin wrote:
> That's not the only one. Point being that users have been using it so it is
> better to make it official than breaking it.

Yap, it ain't internal anymore - that's for sure.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

