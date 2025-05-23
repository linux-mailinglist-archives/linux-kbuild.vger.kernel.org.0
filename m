Return-Path: <linux-kbuild+bounces-7224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFEAC18F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 02:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019C77A82ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 00:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F98B191F98;
	Fri, 23 May 2025 00:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kfkj+bO5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF621EB189;
	Fri, 23 May 2025 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959400; cv=none; b=hDwdLRnlmDiJj4OfWVRBCUM9VlVzfKPx1xjWVboXCgAV6jGCFJa/d1loSKQQWxcurRz1pJocHi8dWunCiYJC6BW6OCSs3iIKTISoMq80Un86Omzxog3RZwa5Pr9QKbQaQ4VicNWNgsltJKXDEbRXqpK0rSiq80oj0yyOcMMeMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959400; c=relaxed/simple;
	bh=9FXf+5Bg9DCcJdxZ5UW3bFTgpoUyezv0+BRC+1xtMaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gKCAr9H3oMxfT1XjhhtpsScdJFd3xEoWwzElFxOihqwV/kXfA2pcL92wRjicAW17/2uZO5uBWCdNyc6d0X1YMD4xvlWYzBulwob4O0gLrxexmbbf/wemSOkTZJk6NkcrUB31ATDB/QkvTcgBrBIz3mhqf4xA5LnSgoHMn0ajJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kfkj+bO5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=dKoLH3isPuyrFMDefzFUlZgw+br0x7/bSLT5gDgsKqc=; b=Kfkj+bO5RjBH1FiEvNjWAC04XJ
	sQzdimQnfZuOIp5RVSJbuP9bTCdWbXhhDhf6ybAtT5gIlfPtooaHLcGqGZxpD4OrZOYRMY237qSPp
	vMeL9Jo7N/oMgvaifcRQBSsPRgokmNNqYmj26bdnO3OSF0xvwMZzEMP+uH5rfi+UbRcTJq5F1vAup
	8vbhvZVvwQzBS2qsQpNH4emIR/RhRMuHBW2PcI5tT1+yQTdwVuogtjD74b25GmP/MFCFqNrILka0d
	fzEZrn5v852+fbJqEq/yGfgxZZgWEVW0Fgt+/mPSduY3KBFKr+RRBkJdgo66iEZSN0RnwOPlCLACM
	4diT32Sg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIG5R-000000016n1-0rfy;
	Fri, 23 May 2025 00:16:35 +0000
Message-ID: <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
Date: Thu, 22 May 2025 17:16:29 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Bill Wendling <morbo@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/25 5:07 PM, Bill Wendling wrote:
> The call to 'prop_get_symbol' may return NULL in some cases. The if-then
> statement accesses the returned value without checking if it's
> non-NULL. After inlining, the compiler may treat the conditional as
> 'undefined behavior', which the compiler may take the opportunity to do
> whatever it wants with the UB path. This patch simply adds a check to
> ensure that 'def_sym' is non-NULL to avoid this behavior.
> 
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  scripts/kconfig/symbol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index d57f8cbba291..9c5068225328 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
>   if (prop->visible.tri == no)
>   continue;
>   def_sym = prop_get_symbol(prop);
> - if (def_sym->visible != no)
> + if (def_sym && def_sym->visible != no)
>   return def_sym;
>   }
> 

The patch is missing the source file's indentation.
(spaces/tabs are lost)

-- 
~Randy


