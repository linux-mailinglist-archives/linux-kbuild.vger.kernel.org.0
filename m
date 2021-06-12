Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66283A4C8C
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 06:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhFLEFm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 00:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhFLEFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 00:05:41 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75FFC061574
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jun 2021 21:03:30 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id s14so6026576pfd.9
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jun 2021 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUYw1rF6lNo0RlpPe8Cbpvir2/VmMmKML9LcqMUK4/Y=;
        b=PLC+hrnjJ5jNFsdK4UBJJDj9hLsS2NdpjH54e2TZaja99KW+3nyoRkGEsONi2D20cZ
         TYBYy/pLDp/t4DG3dE4FfrtHqqNxp43Y85CMS9pd+nE/bi+kdwbSnPGdAWMDUI3UrC9p
         6U2eIvFQQ4+6UEXLpb8x0SPPZgYBjlM38/3I/72mDfp9o9+j6brDOzeTn1ApBWMv7HgZ
         mQ1COAU7OYt2MNbLWnF40lPHo+yHHJ0Rg7KESVsnlAGgKMXiTsMbX6jWkvfV+sRcRlN8
         sRQqvz3Wy7+wAN3wBTOVAB734G9mOsuIU5JwzmxDAnOtPSTSwnqVkQk8zMxb8g31BIPL
         IDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUYw1rF6lNo0RlpPe8Cbpvir2/VmMmKML9LcqMUK4/Y=;
        b=eqqXa5LR4eMbZXl2I1n4Xfk/m0jjhV7AxxysS4GxaEjumyo2KXiZoz5BARszMxbBDD
         8cNWmjMSjiRLPxyIVPozo5DuaCoOaO+uJwFAIM1qGtK2q/bSa++DtY9vhXcjgaJCq0GZ
         Z0ncYDJ+PDdHwMatJs38v0hw205JYrVHl5LFa1SVbejFTzRTzxcvCls+/0nq/kcM7Mjf
         hJrvD38TrOO+/Zqrms7werPVdl3kYF6Fd/3RRwbGjfKLCjLP6VBM6hU5i3+qOO/Q6fQK
         /kEarV2GSSpBlCjVEJYfxycfyc9o9QQJE1wGO7U3LfS9nCw3IbFI9IXVqG7WQi6rjMwf
         IFAg==
X-Gm-Message-State: AOAM532DzsadtA2sOmWzZhSS18ezWhttyH7gVNrDPBM/r4egBQtX/zGG
        0WLK7fVyf8MLfLnrnBO+NWtLJCV/A/Tk+P3Zzse36t3DUUh0cw==
X-Google-Smtp-Source: ABdhPJw86Yjht37udSzvyqnK2q271WrFveGy/Ls2f+OTr8aBC1nSkrxhsTe6L+j9KT3hJbYOOkgYbBFASI8Zyv/B2QU=
X-Received: by 2002:a65:60c5:: with SMTP id r5mr6746316pgv.79.1623470610291;
 Fri, 11 Jun 2021 21:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
 <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com>
 <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com>
 <CAGRSmLtY0WejKxNJ3xggPivmYhTK6tQ7LSfEZHtAaJQCQHdeTw@mail.gmail.com>
 <CAGRSmLsCOTxYD3nA-JTNBeVA0aAe8RTGkj18pSBJKMYAtqiQXg@mail.gmail.com>
 <CAGRSmLvQ+BCGJDdSW0JEjeGHznu4vbosxBLSF28RFvbQ_x7AsA@mail.gmail.com>
 <CAGRSmLu5r4Jrq9C-2B7U6gueKK6B86+yWUJS_J=X10ZDwkzdQQ@mail.gmail.com> <CAGRSmLvFh_DpPqyhq7qzeLHmQYQOeYSR6JVMXRdksFdQr3sNUw@mail.gmail.com>
In-Reply-To: <CAGRSmLvFh_DpPqyhq7qzeLHmQYQOeYSR6JVMXRdksFdQr3sNUw@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Fri, 11 Jun 2021 21:03:18 -0700
Message-ID: <CAGRSmLs0eFic7vFKMwHWKj1-Ougmz+ET2qGNnd7Mr5=eV9ZaCA@mail.gmail.com>
Subject: Re: 5.10 build issue creating library for driver support.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The problem is: No rule to make target '/path/to/sourcefile.o', needed
by '/path/to/lib.a' Stop

I now know it's related to sourcefile being a .cpp file.  I've looked
for differences between 5.4.x and 5.10.x and didn't see any.  Note I
have this in my make file that seems to be ignored which is the
problem:

# pattern for compiling the c++ parts
%.o: %.cpp $(FLAGS)
$(info doing [$@])
$(Q)g++ `cat $(FLAGS)` $(CC_FLAGS) -fno-exceptions -fno-rtti -Wall -c -o $@ $<

UPDATE: Found the problem.  Removing the $(FLAGS) from the first line fixed it:

# pattern for compiling the c++ parts
%.o: %.cpp
$(info doing [$@])
$(Q)g++ `cat $(FLAGS)` $(CC_FLAGS) -fno-exceptions -fno-rtti -Wall -c -o $@ $<
