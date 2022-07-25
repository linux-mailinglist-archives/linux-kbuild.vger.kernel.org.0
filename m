Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59C257FFFE
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jul 2022 15:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbiGYNdY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jul 2022 09:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbiGYNdS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jul 2022 09:33:18 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E1A13F8C
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 06:33:11 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id r70so8758895iod.10
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UI2/nxfk1QNcmFQVdYqpL42RDFh7hqRmtHgOiz0UFAE=;
        b=pKE5ac071R6Pb3RRecZCZJIoq81DrpZBqMcjudyYrNlHT+FblM7h1cLSJhjMU04hOC
         4/KSTkTwMdb6u4Vl0kYNayVP6351sf8pHJfF0BK6xYWcoFNHKe0VvjiuimjrGPQKyLbi
         eTh9XY6XGpZW+JPB88tsV3Mkl7EER7lAp/WC7fnq77elUyERjeeQsBPs/bOJRapjZd4P
         uud2yhv+lZu+4zSGaQbtbWTr0FrgWlG1FDRde0zVuGd9lNc45+3WM2Pz9uGGck8GxZQ1
         fMpK6ySfy4CuKwp3/DvvptSXLKpX/oEj8fBvJQnvXA1b5s6wN+88QFfPeX2um/xZthHL
         on9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UI2/nxfk1QNcmFQVdYqpL42RDFh7hqRmtHgOiz0UFAE=;
        b=yewz8Ahhq3VoF9kJBGYMOCcgvFjCU4vMXBbucY1bZJuM81LXB/WuS/HGF8fTBiV7Nw
         wJjC5E7Azo3f9icSlU89FZwuPYQ3Hg3g2S6zDBZ9q2Bbj8YLwoTXzuqqE9nUMgtRPd/C
         8MdaGf12icgwN3FmQaeBIMb2ww1idISD+291HVZFzkkyKqXKVV6y4rYDvfQsHCGzwfS9
         YJOnOLORLdPgTGU/KdWB6ZGj4FxDKO2VoN0N/e94ShLB7u/Il/X2vw4GxupCv3DTOBR4
         SJS36FADTC6b1CVh1Vb7MMrhIbcOAHFrB2GAmlVlIoabtQPbf8J2EOTI86EPMirr1zfI
         3rew==
X-Gm-Message-State: AJIora/O11DEr44v5zHMRBtdiN5Ban2+fa1VeokblVBdjJv97mHkukWU
        tRW5Wa0KzBMWvh2wgXxTjH4uMr8us586nSq8AjRtsA==
X-Google-Smtp-Source: AGRyM1s94qNICw9Lb3JDMcSff9B114i33VAnDqLIK5x0bwim9blfoCpQDQF+4jdp/Xo+2lXAFvHnOUTKg6ry3bzveVk=
X-Received: by 2002:a02:c722:0:b0:33f:393d:d198 with SMTP id
 h2-20020a02c722000000b0033f393dd198mr5025831jao.22.1658755990616; Mon, 25 Jul
 2022 06:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220725083904.56552-1-huangjie.albert@bytedance.com>
 <20220725083904.56552-3-huangjie.albert@bytedance.com> <Yt6JRBToqY5ts6OU@zx2c4.com>
In-Reply-To: <Yt6JRBToqY5ts6OU@zx2c4.com>
From:   =?UTF-8?B?6buE5p2w?= <huangjie.albert@bytedance.com>
Date:   Mon, 25 Jul 2022 21:32:59 +0800
Message-ID: <CABKxMyOcePkvAvMyrG2r08yRuxx=gK2SnMBFbKzKW6hBAdmRFw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 2/4] kexec: add CONFING_KEXEC_PURGATORY_SKIP_SIG
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Michael Roth <michael.roth@amd.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <jroedel@suse.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

maybe a boot parameter ?

Jason A. Donenfeld <Jason@zx2c4.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=B8=80 20:15=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Albert,
>
> On Mon, Jul 25, 2022 at 04:38:54PM +0800, Albert Huang wrote:
> > +config KEXEC_PURGATORY_SKIP_SIG
> > +     bool "skip kexec purgatory signature verification"
> > +     depends on ARCH_HAS_KEXEC_PURGATORY
> > +     help
> > +       this options makes the kexec purgatory do  not signature verifi=
cation
> > +       which would get hundreds of milliseconds saved during kexec boo=
t. If we can
> > +       confirm that the data of each segment loaded by kexec will not =
change we may
> > +       enable this option
> > +
>
> Some grammar nits here, but actually, wouldn't it be better to make this
> depend on some other signature things instead? Like if the parent kernel
> actually did a big signature computation, then maybe the purgatory step
> is needed, but if it didn't bother, then maybe you can skip it. This
> way, you don't need a compile-time option that might change some aspect
> of signature verification people might otherwise be relying on.
>
> Jason
