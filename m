Return-Path: <linux-kbuild+bounces-9609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBAC5542D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Nov 2025 02:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EC4C4E182C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Nov 2025 01:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4B12877C3;
	Thu, 13 Nov 2025 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="yLT5YQJt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF228751A;
	Thu, 13 Nov 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.74.80.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762997668; cv=none; b=Skce4KL59fjbMp74jDA/j+XY5ZKyU9jZYOajK+Hb0s4wPbU4PefkJT+Mil2Eco490Blfr08iDxtzskeZmmGyKkqITyAuHSU0e/npFR9XGaSt5NChTW0KInzIQotipoPuKxU2eGnkqq05Fw7sfLwwCb4OhNep79MqnrwKA/C/Ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762997668; c=relaxed/simple;
	bh=/C8d2McLRUeNClD+TCW1xxnMF0x3wXTvVg6S8iQDfxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozM5S7dNKyN6iBfiWdfZgJU+c69ZnOX+taHArE2fbu7CNCn9YxkyGez2kkwAEJG6/B1yAIN+d7EsREBgMOwzQoq8QUGSbsAV0rfiOpRslhxSogyAIVue7XYBxS6D0L80C7ncpfR/jTiHCsvtODu3aUm/zwTfHXd0qyMbengzmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=yLT5YQJt; arc=none smtp.client-ip=137.74.80.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 10044202D9;
	Thu, 13 Nov 2025 01:34:19 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 0330740084;
	Thu, 13 Nov 2025 01:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1762997656; bh=/C8d2McLRUeNClD+TCW1xxnMF0x3wXTvVg6S8iQDfxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yLT5YQJtCOMQ0wAicIwX+bXUcUDiQZcfjoAB81C+dgPsKmHGPZP2RRIm4pX9cHZk3
	 XZHEDZZU2e8psGhxNKnAZyBHEa17XXn8eZt7bfAOfNe2gp+P7HV+7vMkpwqG7mRgNN
	 H1Y2HAYvLQiV9g5zzHqZoAQ+GvYJez9o/vTvdQdc=
Received: from [192.168.0.64] (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 25C0042A31;
	Thu, 13 Nov 2025 01:34:13 +0000 (UTC)
Message-ID: <a2e3e8ec-bac6-401b-a302-c1a6ddc50e51@aosc.io>
Date: Thu, 13 Nov 2025 09:34:11 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] alpha/boot: Add .gitignore ignoring vmlinux kernel
 image
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20251112172248.3927-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20251112172248.3927-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0330740084
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,linaro.org,gmail.com,kernel.org,fjasle.eu];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[thorsten.blum.linux.dev:server fail,wangyl5933.chinaunicom.cn:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

[ Cc the kbuild subsystem mailing list and its maintainers. ]


Hi Thorsten Blum,


(If the maintainers happen to spot patches like this), Please feel free 
to add my "Co-developed-by" or "Reviewed-by" tag: WangYuli 
<wangyl5933@chinaunicom.cn>

  — I would be very grateful!

Link: 
https://lore.kernel.org/all/6269AF2792BA8D05+20250704085945.317850-1-wangyuli@uniontech.com/

Link: 
https://lore.kernel.org/all/47F75842218B0DDC+20250507060012.1203990-1-wangyuli@uniontech.com/

Link: 
https://lore.kernel.org/all/90A2E6E70A68DD1E+20250415091206.413647-1-wangyuli@uniontech.com/


On 2025/11/13 01:22, Thorsten Blum wrote:
> Building the kernel creates the untracked kernel image file 'vmlinux' in
> 'arch/alpha/boot/' - ignore it by adding a new local .gitignore file.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/alpha/boot/.gitignore | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 arch/alpha/boot/.gitignore
>
> diff --git a/arch/alpha/boot/.gitignore b/arch/alpha/boot/.gitignore
> new file mode 100644
> index 000000000000..4abc9c8ab7d3
> --- /dev/null
> +++ b/arch/alpha/boot/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +vmlinux

