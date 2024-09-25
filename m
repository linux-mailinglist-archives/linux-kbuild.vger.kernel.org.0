Return-Path: <linux-kbuild+bounces-3735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD1986145
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 16:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6B81C26BBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 14:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435B9191F87;
	Wed, 25 Sep 2024 14:05:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642471B374F;
	Wed, 25 Sep 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727273112; cv=none; b=Eh4TCJWsJ1SfWhje9znOZy1E3p/POcRj9prnsPpZadHKEzFHsfzFXdxbv2ylURczYG/IuEGRNa4B/JyPklAN8rpcIYugBevWj1PfLF6FTJOl4NnBU+YMR073XzCtcaIA38AfSH0WERLJcfzy3TcFVjYPx1wMC/aJYbKUJP+f250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727273112; c=relaxed/simple;
	bh=hVcsjbCXGSrM5YivSiFQQKpyz1XYcihBNH9PdAo7ZRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSRDF+tjB9vcDQfJ++97BRPEgShm4W+f4QPvOHXEHF3nAQKTe9o5ceG4T+wc8QGaIjkgeQyAPhRqcBvMLgQ2DY9tVcDWm9mDi/ClsZroCgvnqj1AGMFllNpMVJWhMURRjyh5srVZRggVHp1okWiStToS/hZkAn5L87tGaPMgz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=fail smtp.mailfrom=fjasle.eu; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fjasle.eu
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Sep 2024 16:04:47 +0200 (CEST)
Received: from l-nschier-nb (unknown [61.8.139.63])
	by mail-auth.avm.de (Postfix) with ESMTPSA id D9CC2808C8;
	Wed, 25 Sep 2024 16:04:46 +0200 (CEST)
Date: Wed, 25 Sep 2024 16:04:45 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 10/23] kbuild: refactor the check for missing config files
Message-ID: <ZvQYfTgmmQXwr9Rw@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-11-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-11-masahiroy@kernel.org>
X-purgate-ID: 149429::1727273087-2AA9600A-923F287A/0/0
X-purgate-type: clean
X-purgate-size: 981
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:38PM +0900, Masahiro Yamada wrote:
> This commit refactors the check for missing configuration files, making
> it easier to add more files to the list.
> 
> The format of the error message has been slightly changed, as follows:
> 
> [Before]
> 
>     ERROR: Kernel configuration is invalid.
>            include/generated/autoconf.h or include/config/auto.conf are missing.
>            Run 'make oldconfig && make prepare' on kernel src to fix it.
> 
> [After]
> 
>   ***
>   ***  ERROR: Kernel configuration is invalid. The following files are missing:
>   ***    - include/generated/autoconf.h
>   ***    - include/config/auto.conf
>   ***  Run "make oldconfig && make prepare" on kernel source to fix it.
>   ***
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

