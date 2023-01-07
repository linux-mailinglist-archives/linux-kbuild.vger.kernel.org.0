Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6758660C34
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jan 2023 04:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbjAGDhE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Jan 2023 22:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236581AbjAGDhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jan 2023 22:37:02 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855BADEFA
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Jan 2023 19:36:54 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id g16so3689802plq.12
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jan 2023 19:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IG6jyzU3lw3az+t92iu8S5izMXVZhaCOIqMcxfJexWE=;
        b=NEAvXPf/xTu2tpdypsnKOo4nSfblr/MqWDOi40t8QE2Kf/PqMxdj4KIhtINy1VIOzD
         WCy1ejLWzWQq9uo+PzIAueREk0LziXCeBvIl++P8aAmjp47VTtsmmUNnJT0nIUS1PkwF
         GO4+j/raiuHUR8QZVCKqAhW4jHxuWErUht/rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG6jyzU3lw3az+t92iu8S5izMXVZhaCOIqMcxfJexWE=;
        b=EJTqh6713qG07J2ot9eqJ5DBFsFkErE9WSOaMJck100k+UeoCEASgZhfQopcEYwCql
         4j5u0D2G+uDADGjt4c0WcP1hYg1um4k9FynDEbTAZ01YGGYngtOWHzEZTG3kEq4jLRq4
         6b4lLRUgmrVJQJRlXk588an0z8Ay9uik68FTzIzCc5/HnqGTPaEWIHHQNMkolbE9BRz1
         +YKBREnDh98EoykGkJDG3CyU8XieWFtWNrsJU6gC6okr01WoDpE6StW3POT9baLnCyPi
         6qUvY/mttknyB8+UsdpkcprbPHRiRc3+WIMKWqH56KWVQS6zRjDIkHTer0QZg8MqP07i
         k19g==
X-Gm-Message-State: AFqh2krmKnHxPbNmYrZy/0nXZLy4WnKnMdr987m52G9s+iZb4vO5/lpk
        7JkLVODpJq1FkCOIbI0u9squGg==
X-Google-Smtp-Source: AMrXdXswcLN5mWPATgzm302bp7TvnFeozvA0yc1NDxHL+S9s7T4PUgVZSIRWY1sUdTsi35IdtODQcA==
X-Received: by 2002:a17:902:b78c:b0:193:1fc5:f611 with SMTP id e12-20020a170902b78c00b001931fc5f611mr82042pls.38.1673062613952;
        Fri, 06 Jan 2023 19:36:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709027fc200b00190fb8f9e0asm1580783plb.249.2023.01.06.19.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 19:36:52 -0800 (PST)
Date:   Fri, 6 Jan 2023 19:36:52 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Dan Li <ashimida.1990@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Qing Zhao <qing.zhao@oracle.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Marco Elver <elver@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Song Liu <song@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uros Bizjak <ubizjak@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Juergen Gross <jgross@suse.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        Kalesh Singh <kaleshsingh@google.com>,
        Yuntao Wang <ytcoode@gmail.com>,
        Changbin Du <changbin.du@intel.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC/RFT] CFI: Add support for gcc CFI in aarch64
Message-ID: <202301061929.6881F6CD40@keescook>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <Y6A/k7/KrCCDuux6@hirez.programming.kicks-ass.net>
 <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219132731.6ng4sz2nv6ujvu7i@ubuntu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 19, 2022 at 05:32:04AM -0800, Dan Li wrote:
> Hi Peter,
> 
> On 12/19, Peter Zijlstra wrote:
> > On Sun, Dec 18, 2022 at 10:17:58PM -0800, Dan Li wrote:
> > 
> > > 1. When a typeid mismatch is detected, the cfi_check_failed function
> > >    will be called instead of the brk instruction. This function needs
> > >    to be implemented by the compiler user.
> > >    If there are user mode programs or other systems that want to use
> > >    this feature, it may be more convenient to use a callback (so this
> > >    compilation option is set to -fsanitize=cfi instead of kcfi).
> > 
> > This is not going to be acceptible for x86_64.
> 
> I'm not familiar enough with the x86_64 platform, could you please
> tell me why this is not acceptable? Is there a similar situation
> on the arm64 platform?
> 
> > > 5. The current implementation of gcc only supports the aarch64 platform.
> > 
> > What, if any, are the plans for x86_64 support?
> 
> I'd like to implement something similar on x86_64 later, but
> currently I'm doing this in my spare time, so it might take a
> little longer. :(

Hi!

First of all, thank you thank you for working on this in GCC. This will
make a big difference for folks that don't have the option to build with
Clang to gain CFI coverage.

As for the implementation details, the core issue is really that this
type of CFI is specifically designed for the Linux kernel, and it took a
rather long time to figure out all the specifics needed (down to the
byte counts and instruction layouts). GCC's version will ultimately need
to exactly match the Clang output, or Linux is unlikely to support it.

We're already on our second CFI -- the original Clang CFI was just too
clunky for long-term use in Linux, so unless we're going to improve on
the latest Clang KCFI implementation in some way, it's better to stick
to exactly byte-for-byte identical results. The KCFI support in Linux
depends on the arm64 and x86_64 runtimes for catching the traps, and the
post-processing done (on x86_64) with objtool that prepares the kernel
for IBT use, and converts to the optional FineIBT CFI mechanism. With
all those moving parts, there needs to be a very compelling reason to
have GCC KCFI implementation differ from Clang's.

Hopefully that context helps a little. I'm excited to try out future
versions!

-Kees

-- 
Kees Cook
