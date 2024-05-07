Return-Path: <linux-kbuild+bounces-1798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE88BDED4
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 11:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA711F22218
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C84215B991;
	Tue,  7 May 2024 09:43:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615018821;
	Tue,  7 May 2024 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074999; cv=none; b=GnB3Br1LPqkLPyjvhLiAoOaXj7fbM7XS+MqvqgiK8GjDOxeDEazajnFRsh1a9VE04b23h4akltZtUKqKmrFac1uQYKv0+de+igshhuuQkj2I7h/1YZ4dpydnUeOSmXtHZUxUjpoqst8SJio3r6n4rOsj3TYT14qgLztFZ0i/M7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074999; c=relaxed/simple;
	bh=AyIeyy4Y/0cN0CMD93LR0lvMMoCUzrM2+LTpR3EBJr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSFVoGp/stz9BgihghJGCxrskHg5nWZ7ZZVnKJ9ODy4d9ccPnRUos+YEiMey9h3mb2jGqxf26zd7KJom1gj+HiJpE7sCJaboEJr63YilOX3ApIy8N72fwuXeV5Ku4to+2acPoTjf1fQvJlLmEhHAs4k3TlOEQD89DDTqOdxPtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 11:43:10 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 18E0C802BF;
	Tue,  7 May 2024 11:43:10 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 0E361180D04; Tue,  7 May 2024 11:43:10 +0200 (CEST)
Date: Tue, 7 May 2024 11:43:10 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] kbuild: remove redundant $(wildcard ) for rm-files
Message-ID: <Zjn3rg9YhdDmkySV@buildd.core.avm.de>
References: <20240427153253.2809911-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427153253.2809911-1-masahiroy@kernel.org>
X-purgate-ID: 149429::1715074990-91D892A6-4B84E111/0/0
X-purgate-type: clean
X-purgate-size: 801
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sun, Apr 28, 2024 at 12:32:52AM +0900, Masahiro Yamada wrote:
> The $(wildcard ) is called in quiet_cmd_rmfiles.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index a1c19979e13e..62557fabfee5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1512,7 +1512,7 @@ clean: archclean vmlinuxclean resolve_btfids_clean
>  
>  # mrproper - Delete all generated files, including .config
>  #
> -mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
> +mrproper: rm-files := $(MRPROPER_FILES)
>  mrproper-dirs      := $(addprefix _mrproper_,scripts)
>  
>  PHONY += $(mrproper-dirs) mrproper
> -- 
> 2.40.1
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>

