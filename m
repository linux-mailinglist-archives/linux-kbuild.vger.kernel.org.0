Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D69A3F4125
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Aug 2021 21:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhHVTX1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Aug 2021 15:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhHVTX1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Aug 2021 15:23:27 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A05C061575;
        Sun, 22 Aug 2021 12:22:46 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id mf2so13673774ejb.9;
        Sun, 22 Aug 2021 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQwwWi8pzZLVtxpYs3mzQhHwoo2kimSDtH2rko5X/pY=;
        b=e/dSwo3ggUgSdp835W727VNt0R/CB4XXUAtgzc4BQWvJGto8ls5nyh1i81nDf/c7RA
         z6td3db73V6u70wgfLMLUGE55bZs4+na0y/5Uo7HtqFH83OeQPXDhEEZ8zXBGeH1yRcF
         /j6WXp4YCrzXG8LLiGS/cnuK56n2hz7bHmPGypuTCuR9IcAmRSbo0/AT+vwwjylN+1R6
         e3KKGqTJ+Y+x6b6S+HmNj4o5FA7Esaz1iP8vWfcwRWRsNHVUqbVSnkTNIaBpP1EtNb9Q
         CEi6kyjKCJUbOHecfzwRSn9raOY4MiarvgGk3kgWuJ+xT9t0DLApExrQ0BjIHyVKiVxQ
         QPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQwwWi8pzZLVtxpYs3mzQhHwoo2kimSDtH2rko5X/pY=;
        b=l2RKvOOjFBmOwqxq05ZefvR8Cc2za0xiWWjnwWoxnMq8wj7asxgNIUWppZutamGPhQ
         i3mhvozcGwISPZ7V/HfpkoueVElTVEiLS56xvUN239375LfzrE04gWZb1xKc0dotDBsk
         ZvNbLi2cn46z1RBeA5R1LjA/YUZBrQfSL+kH0x52vQWp+g7BCvXhuaEBHlv4cR1oSZ20
         Mqua8sMJqgGU2F3EfabrGST6XWdG5zku15Oaoqdz87ay1fuDlpHqrn/d/5YNTycdxTVu
         8DFQGunIeDPZ63oUyYndlqki9oNiIGZGpcvk+Qo9JgVC6fy8hKyAZ9GbY5RbTkqZJ3Ql
         t5CQ==
X-Gm-Message-State: AOAM531AKqqL3KX1q9K3Er1GM95bR8VeZs4rWCq2ab4CnOn5ZU6xoiGe
        Bgk7NP2p410RovuLdsOQQXw=
X-Google-Smtp-Source: ABdhPJwIqSsrBmXWJpf5HFqPEH4AwIsJQja5Oce7zwDPRuOT49POjbrbPPV1ATOVMRdJXKxm7Er3qg==
X-Received: by 2002:a17:906:2a8e:: with SMTP id l14mr31731378eje.321.1629660164613;
        Sun, 22 Aug 2021 12:22:44 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id o6sm1577950eje.6.2021.08.22.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:22:44 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Ariel Marcovitch <arielmarcovitch@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] checkkconfigsymbols.py: Fix various bugs
Date:   Sun, 22 Aug 2021 22:22:00 +0300
Message-Id: <20210822192205.43210-1-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

This series fixes some issues in the checkkconfigsymbols.py script.

The first patch fixes a bug in the --ignore option that makes the
script check only the files matching the pattern instead of ignoring
them.

The second patch fixes a parsing error in the Kconfig files parser
that makes it ignore 'if' statements after 'help' sections.

The third patch prevents the user from using 'HEAD' refs in the
 --commit option, because it doesn't really work.

Thanks!

-Ariel

Ariel Marcovitch (3):
  checkkconfigsymbols.py: Fix the '--ignore' option
  checkkconfigsymbols.py: Fix Kconfig parsing to find 'if' lines
  checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit

 scripts/checkkconfigsymbols.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)


base-commit: 36a21d51725af2ce0700c6ebcb6b9594aac658a6
-- 
2.25.1

