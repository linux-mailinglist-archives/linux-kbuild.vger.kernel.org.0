Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E55B72CBAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 18:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbjFLQih (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 12:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjFLQig (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 12:38:36 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598B9183
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:38:35 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f654d713c0so4946861e87.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587913; x=1689179913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkQkCR0zK+G1VvzG47ybOhl6nFuB5nGWY9v59LgjCEc=;
        b=TFz7syu073g1TLL4KeZsNwWe7UtqoiPAh7S+IiXwa07W3+rqjKn/Enyh/XB3TkuP4S
         TqB2x8FBNEMLQj1VpMYL5A0l0usDika4psdZfJU7OzYWtTARLtsTHtsmy1KIWkni4ZRV
         AZVkJOdwOkptzTXP/yS253RHdR8qjkwoAwBik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587913; x=1689179913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkQkCR0zK+G1VvzG47ybOhl6nFuB5nGWY9v59LgjCEc=;
        b=PA8UT2gk9mLzS8mjmLg30GPKCZ1R6xQ9ymGVSK7b+sA2kuhmyT7aHTu5HBhWrsdZpS
         UV+wLkDi+y9E/rBS1sKtAKTiKQSbOnP+06IH8LSy1J0860iCfVbMu3rAn3JiHGxyWDIr
         6eAt4IJPfXc2ItoR7IaKkPh/N7hSpVmOnUqOwB/hk1qULxQQHBCjaaNh8L7Lx9fAGWHG
         CMryxh3Yx9rDQsmD2C929NXjVjjokI67EdDB+wCJ0S3dDlbrMAm5amH1Xq6oMhRuDetW
         TOSLYmZM+X6rV0oBFY+ugx7YJZkukkRpd85wErKlfq8oChly0Qg18DzOo14VkHNDBBmR
         APAw==
X-Gm-Message-State: AC+VfDxVJ0ipDo7zrUmxZjYTqi+UtnbW9inN/rcg6+TGrFtJwbE76WbC
        rht0P+fGA3Je1/QEAfXneqUMmiDEPTi3bomMXDZOEkuS
X-Google-Smtp-Source: ACHHUZ5W5wa0xy1ncskMTUIBxs2QEXqoT84vERcXZNytgog/C5q4+0Uzj9FGnBC4CU0oQqQdpdGD5Q==
X-Received: by 2002:a19:2d01:0:b0:4ec:844e:7b85 with SMTP id k1-20020a192d01000000b004ec844e7b85mr4216471lfj.25.1686587913370;
        Mon, 12 Jun 2023 09:38:33 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id y12-20020ac2446c000000b004f388c5f25dsm1469371lfl.257.2023.06.12.09.38.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:38:33 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so54275711fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:38:32 -0700 (PDT)
X-Received: by 2002:a19:e30c:0:b0:4f6:1779:b1c1 with SMTP id
 a12-20020a19e30c000000b004f61779b1c1mr5015246lfh.48.1686587892415; Mon, 12
 Jun 2023 09:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org>
In-Reply-To: <20230612090713.652690195@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jun 2023 09:37:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3jV+v63RA30eVpjHVyrGmmTF7d3ajdV=1wBU=5OHa=A@mail.gmail.com>
Message-ID: <CAHk-=wj3jV+v63RA30eVpjHVyrGmmTF7d3ajdV=1wBU=5OHa=A@mail.gmail.com>
Subject: Re: [PATCH v3 00/57] Scope-based Resource Management
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     keescook@chromium.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, masahiroy@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, nicolas@fjasle.eu,
        catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org,
        trix@redhat.com, ojeda@kernel.org, mingo@redhat.com,
        longman@redhat.com, boqun.feng@gmail.com, dennis@kernel.org,
        tj@kernel.org, cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
        joel@joelfernandes.org, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
        42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        john.johansen@canonical.com, paul@paul-moore.com,
        jmorris@namei.org, serge@hallyn.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
        rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
        tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
        luc.vanoostenryck@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 12, 2023 at 2:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> These are by no means 'complete' convertions, I've mostly focussed on fun=
ctions
> that had 'goto' in them. Since that's a large part of why I started on al=
l this.

So I found what looks like two patches being completely broken because
the conversion was fundamentally misguided.

And honestly, by the end of walking through the patches I was just
scanning so quickly that I might have missed some.

Let's make the rule be that

 - max 10 patches in the series so that I think they were actually
thought about, and people can actually review them

 - only clear "goto out of scope" conversions. When you see a
"continue" or a "goto repeat", you TAKE A BIG STEP BACK.

Because this is all clever, and I am now happy with the syntax, but I
am *not* happy with that 60-patch monster series with what looks like
horrible bugs.

             Linus
