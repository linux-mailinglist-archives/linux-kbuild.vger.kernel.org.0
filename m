Return-Path: <linux-kbuild+bounces-7764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5AAED2C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2ED1895343
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E7E17A305;
	Mon, 30 Jun 2025 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XssOOATy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170B199BC;
	Mon, 30 Jun 2025 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252323; cv=none; b=curax0wDRUJs2oSK1ib3S1dnIRCVXfpVCmS+YmQknye1spPy7oT+swE7R8qpxjuO1IN8yxAMUcgosb/MqzSftGljrzxIT0jLrJ24oyY9zHRr8qzlVdvuzvkfLE6EOviEwnsMb3ZJZdwROIFvHVK7I9fza49HYYqq5bPJLltV9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252323; c=relaxed/simple;
	bh=nSsAWJoUAxdJVdFYpT+KG8DsC7I6ERGRN8NrBEv/B6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwVVL7xBvN57AHNwpQ42WWo7scoC1oODx6rZTWLRjJA8yWnk0A8/H0KdewxlnROyHjiRMn96TMt1/Spvi1po2LnFjIxQbkLPv07Djy/jRJ4cQwQ6kHzRDrMHP0D2v2AfqL9HGPFLkag0X+1BY3ljdWviXzLDOw5pjwTOOUJ25L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XssOOATy; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ja9ktEuFa6H8pogNrZFGr6PVl2YGfhxqscV+kYYXpLY=; b=XssOOATykHc1PCTN+iuYGJmtHv
	d0nR7m++QkG9GWMehHF85q4MAzHSCp6cSYlvWX8QErf95oaCaIQlXR4ENVbGxw8Q+CFIwzy1sIrCw
	IB7cVebSCWamPey5XG2BT2SUga8jQefvw/q99AfaypNrvueUJb4eidGewY8yBeMmGbFOMKwdP3vDW
	ZDG1hAcakgJMxzRoOJk5CvmXHC+5wEZ2zZLOuamJ3QeJwHMlL0+Dy8sfHV9+qaSpUytpSXKNRFuAG
	H44sdGLns9q4OGSGD03C00wtrs2m1X3MptX4YloI2HMCd1a/WQNpoC03lxntV0W0zJYPjg08PoxOk
	zBX9uXVw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4j9-00000006iP1-2e7Q;
	Mon, 30 Jun 2025 02:58:40 +0000
Message-ID: <c6033a11-82ae-49a9-aec1-ac820b9ce6ee@infradead.org>
Date: Sun, 29 Jun 2025 19:58:37 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/66] kconfig: gconf: remove
 glade_xml_signal_autoconnect() call
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-31-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-31-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> Now that all signals are connected manually, this is no longer
> unnecessary.

Double negative. Or is that what you meant?

is no longer necessary.
is now unnecessary.

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/gconf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 02bbb7ce4c4a..09537245213a 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -1120,7 +1120,6 @@ static void init_main_window(const gchar *glade_file)
>  	xml = glade_xml_new(glade_file, "window1", NULL);
>  	if (!xml)
>  		g_error("GUI loading failed !\n");
> -	glade_xml_signal_autoconnect(xml);
>  
>  	main_wnd = glade_xml_get_widget(xml, "window1");
>  	g_signal_connect(main_wnd, "destroy",

-- 
~Randy


