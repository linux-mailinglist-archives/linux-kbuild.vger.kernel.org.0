Return-Path: <linux-kbuild+bounces-3737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95D98617A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1511F2AB55
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 14:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE0218660A;
	Wed, 25 Sep 2024 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="xw5FwFdK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34414C5BE;
	Wed, 25 Sep 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727273948; cv=none; b=dxUB13vXDAEH02kkbctXfOn3o8pKG5Pp2PcgKzv2H0nqfJTNfkWMhRwC/JEyZPlv714y4jY+Q4lbJ2h0A/sM/+dVGv70/uDKzYb+E4myRnvZ26XtAfNmish6bFhWM8Rxofqbs4eokn3Qwvs0DScykC9zNNWnCFc7vBtgjB+EP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727273948; c=relaxed/simple;
	bh=HTRkcPAenTvzMegv6n0mYFDgPoWbuIyb8kMa5lB9u2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6amaWIrpTAH5nLBpcItknxtAvRn/WDrD3MONDif2F7Vd3nwe55fqDI7bBmK48E0Mq/E8EZg5tnavvkjgizfYrCvZCDZRl4flxbG0QUuuRcS3vhwmF8yd4BAapLaompKj6PSAIMUuLp4ouUMfisXX7VnBk9PH5Qe/eCQwdCzIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=xw5FwFdK; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1727273938; bh=HTRkcPAenTvzMegv6n0mYFDgPoWbuIyb8kMa5lB9u2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xw5FwFdKa6jAXe1hRBtroB7RximLHdQkRtXOKHHmDWBVEh/PvkhrZcN/TQoThTivR
	 kISV/p1NJBru/Z7sz9Yh8eLkKTGSAN6mIUt8v6POhNkcIeqftG3eWbXt0D3Zd9uE2I
	 z3kXYGKO3v8/b6ilWRBwIZQRzzePgcF1SO+9zov4=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Sep 2024 16:18:58 +0200 (CEST)
Received: from l-nschier-nb (unknown [61.8.139.63])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 366B98069E;
	Wed, 25 Sep 2024 16:18:58 +0200 (CEST)
Date: Wed, 25 Sep 2024 16:18:56 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 12/23] scripts/nsdeps: use VPATH as src_prefix
Message-ID: <ZvQb0Bsvrm-HLQ6g@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-13-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-13-masahiroy@kernel.org>
X-purgate-ID: 149429::1727273938-81DB7BF0-0AA19826/0/0
X-purgate-type: clean
X-purgate-size: 1078
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:40PM +0900, Masahiro Yamada wrote:
> This change allows it to work not only for in-tree modules but also for
> external modules, even if they are built in a separate build directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/nsdeps | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> index f1718cc0d700..8b4db63838ce 100644
> --- a/scripts/nsdeps
> +++ b/scripts/nsdeps
> @@ -19,10 +19,10 @@ if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
>  	exit 1
>  fi
>  
> -if [ "$KBUILD_EXTMOD" ]; then
> +if [ "${VPATH+set}" ]; then
>  	src_prefix=
>  else
> -	src_prefix=$srctree/
> +	src_prefix=$VPATH/

In kbuild, we expect VPATH to be empty or hold one single directory,
while make itself allows VPATH to be a list of directories.  Might it
make sense to mention this at some place?

Reviewed-by: Nicolas Schier <n.schier@avm.de>

>  fi
>  
>  generate_deps_for_ns() {
> -- 
> 2.43.0
> 

