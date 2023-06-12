Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B74972CB73
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 18:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbjFLQ07 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 12:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjFLQ06 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 12:26:58 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B222698
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:26:57 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977d6aa3758so828200266b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587216; x=1689179216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/KCMaMkVpL2TvKmUhvddPCRbVA7+Ro9TFJ9/0bVSYQ=;
        b=En1Z9aFdRK+DAiE9++5CHKMSpUeJtsSa53cKt5NfXBbX5KzcF35oSK4j89anRdipmA
         tUbdtzQA5U32z6kRAvYbl8dswRDHDzqXkTMINRZpfkLhrn359zdez/CHBd/kHoHl9n0B
         TCZLnJY1s+N+fZ3jutbmkOXEHaMXOGuLZFQPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587216; x=1689179216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/KCMaMkVpL2TvKmUhvddPCRbVA7+Ro9TFJ9/0bVSYQ=;
        b=e0cu+pkxy7UB2U1b2h+ybUTi6Tswr3iMxQtJPq1MCvOlnDGj5/DmJyHYHNHJUQKRXa
         pS7rywKBIOTcKaBQdBEliVFC6npFiSibUfdRHRLOAfrWZLcytKUg5UzAtriPSTQ9NnFr
         T1sWkF6K7lYoqHUJzcq22neDG415EzwienpGMotwsNl7zYTlh0SLPj/VDyhZ4f10t7jR
         sTZqjTFbWa3s/m4ts9sefw0j1nUuZd2YRKffncajDhgRnEaJcNEGFW2eCKYjh27rAOkr
         +1DaEpfsYekgb+l1UPT0OBFkTVqYPBwMY5LDoBANRn1vlwSCzsDrIa/QGMPKwPjoqWzY
         lm0w==
X-Gm-Message-State: AC+VfDxu9d+PY8i/6eZMMSrX24pGZkXGdOyNTvSuyDyb0LNbR/FcH5aW
        g4Tia9xSXEUkGUfkJiXLcli5F73NYQK/96obwxDhE7c9
X-Google-Smtp-Source: ACHHUZ7iHhSEAh+DYBsuXi6T9gz/IL83aM6ATCR+OtpJI1Ogf4RR1VSZzukx2O+O3Yyd1+I4OR5MbA==
X-Received: by 2002:a17:906:fe4d:b0:974:1e0e:91ee with SMTP id wz13-20020a170906fe4d00b009741e0e91eemr11420096ejb.13.1686587216028;
        Mon, 12 Jun 2023 09:26:56 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id b7-20020a170906038700b009787b18c253sm5456448eja.181.2023.06.12.09.26.55
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:26:55 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30fa23e106bso2116213f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:26:55 -0700 (PDT)
X-Received: by 2002:aa7:d14e:0:b0:50b:c3f0:fb9d with SMTP id
 r14-20020aa7d14e000000b0050bc3f0fb9dmr5534541edo.41.1686586776585; Mon, 12
 Jun 2023 09:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093541.598260416@infradead.org>
In-Reply-To: <20230612093541.598260416@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jun 2023 09:19:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>
Message-ID: <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>
Subject: Re: [PATCH v3 56/57] perf: Simplify perf_pmu_output_stop()
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

This patch looks completely broken to me.

You now do

                if (err =3D=3D -EAGAIN)
                        goto restart;

*within* the RCU-guarded section, and the "goto restart" will guard it agai=
n.

So no. Sending out a series of 57 patches that can have these kinds of
bugs in it is not ok. By patch 56 (which just happened to come in
fairly early for me), all sane peoples eyes have glazed over and they
don't react to this kind of breakage any more.

                Linus

On Mon, Jun 12, 2023 at 2:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7977,7 +7977,8 @@ static void perf_pmu_output_stop(struct
>         int err, cpu;
>
>  restart:
> -       rcu_read_lock();
> +       /* cannot have a label in front of a decl */;
> +       guard(rcu)();
>         list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
>                 /*
>                  * For per-CPU events, we need to make sure that neither =
they
> @@ -7993,12 +7994,9 @@ static void perf_pmu_output_stop(struct
>                         continue;
>
>                 err =3D cpu_function_call(cpu, __perf_pmu_output_stop, ev=
ent);
> -               if (err =3D=3D -EAGAIN) {
> -                       rcu_read_unlock();
> +               if (err =3D=3D -EAGAIN)
>                         goto restart;
> -               }
>         }
> -       rcu_read_unlock();
>  }
