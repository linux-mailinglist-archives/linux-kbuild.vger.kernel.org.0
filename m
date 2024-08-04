Return-Path: <linux-kbuild+bounces-2807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4847946E4A
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 12:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E23E5B21092
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 10:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DF328DC3;
	Sun,  4 Aug 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="klhzuF4I";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="YPKKePg6";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="NGXlv891"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e3i64.smtp2go.com (e3i64.smtp2go.com [158.120.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3032744C
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722766978; cv=none; b=BxgYyEhJs6NJo4R8LKwRLZHQxoSPj07Z/DDbdlW5BEmz89NFjmKl2t6aB6osJ15SyHE1aoqyookySf5KD2ZJmp2A/mj/VFwy6MEml0ZVRrKHMY3YQSdq2S89Iaet5SNmblaUmA5DrD7WvOKz9aUgaz0cfbKMG2x7z+r4Zry4LDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722766978; c=relaxed/simple;
	bh=I4ZMgVyS+akm6yhVCpxTn44Y+e7bGGgw//sECJkNkWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAvvb21oL77m/1EM6TJGgENrHuJc2JlVmR8Z4a0vEBj/MQIgZxE36rW43O5k/lYjw+8dwIXyAFD8qosd0tCEAgWMDustQAhSKSx5TGpKGvZ4A5+v1joLDZ6E/wszA+X7a3W1OCHRzWZ0N1sUhXWobTpGAQYLxbc2FByfF27uE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=klhzuF4I; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=YPKKePg6; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=NGXlv891; arc=none smtp.client-ip=158.120.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1722766966; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=H9E9xdrhQvgFxQQ1EYCrjTDpzgHUuRaE4NZ8QiqjCqQ=;
 b=klhzuF4IvlqmvZDJNpIsedW8VGSVEQf9Smjkhtb0Ac+t7xMbB4Vn2gLq1Lf7h+chvfFLV
 BiSr5iJ01sRyOtWge/D/+pf6z4qRvbmqqSLOsR2rLTQpRuX9NzeUzwRXqZxHT31vSODDNZr
 IP4qsV8IgOig6XnxVcAgFpwr1JJOlaZjav1HzVLnHaGRuFwwHSVQKnc7HYbMCuhHyQMdiyc
 BH7RNbnNnln2qSQ6DaMpYdzxEjRDyF5XsUWAsjxVUAgQarMJRG3MNcWXrxqZT9Gh5mFxVD+
 Se2GMIRtNC9rjDchwsJ8B5O8wspWCMIpYTP6gLC74CimaJcId2XxfuwcydcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1722766966; h=from : subject :
 to : message-id : date;
 bh=H9E9xdrhQvgFxQQ1EYCrjTDpzgHUuRaE4NZ8QiqjCqQ=;
 b=YPKKePg6yhzTtRLayaT7VPDziOu4SUUy925dNrQ0Pt6R1BuikK+TSLmEzM/WzxRa+cH1p
 coLyMfZQ0wEfGb5cqaLEn9qx8lEZ3uORQWoi0i92SAgGnbt2UqHFyOQv8b0vaKG/IgDwyuL
 9z+PjkCODKD8BZVD6F9ZT3fyGPFB8jRJgC1iIGq0btv1xyi8G8mI3wvHSm47K99+hG1A09c
 osiCCaX5FLGJ6LMDct+A3i5fqMe8VvFI2QyxJB6wBxKQ8aFYMoQnOlCCarh23mEwQdNcGgw
 JDLEaxz6q/t4GfSI//5+rxpe1WhSM8Z6e2Q15bz7W3/3IgGmS66K/qvtYkOw==
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <nicolas@fjasle.eu>)
	id 1saYNu-4o5NDgrlRKg-mEQX;
	Sun, 04 Aug 2024 10:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1722766960; bh=I4ZMgVyS+akm6yhVCpxTn44Y+e7bGGgw//sECJkNkWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGXlv891jtmh1eXpm5Ir8/3KaCV7a58Im2F8WPY06XH5Tnp1ikOpLirvfTvDKHEzI
	 1VO6M9OPNxGg6mkInMje/qVfxfPF1TdGDBAOYy3wB+tqOc4cEQZP8nqamb+hZipda/
	 jXObS7v0PQyGWXPZWcRYyCWij9M5xpZ+lNF9dndE=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id C6A5342CE3; Sun,  4 Aug 2024 12:22:40 +0200 (CEST)
Date: Sun, 4 Aug 2024 12:22:40 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Makefile: add $(srctree) to dependency of
 compile_commands.json target
Message-ID: <Zq9WcJnmGqjlIpIw@fjasle.eu>
References: <20240804055057.262682-1-gnurou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804055057.262682-1-gnurou@gmail.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286skBCIxoOCi
X-smtpcorp-track: kVd_HGZ_TJzM.c62A2hgFjH94.Lc5LlwoE0gn

On Sun, Aug 04, 2024 at 02:50:57PM +0900 Alexandre Courbot wrote:
> When trying to build the compile_commands.json target from an external
> module's directory, the following error is displayed:
> 
> 	make[1]: *** No rule to make target 'scripts/clang-tools/gen_compile_commands.py',
> 	needed by 'compile_commands.json'. Stop.
> 
> This is because gen_compile_commands.py was previously looked up using a
> relative path to $(srctree), but commit b1992c3772e6 ("kbuild: use
> $(src) instead of $(srctree)/$(src) for source directory") stopped
> defining VPATH for external module builds.
> 
> Prefixing gen_compile_commands.py with $(srctree) fixes the problem.
> 
> Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for source directory")
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8ad55d6e7b60..52d7dfe4212a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1980,7 +1980,7 @@ nsdeps: modules
>  quiet_cmd_gen_compile_commands = GEN     $@
>        cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
>  
> -$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
> +$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/gen_compile_commands.py \
>  	$(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
>  	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
>  	$(call if_changed,gen_compile_commands)
> -- 
> 2.46.0
> 

thanks, looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


