Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54335449DD
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jun 2022 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241103AbiFILTo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jun 2022 07:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237068AbiFILTo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jun 2022 07:19:44 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471BB43ADA;
        Thu,  9 Jun 2022 04:19:41 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-189-245.tukw.qwest.net [174.21.189.245])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2904A198;
        Thu,  9 Jun 2022 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1654773581;
        bh=87JhSOwn/jQj5KOa8MFr0s31SBYNrnIWqNwkwVBp5R8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m7N1SkZL9ej0ZCV7+rwqlIPHKV2jYuavoQzaPH1tG/BlozB8hKdKe05hVVi2RrE6Z
         VZjdBWuEt57U7G2WOTtNTU/poZGjQzFkl/m/5uAhLGzJhMt+PeYUOvKvUikwAXBbB6
         oY//bae7YC7phUrm4+1eHEtEDPAfXQKXcwFsx4kA=
Date:   Thu, 9 Jun 2022 04:19:39 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kconfig: Add findconf script and helper program
Message-ID: <YqHXS4IVPqfxl5ob@hatter.bewilderbeest.net>
References: <20220608095456.27479-1-zev@bewilderbeest.net>
 <6d6d252d-79e9-4b4c-4a62-aa4018a6254c@infradead.org>
 <YqFtHfC59akYP9jB@hatter.bewilderbeest.net>
 <a4e7e2ce-8107-712c-1627-b3bb8646ed79@infradead.org>
 <CAK7LNARYnQyyQ-5MrH-7_c2HUM63UGuSJQNM5PAoaTaq-r1iug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNARYnQyyQ-5MrH-7_c2HUM63UGuSJQNM5PAoaTaq-r1iug@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 08, 2022 at 10:47:08PM PDT, Masahiro Yamada wrote:
>On Thu, Jun 9, 2022 at 12:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 6/8/22 20:46, Zev Weiss wrote:
>> > On Wed, Jun 08, 2022 at 07:48:44PM PDT, Randy Dunlap wrote:
>> >> Hi--
>> >>
>> >> On 6/8/22 02:54, Zev Weiss wrote:
>> >>> scripts/findconf provides menuconfig's search functionality as a
>> >>> standalone, non-interactive command, somewhat in the spirit of
>> >>> scripts/config.  It is meant to be useful for tasks like getting a
>> >>> quick overview of symbol dependencies or determining which Kconfig
>> >>> file to edit for a given symbol, without having to fire up one of the
>> >>> interactive config programs.
>> >>>
>> >>> It accepts a single command-line flag, '-v', which causes it to also
>> >>> print the help text of each matching result.
>> >>>
>> >>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> >>> ---
>> >>
>> >> I can see how this could be useful.
>> >> It's a little easier to use than what I currently do:
>> >>
>> >> $ findconfig  DRM_HISI_HIBMC
>> >> ./drivers/gpu/drm/hisilicon/hibmc/Kconfig:2:config DRM_HISI_HIBMC
>> >
>> > I'm guessing 'findconfig' here is some personal shell
>> > alias/function/script?  (I can't see any references to it in the kernel
>> > source tree.)
>> >
>>
>> Yes, it's just local.
>>
>> >>
>> >> then $EDITOR that_Kconfig_file
>> >>
>> >>
>> >> In testing, I am seeing this:
>> >>
>> >> #
>> >> # using defaults found in /boot/config-5.3.18-150300.59.63-default
>> >> #
>> >> .config:421:warning: symbol value 'm' invalid for I8K
>> >> .config:2335:warning: symbol value 'm' invalid for
>> >> MTD_NAND_ECC_SW_HAMMING
>> >> .config:2484:warning: symbol value 'm' invalid for PVPANIC
>> >> .config:8671:warning: symbol value 'm' invalid for INTERCONNECT
>> >> .config:9369:warning: symbol value 'm' invalid for
>> >> CRYPTO_ARCH_HAVE_LIB_BLAKE2S
>> >> .config:9370:warning: symbol value 'm' invalid for
>> >> CRYPTO_LIB_BLAKE2S_GENERIC
>> >> .config:9653:warning: symbol value '1' invalid for KASAN_STACK
>> >>
>> >
>> > This I assume is just due to the contents of your .config file relative
>> > to the current Kconfig definitions and not a problem with anything in
>> > this patch?
>>
>> There is no .config file in the linux/ source tree at the top level.
>> I use O=build_dir for all builds.
>>
>> >
>> >> How do I specify/choose a .config file to be used?
>> >>
>> >> Oh, use KCONFIG_CONFIG=filename
>> >>
>> >
>> > Ah, I guess that'd be a nice thing to add a flag for to the wrapper
>> > script -- I'll include that in v2.
>> >
>> >>
>> >> Please update (add) usage/help text in scripts/kconfig/Makefile.
>> >>
>> >
>> > Ack, will do.
>> >
>> >
>> > Thanks for the review!
>> >
>> >
>> > Zev
>> >
>
>
>
>
>
>
>
>
>Another idea might be to add the following to
>scripts/kconfig/Makefile:
>
>
>
>@@ -77,7 +76,13 @@ PHONY += $(simple-targets)
> $(simple-targets): $(obj)/conf
>        $(Q)$< $(silent) --$@ $(Kconfig)
>
>-PHONY += savedefconfig defconfig
>+PHONY += findconfig savedefconfig defconfig
>+
>+findconfig: $(obj)/conf
>+       $(Q)$< $(silent) --$@=$(KCONFIG_FIND) $(Kconfig)
>+
>+%_findconfig: $(obj)/conf
>+       $(Q)$< $(silent) --findconfig=$* $(Kconfig)
>
> savedefconfig: $(obj)/conf
>        $(Q)$< $(silent) --$@=defconfig $(Kconfig)
>
>
>
>
>
>Instead of adding a separate program for this,
>you can modify scripts/kconfig/conf.c
>
> - add 'findconfig' to enum input_mode
> - add 'findconfig' to long_opts[]
> - add 'case findconfig' to main() function
>
>
>
>Then, you can do
>
>$ make findconfig KCONFIG_FIND=DRM_HISI_HIBMC
>
>   or
>
>$ make DRM_HISI_HIBMC_findconfig
>
>  as a shorthand.
>
>
>scripts/findconf is unneeded
>but you can put your own script in ~/bin
>if you want to save your typing even more.
>

Hmm, interesting idea -- it seems a bit more awkward to use though, and 
if everyone who makes much use of it is likely to be writing their own 
little ad-hoc wrapper script anyway, it seems like we might as well do 
that once and check it in?

The current approach also provides support for multi-query searches, 
which while it isn't critical is slightly more convenient than running 
it multiple times or cramming everything into a single combined regex 
(analogous to grep's '-e' flag).

That said, if you and/or others have a strong preference for doing it 
via a make target I could rearrange it to work that way instead.


Thanks,
Zev

