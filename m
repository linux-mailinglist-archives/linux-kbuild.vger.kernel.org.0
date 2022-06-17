Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5DA54FCD0
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jun 2022 20:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237721AbiFQSO4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jun 2022 14:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237384AbiFQSOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jun 2022 14:14:55 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B289513FBA
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jun 2022 11:14:54 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id o21so1753652uat.6
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jun 2022 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sIEAK66uF4B5e7pJ+nU+n3T6LF4OnfLjyiO3Rsbq+aY=;
        b=qrEixrWbRWmJWXA1nsDRXFZdAjJ84cC1B/zdoUw6B93LbjqUSEHl/jWUe5uiYSO5jt
         vgJvW4XM1vvDWFqXRv/hQ5RS4+3uFVlM3iOUlBDkwWCRa3/qiAOn+q3wHQMH0V2VkhOx
         VYVH2wl+i6RnlS7bw3bQAr25YerYEyT5VQMEqPCAtSwlaxwDg/zyfrgrcUVKKipKejad
         vc9+jcTqy3uDXBvZK69oUCum7Vhtr8pCT04B55Fod9RrrMBHhH0WYkZqz90xgGcqGPdK
         1bKmH3IoUqwRSTSZLHMmZKqoBvkk7x6sySjpnIAVJWumEslZLoGz/L2rgyghatfxzfU2
         U4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sIEAK66uF4B5e7pJ+nU+n3T6LF4OnfLjyiO3Rsbq+aY=;
        b=ZyizMeMtOkLC58ExTY90XjQRLF+/6nTKuUiS3vFkicHk12pmOzTp7XKQpKP9fh5/PR
         dA90ZM6eMxLXYF9QKluKkFHgFtzyDf7b7NnPmFgc5DanbguiXBaKApeyXRJ+6t/d4/nR
         5cd/3eovOfLTxX5HDpRn8lqkngS2EP0PMcMHi0m5ZXJ/GVU2ifVp0vaUu5fRX3frTJWP
         wrgkv5V7fY8KY9rrPhxgA9YwGlCfMQMOPZcFTzoPtJ6eLe7Qu5Nb+jdJJwpo0BijRSHq
         xECisM4vw+sscTcu1CUMWWBpebMCj/ZGuJ7SdelD2XYtD4OF3jAxwDN/FK63OAdX155J
         xjaQ==
X-Gm-Message-State: AJIora/pvd8UDLb2oxujVSOrVUZ5fkC92B0mW1zVNg10cqGcVdZtiFwu
        j9oMHtbKX6rec3nrrqtSsYzzZ5DV8iCQDjowTArfaw==
X-Google-Smtp-Source: AGRyM1tELyDu0ySYNUSlQ6O9dDzcNcsCCKWPYTlYCS5LfPjTM7ZqQ/s5TR8hBE8f3dM1Ccbkzzc2nVKEj2f4XNuyGQA=
X-Received: by 2002:ab0:2311:0:b0:37f:6d6:8822 with SMTP id
 a17-20020ab02311000000b0037f06d68822mr630437uao.20.1655489693605; Fri, 17 Jun
 2022 11:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220616195759.3214538-1-samitolvanen@google.com> <CAKwvOd=KWfNsUFcW4Enq5i94t0zyi7+C9p1-+QUP8+SvoHs=NA@mail.gmail.com>
In-Reply-To: <CAKwvOd=KWfNsUFcW4Enq5i94t0zyi7+C9p1-+QUP8+SvoHs=NA@mail.gmail.com>
From:   Ramji Jiyani <ramjiyani@google.com>
Date:   Fri, 17 Jun 2022 11:14:42 -0700
Message-ID: <CAKUd0B_2PcLW5Lj+4rG=AeVKBQx86x5bM2zL2YGORfKsk1EFyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Ignore __this_module in gen_autoksyms.sh
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <alobakin@pm.me>,
        Steve Muckle <smuckle@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 17, 2022 at 10:28 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Sedat
> Re: https://lore.kernel.org/linux-kbuild/CAKwvOdmb5xdF70TzNp=4STCpzkGh16FnuKE1KbdzDhHt=OuRFA@mail.gmail.com/
> In case this helps.
>
> + Ramji
> Ramji, it sounds like you helped test this downstream? If that's the
> case, mind supplying your tested-by tag for the record? Thanks for
> help verifying this change. Thanks too, Steve!
>
> On Thu, Jun 16, 2022 at 12:58 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Module object files can contain an undefined reference to __this_module,
> > which isn't resolved until we link the final .ko. The kernel doesn't
> > export this symbol, so ignore it in gen_autoksyms.sh. This avoids an
> > unnecessary vmlinux rebuild with UNUSED_KSYMS_WHITELIST when we have a
> > symbol list that already contains all the module dependencies.
>
> Worth mentioning that this also fixes a significant build time
> regression made more painful by CONFIG_LTO_CLANG_FULL when using
> CONFIG_UNUSED_KSYMS_WHITELIST.
>

Yes, I tested it and it resolves the build time regression with modules.

Tested-by: Ramji Jiyani <ramjiyani@google.com>

Thanks,
Ramji

> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/gen_autoksyms.sh | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> > index faacf7062122..653fadbad302 100755
> > --- a/scripts/gen_autoksyms.sh
> > +++ b/scripts/gen_autoksyms.sh
> > @@ -56,4 +56,7 @@ EOT
> >  # point addresses.
> >  sed -e 's/^\.//' |
> >  sort -u |
> > +# Ignore __this_module. It's not an exported symbol, and will be resolved
> > +# when the final .ko's are linked.
> > +grep -v '^__this_module$' |
> >  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
