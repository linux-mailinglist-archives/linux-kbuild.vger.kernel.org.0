Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87337155D5B
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 19:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgBGSH7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 13:07:59 -0500
Received: from mail-vs1-f74.google.com ([209.85.217.74]:49869 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgBGSH7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:07:59 -0500
Received: by mail-vs1-f74.google.com with SMTP id f26so17078vsa.16
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2020 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=mSGi1BVNlmditJM4fRm+rDENjQW+HhkSF8B3glFVnpg=;
        b=Y91L1uXTf2awXQO+uBVdXHZU8HCUNdIQsjzQiuvYNcqr/Qg08ny8VJf+mhsL5QlXQO
         8try15JSIXJiOSsR7EFMxnWN9X+orC1q09te8w78JzpzdLmfu53irZiF03QwEcfSvvBb
         UObLSjrTYF1feRZ89t4RTW2Vqfdgfw91TsWlrZglEmUrYDL+dAUz5TZCypq84K+WbjaL
         enMmP8OUSN3JKM96OObunWgzoESB1J6/x5MlBOR1NPZnsLA9NHrGhkg/34+0C14mGslt
         H6NQdWosuVmvxS35YeCmHk3dg+ezw7h52YNHk4nrHimsUKABwI4o1gR4H/m7NiyvsCvV
         qRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=mSGi1BVNlmditJM4fRm+rDENjQW+HhkSF8B3glFVnpg=;
        b=TQUC6X7s4Tw38Ywu6KwMNRA/QbFBv+xGuyo5kRa+jYWdeJz81gzjxKNRP8bXXvaGCz
         ryDGBgm1ipgc5m2AXFR8Eznq8jnLgHDVcqceiguzRGwh9u+PDcllGQCh2r0qpkxG83JP
         kHknjF/2cg2cwIHpHC/FZeibA73u7UiOmMLxS4fTRrc9rZbx2Fp/UBLDJYAQqms97Nkb
         OQ6SJuE6o/AcNkEIk8h6yrEJ/Z9b4gb++m6nHiALkRJLZShe4wSOycz/2RcBknTQdTWi
         XGbPpMhLet/LUzLXEWEA7JhkXfnqR3QUxu/e2AJRSfDtgshYWTkMpoY8jrt2qbNX2y3y
         L5gA==
X-Gm-Message-State: APjAAAX3PikdC9PFsjmG9TCAVCgH91MLLNqT+N/8ADkm+6tAVj+u1/Yn
        BNxSw5GljcA2ozUemqyGLwdB0q02oH5O
X-Google-Smtp-Source: APXvYqziKEBW3W5mmaFfdbidi6/kSXkrtep5KXxVSIyrpuAILMZF8PBOLP6pqbApOFLsps39N7pkfSEcWx4a
X-Received: by 2002:a1f:2753:: with SMTP id n80mr265425vkn.24.1581098878430;
 Fri, 07 Feb 2020 10:07:58 -0800 (PST)
Date:   Fri,  7 Feb 2020 18:07:52 +0000
Message-Id: <20200207180755.100561-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v3 0/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYM
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current norm on Android and many other systems is for vendors to
introduce significant changes to their downstream kernels, and to
contribute very little (if any) code back upstream. The Generic Kernel
Image (GKI) project in Android attempts to improve the status-quo by
having a unique kernel for all android devices of the same architecture,
regardless of the SoC vendor. The key idea is to make all interested
parties agree on a common solution, and contribute their code upstream
to make it available to use by the wider community.

The kernel-to-drivers ABI on Android devices varies significantly from
one vendor kernel to another today because of changes to exported
symbols, dependencies on vendor symbols, and surely other things. The
first step for GKI is to try and put some order into this by agreeing on
one version of the ABI that works for everybody.

For practical reasons, we need to reduce the ABI surface to a subset of
the exported symbols, simply to make the problem realistically solvable,
but there is currently no upstream support for this use-case.

As such, this series attempts to improve the situation by enabling users
to specify a symbol 'whitelist' at compile time. Any symbol specified in
this whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is
set, even if it has no in-tree user. The whitelist is defined as a
simple text file, listing symbols, one per line.

v2 -> v3:
 - added a cover letter to explain why this is in fact an attempt to
   help usptream in the long term (Christoph)
 - made path relative to the kernel source tree (Matthias)
 - made the Kconfig help text less confusing (Jessica)
 - added patch 02 and 03 to optimize build time when a whitelist is
   provided

v2:
 - make sure to quote the whitelist path properly (Nicolas)

Quentin Perret (3):
  kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
  kbuild: split adjust_autoksyms.sh in two parts
  kbuild: generate autoksyms.h early

 Makefile                    |  2 +-
 init/Kconfig                | 13 +++++++++++
 scripts/adjust_autoksyms.sh | 27 ++++------------------
 scripts/gen_autoksyms.sh    | 45 +++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 24 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

-- 
2.25.0.341.g760bfbb309-goog

