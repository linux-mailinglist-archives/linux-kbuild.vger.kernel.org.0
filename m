Return-Path: <linux-kbuild+bounces-8757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24001B477FE
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Sep 2025 00:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21331C23A78
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 22:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD192D7DE9;
	Sat,  6 Sep 2025 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WD3MTiEV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DF323BF9B;
	Sat,  6 Sep 2025 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757197564; cv=none; b=BTkvBzo6MS0eUS6HTPEaLz8/0WCNSxuvUZ3lqHOmoNu2vkh+ObHD/rr67mIiu3L9xFps3kq9iYABy5dvIOe6SDtX2Co71PRHSPsKdhAMlywbXs7mUuR8vX+0rx8K/xh+Abftr/vWxDDus8leQgK5cbRMDzLmJv3xLx7qke4/tBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757197564; c=relaxed/simple;
	bh=JqldWRPERw4IKoFvl0pMtg74CW2Zzkauedrn/ZTVcd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFb0/aG4Rnzw6vFp9t4CJFu4PqYjDidWypnPHgjI2B6xOW1yzIjOdn6blPBFn1VBt5G+2or09dp5DsXlz4jQacOl+CCoQC6Y3PiYoTQ89wEPEw1+Qxtlkom/88+f4BbbM6GpaZ5TKkZMu7IWa6zMUC3Jw13Rc9QJ96AlXREqNJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WD3MTiEV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 731A340E0173;
	Sat,  6 Sep 2025 22:25:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Czw7wzyQ6SdZ; Sat,  6 Sep 2025 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757197550; bh=+xt7zC4IHQ+iWsE/ZnrUTR3tvhZamW/XzIhStal409Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD3MTiEV8OF4augBQVbQgNGLghdqY3TGMGBKaP04329b5L0DfzUVoj6QisowlNw4q
	 /IMj/MOBJpym9nNPw614ZhpVoMP5w1yuQF5kPartCXJqMa8Y8XYxvSfck0Q/01W3B3
	 nn8KSHr9Gl9zpWcYyX9FfXtO6rv8Acj0x8J7cOCKSj7mneCH1pBnU4tALMr//aSRiV
	 JsarJg70bFFzngYonXdqFYcd12mk/nnjOgMSn6aBM+bE/OriCnRs6R4Hulgb2qz6O/
	 VW7Lr/J5fCtr7CVUTwUERpePji+KXecc2VZ6m6Qvyhs18CQK1KPjx4x8gXZ046Pk5J
	 3ue3KUJaHHsifVJ3uZy3f1QgGhX0OBZHyL7GvLXsHTTNOuD9O4weesISUfuLDcM5K1
	 OqlaKTYRVzaGe4EITMImM1OnWIUj6FuCaK98tfb5WxnD2Z7ieoNWkgThfI0dvol3Vq
	 YlxqNXWxHfq2LA3HPkRSY65mcoR7Eh6E0HB4bJWEmt5xWen+K9E4umS1F/OD92hhGH
	 x/tsRl/3VkdOQ6cX5+jIkYx3cXzNLyCOeR/mpL4kDIhRgHxR4HfeXCIvAIa8Hi2rTU
	 w+8vl+o4wHFs8OKdpAX5CGtYq90mFZUnHa2qU7Zed/GPtfOzClrq8bmmTPkBK70yan
	 XdV58lIASbpHeb2xhWiQxkN8=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id AA3B540E00DD;
	Sat,  6 Sep 2025 22:24:29 +0000 (UTC)
Date: Sun, 7 Sep 2025 00:24:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
	trintaeoitogc@gmail.com, axelrasmussen@google.com,
	yuanchu@google.com, joey.gouly@arm.com, samitolvanen@google.com,
	joel.granados@kernel.org, graf@amazon.com,
	vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz,
	kaleshsingh@google.com, justinstitt@google.com,
	catalin.marinas@arm.com, alexander.shishkin@linux.intel.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	corbet@lwn.net, xin@zytor.com, dvyukov@google.com,
	tglx@linutronix.de, scott@os.amperecomputing.com,
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com,
	mhocko@suse.com, ada.coupriediaz@arm.com, hpa@zytor.com,
	leitao@debian.org, peterz@infradead.org, wangkefeng.wang@huawei.com,
	surenb@google.com, ziy@nvidia.com, smostafa@google.com,
	ryabinin.a.a@gmail.com, ubizjak@gmail.com, jbohac@suse.cz,
	broonie@kernel.org, akpm@linux-foundation.org,
	guoweikang.kernel@gmail.com, rppt@kernel.org, pcc@google.com,
	jan.kiszka@siemens.com, nicolas.schier@linux.dev, will@kernel.org,
	andreyknvl@gmail.com, jhubbard@nvidia.com, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 11/19] x86: LAM initialization
Message-ID: <20250906222420.GBaLy0lL5lHcVlYU0C@fat_crate.local>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <ffd8c5ee9bfc5acbf068a01ef45d3bf506c191a3.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ffd8c5ee9bfc5acbf068a01ef45d3bf506c191a3.1756151769.git.maciej.wieczor-retman@intel.com>

On Mon, Aug 25, 2025 at 10:24:36PM +0200, Maciej Wieczor-Retman wrote:
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index bb57e93b4caf..756bd96c3b8b 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -763,6 +763,9 @@ void __init init_mem_mapping(void)
>  	probe_page_size_mask();
>  	setup_pcid();
>  
> +	if (boot_cpu_has(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_TAGS))

cpu_feature_enabled()

> +		cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
> +
>  #ifdef CONFIG_X86_64
>  	end = max_pfn << PAGE_SHIFT;
>  #else
> -- 

Also, for all your patches' subjects and text:

Pls read

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

and fixup.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

