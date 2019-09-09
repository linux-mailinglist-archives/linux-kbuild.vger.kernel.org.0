Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65CAD4ED
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 10:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfIIIfd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 04:35:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:38430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbfIIIfd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 04:35:33 -0400
Received: from linux-8ccs (ip5f5ade63.dynamic.kabel-deutschland.de [95.90.222.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2587E218AC;
        Mon,  9 Sep 2019 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568018132;
        bh=TKImRVK5QfysGcK3+T8jXTqGg/4D94n2fS1rumyJj0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TZcrEX8XikzlQDoHKc05y09WwC1EXW/eLqgiewIXoctMEF4T5kTG+SBZVvKmLSF4S
         VceMDdm8DVu4k7r3KZcFC8odfFvXsgJyf0H+NA5s+jqm3ludZY4Ui/3lgYzsPbcv/q
         zs77u5TDjehKhBneE5glLjJcM7UFKodd8kLRkcxQ=
Date:   Mon, 9 Sep 2019 10:35:23 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, joel@joelfernandes.org,
        lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com,
        will@kernel.org, yamada.masahiro@socionext.com,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v5 00/11] Symbol Namespaces
Message-ID: <20190909083522.GA446@linux-8ccs>
References: <20180716122125.175792-1-maco@android.com>
 <20190906103235.197072-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Matthias Maennich [06/09/19 11:32 +0100]:
>As of Linux 5.3-rc7, there are 31207 [1] exported symbols in the kernel.
>That is a growth of roughly 1000 symbols since 4.17 (30206 [2]). There
>seems to be some consensus amongst kernel devs that the export surface
>is too large, and hard to reason about.
>
>Generally, these symbols fall in one of these categories:
>1) Symbols actually meant for drivers
>2) Symbols that are only exported because functionality is split over
>   multiple modules, yet they really shouldn't be used by modules outside
>   of their own subsystem
>3) Symbols really only meant for in-tree use
>
>When module developers try to upstream their code, it regularly turns
>out that they are using exported symbols that they really shouldn't be
>using. This problem is even bigger for drivers that are currently
>out-of-tree, which may be using many symbols that they shouldn't be
>using, and that break when those symbols are removed or modified.
>
>This patch allows subsystem maintainers to partition their exported
>symbols into separate namespaces, and module authors to import such
>namespaces only when needed.
>
>This allows subsystem maintainers to more easily limit availability of
>these namespaced symbols to other parts of the kernel. It can also be
>used to partition the set of exported symbols for documentation
>purposes; for example, a set of symbols that is really only used for
>debugging could be in a "SUBSYSTEM_DEBUG" namespace.
>
>I continued the work mainly done by Martijn Coenen.
>
>Changes in v2:
>- Rather than adding and evaluating separate sections __knsimport_NS,
>  use modinfo tags to declare the namespaces a module introduces.
>  Adjust modpost and the module loader accordingly.
>- Also add support for reading multiple modinfo values for the same tag
>  to allow list-like access to modinfo tags.
>- The macros in export.h have been cleaned up to avoid redundancy in the
>  macro parameters (ns, nspost, nspost2).
>- The introduction of relative references in the ksymtab entries caused
>  a rework of the macros to accommodate that configuration as well.
>- Alignment of kernel_symbol in the ksymtab needed to be fixed to allow
>  growing the kernel_symbol struct.
>- Modpost does now also append the namespace suffix to the symbol
>  entries in Module.symvers.
>- The configuration option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS allows
>  relaxing the enforcement of properly declared namespace imports at
>  module loading time.
>- Symbols can be collectively exported into a namespace by defining
>  DEFAULT_SYMBOL_NAMESPACE in the corresponding Makefile.
>- The requirement for a very recent coccinelle spatch has been lifted by
>  simplifying the script.
>- nsdeps does now ensures MODULE_IMPORT_NS statements are sorted when
>  patching the module source files.
>- Some minor bugs have been addressed in nsdeps to allow it to work with
>  modules that have more than one source file.
>- The RFC for the usb-storage symbols has been simplified by using
>  DEFAULT_SYMBOL_NAMESPACE=USB_STORAGE rather than explicitly exporting
>  each and every symbol into that new namespace.
>
>Changes in v3:
>- Reword the documentation for the
>  MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS option for clarification.
>- Fix printed required version of spatch in coccinelle script.
>- Adopt kbuild changes for modpost: .mod files are no longer generated
>  in .tmp_versions. Similarely, generate the .ns_deps files in the tree
>  along with the .mod files. Also, nsdeps now uses modules.order as
>  source for the list modules to consider.
>- Add an RFC patch to introduce the namespace WATCHDOG_CORE for symbols
>  exported in watchdog_core.c.
>
>Changes in v4:
>- scripts/nsdeps:
>  - exit on first error
>  - support out-of-tree builds O=...
>- scripts/export_report.pl: update for new Module.symvers format
>- scripts/mod/modpost: make the namespace a separate field when
>  exporting to Module.symvers (rather than symbol.NS)
>- include/linux/export.h: fixed style nits
>- kernel/module.c: ensure namespaces are imported before taking a
>  reference to the owner module
>- Documentation: document the Symbol Namespace feature and update
>  references to Module.symvers and EXPORT_SYMBOL*
>
>Changes in v5:
>- Makefile: let 'nsdeps' depend on 'modules' to allow
>  `make clean; make nsdeps` to work
>- scripts/nsdeps: drop 'exit on first error' again as it just makes more
>  problems than it solves
>- drop the watchdog RFC patch for now
>
>This patch series was developed against v5.3-rc7.

Great work Matthias!

I think this patchset is shaping up nicely. As the merge window is
coming up soon, I'd like to queue this up in modules-next by the end
of today to allow for some testing and "soak" time in linux-next. If
there are any more complaints, please speak up.

Thanks!

Jessica
