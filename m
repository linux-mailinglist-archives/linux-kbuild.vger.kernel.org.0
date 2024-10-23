Return-Path: <linux-kbuild+bounces-4270-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED369ACF0E
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 17:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006A328544F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 15:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913F41C8FD3;
	Wed, 23 Oct 2024 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="CMr2lGMv";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="axqYU2Zs";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="kcWy5FHC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i55.smtp2go.com (e2i55.smtp2go.com [103.2.140.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CE1CC8AA
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.140.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697991; cv=none; b=XHkrgVm3vNwLcuS9FjXISRwc4LG6+siJDfva4aU1nAEOwaDj8HBeDYNWAcCO/n2qTVKL3i5dXVLYRdWmHPmEQ1V1xrs4eQGOah8D+4jaLWYgFVr2JOWprYUVnNXg59f3CXWg0fV6hovWGxjkk+PUeOGqoFzflKFWp3e9XkUlKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697991; c=relaxed/simple;
	bh=FDw35vGF6tl6GWiJ7SwQ87WQQoIjAq+chZGhk2ZdmXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENQm2qxaMjQxupAl+G+nn0ZI1C6CL0qeFFufOhMgnnUlPXnt7zSKSw7ICLnMeLIUqcNKYYQLO53uUuXGNiPQstSddh35dWjB1tzkQhKwJ5Y9peVajnFOBojs3jgIqGf+UU1EeSXLlNp3AUgxHHUTOa0I3K8QXPewwfCqklurJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=CMr2lGMv reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=axqYU2Zs; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=kcWy5FHC; arc=none smtp.client-ip=103.2.140.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1729698880; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=464vsXYS0hOOkK2rayvez/v1qncVJ1hO6GgCfkPidww=; b=CMr2lGMv5XDGUQ3044gbJNz5LP
	FKHhR0/xVZ/oorO4rYYKZn/xIP7mUObpnWGUBgr+dNHOEcqS1jiQh9IM8OcXMxKsILtC5Fm7izN5o
	Sa5debJ4fMQjainTlGa5tmD8yovaHA12j3RdcHsaA8i2AwwiA22OIfMieSHUhrwMWZgQJkbOSiJ+q
	e43tYqzVJ7QKp/JPIHQAsAHMEoSWOK1If4dmmi5TwanAzeQXY9UzcsBqLCXQnFDAMgc8AVK/GEH47
	dA1//vVVspRSQjdbbkP8JQlh+H8DxhGRLb+SoVSwi2h9I7+Kz0fE5UMi2+ZOKYa0Rzofnxg3UfvCn
	N+tMmcXQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1729697980; h=from : subject :
 to : message-id : date;
 bh=464vsXYS0hOOkK2rayvez/v1qncVJ1hO6GgCfkPidww=;
 b=axqYU2ZsBAXsVlmLE3S/B66+BfjMeOC2UQK90B8uj9a3z9IrZj3OOBmbOQjlq2FHDlgYh
 5RngsY2EVEcEaMo5ZyDap5KagwK1wrDR+WNGj6FaKFwpZF8DJ9PJSb3wzfJN+sMUjqEWj9I
 dqOqJefXwm0EUGcWxqKbjo875pQP5ry7uRHM4lAIdA9diVSvu4sKqRxkRbKzD8QdTOhL4uN
 7q/q1kngOZVzWkuNnlu1Cihz3IGvWhLLibQ3+oCnCh9D2llWEPh/ucV7rryLb9HPgJHAQZ7
 zfjdb/7AAlzKBHyFp/b9C1Eit1m8s+tHU6Xrq3DSHJtyqroPXufVT8zU+3Hw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t3dSB-cp4aFr-E0; Wed, 23 Oct 2024 15:39:19 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t3dS9-4o5NDgrgPTO-nPcT; Wed, 23 Oct 2024 15:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1729697957; bh=FDw35vGF6tl6GWiJ7SwQ87WQQoIjAq+chZGhk2ZdmXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcWy5FHCHInf1XRg7ovXWYNvkN5R9wGcnzyX8pZbr3/B9FshLLlohhjEG4v55kgxf
 BwuMedehcz0Sn+RfhKjRMtK1qKRD8RehZsoCBnmz7EVGG6bR8INUvwuzeeQo/+69l7
 b+zTmbzxShzjF1F2ufCmxmWza72IdA9jaYBUoDWg=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 55C3C3D2A2; Wed, 23 Oct 2024 17:39:17 +0200 (CEST)
Date: Wed, 23 Oct 2024 17:39:17 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <benh@debian.org>,
 Ron Economos <re@w6rz.net>, Nathan Chancellor <nathan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kbuild: deb-pkg: add pkg.linux-upstream.nokerneldbg
 build profile
Message-ID: <ZxkYpWKMA_GIOjP4@fjasle.eu>
References: <20241022181703.1710116-1-masahiroy@kernel.org>
 <20241022181703.1710116-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022181703.1710116-3-masahiroy@kernel.org>
X-Smtpcorp-Track: wz60cEYrrsRS.JFjdgdTpUMzP.xyWIYgWqtee
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sf9napyMcG
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Wed, Oct 23, 2024 at 03:16:59AM +0900 Masahiro Yamada wrote:
> The Debian kernel supports the pkg.linux.nokerneldbg build profile.
> 
> The debug package tends to be huge, and you may not want to build it
> even when CONFIG_DEBUG_INFO is enabled. This commit introduces a
> similar profile for the upstream kernel.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/mkdebian | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 93eb50356ddb..fc3b7fa709fc 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -245,6 +245,7 @@ cat <<EOF >> debian/control
>  Package: linux-image-$version-dbg
>  Section: debug
>  Architecture: $debarch
> +Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
>  Description: Linux kernel debugging symbols for $version
>   This package will come in handy if you need to debug the kernel. It provides
>   all the necessary debug symbols for the kernel and its modules.
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

