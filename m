Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC143323064
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 19:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhBWSPK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 13:15:10 -0500
Received: from mail-oo1-f54.google.com ([209.85.161.54]:44545 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhBWSPI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 13:15:08 -0500
Received: by mail-oo1-f54.google.com with SMTP id n19so4082897ooj.11;
        Tue, 23 Feb 2021 10:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mLlNY+cGCFP0M8CPAs8lZy0a+QhOrOEW6xBzmwBXj2c=;
        b=A7NuUy+6RTMMVn89AWG0ceUuDGQKEZrQB4xdqkNVxeYejz6LOJ0POy8ykmjGzZCAEG
         pzLPYTd+qLvmcszf+6TrSBpwVBKRhWWxn+ALF/+woHmPh3fCzWlo9X917n/LuF7nJ2V1
         jwRNQmt0FFWVLyUiqLf4R1nKIzdrKbUtXo69uAbuGjkpp4r92BiUQR6f0rYfNXyIaf2X
         kS9vtGtFoDcILc4VQXE8wuH4kZygSy5bbg+3oB8dG+JifLWy/aA/552vZN+H3DnWePlv
         Otc9lkLz3Prks7U/eGDQO4kuJlA3good8WKHiEHI+ODX8mOqFwKEwcjV9sMH8aer+5Os
         N6Hg==
X-Gm-Message-State: AOAM533l9MG8HqIMdOhx4rKQAz1xb4MWsomEGdRKf6yVBfaZoc+5JvbY
        Zt5eV43rXsJ4V97s9XSmCA==
X-Google-Smtp-Source: ABdhPJwNQdjaDtp+Bksf3dL3jifdQ4+Hiw9XxpZo+//9Wqh12LGBIz7MS20NwYHPVrCvRqMqwARDcA==
X-Received: by 2002:a4a:a301:: with SMTP id q1mr10536866ool.26.1614104067027;
        Tue, 23 Feb 2021 10:14:27 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id b2sm3578113oov.3.2021.02.23.10.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:14:26 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Build time gitignore checking
Date:   Tue, 23 Feb 2021 12:14:22 -0600
Message-Id: <20210223181425.4010665-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus wasn't happy that I forgot a gitignore entry in my recent PR.
Checking that requires doing in tree build (which is not my usual
workflow) and checking git status afterwards. Given either one I'll
easily forget again, I came up with a build time check which works for
in tree and out of tree builds. It should also show up in any CI builds.

The first 2 patches are fixes which the 3rd patch found. They can be
picked up regardless of whether folks like the 3rd patch or not.

Rob


Rob Herring (3):
  kbuild: Make old-atomics and missing-syscalls phony targets
  x86: Drop generated syscall headers from 'targets'
  kbuild: Add a build check for missing gitignore entries

 Kbuild                           | 2 ++
 arch/x86/entry/syscalls/Makefile | 2 --
 scripts/Makefile.lib             | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.27.0

