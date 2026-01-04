Return-Path: <linux-kbuild+bounces-10414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E383CF16E6
	for <lists+linux-kbuild@lfdr.de>; Sun, 04 Jan 2026 23:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85F9A30011A4
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jan 2026 22:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D13143C61;
	Sun,  4 Jan 2026 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xqy+GozV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AB52F88;
	Sun,  4 Jan 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767566976; cv=none; b=XI1MRkwtn8xS+OiQDsnH5IHR27y8CTEaFisDgYjt1bNxP+Vvp2GfgSOSphWIszv/hoOhph/Ph0wv4+/PCRrKiL9F8EKSZ0QjJXcpATmS9QHgiFtY+WSVZP+7OBZPNNTnoIiTFBmCYF92QSc47v1V/aUZ+2WE6LQSTxSn0XUTd2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767566976; c=relaxed/simple;
	bh=1+tcYN9hjb34NvTy078ZGQoFPO1f185WERxyJUp5mOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqIuQTSOW/ONhUaIA47BjgkKMSssRL1LfjlMiwifZuGw9xEWqR3sZxpd1KJ7td9+2wkutPa/EoYzXoZp5DxsSVtDqla6CTBu1zlJ1Gx3P/5FXbSyJW/YPUhLgZ8EXbfUXW1/ImS1L3BKk+wJLuNAiePlhx7E2i0kkzQiD6IkWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xqy+GozV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=i/xAjHZ4c+xXNXhUcPgf/W28sA38oklY9+CYDqZh59Q=; b=Xqy+GozVj0JzxcUbtu8P7o1xqk
	ThFiC7/6QRtRmVpspQaEppUfuTftQIQxT5dEOP5XX0gb8dCE2BhvfywqIAQukq2bkHwEkwGc19I5G
	d1F1naEcUKrSJodjqdY7cX4EgtycOV+wfVmwUfcpGjS+7LuK471MNlu6UPn1CNF0HtBJyri3j7JEX
	rOiqe2KPYJU2vVUYNSAvztYVjG/wlK5JHSSzxb2AdxbQvH+gyisQ6kMUrn4HBK38Kn6N8SwU6pxyi
	mOKgDfvxbx7YtkmNxb3uMUJ2owMoGq20M0siHzisbvysooOWVc9QX8bJ9mRnCYVx2roxLl9SsQCO7
	cOCCInDQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcWuj-0000000AWwP-2R2b;
	Sun, 04 Jan 2026 22:49:33 +0000
Message-ID: <e99afc0e-e0a2-4719-9c04-4fa8fcafb4f0@infradead.org>
Date: Sun, 4 Jan 2026 14:49:33 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
To: Graham Roff <grahamr@qti.qualcomm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Arnd Bergmann <arnd@arndb.de>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/15/25 3:06 PM, Graham Roff wrote:
> From: Nicolas Pitre <nico@fluxnic.net>
> 
> Extend the "depends on" syntax to support conditional dependencies
> using "depends on X if Y". While functionally equivalent to "depends
> on X || (Y == n)", "depends on X if Y" is much more readable and
> makes the kconfig language uniform in supporting the "if <expr>"
> suffix.
> This also improves readability for "optional" dependencies, which
> are the subset of conditional dependencies where X is Y.
> Previously such optional dependencies had to be expressed as
> the counterintuitive "depends on X || !X", now this can be
> represented as "depends on X if X".
> 
> The change is implemented by converting the "X if Y" syntax into the
> "X || (Y == n)" syntax during "depends on" token processing.
> 
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> 
> [Graham Roff: Rewrote commit message, updated patch, added tests]
> 
> Signed-off-by: Graham Roff <grahamr@qti.qualcomm.com>

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> This patch updates an earlier one that was not merged to work on 
> the latest kernel release.
> 
> Link: https://lwn.net/ml/linux-kernel/nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr/#t
> 
> Support for this change has been expressed by a number of developers
> since the original patch was proposed back in 2020, and has recently
> also been raised as a patch to the Zephyr kconfig system.
> One specific use is when mapping the Bluetooth specification to Kconfig,
> as it explicitly provides dependencies between features as conditional
> on other features. Many other cases exist where the "slightly
> counterintuitive" (quoted from the Kconfig specification) expression 
> "depends on BAR || !BAR" has been used when a proper "if" condition 
> would be more readable. Some examples:
> 
> arch/arm64/Kconfig:
>   depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
>   depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
> arch/mips/Kconfig:
>   depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
>   depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
> arch/riscv/Kconfig:
>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
> arch/x86/Kconfig:
>   depends on X86_64 || !SPARSEMEM -->
>   depends on X86_64 if SPARSEMEM
> drivers/acpi/Kconfig:
>   depends on ACPI_WMI || !X86 -->
>   depends on ACPI_WMI if X86
> drivers/bluetooth/Kconfig:
>   depends on USB || !BT_HCIBTUSB_MTK
>   depends on USB if BT_HCIBTUSB_MTK
> mm/Kconfig:
>   depends on !ARM || CPU_CACHE_VIPT -->
>   depends on CPU_CACHE_VIPT if ARM
> kernel/Kconfig.locks:
>   depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
>   depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION
> 
> The earlier patch discussion ended without a real conclusion and should
> be revisited now.
> ---
> Changes in v3:
> - Updated commit to prefix with "kconfig:".
> - Updated tests to support modules for tri_state configs.
> - Link to v2: https://lore.kernel.org/r/20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com
> 
> Changes in v2:
> - Added test cases.
> - Updated documentation to improve the dscription of conditional
>   and optional dependencies
> - Link to v1: https://lore.kernel.org/r/20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com
> ---
>  Documentation/kbuild/kconfig-language.rst          | 22 +++++++++++++--
>  scripts/kconfig/lkc.h                              |  2 +-
>  scripts/kconfig/menu.c                             | 12 +++++++-
>  scripts/kconfig/parser.y                           |  6 ++--
>  scripts/kconfig/tests/conditional_dep/Kconfig      | 32 ++++++++++++++++++++++
>  scripts/kconfig/tests/conditional_dep/__init__.py  | 14 ++++++++++
>  .../kconfig/tests/conditional_dep/expected_config1 | 11 ++++++++
>  .../kconfig/tests/conditional_dep/expected_config2 |  9 ++++++
>  .../kconfig/tests/conditional_dep/expected_config3 | 11 ++++++++
>  scripts/kconfig/tests/conditional_dep/test_config1 |  6 ++++
>  scripts/kconfig/tests/conditional_dep/test_config2 |  7 +++++
>  scripts/kconfig/tests/conditional_dep/test_config3 |  6 ++++
>  12 files changed, 130 insertions(+), 8 deletions(-)


-- 
~Randy

