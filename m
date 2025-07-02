Return-Path: <linux-kbuild+bounces-7826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0CAF0975
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 05:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33B24E34AA
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 03:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CD9157A72;
	Wed,  2 Jul 2025 03:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GcyyJuL2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF41C07C3
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Jul 2025 03:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428513; cv=none; b=qvvaaBfhNdelgb7JhqvEjemeDaVR4lxbHT7DEry5oZJY+fObCzi7j3mQVKe8Wt3WXnARoViYdVo+SfgjwOCQIrN5aAgXJP7ELuRSSHOWrre/N3agNf676vCHWIhUoPKDyzmwe2TQ+gMIkZTTInHSOTiXlA+F+rK5Uq9mzkJGobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428513; c=relaxed/simple;
	bh=mXKTEXAqAmIBO9+4+jzltPy2IU24lzg9eRgU4UmJxJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn6XBFwNZi4WomVo4NUJnAzavjkDEEHIXZB7NWnHfSvFEhgfXmCSOb3KW9/HpABNF1z+zhVQDWI/ERpZ9N6kWDX4BwtgCNNyuOUqkk32OnY/LBE66q6bO2gu0MWuotXGcNhvB5kAbzJZLDtxU0wwUVXWEnLU42+JDjxC9BZBXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GcyyJuL2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ByEXhXgCXR4aq+mnQ0EgBtuKgrhwtHSWtC/k3YhIz38=; b=GcyyJuL2pBnF0gzo0ctiQwpY/j
	OcDb9YfqCo3hFhS4YiP8726b7LhRlzTQupvd4RphYlqmGdmxQpRoOVmFcaRpj31YVYKUQ90/NdkUy
	oDa3V+H8WpUi1zFKr9eRHm2K4j61PmM5eo46jPfJ1DU1RlIpugBf4NRxjUwE17A/auLd3rgCEJPo8
	DK2PtvvIG04htpEV7DgNhuOobA7asuI/gWZqz5FWzCaton26uMLx22YKH4EchJPirMWrnOT60zVa3
	7Y2RpWxmpkP+mT2X4jDrX/C1QiRxJMZrT0HwA1BpEConX9BwK1pkj7U7uyXK+pfWwiFU9Y7asS3TC
	Fmbf9eww==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoYu-00000007EoI-1Td5;
	Wed, 02 Jul 2025 03:55:09 +0000
Message-ID: <bbaed03f-8a19-4e19-8312-bd94423200b0@infradead.org>
Date: Tue, 1 Jul 2025 20:55:06 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/1] kconfig: improve gconfig
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20250701121444.950640-1-masahiroy@kernel.org>
 <a40c36ff-7f1b-4873-9aa2-b6864710c262@infradead.org>
 <CAK7LNAQ3gJ9+=7iGeM=k2TT2+VGxQ6hEni=+t-rD_6G_dbyBRg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQ3gJ9+=7iGeM=k2TT2+VGxQ6hEni=+t-rD_6G_dbyBRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/1/25 7:13 PM, Masahiro Yamada wrote:
> On Wed, Jul 2, 2025 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>

>> But I do have one question/annoyance: why does the help/message panel
>> always switch back to:
>>   Kernel hacking
>>
>>   There is no help available for this option.
>>
>> Is Kernel hacking the last entry in some (menu) list?
> 
> Good catch.
> I do not know why "Kernel hacking" is displayed, but this is a bug.
> 
> The following small diff on top of gconfig-v3 will fix the issue.
> 
> 
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 775f9b5e10f0..520c0542426f 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -53,6 +53,7 @@ enum {
>         COL_NUMBER
>  };
> 
> +static void text_insert_help(struct menu *menu);
>  static void display_tree(GtkTreeStore *store, struct menu *menu);
>  static void recreate_tree(void);
> 
> @@ -92,6 +93,8 @@ static void _select_menu(GtkTreeView *view,
> GtkTreeModel *model,
> 
>                         selection = gtk_tree_view_get_selection(view);
>                         gtk_tree_selection_select_iter(selection, &iter);
> +
> +                       text_insert_help(menu);
>                 }
> 
>                 _select_menu(view, model, &iter, match);
> 
> 
> 
> I will fix up the code locally.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

