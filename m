Return-Path: <linux-kbuild+bounces-7795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A12AEE30A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 17:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2DDE3BE6A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B30A286439;
	Mon, 30 Jun 2025 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1DEwMI4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A0282FA;
	Mon, 30 Jun 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298569; cv=none; b=svjZz+FJMBDtUM/NBIjiTFn+E0wMZw3j/8s2La88F+RgPz9q8txy0eqbaVVjxj6IPkZtrtVWBI/cbrXzDUTFuAVdI17zvhCz03oFW8OkvGQFiqgSBNDa85C+mfDkNMzhkjbzalvwFKom4asJcXGvys/CTFWho+DVI6O7beVxAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298569; c=relaxed/simple;
	bh=K6Mp74Q0b3cUnLNT1eepNTqnrB9OYu0ozHHRKw49krw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INwaqPUhNOYFpKYjeftPZwymOElG+1nMalaYJsu2m84w8eSPPUtz+wPdjP5rF4VgqMdTeVvYYLamnTPdVe5OAqc0KjBXSY5SsyY9bGSrS08Pmm89GVZuTV/qH3yD+ZWYr15VUGNUoSxjwaL5KM41M+9GvBc6EeYuOl8XpeI6Trk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1DEwMI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDC7C4CEE3;
	Mon, 30 Jun 2025 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751298568;
	bh=K6Mp74Q0b3cUnLNT1eepNTqnrB9OYu0ozHHRKw49krw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i1DEwMI4kyuK8qICVFeGPO/Z062l3wf2yr86WfBx81onvRTgoEGHGhyFAEpfXe7vH
	 mqaTgXy84MNZBVekK8RZj3Yu+8rtsMEFc8foqunfX31KoOtv9qN5awx96tmLyqahrj
	 YCZn5kxrHyhLsUidJOtBA4nx6iu0RDS+g6T9PudQqwvoGSxiVMXUEPEuCmQceTqHbi
	 UfhYkBJhUGJo41sn8NlRNpUhLIEfc5ivAPvOBVY6LsBaro9Z66mQ6QYnHkggFvErfu
	 18fREeoFUYQK0VUHgl+L3jcvPo9z0bCVmucfqpx6b9bWGcmQ1marYFWj1ZKyp7U02H
	 7N7m8hO0Gu7QA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2539447e87.0;
        Mon, 30 Jun 2025 08:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwi3syNmuPvrS7RPpr7akF2jpZlKtXyHNkiJnigPev++ZnSfLmPKvX8/oZp/c00tsoqAqjSeTf60QyHiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoVb9iLVgsXfIq0/J9f2R0ytjqbBQcQeOS0CUeg1ONsL0+b7V
	rgiy///y65CyvA4EcqBMpwmunzjg74UK0e9rw6yIlJs9kWQBoKHQvm+DmA80yq+K91UFo8j2Lf4
	RjAxUnUdste0jco4uWtIUBeUgmpxw6EM=
X-Google-Smtp-Source: AGHT+IF0TUZpPMdcG8bicWOt3TWYvXHCUavS4knfywICFzaGqPC2kwIZjfZwxoOgDqaCiwvp+NbjMI8c8F/hK6ShCMA=
X-Received: by 2002:a05:6512:1052:b0:553:2c92:a867 with SMTP id
 2adb3069b0e04-5550b9e0f38mr4342356e87.55.1751298567244; Mon, 30 Jun 2025
 08:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org> <cb9bd1e4-9424-4ed2-bdfa-49c883c60a66@infradead.org>
In-Reply-To: <cb9bd1e4-9424-4ed2-bdfa-49c883c60a66@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Jul 2025 00:48:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnYi7-aL1NYj3s5udeBMjNEurHx0cDwbU14Uks6FXa9Q@mail.gmail.com>
X-Gm-Features: Ac12FXykJ4OpXnjNOItoJBDt-tQEmr9ok1Xmg42O0gsHazg4QW_kvZ8EVy_dNiU
Message-ID: <CAK7LNARnYi7-aL1NYj3s5udeBMjNEurHx0cDwbU14Uks6FXa9Q@mail.gmail.com>
Subject: Re: [PATCH 00/66] kconfig: improve xconfig and gconfig
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> > [xconfig]
> >
> >  - small improvement for choice
> >
> > [gconfig]
> >
> >  - Fix memory leak
> >  - Lots of refactoring
> >  - Migrate GTK 2 to GTK 3
> >  - Fix all compile warnings
> >  - Improve usability (grey out buttons, keep the item selection, etc.)
> >
> >
>
> Hi,
> I have tested all 65 patches here (omitting 52).
> They worked well. Good job.
> I will test your git tree/branch Monday/Tuesday.
>
> I did notice one visual difference. The GTK+2 version of
> gconfig (before the patches) uses an alternating white/light gray
> background for the menu items while the GTK+3 version (after the
> patches) uses an all white background.
>
> I prefer the alternating but it may be just some collateral damage
> in the name of progress.  Or could be something else entirely!


I think
[PATCH 15/66] kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
affected this.

gtk_tree_view_set_rules_hint() is deprecated.


The comment says "just do it in a theme"
 https://gitlab.gnome.org/GNOME/gtk/-/blob/3.14.0/gtk/gtktreeview.c#L11875

But, I do not know which theme should be applied.




> Before you posted all of these gconfig patches, I was going to ask
> how many gconfig users are there?  I don't see much on the mailing
> list about gconfig from users and suggest that maybe we should just
> drop it, but if you are OK with maintaining it and updating it like
> in this patch series, so be it.
>
> I did seem to have found one gconfig user [1]. Maybe you are also
> a gconfig user.

