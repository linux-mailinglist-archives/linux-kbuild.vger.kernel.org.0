Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7D026A30E
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 12:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgIOKZJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 06:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgIOKZD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 06:25:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEF7C061788
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 03:25:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so2798668wmd.5
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nCObEKoOnmpHrzYJFBm9pkBKEq9SNCMkpHaxOskN+KQ=;
        b=vbBJy4kwOuP8fps7ENGxPva5zUYL7ASA78U0Ik7uGtyQwbCdxLIDc5R+Lkce3LiyG9
         tLhWib3rO23PtT7aBoJi1Wh5s5YnYthzHConFQ9L9lfT5mJzO+PvYFbCpNkD3Y3Y5pV7
         ccjX2TexQXkFDZFRXCF4Vu7sGsVYCi2n6CfR+ga+FrmT/CM19VfdHrlV+uoAyQb7Wnux
         Ua6jN3ov5SDmM4C4t32H7+HFTozTlN8q3kPzjcNZy74cI/nUj7maUu2W1Xv0iRcsns8V
         7sMEIca6qA/KcCQnNsC8rCvlnSY3mxClh6VbPDZTXsnqTmoM6xWaK0XxddnzL4J3SJO6
         b+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nCObEKoOnmpHrzYJFBm9pkBKEq9SNCMkpHaxOskN+KQ=;
        b=lejFs+yPrEyqsbVXRIWoqcE/DF3dzVX3OY//3dyPTWPhCfMEth7I1Ecmg9bYiDB2UV
         FF1LGA9D/JidboJJEUC3oDfcwRFXCOcyYvVxkBa1v79l56hCwTt+bkqvTMh8ykm00oO8
         1h4fYa1CLLkNKXq+ICaWOOUsUZDJFE2G1snpoFtGaiJ52MG0x70NBbMjbrASIzjU5kJZ
         82NKMf/cQyfZeae0NzS19UZ846w6SwfFNsJWjZldGMGJr9ESotIp0uw3fGsOQTFuLwSL
         Fb20dDiauGceC8JicHEoItHKTCgTHC0DrIeklt8lHRJE6T7Qb3t/qmxOokjAgRABDJ3i
         /fvA==
X-Gm-Message-State: AOAM532TPIxkZCjLaxqw6G34UhmDDxSpQjqk/HEyXfcwg19PtLNpxIwL
        3Akbgn1DHo3moPLMkrlgsIKUCA==
X-Google-Smtp-Source: ABdhPJyLkeeoM2ZZcrGWaota2zFMVO2kAkBf28Jt84EjulN5M4ljnumj2SEmrORUfgsijOJP5ZWZqg==
X-Received: by 2002:a1c:2e08:: with SMTP id u8mr4155025wmu.156.1600165500941;
        Tue, 15 Sep 2020 03:25:00 -0700 (PDT)
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id w15sm27651716wro.46.2020.09.15.03.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 03:25:00 -0700 (PDT)
Date:   Tue, 15 Sep 2020 10:24:58 +0000
From:   George Popescu <georgepope@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, akpm@linux-foundation.org, dvyukov@google.com,
        elver@google.com, tglx@linutronix.de, arnd@arndb.de
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
Message-ID: <20200915102458.GA1650630@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com>
 <202009141509.CDDC8C8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009141509.CDDC8C8@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > From: George Popescu <georgepope@google.com>
> > 
> > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > the handler call, preventing it from printing any information processed
> > inside the buffer.
> > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > call
> 
> That sounds like a compiler bug?
Actually in clang 12 documentation is written that -fsanitize=bounds
expands to that. GCC  doesn't have those two options, only the
-fsanitize=bounds which looks similar to -fsanitize=array-bounds from
clang. So I don't see it as a compiler bug, just a misuse of flags.

> > Signed-off-by: George Popescu <georgepope@google.com>
> > ---
> >  scripts/Makefile.ubsan | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 27348029b2b8..3d15ac346c97 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -4,7 +4,14 @@ ifdef CONFIG_UBSAN_ALIGNMENT
> >  endif
> >  
> >  ifdef CONFIG_UBSAN_BOUNDS
> > -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> > +      # For Clang -fsanitize=bounds translates to -fsanitize=array-bounds and
> > +      # -fsanitize=local-bounds; the latter adds a brk right after the
> > +      # handler is called.
> > +      ifdef CONFIG_CC_IS_CLANG
> > +            CFLAGS_UBSAN += $(call cc-option, -fsanitize=array-bounds)
> 
> This would mean losing the local-bounds coverage? Isn't that for locally
> defined arrays on the stack?
This would mean losing the local-bounds coverage. I tried to  test it without
local-bounds and with a locally defined array on the stack and it works fine
(the handler is called and the error reported). For me it feels like
--array-bounds and --local-bounds are triggered for the same type of
undefined_behaviours but they are handling them different.

> > +      else
> > +            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> > +      endif
> >  endif
> >  
> >  ifdef CONFIG_UBSAN_MISC
> > -- 
> > 2.28.0.618.gf4bc123cb7-goog
> > 
> 
> --
Thanks,
George
