Return-Path: <linux-kbuild+bounces-8303-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7210B1BF70
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 05:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1100C17EA54
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 03:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3431DED4A;
	Wed,  6 Aug 2025 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0kauBnN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426C29D05;
	Wed,  6 Aug 2025 03:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754452297; cv=none; b=r9xqdeF2Aes01WPcbaTU5vFMm5GpoBHO+HCNMqd2JhI3mUH+oCB8J8tzjyDb8P0Atm31kuHBCHxAy/HfBj6UL4CUipGXo+OwC0fSZT0APtTZxUoGcCct3M5JhoyvLbt0WTKe+wX9S1RXMBzn5cWo6TpaeSfIE2lsEKxO2+pOl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754452297; c=relaxed/simple;
	bh=p27vztgrhGjCUUooHk/BC8kE9TEQMFQdlGxLG+GJHF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=V6wwKUr7UlS4nqigPrGvPZkhM++E/aVzzs7jU40QfDzgJBIrOwuxD2b2ZC1r2fmvfFHdWIFbealreBfXbAdIcur9wGQYWgAWxP+DA65ap89CtZddQwveJaB+45B+0oJ/fsLpRGw4xuZgjARap+Aoc/OBlmP4m1+5NWnhxi1g8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0kauBnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D27C4CEF6;
	Wed,  6 Aug 2025 03:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754452295;
	bh=p27vztgrhGjCUUooHk/BC8kE9TEQMFQdlGxLG+GJHF8=;
	h=From:Date:Subject:To:Cc:From;
	b=q0kauBnNg1w0Cf5ugUMeRdSbrhiUTylAbjQ5Enc5nvHXuDNY2kWzgnj1/ha8zESFI
	 wPpBZb6mJfI/o4kHKpXHF/1Dxdikgn0mH+XKR67mjReLfgZCf40yqhFFlyRCz5aGlO
	 44IBHe9SZId91E+jXJwf0PjLUHoInPcVu0C/f5DCuXjNXykd1ocKccPUsi400Txbt0
	 BB5NS0vaP0idCrQNEjovXRtBb+uksnLVISOfcur5o0aGgFMQhuh+NaUzTGSpmauvhz
	 FCq3zgnfxg+9AA+I+haEzjTqxajbzYTvJ2JI3dpNusAmp3iq8GSlhpNpslfSRC7/SV
	 L3YQwnzUy4rzg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ba26abd62so3386049e87.1;
        Tue, 05 Aug 2025 20:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNyxM97nkiglNrd7EJR9poA1Lx7uW4tPCxwa3/B8Xr86HNsLFldCFVYcKvQjil8Mg0t6MbWxM2ygScYbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gnRU41qabpHknDf0GUvVOsLj6BlEjNbbO9rrXVJNwMPE+5a+
	muYSDP9h+rOtORxGsO77XWxZGjxhgcqsaEK8UKg5Xr1f+qSvn/M/qwkdt0XbGNa37WfsqmsbFSd
	RPcZxlb2P5Xb7NXL5TWwjT33O6xxmrOc=
X-Google-Smtp-Source: AGHT+IGlOk8juL2u4kuXCftbu/VeuCt12rCBT00pyWmkvzUo9V3/xHx2BUuOmGjte73gUJTPuyTcLRwDTB9w39zw11E=
X-Received: by 2002:ac2:4e04:0:b0:55b:82cd:7200 with SMTP id
 2adb3069b0e04-55caf2c1c97mr343135e87.10.1754452294219; Tue, 05 Aug 2025
 20:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Aug 2025 12:50:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
X-Gm-Features: Ac12FXwJFq7LBUGf_jxfrMGE2HONY3vSsdVXiyW4WT14JoSk1qKhe5VG7LuX6Fs
Message-ID: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.17-rc1 (take 2)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,


Please pull Kbuild updates for v6.17-rc1.
In this take 2, I dropped one patch series
that has caused a regression in linux-next.

