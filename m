Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F675EE8B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Sep 2022 23:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiI1VyP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Sep 2022 17:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbiI1Vxx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Sep 2022 17:53:53 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56773B6564
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 14:53:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 8-20020a17090a0b8800b00205d8564b11so2782970pjr.5
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Sep 2022 14:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=d8AWbiSBxXrgrvwAoskxcicNPYKtAtvQ8eTNvx31A5tDj05HG3JYRAX8qf2vlcBFux
         Q1KTlPLAgoTxKVWu/nVzVOf7AiT7GTQhdNsUYqMxZ71hoxMdvb5Q9qsvn3yjzUg5VS4Z
         AeFBZtfNn12MoU7iIzQGkn5wjz+gaTpfVO1hEeE57+wJ12W7ze2a3aRKpnA8Lx9MTtIJ
         grbEUQMs3nxDSYRKy9B5Ov4jaMGgXhqeyepODAApSSchrz1BCHHbq4bwQtIzq5YjUq/5
         KGRlA9uTZis4skTF0coWa95GNfO6iWQbU6avtKMDiR8zb+dfBnXP+edrsxPOv/ezAxb2
         ZDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=YiA5XVD0iqFxzuseWn5Zg6qkWEMtBkQpYStpvJndcHBF5/AdTi6qvPjRvMFxWKR0L8
         ZCdhE3ZtU3Csec267rVrmvPT8VOHXUhQJ5haFMwiP3ojaZ0jEDq1SqE0Z7mg0IoMAkEE
         qRTpF9xHqCkjiVV2FIt+ROBICBBIbf2N9ej8VMq8Q4Rrt7tYegcuoQxIvXE4tTE0t9Tb
         kMnYNCG6qHLzIt7Gz9MMDkhQ+LAE4pj3SaWDPP2vYSxZB+IgPC24Y1uvckbjVgf6rtYx
         NbO//CkMFCaUtC2zjD+POgPszRH+Btc80sIQUv08CnzjPUviGcftUjM5coYGVCi748lY
         t+mA==
X-Gm-Message-State: ACrzQf0sU/RWxdm0eCkP0b8ttgX5fjERYRh1m1I2sHyz/jWj8T1pWXMi
        nyS/Wr6UMjN7f/p/8f1Qynhof0eB6CWm9hU7VHakCHs3lK0=
X-Google-Smtp-Source: AMsMyM6+V0RnFW83E4Yey5hPTG/WNDzcVaQZ9uZmK44iTcOwLQ3OpYQRTfUlegcvBrQLEHiPkA+P6skieEZazNbCnnA=
X-Received: by 2002:a17:90a:74c4:b0:203:336d:dd36 with SMTP id
 p4-20020a17090a74c400b00203336ddd36mr12421313pjl.107.1664402030259; Wed, 28
 Sep 2022 14:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org> <CAKwvOdmPLqX=oCwg43TYHj=tdoaU5OYc=bO906u=LeqcSrx+Dw@mail.gmail.com>
 <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
In-Reply-To: <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Sep 2022 14:53:38 -0700
Message-ID: <CAKwvOdk87wRWoiVjswZPwoLbSm+sYsMW6FHZv+r6MHxLHn0Trw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        llvm@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
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

On Wed, Sep 28, 2022 at 2:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Sep 28, 2022 at 02:13:47PM -0700, Nick Desaulniers wrote:
> > Reraising my concern from
> > https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1258678969
>
> Sorry, I thought I addressed your concern with my comment right below it
> but I probably should have worded it better.

No, I just missed your point about other architectures.

> > We've put a fair amount of work into getting CC=clang LLVM_IAS=0 to
> > work for DWARF v5 (both on the GNU binutils side, and Kbuild), I'd
> > hate to see that effectively knee-capped because of an issue in GNU
> > binutils that is only relevant for one architecture.
>
> Sure, that is a completely reasonable concern. However...
>
> > I'd concede support for ARCH=riscv, but not for all other
> > architectures, which this effectively does.
>
> No, it does not, CONFIG_AS_HAS_NON_CONST_LEB128 can still be enabled
> when GNU as supports this construct for a particular architecture; as
> far as I can tell, RISC-V is the only one that doesn't. See the tests
> with ARCH=arm64 and ARCH=x86_64 compared with ARCH=riscv below.

Ah, sorry for the noise then. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
