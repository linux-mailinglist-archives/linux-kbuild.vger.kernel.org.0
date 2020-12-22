Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68292E0D89
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 17:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgLVQrc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 11:47:32 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17960 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgLVQrc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 11:47:32 -0500
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0BMGkasq008959;
        Wed, 23 Dec 2020 01:46:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BMGkasq008959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608655597;
        bh=0oHZflXikTVfZqfjjMzGVPuKahq7qPNWw/BAp7aDM1U=;
        h=From:Date:Subject:To:Cc:From;
        b=cZ6yGo6NiAkJcbwZeRUdTsqPXcri1O76bFrQgzZBO/UDnc8OBvEgGQ6BYTUpaShLE
         psOhSRp3BHrLl5XQ+GYut8n7xqTePyd4m9cF9NcAIiNTeKUkr3cpSBOKmNfGGxHVk0
         6ZhRiXTyIlcrr5xd5Rruf04u7Fur80vjAcKVwXQ0ztz0EKvmp3qfBkGNkOuXUc927y
         mSsciqm49EQEkkGz0TFMJSfSpJoiBjQAnkl9CjCY2JNPA48CqWuZRA1SkXeB2l1E+W
         2Nl4/zrc5vSI1Bb+liho4VWt7elLDBPymjeeicM6A7PSYnUosJ/q1XQPTHvm9zV1xI
         vA1IWpzOoEtPA==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id b5so1668371pjl.0;
        Tue, 22 Dec 2020 08:46:37 -0800 (PST)
X-Gm-Message-State: AOAM533/lrDglodud8BP1QwfAps1LEFrZGCs7k8oxXs6+djmaLWjDf37
        nesopAqxdYlTABEhf8Gs+Ho7e6AzW7mSnIft1i0=
X-Google-Smtp-Source: ABdhPJwBVG4Ro77UIE4LDFpRfLBRClp1hchwik6A1P0uFZiXq5bagaru6vFYrJ3+phtpZ2I+P4kvienSq7psmD4HZhU=
X-Received: by 2002:a17:902:521:b029:dc:2836:ec17 with SMTP id
 30-20020a1709020521b02900dc2836ec17mr21726998plf.47.1608655596261; Tue, 22
 Dec 2020 08:46:36 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 01:45:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbWcXRFd55DkUVrcr9Z2yjUOV-3qnkjrjr3VOC5JDOXA@mail.gmail.com>
Message-ID: <CAK7LNAQbWcXRFd55DkUVrcr9Z2yjUOV-3qnkjrjr3VOC5JDOXA@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.11-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.11

Thanks.


The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.11

for you to fetch changes up to 18084e435ff6e47197542db6bab98bafaa4c7b68:

  Documentation/kbuild: Document platform dependency practises
(2020-12-21 13:57:08 +0900)

----------------------------------------------------------------
Kbuild updates for v5.11

 - Use /usr/bin/env for shebang lines in scripts

 - Remove useless -Wnested-externs warning flag

 - Update documents

 - Refactor log handling in modpost

 - Stop building modules without MODULE_LICENSE() tag

 - Make the insane combination of 'static' and EXPORT_SYMBOL an error

 - Improve genksyms to handle _Static_assert()

----------------------------------------------------------------
Arnd Bergmann (1):
      Makefile.extrawarn: remove -Wnested-externs warning

Dominique Martinet (1):
      kbuild: don't hardcode depmod path

Finn Behrens (1):
      tweewide: Fix most Shebang lines

Geert Uytterhoeven (2):
      Documentation/kbuild: Document COMPILE_TEST dependencies
      Documentation/kbuild: Document platform dependency practises

Marco Elver (1):
      genksyms: Ignore module scoped _Static_assert()

Masahiro Yamada (12):
      kbuild: doc: update the description about kbuild Makefiles
      kbuild: doc: replace arch/$(ARCH)/ with arch/$(SRCARCH)/
      kbuild: doc: fix 'List directories to visit when descending' section
      kbuild: doc: merge 'Special Rules' and 'Custom kbuild commands' sections
      kbuild: doc: split if_changed explanation to a separate section
      kbuild: doc: clarify the difference between extra-y and always-y
      kbuild: doc: document subdir-y syntax
      modpost: rename merror() to error()
      modpost: refactor error handling and clarify error/fatal difference
      modpost: turn missing MODULE_LICENSE() into error
      modpost: change license incompatibility to error() from fatal()
      modpost: turn section mismatches to error from fatal()

Quentin Perret (1):
      modpost: turn static exports into error

 Documentation/kbuild/kconfig-language.rst         |  35 ++
 Documentation/kbuild/makefiles.rst                | 365 +++++++++++---------
 Documentation/kbuild/modules.rst                  |   2 +-
 Documentation/sphinx/parse-headers.pl             |   2 +-
 Documentation/target/tcm_mod_builder.py           |   2 +-
 Documentation/trace/postprocess/decode_msr.py     |   2 +-
 .../postprocess/trace-pagealloc-postprocess.pl    |   2 +-
 .../trace/postprocess/trace-vmscan-postprocess.pl |   2 +-
 Makefile                                          |   2 +-
 arch/ia64/scripts/unwcheck.py                     |   2 +-
 scripts/Makefile.extrawarn                        |   1 -
 scripts/bloat-o-meter                             |   2 +-
 scripts/config                                    |   2 +-
 scripts/diffconfig                                |   2 +-
 scripts/genksyms/keywords.c                       |   3 +
 scripts/genksyms/lex.l                            |  27 +-
 scripts/genksyms/parse.y                          |   7 +
 scripts/get_abi.pl                                |   2 +-
 scripts/mod/modpost.c                             |  73 ++--
 scripts/mod/modpost.h                             |  15 +-
 scripts/show_delta                                |   2 +-
 scripts/sphinx-pre-install                        |   2 +-
 scripts/split-man.pl                              |   2 +-
 scripts/tracing/draw_functrace.py                 |   2 +-
 tools/perf/python/tracepoint.py                   |   2 +-
 tools/perf/python/twatch.py                       |   2 +-
 .../intel_pstate_tracer/intel_pstate_tracer.py    |   2 +-
 tools/testing/ktest/compare-ktest-sample.pl       |   2 +-
 tools/testing/kunit/kunit.py                      |   2 +-
 tools/testing/kunit/kunit_tool_test.py            |   2 +-
 tools/testing/selftests/bpf/test_offload.py       |   2 +-
 .../net/mlxsw/sharedbuffer_configuration.py       |   2 +-
 tools/testing/selftests/kselftest/prefix.pl       |   2 +-
 tools/testing/selftests/net/devlink_port_split.py |   2 +-
 tools/testing/selftests/tc-testing/tdc_batch.py   |   2 +-
 .../selftests/tc-testing/tdc_multibatch.py        |   2 +-
 36 files changed, 353 insertions(+), 229 deletions(-)


-- 
Best Regards
Masahiro Yamada
