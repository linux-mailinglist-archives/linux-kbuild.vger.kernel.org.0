Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23CDA82BD4
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731968AbfHFGkk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:40065 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731731AbfHFGkk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:40 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7n002982;
        Tue, 6 Aug 2019 15:39:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7n002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073565;
        bh=MYQWxBB4Al3Ia8pPRHpnmEigf5BHQKgKU8ZUvXIRiBM=;
        h=From:To:Cc:Subject:Date:From;
        b=iVbShB/JEzOl6DiDFu2PZU1LMIDOpQwQPZD9czJrvH5MjNlXB/C65CAktESwXz3ES
         iNBfhy2nCmOOaB0B6nnJEAPSdtmfdcBdFPw7tBpd0ajCIgKVcFUR/0ECw9Mxey36qn
         Ef231RdG6wDVean/w6XBJkTwB/DZhfbkP7SgxhNVpp6LzdK47ME9AGmVqT7C4ry5Ok
         9f8k3ofhlitJrfRFMBUUqiOpBC9ozgwS4XdFxEn0Gu7bq9+rgdkb0TpnxNg0kdbpDZ
         g7UrzH5AqnHb5rFkyq/mVSNWhIn4zMNAwy/wZr+Mugm/HPuDrWWmWy0sRIy+4bsDrA
         I6ioAhnUPXFUA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        dri-devel@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] kbuild: allow big modules to sub-divide Makefiles
Date:   Tue,  6 Aug 2019 15:39:18 +0900
Message-Id: <20190806063923.1266-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Recently, Jani Nikula requests a better build system support
for drivers spanning multiple directories.
(better kbuild support for drivers spanning multiple directories?)

I implemented it, so please take a look at it.

Note:
The single targets do not work correctly.

The single targets have never worked correctly:

[1] For instance, "make drivers/foo/bar/baz.o" will descend into
    drivers/foo/bar/Makefile, which may not necessarily specify
    the build rule of baz.o

    It is possible for drivers/foo/Makefile having
        obj-$(CONFIG_BAZ) += bar/baz.o

[2] subdir-ccflags-y does not work.

    The single targets directly descend into the directory of
    that file resides.

    It missed subdir-ccflags-y if it is specifies in parent
    Makefiles.

Perhaps, I will have to manage correct implementation of single targets.



Masahiro Yamada (5):
  kbuild: treat an object as multi-used when $(foo-) is set
  kbuild: clean up modname calculation
  kbuild: rename cmd_ar_builtin to cmd_ar_no_sym
  kbuild: support composite objects spanning across multiple Makefiles
  drm: i915: hierachize Makefiles

 drivers/gpu/drm/i915/Makefile               | 126 ++------------------
 drivers/gpu/drm/i915/display/Makefile       |  64 ++++++++++
 drivers/gpu/drm/i915/gem/Makefile           |  27 +++++
 drivers/gpu/drm/i915/gem/selftests/Makefile |   3 +
 drivers/gpu/drm/i915/gt/Makefile            |  16 +++
 drivers/gpu/drm/i915/gvt/Makefile           |  32 ++++-
 drivers/gpu/drm/i915/selftests/Makefile     |   9 ++
 scripts/Makefile.build                      |  39 +++---
 scripts/Makefile.lib                        |  66 ++++++----
 9 files changed, 218 insertions(+), 164 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/Makefile
 create mode 100644 drivers/gpu/drm/i915/selftests/Makefile

-- 
2.17.1

