Return-Path: <linux-kbuild+bounces-8067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 929F6B0AEBF
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 10:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E70CA7B7231
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jul 2025 08:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D419239E78;
	Sat, 19 Jul 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iWJM010U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4B9230BEC;
	Sat, 19 Jul 2025 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913900; cv=none; b=SYGPyR7b6GuiqFAb5hjwoRaSeyQX4hybtCegHvotoR+XCeNtxMadMcck2HjmuU7DTxvOgBlziKmRHvPEDPnc9Jwgzh5A04bkVChzfekzb1Uriu70gB7k4tY1yXBLMyLrHHml2QAdIn4kT5FXIs7HZS5ftiKJz2MQr9QzyCZXjdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913900; c=relaxed/simple;
	bh=p/4tHwIU5J+HL1pupPVCrwBPj9rwctf3mYnTChrWMOw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NEIAGK1cuoDjLtMNUfiv41uWMeSx8DT3eGBqVcCWFNe6w+D8QxWk5o/BoFnkrRvuzbKKVHHBWksiZZBbUgF5xX+zrUpTl6+4msnD3AOa4PyVvxbGbQZ+pNaTyEiOBTdRjTGVP9AUu3VGJnq3bR25VMy3vZzrHM1kXNxri3VwxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iWJM010U; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vM5C1L9nTY4BtLK1GnGkd6DJjdD1eYDCS+ci1UjSURE=; b=iWJM010UbLNSLkIBn+GaoZ+gv7
	IwunvaYz3n0gKBh/0OiKVoyOuDc3R5fqZvAGQDSoPxth6Gni/EHB/ff468fPFIiDRrAVk0s1oUHJl
	C4iSPUTbHsOJP4+1IOrqfeL9d5CWDA0a4TkeQdCzD+V3TX/Z2CDjOsvlLPubC9fIwSskauhMEDFEH
	qa5VJkHoXT3OFIvWT3ZgWkLvXKD+lOIYRIZds+yzsDamTLSw7+CB8QOBbVibpbgLQKSaMOkCSuep3
	B4DcvOjcLpS2Ic6f+xusVKQV9vMJ0dEy//VZ+lEFtEzw1wl5KxzMPtGKbrBlKlJzZtcjud5KQq5O8
	sbAi8Ucw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud2ym-0000000E2Yp-3Mxg;
	Sat, 19 Jul 2025 08:31:36 +0000
Message-ID: <571ac74b-f632-44f3-ae62-730717bf4465@infradead.org>
Date: Sat, 19 Jul 2025 01:31:36 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Shankari Anand <shankari.ak0208@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [BUG linux-next] nconfig: uncleared lines of text on help screens
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


If I revert
  commit 1b92b18ec419
  Author: Shankari Anand <shankari.ak0208@gmail.com>
  Date:   Thu Jun 26 00:36:54 2025 +0530
    kconfig: nconf: Ensure null termination where strncpy is used

this problem goes away.

When using F1, F2, or F3 (Help, SymInfo, or Help 2), short lines
of text are not cleared (blanked, space-filled).

Example F1:

  ┌── Global help ───────────────────────────────────────────────────────────┐
 ┌│                                                                          │┐
 ││ Help windows                                                             ││
 ││ ------------                                                             ││
 ││ o  Global help:  Unless in a data entry window, pressing <F1> will give `││
 ││    you the global help window, which you are just reading.F1> will give `││
 ││    you the global help window, which you are just reading.F1> will give `││
 ││ o  A short version of the global help is available by pressing <F3>.ive `││
 ││ o  A short version of the global help is available by pressing <F3>.ive `││
 ││ o  Local help:  To get help related to the current menu entry, use anye `││
 ││    of <?> <h>, or if in a data entry window then press <F1>.y, use anye `││
 ││    of <?> <h>, or if in a data entry window then press <F1>.y, use anye `││
 ││    of <?> <h>, or if in a data entry window then press <F1>.y, use anye `││
 ││ Menu entries>, or if in a data entry window then press <F1>.y, use anye `││
 ││ ------------>, or if in a data entry window then press <F1>.y, use anye `││
 ││ This interface lets you select features and parameters for the kernelye `││
 ││ build.  Kernel features can either be built-in, modularized, or removed.`││
 ││ Parameters must be entered as text or decimal or hexadecimal numbers.ed.`││
 ││ Parameters must be entered as text or decimal or hexadecimal numbers.ed.`││
 ││ Menu entries beginning with following braces represent features that.ed.`


Example F2:

     ┌── Sysfs syscall support ──────────────────────────────────────────┐
 ┌── │                                                                   │────┐
 │   │ CONFIG_SYSFS_SYSCALL:                                             │    │
 │ [*│ CONFIG_SYSFS_SYSCALL:                                             │    │
 │ [ │ sys_sysfs is an obsolete system call no longer supported in libc. │    │
 │ [*│ Note that disabling this option is more secure but might breakbc. │    │
 │   │ compatibility with some systems.is more secure but might breakbc. │    │
 │ [ │ compatibility with some systems.is more secure but might breakbc. │    │
 │ [*│ If unsure say N here.me systems.is more secure but might breakbc. │    │
 │ < │ If unsure say N here.me systems.is more secure but might breakbc. │    │
 │ [*│ Symbol: SYSFS_SYSCALL [=n]stems.is more secure but might breakbc. │    │
 │ -*│ Type  : boolS_SYSCALL [=n]stems.is more secure but might breakbc. │    │
 │ -*│ Defined at init/Kconfig:1600ems.is more secure but might breakbc. │    │
 │ [*│   Prompt: Sysfs syscall support.is more secure but might breakbc. │    │
 │ [ │   Location:ysfs syscall support.is more secure but might breakbc. │    │
 │ [*│     -> General setupall support.is more secure but might breakbc. │    │
 │ [ │       -> Sysfs syscall support (SYSFS_SYSCALL [=n])might breakbc. │    │
 │ -*│       -> Sysfs syscall support (SYSFS_SYSCALL [=n])might breakbc. │    │
 │ [ │       -> Sysfs syscall support (SYSFS_SYSCALL [=n])might breakbc.


Example F3:

 ┌──┌── Short help ────────────────────────────────────────────────────────┐──┐
 │  │                                                                      │  │
 │ [│ Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable. │  │
 │ [│ Submenus are designated by a trailing "--->", empty ones by "----".. │  │
 │ [│ Submenus are designated by a trailing "--->", empty ones by "----".. │  │
 │  │ Use the following keys to navigate the menus: empty ones by "----".. │  │
 │ [│ Move up or down with <Up> or <Down>.he menus: empty ones by "----".. │  │
 │ [│ Enter a submenu with <Enter> or <Right>.enus: empty ones by "----".. │  │
 │ <│ Exit a submenu to its parent menu with <Esc> or <Left>.s by "----".. │  │
 │ [│ Pressing <y> includes, <n> excludes, <m> modularizes features.---".. │  │
 │ -│ Pressing <Space> cycles through the available options.eatures.---".. │  │
 │ -│ To search for menu entries press </>.vailable options.eatures.---".. │  │
 │ [│ <Esc> always leaves the current window.ilable options.eatures.---".. │  │
 │ [│ <Esc> always leaves the current window.ilable options.eatures.---".. │  │
 │ [│ Pressing <1> may be used instead of <F1>, <2> instead of <F2>, etc.. │  │
 │ [│ For verbose global help press <F1>. <F1>, <2> instead of <F2>, etc.. │  │
 │ -│ For help related to the current menu entry press <?> or <h>.>, etc.. 

-- 
~Randy


