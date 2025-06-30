Return-Path: <linux-kbuild+bounces-7760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD2AED275
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B153F188E72C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703C2185B61;
	Mon, 30 Jun 2025 02:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JmK++WOB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07582EAF6;
	Mon, 30 Jun 2025 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251237; cv=none; b=F/9yiOVc0G+G/Yefh9ItoTGm2fEFw8CMIjB4D3oNnnwsLIYPE9q5mlCLr99HYISHlZvNeAAArCVJwIgm34tM5wAxLY8X8dHPAUOajnSPD4nqrHQr5aH9H9Bnd8U4NwrjkJt3XJ3IiS7CBromdHe4TkB29KLnFdsCidVKSZe+Lt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251237; c=relaxed/simple;
	bh=34uGY7zT5D22LO8JJC1zH/+TdWSbLVFD6zdn3atmFgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpRz3WmVBW3bBvWpFcqG+5KRJ0rhSpoAI0h+4Q08KLA4iDgY+wX6L4L6dxvGaReJfHvK1R9TUdXCRIzC3K1xJQr+a9k0wiRxgyThS0qRECE7nZFiEisv37abrQ1sHM84t3zuxtUjCI9CwQbDX7ngK+1hrO4wafL/d3Ucc1facVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JmK++WOB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J7m4+7hZWAyaQqqHmYe9PTp1FpqSsqjIOa3lbYhL62U=; b=JmK++WOB7lPSThdB5kattjpMEF
	2DXbGk9MBpEm5BNmLDixoP7aGDrdLzKk9c3WubuaPKaLWarZQzYHmcD0nHQzSyyCknU+ln4n2RvOB
	TFYz2P+vzQiF1C/eLxn5+7+oUrmK6yCj621Ot51klNNn3ovqaIqJ1sg2ctk7WS0wbxNmf9aSz9ObI
	ZqO/NBGknJWSxOdgiKHscr3VW9GSsfWMMW1Rcx3oj3TO1NWvk/mRiNer3UI2cN9NTH7ZRxSzp/sMb
	dS9LmCq8XfmnMQU2+ueqPc7HspdVvzG/vypu25Q313+G9jV0qqwmYFBroSRDeHydkAVM+6nS9HNKL
	NqmHYySQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4Rc-00000006iJB-2jej;
	Mon, 30 Jun 2025 02:40:34 +0000
Message-ID: <85b71c14-485e-4c85-9801-c61f7419abe3@infradead.org>
Date: Sun, 29 Jun 2025 19:40:30 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/66] kconfig: gconf: remove unneeded variables in
 on_treeview*_button_press_event()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-22-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-22-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> No all position parameters are used here. Passing NULL to

  Not all

> gtk_tree_view_get_cursor() or gtk_tree_view_get_path_at_pos() is
> allowed. [1] [2]
> 
> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.c#L12638
> [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.c#L12795
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/gconf.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

-- 
~Randy

