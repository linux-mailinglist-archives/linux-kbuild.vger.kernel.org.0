Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D0019C8CB
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 20:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389281AbgDBSbL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 14:31:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45056 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389212AbgDBSbL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 14:31:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id t4so1644403plq.12
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kZGuI29ZXRMYLlFqPcGnn2ZEpsArv5KS+IfYEt8rJDE=;
        b=jHiZcgy/2u30npHwDtjgCz/jYSsE83IkRbOXE5Io/gv1QNhpRoRnWFd6XA0HVEyK6J
         a9CMWCnII9zcMVEj+hLYILZ8NPkiM8WtOYpQdjzOVibuUBfbzWBNLJVl33/ivEjarjBV
         +WHBYHaX9sjAsbujCfwN1A8OE3jwzbZ5I5H9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kZGuI29ZXRMYLlFqPcGnn2ZEpsArv5KS+IfYEt8rJDE=;
        b=mvaTiZnYAhFF2RduqY3b+IjEK9f8Ml3jwfJQl9UsKz4i72jy8cu2R8AIKF//U12GpD
         wrnyk+jPNOflHfB8FPT7gR89X7fVs/vu6lCtf8fd9E7HzpJqChuMsardKtMKgyUJM+Fh
         8/Ug1pDAsIVwQBHxsppFixxtHYd51+h0j7bgJK8d3z0CicTH7fHNNxOSG7SL2oqy06Wn
         3zBlJDfsBtvp073+6h9EcCXLW1XBQ5/TSX7xQ9xC1MIft77RvEODXDnlSQst2vMwKiKn
         o4hqYFv4SgXg5vqc+/XesgyEI4ru5B6JThOlo/HZMhZVS5G3L0WW69kwd7sePbCJ5ehy
         nQqQ==
X-Gm-Message-State: AGi0PuZujSbUCn90cW4u3LwCQZ+vXjfa3HDRoVseWGt0bn91K8Fx5JpT
        0GOH4XgkMNT7MNwra5SboJAlTA==
X-Google-Smtp-Source: APiQypKbcVQftrWqKopgwEhOoaCPTB+Z5eo9TF6NM+bJ7aXLaXln6MGlsZMszWvro18nAm0OXNzTJg==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr5148235pjb.155.1585852270186;
        Thu, 02 Apr 2020 11:31:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z15sm4267487pfg.152.2020.04.02.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 11:31:09 -0700 (PDT)
Date:   Thu, 2 Apr 2020 11:31:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <202004021129.F688E2D@keescook>
References: <202004020117.6E434C035@keescook>
 <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
 <CAKwvOdnO_-jiQzCmy7pQNMGmZsgD9J=PYXVzOQ1NF1+u44MsOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnO_-jiQzCmy7pQNMGmZsgD9J=PYXVzOQ1NF1+u44MsOA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 02, 2020 at 11:22:02AM -0700, Nick Desaulniers wrote:
> With Kees patch + Masahiro's diff applied:
> $ cat /proc/version
> Linux version 5.6.0-rc7-next-20200330+ (ndesaulniers@<hostname
> scrubbed>) (clang version 11.0.0 (git@github.com:llvm/llvm-project.git
> 6d71daed03ced011cd25f4e4f4122a368fdc757d), LLD 11.0.0
> (git@github.com:llvm/llvm-project.git
> 6d71daed03ced011cd25f4e4f4122a368fdc757d)) #167 SMP Thu Apr 2 11:17:36
> PDT 2020
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Awesome! Thanks for testing. :)

> We could actually use this in Android for a VTS test I've, uh, been
> meaning to write.  Also, LOL at scrubbing the "compatible with" part,
> reminds me of user agent strings in the browser, which are god awful.

Heh, yeah. That's there because (actually, I think _you_ told me this
when I asked during the ClangBuiltLinux summit) other tools scanned the
LD version string for the binutils-specific bits. For this, since it's
newly added to the kernel /proc/version, nothing is already expecting to
find an LD string, and it looked super weird in there if I left it
as-is. Hence, scrub!

-Kees

-- 
Kees Cook
