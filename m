Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB916715F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jan 2023 09:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjARIQk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Jan 2023 03:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjARIPa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jan 2023 03:15:30 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F013B618A9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 23:45:55 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id o7so35343902ljj.8
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 23:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JS5hLdbuoXIXcP89EGz1/gZ+Y3UDxKZ4sehs0XwnBr0=;
        b=Mn1wl1o2jWKFwT/qssRb0dQNxZqHf8ICLMxRFTKyfZ8edNwAVHb01h6vIZuj9mQUYr
         P0Q1wJnZSZpUAHFN6looTijF+8ekZ2xpk+PqSxi2z9iqlXVEXjrrh2IzvI16aaZmGkIj
         RsZFMG/BWYE2DRO8MLoOSx8bz3z2zFUqESkYFjtLwyNy6D9w2PFndzsieZxaXdAMN3z9
         rPf+zqH+7CH64dVYxGxQA+npSh6ixeBTNeMJPCknj7XRNfO9stNrulKkCNzxclG0Quzl
         ZhM2aPmsD4/W0AtIg8Qk0ZJuNx7DMaZWESwLbbW9n7g07gaPzEOSG1lGvy7RkuTe7vzS
         WoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JS5hLdbuoXIXcP89EGz1/gZ+Y3UDxKZ4sehs0XwnBr0=;
        b=haksHpw8vJ1FE5uTO3QesCfwjQ1Hf4/OqYeZ/dN7b/kKK4xBSQ2jFJrfNkmzus9syX
         tJsJs9P7NSIbeH+Qx8fCn4ryEtO2IZjyaqFc5+Dx68BWjIznI6bYQx+QlSmtuP4aeMqd
         1kRnbQCcA3tkTCXjJ9sT1+F4PDGHI2Tz3QEuZyho0uuhQ31sinz/A0+emu85k4QtUlsw
         ykLEved660t7lcNAdB0qvjGy7R7Hfja8X2Izdvclh82Pzf/HU5+ek18Gh2aDEcRCWLqF
         PCMpCavH6P59q0N2476x91DbiagRGgEE41W25C6foVUyoNLc3xwhuGFDJ4wtGgwX4iNB
         VNdA==
X-Gm-Message-State: AFqh2kqScWU7yc60KkhLDsoErmwipUmUdUebjKbRi8s5Dj5Ki+8QKHrp
        Bbny3IrpxKKPnxQDqKz/HRc676jWw7L/EIdEvSdygR530Wc=
X-Google-Smtp-Source: AMrXdXvKy9rfqDj7q0fbnPdenAGu3nUbGaDZR7DbiztZIviEd5ojRK5G80cWxC30zaSBufNTljN12bRK3VzQJODMNas=
X-Received: by 2002:a2e:94ca:0:b0:27f:eef3:921d with SMTP id
 r10-20020a2e94ca000000b0027feef3921dmr590841ljh.515.1674027942475; Tue, 17
 Jan 2023 23:45:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
In-Reply-To: <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 18 Jan 2023 08:45:04 +0100
Message-ID: <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
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

On Mon, Jan 16, 2023 at 4:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Jan 16, 2023 at 11:02 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I saw these warnings in my build-log:
> >
> >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/
> > atomic-arch-fallback.h)" != "$(sed '$d'
> > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > .*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
> > allback.h has been modified." >&2; exit 1; fi; touch
> > .checked-atomic-arch-fallback.h
> >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/
> > atomic-instrumented.h)" != "$(sed '$d'
> > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > ]; then echo "error: include/linux/atomic/atomic-instrume
> > nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > ::p' include/linux/atomic/
> > atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
> > sha1sum | sed 's/ .*//')" ]; then echo "error:
> > include/linux/atomic/atomic-long.h has been modified
> > ." >&2; exit 1; fi; touch .checked-atomic-long.h
> >
> > NOTE: I did a `make distclean` before I started my build.
> >
> > Can you please comment on this?
>
>
>
>
> Please clarify your problem.
>
> My best guess is, you just added V=1 option to
> print the full log, didn't you?
>
>
>
> I can see the same build log by running the following command.
>

Hi Masahiro,

you had a chance to look into this?

Thanks.

Regards,
-Sedat-

>
> $ make V=1 mrproper defconfig  prepare | grep sha1sum
> + [ clean = clean ]
> + cleanup
> + rm -f .btf.*
> + rm -f System.map
> + rm -f vmlinux
> + rm -f vmlinux.map
> + exit 0
>   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d'
> include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> .*//')" ]; then echo "error:
> include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
> exit 1; fi; touch .checked-atomic-arch-fallback.h
>   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d'
> include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> ]; then echo "error: include/linux/atomic/atomic-instrumented.h has
> been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
>   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
> include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
> echo "error: include/linux/atomic/atomic-long.h has been modified."
> >&2; exit 1; fi; touch .checked-atomic-long.h
>
>
>
>
>
>
> >
> > Thanks.
> >
> > Best regards,
> > -Sedat-
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