You will observe a merge conflict in include/linux/moduleparam.h
This is a conflict between
Commit 40a826bd6c82 ("module: Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_=
LEN")
and
Commit 7934a8dd8692 ("module: remove meaningless 'name' parameter from
__MODULE_INFO()")
A resolution is available in linux-next.

And, this is the last pull request from me.
I'm grateful to have been able to continue as a maintainer for eight years.
From the next cycle, Nathan and Nicolas will maintain Kbuild.



The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.17-2

for you to fetch changes up to 8d6841d5cb20dcee7bf9ba98cb6dbcbf5bccfea5:

  MAINTAINERS: hand over Kbuild maintenance (2025-08-06 10:23:36 +0900)

----------------------------------------------------------------
Kbuild updates for v6.17

 - Fix a shortcut key issue in menuconfig

 - Fix missing rebuild of kheaders

 - Sort the symbol dump generated by gendwarfsyms

 - Support zboot extraction in scripts/extract-vmlinux

 - Migrate gconfig to GTK 3

 - Add TAR variable to allow overriding the default tar command

 - Hand over Kbuild maintainership

----------------------------------------------------------------
Giuliano Procida (2):
      gendwarfksyms: use preferred form of sizeof for allocation
      gendwarfksyms: order -T symtypes output by name

Jeremy Linton (1):
      scripts: add zboot support to extract-vmlinux

Masahiro Yamada (81):
      kheaders: rebuild kheaders_data.tar.xz when a file is modified
within a minute
      kheaders: rebuild kheaders_data.tar.xz when
KBUILD_BUILD_TIMESTAMP is changed
      kheaders: double-quote variables to satisfy shellcheck
      module: remove meaningless 'name' parameter from __MODULE_INFO()
      kconfig: set MENU_CHANGED to choice when the selected member is chang=
ed
      kconfig: qconf: do not show checkbox icon for choice
      kconfig: qconf: show selected choice in the Value column
      kconfig: rename menu_get_parent_menu() to menu_get_menu_or_parent_men=
u()
      kconfig: re-add menu_get_parent_menu() that returns parent menu
      kconfig: gconf: make columns resizable
      kconfig: gconf: fix potential memory leak in renderer_edited()
      kconfig: gconf: always destroy dialog in on_window1_delete_event()
      kconfig: gconf: remove old #ifdef GTK_CHECK_VERSION
      kconfig: gconf: remove empty if-block
      kconfig: gconf: remove meaningless code in init_main_window()
      kconfig: gconf: remove unneeded gtk_tree_view_set_headers_visible() c=
alls
      kconfig: gconf: remove gtk_tree_view_column_set_visible() calls
      kconfig: gconf: remove gtk_widget_realize() calls
      kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
      kconfig: gconf: remove unnecessary gtk_set_locale() call
      kconfig: gconf: remove internal-child=3D"image" nodes from glade
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
      kconfig: gconf: move button1 and save1 initialization code
      kconfig: gconf: add static qualifiers to event handlers
      kconfig: gconf: remove glade_xml_signal_autoconnect() call
      kconfig: gconf: make key_press_event work in left pane too
      kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_change=
d()
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
      kconfig: gconf: do not reconstruct tree store when a symbol is change=
d
      kconfig: gconf: inline display_list() into set_view_mode()
      kconfig: gconf: remove dead code in display_tree_part()
      kconfig: gconf: replace GDK_space with GDK_KEY_space
      kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
      kconfig: gconf: remove "tooltips" property from glade
      kconfig: gconf: replace "tooltip" property with "tooltip-text"
      kconfig: gconf: remove unnecessary default message in text view
      kconfig: gconf: use gtk_check_menu_item_get_active() accessor
      kconfig: gconf: use gtk_dialog_get_content_area() accessor
      kconfig: gconf: remove GtkHandleBox from glade
      kconfig: gconf: fix behavior of a menu under a symbol in split view
      kconfig: gconf: use configure-event handler to adjust pane separator
      kconfig: gconf: rename display_tree_part()
      kconfig: gconf: rename gconf.glade to gconf.ui
      kconfig: gconf: migrate to GTK 3
      kconfig: gconf: replace GtkVbox with GtkBox
      kconfig: gconf: replace GdkColor with GdkRGBA
      kconfig: gconf: replace GtkHPaned and GtkVPaned with GtkPaned
      kconfig: gconf: show GTK version in About dialog
      kconfig: add a function to dump all menu entries in a tree-like forma=
t
      kconfig: qconf: fix ConfigList::updateListAllforAll()
      kconfig: qconf: confine {begin,end}Group to constructor and destructo=
r
      kconfig: gconf: fix single view to display dependent symbols correctl=
y
      kconfig: gconf: Fix Back button behavior
      kconfig: gconf: replace GtkImageMenuItem with GtkMenuItem
      kconfig: gconf: use hyphens in signals
      kconfig: gconf: remove unneeded variable in text_insert_msg
      kconfig: gconf: refactor text_insert_help()
      MAINTAINERS: hand over Kbuild maintenance

Micha=C5=82 G=C3=B3rny (1):
      kheaders: make it possible to override TAR

Randy Dunlap (1):
      docs: kconfig: add alldefconfig to the all*configs

Shankari Anand (1):
      kconfig: nconf: Ensure null termination where strncpy is used

Suchit Karunakaran (2):
      kconfig: lxdialog: replace strcpy with snprintf in print_autowrap
      kconfig: lxdialog: replace strcpy() with strncpy() in inputbox.c

Thomas Meyer (1):
      kconfig: use memcmp instead of deprecated bcmp

Thomas Wei=C3=9Fschuh (1):
      kbuild: userprogs: use correct linker when mixing clang and GNU ld

Yann E. MORIN (1):
      kconfig: lxdialog: fix 'space' to (de)select options

 CREDITS                                   |    6 +
 Documentation/kbuild/kconfig.rst          |    8 +-
 MAINTAINERS                               |   13 +-
 Makefile                                  |    5 +-
 include/crypto/algapi.h                   |    4 +-
 include/linux/module.h                    |    3 -
 include/linux/moduleparam.h               |    9 +-
 include/net/tcp.h                         |    4 +-
 kernel/.gitignore                         |    2 +
 kernel/Makefile                           |   47 +-
 kernel/gen_kheaders.sh                    |   93 +--
 scripts/extract-vmlinux                   |   13 +-
 scripts/gendwarfksyms/cache.c             |    2 +-
 scripts/gendwarfksyms/die.c               |    4 +-
 scripts/gendwarfksyms/dwarf.c             |    2 +-
 scripts/gendwarfksyms/kabi.c              |    2 +-
 scripts/gendwarfksyms/symbols.c           |    2 +-
 scripts/gendwarfksyms/types.c             |   33 +-
 scripts/kconfig/conf.c                    |    2 +-
 scripts/kconfig/confdata.c                |    2 +-
 scripts/kconfig/gconf-cfg.sh              |   11 +-
 scripts/kconfig/gconf.c                   | 1783
+++++++++++++++++++---------------------
 scripts/kconfig/{gconf.glade =3D> gconf.ui} |  361 +++-----
 scripts/kconfig/lkc.h                     |    2 +
 scripts/kconfig/lxdialog/inputbox.c       |    6 +-
 scripts/kconfig/lxdialog/menubox.c        |    2 +-
 scripts/kconfig/lxdialog/util.c           |    3 +-
 scripts/kconfig/menu.c                    |   94 +++
 scripts/kconfig/nconf.c                   |    2 +
 scripts/kconfig/nconf.gui.c               |    1 +
 scripts/kconfig/qconf.cc                  |   36 +-
 scripts/kconfig/qconf.h                   |    1 +
 scripts/kconfig/symbol.c                  |    4 +
 33 files changed, 1223 insertions(+), 1339 deletions(-)
 rename scripts/kconfig/{gconf.glade =3D> gconf.ui} (57%)

--=20
Best Regards
Masahiro Yamada

