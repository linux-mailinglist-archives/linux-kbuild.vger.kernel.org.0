Return-Path: <linux-kbuild+bounces-7799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AEAEEAD0
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4F73E16B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94AD23506D;
	Mon, 30 Jun 2025 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LPsmXtJL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4B1FDE19;
	Mon, 30 Jun 2025 23:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325145; cv=none; b=W3TOlNEeAHw+d98T/btwNcGcshunEGJXj6w9LsB6rfpHu7VamDuR5tQUIQOEKdkYWnoNzQZNVTbSPQwlxAyq5C5Fk4yxSxkpwe+etqF5X8kx5TlcjHygeIQILd7dRTBPM/lr/ziyNysOo1CXODcL7QXwi1V4CuaiYyGCp3tks4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325145; c=relaxed/simple;
	bh=HANoBkwqVsrqxE9NL31599crS3bNOcVb2dc4ZelEwio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1mT1IJj15p3FSdWJkujd0Kqveub5zbSD8N5g6372KxM1gayVw/VD+NxBlfJoddQ1KQ+uZFCLGnxNGj+/iQVesqUHKVrwPQ146KVtA+k2ydRVna9h6GoP9MuERe1+dmnk0KBNV7PtD9ybRCzAwYWYeYYZ6eaxSNXY/TGY8c7hsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LPsmXtJL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iVUgE79GSFnBCQfLj4K9Imwt+iIsCYSfrdn6sAWzfmE=; b=LPsmXtJLY4RN4pNA/pvfptjjnh
	82HK6rJ/lzXRb+KZXzz0m+j/YpuwbzxL/Ismp0NqJb4MWMPGRbdMb0jtwLJFAoBstg9gnDqcmyjxj
	6vCsZX6kQt+j7XezkbDjFEVrwX8sdSOP2SFLgAyNILYVOQqjnitbxT5hXPq09I9vJdVIOqK7hmMVU
	RSxtiWywq3cvcghYFZWLf1V+aSo92zltK1uhUB4dmVJ/CRQnc73qXgwOZjgoHYOzcKEPO61CkiaiD
	CL4rtXj3pcE3fi3/uLbXUCaaNewqIMXgdBWvXssnfolygDui9rOKyCUCmzI6K2E/Lht1/iSev0e7W
	YwkFC4ig==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNfi-00000006u3e-0yQA;
	Mon, 30 Jun 2025 23:12:22 +0000
Message-ID: <65b6df81-bdb8-4da6-9009-652e536e65ba@infradead.org>
Date: Mon, 30 Jun 2025 16:12:20 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] kconfig: gconf: rename gconf.glade to gconf.ui
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
 <20250629184554.407497-5-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> The next commit will convert this file to GtkBuilder format. Rename
> it in advance to reflect the intended format.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> (no changes since v1)
> 
>  scripts/kconfig/gconf.c                   | 6 +++---
>  scripts/kconfig/{gconf.glade => gconf.ui} | 0
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename scripts/kconfig/{gconf.glade => gconf.ui} (100%)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index bc25924a1adf..6cf58fe5bcfe 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -1325,11 +1325,11 @@ int main(int ac, char *av[])
>  	/* Determine GUI path */
>  	env = getenv(SRCTREE);
>  	if (env)
> -		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
> +		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.ui", NULL);
>  	else if (av[0][0] == '/')
> -		glade_file = g_strconcat(av[0], ".glade", NULL);
> +		glade_file = g_strconcat(av[0], ".ui", NULL);
>  	else
> -		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".glade", NULL);
> +		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".ui", NULL);
>  
>  	/* Conf stuffs */
>  	if (ac > 1 && av[1][0] == '-') {
> diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.ui
> similarity index 100%
> rename from scripts/kconfig/gconf.glade
> rename to scripts/kconfig/gconf.ui

-- 
~Randy

