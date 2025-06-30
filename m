Return-Path: <linux-kbuild+bounces-7781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EFAED4FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 08:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787B617322B
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC451FFC55;
	Mon, 30 Jun 2025 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BFfXnmfR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F551FAC37;
	Mon, 30 Jun 2025 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266532; cv=none; b=AXoKZxtjOQhmAqjxyq5fEOqJBQ/t0zeynG9MI/5/589HPSjdyy/b5hF378onv0B1b1glsdUlE3OJGY2OeD6pPlh32vdOEjG2ms8IVy6J+YjZ4dGhaqDUnGc67SbRVtCjGsN4oh4nymSZ1W45GY1MixPZPi66+gRg4z4wpqIIjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266532; c=relaxed/simple;
	bh=oDRy6+pnTxXZ6RV1g2T7V837UtifdG7isk6y74V3pug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HemnCgHNH/rN8Ss36CLwbZ8gaDYbQSbIhEsiEb7QhwhYTxcOytUPlUuWGwpGGFdlJreqoLBhXEDmc/fTrV5p3RApvFVLBGadWSG3R++tuitQtc5RSt9NLFRsV94AVKsmavubiEtMactS+vQ1DbNntndnSKmPblH/eaH5MJpckGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BFfXnmfR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JLJNqBrK8VItnnOACmsphdDR0i4rdVFTfR/cReJyqWc=; b=BFfXnmfRPWgSfEp/yk/nwToxln
	3AHHClgrzCPOIjApa3urqh5eJ9iZr6h2mhdTelSIRYOC0M/FotOA/pw16ScDDVbGWPflIIfEECKsV
	fVUS5qWvZThRvn9dRmQKG+FK2Y+roz9o1S9ubz1bjKEg80ZB1LJK+fwCXZGpER9yzcFQSFzIFQP8k
	/X4SgyFWsS/f6EoN+CWus3VrIHw3yefraDc4zZWMimYK9x+2E4SfnLYSO/CG/FPg1R8D+BRQa+a2R
	4W/Knsm9CSNE+zfgXJ6saoV65ZC1bMGPRWrvbgO/e2my6KHqTLu7NETcn9Fckj7kUo4WiJjTqkSWR
	gCLSjjYg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8QI-00000006jn9-3dJp;
	Mon, 30 Jun 2025 06:55:27 +0000
Message-ID: <cb9bd1e4-9424-4ed2-bdfa-49c883c60a66@infradead.org>
Date: Sun, 29 Jun 2025 23:55:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/66] kconfig: improve xconfig and gconfig
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> [xconfig]
> 
>  - small improvement for choice
> 
> [gconfig]
> 
>  - Fix memory leak
>  - Lots of refactoring
>  - Migrate GTK 2 to GTK 3
>  - Fix all compile warnings
>  - Improve usability (grey out buttons, keep the item selection, etc.)
> 
> 

Hi,
I have tested all 65 patches here (omitting 52).
They worked well. Good job.
I will test your git tree/branch Monday/Tuesday.

I did notice one visual difference. The GTK+2 version of
gconfig (before the patches) uses an alternating white/light gray
background for the menu items while the GTK+3 version (after the
patches) uses an all white background.

I prefer the alternating but it may be just some collateral damage
in the name of progress.  Or could be something else entirely!

Before you posted all of these gconfig patches, I was going to ask
how many gconfig users are there?  I don't see much on the mailing
list about gconfig from users and suggest that maybe we should just
drop it, but if you are OK with maintaining it and updating it like
in this patch series, so be it.

I did seem to have found one gconfig user [1]. Maybe you are also
a gconfig user.


[1] https://lore.kernel.org/linux-kbuild/67b44d49-d23c-fab0-e165-cc84817562af@infradead.org/



