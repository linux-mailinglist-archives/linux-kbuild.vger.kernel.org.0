Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A39E66BD29
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jan 2023 12:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjAPLse (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Jan 2023 06:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjAPLsd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Jan 2023 06:48:33 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469D81713
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jan 2023 03:48:32 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bp15so42329707lfb.13
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jan 2023 03:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=edYKKinYDd9a27A0dR+tQTHP9hHpbweV8uDU6tD4Zlo=;
        b=EFLYwodPfuwRH7mcN6fCPLgJrfRZIDR6V89pho9oGt/2/9PHgfaX1qf8UI5sei8WRT
         ytiiideb33jFCOkXo993T2tc2TBZPTHi4PG3+rVjHLNolhOnCfmvEr8bHPvflj87lJLz
         54jiPH6bbjpQ/bRsBa6uGxnS6X9J1GBEr4QBHWfVQxwrsJ5rT8RZG8bftFE62lZyGhhw
         be71KIbgrnq2egVAWt0QYLpbWO6ct9DRMPhP0WPi7eASNjF6+rImjLf8Q1cVRJ5wUpl3
         eemorb4A7PD/2BTKiBHcYVikhRvInyYscMxbXxSdeORBZY8aOPj0AMlaIhCSHH5rV2K7
         fC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edYKKinYDd9a27A0dR+tQTHP9hHpbweV8uDU6tD4Zlo=;
        b=G5R0r+0e42DylPxgixUVLrqzlkMZLqs1J8b2yWi4Zgoo8rxSZtk32cz2HFwO2k8xB0
         mUfhCrUTQGFTFaNXEvS+mcBpEslhts5HWbhPaEyZnlgBZwso8o7ZH/lBRc6oTGc7aP+W
         TavK4fhqxaKdil0vGqYSJa/VfhfhQiFwy6kXlm31ZvOtvM0x5mcm92apm3d90RbmQlGu
         octXxqiSyYLcusaFGNAPD6SWVMxFibOLVJWcXPg/5EcW3ntU2M/gR031Noy11bXdDTGe
         4Zl4sChok4R267e2TmS6Mvf/4UGIre0wtIdRO6Sf7jm+UcHoMVWw1O562UlImRLmGxAq
         N1Ug==
X-Gm-Message-State: AFqh2kqI/mTkpmWZaTJt4vP2EofowmeDV08yosx5ZHT5LwQBkyFgSXQR
        9aj2OUiEW3SksL/GAm07DihlUfUqGhaBQLIVB2ihl9e3pgzhpw==
X-Google-Smtp-Source: AMrXdXsa/L3ozYmzpjEFbdIBje1ET4qLmUvvcOQz7pNSHWUmfM6Um7+VGSBEv9jPRRQq/BvolnQpSnLwCQWhEVbQuXo=
X-Received: by 2002:a05:6512:11f1:b0:4b5:2958:bd06 with SMTP id
 p17-20020a05651211f100b004b52958bd06mr4587728lfs.26.1673869710380; Mon, 16
 Jan 2023 03:48:30 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
In-Reply-To: <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 16 Jan 2023 12:47:53 +0100
Message-ID: <CA+icZUXHBkp+6P01jZm1BEA2u_=uJHJBAVyOYX4k2gEBMv3yGg@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 16, 2023 at 4:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:

[ ... ]

> Please clarify your problem.
>
> My best guess is, you just added V=1 option to
> print the full log, didn't you?
>

Sorry, forgot the make-line (this morning posted from my smartphone):

$ /usr/bin/perf stat make V=1 -j4 LLVM=1 LLVM_IAS=1
PAHOLE=/opt/pahole/bin/pahole LOCALVERSION=-1-amd64-clang15-kcfi
KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
KBUILD_BUILD_TIMESTAMP=2023-01-15 bindeb-pkg
KDEB_PKGVERSION=6.2.0~rc4-1~unstable+dileks1

>
> I can see the same build log by running the following command.
>
>
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
