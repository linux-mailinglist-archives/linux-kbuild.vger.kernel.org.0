Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9E92FEFB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbhAUQCM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732792AbhAUQCH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:02:07 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3F4C06174A;
        Thu, 21 Jan 2021 08:01:27 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q7so2233925wre.13;
        Thu, 21 Jan 2021 08:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=J7bgRKp0teiSnNGg4UCSmhQzrOjTg56xRkU9D9eD0Ps=;
        b=ke5mLZm5hoyt4q6IYzlTxuFr/paokUApMJA33yBOHB1GDTHQDiDMkl3B7AR9KIsTxB
         h80btkWHcfbqxZYX+91Qthq9ug7IbTNBukToZqryUvSvd0fk3zs4VGFZiaXfn48mGic7
         LJHidNSw8Fg/ZWoxf+BAiVgTN0lGUkLvTygf5CV5al6b5aU6hEZfDRtkRaktTxsWxr+e
         RfQOMj7GUnR40Dzz/TwhySZQFDVrQ30K6So+Qub01oLooLLIaqrrISQmGPQBRr/KmWNs
         EmImCp13d5H1pAkFz/L2axTUWh2sm3FMEsWYbapIRGNnxCGfHFrj68t8G9P7+jMUHFD9
         PHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J7bgRKp0teiSnNGg4UCSmhQzrOjTg56xRkU9D9eD0Ps=;
        b=mjeguNCS6b/jr98Uv6Rh67UgQbRWBYUa8PLarIJNWwDXp0V+pBdur72nXawJdIC085
         TofZmnCLYq5hB9MVrrQjHIlLjyNMnXJehme4g44TkSFFPxBBxqVPhmI2k8O9Tyewky4k
         cLFp3C2AaJBNg5Bc2af1XIXd0ghqD0XwbqdCSeLGkqi5VmKkBoqEO4LSJxpovlfwgX1G
         kXCD31841vwednwi9wA74FWNEvlgijKJDJv5A5A+FDIfCr4bPtYM+613aJ+pU/Lngdwv
         glBdNYYYstNn/6sEtOlhNKXPO4Pk2blP8Mpt/iuAJB+L58aZ6zCfifEzR1q4kglW7Kof
         ee0g==
X-Gm-Message-State: AOAM531V1T1nsvdWAfis+3R7GXVQZZhgEDum8yu68AbKDwAL1MzCdU/a
        AKo+VK+RkS+INJdZxaGStME=
X-Google-Smtp-Source: ABdhPJxTVQfJFn1flo2XVyPjKWzlFf1LP+U3/12W9uxNqe6rqvqYjqH2lS9nvnq50JMojSwM3U3FYg==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr135945wrw.386.1611244886023;
        Thu, 21 Jan 2021 08:01:26 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2dca:1300:4982:bb9c:f32e:b0de])
        by smtp.gmail.com with ESMTPSA id m8sm6424482wrv.37.2021.01.21.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:01:25 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Date:   Thu, 21 Jan 2021 17:01:15 +0100
Message-Id: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
Kconfig") removed ./scripts/clang-version.sh and moved its content to
./scripts/cc-version.sh.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    scripts/clang-version.sh

The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
changes in ./scripts/clang-version.sh; as the file is removed, track
changes in ./scripts/cc-version.sh instead now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210121

Masahiro-san, please pick this quick fix-up patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5d7cf38ec82..aafbea806a82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4355,8 +4355,8 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
+F:	scripts/cc-version.sh
 F:	scripts/clang-tools/
-F:	scripts/clang-version.sh
 F:	scripts/lld-version.sh
 K:	\b(?i:clang|llvm)\b
 
-- 
2.17.1

