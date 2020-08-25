Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BBF2523E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 00:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHYW4h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 18:56:37 -0400
Received: from ms.lwn.net ([45.79.88.28]:33580 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgHYW4h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 18:56:37 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id ED26C2BA;
        Tue, 25 Aug 2020 22:56:35 +0000 (UTC)
Date:   Tue, 25 Aug 2020 16:56:34 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Will Deacon <will@kernel.org>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
Message-ID: <20200825165634.46a90fac@lwn.net>
In-Reply-To: <20200825225131.GA2702183@ubuntu-n2-xlarge-x86>
References: <20200825222552.3113760-1-ndesaulniers@google.com>
        <20200825225131.GA2702183@ubuntu-n2-xlarge-x86>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 25 Aug 2020 15:51:31 -0700
Nathan Chancellor <natechancellor@gmail.com> wrote:

> > +Clang/LLVM (optional)  10.0.1           clang --version  
> 
> Maybe it is worth making the "(optional)" a footnote like Sphinx? Seems
> to just kind of stick out to me but I do not have a strong opinion
> unless others do.

Let's not do that; the table needs to be properly readable in plain-text
format.  Adding that sort of markup will just serve to obfuscate things.

Thanks,

jon
