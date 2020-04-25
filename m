Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6836D1B83E6
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2020 08:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgDYGJO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Apr 2020 02:09:14 -0400
Received: from m12-14.163.com ([220.181.12.14]:34093 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgDYGJO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 02:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=+ESiA77ZEHDu9ZQN5X
        F7l7lfdmphsqNlyWqP3Q+iRdE=; b=fGtT/DnZaiu7ifhpeD3+s1Ht14ilmtsCQN
        p8q7D0sGQ8Pd0lZW/EPkG7QgwEQmS6TFRvh1m0P9o/7VthAIK2fwDRR6hFcY93R4
        QaNwsMncaR4YRuhWJR2zdIMGQABBWJ9sogtP+gCaLxFDmv68v8YFzg1XgvKS5r8E
        noPL8vW6U=
Received: from localhost.localdomain (unknown [114.246.35.16])
        by smtp10 (Coremail) with SMTP id DsCowABndWHo06NesaqMBw--.24886S2;
        Sat, 25 Apr 2020 14:08:53 +0800 (CST)
From:   Wang Nan <pi3orama@163.com>
To:     wangnan0@huawei.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wang Nan <pi3orama@163.com>
Subject: [PATCH] kbuild: Add $(strip ...) before compare make variable with string
Date:   Sat, 25 Apr 2020 14:07:38 +0800
Message-Id: <1587794858-938-1-git-send-email-pi3orama@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DsCowABndWHo06NesaqMBw--.24886S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17trW8KrWDKr4rtw48tFb_yoW8Ar1rpa
        95Cws8JayrCFWkt3Z5AF48Kr1Fqw10v3yj9FWrJw1UAFnrta1xKF42krZ8Xa4xKFs3ArWU
        Wryak34rZr4kXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uk-BiUUUUU=
X-Originating-IP: [114.246.35.16]
X-CM-SenderInfo: lslt02xdpdqiywtou0bp/xtbBdQYRQFaD62ywBQADsG
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some of ifneq in Makefile.build works improperly:

 ifneq ($(a)$(b)$(c),)
 ...
 endif

Because some make vairable contains unintended spaces introduced by:

 a := $(x) $(y)

This commit adds $(strip ...) to some potentially buggy ifneq.

Signed-off-by: Wang Nan <pi3orama@163.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 scripts/Makefile.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9fcbfac..b2bc0db 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -46,7 +46,7 @@ include $(kbuild-file)
 include scripts/Makefile.lib
 
 # Do not include host rules unless needed
-ifneq ($(hostprogs)$(hostcxxlibs-y)$(hostcxxlibs-m),)
+ifneq ($(strip $(hostprogs) $(hostcxxlibs-y) $(hostcxxlibs-m)),)
 include scripts/Makefile.host
 endif
 
@@ -55,7 +55,7 @@ $(warning kbuild: Makefile.build is included improperly)
 endif
 
 ifeq ($(need-modorder),)
-ifneq ($(obj-m),)
+ifneq ($(strip $(obj-m)),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
 $(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
 endif
@@ -512,7 +512,7 @@ obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
 # If targets exist, their directories apparently exist. Skip mkdir.
 existing-dirs := $(sort $(patsubst %/,%, $(dir $(existing-targets))))
 obj-dirs := $(strip $(filter-out $(existing-dirs), $(obj-dirs)))
-ifneq ($(obj-dirs),)
+ifneq ($(strip $(obj-dirs)),)
 $(shell mkdir -p $(obj-dirs))
 endif
 endif
-- 
2.7.4


