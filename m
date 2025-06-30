Return-Path: <linux-kbuild+bounces-7751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED77AED20A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9550A3B2EEC
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 00:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747F3208CA;
	Mon, 30 Jun 2025 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F8tjvbvf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7D2F3E;
	Mon, 30 Jun 2025 00:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244894; cv=none; b=j1i3HpBmplEXtTOrCDj6g7iq3+60VOTKTqNxgvmrxpkyswhbuZAF8Y5QmMMa6HG6lOZFghY9+scjxLqpsHLx9Zr+IUyed2VEiKjGsqhywyF1yBc6xZHE3RhYp4Kv6G4Lwbi4Gcbrq61aUzj6zFJemMLGafHVZ1BEc4UAWwvyF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244894; c=relaxed/simple;
	bh=A8QWmXE0rOvlX/xY+dkHl/AL9JEi/uT7y1gUX9jF9+w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GgAlaqzXCvDeoL0XT/i7P9aY6DX4qWNusMXQiOI1vFPlmdt1gwmQJO1c2y5liiKM1BXyKEuCtz1NLY4IYFObqt2SnyDzLkf36arxaFFAme37vkUDT89QotZoreXa/HxwQP40rTTCD7NdH/77+iB5KKXvzJX16C/2V/rtRr69CL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F8tjvbvf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6WHIPqc4BWz7Az2/LbUfkYWWkU+RRHFmreWC2q2CkMg=; b=F8tjvbvf9mhVdOmNqkuPeuJ0mP
	t8BqBxIeZu3EivNAzpdJmHpZj8MUfZkv4GAQFMYWpC0umGe4vv8ovRlCstCUTfWwJIheuPqIvlwFu
	D+5h3SfRdMh65WX55GL+dSGuwB5I+l5owzSNi2/IBYrw6iM1ogt53kIto3gwX+LLDBPk6RmGyoGZ9
	6J4k0GFOLJHNf1ywZQAON/GbKEXEdJ5ryvI/XdiHQL15uR82QIjcnks8uIhzsc9kzN8Z5UZKfcJJp
	glntL+151rmNS1/IX8UuHebd613U3AEANjlfT/zTOeDX/YlX1jDwqe5vRWU+2l3lpFJr1r+apa9c4
	0US6zYaQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW2nG-00000006haW-1g0w;
	Mon, 30 Jun 2025 00:54:48 +0000
Message-ID: <c2a3814c-32d1-4673-84d6-1666c43a6c5d@infradead.org>
Date: Sun, 29 Jun 2025 17:54:44 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/66] kconfig: qconf: do not show checkbox icon for
 choice
From: Randy Dunlap <rdunlap@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-3-masahiroy@kernel.org>
 <8f13413a-0a4f-46c2-8d3a-7e43126d70dc@infradead.org>
Content-Language: en-US
In-Reply-To: <8f13413a-0a4f-46c2-8d3a-7e43126d70dc@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 5:51 PM, Randy Dunlap wrote:
> Hi,
> 
> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
>> When you select "Show All Options" or "Show Prompt Options", choice
>> entries display a check box icon, but this has no point because
>> choice is always y since commit
>>
> 
> I don't see a check box icon beside the choice entries either before
> or after this change. Or do you mean a Radio Button?
> 
> (setup: make defconfig for x86_64 in 2 subdirs, one pre-patches
> named X64, one post-patches named xx64.)
> 
> Enable Show Prompt Options for both testing windows.
> 
> E.g., under "Processor types and features", scroll down on the right side
> to "TSX enable mode". Under it in each in pre-patches and post-patches,
> I see buttons to choose which TSX enable mode to select. They look the
> same both pre-patch and post-patch.
> 
> What am I missing?
> 

Yep, user error. I didn't back out the patches to build xconfig.  :(
My bad.


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> 
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>>
>>  scripts/kconfig/qconf.cc | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
>> index eaa465b0ccf9..546738a5c3b1 100644
>> --- a/scripts/kconfig/qconf.cc
>> +++ b/scripts/kconfig/qconf.cc
>> @@ -92,7 +92,6 @@ void ConfigItem::updateMenu(void)
>>  {
>>  	ConfigList* list;
>>  	struct symbol* sym;
>> -	struct property *prop;
>>  	QString prompt;
>>  	int type;
>>  	tristate expr;
>> @@ -105,11 +104,10 @@ void ConfigItem::updateMenu(void)
>>  	}
>>  
>>  	sym = menu->sym;
>> -	prop = menu->prompt;
>>  	prompt = menu_get_prompt(menu);
>>  
>> -	if (prop) switch (prop->type) {
>> -	case P_MENU:
>> +	switch (menu->type) {
>> +	case M_MENU:
>>  		if (list->mode == singleMode) {
>>  			/* a menuconfig entry is displayed differently
>>  			 * depending whether it's at the view root or a child.
>> @@ -123,10 +121,13 @@ void ConfigItem::updateMenu(void)
>>  			setIcon(promptColIdx, QIcon());
>>  		}
>>  		goto set_prompt;
>> -	case P_COMMENT:
>> +	case M_COMMENT:
>>  		setIcon(promptColIdx, QIcon());
>>  		prompt = "*** " + prompt + " ***";
>>  		goto set_prompt;
>> +	case M_CHOICE:
>> +		setIcon(promptColIdx, QIcon());
>> +		goto set_prompt;
>>  	default:
>>  		;
>>  	}
> 
> Thanks.

-- 
~Randy

