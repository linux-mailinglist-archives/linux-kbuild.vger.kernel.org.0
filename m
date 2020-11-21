Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214182BBB72
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Nov 2020 02:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgKUBRA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 20:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgKUBQ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 20:16:59 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDA7C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 17:16:57 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id t12so8084664pga.5
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 17:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=hNPbwSq8l4B2UFQs+5TYEQCDL0cB2Zg3TMV5Lasbod4=;
        b=ugfvqn2ziXMzvGawN7KL27+OWEt83woAWs7sJai0MGAKigxomh1Up4fooJoxprkDAh
         mShdIhH4fAQZSL9ubMIhwV4BTeq4+Db65UpUEkd2Xght9vecx6EllCOjcZXrzsnvV88+
         rk6RWGH+THTcGg42K1XEuAyygYeGx7cf6WERxHOyU5QUXnFbUayZZJFbF7e+86zm7Qty
         P4z+TH/hiCWNHofAnGSsacLmDu6eXhrNv1ujy/hpON5Db80hN3HcpPh7B/avb9cAEJiu
         dKfsi1UKEbLchErzVmReH8Ioy7QL4SEoxFKrH3pj5/yIP4XIks2TFhCuoOdEDO0xw2L/
         7/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=hNPbwSq8l4B2UFQs+5TYEQCDL0cB2Zg3TMV5Lasbod4=;
        b=eVcM/DWWCFm7STjbdxFcuZY7KMhiqTS94Gv12Wj2S6K1X7FZIKthg0MBshhOXtZvmE
         BwEEE8F72VbUqI9wNTF1mlkRPbX0qpGJmNMA1vkIV1YLQeOjZFKwWWMbQcW7MBt231gl
         XB+7oO+td5EsdKtYc25Pmf+Sf3yOSLReRbJVt9Uw2IgrsBL+ClGFdwjz3QtJC6QGgKNI
         KUE5QdX3HlmoBoyANTd4dIoOb90QfuJOPoEC1MiHJVdw2tr3aopd/XlqQu+g2dmEIHHz
         FaZjAhopKrH1IRpZlJQkczC7Qm5NA0nO/PtscjsBsSE4XiFHojjyi78S2aUJT5h0S53V
         SiGw==
X-Gm-Message-State: AOAM532veHhLa6uQDccaWAobPPC9iScFNqdgX6WtNqKOgY4EuWTYmPSE
        tJLdrWWvkN8zbX4UZO1Fe6SleYCuJmmz0Q1Z55s=
X-Google-Smtp-Source: ABdhPJzkJlf/kKDwYCtYSLwy2coqGM5AAc+mxbuI6SxkFbdDHIUB4pJvsC4Q3wNlW5EhRQlCSv0oTEKFh6piUihEdQY=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:90b:e04:: with SMTP id
 ge4mr1353298pjb.0.1605921416735; Fri, 20 Nov 2020 17:16:56 -0800 (PST)
Date:   Sat, 21 Nov 2020 01:16:49 +0000
Message-Id: <20201121011652.2006613-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 0/2] Add support to capture external module's SCM version
From:   Will McVicker <willmcvicker@google.com>
To:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@google.com, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These two patches add module support to capture an external module's SCM
version as a MODULE_INFO() attribute. This allows users to identity the SCM
version of a given kernel module by using the modinfo tool or on the device
via sysfs:

  cat /sys/module/<module>/scmversion

It's important to note that the sysfs node is necessary in order to get the SCM
version of modules that were loaded from the ramdisk in first stage init.
I have updated scripts/setlocalversion to support this for git, mercurial, and
subversion.

Here is the example output I used to test these patches with a simple module
versioned with git, hg, and svn:

  $ modinfo simple_module.ko | egrep 'scmversion|vermagic'
  scmversion:     gbf35fd9b6412
  vermagic:       5.10.0-rc4-00110-gd83461f36865 SMP mod_unload

  $ modinfo simple_module.ko | egrep 'scmversion|vermagic'
  scmversion:     hge5037af323b9
  vermagic:       5.10.0-rc4-00110-gd83461f36865 SMP mod_unload

  $ modinfo simple_module.ko | egrep 'scmversion|vermagic'
  scmversion:     svn1
  vermagic:       5.10.0-rc4-00110-gd83461f36865 SMP mod_unload

Will McVicker (2):
  scripts/setlocalversion: allow running in a subdir
  modules: add scmversion field

 include/linux/module.h   |  1 +
 kernel/module.c          | 20 ++++++++++++++++++++
 scripts/Makefile.modpost | 19 +++++++++++++++++--
 scripts/mod/modpost.c    | 28 +++++++++++++++++++++++++++-
 scripts/setlocalversion  |  5 ++---
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.29.2.454.gaff20da3a2-goog

