Return-Path: <linux-kbuild+bounces-3738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6589863DE
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BCAFB36B92
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 14:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCAF18BBB5;
	Wed, 25 Sep 2024 14:27:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B918C035;
	Wed, 25 Sep 2024 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274471; cv=none; b=FgZA1io/ko1b+kVbbFE9O1ILtr1cnOno93ebmrDFOwJASm6WfSZearDkBY5xFtmEQZaKH8l1PJX/NHoHx1QxoK/eVqyytHitJjdlliwR/pN5uFJ8050yWMGGxZfKOMT8xTqzWimzVIOUwrzJ/zPHHkBGWq9g1wh9oPf8Efrl6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274471; c=relaxed/simple;
	bh=mUxmp6pS030FwiIuiI2HiGy+8Q/aDMn1JaNl9ZdvHiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1IWJ5Rm7wlH5OIM4fNzZ8F2Sl4ViTSPlqIg3EZpC6HWd58D+lN+IDmZYwkNBpftz0qatu+itCsntGMO2QpxuDIGbrj1jY3ejja/uh3kEERjcct7MHccsOdkQ1TgPci2DcJRPwOk/3ITaFMdVyc4bvZtfjSdUBiP35izYy3kUz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=fail smtp.mailfrom=fjasle.eu; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fjasle.eu
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Sep 2024 16:27:34 +0200 (CEST)
Received: from l-nschier-nb (unknown [61.8.139.63])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 27D5980574;
	Wed, 25 Sep 2024 16:27:34 +0200 (CEST)
Date: Wed, 25 Sep 2024 16:27:32 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 13/23] kbuild: replace two $(abs_objtree) with $(CURDIR)
 in top Makefile
Message-ID: <ZvQd1I-nyxZGAsIb@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-14-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-14-masahiroy@kernel.org>
X-purgate-ID: 149429::1727274454-DE51000A-01C0B600/0/0
X-purgate-type: clean
X-purgate-size: 1105
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:41PM +0900, Masahiro Yamada wrote:
> Kbuild changes the working directory until it matches $(abs_objtree).
> 
> When $(need-sub-make) is empty, $(abs_objtree) is the same as $(CURDIR).
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5700d08c9b57..ee9ad0f0960f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -228,12 +228,12 @@ else # need-sub-make
>  
>  # We process the rest of the Makefile if this is the final invocation of make
>  
> -ifeq ($(abs_srctree),$(abs_objtree))
> +ifeq ($(abs_srctree),$(CURDIR))
>          # building in the source tree
>          srctree := .
>  	building_out_of_srctree :=
>  else
> -        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
> +        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
>                  # building in a subdirectory of the source tree
>                  srctree := ..
>          else
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>

