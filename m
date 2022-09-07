Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0D85AFA75
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Sep 2022 05:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiIGDM7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Sep 2022 23:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiIGDM5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Sep 2022 23:12:57 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D569019F
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Sep 2022 20:12:55 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id az27so18265896wrb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Sep 2022 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aUfdL0h8QoOM6NYh1e5obcpE+RfHCz5rvFmppJngHvA=;
        b=KHQsCzY7yTO3vvx/cyNUaGgEO5PXwRMVx66LyTgH51awzIcZcZZCOTCsDqttKMNV7Q
         BPSGYKQV/VrU0WTiCKhJgiIKmf0gqYyc0uQk6UjduBR66cv1eHJZ5pnLUWJNLzsvFnOH
         0nOzTtct9mO9njg2xFJHzO7qsjvHEnzUxCTgscZpuhzzCl2r/19Q8HxilmGnb8u15NDC
         +73+WRsR8Bxs2b8Vn/C8saNGHD0Q8+msyHaGAtqnuProdEZAx2WCKOpAtm2fE1xyJkvK
         edFQ7z3EFnP8pzcUF9TJCPjZpo2oj/chmIvKa9rLmFdUGBT/KyBERR0ROmpPVgYaHTBt
         ceIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aUfdL0h8QoOM6NYh1e5obcpE+RfHCz5rvFmppJngHvA=;
        b=DnB6BvnbthtNQ4gy8yKiU+ucnaKFnar/u8ndOq9NKa9MNaKRgAZ3UkjJzcYrSYQlMr
         GUJUDKLDerBWkv3KWKotDkT/zbCqIv0wtC4aN2HKq3iO7tvBzAchVS22Gl3/NSfYI9C9
         yLgUWPOnOwub9HB9F/EDpYblwo/Y663gCr1PbiOFYK08LEYL6MqsWeJ9PCPBirz5VAaY
         3LfQuyYgDyextXV0wofBRR89CdQhMTl3UwDAzBYCmQj/6xvl0HiMp5lMBoTGm3Q/PMHm
         em1ouNf1rGMbDYxQx6NVJmOTXHgo07rhSj5CIkxxo7+c5k4yx5zEvy1ZxF3dL8IJAXNp
         aq8Q==
X-Gm-Message-State: ACgBeo3jj+J4gT39HvER/VgKAwZHACHlZTaRACeUE12FOfzpNdh2tTXe
        wC3+mTHNdC073+fvYuQ03YGMRTBAOhamvUJkrxJL9g==
X-Google-Smtp-Source: AA6agR6+XIck/mw2/xXcXiIMCskPM4UjDy9mMXNg+xODpTBkghjapXqW4g0z+ULl8GeHxGBAlviiQg4azrh96I5pTYk=
X-Received: by 2002:a05:6000:10cf:b0:228:df93:a9b1 with SMTP id
 b15-20020a05600010cf00b00228df93a9b1mr712220wrx.4.1662520373740; Tue, 06 Sep
 2022 20:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
 <20220831184408.2778264-3-ndesaulniers@google.com> <Yw+8QgtSbB2/3Eiq@dev-arch.thelio-3990X>
 <CAK7LNASQJ-B2kRGXea-dQt+1BgEsp_aLEPS_uJb1R6FSOj1Khg@mail.gmail.com>
In-Reply-To: <CAK7LNASQJ-B2kRGXea-dQt+1BgEsp_aLEPS_uJb1R6FSOj1Khg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 6 Sep 2022 20:12:42 -0700
Message-ID: <CAKwvOdnU5qBqOroEkjf=n-R_rpXxAVx2NhA2wKfasmOPTf6K6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 5, 2022 at 2:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Sep 1, 2022 at 4:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Aug 31, 2022 at 11:44:05AM -0700, Nick Desaulniers wrote:
> > > as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
> > > cause as-option to fail unexpectedly because clang will emit
> > > -Werror,-Wunused-command-line-argument for various -m and -f flags for
> > > assembler sources.
> >
> > Now that I am looking closer at it, where does that '-Werror' come from?
>
>
>
>
> The related commit is
> c3f0d0bc5b01ad90c45276952802455750444b4f
>
> The previous discussion with Arnd is
> https://lore.kernel.org/linux-kbuild/20170314213724.3836900-1-arnd@arndb.de/
>
>
>
>
>
> > For cc-option, we add it to elevate clang's warnings about unused '-f',
> > '-m', and '-W' flags to errors so that we do not add those flags.
> > However, I do not see '-Werror' in as-option. I am going to assume it
> > came from CONFIG_WERROR, as I believe Android has that turned on by
> > default.
>
>
> CONFIG_WERROR is added to CFLAGS.
> But, I guess it is more correct to do likewise for others.
> (https://patchwork.kernel.org/project/linux-kbuild/patch/20220905083619.672091-1-masahiroy@kernel.org/)
>
>
>
> > I think that is the real problem: without '-Werror', the only
> > error that should come from as-option is when an option isn't supported
> > by the assembler, as clang will still warn but those will not be fatal
> > but with '-Werror', those warnings turn fatal, causing all subsequent
> > as-option calls to fail.
>
>
>
> Presumably, it is correct to add -Werror to as-option as well.
> We have no reason to add it to cc-option, but not to as-option.
>
>
>
>
> I also believe '-x assembler' should be changed to
> '-x assembler-with-cpp'.
>
>
> As I mentioned somewhere before, our assembly code (*.S) is always
> preprocessed. There is no *.s file in the kernel source tree.
>
>
> So, '-x assembler-with-cpp' matches the real situation.

Should I do this for as-instr then as well? In the same patch?

>
>
> One interesting thing is, clang does not warn
> [-Wunused-command-line-argument] for *.S files.
>
>
>
>
> $ clang -fomit-frame-pointer -c -x assembler /dev/null -o /dev/null
> clang: warning: argument unused during compilation:
> '-fomit-frame-pointer' [-Wunused-command-line-argument]
>
> $ clang -fomit-frame-pointer -c -x assembler-with-cpp /dev/null -o /dev/null
>
>
>
> The root cause is we are using '-x assembler', which
> never happens in the kernel tree.
>
>
>
>
> To sum up, the code I think correct is:
>
>
> as-option = $(call try-run,\
>    $(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp
> /dev/null -o "$$TMP",$(1),$(2))

Does your recent patch affect this?
https://lore.kernel.org/linux-kbuild/20220905083619.672091-1-masahiroy@kernel.org/
If so, then I should not add -Werror as you suggest above?

-- 
Thanks,
~Nick Desaulniers
