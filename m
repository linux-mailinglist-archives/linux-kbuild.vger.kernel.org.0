Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E9586C0E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 23:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbfHHVHk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 17:07:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43490 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbfHHVHk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 17:07:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id E8A7B28CB46
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        kernel@collabora.com,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH RFC 0/1] kbuild: enable overriding the compiler using the environment
Date:   Thu,  8 Aug 2019 23:06:51 +0200
Message-Id: <cover.1565297255.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building with clang and there is no gcc available, running
merge_config.sh fails without this fix because it can't build
scripts/basic/fixdep with HOSTCC hard-coded to be gcc in the top-level
Makefile.  This was discovered while trying to build big-endian arm64
kernels with clang for kernelci.org in a Docker container with only clang
as a host compiler.

While this fix seems like a very obvious thing to do, it's equally
surprising that it hasn't been done before.  This is why I'm sending this
as an RFC; there may be a very good reason why the compiler variables
still need to be hard-coded with gcc in the top-level Makefile.

Guillaume Tucker (1):
  kbuild: enable overriding the compiler using the environment

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--
2.20.1
