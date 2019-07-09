Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A359E633C5
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 11:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfGIJ6G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 05:58:06 -0400
Received: from mx1.riseup.net ([198.252.153.129]:46900 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfGIJ6G (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:58:06 -0400
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
        by mx1.riseup.net (Postfix) with ESMTPS id D92CF1A0249;
        Tue,  9 Jul 2019 02:58:04 -0700 (PDT)
X-Riseup-User-ID: 077506A9166EDD611D1BDA0D2B4B64163B74DD2F9F782D635CDA95E7F337946F
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by capuchin.riseup.net (Postfix) with ESMTPSA id 6B2681207E6;
        Tue,  9 Jul 2019 02:58:00 -0700 (PDT)
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
From:   =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>
Openpgp: preference=signencrypt
Autocrypt: addr=joonas.kylmala@iki.fi; prefer-encrypt=mutual; keydata=
 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
 gKPkEg==
Subject: Issue/Bug report: auto.conf not generated correctly when
 CROSS_COMPILE environment var set
Message-ID: <ed43c836-bbb2-9283-67ce-4b59563ac327@iki.fi>
Date:   Tue, 9 Jul 2019 12:57:57 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro and Michal,

I'm having a build issue regarding auto.conf generation with the the
latest master (commit 5ad18b2e60b7) plus this patch to use
CONFIG_USB_FUNCTIONFS as built-in module:

diff --git a/arch/arm/configs/imx_v6_v7_defconfig
b/arch/arm/configs/imx_v6_v7_defconfig
index 8116648a8efd..228098c64c48 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -345,14 +345,7 @@ CONFIG_USB_CONFIGFS_F_MIDI=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_UVC=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
-CONFIG_USB_ZERO=m
-CONFIG_USB_AUDIO=m
-CONFIG_USB_ETH=m
-CONFIG_USB_G_NCM=m
-CONFIG_USB_GADGETFS=m
-CONFIG_USB_FUNCTIONFS=m
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_SERIAL=m
+CONFIG_USB_FUNCTIONFS=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y

Here is a excerpt from my terminal so you can understand and reproduce
the bug/issue easily:

user@builder:~/linux$ export CROSS_COMPILE=arm-none-eabi-
user@builder:~/linux$ export ARCH=arm
user@builder:~/linux$ make mrproper && make clean && make
imx_v6_v7_defconfig && rgrep USB_FUNCTIONFS | grep "auto.conf"
  CLEAN   scripts/basic
  CLEAN   scripts/kconfig
  CLEAN   include/config include/generated
  CLEAN   .config
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
user@builder:~/linux$ make mrproper && make clean && make
imx_v6_v7_defconfig && make syncconfig && rgrep USB_FUNCTIONFS | grep
"auto.conf"
  CLEAN   scripts/basic
  CLEAN   scripts/kconfig
  CLEAN   include/config include/generated
  CLEAN   .config
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
scripts/kconfig/conf  --syncconfig Kconfig
include/config/auto.conf:CONFIG_USB_FUNCTIONFS=y
include/config/auto.conf:CONFIG_USB_FUNCTIONFS_GENERIC=y

As we can see in the first build command run CONFIG_USB_FUNCTIONFS=y
doesn't appear in the file include/config/auto.conf, it only appears
after running "make syncconfig". Normally this is not a problem for me
since for "make *_defconfig" I don't use CROSS_COMPILE in that step and
I only use it in "make zImage". If I run "CROSS_COMPILE=xxxx make
zImage" then I think syncconfig is triggered because in the "make
*_defconfig" stage the compiler was different [1] and so I don't hit
this issue with auto.conf not being generated correctly.

Anyways, some projects like LineageOS set the CROSS_COMPILE variable
even for "make *_defconfig" command (for reproducibility reasons I
guess) so this issue exists there. And it is quite handy to just put to
your shell profile "export CROSS_COMPILE=xxx" so one doesn't need to
type it always.

I'm using Debian 9 for compilation so I think the version of
arm-none-eabi-gcc is 5.4.1 (debian package version
15:5.4.1+svn241155-1). As I understood, Denis (in CC) was able to
reproduce this in Trisquel 8 with similar commands but slightly older
kernel version 5.2rc7 plus some additional patches.

[1] https://patchwork.kernel.org/patch/10507817/

-Joonas
