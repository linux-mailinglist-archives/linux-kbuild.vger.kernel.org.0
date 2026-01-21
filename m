Return-Path: <linux-kbuild+bounces-10781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEKXM69lcWmaGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10781-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:47:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898E5FA76
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61D4948A18D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FEA3A7F60;
	Wed, 21 Jan 2026 23:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYfgIyx9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507836C0CB;
	Wed, 21 Jan 2026 23:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039272; cv=none; b=eTK5dSNPAFeMpRDHHalRO25JpkT4nYjqjai+7viuk9xGJoetLqlnaox/eXcTcCkpflCUrJ9Jgok9/tS/gQ/Ze6NZqx2AhgGamqncjw5SvxL1M0r1JHJwNFCXOnHxtYc9wEixmUF/rKE1+7zDwM2e8jUqvWEBmLqYv5itx18RCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039272; c=relaxed/simple;
	bh=w8oB1HanHF1HEwRHimyq/IUKJ86u0ZJinPlBatjfaN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWd9yussvF7aPbSJIxWHsaFACtFYdK3LDGc15TwwCTbwBwShhsGZq8IL70paJybBvW94qL9H00GOwnK/KVTgLUsFba0TFLDsAi1dF7kct9feVjasGqcJD2kHBfyk/oYgAuqEmeAL/X2yvuKrVQ+UrAnTdA/YgV+YzUpPpEiMwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYfgIyx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC839C4CEF1;
	Wed, 21 Jan 2026 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769039271;
	bh=w8oB1HanHF1HEwRHimyq/IUKJ86u0ZJinPlBatjfaN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYfgIyx9HDNmgGbf8cVViphca4s5UbdC3bEbXT1M/yt4kSn3sNSykpvdNWKgY3Ffi
	 w/oVmQLeFNNaOmPoFM4oYOmiXwQSo8mrtVyvXvT+udHYQJR+qNjSA+raxa4bHZkeXV
	 VwJAzBrMmoOebBcea8zATiTrvOIT28Jl8etdgATpmvbF+Bfjp4L3m1514e6XNCZJ6E
	 hLPjqTgKAZdOiCogdRVBqNTdvByBQvKYYGVzQjZIZKrGxXflJXcs0QZS+fGagrzu9L
	 J3+u+BkkaSbcFpEWMLDwq4gAmTziGiFqpqZTs2zO33d0b81tlw4umJBVArm/s+GkPq
	 bPw8cpjDarr8A==
Date: Wed, 21 Jan 2026 16:47:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] kbuild: Make sure to generate config file
Message-ID: <20260121234748.GA2137017@ax162>
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
 <20260120123730.30487-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120123730.30487-3-yangtiezhu@loongson.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10781-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7898E5FA76
X-Rspamd-Action: no action

Hi Tiezhu,

On Tue, Jan 20, 2026 at 08:37:29PM +0800, Tiezhu Yang wrote:
> After commit 75cffd392bfa ("LoongArch: Using generic scripts/install.sh
> in `make install`"), arch/loongarch/boot/install.sh is usually not used,
> either /root/bin/installkernel or /sbin/installkernel is used if found.
> 
> Then it can not generate the config file in most cases, just copy it to
> the installation path. Otherwise there may be an error when testing bpf,
> for example.
> 
>   $ ./test_verifier
>   gzopen /boot/config-6.19.0-rc6: No such file or directorg

This could also be resolved by enabling CONFIG_IKCONFIG_PROC.

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  scripts/install.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/install.sh b/scripts/install.sh
> index 05d62ac513ee..ecf354d8f4f1 100755
> --- a/scripts/install.sh
> +++ b/scripts/install.sh
> @@ -34,6 +34,12 @@ do
>  		continue
>  	fi
>  
> +	# Install kernel config file
> +	if [ -f ${INSTALL_PATH}/config-${KERNELRELEASE} ]; then
> +	  mv ${INSTALL_PATH}/config-${KERNELRELEASE} ${INSTALL_PATH}/config-${KERNELRELEASE}.old
> +	fi
> +	cp .config ${INSTALL_PATH}/config-${KERNELRELEASE}
> +

I am a little hesistant to change the generic install logic to handle
these files, especially since the map file should be handled by
installkernel like you mention in patch 3 (but I am open to other
opinions/arguments) and the configuration can be made available via
CONFIG_IKCONFIG_PROC as I mention above.

If LoongArch wants this behavior as part of its install process, why not
just bring back the lines of 75cffd392bfa after $(cmd,install)

install:
    $(call cmd,install)
    $(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
    $(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KERNELRELEASE)

>  	# installkernel(8) says the parameters are like follows:
>  	#
>  	#   installkernel version zImage System.map [directory]
> -- 
> 2.42.0
> 

