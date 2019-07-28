Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19AF7800B
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2019 17:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfG1PLt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jul 2019 11:11:49 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43521 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfG1PLt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 11:11:49 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x6SFBWNn028910;
        Mon, 29 Jul 2019 00:11:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x6SFBWNn028910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564326693;
        bh=ExnBxlNsdkdRsGIbbztzAA2NyB7gk0xKk0Ma9WF4zXw=;
        h=From:Date:Subject:To:Cc:From;
        b=BhyaFGH9oJWYGWpxj3Un72GmW9J2nunWDOSM0e0x9mYwYC5OfYKU08eOy3CzojGYI
         DBKhwBSqLCUkVDFb8eQ2LOv8u7qhXEeIwScW5CimOXJURHvIwNERx7apC6IQpLQDRN
         qew3lZtb0DZSArQNGlrhQhFyV2BEtbzJYcBtFOKWufmQIc5BwAA2YFqsIpOXu44ycN
         CsGWioHf7HQiqmO1FxMfXxjmU2XqqTHZIWbM36OJjOlCE7pgxxBjc/xByaDh+gMmal
         gWgbjwbI2Rpo5VBvzliB9pQF290KKd3YsL4EDFAnNS1wlyRlgA0TMfRyIJ8EZGRGDc
         zX0yDq74Yi0IQ==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id u3so39121784vsh.6;
        Sun, 28 Jul 2019 08:11:32 -0700 (PDT)
X-Gm-Message-State: APjAAAWBBKLDPD39IHI9QoMuSfonpL75WK1xEvTdJTNPylhyHeT5W0JB
        VgYZX6xpSwc7yLwfUyFjbOBFeBdY20fsl3Z6noY=
X-Google-Smtp-Source: APXvYqweBwz+7NKA+W4uIIWC3GST2ggikIg5Xe4hc5QDD8r7Fsxcrk8Zt5mdqUdS+N3kEVa5fPrQSxm89k0hJrEgm8M=
X-Received: by 2002:a67:d46:: with SMTP id 67mr65669174vsn.181.1564326691833;
 Sun, 28 Jul 2019 08:11:31 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 00:10:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrjXdeMmptd0xRJwXexe_iJwJAUvEf0jQTaLkjWkaKfw@mail.gmail.com>
Message-ID: <CAK7LNATrjXdeMmptd0xRJwXexe_iJwJAUvEf0jQTaLkjWkaKfw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     masahiroy@kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks!


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3

for you to fetch changes up to b25e8a23d4ea7e8ade2c349c22efe88da88c0988:

  kbuild: remove unused single-used-m (2019-07-27 12:18:19 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3

 - add compile_commands.json to .gitignore

 - fix false-positive warning from gen_compile_commands.py after
   allnoconfig build

 - remove unused code

----------------------------------------------------------------
Masahiro Yamada (3):
      kbuild: remove unused objectify macro
      gen_compile_commands: lower the entry count threshold
      kbuild: remove unused single-used-m

Toru Komatsu (1):
      .gitignore: Add compilation database file

 .gitignore                      | 3 +++
 scripts/Kbuild.include          | 3 ---
 scripts/Makefile.lib            | 2 --
 scripts/gen_compile_commands.py | 4 ++--
 4 files changed, 5 insertions(+), 7 deletions(-)


-- 
Best Regards
Masahiro Yamada
