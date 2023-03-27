Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF446CA89D
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Mar 2023 17:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbjC0PIS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Mar 2023 11:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjC0PIR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2023 11:08:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA74E270F
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2023 08:08:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D031B8159F
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2023 15:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1616EC433EF
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2023 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679929693;
        bh=qECKIIlTadlXffEwRFmMvreuozOw+cKsB0lw6M/qlMw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kisYKKd5UjYMDepAnFqu4ivQ8K04wVs4kT4K9EsgfolNZ1ga4EuYJdaFKNH92y8AR
         /QQSCW5gFICx1rUrEuZbvy/WmE/ACmkpInEJWoolo9ip69jlajanGlHXWH/PN/yorZ
         DMEmslnRN3C7d37P/XhgIlLYb0p34y//6cgZ+keRq2lm13cTwDC3huYWk6tuU1XFql
         jFDj9junCfhhXgLce82dx4yeek8TfAfZ+oxHZ9RxBnMslyBeB6ZzCQjf9P71VVJMpN
         A4YyYqYXNAA0dmPOZxUSC7/RIfTRsV2VK7tBR489Ga0OOx6JsBuuPD6rk81oY7xCgQ
         mgwddSyD0bGcw==
Received: by mail-oi1-f170.google.com with SMTP id r14so900490oiw.12
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2023 08:08:13 -0700 (PDT)
X-Gm-Message-State: AO0yUKWy80UOBP59qr2akTOv6RRJJJWoFBqKEUnq/c86SfRK8DLhnfK7
        kTHhXIxKTU0w/GUEZTjSaA0rXKV30bn6/Zg+udI=
X-Google-Smtp-Source: AK7set+KUWH9z0VKEAZ05WfUY5O2VgBkZMkVwE5hZ2pFRfzyyYVDG3d162k+Hbo85myXBpua8WKVHvBGdIsuT4toToM=
X-Received: by 2002:a05:6808:284:b0:384:33df:4dfc with SMTP id
 z4-20020a056808028400b0038433df4dfcmr3296890oic.11.1679929692291; Mon, 27 Mar
 2023 08:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <f5434ce4-3b10-4052-85b8-5aaf8e58b09a@skade.local>
In-Reply-To: <f5434ce4-3b10-4052-85b8-5aaf8e58b09a@skade.local>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 28 Mar 2023 00:07:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_24C-EJeEHu9=RAzB8nBEsS6JRpQdqB-GLoj0koGuzg@mail.gmail.com>
Message-ID: <CAK7LNAT_24C-EJeEHu9=RAzB8nBEsS6JRpQdqB-GLoj0koGuzg@mail.gmail.com>
Subject: Re: recent kbuild change (36862e14e31611f9786622db366327209a7aede7)
 broke Debian headers pkg
To:     Tobias Klausmann <klausman@schwarzvogel.de>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 27, 2023 at 8:11=E2=80=AFPM Tobias Klausmann
<klausman@schwarzvogel.de> wrote:
>
> Hey,
>
> I recently noticed that my generated .deb files for linux-headers had
> broken paths:
>
> $ dpkg -c '../linux-headers-6.3.0-rc3_6.3.0-rc3-35_amd64.deb'
> [...]
> drwxr-xr-x root/root         0 2023-03-27 11:10 ./usr/src/linux-headers-/=
tools/
> drwxr-xr-x root/root         0 2023-03-27 11:10 ./usr/src/linux-headers-/=
tools/objtool/
> -rwxr-xr-x root/root    843880 2023-03-27 11:10 ./usr/src/linux-headers-/=
tools/objtool/objtool
> [...]
>
> I bisected it, and it seems the commit in the subject is the culprit. I
> tried figuring out what exactly broke, but my Makefile skills are all
> atrophied :)
>
> I can provide more info as needed. Also, if you prefer, I can report
> this on the kernel Bugzilla.

This was fixed by the following patch.
Now it is in linux-next.

https://patchwork.kernel.org/project/linux-kbuild/patch/3351f907cfd0b5d8372=
e858a8ec9065cc2bd91df.1679434718.git.kevin@kevinlocke.name/





> Best,
> Tobias
>
> --
> Sent from aboard the Culture ship
>         GCU (Ridge Class) Jaundiced Outlook



--=20
Best Regards
Masahiro Yamada
