Return-Path: <linux-kbuild+bounces-10112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B280DCC13F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 08:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F777300C28B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 07:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADFD2F363C;
	Tue, 16 Dec 2025 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NSyNFBTN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B333BBDA;
	Tue, 16 Dec 2025 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869042; cv=none; b=ZsAvuor7zApa9aOgB2GAgJ3eKJt9hsnn69fSMtWfZD/SXid8Hp0J6D2bZ8EuF4Tf1oahPDs97xHEleTmnKvjxxOYTqrBlrSC6JeUv/FMzF4h3x0+xOmIf1HhhJan7LiYvAWV1xsSAqTFMpG/rbbPZJqKrO0ihyyJSKB8k7gfbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869042; c=relaxed/simple;
	bh=tMjQscmPnxR/7hg5xP3slOxadD2I08HKFkd3NoyfbRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLcoCDkWtRgBxEm9zfS8YhMG1cUKSz96yTJOs95tJb3tswiWjs5LHL5kr+aD/ReDOiYYlrq25D51LurgtJqdtJx6fxkd1GdOlZLoqtdxMetMfQWzaoHajsa1nf3LRJSBfy0+2uakEYd7E/PtvWAV9amzsfJBEszdSYZRfgvsOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NSyNFBTN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TYVRJ+CAMoDazTs0ONDHZW/vWoLMRFEZuQmviQneOMU=; b=NSyNFBTNDwAopmOOD5McdMb/Mr
	z8R2AMvOhpSjLDh6Zr8Eu2Wy1xl7xK6nyFpV2+dIYc9ifx/y/J4iwuHTD+Oytpee95T45bn57i3s4
	TI4zpHt+jucdwNsIqgGTzpVFGCmpAxrIVO/nFy1XjypCtkk8UdMkmUNFKMUl2X/SiKscwPZ3B8Ctx
	p9dmZUbAhqKK3jJ6LKWIPaSHIxowne5sukaGrlC3MBZ+RxLFeel7wCQdhO9PQ83Qt/ms+aKV3qGPH
	Sa7Beqr5A1SinJKIBwUgzGl4o8ezVxcqaYs4PflzRRZ09rGYhxo/JQUnsJtT4PpjpmK3Y5HvFxUjw
	vza58n8w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPCg-00000004pa7-1qD5;
	Tue, 16 Dec 2025 07:10:38 +0000
Message-ID: <35baccd7-bcb6-4794-9b6e-ce5982bd2342@infradead.org>
Date: Mon, 15 Dec 2025 23:10:38 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] kconfig: move XPM icons to separate files
To: Rostislav Krasny <rostiprodev@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251213140923.19710-1-rostiprodev@gmail.com>
 <20251213140923.19710-2-rostiprodev@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251213140923.19710-2-rostiprodev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/13/25 6:09 AM, Rostislav Krasny wrote:
> Replace deprecated gdk_pixbuf_new_from_xpm_data() with gdk_pixbuf_new_from_file()
> and update both GTK and QT frontends to load XPM icons from separate files
> in scripts/kconfig/icons/ instead of from the code.
> 
> xpm_menu_inv and xpm_void were removed and not converted into xpm files
> because they are not used since 64285dc5c41fc7a031695c2c286a2bfef9eaf2c6
> 
> This eliminates the GTK deprecation warnings at compile time, improves
> memory usage and code organization.

Yes, it does that.

This worked well for me when I ran 'make gconfig'. However, when I tested
'make xconfig', instead of having icons/symbols for
  Back, Open, Save, Single View, Split View, Full View
I have words as listed above.


> Signed-off-by: Rostislav Krasny <rostiprodev@gmail.com>
> ---
>  scripts/kconfig/Makefile              |   4 +-
>  scripts/kconfig/gconf.c               |  35 ++-
>  scripts/kconfig/icons/back.xpm        |  29 +++
>  scripts/kconfig/icons/choice_no.xpm   |  18 ++
>  scripts/kconfig/icons/choice_yes.xpm  |  18 ++
>  scripts/kconfig/icons/load.xpm        |  31 +++
>  scripts/kconfig/icons/menu.xpm        |  18 ++
>  scripts/kconfig/icons/menuback.xpm    |  18 ++
>  scripts/kconfig/icons/save.xpm        |  31 +++
>  scripts/kconfig/icons/single_view.xpm |  28 +++
>  scripts/kconfig/icons/split_view.xpm  |  28 +++
>  scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
>  scripts/kconfig/icons/symbol_no.xpm   |  18 ++
>  scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
>  scripts/kconfig/icons/tree_view.xpm   |  28 +++
>  scripts/kconfig/images.c              | 328 --------------------------
>  scripts/kconfig/images.h              |  33 ---
>  scripts/kconfig/qconf.cc              |  29 ++-
>  18 files changed, 345 insertions(+), 385 deletions(-)
>  create mode 100644 scripts/kconfig/icons/back.xpm
>  create mode 100644 scripts/kconfig/icons/choice_no.xpm
>  create mode 100644 scripts/kconfig/icons/choice_yes.xpm
>  create mode 100644 scripts/kconfig/icons/load.xpm
>  create mode 100644 scripts/kconfig/icons/menu.xpm
>  create mode 100644 scripts/kconfig/icons/menuback.xpm
>  create mode 100644 scripts/kconfig/icons/save.xpm
>  create mode 100644 scripts/kconfig/icons/single_view.xpm
>  create mode 100644 scripts/kconfig/icons/split_view.xpm
>  create mode 100644 scripts/kconfig/icons/symbol_mod.xpm
>  create mode 100644 scripts/kconfig/icons/symbol_no.xpm
>  create mode 100644 scripts/kconfig/icons/symbol_yes.xpm
>  create mode 100644 scripts/kconfig/icons/tree_view.xpm
>  delete mode 100644 scripts/kconfig/images.c
>  delete mode 100644 scripts/kconfig/images.h
-- 
~Randy


