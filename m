Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5846666B5F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jan 2023 04:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjAPDV4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 15 Jan 2023 22:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjAPDVz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Jan 2023 22:21:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2047C7A87
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 19:21:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AC536B80B90
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jan 2023 03:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F8CC433EF
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jan 2023 03:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673839311;
        bh=VFBX27PXNvKMq6ChOX8PJR6tiSPP49Zk9YoTKPLShtA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KkYeozP5uiw0UYrN4lO5DzyOyuGY8Etks4rkM/7pjJnsh0vmPPyCLf6lrLWYLsThG
         TPGcWn8MpkNEneaPV90eXwFVXiedTbgKZGMKALJuDibXNEAfWVj5ua4RwaY4o+fy+D
         URQ3G9AykSAAe8GfjxngzK6LT1D4eS6eXFXAjsJnZfWqs0yVRmDLxNjtdUH/fi9C1v
         /ioRZZFJhza/py5uEAV9l83zVkxzPgS2GMU3PmQcZG0NHO2fDdwFKbJFCvRztBaZ+Y
         sYXtwf7sPER9D3W8BcN4+TBdLRupdlYusNydk2RHH4KgKQb3wYzgTrtuWpQvodwO0h
         UQT7EEWC9baEQ==
Received: by mail-oi1-f176.google.com with SMTP id o66so22334651oia.6
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2023 19:21:51 -0800 (PST)
X-Gm-Message-State: AFqh2kpsGOIL0FBipFNcaPk4jq2dPwvuQz/9AXFmLylLHn7rLj2IS9Lo
        /nXO0WpoIOFm5kMADrUz16Zz1wsW3AIVXaihVvs=
X-Google-Smtp-Source: AMrXdXsOlWXCdQ9dsGtEefFbcm2srM3unQtXR4C7jLCKBgVdIA5YubxtFwWOE0DeaYhLlBPMgTFqpbyN0eM1bduuZ1s=
X-Received: by 2002:aca:3755:0:b0:35e:7c55:b015 with SMTP id
 e82-20020aca3755000000b0035e7c55b015mr5617021oia.287.1673839310573; Sun, 15
 Jan 2023 19:21:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
In-Reply-To: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Jan 2023 12:21:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
Message-ID: <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     sedat.dilek@gmail.com
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 16, 2023 at 11:02 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> I saw these warnings in my build-log:
>
>   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/
> atomic-arch-fallback.h)" != "$(sed '$d'
> include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> .*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
> allback.h has been modified." >&2; exit 1; fi; touch
> .checked-atomic-arch-fallback.h
>  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/
> atomic-instrumented.h)" != "$(sed '$d'
> include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> ]; then echo "error: include/linux/atomic/atomic-instrume
> nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
>  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/
> atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
> sha1sum | sed 's/ .*//')" ]; then echo "error:
> include/linux/atomic/atomic-long.h has been modified
> ." >&2; exit 1; fi; touch .checked-atomic-long.h
>
> NOTE: I did a `make distclean` before I started my build.
>
> Can you please comment on this?




Please clarify your problem.

My best guess is, you just added V=1 option to
print the full log, didn't you?



I can see the same build log by running the following command.



$ make V=1 mrproper defconfig  prepare | grep sha1sum
+ [ clean = clean ]
+ cleanup
+ rm -f .btf.*
+ rm -f System.map
+ rm -f vmlinux
+ rm -f vmlinux.map
+ exit 0
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d'
include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
.*//')" ]; then echo "error:
include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
exit 1; fi; touch .checked-atomic-arch-fallback.h
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d'
include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
]; then echo "error: include/linux/atomic/atomic-instrumented.h has
been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
echo "error: include/linux/atomic/atomic-long.h has been modified."
>&2; exit 1; fi; touch .checked-atomic-long.h






>
> Thanks.
>
> Best regards,
> -Sedat-




--
Best Regards
Masahiro Yamada
