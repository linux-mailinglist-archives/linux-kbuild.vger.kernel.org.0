Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D68F3F0D80
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhHRVlO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbhHRVlN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:13 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DD3C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:38 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id f3so2702028plg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akAmUlIHVyMCnIAEIuPla2RgaGumEDghjwfRk7fePO8=;
        b=a8rtLFTutCVX8kAVFQBoCFVIFF3XhbHoHk315ZS95VwdPVZZOWozYUV6xXg1LFhzmR
         b97DOY2X4uTQmBQ0MoV3QYP9jiCOqetKVeS7PzpRs7el0f/9EWLG13/qyjRg3eYOrqle
         PHl8LB4eQdIb4RU1oDqKh+w1JuI0NlIdvBCg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akAmUlIHVyMCnIAEIuPla2RgaGumEDghjwfRk7fePO8=;
        b=jZPluTqY8mUgyod8RemgDlghsxZivKAKDudGjgSB47BuBqumYY4L1QcCaxSMxch9M6
         Nlmu1o20FaIw8zb8WQuMwae43vpUrYPcFIieSgY/XmzUql7rMcYb8+Z7XuJrC0oUEVIS
         jOJRKXDjA8Px0fy41szjjenlfkxXli8i3u6KzdXsNBgjpPJA+FmZZLVFXw6XhQ4gCGB8
         tcWQeYNQLHtW/vwIwhOJRUyXYeRrfMiktTBbNEj+ZtJFKiHXhozOoRLJ9MAwdOgA26tb
         GFk4om5Oi+smpwJNInSFGYbL6ZoRyBpdtC7E7s2XGHl87Gj31mTNp5WpdLvkR5HEte8K
         gNNg==
X-Gm-Message-State: AOAM531WmTAF0FAVlCMv8rNRQpWMyTg2TZMZaiJdOkBglhBIkevlr6/q
        lrdaWMJh60H1d/i1ejVSIr0I9A==
X-Google-Smtp-Source: ABdhPJxlfTcGT5J/BnXQskI5QEMAEBFE/p6siy3ePLuxLeCum7fhGWFhGAhEGkJ746Sknz1WraR08Q==
X-Received: by 2002:a17:90a:c7cc:: with SMTP id gf12mr11236442pjb.152.1629322837839;
        Wed, 18 Aug 2021 14:40:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u16sm833047pgh.53.2021.08.18.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
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
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/7] Add __alloc_size() for better bounds checking
Date:   Wed, 18 Aug 2021 14:40:14 -0700
Message-Id: <20210818214021.2476230-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; h=from:subject; bh=rsMgLXm/8j8zp3cC9QOAG2syHyng6bO/WmNVEexJxdo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5CJ/SlNYpWE0Ykxq+PzeUKRG1gC/093Z7fxOqZ wEYXCCiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+QgAKCRCJcvTf3G3AJo3AEA CRpUXhzKUXa83bU08HMYk8w3CI0lPzuD6WVd7f8zuaswtTFfH/Hhf0jvPMTmoC6K5Pd8AE87/wBmUH movYpOXkti6rw/ORur3peVR7FtzjxTcbY+KfjktIU9xbLcdj1GyKNr/ZnXqH4tiGuIYzl7+QIgC1pl Z26pG54aUxZVwgdaBgr3YBwyn9zwNcNlth7UdxDilgHrFB6xeEGdbCwSirgpnboJrVjpve3lDgwjH4 Q6zPPWan82zmnP0HbY/T6brScwp5MpHW3UhTzdcfUfBNxmjfhIQHAhoVcXGlJUyBbHnrINSOv75H3y 6F0wiCpckheLpTgrio85Ydq4S0Et/JtOpejeclbEYhrqe/2D6urk8FEqBKHf7rC7uFlINsuc8z11PS S6WF29dvRToPp4kvE45ge5eIdj24peW4NzGhCGDXPhraGd8tFxLV4F9Vq8g4F2UdbnqkGhN6HNs5OG Te+aSJseJhr+FaAANM8fvXBQzTjM4RGQeFtDwvcWU2zPq5bx3bJCaNTOHnyjGZ/KNS0rxGw8JeqBHF CO8EYPvzIhHVVUT0lebK+o9O0vanvKwUKcy1h1eR8DRx4bK7g8c91Hm59872I8zDPjw1ovaybRAzrv 7Nul/uQgIzzglOXzFM5EZix4zg1+ua3rV5n79ekbMFaagG9uz9kIWkTK2sGA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

GCC and Clang both use the "alloc_size" attribute to assist with bounds
checking around the use of allocation functions. Add the attribute,
adjust the Makefile to silence needless warnings, and add the hints to
the allocators where possible. These changes have been in use for a
while now in GrapheneOS.

To build without warnings, this series needs a couple small fixes for
allmodconfig, which I sent separately:
https://lore.kernel.org/lkml/20210818174855.2307828-5-keescook@chromium.org/
https://lore.kernel.org/lkml/20210818044252.1533634-1-keescook@chromium.org/
https://lore.kernel.org/lkml/20210818043912.1466447-1-keescook@chromium.org/

I figure I can take this via my "overflow" series, or it could go via
-mm?

-Kees

v2:
- clean up slab function declarations (joe)
- update checkpatch.pl attribute regex (joe)
- explain the Makefile changes better (ojeda, nathan)
v1: https://lore.kernel.org/lkml/20210818050841.2226600-1-keescook@chromium.org

Kees Cook (7):
  Compiler Attributes: Add __alloc_size() for better bounds checking
  checkpatch: Add __alloc_size() to known $Attribute
  slab: Clean up function declarations
  slab: Add __alloc_size attributes for better bounds checking
  mm/page_alloc: Add __alloc_size attributes for better bounds checking
  percpu: Add __alloc_size attributes for better bounds checking
  mm/vmalloc: Add __alloc_size attributes for better bounds checking

 Makefile                            |  6 ++-
 include/linux/compiler_attributes.h |  6 +++
 include/linux/gfp.h                 |  2 +
 include/linux/percpu.h              |  3 ++
 include/linux/slab.h                | 84 +++++++++++++++++------------
 include/linux/vmalloc.h             | 11 ++++
 scripts/checkpatch.pl               |  3 +-
 7 files changed, 80 insertions(+), 35 deletions(-)

-- 
2.30.2

