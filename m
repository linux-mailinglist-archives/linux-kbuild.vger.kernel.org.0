Return-Path: <linux-kbuild+bounces-7252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FADAC2D11
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 04:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44A847A3EB9
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 02:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242B718DB0E;
	Sat, 24 May 2025 02:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VDJAqXfw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55537EC2;
	Sat, 24 May 2025 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748052827; cv=none; b=QhFSrLPu20WaKUQTg8rNrZ91I9ngYMkD8Q1BOVutaJNXT9qTmNmCX5S9415BJS6Mkp0fifkWVCU8ZldDeMHNkhG3KDj4NWOaImpefuLr+MgxVocs5Th/M1xpFuWJH+YQyxeWBBhOGQ8upqBwRRCllfyxjCkiCao1yCnEPfoYZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748052827; c=relaxed/simple;
	bh=PwJuWVVGmBhuMLAynLyoPsqiCGRLPPTVukNOHqHOKto=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fOq1mGA/deH6rm8oWxDUJ1W+XQxArcnF2tDBC2jggX6alj5pYTon14WuT2rN3fEUTXV9C6cN2iCJOEnMII0dzJNLJwMh6TqHT/H5evbbzakDmo8AExubmKJXG6aL+CnyvHcF4mdlgirlbKiPgNLQBXPa8tVwLd4RZM8tqhXHoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VDJAqXfw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=EMx/Xp1em7h7p54tmhwcCirY7ORXaDEXFVF3WztxCag=; b=VDJAqXfwcJmSWyLqvD6MyKJ2NP
	SEABbcjCbGoiGMD5vLHENpte4asOkntA4UbZcOImnbYHMgfppphbay0RLjCu441u98TPqdcpHEIie
	q4U+9p9NN9+jTyY7NjcM9hraiJ9uJU0ecKgBYtK9kguROaSVepb1d7NZ5gqaIOo2yjaiZAVqSqZaN
	xSYx/J+oHjNudgYWNYYD95bVhELBAKA0R0EC1Bi7wbKYd+fNOtmbkRwHDopzkSgSCgmCAUikReA7f
	w5v/fDirG5uB9ZfOPgU9W8CvCYHE7VHyPeHrnkhrEB2I0KeWH3O7ppYdeld4geC8nZKEg7y/krU2e
	+WbFr4lw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIeOA-00000001OmD-46vX;
	Sat, 24 May 2025 02:13:41 +0000
Message-ID: <0a3516e2-2bab-4eff-a16d-7e4bc4799580@infradead.org>
Date: Fri, 23 May 2025 19:13:27 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: check for a NULL pointer before access
To: Bill Wendling <isanbard@gmail.com>, Bill Wendling <morbo@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
 <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bill,

On 5/23/25 5:49 PM, Bill Wendling wrote:
> The call to 'prop_get_symbol' may return NULL in some cases. The if-then
> statement accesses the returned value without cheecking if it's
> non-NULL. After inlining, the compiler may treat the conditional as
> 'undefined behavior', which the compiler may take the opportunity to do
> whatever it wants with the UB path. This patch simply adds a check to
> ensure that 'def_sym' is non-NULL to avoid this behavior.
> 
> Signed-off-by: Bill Wendling <isanbard@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

although see whitespace issue below...


> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> v3:
>  - Fix whitespace for real now.
>  - Patch from another email account so that the whitespace is retained.
> v2:
>  - Fix whitespace
> ---
>  scripts/kconfig/symbol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index d57f8cbba291..9c5068225328 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
>          if (prop->visible.tri == no)
>              continue;
>          def_sym = prop_get_symbol(prop);
> -        if (def_sym->visible != no)
> +        if (def_sym && def_sym->visible != no)
>              return def_sym;
>      }
> 

All of these lines are still indented incorrectly in what I received,
so I downloaded the patch from
https://lore.kernel.org/linux-kbuild/27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com/raw

Running 'patch' (not git) on it gives me:
checking file scripts/kconfig/symbol.c
Hunk #1 FAILED at 272.
1 out of 1 hunk FAILED
done

In looking at the raw patch (link above), the non -/+ lines have
an extra space at the beginning of each line (2 spaces instead of 1).
If I remove one of those spaces, the patch applies cleanly.
Or maybe I could just tell 'patch' to ignore whitespace. Yes, that
also works.

-- 
~Randy