> 
> Masahiro Yamada (66):
>   kconfig: set MENU_CHANGED to choice when the selected member is
>     changed
>   kconfig: qconf: do not show checkbox icon for choice
>   kconfig: qconf: show selected choice in the Value column
>   kconfig: rename menu_get_parent_menu() to
>     menu_get_menu_or_parent_menu()
>   kconfig: re-add menu_get_parent_menu() that returns parent menu
>   kconfig: gconf: make columns resizable
>   kconfig: gconf: fix potential memory leak in renderer_edited()
>   kconfig: gconf: always destroy dialog in on_window1_delete_event()
>   kconfig: gconf: remove old #ifdef GTK_CHECK_VERSION
>   kconfig: gconf: remove empty if-block
>   kconfig: gconf: remove meaningless code in init_main_window()
>   kconfig: gconf: remove unneeded gtk_tree_view_set_headers_visible()
>     calls
>   kconfig: gconf: remove gtk_tree_view_column_set_visible() calls
>   kconfig: gconf: remove gtk_widget_realize() calls
>   kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
>   kconfig: gconf: remove unnecessary gtk_set_locale() call
>   kconfig: gconf: remove internal-child="image" nodes from glade
>   kconfig: gconf: remove parents[] array and indent variable
>   kconfig: gconf: remove unnecessary NULL checks for tree1 and tree2
>   kconfig: gconf: remove unneeded variable in on_split_clicked()
>   kconfig: gconf: remove unneeded variables in
>     on_treeview*_button_press_event()
>   kconfig: gconf: remove unused 'color' variable
>   kconfig: gconf: add static qualifiers to variables
>   kconfig: gconf: move init_*() functions below
>   kconfig: gconf: refactor view setting code
>   kconfig: gconf: grey out button for current view
>   kconfig: gconf: move the main window event handlers below
>   kconfig: gconf: move button1 initialization below
>   kconfig: gconf: add static qualifiers to event handlers
>   kconfig: gconf: remove glade_xml_signal_autoconnect() call
>   kconfig: gconf: make key_press_event work in left pane too
>   kconfig: gconf: avoid hardcoding model2 in
>     on_treeview2_cursor_changed()
>   kconfig: gconf: avoid hardcoding model2 in renderer_edited()
>   kconfig: gconf: avoid hardcoding model* in
>     on_treeview*_button_press_event()
>   kconfig: gconf: add on_save_clicked() event handler
>   kconfig: gconf: use GtkFileChooser in on_load1_activate()
>   kconfig: gconf: use GtkFileChooser in on_save_as1_activate()
>   kconfig: gconf: use GdkPixbuf in replace_button_icon()
>   kconfig: gconf: refactor replace_button_icon()
>   kconfig: gconf: make introduction, about, license dialogs modal
>   kconfig: gconf: remove global 'tree' variable
>   kconfig: gconf: merge 'current' and 'browsed' global variables
>   kconfig: gconf: preserve menu selection when switching view mode
>   kconfig: gconf: use GtkTreeModelFilter to control row visibility
>   kconfig: gconf: remove global 'model1' and 'model2' variables
>   kconfig: gconf: remove init_tree_model()
>   kconfig: gconf: inline fill_row() into set_node()
>   kconfig: gconf: do not reconstruct tree store when a symbol is changed
>   kconfig: gconf: inline display_list() into set_view_mode()
>   kconfig: gconf: remove dead code in display_tree_part()
>   kconfig: gconf: rename display_tree_part()
>   kconfig: gconf: remove fixup_rootmenu()
>   kconfig: gconf: use size_allocate event handler
>   kconfig: gconf: replace GDK_space with GDK_KEY_space
>   kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
>   kconfig: gconf: remove "tooltips" property from glade
>   kconfig: gconf: replace "tooltip" property with "tooltip-text"
>   kconfig: gconf: remove unnecessary default message in text view
>   kconfig: gconf: use gtk_check_menu_item_get_active() accessor
>   kconfig: gconf: use gtk_dialog_get_content_area() accessor
>   kconfig: gconf: remove GtkHandleBox from glade
>   kconfig: gconf: rename gconf.glade to gconf.ui
>   kconfig: gconf: migrate to GTK 3
>   kconfig: gconf: replace GtkVbox with GtkBox
>   kconfig: gconf: replace GdkColor with GdkRGBA
>   kconfig: gconf: show GTK version in About dialog
> 
>  scripts/kconfig/conf.c                    |    2 +-
>  scripts/kconfig/gconf-cfg.sh              |   11 +-
>  scripts/kconfig/gconf.c                   | 1828 ++++++++++-----------
>  scripts/kconfig/{gconf.glade => gconf.ui} |  360 ++--
>  scripts/kconfig/lkc.h                     |    1 +
>  scripts/kconfig/menu.c                    |   20 +
>  scripts/kconfig/qconf.cc                  |   26 +-
>  scripts/kconfig/symbol.c                  |    4 +
>  8 files changed, 1023 insertions(+), 1229 deletions(-)
>  rename scripts/kconfig/{gconf.glade => gconf.ui} (57%)
> 

-- 
~Randy


