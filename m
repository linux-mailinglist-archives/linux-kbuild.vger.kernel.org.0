Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 947F5A969D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2019 00:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDWky (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 18:40:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45909 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDWky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 18:40:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id l16so421830wrv.12;
        Wed, 04 Sep 2019 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n42hMk5GEGKVgiWQ4Tr6YXAISJ/x8t5++qX9vnL5Xm0=;
        b=epQ6Hx9qyetHKAg1lFLlHRAHKCST6sypO0YqNN6ARKvZ8uzC9e2C86JE1ezB5FthCH
         dsqUbKNE24k3u1oqyZNl7OunM+DnbCe1/R1dVlEelJWnL+tZ0Fc4Zc47oDIxp/DdAm32
         QopjtCpnRzMwYgzMRE0aT7XUqw+HIC/iGB1nui4LfAwBRFnDagcjAJwEMhMfhkVkp4Dm
         8EnXByoTZelFlAXHGv9n/itJrU2kUybMaV8uOdEnaOMdRZUGhzvVhtXmrwA3xmrfTlx4
         yNPN0YWzxtDbugDJqVWiGEBSMeRHc+gpUt/PbGxQdEbSEY0mH2HmTzP0J1KBdnD453jg
         hhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n42hMk5GEGKVgiWQ4Tr6YXAISJ/x8t5++qX9vnL5Xm0=;
        b=jnxDwZzUC40P1+yRSFEcp8FSfD/WIYtQptzw1kRqlTXTMOlkfokG7vC0GnSVxovzsF
         dWeJmFsx/agKWof7vQwpeokY8fIsKHPRO36+S1Dz/DFW8LLmJ5wjM36svVU8UnRbH0+E
         eicuC47Mg36ViXQXCTm++gTeA5++c38y3/KondeLl20M1URJ69YRCj3gpCMAJJSU73f3
         9urZYU46/s46tove7kztsWnp2z1qSgbZDcFj5qLSZInCy28vJaPAmTCzPYdxHVHm16J7
         gpZtuAFt2JnKBwofE/f6lu3sST2l4XKsniwamEzcXDahF07MN4QA35pzI5N8SePaWp32
         keLQ==
X-Gm-Message-State: APjAAAVyhV7Au+ZU2fDfWamPRPy4gxBr1TCsOFbZpHVR196YL3zoF/v9
        AjfCEXGjG60oPtkYnSNixl0=
X-Google-Smtp-Source: APXvYqx06dii//7/Fpw0RwIMYI3WVSwHpshEIFHk0w6kBQebFtdxym+HCVrtsIiugv+QuoBF5tBcVg==
X-Received: by 2002:adf:e607:: with SMTP id p7mr42979wrm.230.1567636852627;
        Wed, 04 Sep 2019 15:40:52 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id y3sm158912wrw.83.2019.09.04.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 15:40:52 -0700 (PDT)
Date:   Wed, 4 Sep 2019 15:40:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] kbuild: refactor scripts/Makefile.extrawarn
Message-ID: <20190904224050.GA82176@archlinux-threadripper>
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 04, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> On Sat, Aug 31, 2019 at 6:26 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> 
> > +# Some diagnostics enabled by default are noisy.
> > +# Suppress them by using -Wno... except for W=1.
> > +
> >  ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS += -Wno-initializer-overrides
> >  KBUILD_CFLAGS += -Wno-format
> >  KBUILD_CFLAGS += -Wno-sign-compare
> >  KBUILD_CFLAGS += -Wno-format-zero-length
> >  endif
> 
> FWIW, I just found out I missed a bug that clang failed to warn about
> because of the  -Wno-format. Apparently gcc warns only about type
> mismatches that result in incompatible calling conventions (e.g.
> int vs int64_t) but not smaller types (int, short) that get converted to an
> int anyway. Passing -Wno-format turns both off.
> 
>       Arnd

Hi Arnd,

This has been fixed in clang 10.0.0 but this areas has not been updated
as nobody has sent a patch yet:

https://github.com/ClangBuiltLinux/linux/issues/378#issuecomment-524411147

Cheers,
Nathan
