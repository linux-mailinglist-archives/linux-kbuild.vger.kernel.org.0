Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08C934263D
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 20:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhCSTck (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Mar 2021 15:32:40 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:34247 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhCSTcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Mar 2021 15:32:16 -0400
Date:   Fri, 19 Mar 2021 19:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1616182334; bh=5yWe8Hx3mAzgD1cjJ6fOFRik6bzQ9/2qcyBrY/E5cZw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=VPTcDjFrZg96Qg6rq2J8Y02Dk/JQQeRfozk2s+srD9UjD0Pae7fK6jZNDHywDfuqv
         QoSNznF0Y2Fu4jTDqAJk/L+SSANzlOjC1UY1Wg3xQdatfMxPEN0RpfFzvhYhSQyJiN
         2QUMKosKWmfk7SRf/0mU3sZQ9epU6CuhhWj/4PbMZjiD3QK+gG2IW07MhmyxT6sUCO
         eodVEOGQyuUh5Q5jN6LDpbSLJcAId8ASjVAil226Jker5X32wOdU5Nsb5P9VBi6pLX
         y55LyCt09La1xRauNB+ZoeTPU8uM972GPeG/Qu4pMgeUitOq53WFfTqlm6ACt+bqn7
         ZwESYQTIpZtHQ==
To:     Masahiro Yamada <masahiroy@kernel.org>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH 2/2] kconfig: mention submenu type in comment blocks in .config
Message-ID: <20210319193150.267510-3-alobakin@pm.me>
In-Reply-To: <20210319193150.267510-1-alobakin@pm.me>
References: <20210319193150.267510-1-alobakin@pm.me>
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

CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy

CONFIG_NO_HZ_IDLE=3Dy

CONFIG_HIGH_RES_TIMERS=3Dy

After:

CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy

CONFIG_NO_HZ_IDLE=3Dy

CONFIG_HIGH_RES_TIMERS=3Dy

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


