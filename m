Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92AED3464D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 17:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhCWQUW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 12:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhCWQUN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 12:20:13 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2276FC061763
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 09:20:13 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id a15so9679777vsi.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LPlOxyxKGimlLzO5bR0NAP5TDBYa4AWRGxw3mAP/fM=;
        b=faUUSgVejihoVBPrj3v8oQ7Jwv1QWj5rtYVjTXD6eWH7buY2EvbzsJ/B2naG9UoEnq
         jaX0JXHuwPpJIC7EWLeuSIO7Mm1EbqlEeAVcVG6ijBbfuXWjTrlKifYPQN1QfFdtfoS/
         zIxWi+Lq0S0XKfkq2VyyHuVermLB/BqAPssHmadNL1uIyadfsflULd8JIhfYAWsroDgH
         q7EDhNaNmICWVYSrO72ZhYR7IRYlk37G2wZzRO44bqSyzaj/3fjeqzW/DD+EubtpTspH
         OM6GB2RqLtR9ium8W/RaYF004RaJZ3rbiRvOfOvCRfAzcYsbrdoa6fUGVdeUyoj/Tw10
         fzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LPlOxyxKGimlLzO5bR0NAP5TDBYa4AWRGxw3mAP/fM=;
        b=GgcmeCo45YApw6VN7uFT36F/QR5IHch2HZeP+jdoCUWbed8R2WT7KvircdmX8ut0Lt
         leeXY4gUQRiyVifD2xmnSNPFFnZqlHuW/QRoNdPDNPrlWpqJKy0Ew9p3bdtT1E7DtFh3
         TXPKAWnvezQe4wiN1apMWi13S1W6bwf7UflhW2MjVPr5utyskJVHCC4AVa42L0xNAApp
         78zI/fhUvp5dr21dB6jdA2fyGbanhIOm7nWcNrYru2oA7Xwd2MxSb61sFn2BskzBFAHm
         +xSmo1f1Ie7xG1sjRPV7s71cPF8pftRt1T8YLQcc0Q/Zuyq+hQEnR9yOBmiLaFy4y8de
         m4Mw==
X-Gm-Message-State: AOAM530GZoL2hXMg3ufKxiECR+JoXrkCnwMfuK80uaWiTf0WEV6wCSCS
        Zmhj5rMUjuot/EFqjdfyhfXdc5CpTlU4kCaueeWhuQ==
X-Google-Smtp-Source: ABdhPJwT/MCMwyH0Deiy0nVWLV1tr2Xs2mRDuIU2Q+9dn2v7Q0w3Z3oMXQyV4ZAj83g07sqlrbDFBUDWsOLlxoC/9mk=
X-Received: by 2002:a67:641:: with SMTP id 62mr4114316vsg.23.1616516409719;
 Tue, 23 Mar 2021 09:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322234438.502582-1-seanjc@google.com>
In-Reply-To: <20210322234438.502582-1-seanjc@google.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 23 Mar 2021 09:19:57 -0700
Message-ID: <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
To:     Sean Christopherson <seanjc@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Merge module sections only when using Clang LTO.  With gcc-10, merging
> sections does not appear to update the symbol tables for the module,
> e.g. 'readelf -s' shows the value that a symbol would have had, if
> sections were not merged.

I'm fine with limiting this to LTO only, but it would be helpful to
understand which sections are actually getting merged here. Are you
compiling the kernel with -ffunction-sections and/or -fdata-sections?
Does this issue only happen with gcc 10?

Sami
