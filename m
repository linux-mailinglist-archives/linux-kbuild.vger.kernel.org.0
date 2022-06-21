Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A8A553646
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jun 2022 17:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351927AbiFUPiA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jun 2022 11:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352920AbiFUPhp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jun 2022 11:37:45 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFEE2BB05
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2022 08:37:44 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2ef5380669cso134827437b3.9
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2022 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNomwlsDfqU5poOBT4be6sMDFMnq8kqupfgjKPBSl0o=;
        b=Qt4+GtYLdrDWQ6a5jl3LLOu8so+RPUk0wXjzmyqo52tVhlMHxh+jHNFbD0VR2STZ4K
         5Kj+4Vv9NJyGdkpnEeEXy4dYLuU05zKinvDfx8L62t/nGOK7pk1Bb8nPm9gD3PWmCzB+
         0FsTPU9LLC+vH9Ahtgte4BU6/x5GtcPAioWD/CA5Kw9kAdi7S6uhutiYCMu9N0ohluZ3
         xYnZ/jjuUSLbzzkcZ4iY420a6fi0MZTYxsamgxpanWk8sGUMvDQu7WphHBxiNpbkI0FZ
         svL5BHCVyM70iTmWazyMHlSzSg6z3CND1vVS5DIaHVUVVdEGMhYYjHHg0/En+btpU/PN
         ionQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNomwlsDfqU5poOBT4be6sMDFMnq8kqupfgjKPBSl0o=;
        b=cqnmdCZrYAmZYSSWZOaSLSlrVCkforZly0SuU73AhgE/l/gOHxwu9arNX+NCAlNa0U
         H15rngYdelfpxEAjRU6xX1TBj80ZMqr80lvKhUyaIkNeSDD+X4SxyGjr92bmQAnvZeey
         H1MlToqgEfiJK2pZoz9gScC2wmzkGCQ6zq6gIWpugGf+1oT1jf0Gpq3vrjqMVVARPOXf
         RwnIdCACm09MQjPfRrbQFivF6e9tq/znawdn1/xgmm2kILGI0l7EE0ftvJZoLiKfJlva
         OZskz37oWJvF5w+14nDMhnNtlnLgzTPDgqAvyfqTw4DcsMy+me3vkrGgRTTWs56JceDJ
         4EEQ==
X-Gm-Message-State: AJIora/75ypvXVlQ1W1tY0ayKlmcjnDLGDwqnXHqLirdNIjEQbrsN1k5
        r3lZACj0n3xE9OYesazczMXmfCqtpSwDdcaNpE5dOQ==
X-Google-Smtp-Source: AGRyM1vYstW9b2v9MIEqueYX9u9xiZGFjBQFAh/JjmmuCtc+6VDOyY89kLRdUecjQlJnAPWr+psfhcWdOT9gqpPorWw=
X-Received: by 2002:a81:100d:0:b0:317:a2a8:833d with SMTP id
 13-20020a81100d000000b00317a2a8833dmr18684737ywq.69.1655825863727; Tue, 21
 Jun 2022 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220616195759.3214538-1-samitolvanen@google.com> <CAK7LNARAAdWPxaMWawQf5Y4kYJ065OMtvrnUaHkjCquL_BZYYQ@mail.gmail.com>
In-Reply-To: <CAK7LNARAAdWPxaMWawQf5Y4kYJ065OMtvrnUaHkjCquL_BZYYQ@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 21 Jun 2022 08:37:07 -0700
Message-ID: <CABCJKudwqKOGfE0Ha9b8DXaZ23bvKk+DhdVbJHoLneV5zJaZzQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Ignore __this_module in gen_autoksyms.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <alobakin@pm.me>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Steve Muckle <smuckle@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Sat, Jun 18, 2022 at 4:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jun 17, 2022 at 4:58 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Module object files can contain an undefined reference to __this_module,
> > which isn't resolved until we link the final .ko. The kernel doesn't
> > export this symbol, so ignore it in gen_autoksyms.sh.
>
> OK, I understand these two sentences.
>
> > This avoids an
> > unnecessary vmlinux rebuild with UNUSED_KSYMS_WHITELIST when we have a
> > symbol list that already contains all the module dependencies.
> >
>
> I do not understand how this can happen.
>
>
> Can you provide me steps to reproduce it?

This issue only happens when we have a whitelist that already contains
all the symbols we need to export. As autoksyms.h contains all the
necessary symbols in the initial vmlinux build, there should be no
need to link vmlinux again. However, as the code is looking at
undefined symbols in module .o files before __this_module is resolved,
adjust_autoksyms.sh thinks that __this_module is still missing and
triggers a rebuild, without actually changing anything.

I suspect this isn't a common situation, but it does happen when
building Android kernels, which specify a complete list of exported
symbols. Linking vmlinux.o takes a while with LTO and we would like to
avoid performing this step more than once.

Sami
