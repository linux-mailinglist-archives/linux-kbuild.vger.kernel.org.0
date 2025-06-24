Return-Path: <linux-kbuild+bounces-7627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66803AE6A1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7D93A86D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0972D320E;
	Tue, 24 Jun 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+uye6nk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ADF2C15A3;
	Tue, 24 Jun 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777635; cv=none; b=QAbpwv3B8EtKHs2YuOxcYws7DbfxOWHg/cFnmfyNnEqovexl8gROa18keA5vqGyo6M+lE2sBqOTfsmATRIg8mVnfPqYTrTDLrALVQ6E1JA4n7FNW7uOXoNl9KH7F5pEbS5F97+gzqB4BRENA73g/rWmWXBxmYyxuMusidW6+DXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777635; c=relaxed/simple;
	bh=Iyem160K4eShasp++9qJWFd2Kjz6Dqn4gC9WvlQsE1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DQ5pwI589JKMfFO6Oi6lQjGb5YxJQKMEXwX4NcTDZaaWE+nDFAQ476wRvcwH/QoOhhnMtZnrUCKYdq0my1TLCJnhO76G7khW9SDcbk0gLzjqhje0OJPsojtsS1zYFqaYz5wxARa4f7SNsd8fHUAITo7EtO4ce+dt6IpYk37NCv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+uye6nk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28172C4CEE3;
	Tue, 24 Jun 2025 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777634;
	bh=Iyem160K4eShasp++9qJWFd2Kjz6Dqn4gC9WvlQsE1U=;
	h=From:To:Cc:Subject:Date:From;
	b=A+uye6nk46FOGjGH2w4Pdh0tqARm4T0BKTGpZh1OuIzCagZa1xv5VTwlcUJQIrwbU
	 YPpJ/TEe6ifB2H8057aka2/CnHxv38ZgMjw17X7xZxK40G074W1U1Ef4i1LWZBImuf
	 7Q6hUEH0W2zMgqbtV3CQDhtqUTPzcn9a8XV4UADu/HQ+SYwIbyby22YKemKAaAAIVH
	 OCsu43ifwNQ9NlSPzVSjNPT4SZFaycAefio9sybBkjTtMsdje58DdrMa8syLjWAntH
	 IHFVnQvMsyb7KIIER/H610xh0AugqA9qTcJECsmTOH/sPiknne2rW+nCBon8M3ClCB
	 +FvSrbl0Oyu4Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/66] kconfig: improve xconfig and gconfig
Date: Wed, 25 Jun 2025 00:04:48 +0900
Message-ID: <20250624150645.1107002-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[xconfig]

 - small improvement for choice

[gconfig]

 - Fix memory leak
 - Lots of refactoring
 - Migrate GTK 2 to GTK 3
 - Fix all compile warnings
 - Improve usability (grey out buttons, keep the item selection, etc.)



