Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 511274C96A0
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 21:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238291AbiCAUZQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 15:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238538AbiCAUXV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 15:23:21 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3391A251A
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 12:20:37 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so28940905lfb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 12:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=K7n4eVxkkqxw4LVOCYp6qjz4Lrn8nUG8scqpDLjNdEqFXZMud6qwqiSVAz5st7Yg7d
         vC2q3Dqvtvzi4XIPeFoMoc2+dMBhZ16QOgzUWOKknYeZr7LRcjqzvrH7Gver9/sEKKQs
         f6/zgOwraRIJv6M9/T7aFKvmQFpJdJkC/c588=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=l/hUi9Yf1nChms6qnwH2pIfvukAsmtm4RQ1ZgGdgGqBIckcrVeZxHW9zaab+iguKc/
         5950v2bwBs2C1f4RABGNMc96lddlZfwCp7CyZp4NPUkUfZbxcCkcG8xvlZHrzJLvkhzE
         wfE8KWoqGnJzLzkUJ/tNM7136SgJWktdUNcG70SRTBQyFYywYOWeEeHFUpFTxz5WZ0nw
         rwteUq4XtfOr6fl17IvaDzoYi1+4upXc/IcJfknVpA+9iyZ6zpaiepRgqA06MQiw5rDq
         6GXkbiy/kGTjfP0iRMwnsMzNRGCpa3hZ2wuxPgvi4om8ersNnVyG6V/fN+INMWVGXE8B
         lBuQ==
X-Gm-Message-State: AOAM533FXANIikVxpxRwiRsDOAD1Khr69l5DCUSrY50GwA++AsjJaqSX
        RBwz7G6Pt1mX03uvz4cNZSau/aSn8zsLODrW5MQ=
X-Google-Smtp-Source: ABdhPJzFYlhlVdpD4IJCij/y8NJeNSG1OTXGC5GEDA8tu4J/vgbvy8u5a5qxE04HaIuCPYPrOghm3A==
X-Received: by 2002:ac2:57cf:0:b0:439:94e:7c4a with SMTP id k15-20020ac257cf000000b00439094e7c4amr16644771lfo.23.1646166028108;
        Tue, 01 Mar 2022 12:20:28 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id l26-20020a2e701a000000b002463f024de9sm2151086ljc.110.2022.03.01.12.20.26
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 12:20:26 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id l12so11540126ljh.12
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 12:20:26 -0800 (PST)
X-Received: by 2002:a2e:aa1f:0:b0:244:c2ea:7f20 with SMTP id
 bf31-20020a2eaa1f000000b00244c2ea7f20mr18277669ljb.164.1646166026459; Tue, 01
 Mar 2022 12:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com> <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
In-Reply-To: <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 12:20:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 1, 2022 at 12:06 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> That said, there's a few additional places that reset KBUILD_CFLAGS.

Yeah, the boot code and vdso code often sets its own private flags,
because it's _so_ different.

The generic kernel CFLAGS often don't work at all, because that code
may be doing some truly horrendous things.

So I agree that this may not catch all the kernel code, but I don't
think it's much of a problem.

             Linus
