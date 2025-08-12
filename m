Return-Path: <linux-kbuild+bounces-8389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F7B2235A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 11:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9A91881C5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86272E88B7;
	Tue, 12 Aug 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fWuAaAd/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991402E8897
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Aug 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991489; cv=none; b=PU5/kFcMFxgpmu7eLb2boaR6rAV9lciWSuOvTsre79R+cgo2buAGeomRbP9zZ7vnvQ15AnZkl+bg0l1C89e/PtF+R75M6sEe2FMnKpMNMifTubehY/FL+G1IDxPRVIgJDI8rpGvoViuQGCPNX0XZvLbPKIXUVzhynsyKXNO63nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991489; c=relaxed/simple;
	bh=Jtp2Mg1cguvYiGrVtvKTRauz0brp+m7pNJYTlViXvB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+ly8dt0h1np6gyVXEtLkoDRZxUtyyqmr9VvgLlCHWI9Va7SMW8gyqElaO/0Eb9E8aKNANrpSbX6jCYqt+sxk8o1eR+/DktxygeARC/sB9h5jlvI+mJk+cHbG5XMCYkTBAKxic1KYwtLRv7iDiX6d2ZytlhyX41DklV3/CpWbq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fWuAaAd/; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 12 Aug 2025 11:37:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754991483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsysw6+E7A1YO35Mzb5ehM4c5NgQXumblCmXhLIAB6M=;
	b=fWuAaAd/xp7y/lGL5aWwMcU6Yz0duSRxey8jr9Is3nSU5h1ruLz0X7ahXwMMnxkno+5wJf
	FVgUN3sLUYXSPDM78FViNZ2RdNLa5nDwmdvzix8amROInqarZqOGGh9NRShzJz0LFS/RYR
	3o8WVf9r0IHH733IvhDABVyRDwHYwCg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "longguang.yue" <bigclouds@163.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, masahiroy@kernel.org
Subject: Re: [PATCH] Makefile: mrproper deletes signing_key.x509
Message-ID: <20250812-calm-agile-junglefowl-dbffba@l-nschier-aarch64>
References: <20250812022429.52674-1-bigclouds@163.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812022429.52674-1-bigclouds@163.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Tue, Aug 12, 2025 at 10:24:29AM +0800, longguang.yue wrote:
> delete temporary signing_key.x509
> 
> Signed-off-by: longguang.yue <bigclouds@163.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 6bfe776bf3c5..7c45fa8e44ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1589,6 +1589,7 @@ MRPROPER_FILES += include/config include/generated          \
>  		  .config .config.old .version \
>  		  Module.symvers \
>  		  certs/signing_key.pem \
> +		  certs/signing_key.x509 \
>  		  certs/x509.genkey \
>  		  vmlinux-gdb.py \
>  		  rpmbuild \
> -- 
> 2.34.1

signing_key.x509 is part of 'targets' make variable in certs/Makefile 
and thus removed during 'make clean'.  As 'clean' is a dependency of 
'mrproper', it always runs before.  Cp. [1].

Can you please re-check, if you can reproduce this on your site:

    $ touch certs/signing_key.x509
    $ ls certs/signing_key.x509
    certs/signing_key.x509
    $ make clean
      CLEAN   certs
    $ ls certs/signing_key.x509
    ls: cannot access 'certs/signing_key.x509': No such file or directory
    $ touch certs/signing_key.x509
    $ ls certs/signing_key.x509
    certs/signing_key.x509
    $ make mrproper
      CLEAN   certs
    $ ls certs/signing_key.x509
    ls: cannot access 'certs/signing_key.x509': No such file or directory

Kind regards,
Nicolas


[1]: https://git.kernel.org/stable/c/5cca36069d4c2942a46f98f47b9e7160fd547e03

