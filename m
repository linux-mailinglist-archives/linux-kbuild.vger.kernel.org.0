Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD17A7B4321
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Sep 2023 20:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjI3SyF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Sep 2023 14:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbjI3SyF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2023 14:54:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C9CC4
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 11:54:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD13C433CB
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696100041;
        bh=31LcEEpwE3rDkMPwBfcNGNCszhEr+OdofdTb+GCBUHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KdW2b/exfJNw2+bePwn7Rgfazhcb/oiTiq75o0PdITbd241tJssqarpSk3MdybKDQ
         2buQU2Gcviay/JkFDpq38zb4c8rIJ0UtXn4LCbhd4Hy7Rlx/LGkR3Eh09f/PHop1gL
         9x/9otuQ3+VsOxSLKdjZDteZg2OdZ/IzrLUdCLt5uLVRbR3ph9GLl3CHS42R7+yECy
         SXw6h+DWaibMy7A96tMUPP5bdvpDJOoJnIrhqF/KUkLnttfaRzTI4QuVthMGRlt7tb
         o1xzIftU+LLjE462aNfnu940yVQL8+rwmCHcryptUpJP0eeLCEe/qFipPOVFH5NdOF
         h0tHg2HRycH/w==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1dd830ed844so3497688fac.2
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 11:54:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YyQha8EAqswx6R9mtkaImZ2vNTWYY0JfTVMmKYR/MKQvZsx04bn
        ZRbCoXakW8lQiwltzeSqKd5hVzGoKIRsxalH72E=
X-Google-Smtp-Source: AGHT+IFsQ7f9notd4NyWZ4DNR8CreL7RXuPJfDPBJnCNsuY+ySjjRq4q/FaWmA799u/IYPxZOy4LXHx2kJPkMwU/vOU=
X-Received: by 2002:a05:6870:6489:b0:1c8:bf19:e1df with SMTP id
 cz9-20020a056870648900b001c8bf19e1dfmr9339820oab.13.1696100041052; Sat, 30
 Sep 2023 11:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230928202807.1765918-1-mfo@canonical.com>
In-Reply-To: <20230928202807.1765918-1-mfo@canonical.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 1 Oct 2023 03:53:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATS+Xg-BF6LaUs8TsC1CKvMO1n0h6T962uB_uaaM6q1fA@mail.gmail.com>
Message-ID: <CAK7LNATS+Xg-BF6LaUs8TsC1CKvMO1n0h6T962uB_uaaM6q1fA@mail.gmail.com>
Subject: Re: [PATCH] modpost: add missing else to the "of" check
To:     Mauricio Faria de Oliveira <mfo@canonical.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 29, 2023 at 5:29=E2=80=AFAM Mauricio Faria de Oliveira
<mfo@canonical.com> wrote:
>
> Without this 'else' statement, an "usb" name goes into two handlers:
> the first/previous 'if' statement _AND_ the for-loop over 'devtable',
> but the latter is useless as it has no 'usb' device_id entry anyway.
>
> Tested with allmodconfig before/after patch; no changes to *.mod.c:
>
>     git checkout v6.6-rc3
>     make -j$(nproc) allmodconfig
>     make -j$(nproc) olddefconfig
>
>     make -j$(nproc)
>     find . -name '*.mod.c' | cpio -pd /tmp/before
>
>     # apply patch
>
>     make -j$(nproc)
>     find . -name '*.mod.c' | cpio -pd /tmp/after
>
>     diff -r /tmp/before/ /tmp/after/
>     # no difference
>
> Fixes: acbef7b76629 ("modpost: fix module autoloading for OF devices with=
 generic compatible property")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
> ---


Applied to linux-kbuild/fixes.
Thanks.



--
Best Regards
Masahiro Yamada
