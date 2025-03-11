Return-Path: <linux-kbuild+bounces-6057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF66A5C547
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 16:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9239C3A9F49
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 15:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C5925D8F9;
	Tue, 11 Mar 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="vJxnF0Pp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65412B9CD;
	Tue, 11 Mar 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705827; cv=none; b=ZkwQVx/8hOzTYaSpFwXK2mRZOthGm6eOaYmIWAAuWoV/xtt7+MZcY8IYjXJnlQEpktcdVPe9SaR3wNOqWH5bcx/LGWnFVu45bocJrWBozm3j7RP6+gCydkhpQ2lNjp3dw6jZjVgM/j4ZARtS2P34KaImxv1xTL9MfwhTddI7RwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705827; c=relaxed/simple;
	bh=uvzLfD2akr36Mr5Q1GJLF1vdsqE4DCbAl38YOf7RmPU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=FOrmuM80e7wRPLvCLRew/v5exkEVAIgqLmsJqLtW9qb6UJVxvOuDLgJebtuSp2WL+pRzIXrPPAcwR40MORz6LPbhyeqjI/cD6NP4ZQjIOfPUZeH36TU5yNvGSOj/JlAYWpbWpc3WCc+2ekPn17fTtWw7X6az3MMNwWiAwlCHM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=vJxnF0Pp; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1741705815; bh=uvzLfD2akr36Mr5Q1GJLF1vdsqE4DCbAl38YOf7RmPU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=vJxnF0PpneudH/0RUVfqEZD+6rFdtAZkRVlIWfVmlWnNjJkyDVmxIGh03yS/dEqNb
	 RxXjbZtfxdbFtEh7Xw8NXJKkzaWy9q/SxsTaYMk6KZb3w0zqOZM6NKNL8qxDjUHhGO
	 xpsLSOFwbmdmmoyTRGJOriSJ/V4fs0unPuEhfejE=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67d05257-1471-7f0000032729-7f000001d72e-1
	for <multiple-recipients>; Tue, 11 Mar 2025 16:10:15 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 11 Mar 2025 16:10:15 +0100 (CET)
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 11 Mar 2025 16:10:14 +0100
Message-Id: <D8DJ6L3FYOBS.2LX1B9RRJVXA4@avm.de>
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
 <bp@alien8.de>, <hpa@zytor.com>, <sraithal@amd.com>
Subject: Re: [PATCH v2 1/1] kbuild: Add a help message for "headers"
From: "Nicolas Schier" <n.schier@avm.de>
To: "Xin Li (Intel)" <xin@zytor.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Organisation: AVM GmbH, Berlin
References: <20250311054932.1931853-1-xin@zytor.com>
In-Reply-To: <20250311054932.1931853-1-xin@zytor.com>
X-purgate-ID: 149429::1741705815-3C55C9D3-74A5AE16/0/0
X-purgate-type: clean
X-purgate-size: 1310
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Tue Mar 11, 2025 at 06:49 CET, Xin Li (Intel) wrote:
> Meanwhile explicitly state that the headers are uapi headers.
>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>
> Changes in v2:
> * Revise the help message for "headers" (Masahiro Yamada).
> * Revise the shortlog (Masahiro Yamada).
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 70bdbf2218fc..62afeda58080 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1659,7 +1659,8 @@ help:
>  	@echo  '  kernelrelease	  - Output the release version string (use with=
 make -s)'
>  	@echo  '  kernelversion	  - Output the version stored in Makefile (use =
with make -s)'
>  	@echo  '  image_name	  - Output the image name (use with make -s)'
> -	@echo  '  headers_install - Install sanitised kernel headers to INSTALL=
_HDR_PATH'; \
> +	@echo  '  headers	  - Build read-to-install uapi headers in usr/include=
'

ready-to-install (a 'y' is missing)

> +	@echo  '  headers_install - Install sanitised kernel uapi headers to IN=
STALL_HDR_PATH'; \

In documentation and comments, UAPI is written in capital letters.  I=20
think it would be good to keep it this way here, too.

Kind regards,
Nicolas

