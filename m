Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21CF671CBF
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jan 2023 13:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjARM4D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Jan 2023 07:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbjARMzL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Jan 2023 07:55:11 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0A94E51A
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 04:17:42 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id l139so37768648ybl.12
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 04:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NF2wpNypgTHRH1cTG8cota7Gf8/ngVli+VCLSp8vIkU=;
        b=eHa4h8fyZvOBUhepd5bv5kq+4lEaQ9YUIEtof23WaqCfdV368EA2sVBt9IcJInYEv7
         ms4ujahJleKQDklEPAaiTfmpu8ocQCrYNYTriyQJW+IyUTKb2BAJApgt5Aln2DGj6dge
         d/mFiFUXat/b307w6QZ1E/XO0qca79BGPyWVn1ppR20Ph1KXbFBt3cdfQCbS3/Zcqj6B
         cpGHONUO1TXRBhVzaCq5Im+SZ5HKGBU4Oa0kpgUMagz+OEghGO5+o5InB6drsWnetiY8
         Tkb4/nRidyy+E3y/vLKm5rKvUz6nmXL+9eQ3CbhfJLieaOchJlfRhOV/INUOk90SJjQs
         nuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF2wpNypgTHRH1cTG8cota7Gf8/ngVli+VCLSp8vIkU=;
        b=1wqUnpL7MBg6LXj9yS8QeieVsnEbj+luDH/hajxMmnfjzzNLB9c26HsSEtbPV4UX4c
         RadiJEQsn73urVRhcBJvxB780Zv52Sq8Hc5NMbY4xEZvoIf/2xeM2TxELUW33ig5Jhmu
         m83fuUK9SCHW2cz4RoyZPPm2BHdVbxEaShb44Olil6mtcDB1ehThZMCCpKrFcE6KzRxY
         cY7dN2VSZpsFYgtJp2gmWXZh1AWPcOdKIjKO6beLRXvy3cqdLVae6muW7PDewtN3d6c2
         Nd+bRbNQOy5jnYbq1kCpmuzzmPrRVmSwgGQSMw4AptmbU34LvsQGFONgXEHRHKVOvvmi
         SYfw==
X-Gm-Message-State: AFqh2kq0Md3Gl+6STsVE0ZcJnFKptN3vnNMqvOEkJEpXcYOQhRQLrVNM
        LDIzpOIXkjNqJC0cAecA4onwvG/ZkG6lufG1B80=
X-Google-Smtp-Source: AMrXdXvNZU8KrK93+ug7DPM7IeV0RtvQmQuQVM7PwqQV0fLbvAV8xguIaEcgAWe8Z82Y+HVit6dZyFwhy38pOnn59yQ=
X-Received: by 2002:a25:cf87:0:b0:7cb:dfbe:3996 with SMTP id
 f129-20020a25cf87000000b007cbdfbe3996mr891691ybg.489.1674044261197; Wed, 18
 Jan 2023 04:17:41 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
 <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com>
 <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com> <CA+icZUVpDwrB2VbcyZmxE6asfPVh4ANYCvEsTd+rhVtZCHitLA@mail.gmail.com>
In-Reply-To: <CA+icZUVpDwrB2VbcyZmxE6asfPVh4ANYCvEsTd+rhVtZCHitLA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 18 Jan 2023 13:17:30 +0100
Message-ID: <CANiq72=X3y91u+b_dAWoQ2yXp5QNgPGAtxp+DNFT3e=T4bpwzw@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     sedat.dilek@gmail.com
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
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

On Wed, Jan 18, 2023 at 11:12 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> No, I disagree.

I agree with Masahiro -- either this is `V=1` output (and you
confirmed you used `V=1`) or your report is unclear about what you are
actually seeing.

Did you see the actual warnings in your output?

> You demonstrated by:
>
> $ make V=1 mrproper defconfig  prepare | grep sha1sum
>
> That you see these warnings, too.

There are no warnings in his output. They are `echo` parameters.

Cheers,
Miguel
