Return-Path: <linux-kbuild+bounces-7332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E80ACA842
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 05:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF051898792
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 03:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B3C3AC1C;
	Mon,  2 Jun 2025 03:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IjZBIKrT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016D2C3248
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 03:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748835446; cv=none; b=CJtmxxgOLhzFtk7A/Jclm95IwoZIWHJsJP2PDjfu4NIOIS5ZE82xYvfKp91WNuR1eAiO3GOhEVpwMnvZGQt/USysZy4C7uuXFKwLmssosZ4xes1110IT0pfAdf0GKSxZoOLUs1CCK47/6F+s7Xm8uQbHWhhE6N4qBpHlyLBBgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748835446; c=relaxed/simple;
	bh=8aRUjLwoLFYu8SLoa7m4osmu0t9UtLMyAMgL6mHuUVE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z41TDsn0+KMS5j+MaosKFa0m47dryO9LE4cjCAMJ1bHzvwqcSanfCEr6F+QtmVkObcHyKwfTwTCXOhgUiOThGVR38grnvONWXUUVKwRD6vHbcIQe/VxKtWYUQkunSbJw+j57LOaPCPsEtyFegZRMzIvNTW1+G2XvVt/wdr4Ox0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IjZBIKrT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+5cTwwa62GVIaSW7MxRvALOS9QLp0pzwUq/+orTFox8=; b=IjZBIKrTwjFCXvqBzypbjZuhtV
	XNzs5MeyiOPFohI23s5VOfqn7ipyki+TanvlHvS0vxu5YGiAJMwkfjeMgY7kneN3NE3DFkBGu6j3E
	AQoSeVpu4tNlNUXsQrlOSMiGOi+Q8E60YfOPqZn0ASG2snMgIRivaMYxiPsPCDWNbNQPT7Ag1Z6ga
	i46ABiYg3DUWze3uPEoV5xUGso0iWYcng5mXYbU7J1B4kZiBNv7OB6lA9GapoIg4GFIOo5MQn9zom
	osbRUyIuMLmws740Q8v9yiT8+nOIYoi1jQahbZfDEDLlOTFDIi79DRg8xJ6bYMnihnQVPT1QcJad6
	y9ZBaZhw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLvzG-00000000aIO-1KyA;
	Mon, 02 Jun 2025 03:37:22 +0000
Message-ID: <9ad8db45-0de3-4803-8747-e1259d1f2219@infradead.org>
Date: Sun, 1 Jun 2025 20:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] kconfig: comparison feature between two .config files
 added to mconf
From: Randy Dunlap <rdunlap@infradead.org>
To: Franco Martelli <martellif67@gmail.com>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
 <a7fb70de-7bf1-4208-a62c-2b8b9d0ec6bf@infradead.org>
Content-Language: en-US
In-Reply-To: <a7fb70de-7bf1-4208-a62c-2b8b9d0ec6bf@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/1/25 6:04 PM, Randy Dunlap wrote:
> Hi,
> 
> 
> 
> On 6/1/25 11:40 AM, Franco Martelli wrote:
>> Dear Linux hacker,
>>
>> I've written a patch that allows to compare the tristate value of two
>> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
>> It can be useful when customizing the .config file, personally I use it
>> to compare my .config file with the one provided by the software
>> distribution.
> 
> I like this concept. Thanks.

Of course there is also scripts/diffconfig but it can be a bit noisy.

>>> A screenshot of the new mconf view is available here:
>> https://i.is.cc/2cpIXxoP.jpg
> 
> That virtual terminal is wider than 80 columns.  :)
> 
> Please make <Compare> fit into an 80-columns terminal (squeeze spaces on that line).
> 

See patch below.

>> The patch was originally written on Linux 6.1 amd64 series tested on
>> 6.1.137 kernel version.
>>
>> The patch has a limitation, it only show the tristate value (Y/N/M) not
>> differences for symbol with a value (string), but it also marks with a
>> "#" the symbol missing in the loaded .config, meaning therefore the
>> symbol as a new feature.
>>
>> o I've also added support for the more canonical <F1> key to show inline
>> help window, in addition to <?> and <h> keys.
>>
>> o By pressing the <F2> key you will get a view with all the symbol
>> differences listed.
>>
>> o By pressing the <F4> key you'll save to a file the differences.
> 
>    I would appreciate at least one alternate to F2 (Compare) and F4 (save
>    diff to file) since my window manager (xfce4) intercepts Function keys.
> 

