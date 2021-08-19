Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9033F0FB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHSA7N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:13 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60145 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbhHSA7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:11 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4j017219;
        Thu, 19 Aug 2021 09:57:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4j017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334667;
        bh=XX9owLp8zLvczu8bj8Khsy0Z+vUSEE7gymjlq/whycU=;
        h=From:To:Cc:Subject:Date:From;
        b=x1vPPvzyJd3Si2q4ytwVeyhH1DIKsbsU+Oqkd8m2CIAB410u256U/yWd43Zr2Y0Yx
         CU9ft6bbZ/2ViaCT8DbeeGDYGIYz9gWvj0PDJHimN9ICxTEtabcHTUJMRy+edOq1Vl
         UhGluOnwVDzyduIFa/Cjl53E0WFAm9NtxFioExRfQEEZE8XsdbRQsh7+7J4wZFpGat
         /fLwZk4VCADI42S6M/yLKvlwHDT9PSTLlVgVSHRCyPpD7KlN8EpKWhECJMg56pHSru
         36LltGPfPro2y8iRT6eOS4p0yBd0rHkfLgzGOijuu34+NIm0kHx6nA00T3f4IXVrwI
         3iSqXEiUjs66A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH 00/13] kbuild: refactoring after Clang LTO
Date:   Thu, 19 Aug 2021 09:57:31 +0900
Message-Id: <20210819005744.644908-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


The introduction of Clang LTO, the kbuild code became much
uglier due to CONFIG_LTO_CLANG conditionals.

It is painful to maintain the messed-up code, and to review
code changed on top of that.



Masahiro Yamada (13):
  kbuild: move objtool_args back to scripts/Makefile.build
  gen_compile_commands: extract compiler command from a series of
    commands
  kbuild: detect objtool changes correctly and remove .SECONDEXPANSION
  kbuild: remove unused quiet_cmd_update_lto_symversions
  kbuild: remove stale *.symversions
  kbuild: merge vmlinux_link() between the ordinary link and Clang LTO
  kbuild: do not remove 'linux' link in scripts/link-vmlinux.sh
  kbuild: merge vmlinux_link() between ARCH=um and other architectures
  kbuild: do not create built-in.a.symversions or lib.a.symversions
  kbuild: build modules in the same way with/without Clang LTO
  kbuild: always postpone CRC links for module versioning
  kbuild: merge cmd_modversions_c and cmd_modversions_S
  kbuild: merge cmd_ar_builtin and cmd_ar_module

 scripts/Makefile.build                      | 196 ++++++++------------
 scripts/Makefile.lib                        |  28 +--
 scripts/Makefile.modfinal                   |   4 +-
 scripts/Makefile.modpost                    |   7 +-
 scripts/clang-tools/gen_compile_commands.py |   2 +-
 scripts/link-vmlinux.sh                     | 125 +++++++------
 scripts/mod/modpost.c                       |   6 +-
 scripts/mod/sumversion.c                    |   6 +-
 8 files changed, 164 insertions(+), 210 deletions(-)

-- 
2.30.2

