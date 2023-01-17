Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49E466DE6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 14:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236630AbjAQNNV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 08:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236792AbjAQNNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 08:13:20 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DCB360B7;
        Tue, 17 Jan 2023 05:13:17 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id o7so32728363ljj.8;
        Tue, 17 Jan 2023 05:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TFP4zLTXX9LIBlf0bfwbfMp4tVuhd6yMJG3cjXrKiFc=;
        b=ZCdN7I4n6+4vTAgM93Y2Yd3FaQgVriaZ4iz0DalmtQgt+eCTMtYtB2Qel9WWnTZACy
         guSRCmeGR/9+F91C3KuIgMhLEjo+DUNELt9S/AFLwKP5M8KAuZW1DaP9nPjrNhbKDNxa
         e8lO6djh+qP2vF/z0nKfkaSRLqtGSxCEe9bTayIwr04I00+iFO2mIk+LfYcgykhHVIw7
         QM4oif8re69EfEikhJX9Ja7Rnlkoslcow99XOP54Pp4QnAKZUv9nnEpDf4frDxCPhpOh
         DJ0VWe/9oRWEG4tz8HlQEle7BCH0WWDneD2BNOGbZ5NWL7h6Hx+eeXjpIKOl/bhFKwHy
         S/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFP4zLTXX9LIBlf0bfwbfMp4tVuhd6yMJG3cjXrKiFc=;
        b=QE3Qt9nmt44J1oz9vICS3H0uVzb8Kqme8XNANwCZtUS6Ee3blkBJOqv1t9NxK6cnFJ
         dmt3qkoo6wAxZpod/aIt3OSfDpwjN8p0DAtu3zjBr3iavi1gmUi3naJ4nB8yqS1NzqbK
         CvCOhWCVlF5p8PXxjTrT+85iyP0xlTxMu+BR1I/wXNkxhlWuGWmeA1opHkZp1dc/zVjD
         b5jpkxaJgi6Imlp6sKZtp5UwmjXAfXBFAZxzH66VLzIHrask+xwuGH78fmkmMo/6ecI8
         3QKeaxhjglMydLzX+ey8JxU8XW0gRLBd2oH/xsCVbq7Af5KbieNZKWsmIczRerFzevn5
         Q/TQ==
X-Gm-Message-State: AFqh2kqLoYB/3AyX5fBjFLM0gELI2rAu34Qm7GlpmV+tH0sOggwaS1fw
        9Y/CP0Z9nbciuj954PhnbWZYZp8ZleqhLQb1mHQ=
X-Google-Smtp-Source: AMrXdXtBvxpOBT9mZ7eaHXtsp88Ie06TmXl/HRJlTTTsAkv6/ysOFF96JHh5JjkIhsk0GEoNnVc0lMIj1D0KF5P3KR0=
X-Received: by 2002:a2e:9255:0:b0:289:81a4:3a7b with SMTP id
 v21-20020a2e9255000000b0028981a43a7bmr219286ljg.487.1673961195900; Tue, 17
 Jan 2023 05:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20230117095946.2042832-1-jani.nikula@intel.com> <20230117095946.2042832-2-jani.nikula@intel.com>
In-Reply-To: <20230117095946.2042832-2-jani.nikula@intel.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 17 Jan 2023 14:12:38 +0100
Message-ID: <CA+icZUWgec3iwo2OXygo57w76AOJ+0+1VOYYKAcHTLebcDka+Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] MAINTAINERS: fix kbuild repo branch
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 17, 2023 at 11:15 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> The MAINTAINERS repository entry specifies "kconfig" as the branch, but
> the repository itself has "kbuild".
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a36df9ed283d..98da2af0a653 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11171,7 +11171,7 @@ M:      Masahiro Yamada <masahiroy@kernel.org>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
>  Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
> -T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild

We have two entries - one for "KCONFIG" and the other "KERNEL BUILD +
files below scripts/ (unless maintained elsewhere)".

Cannot say if kbuild is the place where KCONFIG changes are done.

But you are right there is no kconfig Git branch, anymore.

Some maintainers switch over to use https over git URL these days.

What do you prefer?

$ grep 'git git' MAINTAINERS | grep 'T:' | wc -l
668

$ grep 'git https' MAINTAINERS | grep 'T:' | wc -l
49

In my ~/.gitconfig I have:
...
[url "https://git.kernel.org/"]
       insteadOf = git://git.kernel.org/
[url "https://github.com/"]
       insteadOf = git://github.com/
...

BR,
-Sedat-


>  F:     Documentation/kbuild/kconfig*
>  F:     scripts/Kconfig.include
>  F:     scripts/kconfig/
> --
> 2.34.1
>
