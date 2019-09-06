Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB447AB5F6
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2019 12:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391933AbfIFKcn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 06:32:43 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:33334 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391309AbfIFKcn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 06:32:43 -0400
Received: by mail-vk1-f202.google.com with SMTP id l63so2231267vkd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2019 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8mTCpyO6GtVGn/Ps6+YfPQEMp7IEqy8vOzxY6BbdH+Y=;
        b=Xo0+Y6BA2G+J+N9kamYfz7znY5qqnCZGsqBYnwS3L7RxYZYp6VtGcwHK7B5eA43xVw
         k75pVkEoGlL/m/bXKjMHp+7uVNHKXjmYKiRf9tmUY5DuO7Po3iVyqUW7SxulVGZ1YJTc
         /y2r6KVOp2IYMWVTtHPObIGg1uOb8UISTbDSUXHhIXL9hOyayWjdLHsyu01hZ83UieFa
         8Xloitc4h1EtB1OfgdHOe7vTG/q8ekW/BjVKnS81o4EXYLeVui12wFCl/rdFNNoUy4+u
         HI+Q3ZY490gb8G1xTdKe7RCl8gca/BvZsZQmeTrfxzuChawSssofuhr3ZyzVbzeNW9Q7
         l7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8mTCpyO6GtVGn/Ps6+YfPQEMp7IEqy8vOzxY6BbdH+Y=;
        b=fhsxo114KePtDhhJ1ih4MhW28bRKovd25JWtZp6M1/asClPlBw5qF27URuc1++7vB8
         dVzMTfqqx9c6EFVIFyw/Cs3S8Ftw5ht9OcYOAmcMNUoE95c4zoHExv97UJfevRrAhsAN
         by3jfJvxQquh8311agladfWo1e5u6lvt47V1FVh5CR3SAaw8nn0G2DhKUsb7Zngs2mey
         OBiDMSRJdR9j7V0odPqF9I7uP3YMXvyrmYc4gS5el2lXPnjaajVv96STaNdmajZqGiAi
         x/GbIrKCvTVmHl7LfnmQ16CrMufWLBgoMwnfrd2q94mUaGZKrPkJ1hxZYJQ6UeQOnnWN
         Xeew==
X-Gm-Message-State: APjAAAUTs+aLGOWCPV+ie0GaHVczNid99GecrmGmNyFF2V5c54sCQGpk
        k2Cdwpho407KdM/Ot5LpoFBrojf8t6soYA==
X-Google-Smtp-Source: APXvYqxARsKyt44afVzJWoyaykRNH6Uc8FaWV4+P5+5ptjA6+kqqcjIPq9saADISOIUKugvqXZwqmhfiof6eJQ==
X-Received: by 2002:a1f:9893:: with SMTP id a141mr3955150vke.75.1567765961937;
 Fri, 06 Sep 2019 03:32:41 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:24 +0100
In-Reply-To: <20180716122125.175792-1-maco@android.com>
Message-Id: <20190906103235.197072-1-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 00/11] Symbol Namespaces
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As of Linux 5.3-rc7, there are 31207 [1] exported symbols in the kernel.
That is a growth of roughly 1000 symbols since 4.17 (30206 [2]). There
seems to be some consensus amongst kernel devs that the export surface
is too large, and hard to reason about.

Generally, these symbols fall in one of these categories:
1) Symbols actually meant for drivers
2) Symbols that are only exported because functionality is split over
   multiple modules, yet they really shouldn't be used by modules outside
   of their own subsystem
3) Symbols really only meant for in-tree use

When module developers try to upstream their code, it regularly turns
out that they are using exported symbols that they really shouldn't be
using. This problem is even bigger for drivers that are currently
out-of-tree, which may be using many symbols that they shouldn't be
using, and that break when those symbols are removed or modified.

This patch allows subsystem maintainers to partition their exported
symbols into separate namespaces, and module authors to import such
namespaces only when needed.

This allows subsystem maintainers to more easily limit availability of
these namespaced symbols to other parts of the kernel. It can also be
used to partition the set of exported symbols for documentation
purposes; for example, a set of symbols that is really only used for
debugging could be in a "SUBSYSTEM_DEBUG" namespace.

I continued the work mainly done by Martijn Coenen.

Changes in v2:
- Rather than adding and evaluating separate sections __knsimport_NS,
  use modinfo tags to declare the namespaces a module introduces.
  Adjust modpost and the module loader accordingly.
- Also add support for reading multiple modinfo values for the same tag
  to allow list-like access to modinfo tags.
- The macros in export.h have been cleaned up to avoid redundancy in the
  macro parameters (ns, nspost, nspost2).
- The introduction of relative references in the ksymtab entries caused
  a rework of the macros to accommodate that configuration as well.
- Alignment of kernel_symbol in the ksymtab needed to be fixed to allow
  growing the kernel_symbol struct.
- Modpost does now also append the namespace suffix to the symbol
  entries in Module.symvers.
- The configuration option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS allows
  relaxing the enforcement of properly declared namespace imports at
  module loading time.
- Symbols can be collectively exported into a namespace by defining
  DEFAULT_SYMBOL_NAMESPACE in the corresponding Makefile.
- The requirement for a very recent coccinelle spatch has been lifted by
  simplifying the script.
- nsdeps does now ensures MODULE_IMPORT_NS statements are sorted when
  patching the module source files.
- Some minor bugs have been addressed in nsdeps to allow it to work with
  modules that have more than one source file.
- The RFC for the usb-storage symbols has been simplified by using
  DEFAULT_SYMBOL_NAMESPACE=USB_STORAGE rather than explicitly exporting
  each and every symbol into that new namespace.

Changes in v3:
- Reword the documentation for the
  MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS option for clarification.
- Fix printed required version of spatch in coccinelle script.
- Adopt kbuild changes for modpost: .mod files are no longer generated
  in .tmp_versions. Similarely, generate the .ns_deps files in the tree
  along with the .mod files. Also, nsdeps now uses modules.order as
  source for the list modules to consider.
- Add an RFC patch to introduce the namespace WATCHDOG_CORE for symbols
  exported in watchdog_core.c.

Changes in v4:
- scripts/nsdeps:
  - exit on first error
  - support out-of-tree builds O=...
- scripts/export_report.pl: update for new Module.symvers format
- scripts/mod/modpost: make the namespace a separate field when
  exporting to Module.symvers (rather than symbol.NS)
- include/linux/export.h: fixed style nits
- kernel/module.c: ensure namespaces are imported before taking a
  reference to the owner module
- Documentation: document the Symbol Namespace feature and update
  references to Module.symvers and EXPORT_SYMBOL*

Changes in v5:
- Makefile: let 'nsdeps' depend on 'modules' to allow
  `make clean; make nsdeps` to work
- scripts/nsdeps: drop 'exit on first error' again as it just makes more
  problems than it solves
- drop the watchdog RFC patch for now

This patch series was developed against v5.3-rc7.

[1] git grep "^EXPORT_SYMBOL\w*(" v5.3-rc7 | wc -l
[2] git grep "^EXPORT_SYMBOL\w*(" v4.17    | wc -l

Cc: arnd@arndb.de
Cc: gregkh@linuxfoundation.org
Cc: jeyu@kernel.org
Cc: joel@joelfernandes.org
Cc: lucas.de.marchi@gmail.com
Cc: maco@android.com
Cc: sspatil@google.com
Cc: will@kernel.org
Cc: yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org
Cc: linux-modules@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: usb-storage@lists.one-eyed-alien.net
Cc: kernel-team@android.com

Matthias Maennich (11):
  module: support reading multiple values per modinfo tag
  export: explicitly align struct kernel_symbol
  module: add support for symbol namespaces.
  modpost: add support for symbol namespaces
  module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
  export: allow definition default namespaces in Makefiles or sources
  modpost: add support for generating namespace dependencies
  scripts: Coccinelle script for namespace dependencies.
  docs: Add documentation for Symbol Namespaces
  usb-storage: remove single-use define for debugging
  usb-storage: export symbols in USB_STORAGE namespace

 .gitignore                                  |   1 +
 Documentation/kbuild/modules.rst            |   7 +-
 Documentation/kbuild/namespaces.rst         | 154 ++++++++++++++++++++
 Documentation/kernel-hacking/hacking.rst    |  18 +++
 MAINTAINERS                                 |   5 +
 Makefile                                    |  14 +-
 arch/m68k/include/asm/export.h              |   1 -
 drivers/usb/storage/Makefile                |   2 +
 drivers/usb/storage/alauda.c                |   1 +
 drivers/usb/storage/cypress_atacb.c         |   1 +
 drivers/usb/storage/datafab.c               |   1 +
 drivers/usb/storage/debug.h                 |   2 -
 drivers/usb/storage/ene_ub6250.c            |   1 +
 drivers/usb/storage/freecom.c               |   1 +
 drivers/usb/storage/isd200.c                |   1 +
 drivers/usb/storage/jumpshot.c              |   1 +
 drivers/usb/storage/karma.c                 |   1 +
 drivers/usb/storage/onetouch.c              |   1 +
 drivers/usb/storage/realtek_cr.c            |   1 +
 drivers/usb/storage/scsiglue.c              |   2 +-
 drivers/usb/storage/sddr09.c                |   1 +
 drivers/usb/storage/sddr55.c                |   1 +
 drivers/usb/storage/shuttle_usbat.c         |   1 +
 drivers/usb/storage/uas.c                   |   1 +
 include/asm-generic/export.h                |  14 +-
 include/linux/export.h                      |  98 +++++++++++--
 include/linux/module.h                      |   2 +
 init/Kconfig                                |  13 ++
 kernel/module.c                             |  67 ++++++++-
 scripts/Makefile.modpost                    |   4 +-
 scripts/coccinelle/misc/add_namespace.cocci |  23 +++
 scripts/export_report.pl                    |   2 +-
 scripts/mod/modpost.c                       | 150 ++++++++++++++++---
 scripts/mod/modpost.h                       |   9 ++
 scripts/nsdeps                              |  58 ++++++++
 35 files changed, 608 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/kbuild/namespaces.rst
 create mode 100644 scripts/coccinelle/misc/add_namespace.cocci
 create mode 100644 scripts/nsdeps

-- 
2.23.0.187.g17f5b7556c-goog

