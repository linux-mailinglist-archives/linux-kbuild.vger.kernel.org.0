Return-Path: <linux-kbuild+bounces-8938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CCB97950
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 23:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137C94A25A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 21:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED55309EF9;
	Tue, 23 Sep 2025 21:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi3ruYtq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A892259C92;
	Tue, 23 Sep 2025 21:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758663371; cv=none; b=A+CZEenoDdmH+3vakS6TUXoRqmsUHa8h+hkCsM4VL+wBdl3Eb+qKGLi4tW429vjm6DLHp2hayQn9GVd3VdCx9DLjWHZpnz71Ro9MECAYSFwqN3a+6BLTqpftuBV6Ed1Dv2AKjk7IHzxMnQGorWBU/yE9F6wWmbmAorZf9R0MfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758663371; c=relaxed/simple;
	bh=re5d2GljFifEB9uiuOTiE2PVqVs8Tx9t8po0nVrChRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXGuMX9AHog7fTIIeuEciRdvR1yFhtRxrAE3sX/FxdAXoV85Zv54gtIn5h2VB7pvMbCsBsV+ZFNssRC3Rs6jsnwQuzcEDIOhh7JuHyQ4Harsd8Uw24r5yQ6gZUY+pLJJOaX/9YfC1qgYjTeEx4hw5A+WTAEImHoCwJX6FlWOquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi3ruYtq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32213C4CEF5;
	Tue, 23 Sep 2025 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663371;
	bh=re5d2GljFifEB9uiuOTiE2PVqVs8Tx9t8po0nVrChRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi3ruYtq47Xw4moUS5CkVWFyq55PAfFZ9zE4eiLC3+nV3NbQZ/k9YcmTL4fY3ei72
	 olAWLEE6oCfPKSOhuXNNOmLjwOlnna5ZCQmQ04VmlKuULHoWP/z4CTonPEC1svY/XK
	 fZPLu0toyWQEvsYR/Nli2NyMB67SVWHgZVQ+/+dUFOHEeP382WoWZwNLFxRqEn3Eke
	 gi9LcbyZqoIEsehqyFMCleVh3DGTlBwmx1drjOGe4uMoyCT5OmdDAFVqQTSfNGs5+K
	 uKiac9tJpCzqeLt8OW0+mXbKKaLKNYBXBnbKNxPgFyP1NMfYKMh29N/Y9Yn0BHhCeR
	 0dOp/P7/uJXng==
Date: Tue, 23 Sep 2025 14:36:10 -0700
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
Message-ID: <202509231435.4FF2032CE@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
 <202509031949.375138FB13@keescook>
 <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
 <202509050921.2398728EE2@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509050921.2398728EE2@keescook>

On Fri, Sep 05, 2025 at 09:23:55AM -0700, Kees Cook wrote:
> I'll give it a spin!

*one month later*

I've v3 now with your implementation and lots of selftests. :)

-Kees

-- 
Kees Cook

