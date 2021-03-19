Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF8A34263F
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 20:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCSTcl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Mar 2021 15:32:41 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:60886 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCSTcS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Mar 2021 15:32:18 -0400
Date:   Fri, 19 Mar 2021 19:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1616182335; bh=9VUmIi1F2KHRER9ZPKT/CtMwZl7ibuhBjeNeVtnTB7I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=PZWFLKKr7qHfHgEOTKyn1JZPkr3cdQGkwOgIGihn78WrspEgMvi14MAWXtE/lBLVt
         N3MF7k6Wo1e9WrVZnVm6AaJt7tI8qZKGlZPlN6Vco6mtyhnF1EQn4XsAq2Wbf8r9QF
         oPdxUKae89Z41PsKAU+jPL6H59F2sNWNEMkIugorYcik1GTzxwm2sGEowj3uH+Lwm5
         IX/FnZ99nNsTVUTao5rDhjJFi0a2T6GrUTqdnIeUI8qqAD1rA0d1R5jFQ2CYbqKU8n
         KTU5mTmgwMfoLtygFeAHXF+8bZXYfzJwHMbBFv2542EJvpgNQ/qZ5QcrbYa8CwUpbo
         DAuRYtXcG3Txw==
To:     Masahiro Yamada <masahiroy@kernel.org>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH 1/2] kconfig: fence choices and menuconfigs with comments in .config too
Message-ID: <20210319193150.267510-2-alobakin@pm.me>
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

Comment blocks are now generated in .config only for menus. Provide
them for choices and menuconfigs too to greatly improve dotconfig
readability.

Choices before:

CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=3Dy

Choices after:

CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy

CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=3Dy

Menuconfigs before:

CONFIG_RESET_CONTROLLER=3Dy

Menuconfigs after:

CONFIG_RESET_CONTROLLER=3Dy

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 scripts/kconfig/confdata.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2568dbe16ed6..e4f0a21fd469 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -869,17 +869,20 @@ int conf_write(const char *name)
 =09menu =3D rootmenu.list;
 =09while (menu) {
 =09=09sym =3D menu->sym;
-=09=09if (!sym) {
-=09=09=09if (!menu_is_visible(menu))
-=09=09=09=09goto next;
+
+=09=09if ((!sym || (sym->flags & SYMBOL_CHOICE) ||
+=09=09     (menu->prompt && menu->prompt->type =3D=3D P_MENU)) &&
+=09=09    menu_is_visible(menu)) {
 =09=09=09str =3D menu_get_prompt(menu);
 =09=09=09fprintf(out, "\n"
 =09=09=09=09     "#\n"
 =09=09=09=09     "# %s\n"
 =09=09=09=09     "#\n", str);
 =09=09=09need_newline =3D false;
-=09=09} else if (!(sym->flags & SYMBOL_CHOICE) &&
-=09=09=09   !(sym->flags & SYMBOL_WRITTEN)) {
+=09=09}
+
+=09=09if (sym && !(sym->flags & SYMBOL_CHOICE) &&
+=09=09    !(sym->flags & SYMBOL_WRITTEN)) {
 =09=09=09sym_calc_value(sym);
 =09=09=09if (!(sym->flags & SYMBOL_WRITE))
 =09=09=09=09goto next;
@@ -896,11 +899,11 @@ int conf_write(const char *name)
 =09=09=09menu =3D menu->list;
 =09=09=09continue;
 =09=09}
-=09=09if (menu->next)
-=09=09=09menu =3D menu->next;
-=09=09else while ((menu =3D menu->parent)) {
-=09=09=09if (!menu->sym && menu_is_visible(menu) &&
-=09=09=09    menu !=3D &rootmenu) {
+
+=09=09do {
+=09=09=09if (((menu->sym && menu->sym->flags & SYMBOL_CHOICE) ||
+=09=09=09     (menu->prompt && menu->prompt->type =3D=3D P_MENU)) &&
+=09=09=09    menu_is_visible(menu) && menu !=3D &rootmenu) {
 =09=09=09=09str =3D menu_get_prompt(menu);
 =09=09=09=09fprintf(out, "# end of %s\n", str);
 =09=09=09=09need_newline =3D true;
@@ -909,7 +912,7 @@ int conf_write(const char *name)
 =09=09=09=09menu =3D menu->next;
 =09=09=09=09break;
 =09=09=09}
-=09=09}
+=09=09} while ((menu =3D menu->parent));
 =09}
 =09fclose(out);

--
2.31.0


