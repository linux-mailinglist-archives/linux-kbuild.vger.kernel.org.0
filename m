Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9A777B252
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Aug 2023 09:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbjHNHY6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Aug 2023 03:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbjHNHY5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Aug 2023 03:24:57 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F4FE73
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Aug 2023 00:24:56 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-56d6dfa8b52so2830769eaf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Aug 2023 00:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691997896; x=1692602696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NIpvt4nCqADNh0cqss2ffGGeYbGFw7fYt1kJmUbwbI=;
        b=31OXeIf+mXMuFZp/BWOkz0flJ8KejbkRr6wUM0EaIWFsfCQ2zCsPBGNavW2kDotoRb
         PsdgpoQL2gpaZ0ZXxpoLZllweTv3kJLm8VfWRPUbTrVZoBYG74ey9ou+i5DldGUtrvZj
         jJo8ZTlGZFQdNoXY5rUkd1Dtmfa47V/md6csocIKsbUStnghTAD3XIMWY0LbcOKZVL8R
         UKwErhue2XmH1yGzmSeWKwazVzfwuPeeEndpbu30PPUYDm1PkiRqb4L1jL+MuiOLySre
         zsaUYQ2DFJEH6D56bGkqsrwwi4rw9bkrOJfrBGOe8CCOsCJd8M3TTqTmLu7vsFb8lZhj
         caow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691997896; x=1692602696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NIpvt4nCqADNh0cqss2ffGGeYbGFw7fYt1kJmUbwbI=;
        b=OMe+bxzXkp4TqFu7ibDn6xWfwS0LvOTm9e5x75yi/3Tr4FVtVvg5aREFxb1JTskoQL
         v8UsQZC7Kq96wD0BJKmHQ9p+33aQ2rJjERixvCss0zpi82CoX581j7n76IkSeoJzctNB
         ZuT4OKp0T3nCuvOfozPq9ENjcQIdgEK45BmkJgObQ/SG9m5X7m2I6jhtKbTDx53T088J
         XQ/wUQyJwSLOaSnXQJ5smngF1JgCOZlGA58iHmosS+6dRXTgedmQB8oM5V6KJmizAc0b
         tzWs0KGaz9v5FQjKEIpTimruvuUBOE8Qnx5y/miY4y6CGExeaXzaAXl/BTavjqrPvZ+r
         lZiA==
X-Gm-Message-State: AOJu0YyNM2gvRndO2PsC3pFbt9P+VFZeRKa5m3U2/ggiymB0SrqlN8My
        LqZa/9tyvHpcsFrVmx9X9l3WlNQX1aOxQQvCy0Cfkw==
X-Google-Smtp-Source: AGHT+IGt7CaB2ILiQcKO7hsqp/eT61SdPAyp3n2bOb0VW67EKt7879WD8gVGObg51YEytXyya1GU1zsdE1LQEwcxEjQ=
X-Received: by 2002:a05:6358:5906:b0:134:c37f:4b5c with SMTP id
 g6-20020a056358590600b00134c37f4b5cmr6968498rwf.22.1691997895708; Mon, 14 Aug
 2023 00:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093537.614161713@infradead.org>
In-Reply-To: <20230612093537.614161713@infradead.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Aug 2023 09:24:44 +0200
Message-ID: <CAMRc=MegBEQ1Anfh5UJe=OH0U_VX9ijMeh_hoWKxDyB511stsA@mail.gmail.com>
Subject: Re: [PATCH v3 03/57] locking: Introduce __cleanup() based infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     torvalds@linux-foundation.org, keescook@chromium.org,
        gregkh@linuxfoundation.org, pbonzini@redhat.com,
        masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
        vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
        mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
        dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
        adrian.hunter@intel.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
        frederic@kernel.org, quic_neeraju@quicinc.com,
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
        luc.vanoostenryck@gmail.com, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 12, 2023 at 11:56=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>

[snip]

> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -17,6 +17,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <linux/percpu-refcount.h>
> +#include <linux/cleanup.h>
>
>
>  /*
> @@ -211,6 +212,8 @@ void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
>  size_t __ksize(const void *objp);
>
> +DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
> +

Peter,

Yuri Norov pointed out to me (under a different cleanup patch) that
kfree() handles NULL-pointers and there's no reason to check it again
in DEFINE_FREE() macros. It seems right to me but I wanted to run it
by you and check if there is maybe some reason I'm not seeing to doing
it?

Bartosz

[snip]
