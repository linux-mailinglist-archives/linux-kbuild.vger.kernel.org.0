Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2398260B6A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Oct 2022 21:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbiJXTHB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Oct 2022 15:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbiJXTG2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2022 15:06:28 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D854EF04
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:45:34 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id r18so9234770pgr.12
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnac3jXX+DqSJpyd7IS9wnKftHu0DkEkt46zBI0n+Aw=;
        b=bJVaxrjh52Jj/A1DMgeGWw1oKPweEw9UOXvf8EFTwvA8D8ugu6rBHlnGtm1bIlw5PQ
         l5OqDfGhvvEFh9Re8EPN7e71ep9rcuQhp61yWM5VLIpY/WrRP4Ffc7AI3lz72h+brjlK
         sJ5WzwCMqPn9AgRwnQB7v+5zG8eJd8kzuwXkBqJ4WLUKYZ4bEot4vmqMLBysqNVxA8OG
         Xar7QdDpDvl5I9eci8QDGnt1xqpgDZXaZlZt/jFHkTJclTFbwpwSXDQQBlQWZcf1U3Cz
         o52ckA0VQDgR01zMqQo72Me9QmKCfQMHbrcLVRwo6iYzvA9EJ3a5OInY9nHPaP0zolVh
         JnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dnac3jXX+DqSJpyd7IS9wnKftHu0DkEkt46zBI0n+Aw=;
        b=BNdWMuq3PAU+Hidw9gYZhNg3IDoBWMNJ8jSXhofuQDRYnc9nyoGarRUm1j8IheCKOG
         tvwDPIlrhVGncAmsUENjXTUGbx4D4kwMZObFEmaxx7kkEKx44V37G690QhCCWpY6ZQSR
         kp6FXRFMAIz6larcrOwlsJr12LgfaGhdh5HhWBTZZ/iHJl/D/N3BJlnG/TJzbIrq2o1y
         Ja/r3jUfCDqQ47l5YOIVfAtWuF/X+tf6ffHz/diQ2AhRv6cuNXKBLpn327VbaEP3pusn
         Op5AE4KoDIQsQw5n7znsxBgamJrn4dBT0IYVbwkNHpyoqB2ClL2ZzvT6kfw0l4Dy1Ncl
         wavQ==
X-Gm-Message-State: ACrzQf3KMgvpzDtVeXJPeXTaFldlrs1eWLBIJAe+z4zBmImYFJ3HucZB
        jBL+JxRYWbdSdSZMXIi28QPoqX+msG70uHVE6LPcQA==
X-Google-Smtp-Source: AMsMyM5OmVKaEIX2SFRXTaxdaKI2h3ZroD0njIyHv9e6KBWKaKXFjsqz3VOQNkRnNC6MsqlhX0Ip2prNgANFiIHRh3I=
X-Received: by 2002:a63:689:0:b0:46e:be81:566c with SMTP id
 131-20020a630689000000b0046ebe81566cmr15181143pgg.403.1666633465524; Mon, 24
 Oct 2022 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175655.1660864-1-ndesaulniers@google.com>
 <Y1GV9sHyODVmBbFW@dev-arch.thelio-3990X> <CA+icZUW2tFR=xjJEXJDNARW1yd_vjOOA1etF6aMN3Cx5ReFgmg@mail.gmail.com>
In-Reply-To: <CA+icZUW2tFR=xjJEXJDNARW1yd_vjOOA1etF6aMN3Cx5ReFgmg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 24 Oct 2022 10:44:13 -0700
Message-ID: <CAKwvOdn_mP8kVn5Bhe7bbC8R+VZxr8h02yWwKhvaTHW40ZJ_Uw@mail.gmail.com>
Subject: Re: [PATCH] Makefile.debug: support for -gz=zstd
To:     sedat.dilek@gmail.com, Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Sedat Dilek <sedat.dilek@dhl.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Terrell <terrelln@fb.com>, Tom Rix <trix@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        David Gow <davidgow@google.com>,
        Kees Cook <keescook@chromium.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Isabella Basso <isabbasso@riseup.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 23, 2022 at 8:46 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Oct 20, 2022 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Oct 20, 2022 at 10:56:49AM -0700, Nick Desaulniers wrote:
> > > +config DEBUG_INFO_UNCOMPRESSED
> > > +     bool "Don't compress debug information"
> > > +     help
> > > +       Don't compress debug info sections.
> > > +
> > >  config DEBUG_INFO_COMPRESSED
>
> Also, I prefer...
>
> DEBUG_INFO_COMPRESSED_NONE
> DEBUG_INFO_COMPRESSED_ZLIB
> DEBUG_INFO_COMPRESSED_ZSTD
>
> Following...
>
> $ ld.lld-16 -v
> Debian LLD 16.0.0 (compatible with GNU linkers)
>
> $ ld.lld-16 --help | grep compress-debug-sections
>  --compress-debug-sections=[none,zlib,zstd]

It's a good suggestion, though I deliberately did not modify the
identifier used for the existing DEBUG_INFO_COMPRESSED.  No defconfigs
set DEBUG_INFO_COMPRESSED explicitly, but I think one issue with
changing the identifier of existing kconfigs is that upon upgrading to
newer kernel sources, if you run `make oldmodconfig` if you previously
had DEBUG_INFO_COMPRESSED=y, kconfig doesn't know that that option has
been renamed to DEBUG_INFO_COMPRESSED_ZLIB so it would be silently
disabled, and image sizes would increase due to uncompressed debug
info. That seems developer hostile.

Masahiro, what are your thoughts on how to proceed? Should I change
the pre-existing Kconfig identifier, or "let sleeping dogs lie?"
-- 
Thanks,
~Nick Desaulniers
