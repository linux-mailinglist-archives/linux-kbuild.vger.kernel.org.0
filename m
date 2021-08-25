Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E313F6E84
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhHYElk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:41:40 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51376 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhHYElk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:41:40 -0400
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17P4eVv6009159
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 13:40:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17P4eVv6009159
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629866431;
        bh=jTUgTyTe1JsO/HkydT4mE1i9swzMOoHdDKiRAUbXRg0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nkyaa1PsgWexOTWo2kUetUb3SzVxobrHb9ho0t5G/5QUqj4OVTuoDr2Fjn84UsZRz
         0Ybcp4aOgiA2yqR7CYRFwey4LTZEhrcprUcnFyQ2GO88rAZpXBiNlo0BT6/qxK0bjs
         RpELB0JWYv0JnFfjfsVVeLOcVo7T8xJN7Qg8ypPNYAiyv10Q1JPpC9j0jfHThLTExB
         aUqKyI7w4cw/MSfOviagN0bBa4GgFyli5+Rt2JMTet8FUd1xK8Y3gOpIasRf8H1/Ld
         yw5GG5TkHDTuNhMAsgsFL58bn2A+vxmv0RW5UmvJn+cWELFe5CIjVA4rh3GkBqKaGg
         6weFcek12wcVA==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id j2so9162252pll.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Aug 2021 21:40:31 -0700 (PDT)
X-Gm-Message-State: AOAM530kdBBvmOxxhhelrs4E5GmCzDPpmyPYsv0HOmZkFB4ZQ+dRixmr
        5lFRixYHLgz2MG/Wy1RaqMsesvDzQryoiMxLpfk=
X-Google-Smtp-Source: ABdhPJzn3Eug+DkjmdJIaakgPAgcuIX+pBoYL1mAt0/vo02XyNUod54r4xzmQ99UyTJ8kCRhBAziPPWL7O9RX4djpIM=
X-Received: by 2002:a17:902:f552:b029:12d:3d11:4ff1 with SMTP id
 h18-20020a170902f552b029012d3d114ff1mr36048820plf.1.1629866430964; Tue, 24
 Aug 2021 21:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-6-ndesaulniers@google.com> <CANiq72n7=B=j94Oge7OiV9tpjspbBJr_0kEQCeB89cK4-zDQ3Q@mail.gmail.com>
In-Reply-To: <CANiq72n7=B=j94Oge7OiV9tpjspbBJr_0kEQCeB89cK4-zDQ3Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:39:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGwa-Vkk7gN11Z9n92w3fDdAxpJFKiUfJscqw=eySMWw@mail.gmail.com>
Message-ID: <CAK7LNATGwa-Vkk7gN11Z9n92w3fDdAxpJFKiUfJscqw=eySMWw@mail.gmail.com>
Subject: Re: [PATCH 5/7] x86: remove cc-option-yn test for -mtune=
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 20, 2021 at 7:20 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Aug 17, 2021 at 2:21 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > As noted in the comment, -mtune= has been supported since GCC 3.4. The
> > minimum required version of GCC to build the kernel (as specified in
> > Documentation/process/changes.rst) is GCC 4.9.
>
> Yes, please!
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel


Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