Masahiro Yamada (66):
  kconfig: set MENU_CHANGED to choice when the selected member is
    changed
  kconfig: qconf: do not show checkbox icon for choice
  kconfig: qconf: show selected choice in the Value column
  kconfig: rename menu_get_parent_menu() to
    menu_get_menu_or_parent_menu()
  kconfig: re-add menu_get_parent_menu() that returns parent menu
  kconfig: gconf: make columns resizable
  kconfig: gconf: fix potential memory leak in renderer_edited()
  kconfig: gconf: always destroy dialog in on_window1_delete_event()
  kconfig: gconf: remove old #ifdef GTK_CHECK_VERSION
  kconfig: gconf: remove empty if-block
  kconfig: gconf: remove meaningless code in init_main_window()
  kconfig: gconf: remove unneeded gtk_tree_view_set_headers_visible()
    calls
  kconfig: gconf: remove gtk_tree_view_column_set_visible() calls
  kconfig: gconf: remove gtk_widget_realize() calls
  kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
  kconfig: gconf: remove unnecessary gtk_set_locale() call
  kconfig: gconf: remove internal-child="image" nodes from glade
  kconfig: gconf: remove parents[] array and indent variable
  kconfig: gconf: remove unnecessary NULL checks for tree1 and tree2
  kconfig: gconf: remove unneeded variable in on_split_clicked()
  kconfig: gconf: remove unneeded variables in
    on_treeview*_button_press_event()
  kconfig: gconf: remove unused 'color' variable
  kconfig: gconf: add static qualifiers to variables
  kconfig: gconf: move init_*() functions below
  kconfig: gconf: refactor view setting code
  kconfig: gconf: grey out button for current view
  kconfig: gconf: move the main window event handlers below
  kconfig: gconf: move button1 initialization below
  kconfig: gconf: add static qualifiers to event handlers
  kconfig: gconf: remove glade_xml_signal_autoconnect() call
  kconfig: gconf: make key_press_event work in left pane too
  kconfig: gconf: avoid hardcoding model2 in
    on_treeview2_cursor_changed()
  kconfig: gconf: avoid hardcoding model2 in renderer_edited()
  kconfig: gconf: avoid hardcoding model* in
    on_treeview*_button_press_event()
  kconfig: gconf: add on_save_clicked() event handler
  kconfig: gconf: use GtkFileChooser in on_load1_activate()
  kconfig: gconf: use GtkFileChooser in on_save_as1_activate()
  kconfig: gconf: use GdkPixbuf in replace_button_icon()
  kconfig: gconf: refactor replace_button_icon()
  kconfig: gconf: make introduction, about, license dialogs modal
  kconfig: gconf: remove global 'tree' variable
  kconfig: gconf: merge 'current' and 'browsed' global variables
  kconfig: gconf: preserve menu selection when switching view mode
  kconfig: gconf: use GtkTreeModelFilter to control row visibility
  kconfig: gconf: remove global 'model1' and 'model2' variables
  kconfig: gconf: remove init_tree_model()
  kconfig: gconf: inline fill_row() into set_node()
  kconfig: gconf: do not reconstruct tree store when a symbol is changed
  kconfig: gconf: inline display_list() into set_view_mode()
  kconfig: gconf: remove dead code in display_tree_part()
  kconfig: gconf: rename display_tree_part()
  kconfig: gconf: remove fixup_rootmenu()
  kconfig: gconf: use size_allocate event handler
  kconfig: gconf: replace GDK_space with GDK_KEY_space
  kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
  kconfig: gconf: remove "tooltips" property from glade
  kconfig: gconf: replace "tooltip" property with "tooltip-text"
  kconfig: gconf: remove unnecessary default message in text view
  kconfig: gconf: use gtk_check_menu_item_get_active() accessor
  kconfig: gconf: use gtk_dialog_get_content_area() accessor
  kconfig: gconf: remove GtkHandleBox from glade
  kconfig: gconf: rename gconf.glade to gconf.ui
  kconfig: gconf: migrate to GTK 3
  kconfig: gconf: replace GtkVbox with GtkBox
  kconfig: gconf: replace GdkColor with GdkRGBA
  kconfig: gconf: show GTK version in About dialog

 scripts/kconfig/conf.c                    |    2 +-
 scripts/kconfig/gconf-cfg.sh              |   11 +-
 scripts/kconfig/gconf.c                   | 1828 ++++++++++-----------
 scripts/kconfig/{gconf.glade => gconf.ui} |  360 ++--
 scripts/kconfig/lkc.h                     |    1 +
 scripts/kconfig/menu.c                    |   20 +
 scripts/kconfig/qconf.cc                  |   26 +-
 scripts/kconfig/symbol.c                  |    4 +
 8 files changed, 1023 insertions(+), 1229 deletions(-)
 rename scripts/kconfig/{gconf.glade => gconf.ui} (57%)

-- 
2.43.0


