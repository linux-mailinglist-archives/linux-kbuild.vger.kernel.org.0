Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643CA73197F
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jun 2023 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbjFONDZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 09:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjFONDY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 09:03:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90245196
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 06:03:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B7F561A97
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 13:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8104BC433C8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686834202;
        bh=bRvh/zn2vtgTyvubRlhy+wYV05B2UzinMuPea6AjqwE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JZNt2mISiGchsbdKehfZOIiwyAfGwlE1aU08gqLKtcUrHXTRkfLEnBGMbFrEPTy+k
         +/r5B2HmayaX4HTvZzt6//F+PPylABA7XMGgxvT/CGSq1VbjyaItY4A6glTgIGKO51
         YIEvMN7GxrStTy/sbk2MtfA5GrOASd8lVGBgEFMo3A4i4YtN372TWmIivCJBsAjIgq
         X97A68/YTUFiHKXsmNlHKpf2KT1YK5skBCG/gus/zX6/zW3r2YOXqORpc/5sSFh3b1
         naXgTVyONNLenysj53kaqHmLAGGaCFb7Y67Qq9y7y2Ohw94C6qHUD3gEh+GH70PnQl
         jma7V4ScLT+Kw==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1a5229df1f2so5883984fac.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 06:03:22 -0700 (PDT)
X-Gm-Message-State: AC+VfDzYGKnj4/E5gXNgApZAfvGYCUE7l3mWpiEq8JVuwnPZdeae1/Dt
        hKZoe7dxqS6G9wiMwt44j1Y4mGLUAnDEJY2Ih+Q=
X-Google-Smtp-Source: ACHHUZ6POuBrvWx6DrC3O4NS8EyJECXcJ/4RujQKy2XVAYUTsOjgYT7+G31yLxNU3NbavdHTxIJJfSo9yIA1RC4ZOlU=
X-Received: by 2002:a05:6870:7401:b0:1a2:c149:99c7 with SMTP id
 x1-20020a056870740100b001a2c14999c7mr12256314oam.11.1686834201711; Thu, 15
 Jun 2023 06:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
 <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com>
 <3865ca44.2742b.18870dca8df.Coremail.sunying@nj.iscas.ac.cn>
 <CAK7LNARFGEuo5oXT6=EYp7Fycs3SOw4hSCT8tRSxDiEbhNa+uQ@mail.gmail.com> <3b2ebf53.22a5.188ad14a0cb.Coremail.sunying@nj.iscas.ac.cn>
In-Reply-To: <3b2ebf53.22a5.188ad14a0cb.Coremail.sunying@nj.iscas.ac.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Jun 2023 22:02:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS57=Z7hM8t+NHHXyBM0L7_g0J=EYTWYQ4xQb1YBTCNGw@mail.gmail.com>
Message-ID: <CAK7LNAS57=Z7hM8t+NHHXyBM0L7_g0J=EYTWYQ4xQb1YBTCNGw@mail.gmail.com>
Subject: Re: Re: Re: Suggestion: Improve the dependency information during
 Kconfig compilation
To:     sunying@nj.iscas.ac.cn
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 12, 2023 at 9:57=E2=80=AFAM <sunying@nj.iscas.ac.cn> wrote:
>
> On Tue, June 6, 2023 at 12:10 AM <masahiroy@kernel.org> wrote:
> >
> > On Wed, May 31, 2023 at 5:11=E2=80=AFPM <sunying@nj.iscas.ac.cn> wrote:
> > >
> > > On Sat, May 20, 2023 at 1:21=E2=80=AFPM <masahiroy@kernel.org> wrote:
> > > >
> > > > On Thu, May 18, 2023 at 4:13=E2=80=AFPM <sunying@nj.iscas.ac.cn> wr=
ote:
> > > > >
> > > > > Hi,
> > > > >
> > > > >
> > > > > We found that the Kconfig build system silently changes invalid v=
alues in the. config file,
> > > > > which may prevent users from getting their desired kernel, and al=
so make it hard to know
> > > > > which configuration option caused the forced change based on the =
compilation information.
> > > > >
> > > > > There are similar questions on stack overflow, where people find =
it difficult to get
> > > > > the complete dependency chain and other information=EF=BC=9A
> > > > >
> > > > >   ex1. How can I disable CONFIG_PM when building Linux kernel for=
 x86_64 - Stack Overflow
> > > > >   https://stackoverflow.com/questions/64499221/how-can-i-disable-=
config-pm-when-building-linux-kernel-for-x86-64/64501647#64501647
> > > > >
> > > > >   ex2. c - kernel symbol enabled but doesn't shows up in .config =
- Stack Overflow
> > > > >   https://stackoverflow.com/questions/24074116/kernel-symbol-enab=
led-but-doesnt-shows-up-in-config)
> > > > >
> > > > >   ex3. makefile - update menuconfig entries without recompiling a=
ll the kernel - Stack Overflow
> > > > >   https://stackoverflow.com/questions/71075113/update-menuconfig-=
entries-without-recompiling-all-the-kernel
> > > > >
> > > > >   ex4. linux - disabling CONFIG_NET_DMA - Stack Overflow
> > > > >   https://stackoverflow.com/questions/30794576/disabling-config-n=
et-dma/30796820#30796820
> > > > >
> > > > > We plan to optimize the conf_read() function in /scripts/kconfig/=
confdata.c,
> > > > > and add information for the mismatched configuration options to h=
elp users get the desired Linux kernel.
> > > > > Do you think it's necessary? Any suggestions?
> > > > >
> > > >
> > > >
> > > > It may be helpful.
> > > > I do not know if such warnings should be turned on by default,
> > > > or under some verbose mode, though.
> > > >
> > >
> > >
> > > Can we reuse "KBUILD_VERBOSE" switch to print more warning?
> > > By default, a message is added as follows only when invalid values in=
 .config are detected:
> > >     "warning: values in .config are forcibly modified to meet the kco=
nfig dependency constraints.
> > > For more information, enable the environment variable 'export KBUILD_=
VERBOSE=3D1'."
> > >
> > > In verbose mode, print invalid configuration options one by one, incl=
uding error causes and current values,
> > > to help users correct them. For example, in the case of ex1. above, w=
e can prompt with the following message:
> > >     "file:line: warning: 'CONFIG_PM' reverse select error, due to 'CO=
NFIG_PM_SLEEO' is set to 'y'."
> > >
> > > Do you think this would work? Can we modify it in this way?
> >
> >
> > I prefer a separate option (e.g. "KCONFIG_*")
> > because KBUILD_VERBOSE=3D1 is a different class of verbosity.
> >
> > And, I'd like to keep it quiet by default (current behavior).
> >
> >
> >
> >
> >
>
> Thank you for your reply and suggestions.
>
> By default, the current behavior is not changed.
> Detailed error messages are printed only when the separate option is turn=
ed on.
> We are considering naming the option as "KCONFIG_VERBOSE" or "KCONFIG_WAR=
NING" or
> "KCONFIG_DEBUG". Which do you think is more appropriate?


I think KCONFIG_VERBOSE is fine.


Thanks.







--=20
Best Regards
Masahiro Yamada
