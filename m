Return-Path: <linux-kbuild+bounces-7780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F4AED4B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 08:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FD8188F1FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D728214210;
	Mon, 30 Jun 2025 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oQcTc7UP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC321019C;
	Mon, 30 Jun 2025 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265278; cv=none; b=EoLuYPRulXhFaq68Qx05ffEDoc8xK98XEFrVf3QxY2MTwiUTSpwr14cq4yBx9QVf4u+m8pbotnMYet9LsWY0mp0zr4WPpUr214CAsh7BkoA9fPtUjchCfCN+05mekaLVy8jeGYqAB2CrpIVlzbL0XHDa3XTtkmC7FRuvVMo2zj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265278; c=relaxed/simple;
	bh=EX/DrcTs4NnW+C+0cQWgo7TtCoQLAitpU4wTwPlg/jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyDC4c7TAezpTTAcMXC6qbAw+5clGWIoW7TZ4YMrKx9KNsRWXlK+6ZkPLLA125m/Z3F1VEYsUw0ssyoqOqr7QtcbqmKZ8DqiDSAtcqEzQDbZqQw+UPnzoYmQvLhkyIyVyS4TllxGm+qDDCN823UM7xo7RqxKCPEucReWDx4yaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oQcTc7UP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FelpBCFOh1BjHHtwT6R7L0EkhiCE0oQ9/LmiSaVdQfM=; b=oQcTc7UPW+VNSZHcjdmgIUENyg
	5BXFDg/UkX6T9Jl1M0fhlyQmRkgmtzPS4R677A1mbti5skH7FmbTjmh+qsnJntziOppLADPTXPdrn
	RWiUQ/FobS03bHJUbBJjyJYlUtVlpXKXhK0Hhh+q9iMHL7yanx4PAjJCvKWRTECC+Ico45cLEW4Sn
	e7O/ev4rC3h7y3A9oQ46XmsoOXFcieEhj76TmO7bYJUG30E4maGhr1JrCVAD9ANpUMhbRh/5KevX5
	XC0jjJPdrCVtle0sNDBTN/kuAAMHXr3QHHfzzgTi1gfY7kJrouVHeCkvotx5G+e7EGY+/GcgoXSjc
	NIfd7OvQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW866-00000006jft-3oxj;
	Mon, 30 Jun 2025 06:34:35 +0000
Message-ID: <85d530f3-0c27-48e0-b09b-470c16e08004@infradead.org>
Date: Sun, 29 Jun 2025 23:34:32 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/66] kconfig: set MENU_CHANGED to choice when the
 selected member is changed
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-2-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> In gconf, choice entries display the selected symbol in the 'Value'
> column, but it is not updated when the selected symbol is changed.
> 
> Set the MENU_CHANGED flag, so it is updated.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Probably not related to this change (AFAICT), but I was trying to
reproduce this problem and I cannot do it.

To enable an option (any options, choice or not), I have to double-click
on it or (sometimes, not for choice) I can use Y / N / M on the keyboard.
When I do either of those, the value (including a choice value) is changed.

I mention double-click only because the Help text (Information) says that
clicking will cycle thru Y/M/N.

The Information also says that "dot indicates that it is to be compiled as a module".
I see more of a Dash or Hyphen or just a horizontal bar.

Thanks for reading...

> ---
> 
>  scripts/kconfig/symbol.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index d57f8cbba291..26ab10c0fd76 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -195,6 +195,10 @@ static void sym_set_changed(struct symbol *sym)
>  
>  	list_for_each_entry(menu, &sym->menus, link)
>  		menu->flags |= MENU_CHANGED;
> +
> +	menu = sym_get_choice_menu(sym);
> +	if (menu)
> +		menu->flags |= MENU_CHANGED;
>  }
>  
>  static void sym_set_all_changed(void)

-- 
~Randy


