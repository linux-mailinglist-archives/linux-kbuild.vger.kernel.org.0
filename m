Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2311F7D60
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 21:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFLTJy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 15:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgFLTJx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 15:09:53 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5320FC03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:09:52 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id b5so9772875iln.5
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=blhEXRVtONtz59zChC6nG5U6borpENX5pILB+EWKp2o=;
        b=JrXza2viSxPRkcsZScefu0tADvRVq8wH9WOoQEAX7cUTrrfT4FZmC9Swivi+Oo4hHF
         NRFqRjrieA2J+YVKgLxIpC7tYyQvE8XVWJKaXKYrpsFiF8AKHJtGCVufPeFRyCfzwROz
         uqr949MKIZ5GcOIq9pPCXkz/oOMl1dzjbgO7PnqKpNr8x8Q9GAJxzi9b9wQuy6JjB09y
         mal66E8F5JyDsfNw0HL6lUqPYKr/AsLBCpzZHxoirCYO9FGdnPooLMShcElezvdTJg86
         X9Kuwbl9YLlNj8SmK+BgXPiilbR3U7znPqzLvtvxmcqtzgM+rPKlc5cBvjCN0Tndk+aP
         26Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=blhEXRVtONtz59zChC6nG5U6borpENX5pILB+EWKp2o=;
        b=Yg+mMTbvXRgQX3p0Utd57Xl37KL2mbN1ei3G1W1vYVPBJFsrb8H1o/KynXE+qjC5hq
         Hg+bF9GE6Pee5v38DMWfVnbDRrp1JsVvr46WZ+ZwhLZQUJwZdISTcIItuoL7UP/0XhKJ
         IUEdT6im+zknDgMw1MQxxMRCOM6P/m7vs5MOe5o7WkvNbYGeNlAA3HIWG2MwToCm3I+S
         4Se6grKwDmfZd1ZTyu0H/n2L4nLGbeWzpRECBC5N5JdVU+a6ZZiMN7RjfpYc2xIC9+nL
         s91/Deuf8vYqKis4fJK/ss5WJnwXAjhb0RcybvVl7PItad94sb0q3RGyUoXrT512OHyG
         OZvw==
X-Gm-Message-State: AOAM530EFbR1MPE7n/r72arinsg0BxN+ABbD0Pv7DecOMpKM1kT8oBe9
        07D6k64oAtE7DqM/AbRTwsXZVD6iO/0MCjMZuPkJfqHl
X-Google-Smtp-Source: ABdhPJxFmcqVnE4xT42+9LZuoLYxUDqTCMUAS2Rvpr/F2g9vAEq2aMrfsodF78V+dawTZ7++oRKTbrfRGdjEeWXiXvs=
X-Received: by 2002:a92:498d:: with SMTP id k13mr14785904ilg.226.1591988990025;
 Fri, 12 Jun 2020 12:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Jun 2020 21:09:38 +0200
Message-ID: <CA+icZUW2YAbA82BFgYKEr8FDZ239V-fPd_+X_XssqNEt79Aw7w@mail.gmail.com>
Subject: Re: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 12, 2020 at 4:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
>
> On Fri, Jun 12, 2020 at 10:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.
> >
> > I fell over some problems in x86/crypto area where I have found fixes.
> >
> > But how on hell can I set -no-integrated-as for specific object-file?
> >
> > [ arch/x86/crypto/Makefile ]
> >
> > ifdef LLVM_IAS
> > KBUILD_CPPFLAGS += -no-integrated-as
> > endif
> >
> > ...at the top sets -no-integrated-as for all object-files.
> >
> > I have two broken object-files (or more exact the corresponding *.S
> > file is broken):
> > #1: aes_ctrby8_avx-x86_64.o <--- FIXED
> > <https://github.com/ClangBuiltLinux/linux/issues/1008>
> > #2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me
> >
> > I tried...
> >
> > CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
>
>
>
> The source file is .S (assembly file),
> so
>
>    AFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
>
>
> Or,
>
>    asflags-y += -no-integrated-as
>
> , which is effective for all .S files in the directory.
>
>
>
>
>
>
>
> > or
> >
> > CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
> >
> > or
> >
> > cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > or
> >
> > cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > All above also with "-fno-integrated-as" at the top and at the bottom
> > of the Makefile.
> >
> > Can you give a hint?
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1049
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1050
>
>
>
> --
> Best Regards
> Masahiro Yamada
