Return-Path: <linux-kbuild+bounces-8296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4645B1B87F
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 18:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3747A18A713F
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 16:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A2E292B47;
	Tue,  5 Aug 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRledxHd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F6292B35;
	Tue,  5 Aug 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754411293; cv=none; b=dETaYfNuPX2e9qHxpxt7uL4HJyO8tY0vP5WhV1z/w+SkP9FJjfke1HUk+yZ0A1wvmhRIzundlEbW81XxWhKQWQdrTtszJ/efmiEKXE8txb2H/T9Hr8YnUjeEjymbWEUlHpjDQDnz1x9HaIFo73p5t9MYEB9MxDwaWwCV5vLRXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754411293; c=relaxed/simple;
	bh=88mYUiRPpcXysxo2tOcTKaYv8kwhnFtPGyO9KuHBrMI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PEpoOwH+WEMaZAx3pC2H09B1UBWpiWHVlz+4vdBm4OnCrTvGlURPYcD9+mIZjM9WJrb57VZ/JXPPvvutbZuG/2vG3f7decUmHGsbXDKqxnAK7jhoz0kWAV1OE7oN994fKO4tNIr4St3XJagIxctQxlzKEHPXEMJEgI5wKnq2tgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRledxHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC60C4CEF6;
	Tue,  5 Aug 2025 16:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754411293;
	bh=88mYUiRPpcXysxo2tOcTKaYv8kwhnFtPGyO9KuHBrMI=;
	h=From:Date:Subject:To:Cc:From;
	b=nRledxHdaFsegkHXoyUEIv12up61RCpThg/dXQdu8RFl/A/ZBqS1/8kAHdwbhCrUl
	 5LwfYQl40qtpy3VrNQiOcaFodLZNfGZfPeuQyXttL0I4PA/F9uHDa/1qRN1ade5ZBC
	 xtLCurdYQWb0eT8RipfTLY0MuqNmSTYRUFQx597ld2Ohagnc1k03ptfbeZZmwPl/6E
	 zAtK+U+BU5aiPFgpOGr5wbnZ5Pnc/AMKuLvilN4I0/1xOVCCDCiuW45O1dohGlkWBP
	 lKcdkqeT7LH48ZNaxYU9e1o2xbC++xMvO1ZiNk4MkyxpplxVxpBOPa8VgBSkAwwilg
	 2alV0UXt6rLpw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-33229f67729so49119561fa.1;
        Tue, 05 Aug 2025 09:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGCOM0c7FjJ86Lbs5q6lfyW1N/1a7CNhhfMF6MQcQ4IRqf/X/U3feB6E/JSZp/UYWKkBHbE8bV1z9m+OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIgvWDb2brbVtgCXk4+LuXYzEbk28MiSNeFwmjix29VBdX7lO0
	AqPZeZUBc4DDb9741lADDugIFEhKFIC/9o712IXwVAACileuizKx8WBcqQzfF1q5btQCdn/tEhK
	PUGPZh+LcEMF4Ildu6tBIj6F7v7f2jFE=
X-Google-Smtp-Source: AGHT+IGIlroAaAkEaWbn/AmeFd+x7vtsqwifWbrPoDz9UJceQTMXb9PPeB3cdZklxm+Ugwr82UPMN2XpS3q9xftFdG4=
X-Received: by 2002:a2e:a581:0:b0:32b:2ea9:1dcd with SMTP id
 38308e7fff4ca-33256816826mr42094811fa.32.1754411291700; Tue, 05 Aug 2025
 09:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Aug 2025 01:27:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
X-Gm-Features: Ac12FXyKOsEZR5mfIQCXCMHiw74tpOUk_k-xi5dPk6UdejLufLujcp5LeFeASH4
Message-ID: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull Kbuild updates for v6.17-rc1.
This is the last pull request from me.
I'm grateful to have been able to continue as a maintainer for eight years.
From the next cycle, Nathan and Nicolas will maintain Kbuild.

Thanks,
Masahiro



The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e=
:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.17

for you to fetch changes up to 546c1b8315e62da1ec31e845e28fba99d0309b51:

  MAINTAINERS: hand over Kbuild maintenance (2025-08-05 22:00:00 +0900)

