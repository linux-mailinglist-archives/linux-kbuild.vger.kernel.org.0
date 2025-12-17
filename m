Return-Path: <linux-kbuild+bounces-10126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAECC5BDE
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 03:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD8B300F303
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 02:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7E75478D;
	Wed, 17 Dec 2025 02:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y8sgXxn/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ECC3A1E6B;
	Wed, 17 Dec 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936940; cv=none; b=GoSvuUalGpsA5/kk6oGJ3ri3kAs9+sLxCf4zwoyzSramNBxou3JcxqBIOHarXbYsL6oH8Ef5vzd3yOhk/kkc/f1i7+OBj3uVw60f5oSHUPoZ301je+N12iNqRl7gdHG2WTDXhPNH1FxYvW76sG762+yKR6QoyMjdiPsxlmR91Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936940; c=relaxed/simple;
	bh=UOCj/qM8UZMGerm7E7szp8yq9H/oTaCkxWTNK3KV+m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mb1d46jxOqpfyYyD2nfnMx3cBDHPnqE9YLKbWaxtZcDBFuHigvDeSyn1TFUoQ8AQZADNI1/sLNK5L3gxh7wojXmaIYK5U4WiiHdUVpjq/BpvVI16LWqNdjfzpMtXXvvMlkoJHBrgUiJDrXjl3iHKucLLKGBaq0ypnN7y1EdQbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y8sgXxn/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=QlL2yqp80P803A9v7RkNgQUpglWcX6VjZypTr1ALGt8=; b=Y8sgXxn/wJKAk5AJJZmdlB3MlI
	IqwIYk5PA0b8KQcabpbiAS19S8EbaE6B9BHMo0tZA2/7FJsf99nG8pMzjOrE/W/+GQLACCdjYnAJ5
	vJu79YKVUdnm4BWXUlpC74O6H9W7F7+k0SZ/O0vDAxImWOdmNUkGQN2SUsMeHg7CXxqhE3ghnZkCr
	fGBwXHksQBAwBCmiAfYYExpbXAZ7QuBH+wCUC4BMk9n3R+Vz07lfMppblmjFZd14OvYM2TPIVDNaM
	PJkyDSyS6U7KwMDG3SzdjV7SGf2ZtfTw8uVuikG4lMQ/lEMyPy6ad5OJiptLw4ZWq4etULJJflcWW
	glX4VveA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgrn-000000062dt-47s7;
	Wed, 17 Dec 2025 02:02:16 +0000
Message-ID: <053c515b-ac8f-4bb9-b9b0-c02c0e8f180f@infradead.org>
Date: Tue, 16 Dec 2025 18:02:14 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] kconfig: move XPM icons to separate files
To: Rostislav Krasny <rostiprodev@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
 <20251217015409.30102-1-rostiprodev@gmail.com>
 <20251217015409.30102-2-rostiprodev@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251217015409.30102-2-rostiprodev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/16/25 5:54 PM, Rostislav Krasny wrote:
> Replace deprecated gdk_pixbuf_new_from_xpm_data() with gdk_pixbuf_new_from_file()
> and update both GTK and QT frontends to load XPM icons from separate files
> in scripts/kconfig/icons/ instead of from the code.
> 
> xpm_menu_inv and xpm_void were removed and not converted into xpm files
> because they are not used since 64285dc5c41fc7a031695c2c286a2bfef9eaf2c6
> 
> This eliminates the GTK deprecation warnings at compile time, improves
> memory usage and code organization.
> 
> Signed-off-by: Rostislav Krasny <rostiprodev@gmail.com>

OK, this v3 patch works for me with both gconfig and xconfig.
Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

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

