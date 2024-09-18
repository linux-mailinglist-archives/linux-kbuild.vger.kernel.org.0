Return-Path: <linux-kbuild+bounces-3614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7FD97BEB8
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 17:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786EF1F226FD
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 15:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152FA1BD4E2;
	Wed, 18 Sep 2024 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="A0zt469j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD361C68AC;
	Wed, 18 Sep 2024 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726673903; cv=none; b=E6SKR9uc0b5KaMYDvtSPFbNvlFxg6BlkfYF16QqkxRwSkLItzA1P5Bb37+gDjMAd9RliG7RDdLfth0BPUnQ28t0c2cdhLMAprqbzkDR2kv1+FXEguaSnMpOFaokD2YHTD0+aOgaCSJ81TswQEihklvTAlzofEgAceY62ZjHr7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726673903; c=relaxed/simple;
	bh=Izf5Vr6HYo+EPAfZKMRGSdrg3y4ilzHZNMcIp0W7g2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHmpQgYRZe3FL0mZQXEnz0v+EGEReJo7VqnbtwIkDnQbyTzjkFcx71fluyH2TgZE/imocE223mvDCu3mm+KEjogFoH2Gn1XMRoCnFF9JYWqzu8w6oC/Ak9SCjRWXNZ8C89rvnCRfMm50fvtN4pnUen6KoNEy8e5PP+Dm3XNoW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=A0zt469j; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726673891; bh=Izf5Vr6HYo+EPAfZKMRGSdrg3y4ilzHZNMcIp0W7g2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0zt469jozDsCkSJsR8R7m01k10xZBc46DREvDk9/2z24fvpTfdq7pRNmNkiQmoBK
	 nSg613pzCDxq0JcpFzn2ElQWw+J9ZITj2OlQef9bWl+so3GcftOWhRHb+ZFbnFdLUK
	 RWQsnIBBgSqG+Nh6IRivfZZwdiezWEh9fJL6vHf8=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 17:38:11 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id AFBE6803A2;
	Wed, 18 Sep 2024 17:38:10 +0200 (CEST)
Date: Wed, 18 Sep 2024 17:38:09 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 03/23] kbuild: doc: remove outdated description of the
 limitation on -I usage
Message-ID: <Zurz4XEmiv6OcH3w@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-4-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-4-masahiroy@kernel.org>
X-purgate-ID: 149429::1726673891-4B6FE2FF-B9C8EBCA/0/0
X-purgate-type: clean
X-purgate-size: 545
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:31PM +0900, Masahiro Yamada wrote:
> Kbuild used to manipulate header search paths, enforcing the odd
> limitation of "no space after -I".
> 
> Commit cdd750bfb1f7 ("kbuild: remove 'addtree' and 'flags' magic for
> header search paths") stopped doing that. This limitation no longer
> exists. Instead, you need to accurately specify the header search path.
> (In this case, $(src)/include)
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <n.schier@avm.de>