See patch below. You may use it if you care to.

>> o Added help text that it describes the new features.
>>
>> If you like this patch, it would be nice that other kconfig GUI client
>> such as nconf, gconf and qconf be patched in order to have compare
>> capability for them too.
>> This software is under GPL-2.0 license.
>>
>> Franco Martelli (1):
>>   Kconfig: Added compare capabilities for mconf
>>
>>  scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
>>  scripts/kconfig/expr.h             |   9 ++
>>  scripts/kconfig/lkc.h              |  11 ++
>>  scripts/kconfig/lkc_proto.h        |   4 +
>>  scripts/kconfig/lxdialog/menubox.c |  13 +-
>>  scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
>>  6 files changed, 376 insertions(+), 18 deletions(-)

---

Adjust the locations of the menuconfig commands so that the new
"Compare" command fits inside an 80-column-wide terminal.

Add shortcuts for the new F2 (add 'D') and F4 (add 'F') keys
in case function keys are intercepted by some other software layer.


Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kconfig/lxdialog/menubox.c |   16 ++++++++++------
 scripts/kconfig/mconf.c            |    4 ++--
 2 files changed, 12 insertions(+), 8 deletions(-)

--- linux-next-20250530.orig/scripts/kconfig/lxdialog/menubox.c
+++ linux-next-20250530/scripts/kconfig/lxdialog/menubox.c
@@ -133,15 +133,15 @@ static void print_arrows(WINDOW * win, i
  */
 static void print_buttons(WINDOW * win, int height, int width, int selected)
 {
-	int x = width / 2 - 28;
+	int x = width / 2 - 30;
 	int y = height - 2;
 
 	print_button(win, "Select", y, x, selected == 0);
-	print_button(win, " Exit ", y, x + 12, selected == 1);
-	print_button(win, " Help ", y, x + 24, selected == 2);
-	print_button(win, " Save ", y, x + 36, selected == 3);
-	print_button(win, " Load ", y, x + 48, selected == 4);
-	print_button(win, "Compare", y, x + 60, selected == 5);
+	print_button(win, " Exit ", y, x + 10, selected == 1);
+	print_button(win, " Help ", y, x + 20, selected == 2);
+	print_button(win, " Save ", y, x + 30, selected == 3);
+	print_button(win, " Load ", y, x + 40, selected == 4);
+	print_button(win, "Compare", y, x + 50, selected == 5);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
@@ -366,6 +366,8 @@ do_resize:
 		case ' ':
 		case 's':
 		case 'y':
+		case 'd':
+		case 'f':
 		case 'n':
 		case 'm':
 		case '/':
@@ -398,8 +400,10 @@ do_resize:
 			case 'z':
 				return 10;
 			case KEY_F(2):		/* Differences between .config files view */
+			case 'd':
 				return 40;
 			case KEY_F(4):		/* Save to file differences between .config files */
+			case 'f':
 				return 60;
 			case '\n':
 				return button == 5 ? 50 : button;	/* Workaround for Compare button */
--- linux-next-20250530.orig/scripts/kconfig/mconf.c
+++ linux-next-20250530/scripts/kconfig/mconf.c
@@ -137,9 +137,9 @@ static const char mconf_readme[] =
 "built-in, _: for a symbol excluded, M: for a symbol as module and #: for\n"
 "a symbol absent in the loaded \".config\" file, meaning therefore a new feature.\n"
 "\n"
-"Once loaded the .config file to compare, using the <F2> key a view will\n"
+"Once loaded the .config file to compare, using the <F2> or 'D' key a view will\n"
 "be displayed listing the differences between the two .config files, using\n"
-"the <F4> key instead, you can save to a file these differences.\n"
+"the <F4> or 'F' key instead, you can save to a file these differences.\n"
 "\n"
 "Other information\n"
 "-----------------\n"


-- 
~Randy


