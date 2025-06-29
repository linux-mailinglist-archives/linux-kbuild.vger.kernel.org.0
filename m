Return-Path: <linux-kbuild+bounces-7748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D08AECFCB
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 21:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83D318944E7
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F260C1494D9;
	Sun, 29 Jun 2025 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e18Kdu1w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE51799F;
	Sun, 29 Jun 2025 19:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751223775; cv=none; b=c9pfMVvOCxRsiJ1ETqB59mT6AvvQ4I/d4T5t5NfRzOrCAdgODgy4DRR0Jj4eyPQ+qlWWySKnDt9LJ7Fzy4gR7K89Zb1aNQz3JoEC6a9IKzt6FFlpTm8kqrSqaQTokiFtQ93ujPT0UH982TyPWPPU33cSQTDxefYYjpZuF/OZAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751223775; c=relaxed/simple;
	bh=UwAtAuUNurGbVARCW4Sx+eI0xiWAbL99/KqmC6wtqUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlkeWLmdwzjECHuWt9aZ0TMqM6mjoLJIk50Uf48IYTSsVeylzUCHylUK0JPkegY/FeNFMpTYIjd85uGQOxuNW4FqchhEPThAiMgwRnXE/tXBQ5WQcEqGm/KZYvBaObz4fiMcKp8i+YHwcpZFOcwlMIhGz6JI/WlZJkR4oEFsN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e18Kdu1w; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uEDM3HRk9n9VR8fiWw/HrLjw5m6tjk6078UGqgBCTuE=; b=e18Kdu1wYRVFQ5sGrgTVFIIkRE
	KKblHQW7cuEwl9eLjqMkrpR0iQ8ai2ABmbzvT81bx6CTsSItsvehLx7GnqBI6dcacPdKhK8vdYx24
	MMVtiUF02M9lECVRMTjc434z4hKCAJLd7AQ7lscctW611VZuw8SoiQwBBaedixlmR6qCJItlZ6kJ8
	nSupKXTxWpuDRAPZvuSWvAziEbbBlPG3Ing/NcY8pGK0z5zwXBjN+fu1IP9cgvwayAFWkOBWOmrf5
	UbSvbqjD3liz4GcSGTF2mmAsveTpon0LDJnEAHgOED0GgyObdbfXYAdHnMZk+i6/TVuP0pZcs8veW
	XuD0v0LQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVxIg-00000006eNJ-2Em9;
	Sun, 29 Jun 2025 19:02:51 +0000
Message-ID: <e23fc081-8a74-45cd-9250-977c6e59d69f@infradead.org>
Date: Sun, 29 Jun 2025 12:02:47 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] kconfig: improve gconfig
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> - Code refactoring
> - Migrate GTK 2 to GTK3
> - Fix all compile warnings
> 
> 

Hi,

If I am testing your recent *config patches, should I replace all gconf
patches from the patch 00/66 series with these patches?

Thanks.

> Masahiro Yamada (9):
>   kconfig: gconf: fix behavior of a menu under a symbol in split view
>   kconfig: gconf: use configure-event handler to adjust pane separator
>   kconfig: gconf: rename display_tree_part()
>   kconfig: gconf: rename gconf.glade to gconf.ui
>   kconfig: gconf: migrate to GTK 3
>   kconfig: gconf: replace GtkVbox with GtkBox
>   kconfig: gconf: replace GdkColor with GdkRGBA
>   kconfig: gconf: replace GtkHPaned and GtkVPaned with GtkPaned
>   kconfig: gconf: show GTK version in About dialog
> 
>  scripts/kconfig/gconf-cfg.sh              |  11 +-
>  scripts/kconfig/gconf.c                   | 146 ++++++++--------
>  scripts/kconfig/{gconf.glade => gconf.ui} | 202 +++++++++++-----------
>  3 files changed, 171 insertions(+), 188 deletions(-)
>  rename scripts/kconfig/{gconf.glade => gconf.ui} (83%)
> 

-- 
~Randy


