Return-Path: <linux-kbuild+bounces-5994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EBA56E22
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 17:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91FB3162FBC
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 16:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC5C2222D5;
	Fri,  7 Mar 2025 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ejn0mXt/";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mC9Yw4Fo";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="GaNwo0No"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i673.smtp2go.com (e2i673.smtp2go.com [103.2.142.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9D17583
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Mar 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741365852; cv=none; b=mAm0bQB0RDBxQXfYHmsCBlTv+VPCg0VMwyBBSv47M2YUA9Uof3PtKUZMgdgEYXgUHl2PK3SWZgwXKDXY1/GOR3M2GuymrNhpaTu/pyDUAWEzfGofNWMvnHzIOl4Oy80e7lT1yl3/o2Z6c2j0HfINq8Y6WHNy9Nl+qxj+Zn205EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741365852; c=relaxed/simple;
	bh=8pkMiSx6kNFRpn5gsNjnnno8KJoOvB8j1owZq3DBehc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmsFgMglapYZrox6lbzHEe3/C/E7RLIOzSjhm8lRO0UQp4bLPg7lnTFiRWmYTl0EfOSBs4rsCZKN/hUx2MQs0fLk2Q3cDiODU8eq9k5F/WUOI38xCSHBfs6MpuKW83cwb1GfCHj397J+qyuwEM6VG0PaNUe1QZManp4WrauGiWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ejn0mXt/ reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mC9Yw4Fo; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=GaNwo0No; arc=none smtp.client-ip=103.2.142.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1741366742; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=0xuOBCxlXCHTekml4DZ7++gFtkwOTvv3ypU0Gidbuw4=; b=ejn0mXt/kZVtsmq8CW1IYU9epc
	V2yAWwe0+7mlxcbZz5tdyup9EzYJKchMZihYeuTSeGLuQZljJFUfxw9158GtoilqsJRt1eaapul3o
	jww206sN+t60kzKe1RxysZzSwKrNI6cDjeXmxAhrNlRbkU6E3mhMQhpP+rYt0E+1XYhfVIlpQpHHn
	TChkKif2QgAjALUR3d0TuHbVBLk5j8DCyveOvuKOGhGNmhDxWrS8U/fPjZJlNg9SJoEiJJWSWQWYk
	3WvaQB86TiM8q6zmk5okJw8TIhzYUWX3iPKXsFBTxvLRmTnbeK7/xaadiaiywpFwyMLPDCTIk8+sc
	twtq0k+w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1741365842; h=from : subject :
 to : message-id : date;
 bh=0xuOBCxlXCHTekml4DZ7++gFtkwOTvv3ypU0Gidbuw4=;
 b=mC9Yw4FokrHRHFd4ZEX579w/Ncu578nvd8k+ATI/vyaPJ93M4Bp2LoQozbdfvSAKMyBZy
 +ns4FPoAEV4rVyaii/WpKNYyXRbuaxD4GJ8eRpjpnz6El5ezTCRrH4SyEjvXNqOjlTx3k/q
 Jii/MZUzfCqthDPIaUpHRQvzLn9UD/5bGIYh2lg+7TnWZN4mvyDJ5BZ19cJf1qqPcYqT0yC
 glwt5dkRbfyFLFhx3Pkail674AqwUrM+mrA4zEYcdLUDmrhAKi2VpstxZjXsOoAiU5cdHE7
 KqsyGPA6llQhZ1i2EHYplkAfmxSq7CvWEWGbGCONMAOevQFO7Hyk97bloeBQ==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tqagX-qt4Jps-Li; Fri, 07 Mar 2025 16:36:30 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1tqagW-FnQW0hPxooy-mr7k; Fri, 07 Mar 2025 16:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1741365386; bh=8pkMiSx6kNFRpn5gsNjnnno8KJoOvB8j1owZq3DBehc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GaNwo0NocK9Qf5t+9vpTeOeQe2VcgvVEv9DF6ASoq1aSSrnil0CAY/YFXPnOk3jBP
 Ivd36LHgu3ApWSUkok+l+gigAwFS4q6OQ95KVLE/kxjASIJuyL1YPW2BXbHxnoHgMN
 /hkMh8Pfu0wJ47bKrJkXne4bx6ONGdhQl7aooRsY=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id B6992499DF; Fri,  7 Mar 2025 17:36:26 +0100 (CET)
Date: Fri, 7 Mar 2025 17:36:26 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION
 indiscriminately
Message-ID: <Z8sgisZ8FI3wkpfZ@fjasle.eu>
References: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
X-Smtpcorp-Track: sS4fFY2dmVU5.HqvdB6PpippR.f_6pMgYhoLU
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sQTBgZURN3
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hi Alexandru,

"indiscriminately" sounds a bit weird to me (but I am a non-native speaker); do
you mean "unconditionally"?

On Wed, Mar 05, 2025 at 07:25:36PM +0000 Alexandru Gagniuc wrote:
> 
> In ThinPro, we use the convention <upstream_ver>+hp<patchlevel> for
> the kernel package. This does not have a dash in the name or version.
> This is built by editing ".version" before a build, and setting
> EXTRAVERSION="+hp" and KDEB_PKGVERSION make variables:
> 
>     echo 68 > .version
>     make -j<n> EXTRAVERSION="+hp" bindeb-pkg KDEB_PKGVERSION=6.6.6+hp69
> 
>     .deb name: linux-image-6.6.6+hp_6.6.6+hp69_amd64.deb
> 
> Since commit 7d4f07d5cb71 ("kbuild: deb-pkg: squash
> scripts/package/deb-build-option to debian/rules"), this no longer
> works. The deb build logic changed, even though, the commit message
> implies that the logic should be unmodified.
> 
> Before, KBUILD_BUILD_VERSION was not set if the KDEB_PKGVERSION did
> not contain a dash. After the change KBUILD_BUILD_VERSION is always
> set to KDEB_PKGVERSION. Since this determines UTS_VERSION,the uname
> output to look off:
> 
>     (now)      uname -a: version 6.6.6+hp ... #6.6.6+hp69
>     (expected) uname -a: version 6.6.6+hp ... #69
> 
> Update the debian/rules logic to restore the original behavior.
> 
> Cc: <stable@vger.kernel.org> # v6.12+

Shouldn't this be v6.8, as 7d4f07d5cb71 got introduced there?

> Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-build-option to debian/rules")
> Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
> ---
>  scripts/package/debian/rules | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
> index ca07243bd5cd..bbc214f2e6bd 100755
> --- a/scripts/package/debian/rules
> +++ b/scripts/package/debian/rules
> @@ -21,9 +21,13 @@ ifeq ($(origin KBUILD_VERBOSE),undefined)
>      endif
>  endif
>  
> -revision = $(lastword $(subst -, ,$(shell dpkg-parsechangelog -S Version)))
> +debian_revision = $(shell dpkg-parsechangelog -S Version)
> +revision = $(lastword $(subst -, ,$(debian_revision)))
>  CROSS_COMPILE ?= $(filter-out $(DEB_BUILD_GNU_TYPE)-, $(DEB_HOST_GNU_TYPE)-)
> -make-opts = ARCH=$(ARCH) KERNELRELEASE=$(KERNELRELEASE) KBUILD_BUILD_VERSION=$(revision) $(addprefix CROSS_COMPILE=,$(CROSS_COMPILE))
> +make-opts = ARCH=$(ARCH) KERNELRELEASE=$(KERNELRELEASE) $(addprefix CROSS_COMPILE=,$(CROSS_COMPILE))
> +ifneq ($(revision), $(debian_revision))
> +    make-opts+=KBUILD_BUILD_VERSION=$(revision)
> +endif
>  
>  binary-targets := $(addprefix binary-, image image-dbg headers libc-dev)
>  
> -- 
> 2.48.1
> 

Looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