I keep it as far as I can maintain it.
I am not a heavy user of gconfig, but I maintain all front-ends for now.


>
>
> [1] https://lore.kernel.org/linux-kbuild/67b44d49-d23c-fab0-e165-cc848175=
62af@infradead.org/
>
>
>
> >
> > Masahiro Yamada (66):
> >   kconfig: set MENU_CHANGED to choice when the selected member is
> >     changed
> >   kconfig: qconf: do not show checkbox icon for choice
> >   kconfig: qconf: show selected choice in the Value column
> >   kconfig: rename menu_get_parent_menu() to
> >     menu_get_menu_or_parent_menu()
> >   kconfig: re-add menu_get_parent_menu() that returns parent menu
> >   kconfig: gconf: make columns resizable
> >   kconfig: gconf: fix potential memory leak in renderer_edited()
> >   kconfig: gconf: always destroy dialog in on_window1_delete_event()
> >   kconfig: gconf: remove old #ifdef GTK_CHECK_VERSION
> >   kconfig: gconf: remove empty if-block
> >   kconfig: gconf: remove meaningless code in init_main_window()
> >   kconfig: gconf: remove unneeded gtk_tree_view_set_headers_visible()
> >     calls
> >   kconfig: gconf: remove gtk_tree_view_column_set_visible() calls
> >   kconfig: gconf: remove gtk_widget_realize() calls
> >   kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
> >   kconfig: gconf: remove unnecessary gtk_set_locale() call
> >   kconfig: gconf: remove internal-child=3D"image" nodes from glade
> >   kconfig: gconf: remove parents[] array and indent variable
> >   kconfig: gconf: remove unnecessary NULL checks for tree1 and tree2
> >   kconfig: gconf: remove unneeded variable in on_split_clicked()
> >   kconfig: gconf: remove unneeded variables in
> >     on_treeview*_button_press_event()
> >   kconfig: gconf: remove unused 'color' variable
> >   kconfig: gconf: add static qualifiers to variables
> >   kconfig: gconf: move init_*() functions below
> >   kconfig: gconf: refactor view setting code
> >   kconfig: gconf: grey out button for current view
> >   kconfig: gconf: move the main window event handlers below
> >   kconfig: gconf: move button1 initialization below
> >   kconfig: gconf: add static qualifiers to event handlers
> >   kconfig: gconf: remove glade_xml_signal_autoconnect() call
> >   kconfig: gconf: make key_press_event work in left pane too
> >   kconfig: gconf: avoid hardcoding model2 in
> >     on_treeview2_cursor_changed()
> >   kconfig: gconf: avoid hardcoding model2 in renderer_edited()
> >   kconfig: gconf: avoid hardcoding model* in
> >     on_treeview*_button_press_event()
> >   kconfig: gconf: add on_save_clicked() event handler
> >   kconfig: gconf: use GtkFileChooser in on_load1_activate()
> >   kconfig: gconf: use GtkFileChooser in on_save_as1_activate()
> >   kconfig: gconf: use GdkPixbuf in replace_button_icon()
> >   kconfig: gconf: refactor replace_button_icon()
> >   kconfig: gconf: make introduction, about, license dialogs modal
> >   kconfig: gconf: remove global 'tree' variable
> >   kconfig: gconf: merge 'current' and 'browsed' global variables
> >   kconfig: gconf: preserve menu selection when switching view mode
> >   kconfig: gconf: use GtkTreeModelFilter to control row visibility
> >   kconfig: gconf: remove global 'model1' and 'model2' variables
> >   kconfig: gconf: remove init_tree_model()
> >   kconfig: gconf: inline fill_row() into set_node()
> >   kconfig: gconf: do not reconstruct tree store when a symbol is change=
d
> >   kconfig: gconf: inline display_list() into set_view_mode()
> >   kconfig: gconf: remove dead code in display_tree_part()
> >   kconfig: gconf: rename display_tree_part()
> >   kconfig: gconf: remove fixup_rootmenu()
> >   kconfig: gconf: use size_allocate event handler
> >   kconfig: gconf: replace GDK_space with GDK_KEY_space
> >   kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
> >   kconfig: gconf: remove "tooltips" property from glade
> >   kconfig: gconf: replace "tooltip" property with "tooltip-text"
> >   kconfig: gconf: remove unnecessary default message in text view
> >   kconfig: gconf: use gtk_check_menu_item_get_active() accessor
> >   kconfig: gconf: use gtk_dialog_get_content_area() accessor
> >   kconfig: gconf: remove GtkHandleBox from glade
> >   kconfig: gconf: rename gconf.glade to gconf.ui
> >   kconfig: gconf: migrate to GTK 3
> >   kconfig: gconf: replace GtkVbox with GtkBox
> >   kconfig: gconf: replace GdkColor with GdkRGBA
> >   kconfig: gconf: show GTK version in About dialog
> >
> >  scripts/kconfig/conf.c                    |    2 +-
> >  scripts/kconfig/gconf-cfg.sh              |   11 +-
> >  scripts/kconfig/gconf.c                   | 1828 ++++++++++-----------
> >  scripts/kconfig/{gconf.glade =3D> gconf.ui} |  360 ++--
> >  scripts/kconfig/lkc.h                     |    1 +
> >  scripts/kconfig/menu.c                    |   20 +
> >  scripts/kconfig/qconf.cc                  |   26 +-
> >  scripts/kconfig/symbol.c                  |    4 +
> >  8 files changed, 1023 insertions(+), 1229 deletions(-)
> >  rename scripts/kconfig/{gconf.glade =3D> gconf.ui} (57%)
> >
>
> --
> ~Randy
>


--=20
Best Regards
Masahiro Yamada

