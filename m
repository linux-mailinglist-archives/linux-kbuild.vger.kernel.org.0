Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DD23AD5E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jun 2021 01:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhFRXcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Jun 2021 19:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbhFRXcw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jun 2021 19:32:52 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616AFC061760
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021 16:30:41 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id d7-20020ac811870000b02901e65f85117bso7991966qtj.18
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021 16:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=y0FcYdQ4+KG5bqQnhMUoT4g521uUABU2kMM30IGFQqQ=;
        b=SW5N62h7cVgnLw8sn5w9vwqcWBRPPNOtrLPwVXkkwehU/P/KI1k0v+xryMYEmvNcy7
         eMw36xbc1aj2sSJeMQHGZgrxcQ9RYBm3u20AqmA+6uDSt32RQAQnYcU+d6U3nC0czuC9
         YwbGbPjwt2FMq7fZNR0qZpKdkJVRW2bEIShhP5a6AxPQJNkMvIGn+po4SorZQM+vy2No
         syGYIVbxQfS+wI7cQsfflImJKZ36CzEYr2mghd13+LUS6F6K4zje94pul+gQYkXk8/xY
         XFLOEXPtaaiVCbbx2hX49XPYKtCPOVkU0HlmTFk7nsKts6eSL5g6qUXyR8j+NOdYhpny
         ToNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=y0FcYdQ4+KG5bqQnhMUoT4g521uUABU2kMM30IGFQqQ=;
        b=inL4Z/fw6v9SlEu/MVNECBS8pq30G01MRyl88PpG3+6AyxmFDKhoG2OqUSVoQ2e44C
         S/A0rGLfcWEUlYxnJdWgYSbSGVhDxHpvVISHnSrU94BvoacHfKyfCK1wo1nFAEkss3px
         X6KdAQy4J/TvLpbeSTw1n86olZ31ozwR1NUu27w/0WnBkl41v4X+66Q9LBGOqg9Cis8b
         p729jLIoY5ENqEq+8SvJenJU/YcULTDzjtbsHYCIm1aecvojxV6UdBdOn0SBjsB2iqDV
         K9UqT/qnwP1RNFLVexRrYOt2v7bO+PAKWsq6PkcqSiTF/dSfhqOxg2sSO0nk05zZbpfH
         LVlw==
X-Gm-Message-State: AOAM533zn9n5rBjGk3csUBDmU9MNX6MORhiOWl6H6guoaELkVKpFGr5q
        DQ7ZZ9aU3P5CQURZS4kdZMj0D/VX6B1WaWYti3E=
X-Google-Smtp-Source: ABdhPJwUcNJUliDdacWIjJcGJ4s/bKZDYhicKYKFrpo1l2tFI+YXdpDCrUpbHwLtvy9f8tnHVJilKWWWlhkTRWPiYrw=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7c41:e84c:8fcb:6664])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:f0d:: with SMTP id
 gw13mr8354593qvb.34.1624059040385; Fri, 18 Jun 2021 16:30:40 -0700 (PDT)
Date:   Fri, 18 Jun 2021 16:30:21 -0700
Message-Id: <20210618233023.1360185-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH 0/2] no_profile fn attr and Kconfig for GCOV+PGO
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When we say noinstr, we mean noinstr.  GCOV and PGO can both instrument
functions. Add a new function annotation __no_profile that expands to
__attribute__((__no_profile__)) and Kconfig value
CC_HAS_NO_PROFILE_FN_ATTR.

Base is
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/clang/pgo.

Nick Desaulniers (2):
  compiler_attributes.h: define __no_profile, add to noinstr
  Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO

 include/linux/compiler_attributes.h | 12 ++++++++++++
 include/linux/compiler_types.h      |  2 +-
 init/Kconfig                        |  3 +++
 kernel/gcov/Kconfig                 |  1 +
 kernel/pgo/Kconfig                  |  3 ++-
 5 files changed, 19 insertions(+), 2 deletions(-)


base-commit: 4356bc4c0425c81e204f561acf4dd0095544a6cb
-- 
2.32.0.288.g62a8d224e6-goog