----------------------------------------------------------------
Kbuild updates for v6.17

 - Fix a shortcut key issue in menuconfig

 - Fix missing rebuild of kheaders

 - Sort the symbol dump generated by gendwarfsyms

 - Support zboot extraction in scripts/extract-vmlinux

 - Migrate gconfig to GTK 3

 - Add support in modpost for generating MODULE_ALIAS() entries for
   built-in modules

 - Add TAR variable to allow overriding the default tar command

 - Hand over Kbuild maintainership

----------------------------------------------------------------
Alexey Gladkov (6):
      s390: vmlinux.lds.S: Reorder sections
      scsi: Always define blogic_pci_tbl structure
      pinctrl: meson: Fix typo in device table macro
      modpost: Add modname to mod_device_table alias
      modpost: Create modalias for builtin modules
      kbuild: vmlinux.unstripped should always depend on .vmlinux.export.o

Giuliano Procida (2):
      gendwarfksyms: use preferred form of sizeof for allocation
      gendwarfksyms: order -T symtypes output by name

Jeremy Linton (1):
      scripts: add zboot support to extract-vmlinux

Masahiro Yamada (84):
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
      kbuild: always create intermediate vmlinux.unstripped
      kbuild: keep .modinfo section in vmlinux.unstripped
      kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
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

 CREDITS                                    |    6 +
 Documentation/kbuild/kconfig.rst           |    8 +-
 MAINTAINERS                                |   13 +-
 Makefile                                   |    5 +-
 arch/s390/kernel/vmlinux.lds.S             |   10 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c |    2 +-
 drivers/scsi/BusLogic.c                    |    2 -
 include/asm-generic/vmlinux.lds.h          |    2 +-
 include/crypto/algapi.h                    |    4 +-
 include/linux/module.h                     |   21 +-
 include/linux/moduleparam.h                |    9 +-
 include/net/tcp.h                          |    4 +-
 kernel/.gitignore                          |    2 +
 kernel/Makefile                            |   47 +-
 kernel/gen_kheaders.sh                     |   93 +-
 rust/kernel/device_id.rs                   |    8 +-
 scripts/Makefile.vmlinux                   |   77 +-
 scripts/Makefile.vmlinux_o                 |   26 +-
 scripts/extract-vmlinux                    |   13 +-
 scripts/gendwarfksyms/cache.c              |    2 +-
 scripts/gendwarfksyms/die.c                |    4 +-
 scripts/gendwarfksyms/dwarf.c              |    2 +-
 scripts/gendwarfksyms/kabi.c               |    2 +-
 scripts/gendwarfksyms/symbols.c            |    2 +-
 scripts/gendwarfksyms/types.c              |   33 +-
 scripts/kconfig/conf.c                     |    2 +-
 scripts/kconfig/confdata.c                 |    2 +-
 scripts/kconfig/gconf-cfg.sh               |   11 +-
 scripts/kconfig/gconf.c                    | 1783
++++++++++++++++++--------------------
 scripts/kconfig/{gconf.glade =3D> gconf.ui}  |  361 +++-----
 scripts/kconfig/lkc.h                      |    2 +
 scripts/kconfig/lxdialog/inputbox.c        |    6 +-
 scripts/kconfig/lxdialog/menubox.c         |    2 +-
 scripts/kconfig/lxdialog/util.c            |    3 +-
 scripts/kconfig/menu.c                     |   94 ++
 scripts/kconfig/nconf.c                    |    2 +
 scripts/kconfig/nconf.gui.c                |    1 +
 scripts/kconfig/qconf.cc                   |   36 +-
 scripts/kconfig/qconf.h                    |    1 +
 scripts/kconfig/symbol.c                   |    4 +
 scripts/link-vmlinux.sh                    |    5 +-
 scripts/mksysmap                           |    6 +
 scripts/mod/file2alias.c                   |   34 +-
 scripts/mod/modpost.c                      |   17 +-
 scripts/mod/modpost.h                      |    2 +
 45 files changed, 1353 insertions(+), 1418 deletions(-)
 rename scripts/kconfig/{gconf.glade =3D> gconf.ui} (57%)

--
Best Regards
Masahiro Yamada

