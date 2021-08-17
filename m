Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FF43EE0DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhHQAZV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbhHQAZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:25:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCC8C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:24:48 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k5so10092603lfu.4
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XH+M5jn9akfM4a0wOqQs1Q40q3Corb2RIBY1St6+LyY=;
        b=kAL8bVwYLmaw1qXanaRx/lkddOfhUrypUfX1MQnys6VVsR+W0QYKngoz+zMJnAXnDJ
         E4MWENFIWYKzMjupke5UQlCgk1/Brh880/R632CsbIH/g4pH6pda22dTKhwy0kxlSTPL
         tH8qHmEK/dGsdalYjSD2k2pWJJ8TS/snPulSrB//0/BL+z5KKa13SJl4JJqv3TD7JpzB
         1034EXf6prX/keQ4DZGXBsBjvVkNBr6Gxg2xvXepbnf+rjK2DjQjvIa3nC7LobvalM7J
         4bwNEuskX8skZ3uSVM/YT8fcNVlbYg3NMPvOz0BHl8yroygnnLOfln1iCXyBHcnREzbP
         BtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XH+M5jn9akfM4a0wOqQs1Q40q3Corb2RIBY1St6+LyY=;
        b=Y70iZ1MO3sqKkDiz28DkpYNfUHUx+CaOkZNf90OZ1EmvQ9r4dpqkXBByPFmvV2l9XT
         uP3WL7McaWWy32MbFLn1E4rqO4HZsR8u27AeDHNCxmej+mT+7c3H8DMCID1KzGKPlzSA
         k3Y8xxW3RfN1N7HJjWQWk5xklgf8t3Ti70KCfeMzxPhGc3sB9s/4GbUM3ib5DBC7rcxw
         hu8b1lFcDPRAYy6qGMeY/dBPudDf56FI4uMlePughBWGt41RMsF+ibbuEmGMANKc5uJM
         3Ti9t0JilEgR6VrqRWSB4BRcWuH780rFVjzBe1aMIwi3FMwBJcPhuMLMsRLGtA2k1+g/
         t/2w==
X-Gm-Message-State: AOAM5304UtkybOGHf/jrDjpUirCapfL1kD6EdNwa/LkM/GLTsR20W+u+
        x82UtvXogwQnfQYdTD0HwlOO7AyRKhbXpe7Zfi/MAw==
X-Google-Smtp-Source: ABdhPJwpCkXQeIaRMDvqJQXzGrs19Fe0eXmfb5Vagx5ap9HQRJEPA+hanVpfVBdOE+OKCQ9RlIh6gk33Z3vMTXkW9xE=
X-Received: by 2002:a05:6512:3041:: with SMTP id b1mr333364lfb.122.1629159886521;
 Mon, 16 Aug 2021 17:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkPLrL6wkhSGaadAcj3HNi1W2q6TQHWFhSej8JvatSzfw@mail.gmail.com>
 <CAK7LNAS_VVpRuwAayeQY0AAVBU1CchtgGMKT_G=bTgNf9TQ1Tw@mail.gmail.com>
In-Reply-To: <CAK7LNAS_VVpRuwAayeQY0AAVBU1CchtgGMKT_G=bTgNf9TQ1Tw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 17:24:35 -0700
Message-ID: <CAKwvOdmo+o4P95fF+x14Kc_sfB2e08WJcybV04P-KpMJgLgC3Q@mail.gmail.com>
Subject: Re: cc-option-yn necessary? (vs cc-option)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 10, 2021 at 5:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Aug 11, 2021 at 2:58 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Masahiro,
> > I was looking through the uses of cc-option, cc-option-yn, and
> > cc-disable-warning to see what we're missing support for in Clang.
> >
> > I have a short list of places where cc-option can be removed at
> > https://github.com/ClangBuiltLinux/linux/issues/1436#issuecomment-895557491
> > because all supported versions of supported toolchains support these
> > flags.  These should remove a few unnecessary compiler invocations.
> >
> > There are also a few cc-option tests that are very compiler specific,
> > so those might be convertible to just check CC_IS_* rather than
> > cc-option (I'll have to verify).
> >
> > Another thing I noticed is that it seems that most uses of
> > cc-option-yn are replaceable with simply cc-option when they use
> > cc-option-yn but check that the result is equal to y. I think even the
> > cases that check against n could be converted to:
> >
> > Examples:
> > arch/x86/Makefile
> > From:
> > ifeq ($(call cc-option-yn, -mfentry), n)
> > To:
> > ifeq ($(call cc-option,-mfentry),)
> > (Though technically, all supported versions of gcc and clang support
> > -mfentry, so this block should just be deleted)
> >
> > arch/powerpc/Makefile
> > From:
> > ifeq ($(call cc-option-yn,-mcmodel=medium),y)
> > To:
> > ifneq ($(call cc-option,-mcmodel=medium),)
> >
> > Then perhaps we could consolidate cc-option-yn into cc-option?  What
> > are your thoughts? Should I start sending you patches for all of the
> > above?
>
>
> Yes, I think it is a nice clean-up.
>
> Patches are welcome.

https://lore.kernel.org/linux-kbuild/20210817002109.2736222-8-ndesaulniers@google.com/

-- 
Thanks,
~Nick Desaulniers
