Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6BF3EE3FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 03:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbhHQByH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 21:54:07 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48885 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbhHQByG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 21:54:06 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17H1rIlh027480;
        Tue, 17 Aug 2021 10:53:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17H1rIlh027480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629165199;
        bh=eL/WVeEBR/FnWeVKVtkdcXOLyNoqSrw6WbHUaaORvAQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EIxcxXc7MCcvFt3l1ILUKZT+FLI86nkJVtoZ2KgdFYasTmh7DgHi15i+c70cB0MIN
         4WHVEKkj4OckelCLXU5HbtlZL94YxH7wBz2ZCLCyxyW3uG6XptKuE+GO0TRVVfBm7E
         hX+gO+cJErfNG4nXwU2vUMc9P05Ipa6reoFyUqBwjszjzpy4ZzbzF4NQRkO4TE7JSm
         9Q7L2sSdx9/hhrr15lG/VmyM7m1vbhl8A4s/GJ91XZnqDZK2MAvN4n4zmJ9j3EjdKR
         d5HrVf/+TQLyGoLQclacEoG6kNj86GOu7pYTW+98PKVMmXGokio5ZKF+uQfKI1BoMa
         xAdWrTrhmwE8Q==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id l11so22909206plk.6;
        Mon, 16 Aug 2021 18:53:19 -0700 (PDT)
X-Gm-Message-State: AOAM533QqFXI9Vo2028NqtDbITsJL99q+P5RHo3ofMSzBxR9kyspZR5i
        kJbYFeRWT2N+dRMKaBbdsZjsrhySza7UMZZgaRM=
X-Google-Smtp-Source: ABdhPJy5roy71m1LbHYtFUp1Ob36NLO4Gpi3UM9GGH9DF+v6bcVAzqcBetPJ0WNnCQqbVm5ASSLLDMqbn4S2ORWNho0=
X-Received: by 2002:a17:90a:9314:: with SMTP id p20mr972823pjo.87.1629165198439;
 Mon, 16 Aug 2021 18:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210816203635.53864-1-nathan@kernel.org> <20210816205246.57208-1-nathan@kernel.org>
In-Reply-To: <20210816205246.57208-1-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Aug 2021 10:52:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyp0rp9VNAfyRbj=dWRM6+T7EFE0r-0E6H+=qF+Q4UEA@mail.gmail.com>
Message-ID: <CAK7LNAQyp0rp9VNAfyRbj=dWRM6+T7EFE0r-0E6H+=qF+Q4UEA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Switch to 'f' variants of integrated assembler flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 5:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It has been brought up a few times in various code reviews that clang
> 3.5 introduced -f{,no-}integrated-as as the preferred way to enable and
> disable the integrated assembler, mentioning that -{no-,}integrated-as
> are now considered legacy flags.
>
> Switch the kernel over to using those variants in case there is ever a
> time where clang decides to remove the non-'f' variants of the flag.
>
> Also, fix a typo in a comment ("intergrated" -> "integrated").
>
> Link: https://releases.llvm.org/3.5.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---


Applied to linux-kbuild.
Thanks.



-- 
Best Regards
Masahiro Yamada
