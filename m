Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C34A723618
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 06:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjFFELQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 00:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjFFELP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 00:11:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20819187
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Jun 2023 21:11:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AA61262CBB
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 04:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6A4C433EF
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686024673;
        bh=OjvR/UjT50sMGtC7c7T0e0zhNqBqNKz1w4KJzUfilx0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iqExv7rFbPeQjK3QwVuDYfS4CU2Yu/Zbi2vP7ukhv+PRFQ0mnxq6QPsxK1CbpLwbC
         npU5TXqxAIRNLESihyF/U5zdsUb2PyrCFKsERQT2OUu8XymwLQofjhOsLwAXCSYYm4
         EckelHWvMTFwAOH9FtGYrMOolJwRhdm+D/Xx3KN6TY5aK+3AJEK3F88n2kqCmmvCFb
         343wV45Bc3uUGM8xo9IKfMYoE0ct0AGwN6jrICdyc4rSjSZAyDz5cuKqXArmHqOz8F
         TnRnEelnKlhlsWjf3RgRO5VCIy3lec6WZw6lJDNhbwz52X+7fcwKf+ovOOZizYlWQc
         W0apWN4ZdRXfQ==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-55564892accso3841071eaf.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Jun 2023 21:11:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDxqbarnAP2Hemzl/LBS8k63HttWzHqP/BPv4wUrtPI0ACtVb3L4
        bCGT7Z49/xHIvOgtO06tLwHhclRWkwsWQSsUfoo=
X-Google-Smtp-Source: ACHHUZ7066Pz5pqcFI0rEBvXqjWX+NuIj1Oh7X5N3R6LCVry6TkfUR+grG56jdrEQXeX5MBB2dR7ajsXo/r8mnPmzUY=
X-Received: by 2002:a05:6820:811:b0:555:722e:3ce with SMTP id
 bg17-20020a056820081100b00555722e03cemr718001oob.9.1686024672318; Mon, 05 Jun
 2023 21:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
 <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com> <3865ca44.2742b.18870dca8df.Coremail.sunying@nj.iscas.ac.cn>
In-Reply-To: <3865ca44.2742b.18870dca8df.Coremail.sunying@nj.iscas.ac.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Jun 2023 13:10:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFGEuo5oXT6=EYp7Fycs3SOw4hSCT8tRSxDiEbhNa+uQ@mail.gmail.com>
Message-ID: <CAK7LNARFGEuo5oXT6=EYp7Fycs3SOw4hSCT8tRSxDiEbhNa+uQ@mail.gmail.com>
Subject: Re: Re: Suggestion: Improve the dependency information during Kconfig compilation
To:     sunying@nj.iscas.ac.cn
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 31, 2023 at 5:11=E2=80=AFPM <sunying@nj.iscas.ac.cn> wrote:
>
> On Sat, May 20, 2023 at 1:21=E2=80=AFPM <masahiroy@kernel.org> wrote:
> &gt;
> &gt; On Thu, May 18, 2023 at 4:13=E2=80=AFPM <sunying@nj.iscas.ac.cn> wro=
te:
> &gt; &gt;
> &gt; &gt; Hi,
> &gt; &gt;
> &gt; &gt;
> &gt; &gt; We found that the Kconfig build system silently changes invalid=
 values in the. config file,
> &gt; &gt; which may prevent users from getting their desired kernel, and =
also make it hard to know
> &gt; &gt; which configuration option caused the forced change based on th=
e compilation information.
> &gt; &gt;
> &gt; &gt; There are similar questions on stack overflow, where people fin=
d it difficult to get
> &gt; &gt; the complete dependency chain and other information=EF=BC=9A
> &gt; &gt;
> &gt; &gt;   ex1. How can I disable CONFIG_PM when building Linux kernel f=
or x86_64 - Stack Overflow
> &gt; &gt;   https://stackoverflow.com/questions/64499221/how-can-i-disabl=
e-config-pm-when-building-linux-kernel-for-x86-64/64501647#64501647
> &gt; &gt;
> &gt; &gt;   ex2. c - kernel symbol enabled but doesn't shows up in .confi=
g - Stack Overflow
> &gt; &gt;   https://stackoverflow.com/questions/24074116/kernel-symbol-en=
abled-but-doesnt-shows-up-in-config)
> &gt; &gt;
> &gt; &gt;   ex3. makefile - update menuconfig entries without recompiling=
 all the kernel - Stack Overflow
> &gt; &gt;   https://stackoverflow.com/questions/71075113/update-menuconfi=
g-entries-without-recompiling-all-the-kernel
> &gt; &gt;
> &gt; &gt;   ex4. linux - disabling CONFIG_NET_DMA - Stack Overflow
> &gt; &gt;   https://stackoverflow.com/questions/30794576/disabling-config=
-net-dma/30796820#30796820
> &gt; &gt;
> &gt; &gt; We plan to optimize the conf_read() function in /scripts/kconfi=
g/confdata.c,
> &gt; &gt; and add information for the mismatched configuration options to=
 help users get the desired Linux kernel.
> &gt; &gt; Do you think it's necessary? Any suggestions?
> &gt; &gt;
> &gt;
> &gt;
> &gt; It may be helpful.
> &gt; I do not know if such warnings should be turned on by default,
> &gt; or under some verbose mode, though.
> &gt;
>
>
> Can we reuse "KBUILD_VERBOSE" switch to print more warning?
> By default, a message is added as follows only when invalid values in .co=
nfig are detected:
>     "warning: values in .config are forcibly modified to meet the kconfig=
 dependency constraints.
> For more information, enable the environment variable 'export KBUILD_VERB=
OSE=3D1'."
>
> In verbose mode, print invalid configuration options one by one, includin=
g error causes and current values,
> to help users correct them. For example, in the case of ex1. above, we ca=
n prompt with the following message:
>     "file:line: warning: 'CONFIG_PM' reverse select error, due to 'CONFIG=
_PM_SLEEO' is set to 'y'."
>
> Do you think this would work? Can we modify it in this way?


I prefer a separate option (e.g. "KCONFIG_*")
because KBUILD_VERBOSE=3D1 is a different class of verbosity.

And, I'd like to keep it quiet by default (current behavior).



>
>
> &gt; &gt; Best regards,
> &gt; &gt; Siyuan Guo
> &gt; &gt; Ying Sun
> &gt; &gt;
> &gt; &gt;
> &gt;
> &gt;
> &gt; --
> &gt; Best Regards
> &gt; Masahiro Yamada
>
>
> --
> Best regards,
> Siyuan Guo
> Ying Sun
> </sunying@nj.iscas.ac.cn></masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada
