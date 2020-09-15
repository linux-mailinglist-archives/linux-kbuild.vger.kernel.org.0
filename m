Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10C126A530
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 14:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgIOMBy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 08:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgIOMBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 08:01:42 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F963C061797
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 05:01:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so3056532wrv.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D1RHl8ABdhn5KjoXJVQFbK3lZzim3prS8WaJzdIy+Zo=;
        b=Zb9L1jobJQn7TM+/5qKmWs5QBd2EXGxISO/ZkcumPM8Vro0Vr55MmlKUwUifKoKJg+
         zl/iDbZ2w5XqrlxmJkjZgmmZP5NI1934atyy561Ay2MXa+FnuuynbncFOlg6j1nAM8ei
         nQJq5CvBO8QomgfteMuJPONS1P+ZZCvCiP3bLKVjNIYXIcqQgdzXgAjr3TShuD/NTpLq
         WK/qwY8X5PijIrR+U2tADWCc41LFvUI6wRrhWcMVNdBvt24fQOuGsuHn/kO9UmXlrJl9
         lA14MFwIiIxLtPEKAUDzC+4CdfxeTGre++QHrUGZAZncOeGJWO14UVlnAnY/vdGLIltr
         bPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D1RHl8ABdhn5KjoXJVQFbK3lZzim3prS8WaJzdIy+Zo=;
        b=AUAQw8TFoh2fnUjkYBfwnh5gEPFzg0hsKpWsQbcTAwEy/PzvUeW+FJQSKk1lh9XcKS
         640MLfXV68Li+CR8m2RU5UvyQKTERBJq0t0vA3Y2ALTP+uMXX0lt8nRxDrRATypapQcj
         HlDAFO9HXwz9bDu5WAgfIh/KljohEl4zSBb/iOp2mwLSjooLUCEkrWCLqtR2rAX4m2xh
         f7gB7Ov1FLJzHVkAiqbMZVB66LsJaklNK+6Iarz2YkUIhyTWmUh12E3gOqeI5S7UxVVY
         WHIyPworncYcYvpfvNSIUsuREFEQop9TllJYeLoNVZhMv/Ewx5awYi3y4Z/Vcq7PvpTn
         hawA==
X-Gm-Message-State: AOAM533dTMR7sV3wL4HHmuorvs79v1CU72h5hxLiqjw52Za+zmTVu5nv
        7Sq+S5bu1JzozyRE1BjpsEDCVA==
X-Google-Smtp-Source: ABdhPJw9xzBTkm1ex/SpXs3gzQoe/wJz8pjYJNPqDjhDGb9ai+C4+hJhDspqERQLDE8pW/IN0QMg9Q==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr22458843wri.292.1600171267204;
        Tue, 15 Sep 2020 05:01:07 -0700 (PDT)
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id s124sm25145526wme.29.2020.09.15.05.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:01:06 -0700 (PDT)
Date:   Tue, 15 Sep 2020 12:01:05 +0000
From:   George Popescu <georgepope@google.com>
To:     Marco Elver <elver@google.com>
Cc:     Kees Cook <keescook@chromium.org>, maz@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Message-ID: <20200915120105.GA2294884@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com>
 <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com>
 <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 15, 2020 at 01:18:11PM +0200, Marco Elver wrote:
> On Tue, 15 Sep 2020 at 12:25, George Popescu <georgepope@google.com> wrote:
> > On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > > > From: George Popescu <georgepope@google.com>
> > > >
> > > > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > > > the handler call, preventing it from printing any information processed
> > > > inside the buffer.
> > > > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > > > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > > > call
> > >
> > This would mean losing the local-bounds coverage. I tried to  test it without
> > local-bounds and with a locally defined array on the stack and it works fine
> > (the handler is called and the error reported). For me it feels like
> > --array-bounds and --local-bounds are triggered for the same type of
> > undefined_behaviours but they are handling them different.
> 
> Does -fno-sanitize-trap=bounds help?>

I tried replacing it with:
      ifdef CONFIG_CC_IS_CLANG
            CFLAGS_UBSAN += $(call cc-option, -fno-sanitize-trap=bounds)
            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
      else
            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
      endif

The code traps.

Thanks,
George
