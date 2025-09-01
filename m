Return-Path: <linux-kbuild+bounces-8680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB30B3EC64
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE6F63B0FC0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 16:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8030648D;
	Mon,  1 Sep 2025 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aHih8uWP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C531ACEAF;
	Mon,  1 Sep 2025 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744794; cv=none; b=qmAIWD0qN9WCUVeigIk6T30zX3vLtSsvL+SX1zNLsYuCYQ0r9t3yqhyIuJ/ujR+BhdinSH+XEomasylq1QLUiLNgSJb7ixk3nxHPLBRLNQ9RSXGx3UGnSLqVWXSnXtLYKLQHB7+0E8e5FWucSyVo/7X5kmrLJoacaTmJnNKJAwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744794; c=relaxed/simple;
	bh=l4tl2zGuMxK613stp7sFJEo37zoRZcEcj5uJVSv60LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNWSBUubdKt0S4yiK5bsi9YznOrgUadoRaqafGa7ABqDwYjV+YddhALB2t0BBqaW/Hb0JVxcKVhm36sT2Akt6jS9yf+IBGr9Yr2XjU5YswSF9tqk4Wk6RK/3Wr4VBYbQ7OvmYujfY0VLpmnlX/ji/8wYQX4bz2idbOtAyJrhv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aHih8uWP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DRSjUWWTyoOLGxr/Io9XlzhZ4h0IRQjCBc1qkh5X+1A=; b=aHih8uWP/8+EryVTNdecuhTzag
	Uwlz5iJs0GPDnfvGzKiP6a3ru/ZBmL9NKPO3zoCHOeEIEenavc9ppbgXLRdLzeVXyv4wyB1wkwM1e
	AeCdB+iADH3AgWtaaP8Lr+pa8Qnxfha1HZ0Dc4I16IY7piQSu+yPweraK2x2axysYNRtOttb1VH0R
	Ns0NN36loE7+7bsGd0O9UCE0lf24TONfzkqmBMIRoktp6PNXQ2NOhGY8zQMocesVHhXpg7mtUa/yg
	lrjhSfv0BSftoIeESgc5ID/3n76A4adayr4tY86FFq04r50FokIIFijnRQzkeVkGddQDouLRUu2Ly
	js0i2jnQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7ZL-0000000DJXf-1zYl;
	Mon, 01 Sep 2025 16:39:47 +0000
Message-ID: <a123ab8b-a335-48a1-9ac3-e3b348d78cd1@infradead.org>
Date: Mon, 1 Sep 2025 09:39:46 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
To: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250830020109.it.598-kees@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250830020109.it.598-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees,

On 8/29/25 7:01 PM, Kees Cook wrote:
> During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
> existing .config files need to maintain backward compatibility while
> preventing deprecated options from appearing in newly generated
> configurations. This is challenging with existing Kconfig mechanisms
> because:
> 
> 1. Simply removing old options breaks existing .config files.
> 2. Manually listing an option as "deprecated" leaves it needlessly
>    visible and still writes them to new .config files.
> 3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
>    etc) prevents the option from being processed at all.
> 
> Add a "transitional" attribute that creates symbols which are:
> - Processed during configuration (can influence other symbols' defaults)
> - Hidden from user menus (no prompts appear)
> - Omitted from newly written .config files (gets migrated)
> - Restricted to only having help sections (no defaults, selects, etc)
>   making it truly just a "prior value pass-through" option.
> 
> The transitional syntax requires a type argument and prevents type
> redefinition:
> 
>     config OLD_OPTION
>         transitional bool
>         help
>           Transitional config for OLD_OPTION migration.
> 
>     config NEW_OPTION
>         bool "New option"
>         default OLD_OPTION
> 
> This allows seamless migration: olddefconfig processes existing
> CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
> CONFIG_OLD_OPTION is omitted from newly generated .config files.
> 
> Implementation details:
> - Parser validates transitional symbols can only have help sections
> - Symbol visibility logic updated: usable = (visible != no || transitional)
> - Transitional symbols preserve user values during configuration
> - Type safety enforced to prevent redefinition after transitional declaration
> - Used distinct struct members instead of new flags for readability
> - Documentation added to show the usage
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> With help from Claude Code to show me how to navigate the kconfig parser.

Are you (implicitly?) saying that all previous attempts at transitional
kconfig symbols have failed?  If so, I just wasn't aware of that.

Or is there some new prime directive that requires this?

Thanks.
-- 
~Randy


