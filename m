Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC306A724B
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Mar 2023 18:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCARus (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Mar 2023 12:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjCARur (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Mar 2023 12:50:47 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439AE3D92E
        for <linux-kbuild@vger.kernel.org>; Wed,  1 Mar 2023 09:50:43 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id q189so8212263pga.9
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Mar 2023 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677693043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpL6DwFkyuaEtEvh0ArhxR/cUeifrKQ0QYmfCAMdbVU=;
        b=lagi4xfM5lhItTQDuRxproJWvwcvRV2ufiYbfodtWrckZ9+0sW1ahRDIVSF1/ru37a
         iHjqSfwo67gCHwutTwpxMZqhFvMGxAHTEhw6mb6VL0iuZes7SSdXJRb7kt9/jU5Rjn/k
         7dPOZx7m8j2Z+rUdxYZfd2BB3F0T/G/6qn5xLtGLK3JyBD7nj85IMMOQGMRiDBz3fCvS
         8rpnjHLfybMAgEC0FVsBNE0YPItotziNHYW4dTwBLVy7wVjWGwTd6s0tBZeu7i1WwynB
         t6HgD+TNCzshFzJI6hyIbTjAJveFkmeHYGT0L46AP7u+zvz1rI93vWkmEWOkMUrSO/Ke
         8CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677693043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpL6DwFkyuaEtEvh0ArhxR/cUeifrKQ0QYmfCAMdbVU=;
        b=D/E2TZn2ssgtWpp7PfiC1ibINU7i8WHMrVmKu3StN3GW6MKQvUSbPgdUVdRSo1TrFZ
         jrKA1JPwonZE5HDv6fv5h4ZqzQg5YagNdiF5q6/ND+HvhD+C80ixYLaC2EPGI9C/MDgj
         nQtCSgbwNAiLUjdYmz/hgopfvIqQ441yHjE22qEd/WcFREQ0eXZin15Q8w6rOTDsLCEG
         QTGwo2nO13+E2KgyOOQiTwYqADl6aKlDeafyOB9QnuN0y/DKkhcmuIRIJ3kgoJ39C2vo
         NdsDpftanEKCYw83jxh22Bs7RFc2bNw78QN/BlsKGRoeKPIFQpKmc1SjQ2aEoOfTelzo
         gXmw==
X-Gm-Message-State: AO0yUKVsRNXRVcUQ8c/9e+K1yAV0O7mi+HQJtfB4UPi5xQIF6MqTpgzP
        e7phCYKRdxnKwbG1LyjWVicMJ25iAy6JVCA+G1sr8Q==
X-Google-Smtp-Source: AK7set+sa5Lpwqw5kyGG4/qPXxMgWH2tZf+nBVEHopmtPWoZRNrFsf1qn2TKiNLI7IHyHoSIS55/eR0Qis04PyU96jg=
X-Received: by 2002:a63:8c1d:0:b0:503:354c:41ad with SMTP id
 m29-20020a638c1d000000b00503354c41admr2372184pgd.11.1677693042346; Wed, 01
 Mar 2023 09:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301075402.4578-1-quic_johmoo@quicinc.com>
In-Reply-To: <20230301075402.4578-1-quic_johmoo@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 1 Mar 2023 09:50:30 -0800
Message-ID: <CAKwvOdmqShYae=DrwP1JZBYXAYZyDB0SaOkVCvCzQC60MaJcpw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Validating UAPI backwards compatibility
To:     John Moon <quic_johmoo@quicinc.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Matthias Maennich <maennich@google.com>,
        Giuliano Procida <gprocida@google.com>,
        kernel-team@android.com, libabigail@sourceware.org,
        Jordan Crouse <jorcrous@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 28, 2023 at 11:54=E2=80=AFPM John Moon <quic_johmoo@quicinc.com=
> wrote:
>
> Currently, the script works with gcc. It generates output like this when
> a backwards-incompatible change is made to a UAPI header:
>
>  !!! ABI differences detected in include/uapi/linux/acct.h (compared to
>  file at HEAD^1) !!!
>
>      [C] 'struct acct' changed:
>        type size changed from 512 to 544 (in bits)
>        1 data member insertion:
>          '__u32 new_val', at offset 512 (in bits) at acct.h:71:1
>
>  0/1 UAPI header file changes are backwards compatible
>  UAPI header ABI check failed
>
> However, we have not had success with clang. It seems clang is more
> aggressive in optimizing dead code away (no matter which options we
> pass). Therefore, no ABI differences are found.

Hi John,
Do you have the list of bugs you've filed upstream against clang wrt.
information missing when using `-fno-eliminate-unused-debug-types`?

https://github.com/llvm/llvm-project/issues is the issue tracker.

Seeing a strong participant in both the Android and LLVM ecosystems
supply scripts that lack clang support...raises eyebrows.
--=20
Thanks,
~Nick Desaulniers
