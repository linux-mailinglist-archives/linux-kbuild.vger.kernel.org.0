Return-Path: <linux-kbuild+bounces-3620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97D97C890
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 13:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 557ABB218CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 11:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CCC19D08C;
	Thu, 19 Sep 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="r96+QYm+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57419DF52;
	Thu, 19 Sep 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726744934; cv=none; b=H8ZP3+L+yVg2oMCzR1vPSM5xScpDGdmh2bcv9rNAd1IZMf8TllKQeb8ziEBKFG2SUBjwLD8UeJCPRqh9MtrEQ9o1aXVVdWtrtdQ8LtzWOdTVmYt/O/Vs8bBpfXQIQwFaYpMtYSCRA7qzLT5RHCbxSKpm1w26PKVkrU5jiYZcDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726744934; c=relaxed/simple;
	bh=zWViXxK0wNFtfcGJA6a6ASJSdbR2n2+FNmKkYGsVlcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2c1fSxIzQqFaVkLAkOFBkmjUbgAi6GT4NIElfGyx5oZzJZaxLgTkK+rWzH9laDu53Xi2cF4rLpkwG3SHFc3wGo6EScZo4Ja4/LwE0dZE3UGvLX913ElJ0TSrRY0uReemDaeIlNXCiMMXVamcaFMsg0eO+aB2F/rvL/fZ9lt8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=r96+QYm+; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726744930; bh=zWViXxK0wNFtfcGJA6a6ASJSdbR2n2+FNmKkYGsVlcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r96+QYm+o8ZU+/NV9enz4+uMOCVnakLiXkirV7TSs1nI2yzW/3vnjyoTkfKTKF6D/
	 CR6Ba3F7hEegoISH79RlJ+NLLEsGQi/oEwp8hIKaej89SBqkQtGYYBAF4BgscPvzyJ
	 uE7SH/ROy/4Vyb4lQ31a56kfIjn2+S+0eNvWYMWE=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 19 Sep 2024 13:22:10 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 2941080719;
	Thu, 19 Sep 2024 13:22:10 +0200 (CEST)
Date: Thu, 19 Sep 2024 13:22:08 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 06/23] kbuild: doc: replace "gcc" in external module
 description
Message-ID: <ZuwJYDK3BLWzdyWm@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-7-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-7-masahiroy@kernel.org>
X-purgate-ID: 149429::1726744930-E051400A-5D751766/0/0
X-purgate-type: clean
X-purgate-size: 355
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:34PM +0900, Masahiro Yamada wrote:
> Avoid "gcc" since it is not the only compiler supported by Kbuild.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/modules.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

