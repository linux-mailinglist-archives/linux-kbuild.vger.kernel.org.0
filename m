Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FB530D7BA
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 11:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhBCKhs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Wed, 3 Feb 2021 05:37:48 -0500
Received: from wildebeest.demon.nl ([212.238.236.112]:37974 "EHLO
        gnu.wildebeest.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbhBCKhp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 05:37:45 -0500
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Feb 2021 05:37:45 EST
Received: from tarox.wildebeest.org (tarox.wildebeest.org [172.31.17.39])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by gnu.wildebeest.org (Postfix) with ESMTPSA id 28BF9304481E;
        Wed,  3 Feb 2021 11:31:08 +0100 (CET)
Received: by tarox.wildebeest.org (Postfix, from userid 1000)
        id 16C714000C6A; Wed,  3 Feb 2021 11:31:08 +0100 (CET)
Message-ID: <544278979063fbee59f7e8d82c88ba3293380d57.camel@klomp.org>
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
From:   Mark Wielaard <mark@klomp.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Date:   Wed, 03 Feb 2021 11:31:07 +0100
In-Reply-To: <20210203075239.5505-1-masahiroy@kernel.org>
References: <20210203075239.5505-1-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
X-Spam-Flag: NO
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Wed, 2021-02-03 at 16:52 +0900, Masahiro Yamada wrote:
> With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-
> assignments
> for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> CONFIG_CC_IS_GCC=y.
> 
> Fix it to reset DEBUG_CFLAGS also when using Clang.
> 
> [...] 
> +DEBUG_CFLAGS	:=
> +
>  # Workaround for GCC versions < 5.0
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
>  ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS	:= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> +DEBUG_CFLAGS	+= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
>  endif

Yes, this makes sense given that the original code, before commit
121c5d08d53c did always set DEBUG_CFLAGS without checking for
CONFIG_CC_IS_GCC. So it behaved like the above code does.

Reviewed-by: Mark Wielaard <mark@klomp.org>

Thanks,

Mark
