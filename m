Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C055162396
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 10:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgBRJlo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 04:41:44 -0500
Received: from mail-wr1-f74.google.com ([209.85.221.74]:53231 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgBRJlo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 04:41:44 -0500
Received: by mail-wr1-f74.google.com with SMTP id a12so10513903wrn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 01:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=QNDLs7l5J8RmAhjpuRmr0/PxcwWDOhEmr8wUXVMCS2g=;
        b=lANL6p2mxZ67NSBsDtLRBYxP1dnT4hLBAedhNx7ZmTLwbVjaSwPc6ETlhgNtHB/jzu
         gHp15hKseyftrJCbIZVDUudAMcQ216VYl5pV1ZopaXZnugurtnzgIBjyFG0DTLT6HXEf
         5B+8C4QFBEZYRaWl/4hp+j7DRzUVdRjoqXHHtO/CcYkjlP6ClzR+Z/o5nRanCJJU8LV5
         MifU7kIk+0YYfMFsNPgp+iQHgl229wu6nrD21G44TYiBVe46j7litx2KvF4jE36nfzko
         I+vjI826KsmfZUaXQveeJ0wUldepShLPUDQ72OfZvFtVmY74bMDe1E0LNyJQsg6sygFk
         V3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=QNDLs7l5J8RmAhjpuRmr0/PxcwWDOhEmr8wUXVMCS2g=;
        b=MWTgtWyVVQWkAM7skIFqG+6VZQxrx9c90L+ee0Y2DbbBrK7jQx6BknQ0DOQ9b6FoGI
         4V70yXgOEWGR67uFtU0umh0v7uCYd54jqM8OCL6SvrYKVZCncImXwlQutdFhQI3MMHnX
         ZQGKB+vcam1iTQqaxXl6DsIIU5CMYFlMhDQKEKJ+qSXFrMQSpyYxs4SuKj4xYU9VXHhb
         CoOmDoz72LdM2/YqNIvyDvcZVP4uNqC92YTcfxPY1bkjTFl7otQGwfnaFrBjBhPXAnZb
         jf5OyDqn++kZV6GuR3xswmAJKVZ7lNMEZyiSGVRi6nHFbwIXXf929JNvq+Da6pYqKpca
         9+WA==
X-Gm-Message-State: APjAAAURuqC2H3dtwotUpHx4bqLJkWEYxM9xO7vYEfbzCqF4xUD8yFCO
        +4k0681SAcpwEqwNiHVBY6z9ShEJrJEN
X-Google-Smtp-Source: APXvYqzWf2YA23J1Glf8VxU8Do8ukZPloJr+JQccpQyyqafNEHRr0VlS6DnEGn/nGNBIEFKw6C+etcmhXXLV
X-Received: by 2002:a5d:5485:: with SMTP id h5mr23613735wrv.346.1582018902233;
 Tue, 18 Feb 2020 01:41:42 -0800 (PST)
Date:   Tue, 18 Feb 2020 09:41:36 +0000
Message-Id: <20200218094139.78835-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v5 0/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYM
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

v5:
 - made sure to be POSIX-compliant (+ tested with dash and posh)
 - added failure path if the whitelist path is incorrect (Matthias,
   Nicolas)
 - collected Acked-By (and other) tags from Nicolas and Matthias

v4:
 - removed [[]] bash-specific pattern from the scripts (Nicolas)
 - use $CONFIG_SHELL consistently in all patches (Masahiro)
 - added shortlog for initial generation of autoksyms.h (Masahiro)
 - added comment on how 'eval' expands the whitelist path (Masahiro)

v3:
 - added a cover letter to explain why this is in fact an attempt to
   help upstream in the long term (Christoph)
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

 Makefile                    |  7 +++--
 init/Kconfig                | 13 ++++++++++
 scripts/adjust_autoksyms.sh | 24 +++--------------
 scripts/gen_autoksyms.sh    | 52 +++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+), 22 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

-- 
2.25.0.265.gbab2e86ba0-goog

