Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6C96A47DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Feb 2023 18:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjB0R0P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Feb 2023 12:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjB0R0O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Feb 2023 12:26:14 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC88A2331B
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:26:13 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id d30so28897759eda.4
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZogG8tw+q6uDbu7auN6I0HH9fxImm1GBhQWedC4se+w=;
        b=KvnKFTkD9OVy+iVEzQSCtDmq561fwnCc359FGEJqYF9HGgIH7FK0mQM6jvycCUtvjd
         ouuWpWhQ5Z8374288fSNpq+CMUFLx0iH+CZEy2EvQhxCQahhiE1HOvYRnd7j6TkEQc/6
         w7IOlZOiUqlwvGIwzPpkssmVvxkQ3Q24s1RmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZogG8tw+q6uDbu7auN6I0HH9fxImm1GBhQWedC4se+w=;
        b=xYhv6kRhrBQoiX4fdsyV6uJKHoQ5Cj2Ym1dTJSPEmne2yWNmh5rgJwLov9DH0KEQ5j
         2jr0o9+f6GM2dVMsTuETgZOzPgomAE/U3gg2AVu4/WcLCSpJcpcoysh2GVDO/S26jYNV
         B1TMQC4PEsRBbs2U11f/P98O6ehUd6Oe1GThsJnH18JcPSqK3vNckeKllpQfhsYM/zBM
         ELQoF1DdkLAC9ZwYbaJ4ZfJBOd4ySACH3lrtstfleUVoJTPe9Tmn4n+5dJ5UCfNkGnkj
         ceVuMmq+58DkJoFWpsnvo/vSebvtY5mnxEdxfm7L6NI0jNj2I635xrPYvcZt41PQY+0Y
         3oOA==
X-Gm-Message-State: AO0yUKX1HsnZEc11CW9BFWIkDnrmR9Et6lUIVwBcEIvxlLkEvyov/K4N
        rdhG3mrH9IcElTcfoW0WZ0LUYU2/iu7+80C8r4c=
X-Google-Smtp-Source: AK7set+ZFurS47yok8c5+NvUav95o/1GqWxnBHcaE/bSoOkcNl6ebAnZ5433BkPB06QblO98irOcfA==
X-Received: by 2002:a17:906:90ce:b0:889:7781:f62e with SMTP id v14-20020a17090690ce00b008897781f62emr33245920ejw.22.1677518771940;
        Mon, 27 Feb 2023 09:26:11 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id c21-20020a17090620d500b008e267d7ec18sm3456598ejc.50.2023.02.27.09.26.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 09:26:11 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id s26so28755408edw.11
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Feb 2023 09:26:11 -0800 (PST)
X-Received: by 2002:a50:c34a:0:b0:4ae:f144:2c8e with SMTP id
 q10-20020a50c34a000000b004aef1442c8emr148730edb.5.1677518771169; Mon, 27 Feb
 2023 09:26:11 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com>
 <CAHk-=wi49sMaC7vY1yMagk7eqLK=1jHeHQ=yZ_k45P=xBccnmA@mail.gmail.com>
 <CAK7LNAR40OOCJhz2oNF4FXWeyF=MOQPwfojHCU=XZ0jHcuSP5g@mail.gmail.com> <CAHk-=wh5AixGsLeT0qH2oZHKq0FLUTbyTw4qY921L=PwYgoGVw@mail.gmail.com>
In-Reply-To: <CAHk-=wh5AixGsLeT0qH2oZHKq0FLUTbyTw4qY921L=PwYgoGVw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 27 Feb 2023 09:25:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgM-W6Fu==EoAVCabxyX8eYBz9kNC88-tm9ExRQwA79UQ@mail.gmail.com>
Message-ID: <CAHk-=wgM-W6Fu==EoAVCabxyX8eYBz9kNC88-tm9ExRQwA79UQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.3-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 27, 2023 at 9:08=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So here's the simple rule: if the packaging people can't be bothered
> to use "gti archive" to make their packages, then they had better just
> do a "make clean" first (or, better yet, do "git clean -dqfx" to
> really clean up, because "make clean" isn't 100% reliable either).
>
> We don't add more broken infrastructure to deal with broken workflows.
> Just do the right thing.

Note: I'm perfectly happy to just revert this, but if I have to do it,
then pretty much _all_ the packaging changes get reverted, because I'm
not going to be able to figure out which parts don't rely on the new
broken script.

So I'd rather take a more directed revert from you. Or, better yet,
just a rewrite to do the right thing (ie "git archive").

Because really - any distro packager had better have the git tree.

                   Linus
