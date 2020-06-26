Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA76F20BA0B
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgFZUNU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgFZUNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:13:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE39C03E97B
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:13:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i4so5386474pjd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Az9RFFYtn5C7TmV4P2ySXpJMS+ldXmIwmwoLtzgDuS8=;
        b=kaoCNqPS1QsSCdQvqaSVaEOAXbalmo1arka1el0o4zpvk3N0TP8c2fV2jYdsRreLMw
         yDtrumERCVizvepxpfw0Om38FWisWAy7daOjrh8Lu/hU7IK5N8OAn4TVfHcuv2OMpEg9
         Jcmvj2f2b1QJUPjV3veR2dZlYeqosz3ojrmq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Az9RFFYtn5C7TmV4P2ySXpJMS+ldXmIwmwoLtzgDuS8=;
        b=ZVdrOpstEaOo29+Oxi5gYV6pMRj3cva4rOzcUGzCWIYLaLzQTsIzTQ5eCu6kKy4CAk
         BlmlffZLROKITVQuBXKILBQUN2sJaoY5K9SmQ/nb5YD0h0AbCuw7AoVD++o9EHJnczsa
         exAx/PnU3hlqJqf4Jdt25X+jxw6BErgpy4ZuIRY+aazDF3zKixGBxmEawGsovKKRlGKG
         IfULGXss35rzUWJadPQT5Kt0xDe0EwVngiIAmYE7g6sBIJWyDAyiGU/er+yfVYH7+fVp
         bRRIED6WRFf1+pyQBk8xfKckun5he45/+rhlVzszBedbFQST/FyGTM7fonHUgwpClruu
         5TEg==
X-Gm-Message-State: AOAM5332KP4jXFXv08J7cl25fnBkmyaNRpRaOuGXATJ9hW2aopeYBxP6
        3xbcKcGnKT6D6NYA73haYUpVMg==
X-Google-Smtp-Source: ABdhPJyboLRCHhlEE16WjSu4BWalicgOTCnBMXYn0MvwG2mprXGsrY/REL8KRMtW3BQoaNUGnfaC+g==
X-Received: by 2002:a17:90a:aa88:: with SMTP id l8mr5328566pjq.145.1593202400000;
        Fri, 26 Jun 2020 13:13:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y187sm26950121pfb.46.2020.06.26.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:13:19 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:13:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261312.560B045E@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <CAKwvOdnK4KZaE=D40UyKHN-nB1Y-oXXJUcVv08cGJNsExOs-Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnK4KZaE=D40UyKHN-nB1Y-oXXJUcVv08cGJNsExOs-Pw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 12:09:37PM -0700, Nick Desaulniers wrote:
> On Fri, Jun 26, 2020 at 12:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >  CFLAGS_NO_HARDENING := $(call cc-option, -fno-PIC,) $(call cc-option, -fno-pic,) \
> > -       $(call cc-option, -fno-stack-protector,) \
> > -       $(call cc-option, -fno-stack-protector-all,)
> > +       -fno-stack-protector $(call cc-option, -fno-stack-protector-all)
> 
> Just curious, looks like we could do the same for
> `-fno-stack-protector-all`, here or tree-wide, right?  Wait, what
> compiler recognizes -fno-stack-protector-all?
> https://godbolt.org/z/QFQKE_

That is from ancient times, IIRC. -fno-stack-protector should be
sufficient.

-- 
Kees Cook
