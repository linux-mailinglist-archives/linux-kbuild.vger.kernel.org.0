Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01323122A7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 12:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfLQLn7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 06:43:59 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:22056 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfLQLn6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 06:43:58 -0500
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xBHBhjNY012311
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Dec 2019 20:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xBHBhjNY012311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576583026;
        bh=+CiUHebBY6XaGeGmDIeJZgWV14xA98umEu315Dmi0+E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qL3hFBYytFbPsOaGClHuSWux4mCrjatkQHliuhU1a+KyOXtdzJ5cV/AbNUApUg0KQ
         PIjU1zsgg37xh421H/AGGIGTzBCPFm6oti1fe6YIO24SBExKXtOYCaoCctpP9g8oGa
         qnSPkPhsYAZpnDnWyxALgoZypOAtSpyHYRCCuL2vzza6AxS346j/yZ4mLIBfgKgpT3
         xqjW9dw6+f8Ty+RaRLKKu8VIe3CGhkcZRKmvNz8G8YvIPnwfEaVAaxa1Jny3BA8U8J
         8Ifbe+ZnE3kMiOuuqVWDfCQv3GpE0ffvou6h6KDJnm0C2losGzQlUnRID4677Mq80D
         tjXwIY90Zl7VQ==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id w20so3309149uap.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Dec 2019 03:43:46 -0800 (PST)
X-Gm-Message-State: APjAAAWgizuXzXxgS4J82E0oo06Xe6FFG5cNLIBxe+nWwuJ5zN53Urfa
        WzGDa9P8RCminhfuDn4akp2ouYVSQao+C5HhiBM=
X-Google-Smtp-Source: APXvYqy43GU2YYaKhwaO9JvJwES7JVdU7OPym1V4+aP+8cm2WdPH+Z79T9Ysj5kudhmH3OggiCOyfghHmPJHRL/jJY8=
X-Received: by 2002:ab0:63c7:: with SMTP id i7mr2559271uap.109.1576583025192;
 Tue, 17 Dec 2019 03:43:45 -0800 (PST)
MIME-Version: 1.0
References: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com> <1576486038-9899-15-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1576486038-9899-15-git-send-email-amit.kachhap@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Dec 2019 20:43:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATiz05-Rc5dFyy8k3cYNSAD_zmcB6XhQrNHgwt7fWy8Ag@mail.gmail.com>
Message-ID: <CAK7LNATiz05-Rc5dFyy8k3cYNSAD_zmcB6XhQrNHgwt7fWy8Ag@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] kconfig: Add support for 'as-option'
To:     Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <Mark.Brown@arm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 16, 2019 at 5:48 PM Amit Daniel Kachhap
<amit.kachhap@arm.com> wrote:
>
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> Currently kconfig does not have a feature that allows to detect if the
> used assembler supports a specific compilation option.
>
> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>
>         config X
>                 def_bool $(as-option,...)
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> ---

If you apply this to arm64 tree, just go ahead.
Acked-by: Masahiro Yamada <masahiroy@kernel.org>

But, please be aware of a possible merge conflict with:
https://patchwork.kernel.org/patch/11285929/




-- 
Best Regards
Masahiro Yamada
