Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0EDDED9C
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2019 15:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfJUNcF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Oct 2019 09:32:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727322AbfJUNcF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Oct 2019 09:32:05 -0400
Received: from linux-8ccs (ip5f5ade6e.dynamic.kabel-deutschland.de [95.90.222.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58FCA20873;
        Mon, 21 Oct 2019 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571664723;
        bh=s2MUd+aoyjl0YqHLgnKz/F+K2JCRuYEwU71SYc90uQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuR0L3DL0hxl0OMguM+cHtAJRljCFNC0Te2vzLkSxdMVcJE5SG5e2nFeFjmsnuq2J
         m737UxHqdGJTwDdH4HuwO/VZV0xP657x6LTwN3OaxvHtFzH4Bzf4rB1/jLfjGADko1
         zGP2b549iUmHE1cAxmNNck8Wg48s58PBgUYkkQIU=
Date:   Mon, 21 Oct 2019 15:31:57 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Subject: Re: [PATCH v2 0/4] export/modpost: avoid renaming __ksymtab entries
 for symbol namespaces
Message-ID: <20191021133157.GA21112@linux-8ccs>
References: <20191010151443.7399-1-maennich@google.com>
 <20191018093143.15997-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191018093143.15997-1-maennich@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Matthias Maennich [18/10/19 10:31 +0100]:
>The introduction of the symbol namespace patches changed the way symbols are
>named in the ksymtab entries. That caused userland tools to fail (such as
>kmod's depmod). As depmod is used as part of the kernel build it was worth
>having another look whether this name change can be avoided.
>
>The main purpose of this series is to restore the original ksymtab entry names.
>For that to happen and to remove some rough edges around that, the relevant
>parts in modpost got a small refactoring as to when and how namespaces are
>evaluated and set in the symbol struct.
>
>Eventually, the namespace values can be read from __kstrtabns_ entries and
>their corresponding __ksymtab_strings values. That removes the need to carry
>the namespace names within the (anyway unique) symbol name entries.
>
>The last patch of this series is adopted from Masahiro [1]. By allowing 'no
>namespace' to be represented as empty string, large chunks of
>include/linux/export.h could be consolidated. Technically, this last patch is
>not absolutely necessary to fix functionality. It addresses concerns about
>maintainability and readability. While I strongly suggest sending all of the
>patches for 5.4, the last one could possible deferred to the next merge window.
>
>This patch applies to the modules-linus [2] branch.

Hi!

I've applied the first three patches to modules-linus, inbound for -rc5.

Patch 4/4 was agreed to be for 5.5, and will be applied to
modules-next once I rebase that branch against -rc5.

Thanks!

Jessica

>Changes since v2:
> - restored correct authorship for [4/4]
> - add missing contributor tags
> - fixed typos and code style (spaces/tabs)
>
>[1] https://lore.kernel.org/lkml/20190927093603.9140-5-yamada.masahiro@socionext.com/
>[2] https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git/log/?h=modules-linus
>
>Cc: Jessica Yu <jeyu@kernel.org>
>Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>Cc: Martijn Coenen <maco@android.com>
>Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
>Cc: Shaun Ruffell <sruffell@sruffell.net>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Will Deacon <will@kernel.org>
>Cc: linux-kbuild@vger.kernel.org
>Cc: linux-modules@vger.kernel.org
>
>
>Masahiro Yamada (1):
>  export: avoid code duplication in include/linux/export.h
>
>Matthias Maennich (3):
>  modpost: delegate updating namespaces to separate function
>  modpost: make updating the symbol namespace explicit
>  symbol namespaces: revert to previous __ksymtab name scheme
>
> include/linux/export.h | 97 +++++++++++++-----------------------------
> kernel/module.c        |  2 +-
> scripts/mod/modpost.c  | 59 ++++++++++++++++---------
> scripts/mod/modpost.h  |  1 +
> 4 files changed, 71 insertions(+), 88 deletions(-)
>
>Interdiff against v1:
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 7cf0065ac95f..0bf7eab80d9f 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -357,18 +357,21 @@ static const char *namespace_from_kstrtabns(struct elf_info *info,
>
> static void sym_update_namespace(const char *symname, const char *namespace)
> {
>-       struct symbol *s = find_symbol(symname);
>-       /* That symbol should have been created earlier and thus this is
>-        * actually an assertion. */
>-       if (!s) {
>-               merror("Could not update namespace(%s) for symbol %s\n",
>-                      namespace, symname);
>-               return;
>-       }
>-
>-       free(s->namespace);
>-       s->namespace =
>-	       namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
>+	struct symbol *s = find_symbol(symname);
>+
>+	/*
>+	 * That symbol should have been created earlier and thus this is
>+	 * actually an assertion.
>+	 */
>+	if (!s) {
>+		merror("Could not update namespace(%s) for symbol %s\n",
>+		       namespace, symname);
>+		return;
>+	}
>+
>+	free(s->namespace);
>+	s->namespace =
>+		namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
> }
>
> /**
>-- 
>2.23.0.866.gb869b98d4c-goog
>
