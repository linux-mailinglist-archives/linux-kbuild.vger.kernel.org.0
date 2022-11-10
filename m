Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20EFC624BD5
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 21:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbiKJUc3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 15:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiKJUc2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 15:32:28 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B841CFFC
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:32:27 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id gw22so2682545pjb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl1aaewvXJMG4ClDQMm9Hh4JfScRGG+THXjeSMcDgYo=;
        b=B639lOng7BjaWQ6jfQHh8TEBIfcIRqgTGdlX0tA8nRfzE+M+b6kBX4ervjXkR+43tt
         fceDNV1Xuqjb3O3rg/Rg6bjjqg3K7zL/aMfgf+94KL7VVmRO/uuw7k5ieDcJoXbK48ID
         YOC0gLhweb/UEChJK7OrfT0mo4E4dV6tgqm9Dxwgr8yOLhuSxrXj+rtcxyLPKVCk/twu
         EGZ/VR6COjcehpqeFdjpwpTz/pQ6YopoYpm5aFhfbQfj0zLlUg2KIM9nWL90mVr+72ac
         H5mOAjz/inY9oDc302wPah03++9x9JDGwSy841XOzEpeWxDMhOOsuTFUNDYBHjeoin4u
         Tdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl1aaewvXJMG4ClDQMm9Hh4JfScRGG+THXjeSMcDgYo=;
        b=b+2oAdxna4TkhmMGecdjw6KlKWFW2dGCYFYFPlJG2hoGam/N5gCeY3Tqi28u/hgHE3
         jtWDEPanl+33UvKECAkJSnKmGX1bCKI5m9YcPVyre7UsUPZb33AuW7L01YkbN4Ku3LuB
         9Gi7hzO23e2PHgAeTPMoQQpDNxgH8dGYs2dDuyIkvy6lDvLi9vPsOKSDTSScQliAXlPf
         4qVb3//4dNYPddticUY4EstmP423n/Rrv29wZwdleSP5bgJcfeHW6seRRe9HncW0B9+0
         +d18YnqVu225OP8rid4MRRj5mKViAAFktXzq1bM4yh5fGoKCTz6/9eXKqhPwCgzE520X
         CvtQ==
X-Gm-Message-State: ACrzQf3e11i4KML4wOMQvSiFwbjiu3nMeIOjY6k8HSkX7duVIDyoykMH
        DKThPhrh0q5my9VSpZFnDE6k3sM7fL3hOKOXGy/k2sfYiTk=
X-Google-Smtp-Source: AMsMyM7jepvl6M9mw4ie3TyvAgEEeetH81bBvmA7xSfPvhJXsZgExY5y+xRoi1DA6BWNPxuNrqrEaLwK/xSX3uxhNls=
X-Received: by 2002:a17:902:b609:b0:186:de87:7ffd with SMTP id
 b9-20020a170902b60900b00186de877ffdmr1877163pls.94.1668112346698; Thu, 10 Nov
 2022 12:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20221110150425.164386-1-nicolas@fjasle.eu> <20221110150425.164386-2-nicolas@fjasle.eu>
In-Reply-To: <20221110150425.164386-2-nicolas@fjasle.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Nov 2022 12:32:15 -0800
Message-ID: <CAKwvOd=haxS9q84mdzWVOnp4QjxJxuCM5quLuLnspGR+=2NTXg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Add Nicolas Schier to Kbuild reviewers
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
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

On Thu, Nov 10, 2022 at 7:05 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> As suggested by Nick, add myself to Kbuild reviewers since I have been
> reviewing patches for some time.  Citing from Nick's commit 36f1386d34120:
> "I still have a long way to go in terms of mastery of GNU make, but at the
> least I can help with more code review."

Thanks for stepping up; it will be helpful to share more review
responsibilities. Welcome aboard.

I think Nathan should consider if he has capacity to do more reviews
here, too, and if so consider adding himself to maintainers here as
well.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f18502372..61a6848192c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11085,6 +11085,7 @@ KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>  M:     Masahiro Yamada <masahiroy@kernel.org>
>  M:     Michal Marek <michal.lkml@markovi.net>
>  R:     Nick Desaulniers <ndesaulniers@google.com>
> +R:     Nicolas Schier <nicolas@fjasle.eu>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> --
> 2.37.2
>


-- 
Thanks,
~Nick Desaulniers
