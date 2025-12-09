Return-Path: <linux-kbuild+bounces-10037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C1CB0CA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Dec 2025 19:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78D5430ADC7A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Dec 2025 18:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7615222A1D4;
	Tue,  9 Dec 2025 18:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LxHZz+yI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419201A4F3C;
	Tue,  9 Dec 2025 18:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765303361; cv=none; b=coApRKc5CogWKiosd4tpwr99WZSnhKNtA9FY1li6HVKzO+jZi8Ntsi55DUG80RlB2Y3sgr30KIkqL+rsNaeNEdynBVOp2ILv3IZ4l2PV+0dNxR1mA6yB9kEJRmDd2xPbe9diPp7rQE86E29hLNtUxMddn785uQg+DcRQsiZNHCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765303361; c=relaxed/simple;
	bh=o6ZndW3H+lm4EuX3+KS5hLTkzoncETPXMQgMzgvsPkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5Fyqp/SIvLXHWLGOwZOGBLGN1f9Ke8mpW2Ny3dnCRCLlCaXzJnLtNlSWBnjKNSxljE8/WvwYWMDQkgxHYjwOhOaQgzn/Lq7XLUUXadtdcD7DjojeO7+9M6HHq2ZEHVpgehivAXU8gjAJ3AuCwbfgu3GxXfK2VP9K5wTA393lfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LxHZz+yI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JIlQn7X0qXo8FHntPqZ6K8qQxFSfhZFlIosKcgTe9BU=; b=LxHZz+yI+v7ogAZpxSHi+kWmun
	3RebtGpxnGvp0wJH0RehPxrX8DGdLss4yRxGgyAhP8lluVIHb5SNnMops7oCuhZDnFlP+KjVfqjWW
	XamJuV+qogj/fzBeAZWSmzYoaD1qf+7Z4oiu6TMQLLS/gGwDH9EHhqPkHmBga2EB8SnxUGhI1U2Ni
	Ko7gzsfw3zDtcljr0obbSzngCspd8VJlC6uiEptmK8w3EWK4ffdovpaJIYen21TM9vwZM5RLG920Y
	bxoCxmqgCjYlZKn3iDv5crsiXMIoL2dp0dTVA8NdZHvceaosbx9A0njR3ajc6iLgPBtBswLzg+hGX
	niB93D+A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT22n-0000000Ed8B-2qZI;
	Tue, 09 Dec 2025 18:02:37 +0000
Message-ID: <7779891b-7ff1-4846-aa49-5d4139c5cc38@infradead.org>
Date: Tue, 9 Dec 2025 10:02:34 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: fix modules.builtin.modinfo being executable
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/25 7:59 AM, Fabian Pfitzner wrote:
> Since commit a26a6c93edfe ("kbuild: Strip trailing padding bytes from
> modules.builtin.modinfo") the resulting modules.builtin.modinfo file gets
> copied by objcopy resulting in an executable file.
> 
> It seems, that objcopy detects this file as executable even though
> the file is not executable at all.
> 
> This problem arises on x86_64 and arm-v7a, but for some reason does not
> happen on aarch64.
> 
> Fix this problem by removing the execution bit afterwards.
> 
> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>

WFM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  scripts/Makefile.vmlinux | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index cd788cac9d91dadcf4e83a39142f9d7bc61ffed0..7ee6aad760495ac5357132954c32ff879d24f72e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -113,6 +113,7 @@ vmlinux: vmlinux.unstripped FORCE
>  # what kmod expects to parse.
>  quiet_cmd_modules_builtin_modinfo = GEN     $@
>        cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> +                                    chmod -x $@; \
>                                      sed -i 's/\x00\+$$/\x00/g' $@
>  
>  OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> 
> ---
> base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
> change-id: 20251209-modinfo-executable-2d2af74150c0
> 
> Best regards,

-- 
~Randy

