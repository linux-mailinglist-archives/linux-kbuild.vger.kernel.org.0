Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1CF213034
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2020 01:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgGBXjf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jul 2020 19:39:35 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55243 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgGBXjf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jul 2020 19:39:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B03BD5C016C;
        Thu,  2 Jul 2020 19:39:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 02 Jul 2020 19:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=aUKX8t6lKl6VE3fnEcWtgjKc9b
        ud69PiShCeCobiMYA=; b=EfqiGpedOuskUcm4EYggaVqmYhJKSGz/JT+V1rLHHO
        EBJyNtsEaVWjnQHclxQSxKC5csQrwkNjFvfaoO8wOZnP2EFTw8uooWBZ4gE1T4dB
        o3qz0myHQrb2aGJGkKemJTN3E0l+2bO/uHd5W43MZK3klSDbNzHF5EYoZpLxFtq8
        j9Cc3P6RzVmqLDez/C3v1hCl2PMsPGeOq/JNMsgAk1jxyLIry7wLCScmQNhkMAU/
        dj5aD3TZbguT40rUYuAEumoAYnV5NfWvs3btSUC9cbl7i2KOr8R9bUl2/4F1I1VQ
        /EXpobCJOB8p1/5pPC5WxH4MYVvH4/HUEaLStrL5fiFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aUKX8t6lKl6VE3fnE
        cWtgjKc9bud69PiShCeCobiMYA=; b=hnVWUEOlXL9MpHbzPilmVr6Ns3AIQlBc/
        t6NYU8RoJ5e+//X/RQ+IKPWsbda+rVzPqpE4MmhHKQlCGxfpWKiw6+/folOusKyA
        s4xSdjIRpnhTp8mSqolGznbIsQ/Esxl7vsYX5PA4LtY2Z1xwtQuclutAsNeV7tjR
        1tsqJSrR3cK+iU6n81RvZ/fIBg0f4bn8bAXF7PioQ0mUgD453oXIY1MLOswyX7JZ
        0Sp5zAOc1Y+NH3eu+hQQQO9fQMDdsj6fC7WoA5IeELNE1ZNvHH32XUDxmWavtrA8
        vic71hzk9XSYs3JzN1hKTQWWgNotL9Zf2wq6mYB25syrZZbWyX9BQ==
X-ME-Sender: <xms:NXD-XuZeMR37LUGBjXDqnFo00b4-iImzVw5qNA57BMEwTmjPTzwSaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepffgrnhhnhicunfhi
    nhcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtthgvrhhnpefhie
    fhgfelgfdufedvudelvdefvdefgfeiueeufeegteffudekgefhvedtieefteenucfkphep
    jeefrddvvdehrdegrddufeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:NXD-XhYoRgFHzPYXbeGD-BtTtrNjTFYOUXne_n3qQGL2f1oKk0rh3A>
    <xmx:NXD-Xo8ti5JKCJ2v9ooAJOhFnirmiJCVOW0aECqr9A1zXcbSXDEU8g>
    <xmx:NXD-XgpM6LaAjKo8wnOoOkcHSysMIFsHDUGtSLOrqMBJQ_vlCh9lCQ>
    <xmx:NXD-XqdJ7Lcm-mxjvRYKFuf07E542AmxUkvWXIi6T4nW9AIU-jyp_w>
Received: from pinwheel.hsd1.wa.comcast.net (c-73-225-4-138.hsd1.wa.comcast.net [73.225.4.138])
        by mail.messagingengine.com (Postfix) with ESMTPA id F0DB73060062;
        Thu,  2 Jul 2020 19:39:31 -0400 (EDT)
From:   Danny Lin <danny@kdrag0n.dev>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Danny Lin <danny@kdrag0n.dev>
Subject: [PATCH] kbuild: Allow Clang global merging if !MODULES
Date:   Thu,  2 Jul 2020 16:39:29 -0700
Message-Id: <20200702233929.181409-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The old reasoning for disabling Clang's global merging optimization is
that it breaks modpost by coalescing many symbols into _MergedGlobals.
However, modpost is only used in builds with dynamic modules;
vmlinux.symvers is still created during standalone builds, but it's
effectively just an empty dummy file.

Enabling the optimization whenever possible allows us to reap the
benefits of reduced register pressure when many global variables are
used in the same function.

An x86 defconfig kernel built with this optimization boots fine in qemu,
and a downstream 4.14 kernel has been used on arm64 for nearly a year
without any issues caused by this optimization.

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index a60c98519c37..f04c3639cf61 100644
--- a/Makefile
+++ b/Makefile
@@ -772,10 +772,13 @@ ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
 KBUILD_CFLAGS += -Wno-format-invalid-specifier
 KBUILD_CFLAGS += -Wno-gnu
+
+ifdef CONFIG_MODULES
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
 KBUILD_CFLAGS += -mno-global-merge
+endif
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.27.0

