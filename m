Return-Path: <linux-kbuild+bounces-7774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CAAED3C9
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 07:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D60A7A1F5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0281A0B0E;
	Mon, 30 Jun 2025 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B7e/6cPB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257936D;
	Mon, 30 Jun 2025 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261010; cv=none; b=f4Y7iPZP3qbx7ZSp6b6xhS1/eKbMtqcOeaNH3SX++s2crrvjalqVQL72R6M9P/vxFowz0FO4BGopd/rL06AmTCUGwmn9MJAAWPPPb7QTpPPkJAwuGgXHK+Eo1lmQlcJcb3T5gOLKEhiVTQdtEyAtbgUv2Ryjz0yMoIoiMANgqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261010; c=relaxed/simple;
	bh=YTRZdrIxCxUxHtAYP4X8KIzIxTL/soLwFr8SnoDwm0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeKKDE9JtD2eRWy1WS0EaU1aOl0ybTbjz9X6kCZ8UXdJ85cinz7+a3SBTBAO7fZ0npopRZfvct2AWeeHjqEtDwolnbaPdA8AWLWXVVg1qQhPCq8CvswA6wLEbR5qUCk1M2ShfjB3FhfMWnklE7se6UMcJICORVReJxmjw7f9A9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B7e/6cPB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oWsKXe68DvpAWF7HswM/MgO5YgJaKB+E31n5nldhin4=; b=B7e/6cPBhpEVoN27sqj7C6A4so
	Bn3/p6Q/dSOKMDWWBakUdr7DgEM9SjCRounC4MaOCpUEzn4heoKQrDXJxKGwrjREOtWjt2XG2pQ/R
	nG0YdvLq53/AucAr6RZEBiccjT2ZK81nNJltQLFjZ1++fHp6t4+fYw4x5EKleKj2Bh425AVlw2enp
	t61XbsyyGPhmJ8Roa5LGXVPeMevr5EmCkO6oNCBO1iOpo5LCjPUh75gaQbJts0gpXhQ27MSffn6Po
	Srn2Lodey/aaCfIANHG6GNm6P8BVM6VGLpkUr+T1EV3OtnkhY3ha+1LBpXSpEZCnS/+26C77zm+9I
	gFQVZ4KA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6zG-00000006jFu-21Sn;
	Mon, 30 Jun 2025 05:23:27 +0000
Message-ID: <02fb5ced-8ff0-4bc3-9c84-c2a2594f8b25@infradead.org>
Date: Sun, 29 Jun 2025 22:23:24 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 53/66] kconfig: gconf: use size_allocate event handler
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-54-masahiroy@kernel.org>
 <CAK7LNARxjFmzeP8-B3JcUbYaiJF_cKe_VNbX_f-WYqW4E3mbNg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNARxjFmzeP8-B3JcUbYaiJF_cKe_VNbX_f-WYqW4E3mbNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/29/25 10:56 AM, Masahiro Yamada wrote:
> On Wed, Jun 25, 2025 at 12:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> The size_request event is not available in GTK 3. Use the size_allocate
>> event handler instead.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
> 
> This has a regression - with this, we cannot move
> the horizontal separator between in the right pane.

Between the menu items and the message area?
That's what I see.

> 
> I will use the "configure-event" event instead.
> 
>>
>>  scripts/kconfig/gconf.c | 20 ++++++--------------
>>  1 file changed, 6 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
>> index b86d54c222e3..6487d6a0dd9d 100644
>> --- a/scripts/kconfig/gconf.c
>> +++ b/scripts/kconfig/gconf.c
>> @@ -660,21 +660,13 @@ static void on_window1_destroy(GtkObject *object, gpointer user_data)
>>         gtk_main_quit();
>>  }
>>
>> -static void on_window1_size_request(GtkWidget *widget,
>> -                                   GtkRequisition *requisition,
>> +static void on_window_size_allocate(GtkWidget *widget,
>> +                                   GtkAllocation *allocation,
>>                                     gpointer user_data)
>>  {
>> -       static gint old_h;
>> -       gint w, h;
>> +       gint h;
>>
>> -       if (widget->window == NULL)
>> -               gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
>> -       else
>> -               gdk_window_get_size(widget->window, &w, &h);
>> -
>> -       if (h == old_h)
>> -               return;
>> -       old_h = h;
>> +       h = allocation->height;
>>
>>         gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
>>  }
>> @@ -1000,8 +992,8 @@ static void init_main_window(const gchar *glade_file)
>>         main_wnd = glade_xml_get_widget(xml, "window1");
>>         g_signal_connect(main_wnd, "destroy",
>>                          G_CALLBACK(on_window1_destroy), NULL);
>> -       g_signal_connect(main_wnd, "size_request",
>> -                        G_CALLBACK(on_window1_size_request), NULL);
>> +       g_signal_connect(main_wnd, "size_allocate",
>> +                        G_CALLBACK(on_window_size_allocate), NULL);
>>         g_signal_connect(main_wnd, "delete_event",
>>                          G_CALLBACK(on_window1_delete_event), NULL);
>>
>> --
>> 2.43.0
>>
> 
> 

-- 
~Randy


