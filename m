Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163DD342656
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 20:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhCSTh2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Mar 2021 15:37:28 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:20462 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhCSThV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Mar 2021 15:37:21 -0400
Date:   Fri, 19 Mar 2021 19:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1616182639; bh=a22bdLLLFKTo4auJnUAqBgT9ExHsDoQaIWYHGEXtWeg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=cztofeO+4A0UG1XxfKp4WPMnkOJ5OnmlI0eObtyAVy4Ry3Dy4HiinE6g9uPXAmtI+
         lDxP/4Vr4mkWx5tT8jehrHOdNgfNmaB4hoM5TqU++jyA4somHne5GaJb3JA3jDe26N
         QsbEdco+DmJEaNP/w/9CqgeyHscok42jfneZEl5mP1EhBvGo3Nf3oMXqYhqsjg65nM
         vqIjQhQk/xKDDIj/xhRsJRC+53KidR32d66wgyHG5Cx7HlyYarD8s0WwEJ2GqDZpvP
         4X5TVd9ib/bwlbvYUJva7r+kbkrP4QUKwCK/X5klVFD3POZBClAGNcHql8mN5cpARH
         Q84Rv9109givw==
To:     Masahiro Yamada <masahiroy@kernel.org>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH RESEND 2/2] kconfig: mention submenu type in comment blocks in .config
Message-ID: <20210319193705.267922-3-alobakin@pm.me>
In-Reply-To: <20210319193705.267922-1-alobakin@pm.me>
References: <20210319193705.267922-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To have a better understanding of the dotconfig blocks, mention if
a particular block-commented section is a choice or a menu{,config}.

Before:

x
x Timers subsystem
x
CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy

x
x Timer tick handling
x
x CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=3Dy
x end of Timer tick handling

x CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=3Dy
x end of Timers subsystem

After:

x
x Timers subsystem menu
x
CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy

x
x Timer tick handling choice
x
x CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=3Dy
x end of Timer tick handling choice

x CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=3Dy
x end of Timers subsystem menu

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 scripts/kconfig/confdata.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index e4f0a21fd469..3f50d8b82a54 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -822,6 +822,17 @@ int conf_write_defconfig(const char *filename)
 =09return 0;
 }

+static const char *menu_type_string(const struct menu *menu)
+{
+=09if (menu->sym && (menu->sym->flags & SYMBOL_CHOICE))
+=09=09return " choice";
+
+=09if (menu->prompt && menu->prompt->type =3D=3D P_MENU)
+=09=09return " menu";
+
+=09return "";
+}
+
 int conf_write(const char *name)
 {
 =09FILE *out;
@@ -876,8 +887,8 @@ int conf_write(const char *name)
 =09=09=09str =3D menu_get_prompt(menu);
 =09=09=09fprintf(out, "\n"
 =09=09=09=09     "#\n"
-=09=09=09=09     "# %s\n"
-=09=09=09=09     "#\n", str);
+=09=09=09=09     "# %s%s\n"
+=09=09=09=09     "#\n", str, menu_type_string(menu));
 =09=09=09need_newline =3D false;
 =09=09}

@@ -905,7 +916,8 @@ int conf_write(const char *name)
 =09=09=09     (menu->prompt && menu->prompt->type =3D=3D P_MENU)) &&
 =09=09=09    menu_is_visible(menu) && menu !=3D &rootmenu) {
 =09=09=09=09str =3D menu_get_prompt(menu);
-=09=09=09=09fprintf(out, "# end of %s\n", str);
+=09=09=09=09fprintf(out, "# end of %s%s\n", str,
+=09=09=09=09=09menu_type_string(menu));
 =09=09=09=09need_newline =3D true;
 =09=09=09}
 =09=09=09if (menu->next) {
--
2.31.0


