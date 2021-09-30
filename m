Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A857E41E3D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344560AbhI3W2w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343578AbhI3W2v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:51 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC02C06176C
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id n18so7597389pgm.12
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36j5L3IXWBXJSa10uMT5uD6s/Y5u7bDApoWqfRj3glw=;
        b=jdF4+GGFPTaheVbue765+UfgFhpqgRf4n2s6bFx1BdfagCMTvVJMI5rPIAsyJxBIUp
         /wGNVS5PAsmda7VGWicIS0lb7cjah8fETmzwWJksUMDbKsbCYNLWuZdJZ40Usk5gnrrU
         +C63RBPWlPJP62rZ6V8t/R4q8cigpMX4rIgYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36j5L3IXWBXJSa10uMT5uD6s/Y5u7bDApoWqfRj3glw=;
        b=KjGnF4/xSnUCQYv5Ruig5uWm4mMAtA15p8SQO12fOTqv/Bax4VPu5ofUbHGGHerORq
         gfQHiRjQ9xj8LZhHVNzv7WuTEFQzHTySrkGF5+4pLl7BvpVUpy4eFbCiaMM9RgpSQLlg
         bI0T1rZsnr09xZaPALX6zXWyaxLTXaHnwJP5H0Wp8AyxYN81RN+9wcxvMQSG66cF4zn1
         Weq0diDqTkyODnNegegl4WdADPaWIYUeNAv5VDyN0EFCrLX2b0JX1xbnTkMOZRadFs05
         gky4me3TpXHx34feaWExEcAKIfb3Ack0E+EZkaCpiWV4NuY3V7ac2jcPTtvPsVo0jpuz
         UkBw==
X-Gm-Message-State: AOAM531ftHk/lzAnNWy7y6x+h7P9bstrJK05d1PuWHfnXnCOtwhzZLAC
        rXDAhtAVQdFYKf9eNSbCINaMfA==
X-Google-Smtp-Source: ABdhPJzwvdcLzYPcnUhMbdaXUYsbzCJISTZjEr818vMUHCmvn0wRC/EuUIDTvv2mbQ0uruyIeNqBeA==
X-Received: by 2002:a63:1104:: with SMTP id g4mr6808034pgl.403.1633040828353;
        Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w14sm4014005pge.40.2021.09.30.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:07 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 0/8] Add __alloc_size()
Date:   Thu, 30 Sep 2021 15:26:56 -0700
Message-Id: <20210930222704.2631604-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; h=from:subject; bh=I3VSaYm9ezb7bHImNRkPHiAlz1ym/3eSqmSHHw7PzPc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm2trNkLaQC+FMTfijdk1cGylQunUf+UbapBw2l aTY8uFmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5tgAKCRCJcvTf3G3AJqQFD/ 9YSlk3PdAdtRBkTdXkwP8owLGfO+VnOq9vtRzRbsuSKa7C8/IvCCNxD16nC3XgUP+A3X9DeEeZpxtN KQQXav7b2c9MVVtP9HKO6AeJzfz0IEGECZ9KI+Om3wXz+qsFv+fZCWl4UmNQKT1vr+SDRyEINCKxGZ ExiIpojTRrbldN7lLHazXnka1vOiJ8O1zA8zi8fjhL2Lb+oj2/7/HUXzK7cOKdG/+FQ2ku14z+hnVT Fn3ErgRyIZxOuaCPtryDdLV7nNoSmxT9f9UFP2uWIZ5SU6gPOfEI7frcGyIm/IlMXNcdTBMhNK8UhY 65VQezKn/Uk3bD4JOquuWhail4ChaSiWz/h/rY5VbegnJrC66iy96m6zTOmFqmPpYjCsVCR2VFUWuf FrYMjVOEO36ewYrtLO1ZjP6c9/AahG4Z6Nq75Or9T9JLHKcvSP06DtEC4H/aApy80DQqKojn/TJSTV wuVss9nAR6pZniVZ32+7TIfb9VbNbz1q4KGxkgFn46pkNlb8s0h9x0X7mjw6QgnnSkvocacbtiOvx0 SQisQwgvoDLZYG9YIvVpGJxy8TeyCBmt6LLM0ecQmxk+H5Q6PwgQAH6s6Eg5ofM+TMmgIJwHsdN82F OuoVLbrzAV/9M48u+Nw5VdALC6BZmelf+t3IXv0xggKtQwplVG9fyn3dmBsQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Andrew,

This is a refresh of the __alloc_size series you have in -mm
currently. This addresses the issues[1] Linus had with attribute
location and the redundant use of __malloc. These are meant to replace
the following patches:

compiler-attributes-add-__alloc_size-for-better-bounds-checking.patch
compiler-attributes-add-__alloc_size-for-better-bounds-checking-fix.patch
checkpatch-add-__alloc_size-to-known-attribute.patch
slab-clean-up-function-declarations.patch
slab-add-__alloc_size-attributes-for-better-bounds-checking.patch
mm-page_alloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
percpu-add-__alloc_size-attributes-for-better-bounds-checking.patch
mm-vmalloc-add-__alloc_size-attributes-for-better-bounds-checking.patch
rapidio-avoid-bogus-__alloc_size-warning.patch

Thanks!

-Kees

[1] https://lore.kernel.org/mm-commits/CAHk-=wgfbSyW6QYd5rmhSHRoOQ=ZvV+jLn1U8U4nBDgBuaOAjQ@mail.gmail.com/

v3:
- move attribute logic around to better handle GCC's weird behavior
- merge __malloc into the __alloc_size macro (Linus)
- refactor attribute positions (Linus)
v2: https://lore.kernel.org/lkml/20210818214021.2476230-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20210818050841.2226600-1-keescook@chromium.org

Original cover letter:

GCC and Clang both use the "alloc_size" attribute to assist with bounds
checking around the use of allocation functions. Add the attribute,
adjust the Makefile to silence needless warnings, and add the hints to
the allocators where possible. These changes have been in use for a
while now in GrapheneOS.

Kees Cook (8):
  rapidio: Avoid bogus __alloc_size warning
  Compiler Attributes: add __alloc_size() for better bounds checking
  slab: Clean up function prototypes
  slab: Add __alloc_size attributes for better bounds checking
  mm/kvmalloc: Add __alloc_size attributes for better bounds checking
  mm/vmalloc: Add __alloc_size attributes for better bounds checking
  mm/page_alloc: Add __alloc_size attributes for better bounds checking
  percpu: Add __alloc_size attributes for better bounds checking

 Makefile                                 | 15 ++++
 drivers/rapidio/devices/rio_mport_cdev.c |  9 ++-
 include/linux/compiler-gcc.h             |  8 ++
 include/linux/compiler_attributes.h      | 10 +++
 include/linux/compiler_types.h           | 12 +++
 include/linux/gfp.h                      |  4 +-
 include/linux/mm.h                       | 16 ++--
 include/linux/percpu.h                   |  6 +-
 include/linux/slab.h                     | 99 +++++++++++++-----------
 include/linux/vmalloc.h                  | 22 +++---
 scripts/checkpatch.pl                    |  3 +-
 11 files changed, 128 insertions(+), 76 deletions(-)

-- 
2.30.2

